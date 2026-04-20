¿]
jD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Controllers\v1\CustomersController.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Controllers. 9
.9 :
v1: <
{ 
[		 
	Authorize		 
]		 
[

 
Route

 

(


 
$str

 3
)

3 4
]

4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
, 

Deprecated !
=" #
true$ (
)( )
]) *
public 

class 
CustomersController $
:% &

Controller' 1
{ 
private 
readonly !
ICustomersApplication .!
_customersApplication/ D
;D E
public 
CustomersController "
(" #!
ICustomersApplication# 8 
customersApplication9 M
)M N
{ 	!
_customersApplication !
=" # 
customersApplication$ 8
;8 9
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
IActionResult 
Insert #
(# $
[$ %
FromBody% -
]- .
CustomersDto. :
customersDto; G
)G H
{ 	
if 
( 
customersDto 
== 
null  $
)$ %
return 

BadRequest !
(! "
)" #
;# $
var 
response 
= !
_customersApplication 0
.0 1
Insert1 7
(7 8
customersDto8 D
)D E
;E F
if 
( 
response 
. 
	IsSuccess "
)" #
return 
Ok 
( 
response "
)" #
;# $
return   

BadRequest   
(   
response   &
.  & '
Message  ' .
)  . /
;  / 0
}!! 	
[## 	
HttpPut##	 
(## 
$str## 
)## 
]## 
public$$ 
IActionResult$$ 
Update$$ #
($$# $
[$$$ %
FromBody$$% -
]$$- .
CustomersDto$$. :
customersDto$$; G
)$$G H
{%% 	
if&& 
(&& 
customersDto&& 
==&& 
null&&  $
)&&$ %
return'' 

BadRequest'' !
(''! "
)''" #
;''# $
var(( 
response(( 
=(( !
_customersApplication(( 0
.((0 1
Update((1 7
(((7 8
customersDto((8 D
)((D E
;((E F
if)) 
()) 
response)) 
.)) 
	IsSuccess)) "
)))" #
return** 
Ok** 
(** 
response** "
)**" #
;**# $
return,, 

BadRequest,, 
(,, 
response,, &
.,,& '
Message,,' .
),,. /
;,,/ 0
}-- 	
[// 	

HttpDelete//	 
(// 
$str// )
)//) *
]//* +
public00 
IActionResult00 
Delete00 #
(00# $
string00$ *

customerId00+ 5
)005 6
{11 	
if22 
(22 
string22 
.22 
IsNullOrEmpty22 $
(22$ %

customerId22% /
)22/ 0
)220 1
return33 

BadRequest33 !
(33! "
)33" #
;33# $
var44 
response44 
=44 !
_customersApplication44 0
.440 1
Delete441 7
(447 8

customerId448 B
)44B C
;44C D
if55 
(55 
response55 
.55 
	IsSuccess55 "
)55" #
return66 
Ok66 
(66 
response66 "
)66" #
;66# $
return88 

BadRequest88 
(88 
response88 &
.88& '
Message88' .
)88. /
;88/ 0
}99 	
[;; 	
HttpGet;;	 
(;; 
$str;; #
);;# $
];;$ %
public<< 
IActionResult<< 
Get<<  
(<<  !
string<<! '

customerId<<( 2
)<<2 3
{== 	
if>> 
(>> 
string>> 
.>> 
IsNullOrEmpty>> $
(>>$ %

customerId>>% /
)>>/ 0
)>>0 1
return?? 

BadRequest?? !
(??! "
)??" #
;??# $
var@@ 
response@@ 
=@@ !
_customersApplication@@ 0
.@@0 1
Get@@1 4
(@@4 5

customerId@@5 ?
)@@? @
;@@@ A
ifAA 
(AA 
responseAA 
.AA 
	IsSuccessAA "
)AA" #
returnBB 
OkBB 
(BB 
responseBB "
)BB" #
;BB# $
returnDD 

BadRequestDD 
(DD 
responseDD &
.DD& '
MessageDD' .
)DD. /
;DD/ 0
}EE 	
[GG 	
HttpGetGG	 
(GG 
$strGG 
)GG 
]GG 
publicHH 
IActionResultHH 
GetAllHH #
(HH# $
)HH$ %
{II 	
varJJ 
responseJJ 
=JJ !
_customersApplicationJJ 0
.JJ0 1
GetAllJJ1 7
(JJ7 8
)JJ8 9
;JJ9 :
ifKK 
(KK 
responseKK 
.KK 
	IsSuccessKK "
)KK" #
returnLL 
OkLL 
(LL 
responseLL "
)LL" #
;LL# $
returnNN 

BadRequestNN 
(NN 
responseNN &
.NN& '
MessageNN' .
)NN. /
;NN/ 0
}OO 	
[TT 	
HttpPostTT	 
(TT 
$strTT 
)TT  
]TT  !
publicUU 
asyncUU 
TaskUU 
<UU 
IActionResultUU '
>UU' (
InsertAsyncUU) 4
(UU4 5
[UU5 6
FromBodyUU6 >
]UU> ?
CustomersDtoUU? K
customersDtoUUL X
)UUX Y
{VV 	
ifWW 
(WW 
customersDtoWW 
==WW 
nullWW  $
)WW$ %
returnXX 

BadRequestXX !
(XX! "
)XX" #
;XX# $
varYY 
responseYY 
=YY 
awaitYY  !
_customersApplicationYY! 6
.YY6 7
InsertAsyncYY7 B
(YYB C
customersDtoYYC O
)YYO P
;YYP Q
ifZZ 
(ZZ 
responseZZ 
.ZZ 
	IsSuccessZZ "
)ZZ" #
return[[ 
Ok[[ 
([[ 
response[[ "
)[[" #
;[[# $
return]] 

BadRequest]] 
(]] 
response]] &
.]]& '
Message]]' .
)]]. /
;]]/ 0
}^^ 	
[`` 	
HttpPut``	 
(`` 
$str`` 
)`` 
]``  
publicaa 
asyncaa 
Taskaa 
<aa 
IActionResultaa '
>aa' (
UpdateAsyncaa) 4
(aa4 5
[aa5 6
FromBodyaa6 >
]aa> ?
CustomersDtoaa? K
customersDtoaaL X
)aaX Y
{bb 	
ifcc 
(cc 
customersDtocc 
==cc 
nullcc  $
)cc$ %
returndd 

BadRequestdd !
(dd! "
)dd" #
;dd# $
varee 
responseee 
=ee 
awaitee  !
_customersApplicationee! 6
.ee6 7
UpdateAsyncee7 B
(eeB C
customersDtoeeC O
)eeO P
;eeP Q
ifff 
(ff 
responseff 
.ff 
	IsSuccessff "
)ff" #
returngg 
Okgg 
(gg 
responsegg "
)gg" #
;gg# $
returnii 

BadRequestii 
(ii 
responseii &
.ii& '
Messageii' .
)ii. /
;ii/ 0
}jj 	
[ll 	

HttpDeletell	 
(ll 
$strll .
)ll. /
]ll/ 0
publicmm 
asyncmm 
Taskmm 
<mm 
IActionResultmm '
>mm' (
DeleteAsyncmm) 4
(mm4 5
stringmm5 ;

customerIdmm< F
)mmF G
{nn 	
ifoo 
(oo 
stringoo 
.oo 
IsNullOrEmptyoo $
(oo$ %

customerIdoo% /
)oo/ 0
)oo0 1
returnpp 

BadRequestpp !
(pp! "
)pp" #
;pp# $
varqq 
responseqq 
=qq 
awaitqq  !
_customersApplicationqq! 6
.qq6 7
DeleteAsyncqq7 B
(qqB C

customerIdqqC M
)qqM N
;qqN O
ifrr 
(rr 
responserr 
.rr 
	IsSuccessrr "
)rr" #
returnss 
Okss 
(ss 
responsess "
)ss" #
;ss# $
returnuu 

BadRequestuu 
(uu 
responseuu &
.uu& '
Messageuu' .
)uu. /
;uu/ 0
}vv 	
[xx 	
HttpGetxx	 
(xx 
$strxx (
)xx( )
]xx) *
publicyy 
asyncyy 
Taskyy 
<yy 
IActionResultyy '
>yy' (
GetAsyncyy) 1
(yy1 2
stringyy2 8

customerIdyy9 C
)yyC D
{zz 	
if{{ 
({{ 
string{{ 
.{{ 
IsNullOrEmpty{{ $
({{$ %

customerId{{% /
){{/ 0
){{0 1
return|| 

BadRequest|| !
(||! "
)||" #
;||# $
var}} 
response}} 
=}} 
await}}  !
_customersApplication}}! 6
.}}6 7
GetAsync}}7 ?
(}}? @

customerId}}@ J
)}}J K
;}}K L
if~~ 
(~~ 
response~~ 
.~~ 
	IsSuccess~~ "
)~~" #
return 
Ok 
( 
response "
)" #
;# $
return
ÅÅ 

