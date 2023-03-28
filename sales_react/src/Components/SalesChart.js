// src/components/PieChart.js
import React from "react";
import {
  Chart,
  CategoryScale,
  LinearScale,
  PointElement,
  BarElement,
  Title,
  Tooltip,
  Legend
  
} from 'chart.js';
import { Bar } from "react-chartjs-2";

Chart.register(
    CategoryScale,
    LinearScale,
    PointElement,
    BarElement,
    Title,
    Tooltip,
    Legend
);

function SalesChart({ chartData }) {
  return (
      <Bar
        data={chartData}
        options={{
          responsive: true,
          plugins: {
            legend: {
                display: false,
                position: "top"
            },
            title: {
              display: true,
              text: "Chart Penjualan (Bulanan)",
              fullSize: true,
            },
          },
        }}
      />
  );
}
export default SalesChart;