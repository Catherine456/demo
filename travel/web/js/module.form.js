/**
 * 表单处理模块
 * 包括表单的验证模块，异步提交模块
 * 
 * @version 1.0
 * @author shejiben Team
 * 
 */

define(function(require, exports, module) {

	/**
	 * 表单处理模块
	 * @param  {[string or object]} form 为字符串时表示表单的id，为object时默认为表单元素对象
	 */
	function moduleForm(form, debug) {
		/**
		 * 初始化表单对象
		 */
		this.initForm = function(form) {
			if (typeof form === 'string') {
				return $('#' + form);
			} else if (typeof form === 'object') {
				return form;
			} else {
				throw new Error('It is not a form object');
			}
		};

		this.formElement  = this.initForm(form);
		this.debug 		  = typeof debug !== 'undefined' ? debug : false;
		this.validate     = false;  //默认表单不需要验证
		/**
		 * 表单验证规则
		 */
		this.validateRule = {

		};
		this.formError    = {};
		this.errorSize = function() {
			var size = 0, key;
		    for (key in this.formError) {
		        if (this.formError.hasOwnProperty(key)) size++;
		    }
		    return size;
		};

		/**
		 * 初始化表单异步提交的默认参数
		 */
		this.ajaxOptions  = {
			url : '',  //如果指定了url则ajax请求此地址，否则请求form中的action地址, 如果action也为空，则请求当前页地址
			beforeSubmit: null,  //表单提交之前的callback function
			success: null,	//提交之后的callback function
			resetForm: false,	//是否重置表单
			clearForm: false,	//提交完成后是否清空表单
			dataType: 'json',	//返回值类型
			type:'POST',		//表单请求方式 GET or POST
			file : false  //表单中是否有文件上传
		};
		this.formTagsName = ['input', 'textarea', 'select'];
		this.formTagsValue = {};
		this.pluginFile = '//www.shejiben.com/gb_js/jquery.form.js';

		this._submit = function() {
			var dthis = this;

			//表单验证
			if (!dthis.initValidate.validate()) {
				return false;
			}

			//表单提交前的回调函数
			if ( typeof dthis.beforeSubmit === 'function' ) {
				if ( !dthis.beforeSubmit() ) {
					return false;
				}
			}

			//处理表单中的一些默认数据
			dthis.updateFormData();

			//表单验证完-提交前中的事务处理
			if ( typeof dthis.submiting === 'function' ) {
				dthis.submiting();
			}

			return true;
		};

		/**
		 * 表单验证
		 * @param  {[object]} options 表单验证规则
		 * 
		 */
		this.initValidate = function(options) {
			var dthis = this;

			dthis.validate = true;

			$.extend(true, dthis.validateRule, options);			

			dthis.formElement.bind('submit', function() {
					
				if ( typeof dthis.validateRule === 'object' ) {
					if ( !dthis.initValidate.validate() ) {
						return false;
					}
				}

				//表单提交前的回调函数
				if ( typeof dthis.beforeSubmit === 'function' ) {
					if ( !dthis.beforeSubmit() ) {
						return false;
					}
				}

				//处理表单中的一些默认数据
				dthis.updateFormData();

				//表单验证完-提交前中的事务处理
				if ( typeof dthis.submiting === 'function' ) {
					dthis.submiting();
				}

				return true;

			})

			this.initValidate.validate = function() {
				$.each(dthis.validateRule, function(i , v) {
					var sForm = $('#' + i),
						sVal  = sForm.val();

					if ( typeof v.defaultValue !== 'undefined' ) {
						sVal = sVal == v.defaultValue ? '' : sVal;
					}

					if (sForm.length) {
						if (typeof v === 'object') {
							for (index in v) {
								var val = v[index],
									error_msg = '';

								//用户自定义验证规则
								//自定义函数接收两个参数，第一个为要验证的对象，第二个字段名，用来自定义错误消息
								//自定义例子'define': function( obj, i ) {
								//	formmodule.formError[i] = '错误消息';
								//}
								if ( index == 'define' && typeof val == 'function' ) {
									if ( !val( sForm, i ) ) {
										error_msg = i in dthis.formError ? dthis.formError[i] : 'error';
										setError(i, error_msg);
										return exeCallBack(v[index].onError, i);
									}
									break;
								}
								
								if (index == 'length') {
									var minLength = val.range[0] ? val.range[0] : 0,
										maxLength = val.range[1] ? val.range[1] : 0;
									if (maxLength == 0) {
										//大于某个数
										if (sVal.length <= minLength) {
											error_msg = 'msg' in val ? val.msg : '长度不合法';	
										}
									}  else {
										//0到某个数之间,没有负数
										if (sVal.length <= minLength || sVal.length >= maxLength) {
											error_msg = 'msg' in val ? val.msg : '长度不合法';
										}
									}
								}
								if (index === 'require') {
									if (!isRequire(sVal)) {
										error_msg = 'msg' in val ? val.msg : '不能为空';
									}
								}
								if(index === 'isChecked'){
									if(isChecked(sForm) == 0){
										error_msg = 'msg' in val ? val.msg : '请选择';
									}
								}
								if (index === 'isNumber') {
									if (!isNumber(sVal)) {
										error_msg = 'msg' in val ? val.msg : '不是合法的数字';
									}
								}
								if (index === 'isEmail') {
									if (!isEmail(sVal)) {
										error_msg = 'msg' in val ? val.msg : '邮箱格式不正确';
									}
								}
								if (index === 'isMobile') {
									if (!isMobile(sVal)) {
										error_msg = 'msg' in val ? val.msg : '手机号码格式不正确';
									}
								}
								if (index === 'isUrl') {
									if (!isUrl(sVal)) {
										error_msg = 'msg' in val ? val.msg : '不是合法的URL地址';
									}
								}
								if (index === 'isIp') {
									if (!isIp(sVal)) {
										error_msg = 'msg' in val ? v.msg : '不是合法的IP地址';
									}
								}
								if (error_msg != '') {
									setError(i, error_msg);
									return exeCallBack(v[index].onError, i, sForm);
									//捕获一个错误后跳出，继续下一个字段的验证
									break;
								} else {
									//清除该字段的错误信息
									clearError(i);
								}
							}
						}
					}
				});
				return dthis.errorSize() <= 0 ? true : false;
			}

			this.updateFormData = function() {
				var dthis = this;
				$.each(dthis.formTagsName, function(i, val) {
					var tasgList = dthis.formElement.find(val),
						key = '',
						nel = null,
						nName = '',
						ruleObj = {};
					if (tasgList) {
						tasgList.each(function(index, el) {
							nel = $(el);
							ruleObj = dthis.validateRule[nel.attr('id')];
							if ( typeof ruleObj !== 'undefined' && typeof ruleObj.defaultValue !== 'undefined' && nel.val() == ruleObj.defaultValue ) {
								nel.val('');
							}
						});
					}
				});
				return false;
			}

			function clearError(index) {
				if (index) {
					try {
						delete dthis.formError[index];
						return false;
					} catch (e) {}
				} else {
					dthis.formError = {};
				}
			}

			function setError(i, value) {
				dthis.formError[i] = value;
			}

			function exeCallBack(callback, i, element) {
				if (typeof callback === 'function') {
					//回调函数会返回两个参数，一个是本次错误的提示信息，一个是整个表单的所有错误信息
					//增加返回第三个参数为本次验证的表单对象
					callback(dthis.formError[i], dthis.formError, element);
					return false;
				} else {
					alert(dthis.formError[i]);
					return false;
				}
			}
		}

		//表单异步提交
		this.ajaxForm = function(options) {
			var dthis = this,
				sendUrl = '';
			$.extend(true, dthis.ajaxOptions, options);
			dthis.clearSubmitStatus();

			loopForm();
			if (dthis.ajaxOptions.file === true) {

				//如果需要做文件异步上传，需要引入第三方插件jquery.form.js
				//如果没有引用seajs，则使用jQuery的getScript方法动态加载插件JS
				if (typeof seajs !== 'undefined') {
					require.async(dthis.pluginFile, function(jForm) {
						dthis.formElement.submit(function() {

							if (dthis.validate === true) {
								if (!dthis.initValidate.validate()) {
									return false;
								}
							}
							
							loopForm();
							
							$(this).ajaxSubmit(options);
							return false;

						});
					});
				} else {
					$.getScript(dthis.pluginFile, function() {
						dthis.formElement.bind('submit', function() {

							if (dthis.validate === true) {
								if (!dthis.initValidate.validate()) {
									return false;
								}
							}

							loopForm();
							$(this).ajaxSubmit(options);
							return false;

						});
					});
				}
				
			} else {

				dthis.formElement.bind('submit', function() {
					
					//异步请求之前执行callback
					loopForm();

					if (dthis.validate === true) {
						if (!dthis.initValidate.validate()) {
							return false;
						}
					}

					//设置提交url
					if (!dthis.ajaxOptions.url.length) {
						sendUrl = typeof dthis.formElement.attr('action') !== 'undefined'  
								? dthis.formElement.attr('action') : window.location.href; 
					} else {
						sendUrl = dthis.ajaxOptions.url;
					}

					loopForm();

					if ( dthis.ajaxOptions.data ) {
						$.each( dthis.ajaxOptions.data, function( i, v )  {
							dthis.formTagsValue[i] = v;
						} )
					}

					//异步提交
					$.ajax({
						url: sendUrl,
						type: dthis.ajaxOptions.type,
						dataType: dthis.ajaxOptions.dataType,
						data: dthis.formTagsValue,
						beforeSend : function(XHR) {
							if (typeof dthis.ajaxOptions.beforeSubmit === 'function') {
								if ( !dthis.ajaxOptions.beforeSubmit(dthis.formTagsValue) ) {
									return false;
								}
							}
						},
						success : function(data) {

							//清空表单
							if (dthis.ajaxOptions.clearForm === true) {
								dthis.ajaxForm.clearForm();
							} else {
								//重置表单
								if (dthis.ajaxOptions.resetForm === true) {
									dthis.ajaxForm.resetForm();
								}
							}

							if (typeof dthis.ajaxOptions.success === 'function') {
								dthis.ajaxOptions.success(data);
							}
						}
					});

					return false;
				})

				
			}

			/**
			 * 清空表单
			 */
			this.ajaxForm.clearForm = function() {
				return dthis.formElement.find('input, select, textarea').each(function() {
					var t = this.type, tag = this.tagName.toLowerCase();
					if (t == 'text' || t == 'password' || tag == 'textarea') {
						this.value = '';
					}
					else if (t == 'checkbox' || t == 'radio') {
						this.checked = false;
					}
					else if (tag == 'select') {
						this.selectedIndex = -1;
					}
				});
			}

			/**
			 * 重置表单元素
			 */
			this.ajaxForm.resetForm = function() {
				return dthis.formElement[0].reset();
			}

			function loopForm() {
				$.each(dthis.formTagsName, function(i, val) {
					var tasgList = dthis.formElement.find(val),
						key = '',
						nel = null,
						nName = '';
					if (tasgList) {
						tasgList.each(function(index, el) {
							nel = $(el);
							if (typeof nel.attr('name') !== 'undefined') {
								key = nel.attr('name');
								nName = el.nodeName.toLowerCase();
								if (nName == 'input' && nel.attr('type') == 'file') {
									dthis.ajaxOptions.file = true;
								}
								if (nName == 'input' && nel.attr('type') == 'radio') {
									var tval = el.checked ? nel.val() : '';
									dthis.formTagsValue[key] = tval;
								} else {
									dthis.formTagsValue[key] = nel.val().replace(/\s+/, '');
								}
							} 
						});
					}
				});
			}
			
		}

		this.clearSubmitStatus = function() {
			this.formElement[0].onSubmit = function() { return false; };
			this.formElement.unbind('submit');
		}

		this.countWords = function( obj, maxLength, triggerType, callback ) {

			this.trigger = obj;

			this.callback = callback;

			this.triggerType = triggerType ? triggerType : 'keyup change';

			this.max = maxLength;

			this.count = function() {

				var tLen = this.trigger.val().length,
					plus = this.max - tLen;

				if ( plus < 0 ) {
					this.trigger.val( this.trigger.val().substr( 0, this.max ) );
					plus = 0;
				}
				return plus;
			}

			var _this = this;
			this.trigger.bind( this.triggerType, function() {
				var plus = _this.count();

				if ( typeof _this.callback === 'function' ) {
					_this.callback( plus );
				}

			} );

		}

		function isRequire(str) {
			if (typeof str === 'number') {
				return str > 0 ? true : false;
			} else if (typeof str === 'string') {
				if(String.prototype.trim){
					return str.trim().length > 0 ? true : false;
				}
				else{
					return str.replace(/^\s|\s$/g,'');

				}	
				
			}
			
			return false;
		}
		function isChecked(obj){
			return obj.find('option:selected').index();
		}
		function isNumber(str) {
			return /^\d+$/.test(str)
		}
		function isEmail(str) {
			return /^[A-Z_a-z0-9-\.]+@([A-Z_a-z0-9-]+\.)+[a-z0-9A-Z]{2,4}$/.test(str)
		}
		function isMobile(str) {
			return /^((\(\d{2,3}\))|(\d{3}\-))?((1[3457]\d{9})|(18\d{9}))$/.test(str)
		}
		function isUrl(str) {
			return /^(http:|ftp:|https)\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"])*$/.test(str)
		}
		function isZip(str) {
			return /^[1-9]\d{5}$/.test(str)
		}
		function isIp(str) {
			return /^(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5])$/.test(str)
		}

	}

	exports.moduleForm = moduleForm;

});