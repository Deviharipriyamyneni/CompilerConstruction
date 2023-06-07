Full Semester Long Project to Design a Basic Compiler in **Java** with JFlex and Cup

Grammar -

Program → class id { Memberdecls }
Memberdecls → class id { Memberdecls }
Fielddecls  → Fielddecl Fielddecls | λ
Methoddecls → Methoddecl Methoddecls | λ
Fielddecl → Optionalfinal Type id Optionalexpr ; | Typeid[intlit];
Optionalfinal → final | λ
Optionalexpr → =Expr|λ 
Methoddecl → Returntype id ( Argdecls ) { Fielddecls Stmts } Optionalsemi
Optionalsemi → ;|λ
Returntype → Type|void
Type → int|char|bool|float
Argdecls → ArgdeclList|λ
ArgdeclList → Argdecl , ArgdeclList | Argdecl
Argdecl → Typeid|Typeid[]
Stmts → Stmt Stmts | λ
Stmt → if ( Expr ) Stmt OptionalElse | while ( Expr ) Stmt | Name = Expr ; | read ( Readlist ) ; | print ( Printlist ) ; | printline ( Printlinelist ) ; | id();|id(Args);|return;|returnExpr;|Name++;|Name--; | { Fielddecls Stmts } Optionalsemi

OptionalElse  → else Stmt | λ
Name → id|id[Expr]
Args → Expr , Args | Expr
Readlist → Name , Readlist | Name
Printlist  → Expr , Printlist | Expr
Printlinelist  → Printlist | λ
Expr  → Name|id()|id(Args)|intlit|charlit|strlit|floatlit|true|false|(Expr)|~Expr|-Expr|+Expr|(Type)Expr|Expr Binaryop Expr | ( Expr ? Expr : Expr )
Binaryop  → *|/|+|-|<|>|<=|>=|==|<>|\|\||&&

few additional rules that are important to note:
● an identifier has a leading letter followed by zero or more letters or digits
● an integer literal has a digit followed by zero or more digits
● a character literal begins with a ', is followed by a single character description and then is
terminated by a ', a single character description can be any legal character other than ' or \, to signify those characters they should begin with a \, as in '\'' or '\\', some special characters include '\t' (tab character), '\n' (newline character)
● a floating point literal consists of one or more digits, followed by a decimal point (.), followed by one or more digits
● a string literal begins with a ", is followed by zero or more string characters and ends with a ", the string characters cannot include a newline character, a tab character, a backslash character or a double quote directly, these must be signified using \ (as in \n for newline, \t for tab character, \\ for backslash and \"), so "ab\tcd\n\"" is a string consisting of an a, b, tab character, c, d, newline character and a double quote character
● white space includes space, newline, return and tab characters
● comments are included as follows:
○ on any line the characters \\ start a comment that is ended at the end of that line
○ \* opens a comment that continues until the first occurrence of *\

   

## Running
> All files in the **testfiles and p3tests** directory are used for the make tests.

`make lexerTests` prints tokens lexed by the compiler

`make parserTests` prints the code back in the structure as it was parsed into an AST

`make typeCheckingTests` prints the parser results plus the result of typechecking the AST

you can find all the outputs of Project 3 in **typeCheckingTestOutputs.txt**

if **make** is not working, following are the commands we need to run
Commands to run:
jflex grammar.jflex
java java_cup.MainDrawTree tokens.cup
javac *.java
java TypeChecking badDec.as 
java TypeChecking badInc.as
java TypeChecking badNegation.as
java TypeChecking badString.as
java TypeChecking badTernaryCond.as
java TypeChecking badTernaryTypes.as
java TypeChecking boolToFloat.as
java TypeChecking boolToInt.as
java TypeChecking callNonExistFunc.as
java TypeChecking charToFloat.as
java TypeChecking charToInt.as
java TypeChecking floatToInt.as
java TypeChecking fullValidProgramDE.as
java TypeChecking incompatBinary.as
java TypeChecking intArrayToBoolArray.as
java TypeChecking noReturn.as
java TypeChecking reassignFinal.as
java TypeChecking redefMethod.as
java TypeChecking redefVar.as
java TypeChecking redefVar.as
java TypeChecking returnTypeBad.as

java TypeChecking [YourFilename.Extension] //if you want to test any other files please use this command and place the file name
TypeChecking.java - Our main file for this part of the project 3
and when you run the above commands the output will be displayed on command window


