package gt.url.compis.proyectofas2;
import java_cup.runtime.Symbol;

%%

%class Lexico 
%unicode
%line
%cup

/*NO TOKENS*/
let            = [:jletter:]+                                                   /*Letras o palabras incluido el guion*/
letdig         = [:jletterdigit:]+                                              /*Letras con digitos */    
/* lqs            = .*                                                             Cualquier caracter excepto \n*/
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
SPC             = [ \t\f]                                                       /*Identacion o espacio blanco*/
F               = \r|\n|\r\n                                                            /*Fin de linea*/
P               = "."
COMA            = ","
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
CLEX             = "extiende"
CLPRPU          = "propiedades publicas"
CLPRPT          = "propiedades protegidas"
CLPRPV          = "propiedades privadas"
CLMTPU          = "metodos publicos"
CLMTPT          = "metodos protegidos"
CLMTPV          = "metodos privados"
CLIN            = "instanciar"
FRD             = "desde"
FRM             = "mientras"
FRH             = "hacer"
FRINC           = "incrementar"
FRDEC           = "decrementar"
RD              = "leer"
WT              = "escribir"
NBOOL           = "TRUE"|"FALSE"
NUM             = 0|(-?)[1-9][0-9]* 
NMCL            = [A-Z][a-zA-Z0-9_]+

NUMR            = (-?)[0-9]+{P}[0-9]+                                           /*Numeros reales*/
IDEN            = {let}({NUM}?{let}?)*                              
CADTXT          = {com}({let}|{SPC}|{letdig}|{lqs2})*{com}                       /*Cadenas de texto*/
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

{COMENTARIO}    { }
{F}             { }

