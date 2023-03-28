import 'bootstrap/dist/css/bootstrap.css';
import './Dasboard.css';
import ApiService from './Components/ApiService.js';
import React, {Component} from 'react';
import { Link } from "react-router-dom";
import SalesChart from './Components/SalesChart';
import ExportExcel from './Components/Export';

export default class Dashboard extends Component {
  _isLoading = true;

  data = {};

  constructor(props) {
    super(props)
    this.state = {
      selectedSales: 1,
      selectedMonth: 1
    }
  }

  //function which is called the first time the component loads
  async componentDidMount() {
    this._isLoading = true;
    await ApiService.getSalesData(this.state.selectedSales).then((data) => {
      this.setState({salesInfo: data});
    });
    await ApiService.getPenjualanDataByMonth(this.state.selectedSales,this.state.selectedMonth).then((data) => {
      this.setState({penjualanList: data["Penjualan"]});
      if(data["Penjualan"] != null) {
        var labels = Array.from(data["Penjualan"].map(data => data.CreatedAt));
        this.data = {
          labels:labels,
          datasets: [
            {
              data: data["Penjualan"].map(data => data.Penjualan),
            },
          ],
        };
      }
    });
    this._isLoading = false;
  }

  selectMonth = async event => {
    this._isLoading = true;
    this.setState({selectedMonth: event.target.value});
    await ApiService.getPenjualanDataByMonth(this.state.selectedSales,event.target.value).then((data) => {
      this.setState({penjualanList: data["Penjualan"]});

      if(data["Penjualan"] != null) {
        var labels = Array.from(data["Penjualan"].map(data => data.CreatedAt));
        this.data = {
          labels:labels,
          datasets: [
            {
              data: data["Penjualan"].map(data => data.Penjualan),
            },
          ],
        };
      }
    });
    this._isLoading = false;
  }
  
  Table = () => {if(this.state.penjualanList == null) {
    return (
      <div className="py-5 text-center">
        <h5>No Data Found</h5>
      </div>
    );
  }
  return (<SalesChart chartData={this.data} />)};
  // return (<p>OI</p>)};

  render() {
    if (this._isLoading)
      return (
        <div className="App-header">
          <div className="container d-flex justify-content-center align-items-center">
            <p>Loading data</p>
          </div>
        </div>
    )
    return (
      <div className="container pt-2">
        <h1 className="text-center">
          Dashboard Sales
        </h1>
        <div className="d-flex justify-content-between py-3 px-5">
          <div className="d-flex align-items-center">
            <img className="border rounded-circle img-fluid" alt="Profile" width="64px" src={ApiService.apiUrl+this.state.salesInfo.ProfileImage}></img>
            <label className="px-3">{this.state.salesInfo.Name}</label>
          </div>
          <div>
            <label>Filter By:</label>
            <select id="month-filter" className="form-select" onChange={this.selectMonth} value={this.state.selectedMonth}>
              <option value="1">Januari</option>
              <option value="2">Februari</option>
              <option value="3">Maret</option>
              <option value="4">April</option>
              <option value="5">Mei</option>
              <option value="6">Juni</option>
              <option value="7">Juli</option>
              <option value="8">Agustus</option>
              <option value="9">September</option>
              <option value="10">Oktober</option>
              <option value="11">November</option>
              <option value="12">Desember</option>
            </select>
          </div>
        </div>
        <div className="d-flex align-items-center justify-content-center">
          <this.Table />
        </div>
        <div className="d-flex align-items-center justify-content-center pt-5">
          <Link to={{
            pathname: "/Details",
            search:"?id="+this.state.salesInfo.Id
          }}><button className="btn btn-outline-primary mx-3">Lihat List Penjualan</button></Link>
          <ExportExcel dataset={this.state.salesInfo.Penjualan} />
        </div>
      </div>
    )
  }

}