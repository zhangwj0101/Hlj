<!--
function tab (mod,cursor,n){
	for(i=1;i<=n;i++){
		var nav=document.getElementById(mod+i);
		var cont=document.getElementById(mod+"_"+"cont"+i);
		nav.className=(i==cursor)?"current":"";
		cont.style.display=(i==cursor)?"block":"none";
	}
}

function tabs (mod,cursor,n,type){
	for(i=1;i<=n;i++){
		var nav=document.getElementById(mod+i+"_"+type);
		var cont=document.getElementById(mod+"_"+"cont"+i+"_"+type);
		nav.className=(i==cursor)?"current":"";
		cont.style.display=(i==cursor)?"block":"none";
	}
}
//-->