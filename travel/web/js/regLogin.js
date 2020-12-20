var isReg = false,
    isRegMsg = '该手机号已注册, 您可以直接登录';
$(function () {
    /*头部导航栏搜索框的展开和隐藏*/
    $('#search_box').find('.search_btn').click(function(){  //搜索
        var t = $(this),
            p_b = $(this).parent();
        if($('#search_box').find('.sbi_inp').val() == ''){
            if($('#search_box').css('width') == '35px'){
                $('#search_box').siblings('.navbar_ul').hide();
                t.addClass('sb_bottomLine');
                $('#search_box').css('overflow','visible');
                $('#search_box').animate({width:'420px'},200);
                $('.navbar_collapse').show();   //zqj 01-04 10:10
            }else{
                $('#search_box').animate({width:'35px'},200,'linear',function(){
                    $('#search_box').css('overflow','hidden');
                    $('#search_box').siblings('.navbar_ul').show();
                    $('.navbar_collapse').hide();   //zqj 01-04 10:10
                    t.removeClass('sb_bottomLine');
                });
            }
        }
    });

    var isClick = false;
    $('#search_box').find('.c-search_sort_li').click(function(){
        isClick = true;
    })
    $('#search_box').find('.sbi_inp').blur(function(){
        setTimeout(function(){
            if(isClick){
                $('#search_box').find('.sbi_inp').focus();
                isClick = false;
                return;
            }
            if($('#search_box').css('width') == '35px'){return;}
            $('#search_box').animate({width:'35px'},200,'linear',function(){
                $('#search_box').css('overflow','hidden');
                $('#search_box').find('.search_btn').removeClass('sb_bottomLine');
                $('#search_box').siblings('.navbar_ul').show();
                $('.navbar_collapse').hide();    //zqj 01-04 10:10
                $('#search_box').find('.sbi_inp').val('');
            });
        },100)
    });
    $('#search_box').find('.sb_select').on('mouseover mouseout',function(e){
        if(e.type == 'mouseover'){
            $('.sbs_ul').show();
        }else if(e.type == 'mouseout'){
            $('.sbs_ul').hide();
        }
    })
    $('#search_box').find('.sbs_ul').on('mouseover mouseout',function(e){
        if(e.type == 'mouseover'){
            $('.sbs_ul').show();
        }else if(e.type == 'mouseout'){
            $('.sbs_ul').hide();
        }
    })
    $('#search_box').find('.sbs_ul').children('li').click(function(){
        $('#search_box .sbs_ul').hide();
        var txt = $(this).html(),
            type = $(this).attr('data-type');
        $('#search_box').find('#sbs_s').html(txt);
        $('#search_box').find('#sbs_s').attr('data-type',type);
    })
    /*头部导航栏搜索框的展开和隐藏END*/

    // checkReg
    function checkReg($obj){
        var mobile = $('#mobile').val();
        if(checkMobile(mobile)) {
            $.ajax({
                type: 'get',
                url: '/ValidateAsync/CheckAccount',
                data: {account: mobile, type: 1},
                success: function (res) {
                    // console.log(res);
                    if(res) { // true 已注册
                        isReg = true;
                        $obj.find('.tip_container .tip_msg').html(isRegMsg);
                    }else{ // false 未注册
                        isReg = false;
                        $obj.find('.tip_container .tip_msg').html('');
                        if($obj.attr('id') === 'regForm'){
                            regCheckFn();
                        }else if($obj.attr('id') === 'bindNewAccountForm'){
                            thirdRegCheckFn();
                        }                        
                    }
                }
            });
        }
    }

    $('#regForm #mobile').on('blur', function () {
        checkReg($('#regForm'));
    });
    $('#bindNewAccountForm #mobile').on('blur', function () {
        checkReg($('#bindNewAccountForm'));
    });

    // 搜索功能
    function searchFun(v){
        $(v).parents('.c-search_box').find('.c-search_sort_box').on('mouseover',function(){
            $(this).parents('.c-search_box').find('.c-search_sort_ul').show();
        })

        $(v).parents('.c-search_box').find('.c-search_sort_box').on('mouseleave',function(){
            $(this).parents('.c-search_box').find('.c-search_sort_ul').hide();
        })
        function moveEnd(obj) {
            obj.focus();
            var len = obj.value.length;
            if (document.selection) {
                var sel = obj.createTextRange();
                sel.moveStart('character', len);
                sel.collapse();
                sel.select();
            } else if (typeof obj.selectionStart == 'number'
                && typeof obj.selectionEnd == 'number') {
                obj.selectionStart = obj.selectionEnd = len;
            }
        }
        $(v).parents('.c-search_box').find('.c-search_sort_li').on('click',function(){
            var txt = $(this).html(),
                type = $(this).attr('data-type');
            $(this).parents('.c-search_box').find('.c-search_sort_default').html(txt).attr('data-type',type);
            $(this).parents('.c-search_box').find('.c-search_sort_ul').hide();
        })
        function searFun(obj,target) {
            var key = obj.parents('.c-search_box').find('.c-keywords').val(),
                type = obj.parents('.c-search_box').find('.c-search_sort_default ').attr('data-type');
            key = key.replace(/(^\s*)|(\s*$)/g,'').replace(/^\s*$/,'');
            if(key==''){
                obj.parents('.c-search_box').find('.c-keywords').val('');
            }else{
                obj.parents('.c-search_box').find('.c-keywords').val('');
                if(target){
                    window.open('http://www.cndesign.com/Query/To?type=' + type + '&key=' + escape(key));
                }else{
                    window.location.href = 'http://www.cndesign.com/Query/To?type=' + type + '&key=' + escape(key);
                }
            }
        }
        $(v).on('click', function () {
            if($(this).parents('.c-search_box').hasClass('_self')){
                var target = 1;
                searFun($(this),target);
            }else{
                searFun($(this));
            }
        });
        // 回车检索
        $(v).parents('.c-search_box').find('.c-keywords').on('keydown',function(e){
            if(e.keyCode == 13){
                if($(this).parents('.c-search_box').hasClass('_self')){
                    target = 1;
                    searFun($(this),target);
                }else{
                    searFun($(this));
                }
            }
        })
    }

    // 表单对象化
    $.fn.serializeObject = function () {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if(o[this.name]){
                if(!o[this.name].push){
                    o[this.name] = [ o[this.name] ];
                }
                o[this.name].push(this.value || '');
            }else{
                o[this.name] = this.value || '';
            }
        });
        return o;
    }

 // 异步获取短信验证码
    function getSmsCodeFn(reqObj, $tip){
        $('.btn_sendCode').addClass('hide');
        $('.btn_disabled').removeClass('hide');
        var s = 60;
        $('#seconds').html(--s);
        var timer = setInterval(function(){
            $('#seconds').html(--s);
            if(s < 0){
                $('.btn_disabled').addClass('hide');
                $('.btn_sendCode').removeClass('hide');
                clearInterval(timer);
            }
        }, 1000);
    }

    // 获取短信验证码事件
    $('form').on('click', '.btn_sendCode', function () {
        var $t = $(this);
        var $f = $t.parents('form');
        var mobile = checkMobile($f.find('#mobile').val());
        var type = $t.attr('data-type');
        var $tip = $f.find('.tip_msg');
        if(mobile){
                getSmsCodeFn({ mobile: mobile, type: type }, $tip);
        }else{
            $tip.show().html('请输入有效的手机号');
        }
    });
    // 调用方法
    searchFun($('.c-search_btn')); //调用搜索

    // 实现placeholder
    $('input.ctrlReg').each(function () {
        var $c = $(this);
        var $p = $c.prev();
        var $h = $p.find('.placeholder_txt');
        if ($c.val() != '') {
            $h.hide();
        }else {
            $h.show();
        }
        $c.bind({
            change: function () {
                if ($c.val() != '') {
                    $h.hide();
                }else {
                    $h.show();
                }
            },
            keyup: function(){
                if ($c.val() != '') {
                    $h.hide();
                } else {
                    $h.show();
                }
            }
        });
    });

    // 切换登录方式
    $('#accountTab').click(function () {
        $('#pswLogin').show();$('#smsLogin').hide();
        $(this).addClass('active').siblings('span').removeClass('active');
        $('#mobile').val('').parents('.form_con').find('.placeholder_txt').show();
        $('#pwd').val('').parents('.form_con').find('.placeholder_txt').show();
    });
    $('#smsTab').click(function () {
        $('#smsLogin').show();$('#pswLogin').hide();
        $(this).addClass('active').siblings('span').removeClass('active');
        $('#account').val('').parents('.form_con').find('.placeholder_txt').show();
        $('#captcha').val('').parents('.form_con').find('.placeholder_txt').show();
    });

    // 登录标签页初始化
    var loginNav = $('#nav').val();
    if(loginNav == '1'){
        $('#accountTab').trigger('click');
    }else if(loginNav == '2'){
        $('#smsTab').trigger('click');
    }

    // 账号密码登录
    $('#pswLogin').on('blur', 'input', function () {
        pswCheckFn();
    });

    $('#pswLogin').on('keyup', 'input', function () {
        var obj = $('#pswLogin').serializeObject();
        if(obj.account != '' && obj.pwd != ''){
            $('#pswLogin input[type="submit"]').removeAttr('disabled').removeAttr('style');
            $('#pswTip').html('').hide();
        }else{
            $('#pswLogin input[type="submit"]').attr('disabled','disabled').css({'cursor':'default','backgroundColor':'#ddd','borderColor':'#ddd'});
        }
    });

    // 短信登录
    $('#smsLogin').on('blur', 'input', function () {
        smsCheckFn();
    });

    $('#smsLogin').on('keyup', 'input', function () {
        var obj = $('#smsLogin').serializeObject();
        if(obj.mobile != '' && obj.captcha != ''){
            $('#smsLogin input[type="submit"]').removeAttr('disabled').removeAttr('style');
        }else {
            $('#smsLogin input[type="submit"]').attr('disabled','disabled').css({'cursor':'default','backgroundColor':'#ddd','borderColor':'#ddd'});
        }
    });

    // 切换注册分类(个人、机构)
    $('#regSort').on('click', 'span', function () {
        var $this = $(this);
        $this.addClass('active').siblings('span').removeClass('active');
        var type = $this.attr('data-type');
        if(type == 0){
            $('#designer').trigger('click');
        }else if(type == 1){
            $('#other').trigger('click');
        }
    });

    // 注册
    $('#regForm').on('blur', 'input', function () {
        regCheckFn();
    });

    $('#regForm').on('keyup', 'input', function () {
        var obj = $('#regForm').serializeObject();
        if(obj.account != '' && obj.pwd != '' && obj.captchaImg != '' && obj.captcha != '' && obj.regAgreement){
            $('#regForm input[type="submit"]').removeAttr('disabled').removeAttr('style');
            $('#tipMsg').html('').hide();
        }else{
            $('#regForm input[type="submit"]').attr('disabled','disabled').css({'cursor':'default','backgroundColor':'#ddd','borderColor':'#ddd'});
        }
    });


    $('#regAgreement').on('change', function () {
        if($(this).prop('checked')) {
            if($('#regForm').length > 0 && regCheckFn()){
                $('#regForm input[type="submit"]').removeAttr('disabled').removeAttr('style');
            }
            if($('#thirdLogin').length > 0 && thirdLoginCheckFn()) {
                $('#thirdLogin input[type="submit"]').removeAttr('disabled').removeAttr('style');
            }
            if($('#bindNewAccountForm').length > 0 && thirdRegCheckFn()) {
                $('#bindNewAccountForm input[type="submit"]').removeAttr('disabled').removeAttr('style');
            }
        }else{
            $('input[type="submit"]').attr('disabled','disabled').css({'cursor':'default','backgroundColor':'#ddd','borderColor':'#ddd'});
            $('.tip_container .tip_msg').show().html('勾选同意协议后才能注册');
        }
    });


    // 绑定已有账号
    $('#thirdLogin').on('blur', 'input', function () {
        thirdLoginCheckFn();
    });

    $('#thirdLogin').on('keyup', 'input', function () {
        var obj = $('#thirdLogin').serializeObject();
        if(obj.account != '' && obj.pwd != '' && obj.regAgreement){
            $('#pswLogin input[type="submit"]').removeAttr('disabled').removeAttr('style');
            $('#thirdLoginTip').html('').hide();
        }else{
            $('#thirdLogin input[type="submit"]').attr('disabled','disabled').css({'cursor':'default','backgroundColor':'#ddd','borderColor':'#ddd'});
        }
    });

    // 绑定新账号
    $('.reg_sel').find('label').each(function (i) {
        $(this).click(function () {
            $(this).addClass('active');
            $(this).prev('input').attr('checked',true);
            $(this).siblings('label').removeClass('active');
            $(this).siblings('label').prev('input').attr('checked',false);
        });
    });
    $('#bindNewAccountForm').on('blur', 'input', function () {
        thirdRegCheckFn();
    });

    $('#bindNewAccountForm').on('keyup', 'input', function () {
        var obj = $('#bindNewAccountForm').serializeObject();
        if(obj.nickName != '' && obj.account != '' && obj.pwd != '' && obj.captchaImg != '' && obj.captcha != '' && obj.regAgreement){
            $('#pswLogin input[type="submit"]').removeAttr('disabled').removeAttr('style');
            $('#thirdTipMsg').html('').hide();
        }else{
            $('#bindNewAccountForm input[type="submit"]').attr('disabled','disabled').css({'cursor':'default','backgroundColor':'#ddd','borderColor':'#ddd'});
        }
    });

    // 显示明文密文密码切换
    $('.fc_icon_eye_closed').on('click', function () {
        var $t = $(this);
        var $i = $t.siblings('input');
        if($i.attr('type') == 'password'){
            $i.attr('type', 'text');
            $t.addClass('fc_icon_eye_open');
        }else{
            $i.attr('type', 'password');
            $t.removeClass('fc_icon_eye_open');
        }
    });
});

