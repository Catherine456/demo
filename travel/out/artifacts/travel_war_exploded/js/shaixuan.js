
$('.clearDd').show();

var okSelect = []; //已经选择好的
var oSelectList = document.getElementById('selectList'); //selectList 整个筛选框
var oClearList = $(".selected .clearList");  //selected中的clearlist
var aItemTxt = oSelectList.getElementsByTagName('a');  //所有link文字,清空用

var radioVal = '';
var radiotype = '';
$('#list_form').click(function(e, a){  
//oSelectList.onclick = function(e, a) {  //无名函数
	
    var ev = e || window.event; //获得事件
    var tag = ev.target || ev.srcElement; //获得触发事件的组件
    if(!tag)return;  //没有组件，结束
    
	var tagName = tag.nodeName.toUpperCase(); //nodeName返回DOM中的节点名
    var infor = '';
    var aRadio = document.getElementsByName('radio1'); //radio2是风格那一行，返回带有指定名称的对象的集合。获得radio2
    var bRadio = document.getElementsByName('radio2'); 
    var cRadio = document.getElementsByName('radio3'); 

    radioVal = '';
	radiotype = prev(parents(tag, 'dd')).firstChild.innerHTML;
	
	//点击的是链接
    if (tagName == 'A') { //如果点击 的是 A
        var oPrevInput = prev(tag);  //同一级的上一个节点 a上一个是input
        if (oPrevInput && oPrevInput.getAttribute('type').toUpperCase() == 'RADIO') { //radio
			if(oPrevInput.checked){  //把点击的这个input打上勾
				oPrevInput.checked = false;
			}
			else{

				oPrevInput.checked = true;
				//infor += '<div class=\"selectedInfor selectedShow\"><span>'+radiotype+'</span><label>' + next(oPrevInput).innerHTML + '</label><em p="2"></em></div>';
				
				//radioVal=next(oPrevInput).innerHTML;  //简约
			} 
        }
        
    };

    //alert("6");
	//a是什么？用来干嘛
	//删除
    if(a && a == '2') {   
        for (var i = 0; i < aRadio.length; i++) {
            aRadio[i].checked = false;
        }
		for (var i = 0; i < bRadio.length; i++) {
            bRadio[i].checked = false;
        }
		for (var i = 0; i < cRadio.length; i++) {
            cRadio[i].checked = false;
        }
    //一般情况下，增加 
    } 
		for (var i = 0; i < aRadio.length; i++) {
			
            if(aRadio[i].checked){infor += '<div class=\"selectedInfor selectedShow\"><span>风格</span><label>' + next(aRadio[i]).innerHTML + '</label></div>';}
        }
		for (var i = 0; i < bRadio.length; i++) {
			
			if(bRadio[i].checked) {infor += '<div class=\"selectedInfor selectedShow\"><span>户型</span><label>' + next(bRadio[i]).innerHTML + '</label></div>';
			}
			
        }
		for (var i = 0; i < cRadio.length; i++) {
           
			if(cRadio[i].checked) infor += '<div class=\"selectedInfor selectedShow\"><span>面积</span><label>' + next(cRadio[i]).innerHTML + '</label></div>';;
			
        }
		oClearList.html(infor);//clearlist显示
	
    $('#list_form').submit();
  
});


//form = document.getElementById('list_form');
//再次修改input内容
var options = {
		target:'#results',
};
//绑定提交事件
$(document).on("submit","#list_form",function(){
  $(this).ajaxSubmit(options);
  return false; //阻止表单默认提交
});

$('div .eliminateCriteria').click(function(){   //点击了 “清空全部”
   // $(oSelectList).find('input').attr('checked',false);  //把所有input的属性checked都设为false
   // radioVal = '';
   // okSelect.length = 0;
	$('#list_form').trigger('click','2');  //调用 onclick（event，1）
})


$('.selectedInfor').find('em').click(function(){
	alert("1");
    var self = $(this);
    var val = self.prev().html() + '|' + self.prev().prev().html();
	
    var n = -1;
    var a = this.getAttribute('p') || 1;
    self.die('click');
    for(var i = 0, len = aItemTxt.length; i < len; i++) {
         var html = val.split('|')[0];
         if(trim(aItemTxt[i].innerHTML) == html) {
              prev(aItemTxt[i]).checked = false;
              break;
        }
    };
    delStr(val, okSelect);
    $('#list_form').trigger('click', a);
})

function delStr(str, arr) { //删除数组给定相同的字符串
    var n = -1;
    for (var i = 0,len = arr.length; i < len; i++) {
        if (str == arr[i]) {
            n = i;
            break;
        }
    }
    n > -1 && arr.splice(n, 1);
};
function trim(str) {
    return str.replace(/^\s+|\s+$/g, '')
};
function text(e) {
    var t = '';
    e = e.childNodes || e;
    for (var j = 0; j < e.length; j++) {
        t += e[j].nodeType != 1 ? e[j].nodeValue: text(e[j].childNodes);
    }
    return trim(t);
}

function prev(elem) {
    do {
        elem = elem.previousSibling; //同一树层级中指定节点的前一个节点。被返回的节点以 Node 对象的形式返回
    } while ( elem && elem . nodeType != 1 );
    return elem;
};

function next(elem) {
    do {
        elem = elem.nextSibling;
    } while ( elem && elem . nodeType != 1 );
    return elem;
}

function parents(elem, parents) {  //查找当前祖先辈元素需要的节点  如 parents(oDiv, 'dd') 查找 oDiv 的祖先元素为dd 的
    if(!elem || !parents) return;
    var parents = parents.toUpperCase();
    do{
        elem = elem.parentNode;
    } while( elem.nodeName.toUpperCase() != parents );
    return elem;
};
