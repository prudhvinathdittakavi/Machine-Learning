use LiveRenters
go

insert into RentLeaseMatrix values(1,1.4)
go
insert into RentLeaseMatrix values(2,1.35)
go
insert into RentLeaseMatrix values(3,1.3)
go
insert into RentLeaseMatrix values(4,1.25)
go
insert into RentLeaseMatrix values(5,1.2)
go
insert into RentLeaseMatrix values(6,1.15)
go
insert into RentLeaseMatrix values(7,1.1)
go
insert into RentLeaseMatrix values(8,1.05)
go
insert into RentLeaseMatrix values(9,1.05)
go
insert into RentLeaseMatrix values(10,1.05)
go
insert into RentLeaseMatrix values(11,1.05)
go
insert into RentLeaseMatrix values(12,1)
go
insert into RentLeaseMatrix values(13,1)
go
insert into RentLeaseMatrix values(14,1)
go
insert into RentLeaseMatrix values(15,1)
go
insert into RentLeaseMatrix values(16,1)
go
insert into RentLeaseMatrix values(17,1)
go
insert into RentLeaseMatrix values(18,0.95)
go
insert into RentLeaseMatrix values(19,0.95)
go
insert into RentLeaseMatrix values(20,0.95)
go
insert into RentLeaseMatrix values(21,0.95)
go
insert into RentLeaseMatrix values(22,0.95)
go
insert into RentLeaseMatrix values(23,0.95)
go
insert into RentLeaseMatrix values(24,0.9)
go
insert into RentLeaseMatrix values(25,0.9)
go
insert into RentLeaseMatrix values(26,0.9)
go
insert into RentLeaseMatrix values(27,0.9)
go
insert into RentLeaseMatrix values(28,0.9)
go
insert into RentLeaseMatrix values(29,0.9)
go
insert into RentLeaseMatrix values(30,0.9)
go
insert into RentLeaseMatrix values(31,0.9)
go
insert into RentLeaseMatrix values(32,0.9)
go
insert into RentLeaseMatrix values(33,0.9)
go
insert into RentLeaseMatrix values(34,0.9)
go
insert into RentLeaseMatrix values(35,0.9)
go
insert into RentLeaseMatrix values(36,0.85)
go
insert into RentLeaseMatrix values(37,0.85)
go
insert into RentLeaseMatrix values(38,0.85)
go
insert into RentLeaseMatrix values(39,0.85)
go
insert into RentLeaseMatrix values(40,0.85)
go
insert into RentLeaseMatrix values(41,0.85)
go
insert into RentLeaseMatrix values(42,0.85)
go
insert into RentLeaseMatrix values(43,0.85)
go
insert into RentLeaseMatrix values(44,0.85)
go
insert into RentLeaseMatrix values(45,0.85)
go
insert into RentLeaseMatrix values(46,0.85)
go
insert into RentLeaseMatrix values(47,0.85)
go
insert into RentLeaseMatrix values(48,0.8)
go
insert into RentLeaseMatrix values(49,0.8)
go
insert into RentLeaseMatrix values(50,0.8)
go
insert into RentLeaseMatrix values(51,0.8)
go
insert into RentLeaseMatrix values(52,0.8)
go
insert into RentLeaseMatrix values(53,0.8)
go
insert into RentLeaseMatrix values(54,0.8)
go
insert into RentLeaseMatrix values(55,0.8)
go
insert into RentLeaseMatrix values(56,0.8)
go
insert into RentLeaseMatrix values(57,0.8)
go
insert into RentLeaseMatrix values(58,0.8)
go
insert into RentLeaseMatrix values(59,0.8)
go
insert into RentLeaseMatrix values(60,0.8)
go

insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('201G',560,695,1,1,NULL,1,0)
go
insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('202G',780,795,2,2,NULL,1,1)
go
insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('203G',560,700,2,1,NULL,2,0)
go
insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('204G',800,900,2,2,NULL,2,1)
go
insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('205G',795,900,2,2,NULL,2,1)
go
insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('206G',560,695,1,1,NULL,1,0)
go
insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('207G',780,795,2,2,NULL,1,1)
go
insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('208G',560,700,2,1,NULL,2,0)
go
insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('209G',800,900,2,2,NULL,2,1)
go
insert into AptInfo (AptNo,Area,MinPricePerMonth,Bedrooms,Bathrooms,LeaseID,Wardrobes,WasherDryer) values ('210G',795,900,2,2,NULL,2,1)
go

insert into LeaseInfo (LeasePeriod,LeaseStartDate,LeaseEndDate,AptNo,PremCarParking,Pets,LeaseActive,ElectricityProvider,ElectricityProviderNumber,InsuranceProvider,InsuranceProviderNumber,EnquiryType,Deposit,PetDeposit) values (6,'7/27/2017','1/26/2018','201G',1,1,1,'Infinity Energy','53467840','StateFarm', '768976','Online', 200,150 )
go
insert into LeaseInfo (LeasePeriod,LeaseStartDate,LeaseEndDate,AptNo,PremCarParking,Pets,LeaseActive,ElectricityProvider,ElectricityProviderNumber,InsuranceProvider,InsuranceProviderNumber,EnquiryType,Deposit,PetDeposit) values (2,'7/27/2017','6/26/2017','202G',0,0,1,'Infinity Energy','53445690','StateFarm','968766','Online',200,0)
go
insert into LeaseInfo (LeasePeriod,LeaseStartDate,LeaseEndDate,AptNo,PremCarParking,Pets,LeaseActive,ElectricityProvider,ElectricityProviderNumber,InsuranceProvider,InsuranceProviderNumber,EnquiryType,Deposit,PetDeposit) values (12,'7/27/2017','7/26/2018','203G',1,0,1,'Infinity Energy','53488800','StateFarm','567839','Referral',200,0)
go
insert into LeaseInfo (LeasePeriod,LeaseStartDate,LeaseEndDate,AptNo,PremCarParking,Pets,LeaseActive,ElectricityProvider,ElectricityProviderNumber,InsuranceProvider,InsuranceProviderNumber,EnquiryType,Deposit,PetDeposit) values (12,'11/16/2017','11/15/2018','204G',0,1,1,'Amber','238907569','StateFarm','0987432','Front Desk', 200,150)
go

insert into Resident (ResFirstName, ResLastName, LeaseID,ResSSN,ResEmailID,ResPhone,ActiveResident) values ('Mark','Smith',1000,123456789,'MarkSmith@email.com',1234123412,1)
go
insert into Resident (ResFirstName, ResLastName, LeaseID,ResSSN,ResEmailID,ResPhone,ActiveResident) values ('James','Blunt',1001,123456900,'JamesBlunt@email.com',1231231234,1)
go
insert into Resident (ResFirstName, ResLastName, LeaseID,ResSSN,ResEmailID,ResPhone,ActiveResident) values ('John','Philips',1002,987654432,'JohnPhilips@email.com',1228339056,1)
go
insert into Resident (ResFirstName, ResLastName, LeaseID,ResSSN,ResEmailID,ResPhone,ActiveResident) values ('Jonson','Philips',1002,127520350,'JonsonPhilips@email.com',1225446878,1)
go
insert into Resident (ResFirstName, ResLastName, LeaseID,ResSSN,ResEmailID,ResPhone,ActiveResident) values ('Victoria','Gloria',1003,170781172,'VictoriaGloria@email.com',1222554700,1)
go

