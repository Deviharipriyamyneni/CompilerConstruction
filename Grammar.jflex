import java_cup.runtime.*;

%%

%cup
%line
%column
%unicode
%class Lexer

%{

Symbol newSym(int tokenId) {
	return new Symbol(tokenId, yyline, yycolumn);
}

Symbol newSym(int tokenId, Object value) {
	return new Symbol(tokenId, yyline, yycolumn, value);
}
 
%} 

slash	= \\
letter	= [A-Za-z]
digit	= [0-9]
id	= {letter}[{letter}{digit}]*

intlit	= {digit}+
floatlit = {intlit}\.{intlit}
char = [^\\\n\t\"\']|\\.
str = {char}*
charlit = \'{char}\'
strlit = \"{str}\"

comment	= {slash}{slash}.*\n
multi_comment = {slash}\*(\\[^\*]|[^\\])*\*{slash}
whitespace = [ \n\t\r]



%%
//Lex Rules

class					{return newSym(sym.CLASS, "class");}
else					{return newSym(sym.ELSE, "else");}
if						{return newSym(sym.IF, "if");}
while					{return newSym(sym.WHILE, "while");}
return 				    {return newSym(sym.RETURN, "return");}
";"						{return newSym(sym.SEMICOLON, ";");}
"="   					{return newSym(sym.ASSIGN, "=");}
","						{return newSym(sym.COMMA, ",");}
"("						{return newSym(sym.PARENTHASIS_OPEN, "(");}
")"						{return newSym(sym.PARENTHASIS_CLOSE, ")");}
"["						{return newSym(sym.BRACKET_OPEN, "[");}
"]"						{return newSym(sym.BRACKET_CLOSE, "]");}
"{"						{return newSym(sym.CURLY_BRACKET_OPEN, "{");}
"}"						{return newSym(sym.CURLY_BRACKET_CLOSE, "}");}
"~"						{return newSym(sym.NOT, "~");}
"?"						{return newSym(sym.QUESTION, "?");}
":"						{return newSym(sym.COLON, ":");}
read					{return newSym(sym.READ, "read");}
print					{return newSym(sym.PRINT, "print");}
printline			    {return newSym(sym.PRINTLN, "printline");}
"++"					{return newSym(sym.INCREMENT, "++");}
"--"					{return newSym(sym.DECREMENT, "--");}
"*"						{return newSym(sym.MULTIPLY, "*");}
"/"						{return newSym(sym.DIVIDE, "/");}
"+"						{return newSym(sym.PLUS, "+");}
"-"						{return newSym(sym.MINUS, "-");}
"<"						{return newSym(sym.LESSTHAN, "<");}
">"						{return newSym(sym.GREATERTHAN, ">");}
"=="					{return newSym(sym.EQUAL, "==");}
"<="					{return newSym(sym.LESSTHAN_OR_EQUAL, "<=");}
">="					{return newSym(sym.GREATERTHAN_OR_EQUAL, ">=");}
"<>"					{return newSym(sym.NOTEQUAL, "<>");}
"||"					{return newSym(sym.OR, "||");}
"&&"					{return newSym(sym.AND, "&&");}
true					{return newSym(sym.TRUE, "true");}
false					{return newSym(sym.FALSE, "false");}
void					{return newSym(sym.VOID, "void");}
int						{return newSym(sym.INT, "int");}
float					{return newSym(sym.FLOAT, "float");}
bool					{return newSym(sym.BOOL, "bool");}
char					{return newSym(sym.CHAR, "char");}
final					{return newSym(sym.FINAL, "final");}
{intlit}				{return newSym(sym.INTLITERAL, yytext());}
{floatlit}				{return newSym(sym.FLOATLITERAL, yytext());}
{charlit}				{return newSym(sym.CHARLITERAL, yytext());}
{strlit}				{return newSym(sym.STRINGLITERAL, yytext());}
{id}					{return newSym(sym.ID, yytext());}
{whitespace}			{/* whitespace */}
{comment}				{/* comment */}
{multi_comment}  		{/* multiline comment */}

. {System.out.println("Illegal character, " + yytext() + " line:" + yyline + " col:" + yychar);}
 
