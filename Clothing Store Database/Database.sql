drop database clothingstore;
create database clothingstore;




create table customer(

CMobile_no       int  not null,
Customer_Address  varchar(20) not null,
Fname        varchar(20) not null,
Minit        varchar(20) not null,
Lname        varchar(20) not null,
Customer_id2    int  not null,
gender         char not null,

constraint customer_pk 
primary key (Customer_id2),
);



create table Branch(

Branch_id   int,     
Branch_Name  varchar(20),
Branch_Location  varchar(20),

constraint Branch_pk
primary key (Branch_id),
);


CREATE TABLE orderr
(
orderdate        varchar(10),
ordernumber      int,
ordertime        varchar(10),
numberofproducts int,
paymentstatus    varchar(10)    NOT NULL,
CONSTRAINT orderid_pk
PRIMARY KEY (ordernumber),
);

ALTER TABLE orderr
ADD place_of_delivery_of_the_order CHAR;

create table productt
(
statu        varchar(19),
material      varchar(18),
productid     int,
typeofcloth   varchar(15), 
productcategory    varchar(14),
color              varchar(16),
size              int,
Warehouse_ID      int,
Customer_id2      int,
CONSTRAINT product
PRIMARY KEY (productid),
);

CREATE TABLE Has_a
(
ordernumber          int,
productid           int,
amount               int,
CONSTRAINT Has_a_pk
PRIMARY KEY (ordernumber, productid),
CONSTRAINT p
FOREIGN KEY (productid) REFERENCES productt(productid),
CONSTRAINT orderr_has_a_fk
FOREIGN KEY (ordernumber) REFERENCES orderr (ordernumber)
);



create table Employee(

Fname                VARCHAR(16)   NOT NULL,

Minit                CHAR,

Lname         VARCHAR(16)   NOT NULL,

Ssn                  INT     NOT NULL,

Emp_Address          VARCHAR(45),

Sex               CHAR,

Salary             INT       NOT NULL,

Super_ssn          INT,

branchID INT ,

constraint Emp_pk
primary key (Ssn),

CONSTRAINT emp_supvisor_fk
FOREIGN KEY(super_ssn) REFERENCES Employee (Ssn),

CONSTRAINT Emp_Branch
Foreign key (branchId) References Branch (Branch_id)
);

create table security(
s_shift      int,
ssn     int,
s_salary  int,
s_name    varchar(19)
constraint security_pk primary key (ssn),
constraint j
foreign key (ssn) references  employee(ssn),
);



create table selesperson(
 target              varchar(20),
 Ssn       int ,
 constraint salesperson_pk
 primary key (Ssn),
 foreign key (Ssn) REFERENCES Employee (Ssn)
 );



 Create TABLE cashier (
Ssn INT NOT NULL,
 cash_drawer INT,
 constraint cashir_pk
 Primary key (Ssn),
 FOREIGN KEY (Ssn) REFERENCES Employee (Ssn));

CREATE TABLE Warehouse(

Warehouse_ID         INT         NOT NULL,
Location            VARCHAR(50)  NOT NULL,
Stock               VARCHAR(30)  NOT NULL,
Staff_No             INT         NOT NULL,
Capacity             INT         NOT NULL,
Delivery_cars        INT,  

CONSTRAINT Warehouse_pk
PRIMARY KEY (Warehouse_ID),
);



CREATE TABLE Supplier(

Ssn                   INT        NOT NULL,
Supplier_ID           INT        NOT NULL,
Sname               VARCHAR(30)  NOT NULL,
email               VARCHAR(30)  NOT NULL,
mobile_phone          INT        NOT NULL,
Product_type        VARCHAR(30)  NOT NULL,
Product_quantity      INT        NOT NULL,
returned_items        INT        NOT NULL,

CONSTRAINT Supplier_pk
PRIMARY KEY (Ssn),
);



create table Buysfrom(
Cid int,
  
  Bid int,

 Hrs  int,
 CONSTRAINT buys_pk
 primary key (Cid,Bid),

 Constraint customer_Buys_pk
 foreign key (Cid) references customer(Customer_id2),
 constraint Branch_Buys_fk
 foreign key (Bid)references Branch(Branch_id),
);





