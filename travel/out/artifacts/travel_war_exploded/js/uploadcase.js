

    var imgurl = "";
    var textHtml = "";
    var id="UploadCase_upload2";
    var i="";
    var b=1;
    function getPhoto() {
    	
    	var node = document.getElementById(id);
        var imgURL = "";
        try{
            var file = null;
            
            if(node.files && node.files[0] ){
                file = node.files[0];
            }else if(node.files && node.files.item(0)) {
                file = node.files.item(0);
            }
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
        creatImg(imgURL,node);
        return imgURL;
    }
 
    function creatImg(imgURL,node){
    		textHtml += "<img src='"+imgURL+"'width='100px' height='100px'/>";
    		var oldnode = document.getElementById(id).parentNode;
    		oldnode.style.display="none";
    		var mybutton = document.getElementById("mybutton"); 
    		var a = document.createElement("a"); 
    		a.className="file";
    		a.href="javascript:;";
    		a.innerHTML='上传平面图';
    	  	var input = document.createElement("input");  
    	  	input.type = "file"; 
    	  	input.name = "upload2"; 
    	  	input.onchange=function(){getPhoto();}
    	  	input.id="UploadCase_upload2"+b;
    	  	id=input.id;
    	  	b=b+1;
    	  	a.appendChild(input);
    	  	mybutton.appendChild(a); 
        	$(".ge_pic_icon_Infor").html(textHtml);
    }
    