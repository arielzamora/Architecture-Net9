Ó
UD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Transversal.Common\IAppLogger.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Transversal )
.) *
Common* 0
{ 
public 

	interface 

IAppLogger 
<  
T  !
>! "
{ 
void 
LogInformation 
( 
string "
message# *
,* +
params, 2
object3 9
[9 :
]: ;
args< @
)@ A
;A B
void 

LogWarning 
( 
string 
message &
,& '
params( .
object/ 5
[5 6
]6 7
args8 <
)< =
;= >
void		 
LogError		 
(		 
string		 
message		 $
,		$ %
params		& ,
object		- 3
[		3 4
]		4 5
args		6 :
)		: ;
;		; <
}

 
} í
SD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Transversal.Common\Response.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Transversal )
.) *
Common* 0
{ 
public 

class 
Response 
< 
T 
> 
: 
ResponseGeneric .
<. /
T/ 0
>0 1
{ 
} 
} Ç
ZD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Transversal.Common\ResponseGeneric.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Transversal )
.) *
Common* 0
{ 
public 

class 
ResponseGeneric  
<  !
T! "
>" #
{		 
public

 
T

 
Data

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
bool 
	IsSuccess 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
IEnumerable 
< 
ValidationFailure ,
>, -
Errors. 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
} 
} Š

]D:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Transversal.Common\ResponsePagination.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Transversal )
.) *
Common* 0
{ 
public 

class 
ResponsePagination #
<# $
T$ %
>% &
:' (
ResponseGeneric) 8
<8 9
T9 :
>: ;
{ 
public 
int 

PageNumber 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 

TotalPages 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 

TotalCount 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
bool		 
HasPreviousPage		 #
=>		$ &

PageNumber		' 1
>		2 3
$num		4 5
;		5 6
public

 
bool

 
HasNextPage

 
=>

  "

PageNumber

# -
<

. /

TotalPages

0 :
;

: ;
} 
} 