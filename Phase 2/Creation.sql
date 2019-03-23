CREATE TABLE COMPANY(
    CName varchar(50),
	CId int,
	Location varchar(50),
	UNIQUE(CName),
	PRIMARY KEY(CId)
	);

CREATE TABLE SUPERSTOCKIST(
    StockName varchar(50),
	StockId int,
	StockState varchar(50),
	StockCity varchar(50),
	UNIQUE (StockName),
	PRIMARY KEY(StockId)
	);
	
CREATE TABLE DISTRIBUTOR(
    DName varchar(50),
	DId int,
	DState varchar(50),
	DCity varchar(50),
	UNIQUE(DName),
	PRIMARY KEY(DId)
	);
	
CREATE TABLE SALESMAN(
    SName varchar(50),
	SId int,
	SState varchar(50),
	SCity varchar(50), 
	StockId int,
	DId int,
	UNIQUE(SName),
	PRIMARY KEY(SId),
	FOREIGN KEY(StockId) REFERENCES SUPERSTOCKIST(StockId) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(DId)REFERENCES DISTRIBUTOR(DId) ON DELETE SET NULL ON UPDATE CASCADE
	);
	
CREATE TABLE RETAILER(
    RetName varchar(50),
	RetId int,
	Rstate varchar(50),
	City varchar(50),
	SId int,
	UNIQUE(RetName),
	PRIMARY KEY(RetId),
	FOREIGN KEY(SId) REFERENCES SALESMAN(SId) ON DELETE SET NULL ON UPDATE CASCADE
	);
	
CREATE TABLE CONSUMER(
    Consname varchar(50),
	Age int,
	Gender varchar(50),
	Income int,
	UNIQUE(Consname)
	);
	
CREATE TABLE PRODUCT(
    Pname varchar(50),
	PId int,
	Price int,
	CId int,
	Category varchar(50),
	no_of_pcs_per_case int,
	pgroup varchar(50),
	UNIQUE(Pname),
	PRIMARY KEY(PId),
	FOREIGN KEY(CId) REFERENCES COMPANY(CId) ON DELETE SET NULL ON UPDATE CASCADE
    );
	
CREATE TABLE STOCKTRADE(
    StockQuantity int,
	StockDate Date,
	StockValue int,
	StockId int,
	PId int,
	CId int,
	FOREIGN KEY(StockId)REFERENCES SUPERSTOCKIST(StockId) ON DELETE SET NULL ON UPDATE CASCADE, 
	FOREIGN KEY(PId) REFERENCES PRODUCT (PId) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(CId) REFERENCES COMPANY(CId) ON DELETE SET NULL ON UPDATE CASCADE
	);
	
CREATE TABLE DistTRADE(
   DQuantity int,
   DDate date,
   DValue int,
   DId int,
   PId int,
   StockId int,
   FOREIGN KEY(DId) REFERENCES DISTRIBUTOR(DId) ON DELETE SET NULL ON UPDATE CASCADE,
   FOREIGN KEY(PId) REFERENCES PRODUCT(PId) ON DELETE SET NULL ON UPDATE CASCADE,
   FOREIGN KEY(StockId)REFERENCES SUPERSTOCKIST(StockId) ON DELETE SET NULL ON UPDATE CASCADE
   );
   
CREATE TABLE RetTRADE(
   RetQuantity int,
   RetValue int,
   RetDate date,
   RetId int,
   PId int,
   DId int,
   FOREIGN KEY(RetId) REFERENCES RETAILER(RetId) ON DELETE SET NULL ON UPDATE CASCADE,
   FOREIGN KEY(PId) REFERENCES PRODUCT(PId) ON DELETE SET NULL ON UPDATE CASCADE,
   FOREIGN KEY(DId) REFERENCES DISTRIBUTOR(DId) ON DELETE SET NULL ON UPDATE CASCADE
   );
   
CREATE TABLE CONSTRADE(
   ConsQuantity int,
   ConsValue int,
   ConsDate date,
   Consname varchar(50),
   PId int,
   RetId int,
   FOREIGN KEY(Consname) REFERENCES CONSUMER(consname) ON DELETE SET NULL ON UPDATE CASCADE,
   FOREIGN KEY(PId) REFERENCES PRODUCT(PId) ON DELETE SET NULL ON UPDATE CASCADE,
   FOREIGN KEY(RetId) REFERENCES RETAILER(RetId) ON DELETE SET NULL ON UPDATE CASCADE
   );
   
 CREATE TABLE SalesTRADE(
   SalesQuantity int,
   SalesValue int,
   SalesDate date,
   SId int,
   PId int,
   FOREIGN KEY(PId) REFERENCES PRODUCT(PId) ON DELETE SET NULL ON UPDATE CASCADE,
   FOREIGN KEY(SId) REFERENCES SALESMAN(SId) ON DELETE SET NULL ON UPDATE CASCADE
   );
   