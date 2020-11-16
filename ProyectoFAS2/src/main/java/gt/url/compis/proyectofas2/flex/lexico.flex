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
POT             = "^"
EQ              = "="
EQEQ            = "=="
NEQ             = "!="
MYQ             = ">"
MNQ             = "<"
PIZ             = "("
PDR             = ")"
FLC             = ";"                                                           /*Final de linea con ;*/
F               = \n                                                            /*Fin de linea*/
OLOG            = (AND|OR|NOT)
MetRes          = (constructor|destructor|Principal)                            /*metodos reservados*/
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

{IDEN}              {lexeme=yytext(); ;}
