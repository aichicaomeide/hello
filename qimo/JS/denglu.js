function $(id){return document.getElementById(id);}
    function resetForm(){
        $("validate").innerHTML="";
        $("form").reset();
     
 
    }
function checkForm(){
    var uname=$("uname").value;
    if(isEmpty(uname)){
        $("validate").innerHTML="用户名不能为空！";
        alert("用户名不能为空！");
         return;
    }
    if(uname.length<6||uname.length>16){
      $("validate").innerHTML="用户名长度须在6-16位间！";
      alert("用户名长度须在6-16位间！");
      return;
  } 
  $("validate").innerHTML=""; 
  var upwd=$("upwd").value;
     if(isEmpty(upwd)){
         $("validate").innerHTML="密码不能为空！";
        alert("密码不能为空！");
         return;
     }
  if(upwd.length<6||upwd.length>16){
      $("validate").innerHTML="密码长度须在6-16位间！";
      alert("密码长度须在6-16位间！");
      return;
  }  
 if(upwd.indexOf(uname)>-1){
    $("validate").innerHTML="密码不能包含用户名";
    alert("密码不能包含用户名");
    return;
 }
 $("validate").innerHTML=""; 
//   $("myform").action="http://127.0.0.1:5500/%E6%9C%9F%E6%9C%AB%E4%BD%9C%E4%B8%9A/index.html";
$("myform").action="index.html";
  alert('登录成功！即将以该用户的身份进入叮当屋首页');
  $("myform").submit();
 }
 function isEmpty(str){
     if(str == null|| str.trim() == "" ){
         return true;
     }
     return false;
     
 }