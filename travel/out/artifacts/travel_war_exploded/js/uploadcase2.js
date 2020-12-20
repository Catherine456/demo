
    var textHtml2 = "";
    var id2="UploadCase_upload";
    var j="";
    var c=1;
    function getPhoto2() {
    	var node = document.getElementById(id2);
        var imgURL = "";
        try{
            var file = null;
            if(node.files && node.files[0] ){
                file = node.files[0];
            }else if(node.files && node.files.item(0)) {
                file = node.files.item(0);
            }
            //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
            try{
                imgURL =  file.getAsDataURL();
            }catch(e){
            	imgURL = window.URL.createObjectURL(file);
            }
        }catch(e){
            if (node.files && node.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    imgURL = e.target.result;
                };
                reader.readAsDataURL(node.files[0]);
            }
        }
        creatImg2(imgURL,node);
        return imgURL;
    }
 
    function creatImg2(imgURL,node){
    		textHtml2 += "<img src='"+imgURL+"'width='100px' height='100px'/>";
    		var oldnode = document.getElementById(id2).parentNode;
    		oldnode.style.display="none";
    		var mybutton2 = document.getElementById("mybutton2"); 
    		var a = document.createElement("a"); 
    		a.className="file";
    		a.href="javascript:;";
    		a.innerHTML='上传全景图';
    	  	var input = document.createElement("input");  
    	  	input.type = "file"; 
    	  	input.name = "upload"; 
    	  	input.onchange=function(){getPhoto2();}
    	  	input.id="UploadCase_upload"+c;
    	  	id2=input.id;
    	  	c=c+1;
    	  	a.appendChild(input);
    	  	mybutton2.appendChild(a); 
        	$(".ge_pic_icon_Infor2").html(textHtml2);
    }
    