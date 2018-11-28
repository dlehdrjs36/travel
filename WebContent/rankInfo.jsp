<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rankInfo.js"></script>

</head>

<body onLoad="calls()">

<div class="centered main">
    <form name="bing">
    <div style="display:none;">
    <select name="where">
            <option value="es-AR">Argentina (Spanish)</option>
            <option value="en-AU">Australia (English)</option>
            <option value="de-AT">Austria (German)</option>
            <option value="nl-BE">Belgium (Dutch)</option>
            <option value="fr-BE">Belgium (French)</option>
            <option value="pt-BR">Brazil (Portuguese)</option>
            <option value="en-CA">Canada (English)</option>
            <option value="fr-CA">Canada (French)</option>
            <option value="es-CL">Chile (Spanish)</option>
            <option value="da-DK">Denmark (Danish)</option>
            <option value="fi-FI">Finland (Finnish)</option>
            <option value="fr-FR">France (French)</option>
            <option value="de-DE">Germany (German)</option>
            <option value="zh-HK">Hong Kong (Traditional Chinese)</option>
            <option value="en-IN">India (English)</option>
            <option value="en-ID">Indonesia (English)</option>
            <option value="it-IT">Italy (Italian)</option>
            <option value="ja-JP">Japan (Japanese)</option>
            <option value="ko-KR">Korea (Korean)</option>
            <option value="en-MY">Malaysia (English)</option>
            <option value="es-MX">Mexico (Spanish)</option>
            <option value="nl-NL">Netherlands (Dutch)</option>
            <option value="en-NZ">New Zealand (English)</option>
            <option value="no-NO">Norway (Norwegian)</option>
            <option value="zh-CN">People's Republic of China (Chinese)</option>
            <option value="pl-PL">Poland (Polish)</option>
            <option value="pt-PT">Portugal (Portuguese)</option>
            <option value="en-PH">Philippines (English)</option>
            <option value="ru-RU">Russia (Russian)</option>
            <option value="ar-SA">Saudi Arabia (Arabic)</option>
            <option value="en-ZA">South Africa (English)</option>
            <option value="es-ES">Spain (Spanish)</option>
            <option value="sv-SE">Sweden (Swedish)</option>
            <option value="fr-CH">Switzerland (French)</option>
            <option value="de-CH">Switzerland (German)</option>
            <option value="zh-TW">Taiwan (Traditional Chinese)</option>
            <option value="tr-TR">Turkey (Turkish)</option>
            <option value="en-GB">United Kingdom (English)</option>
            <option value="en-US" selected>United States (English)</option>
            <option value="es-US">United States (Spanish)</option>
        </select>
	</p>	
	
	<div id="query">
        <input type="text" name="query" id="term" value="<%=request.getAttribute("name")%>" placeholder="Search the Web" autocomplete=off style="display:none;">
	
    <input type=checkbox name="what" id="webpages" value="webpages">
        <label for="webpages">Web pages</label>
    <input type=checkbox name="what" id="news" value="news">
        <label for="news">News</label>
    <input type=checkbox name="what" id="images" value="images">
        <label for="images">Images</label>
    <input type=checkbox name="what" id="videos" value="videos">
        <label for="videos">Videos</label>
	</div>
    <select name="when">
        <option value="" selected>All time</option>
        <option value="month">Past month</option>
        <option value="week">Past week</option>
        <option value="day">Last 24 hours</option>
    </select>
    

    &nbsp;&nbsp;&nbsp;<input type=checkbox id="safe" name="safe" value="on" checked><label for="safe">SafeSearch</label>

    <!-- these hidden fields control paging -->
    <input type=hidden name="count" value="25">
    <input type=hidden name="offset" value="0">
    </div>
    </p>
</form>
	
	<div id="dropdown3-hide" class="dropdown3-content centered" style="display:block; border-radius: 10px;width:1000px;"> 

	<div id="sidebar">
	    <div id="_sidebar"></div>
	</div>
	
	<div id="pole">
	    <div id="_pole"></div>
	</div>
	
	<div id="mainline">
	    <div id="_mainline"></div>
	</div>
	
	<div id="paging2">
	    <div id="_paging2"></div>
	</div>
	
	</div>
	</div>
	<script>
	function calls()
	{
		doRelatedSearch('<%=request.getAttribute("name")%>여행');
		frm.submit();
	}
	</script>
	<footer class="w3-container footer" style="padding:16px">
  <a href="#" class="w3-button w3-black w3-padding-large w3-margin-bottom"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
    <br>
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>  
</footer>
</body>
</html>