## 代码预处理
### 生成抽象语法树
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
### 解析语法文件
[grammar.ipynb](/grammar.ipynb)文件内存有将各个语言grammar.json文件解析后得到的字典。

### 自动化测试
检查下载的treesitter解析器能否通过自带的corpus测试，具体测试内容和方法在[test.ipynb](/test.ipynb)<br>


TODO
> 代码预处理——源代码拆分
> > 将带有注释的整个源代码文件作为输入，利用treesitter生成的ast提供的结构性信息将含有多个类、函数以及引用类库的源文件拆分为多个完整的注释+类的形式，引用类库部分可以省略。


> grammar.json文件语法树比对
   > > 利用树匹配相关算法对不同语法文件的字典进行匹配，最终目的是提供统一的ast格式，不过鉴于任务可能比较复杂，一开始可以先通过树匹配算法找到类似的结构。任务可能比较复杂，长期工作。