BadRequest
ÅÅ 
(
ÅÅ 
response
ÅÅ &
.
ÅÅ& '
Message
ÅÅ' .
)
ÅÅ. /
;
ÅÅ/ 0
}
ÇÇ 	
[
ÑÑ 	
HttpGet
ÑÑ	 
(
ÑÑ 
$str
ÑÑ 
)
ÑÑ 
]
ÑÑ  
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
IActionResult
ÖÖ '
>
ÖÖ' (
GetAllAsync
ÖÖ) 4
(
ÖÖ4 5
)
ÖÖ5 6
{
ÜÜ 	
var
áá 
response
áá 
=
áá 
await
áá  #
_customersApplication
áá! 6
.
áá6 7
GetAllAsync
áá7 B
(
ááB C
)
ááC D
;
ááD E
if
àà 
(
àà 
response
àà 
.
àà 
	IsSuccess
àà "
)
àà" #
return
ââ 
Ok
ââ 
(
ââ 
response
ââ "
)
ââ" #
;
ââ# $
return
ãã 

BadRequest
ãã 
(
ãã 
response
ãã &
.
ãã& '
Message
ãã' .
)
ãã. /
;
ãã/ 0
}
åå 	
}
êê 
}ëë Ê+
fD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Controllers\v1\UsersController.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Controllers. 9
.9 :
v1: <
{ 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
, 

Deprecated  
=! "
true# '
)' (
]( )
public 

class 
UsersController  
:! "

