<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: *");
    include_once("dbconn.php");
    if(isset($_GET['IdSales'])) {
        $id = anti_injection_login($_GET['IdSales']);

        //Get sales info
        $sql = "SELECT Penjualan, IdPenjualan, CreatedAt FROM penjualan WHERE IdSales=".$id." ORDER BY CreatedAt ASC;";
        $result = mysqli_query($conn,$sql);
        if($result &&  mysqli_num_rows($result)>0){
            $data['Penjualan'] = cast_query_results($result);
            $data['error']=-1;
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