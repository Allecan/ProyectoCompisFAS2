package gt.url.compis.proyectofas2;
import java_cup.runtime.Symbol;

%%
%class Lexico 
%line
%cup

%{
    public String lexeme;
%}

/*NO TOKENS*/
let            = [:jletter:]+                                                   /*Letras o palabras incluido el guion*/
letdig         = [:jletterdigit:]+                                              /*Letras con digitos */    
lqs            = .*                                                             /*Cualquier caracter excepto \n*/
lqs2           = [\\!\\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\>\\=\\?\\@\\[\\]\\{\\}\\`\\~\\|]+  
com            = \"
entrada        = [^\r\n]
contenido      = ( [^*] | \*+ [^/*] )*
terminacion    = \r|\n|\r\n
ctipo1         = "/*" [^*] ~"*/" | "/*" "*"+ "/"                                /*tipo 1 de comentario*/
ctipo2         = "//" {entrada}* {terminacion}?                                 /*tipo 2 de comentario*/
ctipo3         = "/**" {contenido} "*"+ "/"                                     /*tipo 3 de comentario*/    

COMENTARIO     = {ctipo1} | {ctipo2} | {ctipo3}


/*TOKENS*/
SPC             = [ \t\f]+                                                       /*Identacion o espacio blanco*/
P               = "."
INCR            = "++"
DECR            = "--"
SUM             = "+"
RES             = "-"
MUL             = "*"
DIV             = "/"
MOD             = "%"
POT             = "^"
EQ              = "="
EQEQ            = "=="
NEQ             = "!="
MYQ             = ">"
MNQ             = "<"
PIZ             = "("
PDR             = ")"
DSP             = ":"
FLC             = ";"                                                           /*Final de linea con ;*/
F               = \n                                                            /*Fin de linea*/
OLOG            = (AND|OR|NOT)
MetRes          = (constructor|destructor)                                      /*metodos reservados*/
METPRIN         = "Principal"
INT             = "entero"
STRING          = "cadena"
BOOL            = "boleano"
FLOAT           = "real"
IMP             = "incluir"
IF              = "si"
THN             = "entonces"
ELS             = "sino"
RETN            = "devolver"
CL              = "clase"
CLEX            = "extiende"
CLPR            = "propiedades"
CLPRPU          = "publicas"
CLPRPT          = "protegidas"
CLPRPV          = "privadas"
CLMT            = "metodos"
CLMTPU          = "publicos"
CLMTPT          = "protegidos"
CLMTPV          = "privados"
CLIN            = "instanciar"
FRD             = "desde"
FRM             = "mientras"
FRH             = "hacer"
FRINC           = "incrementar"
FRDEC           = "decrementar"
RD              = "leer"
WT              = "escribir"
NBOOL           = 1|0
NUM             = 0|(-?)[1-9][0-9]* 

NUMR            = (-?)[0-9]+{P}[0-9]+                                           /*Numeros reales*/
IDEN            = {let}({NUM}?{let}?)*                              
CADTXT          = {com}({let}|{SPC}|{letdig}|{lqs})*{com}                       /*Cadenas de texto*/
FcF             = {FLOAT}{SPC}"cadenaAreal"                                     /*Funciones especiales*/
FcI             = {INT}{SPC}"cadenaAentero"
FcB             = {BOOL}{SPC}"cadenaAboleano"
SEN             = {FLOAT}{SPC}"seno"
COS             = {FLOAT}{SPC}"coseno"
TAN             = {FLOAT}{SPC}"tangente"
LOG             = {FLOAT}{SPC}"logaritmo"
SQRT            = {FLOAT}{SPC}"raiz"                                            /*Funciones especiales*/

/*ERRORES TOKENS*/
NoIdes = ({lqs2}|{NUM}){IDEN} | {IDEN}{lqs2}

%%

{SPC}           {lexeme=yytext(); return new Symbol(sym.SPC);}
{P}             {lexeme=yytext(); return new Symbol(sym.P);}    
{INCR}          {lexeme=yytext(); return new Symbol(sym.INCR);}
{DECR}          {lexeme=yytext(); return new Symbol(sym.DECR);}    
{SUM}           {lexeme=yytext(); return new Symbol(sym.SUM);}  
{RES}           {lexeme=yytext(); return new Symbol(sym.RES);}  
{MUL}           {lexeme=yytext(); return new Symbol(sym.MUL);}  
{DIV}           {lexeme=yytext(); return new Symbol(sym.DIV);}  
{MOD}           {lexeme=yytext(); return new Symbol(sym.MOD);}  
{POT}           {lexeme=yytext(); return new Symbol(sym.POT);}    
{EQ}            {lexeme=yytext(); return new Symbol(sym.EQ);}    
{EQEQ}          {lexeme=yytext(); return new Symbol(sym.EQEQ);}    
{NEQ}           {lexeme=yytext(); return new Symbol(sym.NEQ);}    
{MYQ}           {lexeme=yytext(); return new Symbol(sym.MYQ);}    
{MNQ}           {lexeme=yytext(); return new Symbol(sym.MNQ);}
{PIZ}           {lexeme=yytext(); return new Symbol(sym.PIZ);}
{PDR}           {lexeme=yytext(); return new Symbol(sym.PDR);}
{DSP}           {lexeme=yytext(); return new Symbol(sym.DSP);}
{FLC}           {lexeme=yytext(); return new Symbol(sym.FLC);}
{F}             {lexeme=yytext(); return new Symbol(sym.F);}
{OLOG}          {lexeme=yytext(); return new Symbol(sym.OLOG);}
{MetRes}        {lexeme=yytext(); return new Symbol(sym.MetRes);}   
{METPRIN}       {lexeme=yytext(); return new Symbol(sym.METPRIN);}   
{INT}           {lexeme=yytext(); return new Symbol(sym.INT);}
{STRING}        {lexeme=yytext(); return new Symbol(sym.STRING);}    
{BOOL}          {lexeme=yytext(); return new Symbol(sym.BOOL);}
{FLOAT}         {lexeme=yytext(); return new Symbol(sym.FLOAT);}
{IMP}           {lexeme=yytext(); return new Symbol(sym.IMP);}
{IF}            {lexeme=yytext(); return new Symbol(sym.IF);}
{THN}           {lexeme=yytext(); return new Symbol(sym.THN);}
{ELS}           {lexeme=yytext(); return new Symbol(sym.ELS);}
{RETN}          {lexeme=yytext(); return new Symbol(sym.RETN);}
{CL}            {lexeme=yytext(); return new Symbol(sym.CL);}
{CLEX}          {lexeme=yytext(); return new Symbol(sym.CLEX);}    
{CLPR}          {lexeme=yytext(); return new Symbol(sym.CLPR);}
{CLPRPU}        {lexeme=yytext(); return new Symbol(sym.CLPRPU);}
{CLPRPT}        {lexeme=yytext(); return new Symbol(sym.CLPRPT);}
{CLPRPV}        {lexeme=yytext(); return new Symbol(sym.CLPRPV);}
{CLMT}          {lexeme=yytext(); return new Symbol(sym.CLMT);}
{CLMTPU}        {lexeme=yytext(); return new Symbol(sym.CLMTPU);}
{CLMTPT}        {lexeme=yytext(); return new Symbol(sym.CLMTPT);}    
{CLMTPV}        {lexeme=yytext(); return new Symbol(sym.CLMTPV);}            
{CLIN}          {lexeme=yytext(); return new Symbol(sym.CLIN);}
{FRD}           {lexeme=yytext(); return new Symbol(sym.FRD);}
{FRM}           {lexeme=yytext(); return new Symbol(sym.FRM);}
{FRH}           {lexeme=yytext(); return new Symbol(sym.FRH);}
{FRINC}         {lexeme=yytext(); return new Symbol(sym.FRINC);}
{FRDEC}         {lexeme=yytext(); return new Symbol(sym.FRDEC);}
{RD}            {lexeme=yytext(); return new Symbol(sym.RD);}
{WT}            {lexeme=yytext(); return new Symbol(sym.IDEN);}
{NBOOL}         {lexeme=yytext(); return new Symbol(sym.NBOOL);}
{NUM}           {lexeme=yytext(); return new Symbol(sym.NUM);}
{NUMR}          {lexeme=yytext(); return new Symbol(sym.NUMR);}
{IDEN}          {lexeme=yytext(); return new Symbol(sym.IDEN);}
{CADTXT}        {lexeme=yytext(); return new Symbol(sym.CADTXT);}
{FcF}           {lexeme=yytext(); return new Symbol(sym.FcF);}
{FcI}           {lexeme=yytext(); return new Symbol(sym.FcI);}
{FcB}           {lexeme=yytext(); return new Symbol(sym.FcB);} 
{SEN}           {lexeme=yytext(); return new Symbol(sym.SEN);}
{COS}           {lexeme=yytext(); return new Symbol(sym.COS);}
{TAN}           {lexeme=yytext(); return new Symbol(sym.TAN);}
{LOG}           {lexeme=yytext(); return new Symbol(sym.LOG);}
{SQRT}          {lexeme=yytext(); return new Symbol(sym.SQRT);}
 .              { return new Symbol(sym.error); }