import 'bootstrap/dist/css/bootstrap.css';
import './Dasboard.css';
import ApiService from './Components/ApiService.js';
import React, {Component} from 'react';

export default class Details extends Component {
  constructor(props) {
    const params = new URLSearchParams(window.location.search);
    super(props)
    this.state = {
      selectedSales: params.get("id")
    }
  }

  //function which is called the first time the component loads
  async componentDidMount() {
    var json = await ApiService.getPenjualanList(this.state.selectedSales);
    console.log(json)
    this.setState({penjualanList: json['Penjualan']});
  }

  render() {
    if (!this.state.penjualanList)
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
          List Penjualan
        </h1>
        <div className="d-flex align-items-center justify-content-center">
          <table className="table table-striped table-hover table-bordered my-3">
            <thead>
              <tr>
                <th className="text-center border px-4 py-2">No.</th>
                <th className="text-center border px-4 py-2">Total Penjualan</th>
                <th className="text-center border px-4 py-2">Tanggal Penjualan</th>
              </tr>
            </thead>
            <tbody>
            {
                this.state.penjualanList.map((data,index) => <tr key={data.IdPenjualan}>
                  <td className="text-center border px-4 py-2">{index+1}</td>
                  <td className="text-center border px-4 py-2">Rp{data.Penjualan}</td>
                  <td className="text-center border px-4 py-2">{data.CreatedAt}</td>
                </tr>)
            }
            </tbody>
          </table>
        </div>
      </div>
    )
  }
}