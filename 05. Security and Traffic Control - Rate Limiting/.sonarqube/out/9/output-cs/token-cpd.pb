‘
cD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Application.Interface\ICustomersApplication.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Application )
.) *
	Interface* 3
{		 
public

 

	interface

 !
ICustomersApplication

 *
{ 
Response 
< 
bool 
> 
Insert 
( 
CustomersDto *
customersDto+ 7
)7 8
;8 9
Response 
< 
bool 
> 
Update 
( 
CustomersDto *
customersDto+ 7
)7 8
;8 9
Response 
< 
bool 
> 
Delete 
( 
string $

customerId% /
)/ 0
;0 1
Response 
< 
CustomersDto 
> 
Get "
(" #
string# )

customerId* 4
)4 5
;5 6
Response 
< 
IEnumerable 
< 
CustomersDto )
>) *
>* +
GetAll, 2
(2 3
)3 4
;4 5
ResponsePagination 
< 
IEnumerable &
<& '
CustomersDto' 3
>3 4
>4 5 
GetAllWithPagination6 J
(J K
intK N

pageNumberO Y
,Y Z
int[ ^
pageSize_ g
)g h
;h i
Task 
< 
Response 
< 
bool 
> 
> 
InsertAsync (
(( )
CustomersDto) 5
customersDto6 B
)B C
;C D
Task 
< 
Response 
< 
bool 
> 
> 
UpdateAsync (
(( )
CustomersDto) 5
customersDto6 B
)B C
;C D
Task 
< 
Response 
< 
bool 
> 
> 
DeleteAsync (
(( )
string) /

customerId0 :
): ;
;; <
Task 
< 
Response 
< 
CustomersDto "
>" #
># $
GetAsync% -
(- .
string. 4

customerId5 ?
)? @
;@ A
Task 
< 
Response 
< 
IEnumerable !
<! "
CustomersDto" .
>. /
>/ 0
>0 1
GetAllAsync2 =
(= >
)> ?
;? @
Task 
< 
ResponsePagination 
<  
IEnumerable  +
<+ ,
CustomersDto, 8
>8 9
>9 :
>: ;%
GetAllWithPaginationAsync< U
(U V
intV Y

pageNumberZ d
,d e
intf i
pageSizej r
)r s
;s t
}   
}!! ÷
_D:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Application.Interface\IUsersApplication.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Application )
.) *
	Interface* 3
{ 
public 

	interface 
IUsersApplication &
{ 
Response 
< 
UsersDto 
> 
Authenticate '
(' (
string( .
username/ 7
,7 8
string9 ?
password@ H
)H I
;I J
}		 
}

 