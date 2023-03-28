CREATE TABLE sales_app.penjualan(  
  IdPenjualan INT NOT NULL AUTO_INCREMENT,
  IdSales INT NOT NULL,
  Penjualan INT NOT NULL DEFAULT 0,
  CreatedAt date NOT NULL,
  PRIMARY KEY (IdPenjualan),
  FOREIGN KEY (IdSales) REFERENCES sales_app.sales(Id)
) ENGINE=INNODB CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,10000,'2023-01-01');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,20000,'2023-01-01');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,30000,'2023-01-02');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,15000,'2023-01-02');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,22000,'2023-01-05');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,36000,'2023-01-05');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,12000,'2023-01-07');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,12000,'2023-01-08');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,34000,'2023-01-10');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,14000,'2023-01-12');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,34000,'2023-01-12');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,25000,'2023-01-15');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-01-15');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-01-17');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,15000,'2023-01-19');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,16000,'2023-01-21');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,35000,'2023-01-23');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,45000,'2023-01-23');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-01-25');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-01-25');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-01-28');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,35000,'2023-01-31');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,45000,'2023-01-31');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-02-02');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-02-03');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-02-03');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-02-05');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-02-05');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-02-06');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-02-08');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-02-08');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-02-10');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-02-12');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-02-15');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-02-17');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-02-19');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-02-22');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-02-25');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-02-27');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-02-27');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-03-02');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-03-05');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-03-07');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-03-07');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-03-09');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-03-09');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-03-12');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-03-12');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-03-15');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,24000,'2023-03-15');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,26000,'2023-03-18');
INSERT INTO sales_app.penjualan (IdSales,Penjualan,CreatedAt) VALUES (1,56000,'2023-03-18');