Full Semester Long Project to Design a Basic Compiler in **Java** with JFlex and Cup

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


