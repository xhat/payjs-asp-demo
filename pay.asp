<%
' 功能：payjs支付接口创建订单并显示支付页面
' 版本：1.0
' 日期：2018-08-30
' 说明：
' 以下代码只是为了方便商户测试而提供的样例代码。
' 该代码由shanguo编写，仅免费提供给个人网站使用，联系QQ:1720019967，使用请保留本版权说明
%>
<!--#include file=md5.asp-->
<!--#include file=config.asp-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes" />
<link rel="shortcut icon" href="favicon.ico" >
<title>PAYJS充值中心</title>
<style type="text/css">
@media(max-width:960px)
{
  
}

<!--
.STYLE1 {
	font-family: "宋体";
	font-size: 18px;
	color: #FF0000;
	font-weight: bold;
}
.STYLE2 {
	font-family: "宋体";
	font-size: 12px;
}
.STYLE4 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<script>

function test()
{
    document.getElementById("myform").submit();    
}
</script>
<p>
<%
dim body,attach,mchid,out_trade_no,total_fee,sign,key


body ="ceshi" '自定义数据，不支持中文
attach= "22" '自定义数据
out_trade_no = Year(now()) & Month(now()) & day(now()) & hour(now()) & Minute(now()) & Second(now()) & Int((999999 * Rnd) + 111) ' 商户自定义订单号
total_fee="100" '充值金额,分

    stringC ="attach="&attach& "&body=" & body & "&callback_url="&callback_url& "&mchid="&mchid& "&notify_url=" & notify_url & "&out_trade_no=" & out_trade_no & "&total_fee=" & total_fee
    stringE="&key=" & key
    stringSignTempC = stringC + stringE
    sign = ASP_MD5(stringSignTempC)

'response.write(stringSignTempC)
'response.write"<br />"
'response.write(sign)
'response.end
%>
  
  </p>
</p>
<form  name="myfrom" id="myform" method="get" action="https://payjs.cn/api/cashier" >
<table width="35%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="##B7B7B0">
  <tr>
    <td height="50"><div align="center">
      <p class="STYLE1">微信收银台支付<br>
        
      </p>
      </div></td>
  </tr>
  <tr>
    <td><div align="center">
      <table width="300" border="0" align="center" cellpadding="0" cellspacing="3">
        <tr>
          <td height="40"> 充值商户号：
            <input name="mchid" type="text" id="mchid" value="<%=mchid%>" ></td>
          </tr>
        <tr>
          <td height="40">订单的标题：
            <input name="body" id="body" type="text"  readonly="readonly" value="<%=body%>" ></td>
        </tr>
        <tr>
          <td height="40">自定义字段：
            <input name="attach" id="attach" type="text"  readonly="readonly" value="<%=attach%>" ></td>
        </tr>
        <tr>
          <td height="40">充值订单号：
            <input name="out_trade_no" id="out_trade_no" type="text"  readonly="readonly" value="<%=out_trade_no%>" ></td>
        </tr>
        <tr>
          <td height="40">同步的地址：
            <input name="callback_url" id="callback_url" type="text"  readonly="readonly" value="<%=callback_url%>" ></td>
        </tr>
        <tr>
          <td height="40">异步的地址：
            <input name="notify_url" id="notify_url" type="text"  readonly="readonly" value="<%=notify_url%>" ></td>
        </tr>
        <tr>
          <td height="40"> 您充值金额：
            
            <input name="total_fee" id="total_fee" type="text"  readonly="readonly" value="<%=total_fee%>" >
            </td>
        </tr>
        <tr>
          <td height="40" valign="middle">你的SIGN：
            <input name="sign" id="sign" type="text"  readonly="readonly" value="<%=sign%>" ></td>
        </tr>
        <tr>
          <td height="40" valign="middle">支付方式：<img src="images/wechatpay.png" width="100" height="30"></td>
        </tr>
        <tr>
          <td height="2" valign="middle"></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td height="40"><div align="center">
      <label>
<input type="button" name="btn" value="提交" onClick="test()" />
      </label>
    </div></td>
  </tr>
  <tr>
    <td height="80">&nbsp;</td>
  </tr>
</table>
</form>
<p>&nbsp;</p>
<p>&nbsp; </p>
</body>
</html>
