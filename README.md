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
### 解析语法文件
[grammar.ipynb](/grammar.ipynb)文件内存有将各个语言grammar.json文件解析后得到的字典。

### 自动化测试
检查下载的treesitter解析器能否通过自带的corpus测试，具体测试内容和方法在[test.ipynb](/test.ipynb)<br>

### 代码段拆分
- 目的：增强模型代码生成的能力，需要带注释的函数和类


将data文件夹下的jsonl文件读取并用ast方法提取其函数和类等成块信息，并将注释等前缀和代码段放在一起。最终的结果放在了code文件夹下。源代码放在了[code_split.ipynb](./code_split.ipynb)<br>
一些info:<br>
1、目前支持的语言：'c','cpp','c_sharp','go','java','php','python','ruby','rust','tsx','fortran','kotlin','cuda','scala'<br>
2、根据代码情况迭代了三个版本：
- 第一个版本将注释和函数(类)体全部提出来，然后将不同类体间的注释全部放在类体前，会导致不属于函数的注释也加到了函数前面
- 第二个版本修正了第一个版本的问题，具体对比见[result_v1v2.txt](./test/result_v1v2.txt)，用cuda语言进行了测试
- 第三个版本还判断了函数体前缀以及函数体内部有无注释，只把有注释的留下了，具体对比见[go_v2.txt](./test/go_v2.txt)和[go_v3.txt](./test/go_v3.txt)。
3.对注释内容进行了检查，包括长度、内容有无意义等。

### 代码相似度以及代码翻译
- 目的：1、找到能够较好反映代码相似度的指标。2、观察代码翻译的结果，看和代码相似度指标是否有相关性。(可以用来强化代码翻译模型)


见[code_similarity.ipynb](./code_similarity.ipynb)

计算代码相似度的算法：<br>
1. Min-Hashing based Jaccard Similarity:AST和CODE两个版本<br>
2.SimHash：AST和CODE两个版本<br>
3.基于树的编辑距离

观察代码翻译的结果：<br>
见[result.txt](./data/code_translation/result/result.txt)里面有代码文件样例的正误与代码相似度的皮尔逊系数以及p值，[code_similarity.ipynb](./code_similarity.ipynb)里面绘制了散点图。<br>
结果：测试完MinHash和SimHash的AST和CODE两种版本，测试结果均不理想。
TODO:

> grammar.json文件语法树比对
   > > 利用树匹配相关算法对不同语法文件的字典进行匹配，最终目的是提供统一的ast格式，不过鉴于任务可能比较复杂，一开始可以先通过树匹配算法找到类似的结构。任务可能比较复杂，长期工作。
