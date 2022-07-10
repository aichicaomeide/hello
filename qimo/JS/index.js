var btn=document.querySelector('button');
var text=document.querySelector('textarea');
// var ul=document.querySelector('ul');
var ul=document.getElementById('ul');
btn.onclick=function(){
    if (text.value==''){
        alert('您没输入内容');
        return false;//终止操作
    }
    else{
     var li=document.createElement('li');
        li.innerHTML=text.value;
        ul.insertBefore(li,ul.children[0]);
    }
     
}
// 删除留言
// var ul2=document.querySelector('ul');
    // var btn=document.querySelector('button');
    var btnt=document.getElementById('delete');
    btnt.onclick=function(){
        if(ul.children.length==0){
            this.disabled=true;
        }
        else{
            ul.removeChild(ul.children[0]);
        }
         
    }
