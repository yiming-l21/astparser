## 代码预处理
###生成抽象语法树
本仓库基于[treesitter](https://github.com/tree-sitter/tree-sitter),能够将源文件解析生成python嵌套列表格式的ast。

例如：
```
def factorial(n):
    factorial = 1
    for i in range(1, n + 1):
        factorial *= i
    return factorial
```
解析后生成ast列表：
```
[['module ', ['function_definition name: ', ['identifier'], ' parameters: ', ['parameters ', ['identifier']], ' body: ', ['block ', ['expression_statement ', ['assignment left: ', ['identifier'], ' right: ', ['integer']]], ' ', ['for_statement left: ', ['identifier'], ' right: ', ['call function: ', ['identifier'], ' arguments: ', ['argument_list ', ['integer'], ' ', ['binary_operator left: ', ['identifier'], ' right: ', ['integer']]]], ' body: ', ['block ', ['expression_statement ', ['augmented_assignment left: ', ['identifier'], ' right: ', ['identifier']]]]], ' ', ['return_statement ', ['identifier']]]]]]
```
#### 使用方式
[setting.ipynb](/setting.ipynb)文件内code2ast函数，参数为language和filepath。<br>
language标签如下：
```
LANGUAGE_TAG = {
    //"c"            : "// language: C",
    //"c++"          : "// language: C++",
   // "cpp"          : "// language: C++",
    //"c#"           : "// language: C#",
    //"csharp"       : "// language: C#",
    //"css"          : "/* language: CSS */",
    //"cuda"         : "// language: Cuda",
    //"dart"         : "// language: Dart",
    //"lua"          : "// language: Lua",
    //"objectivec"  : "// language: Objective-C",
    //"objective-c"  : "// language: Objective-C",
    "objective-c++": "// language: Objective-C++",
    //"python"       : "# language: Python",
    //"perl"         : "# language: Perl",
    //"prolog"       : f"% language: Prolog",
    "swift"        : "// language: swift",
    //"lisp"         : "; language: Lisp",
    //"java"         : "// language: Java",
    //"scala"        : "// language: Scala",
    //"tex"          : f"% language: TeX",
    //"html"         : "<!--language: HTML-->",
    //"php"          : "// language: PHP",
    //"js"           : "// language: JavaScript",
    //"javascript"   : "// language: JavaScript",
    //"typescript"   : "// language: TypeScript",
    //"go"           : "// language: Go",
    "shell"        : "# language: Shell",
    //"rust"         : "// language: Rust",
    //"sql"          : "-- language: SQL",
    //"kotlin"       : "// language: Kotlin",
    "vb"           : "' language: Visual Basic",
    //"ruby"         : "# language: Ruby",
    //"pascal"       : "// language: Pascal",
    //"r"            : "# language: R",
    //"fortran"      : "!language: Fortran",
    "lean"         : "-- language: Lean",
    //"matlab"       : f"% language: Matlab",
    
    
    "delphi"       : "{language: Delphi}",
    "scheme"       : "; language: Scheme",
    "basic"        : "' language: Basic",
    "assembly"     : "; language: Assembly",
    "groovy"       : "// language: Groovy",
    "abap"         : "* language: Abap",
    "gdscript"     : "# language: GDScript",
    "haskell"      : "-- language: Haskell",
    "julia"        : "# language: Julia",
    "elixir"       : "# language: Elixir",
    "excel"        : "' language: Excel",
    "clojure"      : "; language: Clojure",
    "actionscript" : "// language: ActionScript",
    "solidity"     : "// language: Solidity",
    "powershell"   : "# language: PowerShell",
    "erlang"       : f"% language: Erlang",
    "cobol"        : "// language: Cobol",
}
```
目前支持的语言：c,c#,c++,css,go,java,js,php,prolog,python,r,rust,ts,cuda,perl,scala,matlab,pascal,ruby,lua，dart,kotlin,html,lisp,tex，sql,object-c,fortran
尚未支持的语言：objective-c++,swift,shell,vb,lean
###解析语法文件
[grammar.ipynb](/grammar.ipynb)文件内存有将各个语言grammar.json文件解析后得到的字典。

TODO:
把grammar.json文件中的name、members和content都提取出来为字典，下一步要比较不同语言字典的信息

