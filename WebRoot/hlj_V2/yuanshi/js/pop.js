var popup_dragging = false;
var popup_target;
var popup_mouseX;
var popup_mouseY;
var popup_mouseposX;
var popup_mouseposY;
var popup_oldfunction;
function popup_display(x)
{
var win = window.open();
for (var i in x) win.document.write(i+' = '+x[i]);
}
// ----- popup_mousedown -------------------------------------------------------
function popup_mousedown(e)
{
var ie = navigator.appName == "Microsoft Internet Explorer";
if ( ie && window.event.button != 1) return;
if (!ie && e.button != 0) return;
popup_dragging = true;
popup_target = this['target'];
popup_mouseX = ie ? window.event.clientX : e.clientX;
popup_mouseY = ie ? window.event.clientY : e.clientY;
if (ie)
popup_oldfunction = document.onselectstart;
else popup_oldfunction = document.onmousedown;
if (ie)
document.onselectstart = new Function("return false;");
else document.onmousedown = new Function("return false;");
}
// ----- popup_mousemove -------------------------------------------------------
function popup_mousemove(e)
{
if (!popup_dragging) return;
var ie = navigator.appName == "Microsoft Internet Explorer";
var element = document.getElementById(popup_target);
var mouseX = ie ? window.event.clientX : e.clientX;
var mouseY = ie ? window.event.clientY : e.clientY;
element.style.left = (element.offsetLeft+mouseX-popup_mouseX)+'px';
element.style.top = (element.offsetTop +mouseY-popup_mouseY)+'px';
popup_mouseX = ie ? window.event.clientX : e.clientX;
popup_mouseY = ie ? window.event.clientY : e.clientY;
}
// ----- popup_mouseup ---------------------------------------------------------
function popup_mouseup(e)
{
if (!popup_dragging) return;
popup_dragging = false;
var ie = navigator.appName == "Microsoft Internet Explorer";
var element = document.getElementById(popup_target);
if (ie)
document.onselectstart = popup_oldfunction;
else document.onmousedown = popup_oldfunction;
}
// ----- popup_exit ------------------------------------------------------------
function popup_exit(e)
{
var ie = navigator.appName == "Microsoft Internet Explorer";
var element = document.getElementById(popup_target);
popup_mouseup(e);
element.style.visibility = 'hidden';
element.style.display = 'none';
closeWindow();
}
// ----- popup_show ------------------------------------------------------------
function popup_show(id,wWidth,hHeight)
{
///
closeWindow();
var bWidth=parseInt(document.documentElement.scrollWidth);
var bHeight=parseInt(document.documentElement.scrollHeight);
if(isIe){
setSelectState('hidden');}
var back=document.createElement("div");
back.id="back";
var styleStr="top:0px;left:0px;position:absolute;background:#666;width:"+bWidth+"px;height:"+bHeight+"px;";
styleStr+=(isIe)?"filter:alpha(opacity=60);":"opacity:0.60;";
back.style.cssText=styleStr;
document.body.appendChild(back);

element = document.getElementById('popup'+id);
drag_element = document.getElementById('popup_drag'+id);
exit_element = document.getElementById('popup_exit'+id);
///
var range=getRange();
var left=(range.width -wWidth)/2;
if(left<0){
left=0;
}
left=left+range.left;
var top=(range.height -hHeight)/2;
if(top<0){
top=0;
}
 
top=top+range.top;
////
element.style.position = "absolute";
element.style.visibility = "visible";
element.style.display = "block";
element.style.left =left+'px';// (document.documentElement.scrollLeft+popup_mouseposX-10)+'px';
element.style.top =top+'px';//(document.documentElement.scrollTop +popup_mouseposY-10)+'px';
drag_element['target'] = 'popup'+id;
popup_target = 'popup'+id;;
drag_element.onmousedown = popup_mousedown;
exit_element.onclick = popup_exit;
}
// ----- popup_mousepos --------------------------------------------------------
function popup_mousepos(e)
{
var ie = navigator.appName == "Microsoft Internet Explorer";
popup_mouseposX = ie ? window.event.clientX : e.clientX;
popup_mouseposY = ie ? window.event.clientY : e.clientY;
}
// ----- Attach Events ---------------------------------------------------------
if (navigator.appName == "Microsoft Internet Explorer")
document.attachEvent('onmousedown', popup_mousepos);
else document.addEventListener('mousedown', popup_mousepos, false);
if (navigator.appName == "Microsoft Internet Explorer")
document.attachEvent('onmousemove', popup_mousemove);
else document.addEventListener('mousemove', popup_mousemove, false);
if (navigator.appName == "Microsoft Internet Explorer")
document.attachEvent('onmouseup', popup_mouseup);
else document.addEventListener('mouseup', popup_mouseup, false);