CREATE TABLE Bill(

Bill_ID INT NOT NULL,


Bill_date INT NOT NULL,

Payment_Method varchar (30),

orderno  INT,

CONSTRAINT Bill_pk
PRIMARY KEY (Bill_ID),

CONSTRAINT bill_order
Foreign key (orderno) REFERENCES orderr (ordernumber));

create table Inventory_Representative
(
Ssn                  INT       NOT NULL,
rep_name          VARCHAR(30)  NOT NULL,
inv_location      VARCHAR(30)  NOT NULL,
terminator        VARCHAR(30)  NOT NULL,
rep_shift            INT       NOT NULL,

primary key (Ssn),
 foreign key (Ssn) REFERENCES Employee (Ssn)



);


alter table customer
alter column Fname varchar(30);



INSERT INTO customer
VALUES ('121545','Elsherouk','Ahmed','Mohamed','Aly',569,'M');

INSERT INTO customer
VALUES('5689','NasrCity','Mona','Mohamed','Ahmed',789,'F');

INSERT INTO customer
VALUES('897','zamalek','Farida','Ahmed','kareem',897,'F');

INSERT INTO customer
VALUES ('3456','Madinaty','Aly','Ahmed','Mohamed',8999,'M');

INSERT INTO customer
VALUES ('7852','New Cairo','jasmine','Andrew','Mark',6541,'F');



Insert INTo Branch
Values ('1245','cstore','zamalek');


Insert INTo Branch
Values ('456','cstore','Dokki');

Insert INTo Branch
Values ('897','cstore','New cairo');


Insert INTO Branch
Values ('654','cstore','Nasr City');


Insert INTO Branch
Values ('391','cstore','Elsherouk');


INSERT INTO Employee (Fname,Lname,Minit,Ssn,Emp_Address,Sex,Salary,Super_ssn,branchID)
VALUES ('kareema','sameh','L',3872,'zamalek','F','3800',3872,391);

INSERT INTO Employee

VALUES ('kareem','a','adel',3112,'','M','3800',3872,456);


INSERT INTO Employee
VALUES ('sami','f','gameel',1776,'dokki','M','4000',3872,1245);

INSERT INTO Employee
VALUES ('yehia','o','ossama',9365,'dokki','M','4300',3872,654);

INSERT INTO Employee
VALUES ('jessica','R','ramy',1996,'dokki','F','5000',3872,391);

INSERT INTO Employee
VALUES ('Gamil','A','hesham',2653,'shorouk','M','6000',3872,654);

INSERT INTO Employee
VALUES ('sami','f','kamal',1876,'dokki','M','4000',3872,391);

INSERT INTO Employee
VALUES ('FADI','w','waad',2022,'dokki','M','4000',3872,897);
INSERT INTO Employee
VALUES ('sami','f','sorour',3332,'dokki','M','4000',3872,897);



INSERT INTO Warehouse
VALUES(01,'new cairo','polo tshirts',5,200,3);

INSERT INTO Warehouse
VALUES(02,'new giza','tshirts ',5,250,4);

INSERT INTO Warehouse
VALUES(02,'new giza','shoes ',5,250,4);

INSERT INTO Warehouse
VALUES(03,'nasr city','jackets',8,350,6);

INSERT INTO Warehouse
VALUES(03,'nasr city','tshirts',8,350,6);

INSERT INTO Warehouse
VALUES(03,'nasr city','hoodies',8,350,6);



INSERT INTO Supplier
VALUES(123000,'01','omar','omar@gmail.com',01271085777,'tshirts',200,20);

INSERT INTO Supplier
VALUES(123400,'02','ahmed','ahmed@gmail.com',01171082727,'shoes',100,5);

INSERT INTO Supplier
VALUES(123450,'03','yasser','yasser@gmail.com',01070085343,'pants',300,2);

INSERT INTO Supplier
VALUES(123456,'04','kareem','kareem@gmail.com',01521185373,'jackets',200,5);

INSERT INTO Supplier
VALUES(223400,'05','ali','alii@gmail.com',01001085070,'vests',200,null);