Controller# -
{ 
private 
readonly 
IUsersApplication *
_usersApplication+ <
;< =
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public 
UsersController 
( 
IUsersApplication 0
authApplication1 @
,@ A
IOptionsB J
<J K
AppSettingsK V
>V W
appSettingsX c
)c d
{ 	
_usersApplication 
= 
authApplication  /
;/ 0
_appSettings 
= 
appSettings &
.& '
Value' ,
;, -
} 	
[ 	
AllowAnonymous	 
] 
[   	
HttpPost  	 
(   
$str    
)    !
]  ! "
public!! 
IActionResult!! 
Authenticate!! )
(!!) *
[!!* +
FromBody!!+ 3
]!!3 4
UsersDto!!4 <
usersDto!!= E
)!!E F
{"" 	
var## 
response## 
=## 
_usersApplication## ,
.##, -
Authenticate##- 9
(##9 :
usersDto##: B
.##B C
UserName##C K
,##K L
usersDto##M U
.##U V
Password##V ^
)##^ _
;##_ `
if$$ 
($$ 
response$$ 
.$$ 
	IsSuccess$$ "
)$$" #
{%% 
if&& 
(&& 
response&& 
.&& 
Data&& !
!=&&" $
null&&% )
)&&) *
{'' 
response(( 
.(( 
Data(( !
.((! "
Token((" '
=((( )

BuildToken((* 4
(((4 5
response((5 =
)((= >
;((> ?
return)) 
Ok)) 
()) 
response)) &
)))& '
;))' (
}** 
else++ 
return,, 
NotFound,, #
(,,# $
response,,$ ,
),,, -
;,,- .
}-- 
return// 

BadRequest// 
(// 
response// &
)//& '
;//' (
}00 	
private22 
string22 

BuildToken22 !
(22! "
Response22" *
<22* +
UsersDto22+ 3
>223 4
usersDto225 =
)22= >
{33 	
var44 
tokenHandler44 
=44 
new44 "#
JwtSecurityTokenHandler44# :
(44: ;
)44; <
;44< =
var55 
key55 
=55 
Encoding55 
.55 
ASCII55 $
.55$ %
GetBytes55% -
(55- .
_appSettings55. :
.55: ;
Secret55; A
)55A B
;55B C
var66 
tokenDescriptor66 
=66  !
new66" %#
SecurityTokenDescriptor66& =
{77 
Subject88 
=88 
new88 
ClaimsIdentity88 ,
(88, -
new88- 0
Claim881 6
[886 7
]887 8
{99 
new:: 
Claim:: 
(:: 

ClaimTypes:: (
.::( )
Name::) -
,::- .
usersDto::/ 7
.::7 8
Data::8 <
.::< =
UserId::= C
.::C D
ToString::D L
(::L M
)::M N
)::N O
};; 
);; 
,;; 
Expires<< 
=<< 
DateTime<< "
.<<" #
UtcNow<<# )
.<<) *

AddMinutes<<* 4
(<<4 5
$num<<5 7
)<<7 8
,<<8 9
SigningCredentials== "
===# $
new==% (
SigningCredentials==) ;
(==; <
new==< ? 
SymmetricSecurityKey==@ T
(==T U
key==U X
)==X Y
,==Y Z
SecurityAlgorithms==[ m
.==m n 
HmacSha256Signature	==n Å
)
==Å Ç
,
==Ç É
Issuer>> 
=>> 
_appSettings>> %
.>>% &
Issuer>>& ,
,>>, -
Audience?? 
=?? 
_appSettings?? '
.??' (
Audience??( 0
}@@ 
;@@ 
varAA 
tokenAA 
=AA 
tokenHandlerAA $
.AA$ %
CreateTokenAA% 0
(AA0 1
tokenDescriptorAA1 @
)AA@ A
;AAA B
varBB 
tokenStringBB 
=BB 
tokenHandlerBB *
.BB* +

WriteTokenBB+ 5
(BB5 6
tokenBB6 ;
)BB; <
;BB< =
returnCC 
tokenStringCC 
;CC 
}DD 	
}EE 
}FF úx
jD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Controllers\v2\CustomersController.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Controllers. 9
.9 :
v2: <
{ 
[		 
	Authorize		 
]		 
[

 
Route

 

(


 
$str

 3
)

3 4
]

4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class 
CustomersController $
:% &

Controller' 1
{ 
private 
readonly !
ICustomersApplication .!
_customersApplication/ D
;D E
public 
CustomersController "
(" #!
ICustomersApplication# 8 
customersApplication9 M
)M N
{ 	!
_customersApplication !
=" # 
customersApplication$ 8
;8 9
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
IActionResult 
Insert #
(# $
[$ %
FromBody% -
]- .
CustomersDto. :
customersDto; G
)G H
{ 	
if 
( 
customersDto 
== 
null  $
)$ %
return 

BadRequest !
(! "
)" #
;# $
var 
response 
= !
_customersApplication 0
.0 1
Insert1 7
(7 8
customersDto8 D
)D E
;E F
if 
( 
response 
. 
	IsSuccess "
)" #
return 
Ok 
( 
response "
)" #
;# $
return   

BadRequest   
(   
response   &
.  & '
Message  ' .
)  . /
;  / 0
}!! 	
[## 	
HttpPut##	 
(## 
$str## &
)##& '
]##' (
public$$ 
IActionResult$$ 
Update$$ #
($$# $
string$$$ *

customerId$$+ 5
,$$5 6
[$$7 8
FromBody$$8 @
]$$@ A
CustomersDto$$A M
customersDto$$N Z
)$$Z [
{%% 	
var&& 
customerDto&& 
=&& !
_customersApplication&& 3
.&&3 4
Get&&4 7
(&&7 8

customerId&&8 B
)&&B C
;&&C D
if'' 
('' 
customerDto'' 
.'' 
Data''  
==''! #
null''$ (
)''( )
return(( 
NotFound(( 
(((  
customerDto((  +
.((+ ,
Message((, 3
)((3 4
;((4 5
if** 
(** 
customersDto** 
==** 
null**  $
)**$ %
return++ 

BadRequest++ !
(++! "
)++" #
;++# $
var,, 
response,, 
=,, !
_customersApplication,, 0
.,,0 1
Update,,1 7
(,,7 8
customersDto,,8 D
),,D E
;,,E F
if-- 
(-- 
response-- 
.-- 
	IsSuccess-- "
)--" #
return.. 
Ok.. 
(.. 
response.. "
).." #
;..# $
return00 

BadRequest00 
(00 
response00 &
.00& '
Message00' .
)00. /
;00/ 0
}11 	
[33 	

HttpDelete33	 
(33 
$str33 )
)33) *
]33* +
public44 
IActionResult44 
Delete44 #
(44# $
string44$ *

customerId44+ 5
)445 6
{55 	
if66 
(66 
string66 
.66 
IsNullOrEmpty66 $
(66$ %

customerId66% /
)66/ 0
)660 1
return77 

BadRequest77 !
(77! "
)77" #
;77# $
var88 
response88 
=88 !
_customersApplication88 0
.880 1
Delete881 7
(887 8

customerId888 B
)88B C
;88C D
if99 
(99 
response99 
.99 
	IsSuccess99 "
)99" #
return:: 
Ok:: 
(:: 
response:: "
)::" #
;::# $
return<< 

BadRequest<< 
(<< 
response<< &
.<<& '
Message<<' .
)<<. /
;<</ 0
}== 	
[?? 	
HttpGet??	 
(?? 
$str?? #
)??# $
]??$ %
public@@ 
IActionResult@@ 
Get@@  
(@@  !
string@@! '

customerId@@( 2
)@@2 3
{AA 	
ifBB 
(BB 
stringBB 
.BB 
IsNullOrEmptyBB $
(BB$ %

customerIdBB% /
)BB/ 0
)BB0 1
returnCC 

BadRequestCC !
(CC! "
)CC" #
;CC# $
varDD 
responseDD 
=DD !
_customersApplicationDD 0
.DD0 1
GetDD1 4
(DD4 5

customerIdDD5 ?
)DD? @
;DD@ A
ifEE 
(EE 
responseEE 
.EE 
	IsSuccessEE "
)EE" #
returnFF 
OkFF 
(FF 
responseFF "
)FF" #
;FF# $
returnHH 

BadRequestHH 
(HH 
responseHH &
.HH& '
MessageHH' .
)HH. /
;HH/ 0
}II 	
[KK 	
HttpGetKK	 
(KK 
$strKK 
)KK 
]KK 
publicLL 
IActionResultLL 
GetAllLL #
(LL# $
)LL$ %
{MM 	
varNN 
responseNN 
=NN !
_customersApplicationNN 0
.NN0 1
GetAllNN1 7
(NN7 8
)NN8 9
;NN9 :
ifOO 
(OO 
responseOO 
.OO 
	IsSuccessOO "
)OO" #
returnPP 
OkPP 
(PP 
responsePP "
)PP" #
;PP# $
returnRR 

BadRequestRR 
(RR 
responseRR &
.RR& '
MessageRR' .
)RR. /
;RR/ 0
}SS 	
[UU 	
HttpGetUU	 
(UU 
$strUU '
)UU' (
]UU( )
publicVV 
IActionResultVV  
GetAllWithPaginationVV 1
(VV1 2
[VV2 3
	FromQueryVV3 <
]VV< =
intVV> A

pageNumberVVB L
,VVL M
intVVN Q
pageSizeVVR Z
)VVZ [
{WW 	
varXX 
responseXX 
=XX !
_customersApplicationXX 0
.XX0 1 
GetAllWithPaginationXX1 E
(XXE F

pageNumberXXF P
,XXP Q
pageSizeXXR Z
)XXZ [
;XX[ \
ifYY 
(YY 
responseYY 
.YY 
	IsSuccessYY "
)YY" #
returnZZ 
OkZZ 
(ZZ 
responseZZ "
)ZZ" #
;ZZ# $
return\\ 

BadRequest\\ 
(\\ 
response\\ &
.\\& '
Message\\' .
)\\. /
;\\/ 0
}]] 	
[bb 	
HttpPostbb	 
(bb 
$strbb 
)bb  
]bb  !
publiccc 
asynccc 
Taskcc 
<cc 
IActionResultcc '
>cc' (
InsertAsynccc) 4
(cc4 5
[cc5 6
FromBodycc6 >
]cc> ?
CustomersDtocc? K
customersDtoccL X
)ccX Y
{dd 	
ifee 
(ee 
customersDtoee 
==ee 
nullee  $
)ee$ %
returnff 

BadRequestff !
(ff! "
)ff" #
;ff# $
vargg 
responsegg 
=gg 
awaitgg  !
_customersApplicationgg! 6
.gg6 7
InsertAsyncgg7 B
(ggB C
customersDtoggC O
)ggO P
;ggP Q
ifhh 
(hh 
responsehh 
.hh 
	IsSuccesshh "
)hh" #
returnii 
Okii 
(ii 
responseii "
)ii" #
;ii# $
returnkk 

BadRequestkk 
(kk 
responsekk &
.kk& '
Messagekk' .
)kk. /
;kk/ 0
}ll 	
[nn 	
HttpPutnn	 
(nn 
$strnn +
)nn+ ,
]nn, -
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
UpdateAsyncoo) 4
(oo4 5
stringoo5 ;

customerIdoo< F
,ooF G
[ooH I
FromBodyooI Q
]ooQ R
CustomersDtoooR ^
customersDtooo_ k
)ook l
{pp 	
varqq 
customerDtoqq 
=qq 
awaitqq #!
_customersApplicationqq$ 9
.qq9 :
GetAsyncqq: B
(qqB C

customerIdqqC M
)qqM N
;qqN O
ifrr 
(rr 
customerDtorr 
.rr 
Datarr  
==rr! #
nullrr$ (
)rr( )
returnss 
NotFoundss 
(ss  
customerDtoss  +
.ss+ ,
Messagess, 3
)ss3 4
;ss4 5
ifuu 
(uu 
customersDtouu 
==uu 
nulluu  $
)uu$ %
returnvv 

BadRequestvv !
(vv! "
)vv" #
;vv# $
varww 
responseww 
=ww 
awaitww  !
_customersApplicationww! 6
.ww6 7
UpdateAsyncww7 B
(wwB C
customersDtowwC O
)wwO P
;wwP Q
ifxx 
(xx 
responsexx 
.xx 
	IsSuccessxx "
)xx" #
returnyy 
Okyy 
(yy 
responseyy "
)yy" #
;yy# $
return{{ 

BadRequest{{ 
({{ 
response{{ &
.{{& '
Message{{' .
){{. /
;{{/ 0
}|| 	
[~~ 	

HttpDelete~~	 
(~~ 
$str~~ .
)~~. /
]~~/ 0
public 
async 
Task 
< 
IActionResult '
>' (
DeleteAsync) 4
(4 5
string5 ;

customerId< F
)F G
{
ÄÄ 	
if
ÅÅ 
(
ÅÅ 
string
ÅÅ 
.
ÅÅ 
IsNullOrEmpty
ÅÅ $
(
ÅÅ$ %

customerId
ÅÅ% /
)
ÅÅ/ 0
)
ÅÅ0 1
return
ÇÇ 

BadRequest
ÇÇ !
(
ÇÇ! "
)
ÇÇ" #
;
ÇÇ# $
var
ÉÉ 
response
ÉÉ 
=
ÉÉ 
await
ÉÉ  #
_customersApplication
ÉÉ! 6
.
ÉÉ6 7
DeleteAsync
ÉÉ7 B
(
ÉÉB C

customerId
ÉÉC M
)
ÉÉM N
;
ÉÉN O
if
ÑÑ 
(
ÑÑ 
response
ÑÑ 
.
ÑÑ 
	IsSuccess
ÑÑ "
)
ÑÑ" #
return
ÖÖ 
Ok
ÖÖ 
(
ÖÖ 
response
ÖÖ "
)
ÖÖ" #
;
ÖÖ# $
return
áá 

BadRequest
áá 
(
áá 
response
áá &
.
áá& '
Message
áá' .
)
áá. /
;
áá/ 0
}
àà 	
[
ää 	
HttpGet
ää	 
(
ää 
$str
ää (
)
ää( )
]
ää) *
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
IActionResult
ãã '
>
ãã' (
GetAsync
ãã) 1
(
ãã1 2
string
ãã2 8

customerId
ãã9 C
)
ããC D
{
åå 	
if
çç 
(
çç 
string
çç 
.
çç 
IsNullOrEmpty
çç $
(
çç$ %

customerId
çç% /
)
çç/ 0
)
çç0 1
return
éé 

BadRequest
éé !
(
éé! "
)
éé" #
;
éé# $
var
èè 
response
èè 
=
èè 
await
èè  #
_customersApplication
èè! 6
.
èè6 7
GetAsync
èè7 ?
(
èè? @

customerId
èè@ J
)
èèJ K
;
èèK L
if
êê 
(
êê 
response
êê 
.
êê 
	IsSuccess
êê "
)
êê" #
return
ëë 
Ok
ëë 
(
ëë 
response
ëë "
)
ëë" #
;
ëë# $
return
ìì 

BadRequest
ìì 
(
ìì 
response
ìì &
.
ìì& '
Message
ìì' .
)
ìì. /
;
ìì/ 0
}
îî 	
[
ññ 	
HttpGet
ññ	 
(
ññ 
$str
ññ 
)
ññ 
]
ññ  
public
óó 
async
óó 
Task
óó 
<
óó 
IActionResult
óó '
>
óó' (
GetAllAsync
óó) 4
(
óó4 5
)
óó5 6
{
òò 	
var
ôô 
response
ôô 
=
ôô 
await
ôô  #
_customersApplication
ôô! 6
.
ôô6 7
GetAllAsync
ôô7 B
(
ôôB C
)
ôôC D
;
ôôD E
if
öö 
(
öö 
response
öö 
.
öö 
	IsSuccess
öö "
)
öö" #
return
õõ 
Ok
õõ 
(
õõ 
response
õõ "
)
õõ" #
;
õõ# $
return
ùù 

BadRequest
ùù 
(
ùù 
response
ùù &
.
ùù& '
Message
ùù' .
)
ùù. /
;
ùù/ 0
}
ûû 	
[
†† 	
HttpGet
††	 
(
†† 
$str
†† ,
)
††, -
]
††- .
public
°° 
async
°° 
Task
°° 
<
°° 
IActionResult
°° '
>
°°' ('
GetAllWithPaginationAsync
°°) B
(
°°B C
[
°°C D
	FromQuery
°°D M
]
°°M N
int
°°O R

pageNumber
°°S ]
,
°°] ^
int
°°_ b
pageSize
°°c k
)
°°k l
{
¢¢ 	
var
££ 
response
££ 
=
££ 
await
££  #
_customersApplication
££! 6
.
££6 7'
GetAllWithPaginationAsync
££7 P
(
££P Q

pageNumber
££Q [
,
££[ \
pageSize
££] e
)
££e f
;
££f g
if
§§ 
(
§§ 
response
§§ 
.
§§ 
	IsSuccess
§§ "
)
§§" #
return
•• 
Ok
•• 
(
•• 
response
•• "
)
••" #
;
••# $
return
ßß 

BadRequest
ßß 
(
ßß 
response
ßß &
.
ßß& '
Message
ßß' .
)
ßß. /
;
ßß/ 0
}
®® 	
}
´´ 
}¨¨ û+
fD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Controllers\v2\UsersController.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Controllers. 9
.9 :
v2: <
{ 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class 
UsersController  
:! "

Controller# -
{ 
private 
readonly 
IUsersApplication *
_usersApplication+ <
;< =
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public 
UsersController 
( 
IUsersApplication 0
authApplication1 @
,@ A
IOptionsB J
<J K
AppSettingsK V
>V W
appSettingsX c
)c d
{ 	
_usersApplication 
= 
authApplication  /
;/ 0
_appSettings 
= 
appSettings &
.& '
Value' ,
;, -
} 	
[ 	
AllowAnonymous	 
] 
[   	
HttpPost  	 
(   
$str    
)    !
]  ! "
public!! 
IActionResult!! 
Authenticate!! )
(!!) *
[!!* +
FromBody!!+ 3
]!!3 4
UsersDto!!4 <
usersDto!!= E
)!!E F
{"" 	
var## 
response## 
=## 
_usersApplication## ,
.##, -
Authenticate##- 9
(##9 :
usersDto##: B
.##B C
UserName##C K
,##K L
usersDto##M U
.##U V
Password##V ^
)##^ _
;##_ `
if$$ 
($$ 
response$$ 
.$$ 
	IsSuccess$$ "
)$$" #
{%% 
if&& 
(&& 
response&& 
.&& 
Data&& !
!=&&" $
null&&% )
)&&) *
{'' 
response(( 
.(( 
Data(( !
.((! "
Token((" '
=((( )

BuildToken((* 4
(((4 5
response((5 =
)((= >
;((> ?
return)) 
Ok)) 
()) 
response)) &
)))& '
;))' (
}** 
else++ 
return,, 
NotFound,, #
(,,# $
response,,$ ,
),,, -
;,,- .
}-- 
return// 

BadRequest// 
(// 
response// &
)//& '
;//' (
}00 	
private22 
string22 

BuildToken22 !
(22! "
Response22" *
<22* +
UsersDto22+ 3
>223 4
usersDto225 =
)22= >
{33 	
var44 
tokenHandler44 
=44 
new44 "#
JwtSecurityTokenHandler44# :
(44: ;
)44; <
;44< =
var55 
key55 
=55 
Encoding55 
.55 
ASCII55 $
.55$ %
GetBytes55% -
(55- .
_appSettings55. :
.55: ;
Secret55; A
)55A B
;55B C
var66 
tokenDescriptor66 
=66  !
new66" %#
SecurityTokenDescriptor66& =
{77 
Subject88 
=88 
new88 
ClaimsIdentity88 ,
(88, -
new88- 0
Claim881 6
[886 7
]887 8
{99 
new:: 
Claim:: 
(:: 

ClaimTypes:: (
.::( )
Name::) -
,::- .
usersDto::/ 7
.::7 8
Data::8 <
.::< =
UserId::= C
.::C D
ToString::D L
(::L M
)::M N
)::N O
};; 
);; 
,;; 
Expires<< 
=<< 
DateTime<< "
.<<" #
UtcNow<<# )
.<<) *

AddMinutes<<* 4
(<<4 5
$num<<5 7
)<<7 8
,<<8 9
SigningCredentials== "
===# $
new==% (
SigningCredentials==) ;
(==; <
new==< ? 
SymmetricSecurityKey==@ T
(==T U
key==U X
)==X Y
,==Y Z
SecurityAlgorithms==[ m
.==m n 
HmacSha256Signature	==n Å
)
==Å Ç
,
==Ç É
Issuer>> 
=>> 
_appSettings>> %
.>>% &
Issuer>>& ,
,>>, -
Audience?? 
=?? 
_appSettings?? '
.??' (
Audience??( 0
}@@ 
;@@ 
varAA 
tokenAA 
=AA 
tokenHandlerAA $
.AA$ %
CreateTokenAA% 0
(AA0 1
tokenDescriptorAA1 @
)AA@ A
;AAA B
varBB 
tokenStringBB 
=BB 
tokenHandlerBB *
.BB* +

WriteTokenBB+ 5
(BB5 6
tokenBB6 ;
)BB; <
;BB< =
returnCC 
tokenStringCC 
;CC 
}DD 	
}EE 
}FF Å
[D:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Helpers\AppSettings.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Helpers. 5
{ 
public 

class 
AppSettings 
{ 
public 
string 

OriginCors  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Secret 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Issuer 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Audience 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 ¨(
wD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\Authentication\AuthenticationExtensions.cs
	namespace

 	
	Pacagroup


 
.

 
	Ecommerce

 
.

 
Services

 &
.

& '
WebApi

' -
.

- .
Modules

. 5
.

5 6
Authentication

6 D
{ 
public 

static 
class $
AuthenticationExtensions 0
{ 
public 
static 
IServiceCollection (
AddAuthentication) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
,[ \
IConfiguration] k
configurationl y
)y z
{ 	
var 
appSettingsSection "
=# $
configuration% 2
.2 3

GetSection3 =
(= >
$str> F
)F G
;G H
services 
. 
	Configure 
< 
AppSettings *
>* +
(+ ,
appSettingsSection, >
)> ?
;? @
var 
appSettings 
= 
appSettingsSection 0
.0 1
Get1 4
<4 5
AppSettings5 @
>@ A
(A B
)B C
;C D
var 
key 
= 
Encoding 
. 
ASCII $
.$ %
GetBytes% -
(- .
appSettings. 9
.9 :
Secret: @
)@ A
;A B
var 
Issuer 
= 
appSettings $
.$ %
Issuer% +
;+ ,
var 
Audience 
= 
appSettings &
.& '
Audience' /
;/ 0
services 
. 
AddAuthentication &
(& '
x' (
=>) +
{ 
x 
. %
DefaultAuthenticateScheme +
=, -
JwtBearerDefaults. ?
.? @ 
AuthenticationScheme@ T
;T U
x 
. "
DefaultChallengeScheme (
=) *
JwtBearerDefaults+ <
.< = 
AuthenticationScheme= Q
;Q R
} 
) 
. 
AddJwtBearer 
( 
x 
=> 
{   
x!! 
.!! 
Events!! 
=!! 
new!! 
JwtBearerEvents!! .
{"" 
OnTokenValidated## $
=##% &
context##' .
=>##/ 1
{$$ 
var%% 
userId%% "
=%%# $
int%%% (
.%%( )
Parse%%) .
(%%. /
context%%/ 6
.%%6 7
	Principal%%7 @
.%%@ A
Identity%%A I
.%%I J
Name%%J N
)%%N O
;%%O P
return&& 
Task&& #
.&&# $
CompletedTask&&$ 1
;&&1 2
}'' 
,'' "
OnAuthenticationFailed)) *
=))+ ,
context))- 4
=>))5 7
{** 
if++ 
(++ 
context++ #
.++# $
	Exception++$ -
.++- .
GetType++. 5
(++5 6
)++6 7
==++8 :
typeof++; A
(++A B)
SecurityTokenExpiredException++B _
)++_ `
)++` a
{,, 
context-- #
.--# $
Response--$ ,
.--, -
Headers--- 4
.--4 5
Add--5 8
(--8 9
$str--9 H
,--H I
$str--J P
)--P Q
;--Q R
}.. 
return// 
Task// #
.//# $
CompletedTask//$ 1
;//1 2
}00 
}11 
;11 
x22 
.22  
RequireHttpsMetadata22 &
=22' (
false22) .
;22. /
x33 
.33 
	SaveToken33 
=33 
false33 #
;33# $
x44 
.44 %
TokenValidationParameters44 +
=44, -
new44. 1%
TokenValidationParameters442 K
{55 $
ValidateIssuerSigningKey66 ,
=66- .
true66/ 3
,663 4
IssuerSigningKey77 $
=77% &
new77' * 
SymmetricSecurityKey77+ ?
(77? @
key77@ C
)77C D
,77D E
ValidateIssuer88 "
=88# $
true88% )
,88) *
ValidIssuer99 
=99  !
Issuer99" (
,99( )
ValidateAudience:: $
=::% &
true::' +
,::+ ,
ValidAudience;; !
=;;" #
Audience;;$ ,
,;;, -
ValidateLifetime<< $
=<<% &
true<<' +
,<<+ ,
	ClockSkew== 
=== 
TimeSpan==  (
.==( )
Zero==) -
}>> 
;>> 
}?? 
)?? 
;?? 
return@@ 
services@@ 
;@@ 
}AA 	
}BB 
}CC ∑
iD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\Feature\FeatureExtensions.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6
Feature6 =
{ 
public 

static 
class 
FeatureExtensions )
{ 
public 
static 
IServiceCollection (

AddFeature) 3
(3 4
this4 8
IServiceCollection9 K
servicesL T
,T U
IConfigurationV d
configuratione r
)r s
{ 	
string 
myPolicy 
= 
$str 2
;2 3
services		 
.		 
AddCors		 
(		 
options		 $
=>		% '
options		( /
.		/ 0
	AddPolicy		0 9
(		9 :
myPolicy		: B
,		B C
builder		D K
=>		L N
builder		O V
.		V W
WithOrigins		W b
(		b c
configuration		c p
[		p q
$str			q Ñ
]
		Ñ Ö
)
		Ö Ü
.

X Y
AllowAnyHeader

Y g
(

g h
)

h i
.X Y
AllowAnyMethodY g
(g h
)h i
.X Y
AllowAnyOriginY g
(g h
)h i
)i j
)j k
;k l
services 
. 
AddMvc 
( 
) 
; 
return 
services 
; 
} 	
} 
} Ω
mD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\HealthCheck\HealthCheckCustom.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6
HealthCheck6 A
{ 
public 

class 
HealthCheckCustom "
:# $
IHealthCheck% 1
{		 
private

 
readonly

 
Random

 
_random

  '
=

( )
new

* -
(

- .
)

. /
;

/ 0
public 
Task 
< 
HealthCheckResult %
>% &
CheckHealthAsync' 7
(7 8
HealthCheckContext8 J
contextK R
,R S
CancellationTokenT e
cancellationTokenf w
=x y
default	z Å
)
Å Ç
{ 	
var 
responseTime 
= 
_random &
.& '
Next' +
(+ ,
$num, -
,- .
$num/ 2
)2 3
;3 4
if 
( 
responseTime 
< 
$num "
)" #
{ 
return 
Task 
. 

FromResult &
(& '
HealthCheckResult' 8
.8 9
Healthy9 @
(@ A
$strA h
)h i
)i j
;j k
} 
else 
if 
( 
responseTime !
<" #
$num$ '
)' (
{ 
return 
Task 
. 

FromResult &
(& '
HealthCheckResult' 8
.8 9
Degraded9 A
(A B
$strB j
)j k
)k l
;l m
} 
return 
Task 
. 

FromResult "
(" #
HealthCheckResult# 4
.4 5
	Unhealthy5 >
(> ?
$str? h
)h i
)i j
;j k
} 	
} 
} ı
qD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\HealthCheck\HealthCheckExtensions.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6
HealthCheck6 A
{ 
public 

static 
class !
HealthCheckExtensions -
{ 
public 
static 
IServiceCollection (
AddHealthCheck) 7
(7 8
this8 <
IServiceCollection= O
servicesP X
,X Y
IConfigurationZ h
configurationi v
)v w
{		 	
services

 
.

 
AddHealthChecks

 $
(

$ %
)

% &
. 
AddSqlServer 
( 
configuration +
.+ ,
GetConnectionString, ?
(? @
$str@ U
)U V
,V W
tagsX \
:\ ]
new^ a
[a b
]b c
{d e
$strf p
}q r
)r s
. 
AddCheck 
< 
HealthCheckCustom +
>+ ,
(, -
$str- @
,@ A
tagsB F
:F G
newH K
[K L
]L M
{N O
$strP X
}Y Z
)Z [
;[ \
services 
. 
AddHealthChecksUI &
(& '
)' (
.( )
AddInMemoryStorage) ;
(; <
)< =
;= >
return 
services 
; 
} 	
} 
} ∂
mD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\Injection\InjectionExtensions.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6
	Injection6 ?
{ 
public 

static 
class 
InjectionExtensions +
{ 
public 
static 
IServiceCollection (
AddInjection) 5
(5 6
this6 :
IServiceCollection; M
servicesN V
,V W
IConfigurationX f
configurationg t
)t u
{ 	
services 
. 
AddSingleton !
<! "
IConfiguration" 0
>0 1
(1 2
configuration2 ?
)? @
;@ A
services 
. 
AddSingleton !
<! "
DapperContext" /
>/ 0
(0 1
)1 2
;2 3
services 
. 
	AddScoped 
< !
ICustomersApplication 4
,4 5 
CustomersApplication6 J
>J K
(K L
)L M
;M N
services 
. 
	AddScoped 
< 
ICustomersDomain /
,/ 0
CustomersDomain1 @
>@ A
(A B
)B C
;C D
services 
. 
	AddScoped 
<  
ICustomersRepository 3
,3 4
CustomersRepository5 H
>H I
(I J
)J K
;K L
services 
. 
	AddScoped 
< 
IUsersApplication 0
,0 1
UsersApplication2 B
>B C
(C D
)D E
;E F
services 
. 
	AddScoped 
< 
IUsersDomain +
,+ ,
UsersDomain- 8
>8 9
(9 :
): ;
;; <
services 
. 
	AddScoped 
< 
IUsersRepository /
,/ 0
UsersRepository1 @
>@ A
(A B
)B C
;C D
services 
. 
	AddScoped 
( 
typeof %
(% &

IAppLogger& 0
<0 1
>1 2
)2 3
,3 4
typeof5 ;
(; <
LoggerAdapter< I
<I J
>J K
)K L
)L M
;M N
services 
. 
	AddScoped 
< 
IUnitOfWork *
,* +

UnitOfWork, 6
>6 7
(7 8
)8 9
;9 :
return 
services 
; 
} 	
}   
}!! ®
gD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\Mapper\MapperExtensions.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6
Mapper6 <
{ 
public 

static 
class 
MapperExtensions (
{ 
public		 
static		 
IServiceCollection		 (
	AddMapper		) 2
(		2 3
this		3 7
IServiceCollection		8 J
services		K S
)		S T
{

 	
var 
mappingConfig 
= 
new  #
MapperConfiguration$ 7
(7 8
mc8 :
=>; =
{ 
mc 
. 

AddProfile 
( 
new !
MappingsProfile" 1
(1 2
)2 3
)3 4
;4 5
} 
) 
; 
IMapper 
mapper 
= 
mappingConfig *
.* +
CreateMapper+ 7
(7 8
)8 9
;9 :
services 
. 
AddSingleton !
(! "
mapper" (
)( )
;) *
return 
services 
; 
} 	
} 
} ∏
oD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\Swagger\ConfigureSwaggerOptions.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6
Swagger6 =
{		 
public

 

class

 #
ConfigureSwaggerOptions

 (
:

) *
IConfigureOptions

+ <
<

< =
SwaggerGenOptions

= N
>

N O
{ 
readonly *
IApiVersionDescriptionProvider /
provider0 8
;8 9
public #
ConfigureSwaggerOptions &
(& '*
IApiVersionDescriptionProvider' E
providerF N
)N O
=>P R
thisS W
.W X
providerX `
=a b
providerc k
;k l
public 
void 
	Configure 
( 
SwaggerGenOptions /
options0 7
)7 8
{ 	
foreach 
( 
var 
description $
in% '
provider( 0
.0 1"
ApiVersionDescriptions1 G
)G H
{ 
options 
. 

SwaggerDoc "
(" #
description# .
.. /
	GroupName/ 8
,8 9#
CreateInfoForApiVersion: Q
(Q R
descriptionR ]
)] ^
)^ _
;_ `
} 
} 	
static 
OpenApiInfo #
CreateInfoForApiVersion 2
(2 3!
ApiVersionDescription3 H
descriptionI T
)T U
{V W
var   
info   
=   
new   
OpenApiInfo   &
{!! 
Version"" 
="" 
description"" %
.""% &

ApiVersion""& 0
.""0 1
ToString""1 9
(""9 :
)"": ;
,""; <
Title## 
=## 
$str## B
,##B C
Description$$ 
=$$ 
$str$$ G
,$$G H
TermsOfService%% 
=%%  
new%%! $
Uri%%% (
(%%( )
$str%%) F
)%%F G
,%%G H
Contact&& 
=&& 
new&& 
OpenApiContact&& ,
{'' 
Name(( 
=(( 
$str(( (
,((( )
Email)) 
=)) 
$str)) 5
,))5 6
Url** 
=** 
new** 
Uri** !
(**! "
$str**" A
)**A B
}++ 
,++ 
License,, 
=,, 
new,, 
OpenApiLicense,, ,
{-- 
Name.. 
=.. 
$str.. +
,..+ ,
Url// 
=// 
new// 
Uri// !
(//! "
$str//" A
)//A B
}00 
}11 
;11 
if33 
(33 
description33 
.33 
IsDeprecated33 (
)33( )
{44 
info55 
.55 
Description55  
+=55! #
$str55$ Q
;55Q R
}66 
return88 
info88 
;88 
}99 	
}:: 
};; ¢
iD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\Swagger\SwaggerExtensions.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6
Swagger6 =
{ 
public 

static 
class 
SwaggerExtensions )
{ 
public 
static 
IServiceCollection (

AddSwagger) 3
(3 4
this4 8
IServiceCollection9 K
servicesL T
)T U
{ 	
services 
. 
AddTransient !
<! "
IConfigureOptions" 3
<3 4
SwaggerGenOptions4 E
>E F
,F G#
ConfigureSwaggerOptionsH _
>_ `
(` a
)a b
;b c
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
var 
xmlFile 
= 
$"  
{  !
Assembly! )
.) * 
GetExecutingAssembly* >
(> ?
)? @
.@ A
GetNameA H
(H I
)I J
.J K
NameK O
}O P
$strP T
"T U
;U V
var 
xmlPath 
= 
Path "
." #
Combine# *
(* +

AppContext+ 5
.5 6
BaseDirectory6 C
,C D
xmlFileE L
)L M
;M N
c 
. 
IncludeXmlComments $
($ %
xmlPath% ,
), -
;- .
var 
securityScheme "
=# $
new% (!
OpenApiSecurityScheme) >
{ 
Name 
= 
$str *
,* +
Description 
=  !
$str" E
,E F
In 
= 
ParameterLocation *
.* +
Header+ 1
,1 2
Type   
=   
SecuritySchemeType   -
.  - .
Http  . 2
,  2 3
Scheme!! 
=!! 
$str!! %
,!!% &
BearerFormat""  
=""! "
$str""# (
,""( )
	Reference## 
=## 
new##  #
OpenApiReference##$ 4
{$$ 
Id%% 
=%% 
JwtBearerDefaults%% .
.%%. / 
AuthenticationScheme%%/ C
,%%C D
Type&& 
=&& 
ReferenceType&& ,
.&&, -
SecurityScheme&&- ;
}'' 
}(( 
;(( 
c++ 
.++ !
AddSecurityDefinition++ '
(++' (
securityScheme++( 6
.++6 7
	Reference++7 @
.++@ A
Id++A C
,++C D
securityScheme++E S
)++S T
;++T U
c-- 
.-- "
AddSecurityRequirement-- (
(--( )
new--* -&
OpenApiSecurityRequirement--. H
{.. 
{// 
securityScheme// $
,//$ %
new//& )
List//* .
<//. /
string/// 5
>//5 6
(//6 7
)//7 8
{//9 :
}//; <
}//= >
}00 
)00 
;00 
}11 
)11 
;11 
return22 
services22 
;22 
}33 	
}44 
}55 Ø
mD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\Validator\ValidatorExtensions.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6
	Validator6 ?
{		 
public

 

static

 
class

 
ValidatorExtensions

 +
{ 
public 
static 
IServiceCollection (
AddValidator) 5
(5 6
this6 :
IServiceCollection; M
servicesN V
)V W
{ 	
services 
. 
AddTransient !
<! "
UsersDtoValidator" 3
>3 4
(4 5
)5 6
;6 7
return 
services 
; 
} 	
} 
} Ω
oD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\Versioning\VersioningExtensions.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6

Versioning6 @
{ 
public 

static 
class  
VersioningExtensions ,
{ 
public 
static 
IServiceCollection (
AddVersioning) 6
(6 7
this7 ;
IServiceCollection< N
servicesO W
)W X
{		 	
services

 
.

 
AddApiVersioning

 %
(

% &
o

& '
=>

( *
{ 
o 
. 
DefaultApiVersion #
=$ %
new& )
	Microsoft* 3
.3 4

AspNetCore4 >
.> ?
Mvc? B
.B C

ApiVersionC M
(M N
$numN O
,O P
$numQ R
)R S
;S T
o 
. /
#AssumeDefaultVersionWhenUnspecified 5
=6 7
true8 <
;< =
o 
. 
ReportApiVersions #
=$ %
true& *
;* +
o 
. 
ApiVersionReader "
=# $
new% (&
UrlSegmentApiVersionReader) C
(C D
)D E
;E F
} 
) 
; 
services 
. #
AddVersionedApiExplorer ,
(, -
options- 4
=>5 7
{ 
options 
. 
GroupNameFormat '
=( )
$str* 2
;2 3
options 
. %
SubstituteApiVersionInUrl 1
=2 3
true4 8
;8 9
} 
) 
; 
return 
services 
; 
} 	
} 
} ‘
hD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Modules\Watch\WatchDogExtensions.cs
	namespace 	
	Pacagroup
 
. 
	Ecommerce 
. 
Services &
.& '
WebApi' -
.- .
Modules. 5
.5 6
Watch6 ;
{ 
public 

static 
class 
WatchDogExtensions *
{ 
public 
static 
IServiceCollection (
AddWatchDog) 4
(4 5
this5 9
IServiceCollection: L
servicesM U
,U V
IConfigurationW e
configurationf s
)s t
{ 	
services		 
.		 
AddWatchDogServices		 (
(		( )
opt		) ,
=>		- /
{		0 1
opt

 
.

 #
SetExternalDbConnString

 +
=

, -
configuration

. ;
.

; <
GetConnectionString

< O
(

O P
$str

P e
)

e f
;

f g
opt 
. 
SqlDriverOption #
=$ %
WatchDog& .
.. /
src/ 2
.2 3
Enums3 8
.8 9!
WatchDogSqlDriverEnum9 N
.N O
MSSQLO T
;T U
opt 
. 
IsAutoClear 
=  !
true" &
;& '
opt 
. 
ClearTimeSchedule %
=& '
WatchDog( 0
.0 1
src1 4
.4 5
Enums5 :
.: ;)
WatchDogAutoClearScheduleEnum; X
.X Y
MonthlyY `
;` a
} 
) 
; 
return 
services 
; 
} 	
} 
} ™.
OD:\Workspace\Pacagroup.Ecommerce\Pacagroup.Ecommerce.Services.WebApi\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
	AddMapper 
( 
) 
; 
builder 
. 
Services 
. 

AddFeature 
( 
builder #
.# $
Configuration$ 1
)1 2
;2 3
builder 
. 
Services 
. 
AddInjection 
( 
builder %
.% &
Configuration& 3
)3 4
;4 5
builder 
. 
Services 
. 
AddAuthentication "
(" #
builder# *
.* +
Configuration+ 8
)8 9
;9 :
builder 
. 
Services 
. 
AddVersioning 
( 
)  
;  !
builder 
. 
Services 
. 

AddSwagger 
( 
) 
; 
builder 
. 
Services 
. 
AddValidator 
( 
) 
;  
builder 
. 
Services 
. 
AddHealthCheck 
(  
builder  '
.' (
Configuration( 5
)5 6
;6 7
builder 
. 
Services 
. 
AddWatchDog 
( 
builder $
.$ %
Configuration% 2
)2 3
;3 4
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if   
(   
app   
.   
Environment   
.   
IsDevelopment   !
(  ! "
)  " #
)  # $
{!! 
app"" 
."" %
UseDeveloperExceptionPage"" !
(""! "
)""" #
;""# $
app## 
.## 

UseSwagger## 
(## 
)## 
;## 
app$$ 
.$$ 
UseSwaggerUI$$ 
($$ 
c$$ 
=>$$ 
{%% 
var'' 
provider'' 
='' 
app'' 
.'' 
Services'' #
.''# $
GetRequiredService''$ 6
<''6 7*
IApiVersionDescriptionProvider''7 U
>''U V
(''V W
)''W X
;''X Y
foreach(( 
((( 
var(( 
description((  
in((! #
provider(($ ,
.((, -"
ApiVersionDescriptions((- C
)((C D
{)) 	
c** 
.** 
SwaggerEndpoint** 
(** 
$"**  
$str**  )
{**) *
description*** 5
.**5 6
	GroupName**6 ?
}**? @
$str**@ M
"**M N
,**N O
description**P [
.**[ \
	GroupName**\ e
.**e f
ToUpperInvariant**f v
(**v w
)**w x
)**x y
;**y z
}++ 	
},, 
),, 
;,, 
}-- 
app// 
.// &
UseWatchDogExceptionLogger// 
(// 
)//  
;//  !
app00 
.00 
UseHttpsRedirection00 
(00 
)00 
;00 
app11 
.11 
UseCors11 
(11 
$str11  
)11  !
;11! "
app22 
.22 
UseAuthentication22 
(22 
)22 
;22 
app33 
.33 
UseAuthorization33 
(33 
)33 
;33 
app44 
.44 
MapControllers44 
(44 
)44 
;44 
app55 
.55 
MapHealthChecksUI55 
(55 
)55 
;55 
app66 
.66 
MapHealthChecks66 
(66 
$str66 
,66 
new66 "
	Microsoft66# ,
.66, -

AspNetCore66- 7
.667 8
Diagnostics668 C
.66C D
HealthChecks66D P
.66P Q
HealthCheckOptions66Q c
{77 
	Predicate88 
=88 
_88 
=>88 
true88 
,88 
ResponseWriter99 
=99 
UIResponseWriter99 %
.99% &&
WriteHealthCheckUIResponse99& @
}:: 
):: 
;:: 
app<< 
.<< 
UseWatchDog<< 
(<< 
conf<< 
=><< 
{<< 
conf== 
.== 	
WatchPageUsername==	 
=== 
builder== $
.==$ %
Configuration==% 2
[==2 3
$str==3 O
]==O P
;==P Q
conf>> 
.>> 	
WatchPagePassword>>	 
=>> 
builder>> $
.>>$ %
Configuration>>% 2
[>>2 3
$str>>3 O
]>>O P
;>>P Q
}?? 
)?? 
;?? 
appAA 
.AA 
RunAA 
(AA 
)AA 	
;AA	 

publicCC 
partialCC 
classCC 
ProgramCC 
{CC 
}CC  
;CC  !