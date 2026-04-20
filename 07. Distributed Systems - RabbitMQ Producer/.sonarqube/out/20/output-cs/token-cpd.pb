¢
YD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Domain.Interface\ICustomersDomain.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Domain $
.$ %
	Interface% .
{ 
public		 

	interface		 
ICustomersDomain		 %
{

 
bool 
Insert 
( 
	Customers 
customer &
)& '
;' (
bool 
Update 
( 
	Customers 
customer &
)& '
;' (
bool 
Delete 
( 
string 

customerId %
)% &
;& '
	Customers 
Get 
( 
string 

customerId '
)' (
;( )
IEnumerable 
< 
	Customers 
> 
GetAll %
(% &
)& '
;' (
IEnumerable 
< 
	Customers 
>  
GetAllWithPagination 3
(3 4
int4 7

pageNumber8 B
,B C
intD G
pageSizeH P
)P Q
;Q R
int 
Count 
( 
) 
; 
Task 
< 
bool 
> 
InsertAsync 
( 
	Customers (
customer) 1
)1 2
;2 3
Task 
< 
bool 
> 
UpdateAsync 
( 
	Customers (
customer) 1
)1 2
;2 3
Task 
< 
bool 
> 
DeleteAsync 
( 
string %

customerId& 0
)0 1
;1 2
Task 
< 
	Customers 
> 
GetAsync  
(  !
string! '

customerId( 2
)2 3
;3 4
Task 
< 
IEnumerable 
< 
	Customers "
>" #
># $
GetAllAsync% 0
(0 1
)1 2
;2 3
Task 
< 
IEnumerable 
< 
	Customers "
>" #
># $%
GetAllWithPaginationAsync% >
(> ?
int? B

pageNumberC M
,M N
intO R
pageSizeS [
)[ \
;\ ]
Task   
<   
int   
>   

CountAsync   
(   
)   
;   
}"" 
}## ¬
UD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Domain.Interface\IUsersDomain.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Domain $
.$ %
	Interface% .
{ 
public 

	interface 
IUsersDomain !
{ 
Users 
Authenticate 
( 
string !
username" *
,* +
string, 2
password3 ;
); <
;< =
} 
}		 