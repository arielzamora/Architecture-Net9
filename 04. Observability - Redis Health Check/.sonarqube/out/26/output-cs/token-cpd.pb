ç2
SD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Domain.Core\CustomersDomain.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Domain $
.$ %
Core% )
{		 
public

 

class

 
CustomersDomain

  
:

! "
ICustomersDomain

# 3
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
CustomersDomain 
( 
IUnitOfWork *

unitOfWork+ 5
)5 6
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
public 
bool 
Insert 
( 
	Customers $
	customers% .
). /
{ 	
return 
_unitOfWork 
. 
	Customers (
.( )
Insert) /
(/ 0
	customers0 9
)9 :
;: ;
} 	
public 
bool 
Update 
( 
	Customers $
	customers% .
). /
{ 	
return 
_unitOfWork 
. 
	Customers (
.( )
Update) /
(/ 0
	customers0 9
)9 :
;: ;
} 	
public 
bool 
Delete 
( 
string !

customerId" ,
), -
{ 	
return   
_unitOfWork   
.   
	Customers   (
.  ( )
Delete  ) /
(  / 0

customerId  0 :
)  : ;
;  ; <
}!! 	
public## 
	Customers## 
Get## 
(## 
string## #

customerId##$ .
)##. /
{$$ 	
return%% 
_unitOfWork%% 
.%% 
	Customers%% (
.%%( )
Get%%) ,
(%%, -

customerId%%- 7
)%%7 8
;%%8 9
}&& 	
public(( 
IEnumerable(( 
<(( 
	Customers(( $
>(($ %
GetAll((& ,
(((, -
)((- .
{)) 	
return** 
_unitOfWork** 
.** 
	Customers** (
.**( )
GetAll**) /
(**/ 0
)**0 1
;**1 2
}++ 	
public-- 
IEnumerable-- 
<-- 
	Customers-- $
>--$ % 
GetAllWithPagination--& :
(--: ;
int--; >

pageNumber--? I
,--I J
int--K N
pageSize--O W
)--W X
{.. 	
return// 
_unitOfWork// 
.// 
	Customers// (
.//( ) 
GetAllWithPagination//) =
(//= >

pageNumber//> H
,//H I
pageSize//J R
)//R S
;//S T
}00 	
public22 
int22 
Count22 
(22 
)22 
{33 	
return44 
_unitOfWork44 
.44 
	Customers44 (
.44( )
Count44) .
(44. /
)44/ 0
;440 1
}55 	
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; 
InsertAsync;;  +
(;;+ ,
	Customers;;, 5
	customers;;6 ?
);;? @
{<< 	
return== 
await== 
_unitOfWork== $
.==$ %
	Customers==% .
.==. /
InsertAsync==/ :
(==: ;
	customers==; D
)==D E
;==E F
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
bool@@ 
>@@ 
UpdateAsync@@  +
(@@+ ,
	Customers@@, 5
	customers@@6 ?
)@@? @
{AA 	
returnBB 
awaitBB 
_unitOfWorkBB $
.BB$ %
	CustomersBB% .
.BB. /
UpdateAsyncBB/ :
(BB: ;
	customersBB; D
)BBD E
;BBE F
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
boolEE 
>EE 
DeleteAsyncEE  +
(EE+ ,
stringEE, 2

customerIdEE3 =
)EE= >
{FF 	
returnGG 
awaitGG 
_unitOfWorkGG $
.GG$ %
	CustomersGG% .
.GG. /
DeleteAsyncGG/ :
(GG: ;

customerIdGG; E
)GGE F
;GGF G
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
	CustomersJJ #
>JJ# $
GetAsyncJJ% -
(JJ- .
stringJJ. 4

customerIdJJ5 ?
)JJ? @
{KK 	
returnLL 
awaitLL 
_unitOfWorkLL $
.LL$ %
	CustomersLL% .
.LL. /
GetAsyncLL/ 7
(LL7 8

customerIdLL8 B
)LLB C
;LLC D
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
IEnumerableOO %
<OO% &
	CustomersOO& /
>OO/ 0
>OO0 1
GetAllAsyncOO2 =
(OO= >
)OO> ?
{PP 	
returnQQ 
awaitQQ 
_unitOfWorkQQ $
.QQ$ %
	CustomersQQ% .
.QQ. /
GetAllAsyncQQ/ :
(QQ: ;
)QQ; <
;QQ< =
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
IEnumerableTT %
<TT% &
	CustomersTT& /
>TT/ 0
>TT0 1%
GetAllWithPaginationAsyncTT2 K
(TTK L
intTTL O

pageNumberTTP Z
,TTZ [
intTT\ _
pageSizeTT` h
)TTh i
{UU 	
returnVV 
awaitVV 
_unitOfWorkVV $
.VV$ %
	CustomersVV% .
.VV. /%
GetAllWithPaginationAsyncVV/ H
(VVH I

pageNumberVVI S
,VVS T
pageSizeVVU ]
)VV] ^
;VV^ _
}WW 	
publicYY 
asyncYY 
TaskYY 
<YY 
intYY 
>YY 

CountAsyncYY )
(YY) *
)YY* +
{ZZ 	
return[[ 
await[[ 
_unitOfWork[[ $
.[[$ %
	Customers[[% .
.[[. /

CountAsync[[/ 9
([[9 :
)[[: ;
;[[; <
}\\ 	
}__ 
}`` 	
OD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Domain.Core\UsersDomain.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Domain $
.$ %
Core% )
{ 
public 

class 
UsersDomain 
: 
IUsersDomain +
{ 
private		 
readonly		 
IUnitOfWork		 $
_unitOfWork		% 0
;		0 1
public

 
UsersDomain

 
(

 
IUnitOfWork

 &

unitOfWork

' 1
)

1 2
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
public 
Users 
Authenticate !
(! "
string" (
userName) 1
,1 2
string3 9
password: B
)B C
{ 	
return 
_unitOfWork 
. 
Users $
.$ %
Authenticate% 1
(1 2
userName2 :
,: ;
password< D
)D E
;E F
} 	
} 
} 