{NUM}           {return new Symbol( sym.NUM, yyline +1, yycolumn +1, yytext() );}
{SPC}           {return new Symbol(sym.SPC, yyline +1, yycolumn +1, yytext());}
{P}             {return new Symbol(sym.P, yyline +1, yycolumn +1, yytext());}   
{COMA}          {return new Symbol(sym.COMA, yyline +1, yycolumn +1, yytext());}      
{INCR}          {return new Symbol(sym.INCR, yyline +1, yycolumn +1, yytext());}
{DECR}          {return new Symbol(sym.DECR, yyline +1, yycolumn +1, yytext());}    
{SUM}           {return new Symbol(sym.SUM, yyline +1, yycolumn +1, yytext());}  
{RES}           {return new Symbol(sym.RES, yyline +1, yycolumn +1, yytext());}  
{MUL}           {return new Symbol(sym.MUL, yyline +1, yycolumn +1, yytext());}  
{DIV}           {return new Symbol(sym.DIV, yyline +1, yycolumn +1, yytext());}  
{MOD}           {return new Symbol(sym.MOD, yyline +1, yycolumn +1, yytext());}  
{POT}           {return new Symbol(sym.POT, yyline +1, yycolumn +1, yytext());}    
{EQ}            {return new Symbol(sym.EQ, yyline +1, yycolumn +1, yytext());}    
{EQEQ}          {return new Symbol(sym.EQEQ, yyline +1, yycolumn +1, yytext());}    
{NEQ}           {return new Symbol(sym.NEQ, yyline +1, yycolumn +1, yytext());}    
{MYQ}           {return new Symbol(sym.MYQ, yyline +1, yycolumn +1, yytext());}    
{MNQ}           {return new Symbol(sym.MNQ, yyline +1, yycolumn +1, yytext());}
{PIZ}           {return new Symbol(sym.PIZ, yyline +1, yycolumn +1, yytext());}
{PDR}           {return new Symbol(sym.PDR, yyline +1, yycolumn +1, yytext());}
{DSP}           {return new Symbol(sym.DSP, yyline +1, yycolumn +1, yytext());}
{FLC}           {return new Symbol(sym.FLC, yyline +1, yycolumn +1, yytext());}
{OLOG}          {return new Symbol(sym.OLOG, yyline +1, yycolumn +1, yytext());}
{MetRes}        {return new Symbol(sym.MetRes, yyline +1, yycolumn +1, yytext());}   
{METPRIN}       {return new Symbol(sym.METPRIN, yyline +1, yycolumn +1, yytext());}   
{INT}           {return new Symbol(sym.INT, yyline +1, yycolumn +1, yytext());}
{STRING}        {return new Symbol(sym.STRING, yyline +1, yycolumn +1, yytext());}    
{BOOL}          {return new Symbol(sym.BOOL, yyline +1, yycolumn +1, yytext());}
{FLOAT}         {return new Symbol(sym.FLOAT, yyline +1, yycolumn +1, yytext());}
{IMP}           {return new Symbol(sym.IMP, yyline +1, yycolumn +1, yytext());}
{IF}            {return new Symbol(sym.IF, yyline +1, yycolumn +1, yytext());}
{THN}           {return new Symbol(sym.THN, yyline +1, yycolumn +1, yytext());}
{ELS}           {return new Symbol(sym.ELS, yyline +1, yycolumn +1, yytext());}
{RETN}          {return new Symbol(sym.RETN, yyline +1, yycolumn +1, yytext());}
{CL}            {return new Symbol(sym.CL, yyline +1, yycolumn +1, yytext());}
{CLEX}          {return new Symbol(sym.CLEX, yyline +1, yycolumn +1, yytext());}    
{CLPRPU}        {return new Symbol(sym.CLPRPU, yyline +1, yycolumn +1, yytext());}
{CLPRPT}        {return new Symbol(sym.CLPRPT, yyline +1, yycolumn +1, yytext());}
{CLPRPV}        {return new Symbol(sym.CLPRPV, yyline +1, yycolumn +1, yytext());}
{CLMTPU}        {return new Symbol(sym.CLMTPU, yyline +1, yycolumn +1, yytext());}
{CLMTPT}        {return new Symbol(sym.CLMTPT, yyline +1, yycolumn +1, yytext());}    
{CLMTPV}        {return new Symbol(sym.CLMTPV, yyline +1, yycolumn +1, yytext());}            
{CLIN}          {return new Symbol(sym.CLIN, yyline +1, yycolumn +1, yytext());}
{FRD}           {return new Symbol(sym.FRD, yyline +1, yycolumn +1, yytext());}
{FRM}           {return new Symbol(sym.FRM, yyline +1, yycolumn +1, yytext());}
{FRH}           {return new Symbol(sym.FRH, yyline +1, yycolumn +1, yytext());}
{FRINC}         {return new Symbol(sym.FRINC, yyline +1, yycolumn +1, yytext());}
{FRDEC}         {return new Symbol(sym.FRDEC, yyline +1, yycolumn +1, yytext());}
{RD}            {return new Symbol(sym.RD, yyline +1, yycolumn +1, yytext());}
{WT}            {return new Symbol(sym.WT, yyline +1, yycolumn +1, yytext());}
{NBOOL}         {return new Symbol(sym.NBOOL, yyline +1, yycolumn +1, yytext());}
{NMCL}          {return new Symbol(sym.NMCL, yyline +1, yycolumn +1, yytext());}
{NUMR}          {return new Symbol(sym.NUMR, yyline +1, yycolumn +1, yytext());}
{IDEN}          {return new Symbol(sym.IDEN, yyline +1, yycolumn +1, yytext());}
{CADTXT}        {return new Symbol(sym.CADTXT, yyline +1, yycolumn +1, yytext());}
{FcF}           {return new Symbol(sym.FcF, yyline +1, yycolumn +1, yytext());}
{FcI}           {return new Symbol(sym.FcI, yyline +1, yycolumn +1, yytext());}
{FcB}           {return new Symbol(sym.FcB, yyline +1, yycolumn +1, yytext());} 
{SEN}           {return new Symbol(sym.SEN, yyline +1, yycolumn +1, yytext());}
{COS}           {return new Symbol(sym.COS, yyline +1, yycolumn +1, yytext());}
{TAN}           {return new Symbol(sym.TAN, yyline +1, yycolumn +1, yytext());}
{LOG}           {return new Symbol(sym.LOG, yyline +1, yycolumn +1, yytext());}
{SQRT}          {return new Symbol(sym.SQRT, yyline +1, yycolumn +1, yytext());}

.    { System.out.println("Error Lexico " + (yyline+1) + " " + (yycolumn+1) + " " + yytext() ); }