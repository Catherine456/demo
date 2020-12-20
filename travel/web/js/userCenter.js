
define(function(require, exports, module) {

    /**
     * 获取cookie
     * @param  {[string]} name 需要获取的cookie名
     * @param  {[string]} pre  如果需要带上前缀则使用此参数
     * @return {[string]} 返回对应的cookie值,不存在则返回空字符串
     */
    function getCookie(name, pre) {
        if (pre) {
            name = 'to8to_' + name
        };
        var r = new RegExp("(\\b)" + name + "=([^;]*)(;|$)");
        var m = document.cookie.match(r);
        return (!m ? "" : decodeURIComponent(m[2]))
    }

    function removeValue(element){
        var ele_after_val = element.val();
        element.focus(function(){
            $(this).css({'border':'1px solid #f8c7c7',"border-top":"0"});
            if($(this).val() == ele_after_val){
                $(this).val("");
            }
        });
        element.focusout(function(){
            $(this).css({'border':'1px solid #e6e6e6',"border-top":"0"});
            if($(this).val() == ""){
                $(this).val(ele_after_val);
            }
        });
    }

    function chioce_pic(element){
        element.click(function(){
            var count= $(this).attr('count');
            if(count==0){
                $(this).parent().addClass("_pic_click");
                $(this).attr('count','1');
            }else if(count == 1){
                $(this).parent().removeClass("_pic_click");
                $(this).attr('count','0');
            }
        });
    }

    function product_upload(element){
        element.click(function(){
            var msg = check_tpl();
            dialog(msg);
        });
    }
    function dialog (msg){
        $('.dialog_bg').show();
        $('.upload_product_tpl .cont .tpl_msg>label').html(msg);
        $('.upload_product_tpl').show();
    }
    function pic_upload(){
        $('.pict_upload .chioce_pic').click(function(){
            $(this).next().click();
        });
    }
    function dialog_show(ele,show_dialog){
        ele.click(function(){
            $(".dialog_bg").show();
            $(show_dialog).show();
        });
    }
    function close(){
        $(".close").click(function(){
            $('.dialog_bg').hide();
            $(this).parent().parent().hide();
        });
    }

    //首页导航栏-鼠标悬浮时隐藏左右间隔线
    function removeTopBarString(){
        var obj = $('ul.tp_node li.po');
        $('ul.tp_node li').mouseover(function(){
            $(this).prev('.po').css('color','#efefef');
            $(this).next('.po').css('color','#efefef');
        }).mouseout(function(){
                $(this).prev('.po').css('color','#ddd');
                $(this).next('.po').css('color','#ddd');
            });
    }

    function check_tpl(){
        // 项目名称
        var pro_name = $('.upload_info .prod_name>input').val();
        var pro_type = $('.upload_info .prod_type>select:eq(0)>option').val();
        var pro_type2 = $('.upload_info .prod_type>select:eq(1)>option').val();
        var pro_type3 = $('.upload_info .prod_type>select:eq(2)>option').val();
        var pro_type4 = $('.upload_info .prod_type>select:eq(3)>option').val();
        var pro_size = $('.upload_info .prod_info>input:eq(0)').val();
        var pro_price = $('.upload_info .prod_info>input:eq(1)').val();
        var msg = "";
        if(pro_name==""){
            msg="请写作品名称";  //        请填写作品名称
        }else if(pro_type==0){
            msg = "请选择空间分类";      //
        }else if(pro_type2 == 0){
            msg = "请选择空间二级分类";
        }else if(pro_type3 == 0){
            msg = "请选择空间三级分类";
        }else if(pro_type4 == 0){
            msg = "请选择风格";
        }else if(pro_size==""){
            msg = "请写项目面积"; // 请填写项目面积
        }else if(pro_price==""){
            msg = "请写项目报价";  //   请填写项目报价
        }
        return msg ;
    }

    function showCitiesNew( city, space, price, area ) {
        var oJsLoader = new SJB.jsLoader();
        oJsLoader.onsuccess = function() {
            editPhotoCat('//www.shejiben.com/order_lobby/ordershow.php?cityname='+city+
                        '&spaceTag='+space+'&price='+price+'&area='+area, '设计需求', 530, 246);
        };
        oJsLoader.load('//www.shejiben.com/gb_js/popup.js');
        return false;
    };

    // 点击公用下拉框
    function click_select(globalDivClick){
        $(globalDivClick).click(function(){
            $(this).parent().siblings().find('div.md_options').hide();
            $(this).next().toggle();
            select_atlas($(this).next().find('ul li'),$(this).find('label'),$(this),$(this).next())
        });
    }
    function select_atlas(element,ele,show,hide){

        element.click(function(){
            ele.html($(this).html());
            $(this).parent().parent().hide();
        });
        document_click(show,hide);
    }
    function document_click(show,hide){
        show = show.attr('id');
        document.onclick = function (event)
        {
            var e = event || window.event;
            var elem = e.srcElement||e.target;
            while(elem)
            {
                if(elem.id == elem || elem.id == show ||elem.id=='bulid_new')
                {
                    return;
                }
                elem = elem.parentNode;
            }
            hide.hide();
        }
    }

    function initNewHeader() {
        //头部右侧 导航css 切换 // 鼠标移开时 无边框及背景样式
        var css_={'border-left':'1px #efefef solid','border-right':'1px #efefef solid','background':'none','border-bottom':'none'};
        // 头部右侧 导航css 切换 // 鼠标移上时 有边框及背景样式
        var css_d={'background':'#fff','border-bottom':'1px solid #ddd'};
        // 鼠标移动在登录的li 的时候隐藏掉兄弟节点下的子菜单
        var hea_top_li_one = $(".hea_top_right>ul.tp_node>li:eq(0)");
        //鼠标移上时
        var hea_top_liOver = $(".hea_top_right>ul.tp_node>li.cur");
        // 左侧菜单栏的导航切换样式
        var cont_bann = $('.content_left>div>ul>li');
        // 头部 左侧鼠标移上 显示二维码
        var code_ = $('.hea_top_left ul li.hover');
        // 接单大厅 条件筛选
        var sele_ = $('.selec_ele>div>ul>li');
        //排序筛选
        var des = $('.selec_sort>div>ul>li');
        // 分页
        var st_page = $('.bg_page>ul>li');
        // 其他城市
        var _city = $('#city_py').val(),
            _space = $('#space_py').val(),
            _price = $('#price_range').val();
            _area = $('#area_range').val();
        //var athCity = $('.athCity');
        $('.athCity').bind( 'click', function() {
            //alert(11);
            showCitiesNew( _city, _space, _price,_area );
        } );
        // 删除博文
        var del_blogs=$('.edit').find('span:eq(1)');
        var del = $('.edit').find('a:eq(1)');
        // 关闭博文弹出框
        close();
        // 签到
        var qd_sub = $('.mid').find('input.btn_click');
        // 申请接单 弹出框
        //var sq_dialog = $('._msg_info').find('.apply_for');
        // 接单提醒 弹出框
        var tx_dialog = $('#int_order');//
        // 编辑作品信息
        var edit_info= $('.pict .pic_edit').find("span:eq(0)");
        // 删除作品
        var del_prod = $('.pic_edit .del');
        // 移动图片
        var move_pic = $('.btn_05');
        //新建图集
        var add_pics = $('.my_collect').find('.tal>.pics_add>.btn_06');
        // 收藏图片
        var one_bat = $('._collected>input:eq(0)');
        // 创建新的图集名称
        var add_name = $('.bulid_new .add');
        // 点击清除 val()
        removeValue($('.pic_focus>.describe>textarea'));
        removeValue($('.pic_focus>.describe>input'));
        // 选中图片
        chioce_pic($('.pic_focus>.pic_>i'));

        pic_upload();

        // 取消
        $(".btn_unclick").click(function(){$('.close').click()});

        // 顶部 鼠标滑过
        //return;
        hea_top_liOver.mouseover(function(){
            $(this).find('div:first').show();
            $(this).siblings().find('div').first().hide();

        });

        hea_top_liOver.mouseout(function(){
            $(this).find('div:first').hide();
        });

        //个人中心首页个人资料的完善度
        var total = $('.progress_bar .font_16').text().replace(/%/,"");
        $('.progress_bar').addClass("progress_bar_"+total);

        $('.infomation_new .leb dl dd').click(function(){
            $(this).addClass('cur').siblings().removeClass('cur');
            if($(this).index() == 2){
                $(this).parent().parent().prev().attr('class','sx')
            }else{
                $(this).parent().parent().prev().attr('class','sx_lev');
            }
            var index = $(this).index();
            $(this).parent().parent().siblings('div.tab_info').find('.item:eq('+index+')').show();
            $(this).parent().parent().siblings('.tab_info').find('.item:eq('+index+')').siblings().hide();
        });

        cont_bann.mouseover(function(){
            $(this).addClass('cur').siblings().removeClass('cur');
            $(this).parent().parent().siblings().find('li').removeClass('cur');
        });
        code_.mouseover(function(){
            $(this).find('div').show();
        });
        code_.mouseout(function(){
            $(this).find('div').hide();
        });
        sele_.click(function(){
            $(this).addClass('cur').siblings().removeClass('cur');
        });
        des.click(function(){

            if($(this).index()==4){
                $(this).unbind('click');
            }else{
                $(this).addClass('cur').siblings().removeClass('cur');
            }
        });
        //dialog_show(athCity,'.dialog_city');
        dialog_show(del_blogs,'.qd_suc');
        dialog_show(del,'.qd_suc');
        dialog_show($(".add"),'.publish_blong');
        dialog_show(qd_sub,'.qd_dia');
        //dialog_show(sq_dialog,'.sq_dialog');
        dialog_show(tx_dialog,'.or_03');
        dialog_show(edit_info,'.edit_prod_info');
        dialog_show(del_prod,'.edit_prod_del');
        dialog_show(move_pic,'.edit_prod_del');
        dialog_show(add_pics,'.add_picts');
        dialog_show(one_bat,'.collect_pictures');
        click_select('#globalDivClick');
        click_select('#globalDivClick1');

        $('.bottoms>span:eq(1)').click(function(){$(".close").click();});
        //一键收藏  创建图集
        add_name.click(function(){
            $(this).parent().siblings().append('<li>'+$(this).prev().val()+'</li>');
            $(this).parent().prev().find('li').click(function(){
                $(this).parent().parent().prev().find('label').html($(this).html());
                $(this).parent().parent().hide();
            });
        });
        product_upload($('.product_btn input'));

        // 私信

        $(".private_cont").find(".letter_list").find('.time>span').click(function(){
            $(this).parent().siblings().toggle();
        });

        // 选择好友

        $('.send_to>.sele_click').click(function(){
            $(this).parent().next().toggle();
        });
        // 关注 .my_vermicelli .vermicelli_cont .vermicelli_list img:hover{}

        $('.vermicelli_list img,.vermicelli_list i').mouseover(function(){
            $(this).parent().find('i').show();
        });
        $(' .vermicelli_list img,.vermicelli_list i').mouseout(function(){
            $(this).parent().find('i').hide();
        });
         //关注 取消关注
         $('.vermicelli_list i').click(function(){
             var this_stats = $(this).attr('for');
             if(this_stats==0){
                $(this).html('已关注');
                $(this).attr('for','1');
             }
             if(this_stats==1){
                 $(this).html('+关注');
                 $(this).attr('for','0');
             }
         });

        //首页导航栏-鼠标悬浮时隐藏左右间隔线
        removeTopBarString();

        //动态的去给接单大厅我的主页更新url，防止缓存
        var to8to_uid = getCookie('uid', 1);
        var myURL = window.location.href;
        if (!myURL.match(/(shejiben\.com\/my|pms\.php)/)) {
            if (to8to_uid)
            {
                $.ajax({
                  url: '//www.shejiben.com/getuserdata.php?s=1&pos=getLoginUserInfo',
                  dataType:'jsonp',
                  success:function(data) {
                      if(data.blog_url!=''){
                        $('.ban_cont_right li').eq(1).find('a').attr('href',''+data.blog_url+'');
                      }
                  }
                });              
            }
            else
            {
                $('.ban_cont_right li').eq(1).find('a').attr('href','//www.shejiben.com/account/login.php');
            }
        }
        
    }


    module.exports = {
        init: initNewHeader
    }

})
