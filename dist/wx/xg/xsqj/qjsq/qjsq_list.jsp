















<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/wx/xg/yz-mobile/lib/weui/css/weui.css"/>
    <link rel="stylesheet" href="/wx/xg/yz-mobile/lib/weui/css/weuix.css"/>
    <link rel="stylesheet" href="/wx/xg/yz-mobile/css/main.css">
	<link rel="stylesheet" href="/wx/xg/yz-mobile/css/home.css">
    <link rel="stylesheet" href="/wx/xg/yz-mobile/css/font.css">

    <script src="/wx/xg/yz-mobile/lib/weui/js/zepto.min.js"></script>
    <script src="/wx/xg/yz-mobile/lib/weui/js/zepto.weui.js"></script>

    <script src="./lib/weui/js/iscroll-lite.js"></script>
    <title>请假列表</title>
    <style type="text/css">
    	.box-text {
		    width: 90%;
		    margin: 30px 5% 0 5%;
		    padding: 5px 156px;
		    border-top: 1px solid #ece1e1;
		}
		.box-text .box-text-title {
		    display: block;
		    width: 100px;
		    position: relative;
		    top: -15px;
		    text-align: center;
		    background: white;
		    font-size: 12px;
		    color: #b3b3b3;
		    background-color: #F3F3F3;
		}
		.weui-cells.leavelist .weui-cell .weui-cell__icon {
		    width: 50px;
		    height: 50px;
		    font-size: 17px;
		}
		.fhan{
			transform:rotate(-180deg)
		}
		.fhbtn{
			background-color:transparent;
			border-style:none;
			float: left;
			line-height:20px;
			color: #538fff;
			outline: none;
			margin-left: 15px;
		}
		
		.weui-btn:after {
		   border: 0px solid rgba(0, 0, 0, 0.2);
		} 
		
		a:hover {text-decoration: none; color:#000000}
    </style>
</head>
<body>
<div class="container details">
	<div class="topbar" style="height: 52px;">
	   <div class="top-head">
	      <div>
			<a href="/wx/xg/yz-mobile/grzx_xs.jsp">
				<i class="iconfont icon-back"style="color: #FFF;"></i>
			</a>
		  </div>
	      <div>请假列表</div>
	       <div>
	       	 <a  href="/wx/xg/yz-mobile/index.jsp">
	          	<i class="iconfont icon-fangzi" style="color: #FFF;"></i>
	         </a>
	       </div>  
	    </div>
 	</div>
	<form name="form1" id="form1" method="post" action="">
		<div class="weui-cells__title custom">
    		
    			<span style="color: #ec9a2c;font-size: 14px;">您当前状态为学工不管理，无法请假，请联系辅导员处理~ </span>
    		
    		
    	</div>
    	<div class="weui-cells leavelist custom">
			<!--审核通过 调用class  pass   为通过调用  notpass-->
	        
	        
	        <a class="weui-cell weui-cell_access pass" href="qjsq_info.jsp?id=b5all36paiv4f659p6wg7re37q5l9939&lb=xs">
	            <div class="weui-cell__icon">                                
	                庆海
	            </div>
	            <div class="weui-cell__bd">
	                <span>所属学院：软件学院</span>
	                <span>请假类型：其他事由</span>
	                <span>行程范围：西安市内</span>
	                <span>请假开始时间：2020-09-05 18:00</span>
	                <span>请假结束时间：2020-09-05 20:00</span>
	                <div class="datebox">
	                    <span class="date">2020-09-05 12:59:31</span>
	                    
	                    <span class="status" style="color: #999;">已销假</span>
	                	
	                </div>
	            </div>
	            <div class="weui-cell__ft">
	            </div>
	        </a>
	        
	          
	          
	        
	        <div>
	        	<div class='pager' style="text-align: right;">
		            





<script type="text/javascript">
	 function next(Number,page)
	   {   
	 
		    document.form1.PAGENUMBER.value=Number;
		    document.form1.PAGEGROUP.value=page;
		    document.form1.submit();
	  
	   }
      function gotoPage(total){
	       //page 是当前页
	       //group 是当前组
	      var page=document.form1.page.value;
	      if(page>total){
	        page=total;
	      }
	      var group =(page%5==0? parseInt(page/5-1) : parseInt(page/5));
	      document.form1.PAGENUMBER.value=page;
		  document.form1.PAGEGROUP.value=group;
		  document.form1.submit();     
      }
  </script>

	<input type="hidden" name = "PAGENUMBER" value = "1" />
    <input type="hidden" name = "PAGEGROUP" value = "0" />
    <span style="font-size:12px">
     共1条&nbsp;1/1页</span> | <a href="javascript:next('1','0');">首页</a>
    
		  
                
                 
			            <a href="javascript:void(0);" class='pgbg02'>上一页</a>
			     
			        
				
			    
			  
			     
           <!--  <a><b><FONT class="style4">1</FONT></b></a>-->


        
		  <a href="javascript:void(0);" class='pgbg'>下一页</a>
		 
		  | <a href="javascript:next('1','0');">末页</a>
	   
</span><br>
		        </div>
	        </div>
	        
	        
		</div>
	</form>
	<div class="footer-copy-space"></div>
</div>

<script>
	$(function(){
	    $('.weui-navbar__item').on('click', function () {
	        $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
	        $($(this).attr("href")).show().siblings('.weui-tab__content').hide();
	    });
	});
	
	//撤销请假申请 
	function xscxqj(id){
		$.confirm("您确定撤销此申请吗？", function() {
		         $.ajax({
					url:'qjsq_util.jsp',
					data:{actionType:'xscxqj',id:id},
					dataType:'json',
					type:'post',
					success:function(data){
					console.log("state:"+data.state);
						if(data.state==1){
							$.toast("撤销成功", 30000);
						    window.location.reload();
						}else{
							alert("操作出现异常，请稍后再试！");
						}
					}
				});
		   }, function() {
		   
		   });
   };
	
</script>
<div class="weui-gallery" style="display: none">
    <span class="weui-gallery__img"></span>
    <div class="weui-gallery__opr">
    </div>
</div>
<script src="/wx/xg/yz-mobile/js/checkdev.js"></script>
</body>
</html>
