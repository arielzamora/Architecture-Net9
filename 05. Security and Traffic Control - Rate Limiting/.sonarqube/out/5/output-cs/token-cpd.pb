ó
eD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Infrastructure.Interface\ICustomersRepository.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Infrastructure ,
., -
	Interface- 6
{ 
public		 

	interface		  
ICustomersRepository		 )
:		* +
IGenericRepository		, >
<		> ?
	Customers		? H
>		H I
{

 
} 
} ¯
cD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Infrastructure.Interface\IGenericRepository.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Infrastructure ,
., -
	Interface- 6
{ 
public 

	interface 
IGenericRepository '
<' (
T( )
>) *
where+ 0
T1 2
:2 3
class4 9
{ 
bool

 
Insert

 
(

 
T

 
entity

 
)

 
;

 
bool 
Update 
( 
T 
entity 
) 
; 
bool 
Delete 
( 
string 
id 
) 
; 
T 	
Get
 
( 
string 
id 
) 
; 
IEnumerable 
< 
T 
> 
GetAll 
( 
) 
;  
IEnumerable 
< 
T 
>  
GetAllWithPagination +
(+ ,
int, /

pageNumber0 :
,: ;
int< ?
pageSize@ H
)H I
;I J
int 
Count 
( 
) 
; 
Task 
< 
bool 
> 
InsertAsync 
( 
T  
entity! '
)' (
;( )
Task 
< 
bool 
> 
UpdateAsync 
( 
T  
entity! '
)' (
;( )
Task 
< 
bool 
> 
DeleteAsync 
( 
string %
id& (
)( )
;) *
Task 
< 
T 
> 
GetAsync 
( 
string 
id  "
)" #
;# $
Task 
< 
IEnumerable 
< 
T 
> 
> 
GetAllAsync (
(( )
)) *
;* +
Task 
< 
IEnumerable 
< 
T 
> 
> %
GetAllWithPaginationAsync 6
(6 7
int7 :

pageNumber; E
,E F
intG J
pageSizeK S
)S T
;T U
Task 
< 
int 
> 

CountAsync 
( 
) 
; 
} 
}   ‹
\D:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Infrastructure.Interface\IUnitOfWork.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Infrastructure ,
., -
	Interface- 6
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{  
ICustomersRepository 
	Customers &
{' (
get) ,
;, -
}. /
IUsersRepository 
Users 
{  
get! $
;$ %
}& '
}		 
}

 ¤
aD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Infrastructure.Interface\IUsersRepository.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Infrastructure ,
., -
	Interface- 6
{ 
public 

	interface 
IUsersRepository %
:& '
IGenericRepository( :
<: ;
Users; @
>@ A
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
}		 
}

 