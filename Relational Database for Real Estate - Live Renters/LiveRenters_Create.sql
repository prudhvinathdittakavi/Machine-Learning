/* Live Renters Database V1 */

USE master
go

use LiveRenters
go

create table AptInfo ( 
AptNo varchar(5) NOT NULL,
Area integer NOT NULL,
MinPricePerMonth decimal(10,2) NOT NULL,
Bedrooms integer NOT NULL,
Bathrooms integer NOT NULL,
LeaseID integer,
Wardrobes integer NOT NULL,
WasherDryer bit NOT NULL,
constraint PKAptNo Primary Key (AptNo)
)
go

create table LeaseInfo
(
LeaseID integer not null identity(1000,1),
AptNo varchar(5) not null,
LeasePeriod integer not null,
LeaseStartDate date not null,
LeaseEndDate date not null,
LeaseActive bit not null,
PremCarParking bit not null,
Pets bit not null,
ElectricityProvider varchar(25) not null,
ElectricityProviderNumber integer not null,
InsuranceProvider varchar(25) not null,
InsuranceProviderNumber integer not null,
EnquiryType varchar(25) not null,
Deposit decimal(10,2) not null,
PetDeposit decimal(10,2) not null,
constraint PKLeaseID Primary Key (LeaseID),
constraint FKAptNoLease Foreign Key (AptNo) references AptInfo on update cascade,
constraint CheckEnquiryType check (EnquiryType in ('Front Desk','Online','Referral','Renewal'))
)
go

alter table AptInfo
add constraint FKLeaseIDAptInfo Foreign Key (LeaseID) references LeaseInfo
go

create table Resident (
ResidentID integer NOT NULL identity(5000,1), 
ResFirstName varchar(50) NOT NULL,
ResLastName varchar(50) NOT NULL,
LeaseID integer NOT NULL,
ResSSN varchar(9) NOT NULL,
ResEmailID varchar(50) NOT NULL,
ResPhone integer NOT NULL,
ActiveResident bit NOT NULL,
constraint PKResidentID Primary Key (ResidentID),
constraint FKLeaseIDResident Foreign Key (LeaseID) references LeaseInfo on update cascade
)
go

create table Promotion
(
PromoID integer not null identity(100000,1),
LeaseID integer not null,
PromoAmount decimal(9,2) not null,
PromoRemarks varchar(100) not null,
PromoDate datetime default getdate(),
constraint PKPromoID Primary Key (PromoID),
constraint FKLeaseIDPromotion FOreign Key (LeaseID) references LeaseInfo on update cascade)
go

create table ReferralPromo
(
RefPromoID integer not null identity(100000,1), 
LeaseID integer not null,
RefAmount decimal(9,2) not null,
Remarks varchar(100) not null,
RefPromoDate datetime default getdate(),
constraint PKRefPromoID Primary Key (RefPromoID),
constraint FKLeaseIDReferralPromo Foreign Key (LeaseID) references LeaseInfo on update cascade)
go

create table Refund
(
RefundID integer not null identity(100000,1),
LeaseID integer not null,
RefundAmount decimal(9,2) not null,
RefundRemarks varchar(100) not null,
RefundDate datetime default getdate(),
constraint PKRefundID Primary Key (RefundID),
constraint FKRefundIDRefund FOreign Key (LeaseID) references LeaseInfo on update cascade)
go

create table PaymentMatrix
(
LeaseID integer not null,
RentAmt decimal(9,2) not null,
AmtPaid decimal(9,2) not null,
WasherDryerRental decimal(9,2) not null,
RepairCharges decimal(9,2) not null,
TrashCollectionCharges decimal(9,2) not null,
PremCarParkingFees decimal(9,2) not null,
PetFees decimal(9,2) not null,
RefundAmount decimal(9,2) not null,
PromoOffers decimal(9,2) not null,
ReferralReward decimal(9,2) not null,
LateFees decimal(9,2) not null,
WaterCharges decimal(9,2) not null,
GasCharges decimal(9,2) not null,
SewerCharges decimal(9,2) not null,
PaymentDue as RentAmt - AmtPaid + WasherDryerRental + RepairCharges + TrashCollectionCharges + PremCarParkingFees + PetFees - PromoOffers - ReferralReward + LateFees + WaterCharges + SewerCharges + GasCharges,
constraint PKLeaseIDPaymentMatrix primary key (LeaseID),
constraint FKLeaseIDPaymentMatrix foreign key (LeaseID) references LeaseInfo on update cascade
)
go

create table RentLeaseMatrix
(
LeasePeriod tinyint not null,
Multiplier decimal(9,2) not null,
constraint PKLeasePeriod Primary Key (LeasePeriod)
)
go

