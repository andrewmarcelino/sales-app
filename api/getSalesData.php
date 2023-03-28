<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: *");
    include_once("dbconn.php");
    if(isset($_GET['IdSales'])) {
        $id = anti_injection_login($_GET['IdSales']);

        //Get sales info
        $sql = "SELECT * FROM sales WHERE Id=".$id.";";
        $result = mysqli_query($conn,$sql);
        if($result &&  mysqli_num_rows($result)>0){
            $data = mysqli_fetch_assoc($result);
            if($data['ProfileImage'] != "") {
                //Append folder directory to string
                $data["ProfileImage"] = '/images/'.$data['ProfileImage'];
            }
            $data['error']=-1;

            //Get Data Penjualan
            $penjualan_sql = "SELECT MONTH(CreatedAt) AS MonthCount,MONTHNAME(CreatedAt) AS BulanPenjualan, SUM(Penjualan) AS TotalPenjualan FROM penjualan WHERE IdSales = ".$id." GROUP BY YEAR(CreatedAt), MONTH(CreatedAt);";
            $penjualan_result = mysqli_query($conn,$penjualan_sql);
            if($penjualan_result &&  mysqli_num_rows($penjualan_result)>0){
                $penjualan = cast_query_results($penjualan_result);
                for($i=0;$i<count($penjualan);$i++) {
                    $penjualan[$i]['Komisi'] = $penjualan[$i]['TotalPenjualan'] * (int)$data['CommisionPerMonth']/100;
                }
                $data['Penjualan'] = $penjualan;
            }
        } else {
            $data['error']=1;
        }
    } else {
        $data['error']=0;
    }
    
	if (basename(__FILE__) == basename($_SERVER["SCRIPT_FILENAME"])) {
        echo json_encode($data);
        mysqli_close($conn);
    }

    /*
    Error Lists:
    -1 : Done
    0: ID not set
    1: ID not found
    */
?>