// 绑定已有账号提交验证
function thirdLoginCheckFn(){
    var obj = $('#thirdLogin').serializeObject();
    if(obj.account == ''){
        $('#thirdLoginTip').show().html('请输入账号');
        return false;
    }else if(obj.pwd == ''){
        $('#thirdLoginTip').show().html('请输入密码');
        return false;
    }else {
        $('#thirdLogin input[type="submit"]').removeAttr('disabled').removeAttr('style');
        $('#thirdLoginTip').html('').hide();
        return true;
    }
}

// 绑定新账号提交验证
function thirdRegCheckFn() {
    var obj = $('#bindNewAccountForm').serializeObject();
    if(obj.nickname == '') {
        $('#thirdTipMsg').show().html('请输入昵称');
        return false;
    }else if(obj.account == ''){
        $('#thirdTipMsg').show().html('请输入手机号');
        return false;
    }else if(!checkMobile(obj.account)){
        $('#thirdTipMsg').show().html('手机号输入有误');
        return false;
    }else if(isReg){
        $('#thirdTipMsg').show().html(isRegMsg);
    }else if(obj.pwd == ''){
        $('#thirdTipMsg').show().html('请输入密码');
        return false;
    }else if(!checkPwd(obj.pwd)){
        $('#thirdTipMsg').show().html('密码需含字母，符号或数字中至少两项，不少于6位不超过20位');
        return false;
    }else if(obj.captchaImg == ''){
        $('#thirdTipMsg').show().html('请输入文字验证码');
        return false;
    }else if(obj.captcha == ''){
        $('#thirdTipMsg').show().html('请输入短信验证码');
        return false;
    }else if(obj.regAgreement !== 'on'){
        $('#thirdTipMsg').show().html('勾选同意协议后才能注册');
        return false;
    }else {
        $('#bindNewAccountForm input[type="submit"]').removeAttr('disabled').removeAttr('style');
        $('#thirdTipMsg').html('').hide();
        return true;
    }
}

