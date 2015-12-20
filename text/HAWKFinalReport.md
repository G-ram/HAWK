![HAWK](http://static.greatbigcanvas.com/images/square/national-geographic/a-red-tail-hawk,1407681.jpg?max=128)
# HAWK Final Report
## **HTML is All We Know**

#### Team Members
- Graham Gobieski (gsg2120)
- George Yu (gy2206)
- Ethan Benjamin (eb2947) 
- Justin Chang (jc4137) 
- Jon Adelson (jma2215)

##0. Contents

* 1 Introduction
* 2 Code Samples
* 3 Language Reference Manual
	* 3.1 Lexical Conventions
		* 3.1.1 Tokens
		* 3.1.2 Comments
		* 3.1.3 Identifiers 
		* 3.1.4 Keywords
		* 3.1.5 Constants
			* 3.1.5.A Integer Constants
			* 3.1.5.B Double Constants
			* 3.1.5.C String Literals
			* 3.1.5.D Table Literals
		* 3.1.6 Patterns
			* 3.1.6.A CSS Selectors
				* 3.1.6.A.1 CSS Selectors
				* 3.1.6.A.2 Simple Selector Sequences
				* 3.1.6.A.3 Type Selectors
				* 3.1.6.A.4 Property Selectors
				* 3.1.6.A.5 Combinators
				* 3.1.6.A.6 Examples
			* 3.3.6.B Regex
	* 3.2 Syntax Notation
		* 3.2.1 Meaning of Identifiers/Variables
		* 3.2.2 Storage Scope
		* 3.2.3 Basic Types
		* 3.2.4 Automatic Conversions
			* 3.2.4.A Promotion of Integers in Mixed Arithmetic Expressions
			* 3.2.4.B String Conversion in String Concatentation Expressions
	* 3.3 Expressions
		* 3.3.1 Primary Expressions
		* 3.3.2 Postfix Expressions
			* 3.3.2.A Table References
			* 3.3.2.B Function Calls
		* 3.3.3 Unary Operators
			* 3.3.3.A Unary Minus Operator
		* 3.3.4 Multiplicative Operators
		* 3.3.5 Additive Operators
		* 3.3.6 Relational Operators
		* 3.3.7 Equality Operators
		* 3.3.8 Logical AND Operators
		* 3.3.9 Logical OR Operators
		* 3.3.10 Constant Expressions
		* 3.3.11 Built-In Functions
	* 3.4 Declarators
		* 3.4.1 Function Declarators
	* 3.5 Statements
		* 3.5.1 Expression Statements
		* 3.5.2 Assignment Statements
		* 3.5.3 Compound Statements
		* 3.5.4 Conditional Statements
		* 3.5.5 while Statements
		* 3.5.6 return Statements
		* 3.5.7 Pattern Statement
		* 3.5.8 BEGIN Statement
		* 3.5.9 END Statement
	* 3.6 Program Structure
		* 3.6.1 General Structure
			* 3.6.1.A Begin Section
			* 3.6.1.B Pattern Section
			* 3.6.1.C End Section
	* 3.7 Example Programs
		* 3.7.1 Sample 1: General Syntax
		* 3.7.2 Sample 2: CSS Selectors
		* 3.7.3 Sample 3: Regex
	* 3.8 References
		* 3.8.1 AWK Language Reference Manual
		* 3.8.2 C Language Reference Manual
		* 3.8.3 CSS Reference Manual
		* 3.8.4 Lua Language Reference Manual
		* 3.8.5 POSIX Reference Manual
* 4 Project Plan
	* 4.1 Process
		* 4.1.1 Planning Process
		* 4.1.2 Specification Process
		* 4.1.3 Development Process
		* 4.1.4 Testing Process
	* 4.2 Team Responsibilities
	* 4.3 Programming Style Guide
	* 4.4 Software Development Environment
	* 4.5 Timeline
* 5 Architectural Design
	* 5.1 Block Diagram
* 6 Test Plan
	* 6.1 Source to Target 
	* 6.2 Test Suite 
	* 6.3 Test Automation
* 7 Lessons Learned
	* 7.1 Graham Gobieski
	* 7.2 George Yu
	* 7.3 Ethan Benjamin
	* 7.4 Justin Chang
	* 7.5 Jon Adelson


## 1. Introduction

As of 2015 there are over one billion websites. The vast wealth of information contained by the internet motivates the creation of "web scraping" software, whose purpose is to to analyze websites and extract pertinent information from them.

Websites hold their information in the structure of an HTML document. To find information in a web page, a developer can either traverse the structure of the document (through CSS selectors, XPath, or related XML techniques) or treat the document as a raw string and use technqiues like regular expression search. Typically, effective web scraping applications require a mix of different approaches. This often necessitates combining a variety of libraries which have mutually inconsistent abstractions. 

Furthermore, many web scrapers share a common workflow which requires a certain amount of boilerplate in most programming languages. In particular, web scraping often consists of finding all parts of a web document which match a certain criteria, and then taking a relevant action.

HAWK—**H**TML is **A**ll **W**e **K**now aims to make web scraping easy by unifying disparate pattern matching techniques under a single abstraction and making the commonly used pattern-action workflow of web scrapers an integral part of the language. We are heavily inspired by AWK's pattern-action mechanism as well as its syntactic simplicity. Just as AWK greatly simplified information extraction in text documents, we hope to do the same for web documents. 

HAWK aims to deliver both concision and type safety to developers. To this end, HAWK is statically typed and has full type inference. The current implementation of HAWK generates Java code, which is then compiled to Java Bytecode and run a Java Virtual Machine. 

## 2. Code Samples
HAWK uses a syntax that is very similar to the syntax of AWK. There is a BEGIN block and an END block, which respectively start and end each program, and between the two blocks are any number of pattern-action blocks.

Below is a general program with no pattern matching done on its input. This simply creates a table of integers, increments each of its odd elements by 1, and prints the elements in the table.

### 2.1 General Syntax

```
BEGIN{
    table = {1, 2, 3, 4, 5, 6};
	keyValueTable = {"oddSum":0,"evenSum":0};
	
    i = 0;
    while(i < length(table)){
		if(table[i] % 2 == 1){
        		table[i] = table[i] + 1;
				keyValueTable["oddSum"] = keyValueTable["oddSum"] + i;
		}
		else{
			keyValueTable["evenSum"] = keyValueTable["evenSum"] + i;
		}
    }
}
END{
    print(table);
}
```

### 2.2 CSS Selectors

HAWK is built to parse HTML documents; it can do this by either searching for CSS patterns or by searching for regex. Each item that is found is stored as a table containing the id, attributes, and the id of the next child, if they exist. All element tables go into a table called this,  Say I wanted to print out the inner HTML of each element with class .get-me; here is how it would be done:

```
BEGIN{ }
[@.get-me@]{
    print(this["innerhtml"]);
}
END{ }
```

### 2.3 Regex Patterns

Here is a HAWK program that uses a regex pattern. Say we wanted to look for the heights of certain objects in feet. We can use a regex pattern to find these like so:

```
BEGIN{ }
[/ ['0'-'9']+ ft /]{ 
    height = int_to_string(this);
    if( height >= 14000 && height <=15000){
        print("found");
    }
}
END{ }
```

## 3. Language Reference Manual

### 3.1 Lexical Conventions

#### 3.1.1 Tokens

There are several tokens in HAWK: identifiers, keywords, constants, operators, and patterns. Whitespace and comments are ignored except as separators of tokens.

#### 3.1.2 Comments

Use /\* to begin a comment, and terminate it with \*/. Comments can extend across multiple lines. Comments cannot be nested.

#### 3.1.3 Identifiers

An identifier is a sequence of letters, digits, dashes, and underscores. Uppercase and lowercase letters are treated differently. Identifiers may have any length, and are separated from other tokens by whitespace. An identifier must have at least one letter and begin with a letter.

#### 3.1.4 Keywords

The following identifiers are keywords reserved for particular use:

* `BEGIN`  
* `END` 
* `this` 
* `fun` 
* `for` 
* `while` 
* `return` 

#### 3.1.5 Constants

There are four types of constants, described in detail below.

##### 3.1.5.A Integer Constants

An integer constant consists of a sequence of digits that does not have leading zeros. All integers in HAWK are taken to base 10. Negative integer constants consist of a sequence of digits prefixed by a dash.

##### 3.1.5.B Double Constants

A double constant consists of an integer part, decimal point, fractional part, and optional exponential part, which consists of an integer prefixed by an e. Either the integer or fractional part, but not both, may be missing. Both integer and fractional parts are themselves integers, separated by the decimal point. The decimal point must be present. 

##### 3.1.5.C String Literals

A string literal is a sequence of characters surround by double quotes. HAWK contains several escape sequences which can be used as characters within string literals:

* newline `\n`
* tab `\t` 
* backslash `\\`
* single quote `\’`
* double quote `\”`

String literals are immutable, and thus cannot be altered. Any operations performed on a string literal will not affect the original literal but instead generate a new string.

##### 3.1.5.D Table Literals

A table literal is a comma-separated sequence delimited by curly braces. The comma-separated sequence can take two forms. 

* A sequence of values of any type — there can be different types in this sequence. However, these values have to be constants. This generates a table where the values are keyed in sequential order from the integer 0 to sequence length-1. 
* A sequence of key-value pairs written in the form key : val. As before, values can vary within a table. Keys are restricted to string types; integers are treated as strings.


#### 3.1.6 Patterns
Patterns utilize valid Regex or CSS selector syntax and are defined with special offset characters within brackets before an action block in the pattern section of the program. Please see the following sections for a discussion on what a comprises a valid CSS selector and Regex expression.

##### 3.1.6.A CSS Selector Patterns

HAWK implements a limited syntax of the standard W3 definition of CSS selectors. A CSS selector contains special syntax used to find elements in an HTML document which match particular criteria. In HAWK, a CSS selector pattern consists of a CSS selector enclosed by @ symbols which are themselves enclosed by brackets.

	[@ css-selector @]
	
###### 3.1.6.A.1 CSS Selectors

A CSS selector consists of one or more simple selector sequences chained by combinators. See below for details on simple selector sequences and combinators.

*css-selector*:

- *simple-selector-sequence*
- *simple-selector-sequence combinator css-selector*
	

###### 3.1.6.A.2 Simple Selector Sequences

A simple selector sequence consists of a single type selector, or an optional type selector followed by one or more property selectors. These are the essential building blocks of CSS selectors.

Intuitively, a type selector is used to find HTML elements with specific tags (e.g. `<div>` or `<td>` or `<span>`) while property selectors are predicates on attributes and associated values within a tag (e.g. blah1, blah2, "something1", and "something2" in `<td blah1="something" blah2="somethingelse">`).

*simple-selector-sequence*:

* *type-selector*
* *type-selector property-selector-list*
* *property-selector-list*
	
###### 3.1.6.A.3 Type Selectors

A type selector can either specify a specific tag type, or can select any tag using the universal selector. We allow matching on non-standard tag types named by any valid identifier, even those not typically supported in web browsers.

*type-selector*:

* *identifier*
* *universal-selector* 

*universal-selector*:

* &#42;
	
###### 3.1.6.A.4 Property Selectors

Property selectors are predicates on attributes and associated values within an HTML tag. 

*property-selector-list*: 

* *property-selector*
* *property-selector property-selector-list*

*property-selector*:

* *attribute-exists-selector*
* *attribute-string-selector*
* *class-selector*
* *id-selector*

Attribute existence selectors check if a tag contains a given attribute.

*attribute-exists-selector*:

* *[identifier]*
	
Attribute string matching selectors check if a tag contains a given attribute, and additionally filters for attributes whose associated values have certain string properties. Most of these are self explanatory with the exception of the whitespace separated containment selector. This selects for attribute values which, when split into a list of words by whitespace, contain the chosen word (e.g. `[years ~=  "1992"]` would match the element `<div years = "1488 1875 1992 1995"/>`.).

*attribute-string-selector*:

* *attribute-equals-selector*
* *attribute-contains-selector*
* *attribute-beginswith-selector*
* *attribute-endswith-selector*
* *attribute-whitespace-separated-contains*
	
*attribute-equals-selector*:

* [identifier = string]
	
*attribute-contains-selector*:

* [identifier *= string]
	
*attribute-beginswith-selector*:

* [identifier ^= string]
	
*attribute-endswith-selector*:

* [identifier $= string]

*attribute-whitespace-separated-contains*:

* [identifier ~= string]

*class-selector*:

* .identifier

Class selectors are used to find HTML elements whose "class" attribute contains a given value (doesn't have to be the exact value).

*id-selector*:

* \#identifier

ID Selectors are used to find HTML elements whose "id" attributes equal a given value.er


###### 3.1.6.A.5 Combinators

Combinators chain together multiple simple sequence selectors, and are used to find elements who have a certain hierarchical relation to other elements. For instance, the direct child combinator > can be used to find an element that is a direct child of another element in the HTML XML hierarchy (e.g. `@div[attr1="value1"] > span@` will find the span in `<div attr1="value1"> Blah blah blah <span></span></div>`).

*combinator*:

* *direct-child-combinator*
* *descendent-combinator*
* *direct-sibling-combinator*
* *any-sibling-combinator*
	

*direct-child-combinator*:

* \>

The direct child combinator finds elements matched by a simple selector sequence that are immediate children of elements matched by another simple selector sequence.

*descendent-combinator*:

* `\space`

The descendent combinator finds elements matched by a simple selector sequence that are descendents of elements matched by another simple selector sequence. For instance, `@div span@` will match the nested span in `<div><span></span/></div>`.

*direct-sibling-combinator*:

* +

The direct sibling combinator finds elements matched by a simple selector sequence that are the next sibling of elements matched by another simple selector sequence. For instance, `@tr + span@` will match the span in `<div><tr></tr><span><span/></div>`.

	
	
###### 3.1.6.A.6 Examples
	
* *\** : selects all elements
* *\#id* : selects all elements with an id attribute that matches the provided string 
	* **Example:** `@#first-name@` will select all elements with attribute `id=“first-name”`
* *.class* : selects all elements with a class attribute that matches the provided string
	* **Example**: `@.first-name@` will select all elements with attribute `class=“first-name”`
* *element* : selects all elements that have the provided tag name. Please see the HTML language reference manual for a complete list of valid HTML element tags.
	* **Example**: `@p@` will select for all paragraph elements
* *element1 element2* : law of the descendent. This pattern will select for all element2’s that are child elements of element1
	* **Example**: `@div #first-name@` will select for all elements with id attribute, `id=“first-name”` that are children of div elements
* *element1 > element2* : strict law of the descendent. This pattern will select for the elements that are direct children of the parent element. In other words, these children  cannot be grandchildren (elements nested within other elements)
* *element1 + element2* : selects the sibling, element2, of parent, element1
* *element1 ~ element2* : selects every element, element2, that is preceded by element1
* *[attribute]* : selects all elements with the given attribute. Example: [title] will select all elements with a title attribute
* *[attribute op value]* : selects all elements that have an attribute with a value that evaluates the expression to true.
	* *[attribute = value]* : selects elements that have attribute value equal to provided value.
	* *[attribute ~= value]* : selects elements that have an attribute value that contains provided space-separated value.
	* *[attribute |= value]* : selects elements that have an attribute value that begins with provided value.
	* *[attribute $= value]* : selects elements that have an attribute value that ends with provided value.
	* *[attribute \*= value]* : selects elements that have an attribute value that contains provided value.

Please see CSS and HTML language reference manuals for additional explanation of each selector pattern.


##### 3.1.6.B Regex Patterns
HAWK implements a limited version of the standard regex expression syntax of the AWK language. A regex expression is used to find a particular pattern in a text document using the operations defined below (please see the POSIX and AWK language reference manuals for more). Moreover, a regex expression pattern must be offset with / symbols on both sides and be contained within a bracket before an action section.

	[/.../]{
		/*action*/
	}
Regex expression operations may be combined and standard regex expression operator precedence will be assumed (see POSIX reference manual and note the order of the operators below) or order may be defined using parentheses. Below are a description of the operators implemented:

* *‘c’* : represents a single character.
* *_* : represents any character. 
* *eof* : represents the end of file character.
* *“string”* : represents a literal string of characters.
* *[‘a’ - ‘z’]* : represents a range of characters. Must be contained within a pair of brackets.
* *[‘b’ ‘c’]* : evaluates to true if current character matches any character provided within brackets.
* *^* : compliments a set of characters.
* *(pattern)* : evaluates pattern inside parentheses before patterns outside. Parentheses suggest an order of evaluation.
* *pattern\** : represents the kleene closure of a pattern with zero or more of the pattern present.
* *pattern+* : represents the kleene closure of a pattern with one or more of the pattern present.
* *pattern?* : represents a pattern that is optional.
* *pattern1 pattern2* : represents a pattern followed by a pattern.
* *pattern1 | pattern2* : represents either pattern1 or pattern2

Please see the POSIX and AWK language reference manuals for additional explanation of each regex expression operator.

### 3.2 Syntax Notation

#### 3.2.1 Meaning of Identifiers/Variables

Identifiers are names which can refer to functions, variables, and table fields. Each identifier is a string consisting of digits, letters, and underscores, and has to start with a letter.

Variables are storage locations that contain values. Depending on where in a program variables are initialized, they are either global or local to a particular scope. See Storage Scope for more details.	

HAWK is statically typed, which means that every variable has a type. The type of a variable determines the meaning and behavior of its values, and also the nature of storage needed for those values. 

#### 3.2.2 Storage Scope

The visibility of an identifier and liftetime of a variable's storage depends on where a variable is initialized. If a variable is initialized within a *BEGIN* or *END* block, it is a global variable. A global variable can be accessed by any part of the program below the global variable's initialization. It's storage stays alive throughout the entire execution of the program.

If a variable is initialized within any block other than a *BEGIN* or *END* block, it is a local variable. A local variable can be accessed within the scope it is initialized, at or below its initialization. Its storage will be destroyed at the end of the scope.

#### 3.2.3 Basic Types

There three basic types in HAWK:

* integer
* double
* string

And one parameterized type:

* table T

Where T can be any type.

Integers are 32-bit signed two's complement integer. Doubles are double-precision 64-bit IEEE 754 floating point. We will refer to doubles and integers arithmetic type. 

Strings are a sequence of 0 or more unicode characters. They are guaranteed to occupy O(n) space in memory, where n is the number of characters in the string.

Both arithmetic types and strings are immutable, which means that their value cannot be changed once they are created. When a variable with an immutable type is assigned a new value, the old value and underlying storage are destroyed. 

A table of type T is an associative array in which keys are of type string and values are of type T. Tables, unlike the immutable types, are objects and are mutable. This means that variables do not contain tables, but rather contain references to tables. Assigning a table to a variable results in that variable storing a reference to that table. Similarly, when tables are passed as parameters to functions or returned from functions, the respective parameters and return values are references. In each of these operations, there is no copying of internal table data, only copying of references. 

HAWK uses reference counting to keep track of how many variables store references to the same table. When a table no longer has any variables referencing it, the underlying storage for the table is destroyed.   

#### 3.2.4 Automatic Conversions

##### 3.2.4.A Promotion of Integers in Mixed Arithmetic Expressions

In mathematical binary expressions where one operand is an integer and the other operand is a double, the integer will be automatically converted to a double value. The conversion will be performed using the the built-in function `int_to_double`.

##### 3.2.4.B String Conversion in String Concatentation Expressions

In binary addition expressions where one operand is a string, and the other operand is not a string, the non-string will be automatically converted to a string value. Tables will be converted using `table_to_string`, integers using `int_to_string`, doubles using `double_to_string`. Using `int_to_string` or `double_to_string` on a string will convert the biggest substring starting from the front of the string that is a valid int/double into an int/double. For example, `int_to_string("123f") = 123`.

### 3.3 Expressions

The precedence of expression operations is the same as the order of the major subjections of this section. Within each subsection, operators have the same precedence. Left or right associativity will be specified in each of the subsections for each operator. 

#### 3.3.1 Primary Expressions

Primary Expressions are identifiers, constants, strings, or expressions in parentheses. 

*primary expressions*:

* *identifier*
* *constant*
* *string*
* *(expression)*

#### 3.3.2 Postfix Expressions

Operators in postfix expressions group left to right.

*postfix-expression*:

* *primary-expression*
* *postfix-expression[expression]*
* *postfix-expression(argument-expression-list)* //arglist is optional

##### 3.3.2.A Table References

A postfix expression followed by an expression in square brackets is a postfix expression denoting a subscripted table reference. The expression in square brackets must be a table key of type string, the postfix expression must be a table. The whole expression is of type table, string (the value of the value associated with the key).

##### 3.3.2.B Function Calls
A function call is a postfix expression (function designator) followed by parentheses containing a possibly empty, comma-separated list of expressions which constitute the arguments to the function. A declaration for the function must previously exist in scope. Recursive functions are permitted.

The term *argument* refers to an expression passed by a function call, the term *parameter* refers to an input object or its identifier received by the function definition. 

#### 3.3.3 Unary Operators

Expressions with unary operators group right to left.

*unary expression*:

* *postfix expresssion*
* *unary-operator unary-expression*

*unary-operator: -*

##### 3.3.3.A Unary Minus Operator 

The operand of the unary - operator must be of type int or double, and the result is the negative of its operand. An integral operand undergoes integral promotion. The type of the result is the type of the promoted operand. 

#### 3.3.4 Multiplicative Operators

The multiplicative operators \*, /, and % group left-to-right.

*multiplicative-expression*:

* *multiplicative-expression \* unary-expression*
* *multiplicative-expression / unary-expression*
* *multiplicative-expression % unary-expression*

The operands of \*, /, and % must be of type integer or double. The usual arithmetic conversions are performed on the operands.

The binary * operator denotes multiplication.

The binary / operator yields the quotient, and the % operator the remainder, of the division of the first operand by the second; if the second operand is 0, the result is undefined. Otherwise, it
is always true that (a/b)*b + a%b is equal to a. If both operands are non-negative, then the remainder is non-negative and smaller than the divisor, if not, it is guaranteed only that the absolute value of the remainder is smaller than the absolute value of the divisor. 

#### 3.3.5 Additive Operators

The additive operators + and - group left-to-right. If the operands have type int or double, the usual arithmetic conversions are performed. 

*additive-expression:*

* *multiplicative-expression*
* *additive-expression + multiplicative-expression*
* *additive-expression - multiplicative-expression*

The result of the + operator is the sum of the operands. For strings, the sum is defined as the concatenation of the two strings.

#### 3.3.6 Relational Operators

The relational operators group left-to-right. a<b<c is parsed as(a<b)<c, and evaluates to either 0 or 1.

*relational-expression:*

* *additive-expression*
* *relational-expression < additive-expression*
* *relational-expression > additive-expression*
* *relational-expression <= additive-expression*
* *relational-expression >= additive-expression*

The operators < (less), > (greater), <= (less or equal) and >= (greater or equal) all yield 0 if the specified relation is false and 1 if it is true. The type of the result is int. The usual arithmetic conversions are performed on arithmetic operands. 

#### 3.3.7 Equality Operators

*equality-expression:*

* *relational-expression*
* *equality-expression == relational-expression*
* *equality-expression != relational-expression*

The == (equal to) and the != (not equal to) operators are analogous to the relational operators except for their lower precedence. (Thus a<b == c<d is 1 whenever a<b and c<d have the
same truth-value.) 

#### 3.3.8 Logical AND Operators

*logical-AND-expression:*

* *equality-expression*
* *logical-AND-expression && equality-expression*

The && operator groups left-to-right. It returns 1 if both its operands compare unequal to zero, 0 otherwise. 

&& guarantees left-to-right evaluation: the first operand is evaluated, including all side effects; if it is equal to 0, the value of the expression is 0. Otherwise, the right operand is evaluated, and if it is equal to 0, the expression's value is 0, otherwise 1.

The operands must be of type int or double, but don't have to be of the same type.
The result is int.

#### 3.3.9 Logical OR Operators

*logical-OR-expression:*

* *logical-AND-expression* 
* *logical-OR-expression || logical-AND-expression*

The || operator groups left-to-right. It returns 1 if either of its operands compare unequal to zero, and 0 otherwise. 

|| guarantees left-to-right evaluation: the first operand is
evaluated, including all side effects; if it is unequal to 0, the value of the expression is 1. Otherwise, the right operand is evaluated, and if it is unequal to 0, the expression's value is 1, otherwise 0.

The operands must be of type int or double, but don't have to be of the same type.
The result is int. 

#### 3.3.10 Built-In Functions
HAWK includes several built-in functions that are reserved and are specially-interpreted by the compiler. These include:

* `print("...")` : prints a strings to standard output.
* `charAt(String s, Integer i)` : returns the character at index i of string s
* `exists(table[i])` : checks to see if a table element exists. Returns 1 if so, otherwise 0.
* `stringEqual(String s1, String s2)` : checks if s1 and s2 are equal. Returns 1 if so, otherwise 0.
* `length(table)` : returns the length of a table
* `keys(table)` : returns a table containing every key of the passed table. The returned table uses the index as a the key and the return key value as the value.
* `children()` : takes the `this` data structure and returns a table populated with the children of the found element. Only defined in CSS selector patterns.
* `inner_html()`: returns the inner_html corresponding to the element defined by `this`. Only defined in CSS selector patterns.

### 3.4 Declarators
Declarations give a specific meaning to each identifier.

declaration:

* declarator

declarator:

* identifier = expression
* fun identifier(arg-list) compound-statement

For identifier = expression, the type of identifier is the result of the expression on the RHS. If this identifier is later used in an expression, it yields a type that is the same as when it was created. You must initialize a variable when you create it.

#### 3.4.1 Function Declarators

fun identifier(arg1, arg2, ..., argn) compound-statement

The type of a function call, identifier(arg1, arg2, ..., argn), is the type of the expression in the return statement. The types of arg1, arg2,..., argn are inferred within the compound-statement. The names of arg1, arg2, ..., argn must be valid HAWK identifiers. 

All arguments to a function are call-by-value. When tables are passed as 
arguments, the reference to the table is passed by value. See the Syntax
Section for more information.

### 3.5 Statements
Statements are executed in sequence.

*statement*:

* *expression-statement*
* *assignment-statement*
* *compound-statement*
* *conditional-statement*
* *while-statement*
* *return-statement*
* *pattern-statement*
* *BEGIN compound-statement*
* *END compound-statement*

#### 3.5.1 Expression Statements
*expression-statement:*

* *expression*	

Expression statements will typically be a function call but can be any arbitrary expression. 

#### 3.5.2 Assignment Statement

*assignment-statement:*

* *identifier = expression*

Assignment statements are used to declare a variable or they
can be used to update the value of a variable that already exists. 

#### 3.5.3 Compound Statements

*compound-statement:*

* *statement-list*

*statement-list:*

* *{statement}*
* *{statement; statement-list}*

Compound statements are used to write several statements when 
one statement is expected. 

#### 3.5.4 Conditional Statement

*conditional-statement:*

* *`if` (expression) compound-statement*
* *`if` (expression) compound-statement `else` compound-statement*

The first substatement is executed if the expression is not
equal to zero, otherwise the second statement is executed. 
The second statement can either be another Conditional Statement
or a Compound Statement. 

#### 3.5.5 while Statement

*while-statement:*

* *while (expression) compound-statement*

The compound-statement is executed until the expression is not
equal to 0. 

#### 3.5.6 return Statement

*return-statement:*

* *return expression*

Return statements are only used within function bodies. 

#### 3.5.7 Pattern Statement

*pattern-statement:*

* *pattern-expression compound-statement*

Pattern is a pattern to match against and the compound-statement is executed 
each time that the patern is matched. Refer to Expressions and Program Structure sections for additional information.

#### 3.5.8 BEGIN Statement

*BEGIN compound-statement*

Refer to Expressions section for additional information.

#### 3.5.9 END Statement

*END compound-statement*

Refer to Program Structure section for additional information.


### 3.6 Program Structure

#### 3.6.1 General Structure

All programs must contain three sections: a begin section, a pattern section, and an end section. Programs must contain these in the order given and may not have more than one begin or end section. Following are a syntactic outline of such a structure and descriptions of each section.

	BEGIN{
		/*action*/
	}
	[/*pattern*/]{
		/*action*/
	}
	END{
		/*action*/
	}

##### 3.6.1.A Begin Section
This section is executed first. Functions and variables may be declared in this section and defined and made available to other sections. In other words, variables and functions defined in this section are visible in the pattern and end sections. The section may be empty and all normal syntax previously defined should be followed. 

##### 3.6.1.B Pattern Section
This section is executed in the order and has one or more pattern blocks that begin with a CSS or Regex expression in brackets and are followed by an optional-empty action. The patterns must align with the syntax provided in the following pattern sections. The action will be executed after each instance of such pattern has been found in the given file. The action block should contain normal syntax previously defined. Functions may not be defined in this section nor can patterns be nested. Relevant information returned by the pattern match can be accessed using the `this` keyword data structure. See below for further information on access to this structure.

#####*this*: 
A table of relevant information returned by the pattern. In the case of a regex expression this is simply a table containing a single element of type string. For a CSS selector, on the other hand, this table is populated with the following keys and values:

* `this["id"]`: return id of the found element
* `this["class"]`: return the class(es) of the found element
* `this[/*custom attribute*/]`: return a custom attribute of the found element. This may not exist.


##### 3.6.1.C End Section
This section is executed last after all pattern sections have been executed, this section may have include new functions and variables as well as references to previously defined (in begin or pattern sections) functions and variables. New functions and variable only are visible in the end section and normal syntax previously defined should be implemented.

### 3.7 Sample Programs

#### 3.7.1 Sample 1: General Syntax
Creates a table, adds elements to this table each time a new line is encountered and prints this table. Notice that tables are mutable and how values of a table do not have to be of the same type.

	BEGIN{
		table = {1, 2, "hello", 70, 90, 100, 100.1};
	}
	[\'\n'\]{
		table[length(table)] = table[length(table)-1]+10;
	}
	END{
		print(table);
	}
#### 3.7.2 Sample 2: CSS Selectors
Looks for a certain CSS pattern and populates a global table with a count derived from the pattern. Then it prints this table.

	BEGIN{ 
		counts = { }
	}
	￼￼[@ table . wikitable > tr @]{
		state = this["title"];
		if(exists(counts[state])){
			counts[state] = counts[state]+1;
		}else{
			counts[state] = 0;
		} 
	}
	END{
		len = length(counts) - 1;
		while(len >= 0){
			print(”STATE: ” + state + ”, COUNT: ” + counts[state]);
			len = len - 1;
		}
	￼￼￼￼}

#### 3.7.3 Sample 3: Regex
Looks for a regex expression, converts the output of the pattern to an integer and prints the integer if it satisifies a condition.

	BEGIN{ }
	[/ ['0'-'9']+ ft /]{ 
		height = int_to_string(this);
		if( height >= 14000 && height <=15000){
			print("found");
		}
	}
	END{ }

### 3.8 References
The following are helpful references that may have been previously refered to in above sections.
#### 3.8.1 AWK Language Reference Manual
HAWK was inspired by AWK and, as such, the AWK LRM is a good way to start to understand the structure and syntax of HAWK programs.

[http://www.gnu.org/software/gawk/manual/gawk.html](http://www.gnu.org/software/gawk/manual/gawk.html)

#### 3.8.2 C Language Reference Manual
HAWK grammar and syntax is very similar to C. See the C LRM as further reference material.

See *The C Programming Language 2nd Edition* by Brian Kernighan and Dennis Ritchie

#### 3.8.3 CSS Reference Manual
HAWK implements a limited set of CSS selectors. See the CSS reference manual for a fuller explanation of the implemented selectors.

[https://developer.mozilla.org/en-US/docs/Web/CSS/Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)

#### 3.8.4 LUA Language Reference Manual
HAWK tables take inspiration from Lua tables. See the Lua LRM as further reference material.

[http://www.lua.org/manual/5.3/](http://www.lua.org/manual/5.3/)

#### 3.8.5 POSIX Reference Manual
HAWK implements a limited set of Regex expressions. Regex operators are further defined in the POSIX reference manual.

[https://www.gnu.org/software/guile/manual/html_node/POSIX.html](https://www.gnu.org/software/guile/manual/html_node/POSIX.html)

## 4. Project Plan 

### 4.1 Process

#### 4.1.1 Planning Process

Our overall plans were guided partially by Richard Townsend's advice and partially
by which features we knew would be difficult or easy to implement. Our plan was to make a
well-defined Language Reference Manual that would guide all language feature  
implementation, quickly get a scanner and parser up and running, and then implement 
all language features, starting with basic ones, such as integers and strings, and 
moving onto more complicated ones, such tables, functions, and CSS/regex. 

#### 4.1.2 Specification Process

We defined very clearly in our Language Reference Manual the syntax and semantics
of the language. Although we tried our best to anticipate all potential issues in 
the LRM, we did have to make certain changes to our language as the project unfolded.
For example, we had initially decided that tables could hold any particular value but 
ended up changing it so that any particular table must hold one particular type. However, the majority of the final language specification ended up being what we initially stated in the LRM. 

#### 4.1.3 Development Process 
We moved through development stages in what we viewed to be a necessary as well as 
logical order. The first things to be completed were the lexer and parser. We next built
the interface for the Semantic Abstract Syntax Tree, the semantic checker that would
return an object of type SAST, as well as the beginnings of the code generation. The rest
of the project was spent building up the SAST, and writing code to do semantic checking
and code generation for the SAST types. 

#### 4.1.4 Testing Process

We built our initial test suite immediately after creating our "hello world" program.  
All of our tests programs print out a result, which is compared to the correct output
held in a different file. We then created a program which would compile all 
of our test programs and compare the results to all of the correct outputs. As we 
caught bugs in our programs or thought of additional functionality that we wanted to 
ensure would be supported, we added more tests to the test suite. 

#### 4.2 Team Responsibilities

We ended up splitting up work primarily based on feature implementation. 

| Team Member | Feature          |
|-------------|------------------|
| Graham      | Regex            |
| Ethan       | Tables/Functions |
| George      | CSS              |
| Jon         | Functions        |
| Justin      | CSS              |


Everyone played a role in parsing, scanning, testing, semantic checking, and code generation

#### 4.3 Programming Style Guide

We tried to use consistent programming style so that each segment was easy to read for each group member, although we did not have an official guide that we required everyone to use. 

We wrote comments before each section to clarify what the purpose of each block of code was. 

#### 4.4 Software Development Environment

We used Ocaml to write our compiler, including Ocamlyacc and Ocamllex. We also used shell scripts to run our test suite. 

#### 4.5 Timeline

| Date         | Project Feature                                           |
|--------------|-----------------------------------------------------------|
| September 30 | Language Reference Manual                                 |
| October 18   | Scanner/Parser                                            |
| November 16  | Hello World code generation, testing suite created        |
| November 23  | SAST created and beginning of semantic checking           |
| December 11  | Regex complete                                            |
| December 17  | Type inference complete, functions complete, CSS complete |
| December 18  | All tests pass                                            |
| December 20  | Final Report completed                                    |


## 5. Architectural Design
### 5.1 Block Diagram
![Diagram](http://i.imgur.com/9v5bD3I.png)

## 6. Test Plan
### 6.1 Source to Target
We use the same program used in 2.1 General Syntax

Source Program:

```
BEGIN{
    table = {1, 2, 3, 4, 5, 6};
    i = 0;
    while(i < length(table)){
		if(table[i] % 2 == 1){
        		table[i] = table[i] + 1;
		}
    }
}
END{
    print(table);
}
```
Target Result:

```
import _hawk_lib.*;
public class Program {
	public static void main(String[] _args){
		_HAWKFileReader _fileReader = new _HAWKFileReader(_args);
		_HAWKRegexMatcher _regexMatcher = new _HAWKRegexMatcher(_fileReader._getConcatFile());
		_HAWKCSSMatcher _cssMatcher = new _HAWKCSSMatcher(_fileReader._getConcatFile());
		_HAWKTable<Integer> _table_ = (new _HAWKTable<Integer>()).setIntIndexChained(0,1).setIntIndexChained(1,2).setIntIndexChained(2,3).setIntIndexChained(3,4).setIntIndexChained(4,5).setIntIndexChained(5,6);
		int _i_ = 0;
		while(_i_ < _length_(_table_)){
			if(_checkIf(_table_.getIntIndex(_i_)%2 == 1)){
			_table_.setIntIndex(_i_,_table_.getIntIndex(_i_) + 1);

		}

		}

		_print_(_table_);

	}
	private static void _print_(Object o){
	  System.out.println(o);
	}
	private static String _charAt_(String s, Integer i){
	  return ""+s.charAt(i);
	}
	private static Integer _stringEqual_(String s1, String s2){
	  if(s1.equals(s2)){
	    return 1;
	  }else{
	    return 0;
	  }
	}
	private static Boolean _checkIf(Integer i){
	  return (i != 0) ? true : false;
	}
	private static Boolean _checkIf(Double d){
	  return (d != 0.0) ? true : false;
	}
	private static Boolean _checkIf(Boolean b){
	  return b;
	}
	private static <T> int _length_(_HAWKTable<T> t){
	  return t.getLength();
	}
	
	private static <T> int _exists_(T e){
	  if(e == null){
	    return 0;
	  }
	  return 1;
	}
	
	private static int _stringToInt_ (String s){
		return Integer.parseInt(s);
	}
	
	private static <T> _HAWKTable<String> _keys_(_HAWKTable<T> t){
	  java.util.Set<String> set = t.getKeys();
	  _HAWKTable<String> hawkTable = new _HAWKTable<String>();
	  int i = t.getLength()-1;
	  for (String s : set) {
	    hawkTable.setIntIndex(i, s);
	    i--;
	  }
	  return hawkTable;
	}

}
```

### 6.2 Test Suite

As we wrote the compiler, we also wrote tests for every feature we planned on including in the compiler. For each of these features, we wrote several small tests to test individual elements, such as simple operators, table literals, function calls, for loops, etc.

```
./testall.sh
-n testresult/test-cf-exists-1...
OK
-n testresult/test-cf-if-1...
OK
-n testresult/test-cf-if-2...
OK
-n testresult/test-cf-if-3...
OK
-n testresult/test-cf-keys-1...
OK
-n testresult/test-cf-length-1...
OK
-n testresult/test-cf-print-1...
OK
-n testresult/test-cf-while-1...
OK
-n testresult/test-cf-while-2...
OK
-n testresult/test-for-1...
OK
-n testresult/test-for-2...
OK
-n testresult/test-fun-1...
OK
-n testresult/test-fun-10...
OK
-n testresult/test-fun-11...
OK
-n testresult/test-fun-12...
OK
-n testresult/test-fun-13...
OK
-n testresult/test-fun-14...
OK
-n testresult/test-fun-15...
OK
-n testresult/test-fun-16...
OK
-n testresult/test-fun-2...
OK
-n testresult/test-fun-3...
OK
-n testresult/test-fun-4...
OK
-n testresult/test-fun-5...
OK
-n testresult/test-fun-6...
OK
-n testresult/test-fun-7...
OK
-n testresult/test-fun-8...
OK
-n testresult/test-fun-9...
OK
-n testresult/test-op-arith1...
OK
-n testresult/test-op-arith10...
OK
-n testresult/test-op-arith11...
OK
-n testresult/test-op-arith12...
OK
-n testresult/test-op-arith13...
OK
-n testresult/test-op-arith14...
OK
-n testresult/test-op-arith15...
OK
-n testresult/test-op-arith16...
OK
-n testresult/test-op-arith17...
OK
-n testresult/test-op-arith18...
OK
-n testresult/test-op-arith19...
OK
-n testresult/test-op-arith20...
OK
-n testresult/test-op-arith22...
OK
-n testresult/test-op-arith23...
OK
-n testresult/test-op-arith3...
OK
-n testresult/test-op-arith4...
OK
-n testresult/test-op-arith5...
OK
-n testresult/test-op-arith6...
OK
-n testresult/test-op-arith7...
OK
-n testresult/test-op-arith8...
OK
-n testresult/test-op-arith9...
OK
-n testresult/test-pattern-css1...
OK
-n testresult/test-pattern-css10...
OK
-n testresult/test-pattern-css11...
OK
-n testresult/test-pattern-css12...
OK
-n testresult/test-pattern-css13...
OK
-n testresult/test-pattern-css2...
OK
-n testresult/test-pattern-css3...
OK
-n testresult/test-pattern-css4...
OK
-n testresult/test-pattern-css5...
OK
-n testresult/test-pattern-css6...
OK
-n testresult/test-pattern-css7...
OK
-n testresult/test-pattern-css8...
OK
-n testresult/test-pattern-css9...
OK
-n testresult/test-pattern-regex1...
OK
-n testresult/test-pattern-regex10...
OK
-n testresult/test-pattern-regex11...
OK
-n testresult/test-pattern-regex2...
OK
-n testresult/test-pattern-regex3...
OK
-n testresult/test-pattern-regex4...
OK
-n testresult/test-pattern-regex5...
OK
-n testresult/test-pattern-regex6...
OK
-n testresult/test-pattern-regex7...
OK
-n testresult/test-pattern-regex8...
OK
-n testresult/test-pattern-regex9...
OK
-n testresult/test-tbl1...
OK
-n testresult/test-tbl10...
OK
-n testresult/test-tbl2...
OK
-n testresult/test-tbl3...
OK
-n testresult/test-tbl4...
OK
-n testresult/test-tbl5...
OK
-n testresult/test-tbl6...
OK
-n testresult/test-tbl7...
OK
-n testresult/test-tbl8...
OK
-n testresult/test-tbl9...
OK
successes = 82
failures = 0
total tests = 82
```

### 6.3 Test Automation

We had about 80 tests in our test suite, so we wrote a test script testall.sh that runs every test. It pipes the output of the program to a .i.out file, and then diffs it with a .out file that we created. If there are any differences, it will mark the test as a failure. The script will also print out the number of successes, failures, and total tests. 

The tests are run with `make test`.

The testing script is included in the Appendix.

## 7 Lessons Learned

### 7.1 Graham Gobieski

### 7.2 George Yu

### 7.3 Ethan Benjamin

### 7.4 Justin Chang

* Start early
* Set deadlines by understanding work involved, when assigning/discussing next steps, actually talk through and figure out what has to be done
* Work together! More efficient to bounce ideas off of each other, work in bursts as a group if possible
* Don't push untested code and don't push without being aware of what other work is being done

### 7.5 Jon Adelson

* While a seemingly obvious statement, knowing Ocaml well helps a lot when writing a compiler in Ocaml. Familiarity with Ocaml List functions makes code much clearer and likely error free. Additionally, getting used to making mistakes in Ocaml is an important part of the development process. Initially, I would get frustrated because I believed that Ocaml was incorrectly complaining about a seemingly valid program, only to find that I had in fact passed in the incorrect type, forgotten an argument to a function, or made one of many other possible mistakes. Learning to read Ocaml error messages and understanding where the real error exists is an important skill. 
* It is important to know what other people have already completed because you do not want two people writing the same pieces of code and you can easily leverage what others have written to accomplish new tasks. For example, when incorporating functions into the language, Graham had already written most of the code to semantically check statements, so it was reasonably straightforward to check all of the statements within the body of a function declaration. 
* Although it is more interesting to think about the functionality and syntax of your language, you do need to take time to consider what is legal in your target language. For example, there were a couple scenarios we had to guard against when returning values from functions. Java does not like if a non-void function is not guaranteed to return a value, such as if the return statement is within an if statement that does not also have an else clause. Additionally, Java does not like when you have unreachable code, such as when there are additional statements after a return statement that is guaranteed to execute. 