insert into Payment (LeaseID,AmtPaid,PaymentMethod,ResidentID) values(1000,500,'Wire Transfer',5000)
go
insert into Payment (LeaseID,AmtPaid,PaymentMethod,ResidentID) values(1001,100,'Credit Card',5001)
go
insert into Payment (LeaseID,AmtPaid,PaymentMethod,ResidentID) values(1001,200,'Wire Transfer',5001)
go
insert into Payment (LeaseID,AmtPaid,PaymentMethod,ResidentID) values(1002,500,'Moneygram',5002)
go
insert into Refund (LeaseID,RefundAmount,RefundRemarks) values (1001,30,'Charged twice for Prem. Car Parking')
go
insert into Promotion (LeaseID,PromoAmount,PromoRemarks) values (1001,40,'LeaseInfo Extension Offer')
go
insert into ReferralPromo (LeaseID,RefAmount,Remarks) values (1000,50,'Referred Victoria LeaseID 1003')
go

insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Air Conditioner',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Fireplace',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Heater',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Thermostat',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Vents',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Bathroom Hardware',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Plumbing',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Tub',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Mirror',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Ceiling Fan',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Electrical Outlet',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Mail box',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Problem with Exterior Door',0.00)
go
insert into ServiceRequestList (SRDesc,SRRate) values ('Inspection and Make Ready',100.00)
go

insert into Employee (EmpFirstName, EmpLastName, HireDt) values ('Harry','Bennet','2016/11/11')
go
insert into Employee (EmpFirstName, EmpLastName, HireDt) values ('Gloria','Gomez','2016/12/12')
go
insert into Employee (EmpFirstName, EmpLastName, HireDt) values ('Chirstopher','John','2017/1/5')
go

insert into ServiceRequest (AptNo, ServiceRequestID, LeaseID, RequestDate, SRState, SRLastModified, EmpID, Rate, SRRemarks) 
values ('201G',23,NULL,'7/25/2017','Closed','7/26/2017',101,NULL,'Apartment inspected and ready')
go
insert into ServiceRequest (AptNo, ServiceRequestID, LeaseID, RequestDate, SRState, SRLastModified, EmpID, Rate, SRRemarks) 
values ('202G',14,1001,'11/11/2017','Closed',NULL,101,50,'Broken item replaced')
go
insert into ServiceRequest (AptNo, ServiceRequestID, LeaseID, RequestDate, SRState, SRLastModified, EmpID, Rate) 
values ('202G',18,1001,'11/15/2017','New',NULL,101,NULL)
go

insert into Enquiry (EnquiryDate, EnquiryType, EnqFirstName, EnqLastName, EnqEmailID, EnqPhoneNumber, AptNo, LeasePeriod, Converted, LeaseID) values ('7/23/2017','Online','Mark','Smith','MarkSmith@email.com','1234123412','201G',6,1,1000)
go
insert into Enquiry (EnquiryDate, EnquiryType, EnqFirstName, EnqLastName, EnqEmailID, EnqPhoneNumber, AptNo, LeasePeriod, Converted, LeaseID) values ('7/24/2017','Online','James','Blunt','JamesBlunt@email.com','123456900','202G',2,1,1001)
go
insert into Enquiry (EnquiryDate, EnquiryType, EnqFirstName, EnqLastName, EnqEmailID, EnqPhoneNumber, AptNo, LeasePeriod, Converted, LeaseID) values ('7/25/2017','Online','Laura','Smith','LauraSmith@email.com','123998880','202G',12,0,NULL)
go
insert into Enquiry (EnquiryDate, EnquiryType, EnqFirstName, EnqLastName, EnqEmailID, EnqPhoneNumber, AptNo, LeasePeriod, Converted, LeaseID) values ('7/26/2017','Front Desk','John','Philips','JohnPhilips@email.com','987654432','203G',12,1,1002)
go
insert into Enquiry (EnquiryDate, EnquiryType, EnqFirstName, EnqLastName, EnqEmailID, EnqPhoneNumber, AptNo, LeasePeriod, Converted, LeaseID) values ('11/23/2017','Referral','Victoria','Gomez','VictoriaGomez@email.com',NULL,NULL,12,1,1003)
go