var isIe=(document.all)?true:false;
//设置select的可见状态
function setSelectState(state)
{
var objl=document.getElementsByTagName('select');
for(var i=0;i<objl.length;i++)
{
objl[i].style.visibility=state;
}
}
function mousePosition(ev)
{
if(ev.pageX || ev.pageY)
{
return {x:ev.pageX, y:ev.pageY};
}
return {
x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,y:ev.clientY + document.body.scrollTop - document.body.clientTop
};
}
function getRange() {   
    var top = document.documentElement.scrollTop;   
    var left = document.documentElement.scrollLeft;   
    var height = document.documentElement.clientHeight;   
    var width = document.documentElement.clientWidth;   
       
    if (top == 0 && left == 0 && height == 0 && width == 0) {   
        top = document.body.scrollTop;   
        left = document.body.scrollLeft;   
        height = document.body.clientHeight;   
        width = document.body.clientWidth;   
    }   
       
    return  {top:top  ,left:left ,height:height ,width:width };   
}  

//弹出方法
function showMessageBox(wTitle,content,pos,wWidth,hHeight)
{
closeWindow();
var bWidth=parseInt(document.documentElement.scrollWidth);
var bHeight=parseInt(document.documentElement.scrollHeight);
if(isIe){
setSelectState('hidden');}
var back=document.createElement("div");
back.id="back";
var styleStr="top:0px;left:0px;position:absolute;background:#666;width:"+bWidth+"px;height:"+bHeight+"px;";
styleStr+=(isIe)?"filter:alpha(opacity=40);":"opacity:0.40;";
back.style.cssText=styleStr;
document.body.appendChild(back);
var mesW=document.createElement("div");
mesW.id="mesWindow";
mesW.className="mesWindow";
var range=getRange();
var left=(range.width -wWidth)/2;
if(left<0){
left=0;
}
left=left+range.left;
var top=(range.height -hHeight)/2;
if(top<0){
top=0;
}
top=60;
top=top+range.top;
styleStr="left:"+left+"px;top:"+top+"px;position:absolute;width:"+wWidth+"px;";
//styleStr="left:"+left+"px;top:"+top+"px;position:absolute;width:"+wWidth+"px;height:"+hHeight+"px;";
//styleStr="left:"+(((pos.x-wWidth)>0)?(pos.x-wWidth):pos.x)+"px;top:"+(pos.y)+"px;position:absolute;width:"+wWidth+"px;";
mesW.style.cssText=styleStr;
document.body.appendChild(mesW);
}
//关闭窗口
function closeWindow()
{
if(document.getElementById('back')!=null)
{
document.getElementById('back').parentNode.removeChild(document.getElementById('back'));
}
if(document.getElementById('mesWindow')!=null)
{
document.getElementById('mesWindow').parentNode.removeChild(document.getElementById('mesWindow'));
}
if(isIe){
setSelectState('');}
}


/*--取值-------------------------*/
function clearOptionSel(optionName){
    var sops=document.getElementsByName(optionName);
	if(sops!=null){
	  var len=sops.length;
	  var i=0;
	  for(i=0;i<len;i++){
	     sops[i].checked=false;
	  }
	} 
  
  }
  function setProfessionSelect(optionName,e){
  
  document.getElementById("proType").value="";
    var sops=document.getElementsByName(optionName);
	if(sops!=null){
	  var len=sops.length;
	  var i=0;
	  for(i=0;i<len;i++){
	     if(sops[i].checked){
		   document.getElementById("proType").value=sops[i].value;
		   break;
		 }
	      
	  }
	} 
    popup_exit(e);
  }
    function setIndusSelect(optionName,e){
  
  document.getElementById("indusType").value="";
    var sops=document.getElementsByName(optionName);
	if(sops!=null){
	  var len=sops.length;
	  var i=0;
	  for(i=0;i<len;i++){
	     if(sops[i].checked){
		   document.getElementById("indusType").value=sops[i].value;
		   break;
		 }
	      
	  }
	} 
    popup_exit(e);
  }
 