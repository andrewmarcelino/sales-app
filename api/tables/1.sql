CREATE DATABASE sales_app;

CREATE TABLE sales_app.sales(  
  Id INT NOT NULL AUTO_INCREMENT,
  Email VARCHAR(128),
  Phone VARCHAR(128),
  ProfileImage VARCHAR(256),
  Name VARCHAR(128) NOT NULL,
  CommisionPerMonth DECIMAL NOT NULL,
  CreatedAt DATE NOT NULL,
  UpdatedAt DATE,
  PRIMARY KEY (Id)
) ENGINE=INNODB CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO sales_app.sales (Email,Phone,ProfileImage,NAME,CommisionPerMonth,CreatedAt,UpdatedAt) VALUES ('andrewmarcelino87@gmail.com','+628111502055','profile_1.jpg','Andrew Marcelino',10,CURRENT_TIMESTAMP,NULL);