export default class ApiService {
    static apiUrl = "http://localhost/sales-app/api/";

    static async getSalesData(id) {
      try {
        const response = await fetch(this.apiUrl+"getSalesData.php?IdSales="+id)
        if (!response.ok) {
          throw Error(response.statusText)
        }
        const json = await response.json()
        return json;
      } catch (error) {
        console.error(error.message)
      }
    };

    static async getPenjualanList(id) {
      try {
        const response = await fetch(this.apiUrl+"getPenjualanList.php?IdSales="+id)
        if (!response.ok) {
          throw Error(response.statusText)
        }
        const json = await response.json()
        return json;
      } catch (error) {
        console.error(error.message)
      }
    };

    static async getPenjualanDataByMonth(id,month) {
      try {
        const response = await fetch(this.apiUrl+"getPenjualanDataByMonth.php?IdSales="+id+"&Month="+month)
        if (!response.ok) {
          throw Error(response.statusText)
        }
        const json = await response.json()
        return json;
      } catch (error) {
        console.error(error.message)
      }
    };
}