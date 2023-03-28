import React from "react";
import ReactHTMLTableToExcel from 'html-to-excel-react';

function ExportExcel({ dataset }) {
        return (
            <div>
                <ReactHTMLTableToExcel
                    id="export-button"
                    className="btn btn-primary mx-3"
                    table="export-table"
                    filename="Data Penjualan"
                    sheet="Data Penjualan"
                    buttonText="Export Data ke Excel"/>
                <table id="export-table" hidden>
                    <tr>
                        <th>Bulan</th>
                        <th>Total</th>
                        <th>Komisi Diterima</th>
                    </tr>
                    {
                        dataset.map((data) => <tr>
                          <td>{data.BulanPenjualan}</td>
                          <td>{data.TotalPenjualan}</td>
                          <td>{data.Komisi}</td>
                        </tr>)
                    }
                </table>

            </div>
        );
}

export default ExportExcel;