INSERT INTO Supplier
VALUES(223300,'06','youssef','youssef@gmail.com',01201185560,'suits',50,null);

UPDATE Warehouse
SET Staff_No = '7'
WHERE Warehouse_ID= 01;

UPDATE Warehouse
SET Stock = 'shoes'
WHERE Warehouse_ID= 03;

UPDATE Warehouse
SET Capacity = '450'
WHERE Warehouse_ID= 02;


UPDATE Supplier
SET Product_type = 'overall'
WHERE Ssn= 123000;

UPDATE Supplier
SET Product_type = 'blazer'
WHERE Ssn= 123450;

UPDATE Supplier
SET Product_quantity = '160'
WHERE Ssn= 123450;




INSERT INTO cashier (cash_drawer,Ssn)
 VALUES(1,9365);
 
 INSERT INTO cashier (cash_drawer,Ssn)
 VALUES(2,3872);

 INSERT INTO cashier (cash_drawer,Ssn)
 VALUES(3,2022);

 













insert into orderr
values('1/3/2015' , 8 , '12am' , 34 ,'unknown');

insert into orderr
values('1/3/2014' , 4 , '10pm' , 39 ,'known');

insert into orderr
values('5/3/2020' ,  18 , '1am' , 74 ,'unknown');

insert into orderr
values( '1/4/2022' , 5 ,'2am', 90 ,'unknown');

insert into orderr
values( '18/7/2023' , 10 ,'8am', 100 ,'unknown');

insert into productt
values('unknown', 'cotton', 15 ,'shirts','cloes','red', 34, 01, 569);

insert into productt
values('known', 'cotton', 18 ,'jeans','clothe','red', 27, 02, 789);

insert into productt
values('unknown', 'cotton', 60 ,'skirts','clheos','gray', 24, 03, 897);

insert into productt
values('known', 'silk', 7776 ,'shoes','cloth','purple', 30, 03, 8999);

insert into productt
values('known', 'silk', 76 ,'shoes','cloth','purple', 60, 03, 999);

INSERT INTO Has_a
VALUES(8 , 15, 56);

INSERT INTO Has_a
VALUES(4 , 18, 55);

INSERT INTO Has_a
VALUES(18 , 60, 60);

INSERT INTO Has_a
VALUES(5 , 7776, 70);

INSERT INTO Has_a
VALUES(10 , 76, 100)

INSERT INTO Bill(Bill_ID,Bill_date,Payment_Method)
Values(10,2003,'visa');
INSERT INTO Bill
Values (20,2001,'cash',8);
INSERT INTO Bill
Values(15,2001,'visa',4);
INSERT INTO Bill
Values (18,2020,'cash',18);
INSERT INTO Bill
Values (31,2020,'cash',5);



INSERT INTO Inventory_Representative

VALUES (111,'ahmed yasser', 'new Giza', 'none', 9);

INSERT INTO Inventory_Representative

VALUES (222,'ali', 'new cairo', 'two emp', 9);

INSERT INTO Inventory_Representative

VALUES (333,'kareem', 'nasr city', '3 emp', 9);




Insert INTO Buysfrom
Values (569,1245,3);

Insert INTO Buysfrom
Values (789,456,2);


Insert INTO Buysfrom
Values (897,897,1);


Insert INTO Buysfrom
Values (8999,654,4);
 Insert INTO Buysfrom
 Values (6541,391,6);



SELECT CMobile_no, Customer_Address
FROM customer
WHERE CMobile_no=121545 AND Customer_Address='Elsherouk'


SELECT COUNT (*) AS 'Total Number of Branches'
FROM Branch;




SELECT Hrs, Cid
FROM Buysfrom right OUTER JOIN customer
ON Buysfrom.Cid = customer.Customer_id2;



SELECT Cid
from Buysfrom
where Bid in (select Bid
              from Buysfrom
			  where Cid=569
			  And Hrs in(select Hrs 
			             from Buysfrom          
	            where Cid=569));

		
select count(Customer_id2),Branch_Name
from customer JOIN Branch
	ON customer.Customer_id2=Branch.Branch_id
	Group by Branch_Name;


	select Branch_id,Branch_Name,count(Cid)
	from Branch,Buysfrom
	where Branch_id=Bid
	Group by Branch_id,Branch_Name;
	