// 验证手机号 合法返回 手机号码， 非法返回 false
function checkMobile(mobile){
    if(!/^((13|18)(\d{9}))$|^(14[57]\d{8})$|^(17\d{9})$|(^15[0-35-9]\d{8}$)/.test(mobile)){
        return false;
    }
    return mobile;
}

// 验证密码 合法返回 密码, 非法返回 false
function checkPwd(pwd){
    if(!/^(?!.*[\u4E00-\u9FA5\s])(?!^[a-zA-Z]+$)(?!^[\d]+$)(?!^[^a-zA-Z\d]+$)^.{6,20}$/.test(pwd)){
        return false;
    }
    return pwd;
}

// 验证图片验证码
function checkImgCode(){
    var imgCode = $('#captcha_img').val();
    if(imgCode){
        return imgCode;
    }else{
        return false;
    }
}

// 密码登录提交验证
function pswCheckFn() {
    var obj = $('#pswLogin').serializeObject();
    if(obj.account == ''){
        $('#pswTip').show().html('请输入正确的手机号/邮箱');
        return false;
    }else if(obj.pwd == ''){
        $('#pswTip').show().html('请输入密码');
        return false;
    }else {
        $('#pswLogin input[type="submit"]').removeAttr('disabled').removeAttr('style');
        $('#pswTip').html('').hide();
        return true;
    }
}

// 短信登录提交验证
function smsCheckFn() {
    var obj = $('#smsLogin').serializeObject();
    if(obj.account == ''){
        $('#smsTip').show().html('请输入手机号');
        return false;
    }else if(obj.captcha == ''){
        $('#smsTip').show().html('请输入短信验证码');
        return false;
    }else {
        $('#smsLogin input[type="submit"]').removeAttr('disabled').removeAttr('style');
        $('#smsTip').html('').hide();
        return true;
    }
}


//注册提交验证
function regCheckFn(){
var obj = $('#regForm').serializeObject();
if(obj.mobile==''){
    $('#tipMsg').show().html('手机号输入有误');
    return false;
}else if(obj.pwd == ''){
    $('#tipMsg').show().html('请输入密码');
    return false;
}else if(obj.captcha == ''){
    $('#tipMsg').show().html('请输入短信验证码');
    return false;
}else {
    $('#regForm input[type="submit"]').removeAttr('disabled').removeAttr('style');
    $('#tipMsg').html('').hide();
    return true;
}
}