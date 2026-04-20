ô	
YD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Infrastructure.Data\DapperContext.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Infrastructure ,
., -
Data- 1
{		 
public

 

class

 
DapperContext

 
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
string 
_connectionString  1
;1 2
public 
DapperContext 
( 
IConfiguration +
configuration, 9
)9 :
{ 	
_configuration 
= 
configuration *
;* +
_connectionString 
= 
configuration  -
.- .
GetConnectionString. A
(A B
$strB W
)W X
;X Y
} 	
public 
IDbConnection 
CreateConnection -
(- .
). /
=>0 2
new3 6
SqlConnection7 D
(D E
_connectionStringE V
)V W
;W X
} 
} 