use LiveRenters
go

drop table Refund
go
drop table Promotion
go
drop table ReferralPromo
go
drop table Payment
go
drop table CommonCharge
go
drop table PaymentMatrix
go
drop table Resident
go
drop table RentLeaseMatrix
go
drop table ServiceRequest
go
drop table ServiceRequestList
go
drop table Employee
go
drop table Enquiry
go

alter table AptInfo
drop constraint FKLeaseIDAptInfo
go

alter table LeaseInfo
drop constraint FKAptNoLease
go

delete LeaseInfo
delete AptInfo

drop table AptInfo
go
drop table LeaseInfo
go


--exec sp_fkeys AptInfo
