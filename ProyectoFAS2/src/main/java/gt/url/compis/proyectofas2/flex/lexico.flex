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
SPC             = [ \t\f]                                                       /*Identacion o espacio blanco*/
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
F               = \r|\n|\r\n                                                            /*Fin de linea*/
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
NMCL            = [A-Z][a-zA-Z0-9_]+

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
{NUM}           {return new Symbol(sym.NUM);}

{SPC}           {return new Symbol(sym.SPC);}
{P}             {return new Symbol(sym.P);}    
{INCR}          {return new Symbol(sym.INCR);}
{DECR}          {return new Symbol(sym.DECR);}    
{SUM}           {return new Symbol(sym.SUM);}  
{RES}           {return new Symbol(sym.RES);}  
{MUL}           {return new Symbol(sym.MUL);}  
{DIV}           {return new Symbol(sym.DIV);}  
{MOD}           {return new Symbol(sym.MOD);}  
{POT}           {return new Symbol(sym.POT);}    
{EQ}            {return new Symbol(sym.EQ);}    
{EQEQ}          {return new Symbol(sym.EQEQ);}    
{NEQ}           {return new Symbol(sym.NEQ);}    
{MYQ}           {return new Symbol(sym.MYQ);}    
{MNQ}           {return new Symbol(sym.MNQ);}
{PIZ}           {return new Symbol(sym.PIZ);}
{PDR}           {return new Symbol(sym.PDR);}
{DSP}           {return new Symbol(sym.DSP);}
{FLC}           {return new Symbol(sym.FLC);}
{F}             {return new Symbol(sym.F);}
{OLOG}          {return new Symbol(sym.OLOG);}
{MetRes}        {return new Symbol(sym.MetRes);}   
{METPRIN}       {return new Symbol(sym.METPRIN);}   
{INT}           {return new Symbol(sym.INT);}
{STRING}        {return new Symbol(sym.STRING);}    
{BOOL}          {return new Symbol(sym.BOOL);}
{FLOAT}         {return new Symbol(sym.FLOAT);}
{IMP}           {return new Symbol(sym.IMP);}
{IF}            {return new Symbol(sym.IF);}
{THN}           {return new Symbol(sym.THN);}
{ELS}           {return new Symbol(sym.ELS);}
{RETN}          {return new Symbol(sym.RETN);}
{CL}            {return new Symbol(sym.CL);}
{CLEX}          {return new Symbol(sym.CLEX);}    
{CLPR}          {return new Symbol(sym.CLPR);}
{CLPRPU}        {return new Symbol(sym.CLPRPU);}
{CLPRPT}        {return new Symbol(sym.CLPRPT);}
{CLPRPV}        {return new Symbol(sym.CLPRPV);}
{CLMT}          {return new Symbol(sym.CLMT);}
{CLMTPU}        {return new Symbol(sym.CLMTPU);}
{CLMTPT}        {return new Symbol(sym.CLMTPT);}    
{CLMTPV}        {return new Symbol(sym.CLMTPV);}            
{CLIN}          {return new Symbol(sym.CLIN);}
{FRD}           {return new Symbol(sym.FRD);}
{FRM}           {return new Symbol(sym.FRM);}
{FRH}           {return new Symbol(sym.FRH);}
{FRINC}         {return new Symbol(sym.FRINC);}
{FRDEC}         {return new Symbol(sym.FRDEC);}
{RD}            {return new Symbol(sym.RD);}
{WT}            {return new Symbol(sym.WT);}
{NBOOL}         {return new Symbol(sym.NBOOL);}
{NMCL}          {return new Symbol(sym.NMCL);}
{NUMR}          {return new Symbol(sym.NUMR);}
{IDEN}          {return new Symbol(sym.IDEN);}
{CADTXT}        {return new Symbol(sym.CADTXT);}
{FcF}           {return new Symbol(sym.FcF);}
{FcI}           {return new Symbol(sym.FcI);}
{FcB}           {return new Symbol(sym.FcB);} 
{SEN}           {return new Symbol(sym.SEN);}
{COS}           {return new Symbol(sym.COS);}
{TAN}           {return new Symbol(sym.TAN);}
{LOG}           {return new Symbol(sym.LOG);}
{SQRT}          {return new Symbol(sym.SQRT);}

.               {return new Symbol(sym.error); }