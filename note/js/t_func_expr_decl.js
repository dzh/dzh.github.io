/**
 * Auther: dzh <dzh_11@hotmail.com>
 * Version: t_func_expr_decl.js,v 1.0 2013/04/30 14:47:04
 * Runtime: node.js v0.9.5-pre
 */

/*函数声明*/
console.log("------------Test 1-------------");
function func_decl () {
    function func_decl_inner () { return "func_decl_inner";} //函数声明可以嵌套定义
    return "func_decl" + "&" + func_decl_inner.name;
}
console.log(func_decl.name) //输出“func_decl”,说明函数声明也是对象
console.log(func_decl()); //输出“func_decl&func_decl_inner”

console.log("------------Test 2-------------");
/*函数表达式*/
var func = function () {
    function func_decl_inner () { return "func_decl_inner";} //函数表达式里可以定义函数声明
    return "anonymous function" + "&" + func_decl_inner.name;
};
console.log(func());  //输出“anonymous function&func_decl_inner”

// 作为函数参数调用
console.log("------------Test 3-------------");
var func_invoked = function (func) {
    try{
        return func();  
    }catch (e){
        var func_type = typeof func;
        return "func's type is "+ func_type + ", but it need function type. " +  e.toString();
    }
};
console.log(func_invoked(func)); //输出“anonymous function&func_decl_inner”
console.log(func_invoked(func_decl)); //输出“func_decl&func_decl_inner”

// 赋值给变量
console.log("------------Test 4-------------");
var func_ref = func;
var func_decl_ref = func_decl; //函数声明赋值给变量，并被作为函数调用
console.log(func_decl_ref()); //输出“func_decl&func_decl_inner”
console.log(func_ref()); //输出“anonymous function&func_decl_inner”

// 赋值给对象属性
console.log("------------Test 5-------------");
var obj = {
    //  function func_decl () {return "func_dec"} //错误“SyntaxError: Unexpected identifier”，对象内部不能定义函数声明
    func: func,
    func_decl: func_decl, //函数声明可以赋值给对象属性，并作为函数被调用
    func_def: function func_def (){ return "func_def";}
};
console.log(obj.func_decl()); //输出“func_decl&func_decl_inner“
console.log(obj.func()); //输出“anonymous function&func_decl_inner”
console.log(obj.func_def()); //输出“func_def”