CREATE or alter VIEW Branch_info (Branch_Name,Branch_id,No_of_customers )
AS 
SELECT Branch_Name,Branch_id, COUNT(*)
FROM Branch 

GROUP BY Branch_Name, Branch_id;


SELECT Customer_id2 , Customer_Address
FROM customer
WHERE Fname='Mona' AND Lname='Ahmed';










SELECT Warehouse_ID, Location, Stock, Staff_No, Capacity, Delivery_cars  as 'Warehouse 1'        
FROM Warehouse
WHERE Warehouse_ID = 01;     

SELECT Warehouse_ID, Location, Stock, Staff_No, Capacity, Delivery_cars  as 'Warehouse 2'        
FROM Warehouse
WHERE Warehouse_ID = 02;     

SELECT Warehouse_ID, Location, Stock, Staff_No, Capacity, Delivery_cars  as 'Warehouse 3'        
FROM Warehouse
WHERE Warehouse_ID = 03;     


SELECT Ssn, Supplier_ID, Sname, email, mobile_phone, Product_type, Product_quantity, returned_items as 'Supplier 1'
FROM  Supplier
WHERE Ssn = 123000;

SELECT Ssn, Supplier_ID, Sname, email, mobile_phone, Product_type, Product_quantity, returned_items as 'Supplier 2'
FROM  Supplier
WHERE Ssn = 123400;

SELECT Ssn, Supplier_ID, Sname, email, mobile_phone, Product_type, Product_quantity, returned_items as 'Supplier 3'
FROM  Supplier
WHERE Ssn = 123450;



 


 
 
 
 
  
 
 
 SELECT Fname,Lname
 FROM Employee join Branch
 ON Employee.branchID=Branch.Branch_id
 where Branch_Location='Dokki'
 And Sex='M';


 SELECT Fname,Lname
 FROM Employee
 Where Salary>ALL(SELECT Salary
                  From Employee
				  Where branchId='456');



CREATE VIEW view_emp AS
SELECT Fname,Salary
FROM Employee ;

SELECT *FROM view_emp;





SELECT count(cash_drawer) ,Ssn
FROM cashier
group by Ssn;


SELECT DISTINCT Branch_id 
FROM Branch
WHERE branch_ID IN (SELECT Branch_id
                  
				  FROM Branch,Employee
				  WHERE Branch.Branch_id=Employee.branchID
				  AND Lname='waad');



	Select count(Bill_ID),orderdate
	FROM Bill join orderr
	ON Bill.orderno=orderr.ordernumber
	Group by Payment_Method,orderdate
	HAVING Payment_Method='cash';


select Bill_ID,orderdate
FROM Bill join orderr
ON Bill.orderno=orderr.ordernumber
GROUP BY orderdate,Bill_ID
HAVING orderdate BETWEEN '1/3/2014' AND '1/4/2022';


	SELECT *
FROM orderr;

SELECT ordernumber , ordertime
FROM orderr
ORDER BY ordertime;

SELECT *
FROM productt
WHERE typeofcloth NOT IN ('jeans', 'jumps');

SELECT DISTINCT material
FROM productt;



SELECT ordertime, numberofproducts, max(orderr.ordernumber) as 'number of  order'
FROM productt, orderr, Has_a
where orderr.ordernumber = Has_a.ordernumber
group by  ordertime, numberofproducts;


SELECT material,color, size, Fname
FROM customer right OUTER JOIN productt
ON productt.Customer_id2 = customer.Customer_id2;

SELECT Fname, Lname,Warehouse_ID, productcategory
FROM productt  JOIN customer
ON  customer.Customer_id2 = productt.Customer_id2;

SELECT e.productcategory, e.color,e.Warehouse_ID
FROM productt e
WHERE e.productid IN (SELECT Has_a. productid
FROM Has_a
where e.material='cotton');


CREATE VIEW view1
AS
SELECT orderdate, ordertime, color, productcategory, numberofproducts
FROM orderr, productt, Has_a
WHERE orderr.ordernumber = Has_a.ordernumber

SELECT *
FROM view1;