create table Payment
(
PaymentID int not null identity(100000,1),
LeaseID int not null,
AmtPaid decimal(9,2) not null,
PaymentMethod varchar(25) not null,
ResidentID int not null,
PaymentDate datetime default getdate(),
constraint PKPaymentID Primary Key (PaymentID),
constraint FKLeaseIDPayment Foreign Key (LeaseID) references LeaseInfo on update cascade,
constraint FKResidentID Foreign Key (ResidentID) references Resident
)
go

create table CommonCharge (
MonthYear date default getDate(),
GasCharges decimal(10,2) not null,
WaterCharges decimal(10,2) not null,
SewerCharges decimal(10,2) not null,
TrashCollectionCharges decimal(10,2) not null
)
go

create trigger TrigLeaseForInsertInApt
on LeaseInfo
for insert
as
begin
declare @ID int
declare @Apt varchar(5)
select @ID = LeaseID from inserted
select @Apt = AptNo from inserted
update AptInfo
set LeaseID = @ID
where AptNo = @Apt
end
go

create trigger TrigLeaseWhenNewLeaseEntered
on LeaseInfo for insert
as begin
declare @ID1 int
declare @Apt1 varchar(5)
declare @LP int
select @ID1 = LeaseID from inserted
select @Apt1 = AptNo from inserted
select @LP = LeasePeriod from inserted
insert into PaymentMatrix values(@ID1,round((select MinPricePerMonth from AptInfo where AptNo = @Apt1)*(select Multiplier from RentLeaseMatrix where LeasePeriod = @LP),0),0,(select WasherDryer from AptInfo where AptNo = @Apt1)*30,0,0,(select PremCarParking from LeaseInfo where LeaseID = @ID1)*30,(select Pets from LeaseInfo where LeaseID = @ID1)*40,0,0,0,0,0,0,0)
end
go

create trigger TrigLeaseWhenPaymentDone
on Payment for insert
as begin
declare @LeaseInfo as int, @AmtPaid as decimal(9,2)
select @LeaseInfo = LeaseID from inserted
select @AmtPaid = AmtPaid from inserted
update PaymentMatrix 
set AmtPaid = AmtPaid + @AmtPaid
where LeaseID = @LeaseInfo
end
go

create trigger TriggerRefund
on Refund for insert
as begin
declare @ID int, @RefAmt decimal(9,2)
select @ID = LeaseID from inserted
select @RefAmt = RefundAmount from inserted
update PaymentMatrix
set RefundAmount = RefundAmount + @RefAmt
where LeaseID = @ID
end
go

create trigger TriggerPromotion
on Promotion for insert
as begin
declare @ID int, @RefAmt decimal(9,2)
select @ID = LeaseID from inserted
select @RefAmt = PromoAmount from inserted
update PaymentMatrix
set PromoOffers = PromoOffers + @RefAmt
where LeaseID = @ID
end
go

create trigger TriggerReferral
on ReferralPromo for insert
as begin
declare @ID int, @RefAmt decimal(9,2)
select @ID = LeaseID from inserted
select @RefAmt = RefAmount from inserted
update PaymentMatrix
set ReferralReward = ReferralReward + @RefAmt
where LeaseID = @ID
end
go

create Trigger trigCommonCharge
on CommonCharge for insert
as begin
declare @Water decimal(9,2)
declare @Gas decimal(9,2)
declare @Sewer decimal(9,2)
declare @Trash decimal(9,2)
select @Water = WaterCharges from inserted
select @Gas = GasCharges from inserted
select @Sewer = SewerCharges from inserted
select @Trash = TrashCollectionCharges from inserted
update PaymentMatrix
set TrashCollectionCharges = @Trash / (select count(*) from AptInfo where LeaseID is not null)
update PaymentMatrix
set WaterCharges = @Water / (select count(*) from AptInfo where LeaseID is not null)
update PaymentMatrix
set GasCharges = @Gas / (select count(*) from AptInfo where LeaseID is not null)
update PaymentMatrix
set SewerCharges = @Sewer / (select count(*) from AptInfo where LeaseID is not null)
end
go

create trigger trigLeaseOnDeactivation
on LeaseInfo 
after update
as begin
declare @Flag bit
declare @ID int
declare @Apt varchar(5)
select @Flag = LeaseActive from inserted
select @ID = LeaseID from inserted
select @Apt = AptNo from inserted
if update(LeaseActive)
begin
if @Flag <> 1
begin
update AptInfo
set LeaseID = NULL
where AptNo = @Apt and LeaseID = @ID
delete PaymentMatrix
where LeaseID = @ID
update LeaseInfo
set LeaseEndDate = getdate()
where LeaseID = @ID
update Resident
set ActiveResident = 0
where LeaseID = @ID
end
end
end
go

