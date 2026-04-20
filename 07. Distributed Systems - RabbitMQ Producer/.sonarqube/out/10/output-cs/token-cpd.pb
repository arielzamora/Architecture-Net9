„	
_D:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Application.Validator\UsersDtoValidator.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Application )
.) *
	Validator* 3
{ 
public 

class 
UsersDtoValidator "
:# $
AbstractValidator% 6
<6 7
UsersDto7 ?
>? @
{ 
public		 
UsersDtoValidator		  
(		  !
)		! "
{

 	
RuleFor 
( 
u 
=> 
u 
. 
UserName #
)# $
.$ %
NotNull% ,
(, -
)- .
.. /
NotEmpty/ 7
(7 8
)8 9
;9 :
RuleFor 
( 
u 
=> 
u 
. 
Password #
)# $
.$ %
NotNull% ,
(, -
)- .
.. /
NotEmpty/ 7
(7 8
)8 9
;9 :
} 	
} 
} 