create trigger trigAptNoWasherDryerUpdation
on AptInfo 
after update
as begin
declare @WD bit
declare @ID int
declare @Apt varchar(5)
select @WD = WasherDryer from inserted
select @ID = LeaseID from inserted
select @Apt = AptNo from inserted
if update(WasherDryer)
begin
if @ID is not NULL
begin
if @WD = 1
begin
update PaymentMatrix
set WasherDryerRental = 30
where LeaseID = @ID
end
if @WD = 0
begin
update PaymentMatrix
set WasherDryerRental = 0
where LeaseID = @ID
end
end
end
end
go

CREATE TABLE Employee (
EmpID  integer      not null identity(100,1),
EmpFirstName  char(20)   NOT NULL,
EmpLastName  char(20)   NOT NULL,
Hiredt   DATE  NOT NULL,
CONSTRAINT  PKEmployee PRIMARY KEY (EmpID)
)
go

CREATE TABLE ServiceRequestList (
ServiceRequestID   integer   not null identity(10,1),
SRDesc  VARCHAR(50)   not NULL,
SRRate   DECIMAL(10,2)   NOT NULL,
CONSTRAINT  PKSRList PRIMARY KEY (ServiceRequestID)
)
go

CREATE TABLE ServiceRequest (
RequestID      integer      not null identity(100000,1),
AptNo  VARCHAR(5)   NOT NULL,
ServiceRequestID  integer   NOT NULL,
LeaseID     integer,
RequestDate     DATE       not null default getdate(),
SRState    VARCHAR(20)       NULL,
SRLastModified       DATE      NULL,
EmpID  integer NULL,
Rate DECIMAL(10,2)     NULL,
SRRemarks varchar(50) null,
CONSTRAINT CHK_SRState CHECK (SRState IN ('New','In Progress','Closed')),
CONSTRAINT PKServiceReq PRIMARY KEY (RequestID), 
CONSTRAINT FKAptnum1 FOREIGN KEY (AptNo) REFERENCES AptInfo,
CONSTRAINT FKLeaseID1 FOREIGN KEY (LeaseID) REFERENCES LeaseInfo,
constraint FKSRnumServiceRequest FOREIGN KEY (ServiceRequestID) references ServiceRequestList,
constraint FKEmpIDServiceRequest FOREIGN KEY (EmpID) references Employee
)
go

CREATE TABLE Enquiry (
EnquiryID integer      not null identity(100000,1),
EnquiryDate datetime not null default getdate(),
EnquiryType VARCHAR(20) NOT NULL,
EnqFirstName VARCHAR(25) NOT NULL,
EnqLastName VARCHAR(25) NOT NULL,
EnqEmailID VARCHAR(25) not NULL,
EnqPhoneNumber integer NULL,
AptNo varchar(5) null,
LeasePeriod INT NULL,
Converted bit not NULL,
LeaseID integer NULL,
CONSTRAINT EnquiryPK PRIMARY KEY (EnquiryID),
CONSTRAINT EnquiryFK FOREIGN KEY (LeaseID) REFERENCES LeaseInfo,
constraint FKAptNoEnquiry foreign key (AptNo) references AptInfo,
constraint CheckEnquiryTypeEnquiry check (EnquiryType in ('Front Desk','Online','Referral'))
)
go

create trigger trigWhenRepairChargesToBeCharged
on ServiceRequest
after update
as begin
declare @ID int
declare @RID int
declare @Rate decimal(10,2)
declare @SRState varchar(25)
select @ID = LeaseID from inserted
select @RID = RequestID from inserted
select @Rate = Rate from inserted
select @SRState = SRState from inserted
if update(SRState)
begin
update ServiceRequest
set SRLastModified = getdate()
where RequestID = @RID
if (@Rate > 0 and @SRState = 'Closed')
begin
update PaymentMatrix
set RepairCharges = RepairCharges + @Rate
where LeaseID = @ID
end
end
end
go

create trigger trigWhenPreCarParkingFlagisUpdated
on LeaseInfo
after update
as begin
declare @ID int
declare @Flag bit
declare @Flag1 bit
select @ID = LeaseID from inserted
select @Flag = PremCarParking from inserted
select @Flag1 = Pets from inserted
if update(PremCarParking)
begin
if @Flag = 1
begin
update PaymentMatrix
set PremCarParkingFees = 30
where LeaseID = @ID
end
if @Flag = 0
begin
update PaymentMatrix
set PremCarParkingFees = 0
where LeaseID = @ID
end
end
if update(Pets)
begin
if @Flag1 = 1
begin
update PaymentMatrix
set PetFees = 40
where LeaseID = @ID
end
if @Flag1 = 0
begin
update PaymentMatrix
set PetFees = 0
where LeaseID = @ID
end
end
end
go




