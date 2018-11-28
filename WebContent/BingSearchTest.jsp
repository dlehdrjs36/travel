<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0014)about:internet -->
<!-- the above Mark of the Web lets IE run this page in the Internet security zone,
     avoiding the permission prompt for running active content such as JavaScript -->
<html>
<head>
    <meta charset="UTF-8"> 
    <title>Bing Image Search API Demo</title>
    <base target="_blank">
<style type="text/css">

html, body, div, p, h1, h2 {font-family: Verdana, "Lucida Sans", sans-serif; color: #000;}
html, body, div, p  {font-weight: normal;}
body {background-color: #fff;}

h1, h2, h3 {font-weight: bold; color: #087;}
sup {font-weight: normal;}

html, body, div, p  {font-size: 12px;}
h1 {font-size: 20px; margin-top: 30px;}
h2 {font-size: 16px; clear: left;}
h3 {font-size: 14px; clear: left;}

#sidebar {font-size: 10px; text-align: right; display: flex; padding: 0px 10px; 
    float: right; margin-left: 15px; margin-right: 0px;}
#sidebar p {margin-top: 0px; font-size: 10px;}
#sidebar img {display: inline-block; float: none; padding-right: 0px;}
#pole p {font-size: 14px;}
#pole, #mainline, #json, #http, #sidebar, #error, #paging1, #paging2 
    {display: none;}

#term {width: 100%;}
#logo {padding: 15px; float: right; border-left: 2px solid #ccc;}
#query {float: left;}

img {vertical-align: top; float: left; margin-right: 10px; margin-bottom: 10px;}
p.images {display: inline-block; font-size: 9px; vertical-align: top;}
p.images img {float: none;}
p.relatedSearches {clear: none;}
#logo p, p.news, p.webPages, p.images {clear: left;}

a[href="#"]:link {color: blue;}
a[href="#"]:visited {color: blue;}

h3 a:visited {color: #087 !important;}
h3 a:link {color: #087 !important;}

</style>
<script type="text/javascript">

// cookie names for data we store(저장하는 데이터의 쿠키 이름)
// YOUR API KEY DOES NOT GO IN THIS CODE; don't paste it in.(귀하의 API 키는이 코드를 따르지 않습니다. 그것을 붙이지 마십시오.)
API_KEY_COOKIE   = "c6508713f6634f5d866e7c60d96af2c5";
CLIENT_ID_COOKIE = "bing-search-client-id";

// Bing Search API endpoint(Bing Search API 엔드 포인트)
BING_ENDPOINT = "https://api.cognitive.microsoft.com/bing/v7.0/images/search";	

// Various browsers differ in their support for persistent storage by local
// HTML files (IE won't use localStorage, but Chrome won't use cookies). So
// use localStorage if we can, otherwise use cookies.

/* 
다양한 브라우저가 로컬 HTML 파일에 의해 영구 저장소에 대한 지원이 다릅니다 
(IE는 localStorage를 사용하지 않지만 Chrome은 쿠키를 사용하지 않습니다)
가능한 경우 localStorage를 사용하고, 그렇지 않으면 쿠키를 사용하십시오.  
 */

try {
    localStorage.getItem;   // try localStorage(localStorage를 시도해보십시오.)

    window.retrieveValue = function (name) {
        return localStorage.getItem(name) || "";
    }
    window.storeValue = function(name, value) {
        localStorage.setItem(name, value);
    }
} catch (e) {
    window.retrieveValue = function (name) {
        var cookies = document.cookie.split(";");
        for (var i = 0; i < cookies.length; i++) {
            var keyvalue = cookies[i].split("=");
            if (keyvalue[0].trim() === name) return keyvalue[1];
        }
        return "";
    }
    window.storeValue = function (name, value) {
        var expiry = new Date();
        expiry.setFullYear(expiry.getFullYear() + 1);
        document.cookie = name + "=" + value.trim() + "; expires=" + expiry.toUTCString();
    }
}

// get stored API subscription key, or prompt if it's not found(저장된 API 구독 키를 받거나 찾지 못한 경우 프롬프트합니다.)
function getSubscriptionKey() {
    var key = retrieveValue(API_KEY_COOKIE);
    while (key.length !== 32) {
        key = prompt("Enter Bing Search API subscription key:", "").trim();
    }
    // always set the cookie in order to update the expiration date(만료일을 업데이트하기 위해 항상 쿠키를 설정하십시오.)
    storeValue(API_KEY_COOKIE, key);
    return key;
}

// invalidate stored API subscription key so user will be prompted again(저장된 API 구독 키를 무효화하여 사용자에게 다시 메시지가 표시됩니다.)
function invalidateSubscriptionKey() {
    storeValue(API_KEY_COOKIE, "");
}

// escape text for use in HTML(HTML에서 사용하기 위해 텍스트 이스케이프 처리)
function escape(text) {
    return text.replace(/&/g, "&amp;").replace(/</g, "&lt;").
        replace(/'/g, "&apos;").replace(/"/g, "&quot;");
}

// get the host portion of a URL, strpping out search result formatting and www too (URL의 호스트 부분을 가져 와서 검색 결과 서식 지정 및 www를 스트라밍)
function getHost(url) {
    return url.replace(/<\/?b>/g, "").replace(/^https?:\/\//, "").split("/")[0].replace(/^www\./, "");
}

// format plain text for display as an HTML <pre> element (HTML <pre> 엘리먼트로 표시 할 일반 텍스트 형식)
function preFormat(text) {
    text = "" + text;
    return "<pre>" + text.replace(/&/g, "&amp;").replace(/</g, "&lt;") + "</pre>"
}

// put HTML markup into a <div> and reveal it(HTML 마크 업을 <div>에 넣고 그것을 공개하십시오.)
function showDiv(id, html) {
    var content = document.getElementById("_" + id)
    if (content) content.innerHTML = html;
    var wrapper = document.getElementById(id);
    if (wrapper) wrapper.style.display = html.trim() ? "block" : "none";
}

// hides the specified <div>s (지정된 <div>를 숨 깁니다.)
function hideDivs() {
    for (var i = 0; i < arguments.length; i++) {
        var element = document.getElementById(arguments[i])
        if (element) element.style.display = "none";
    }
}

// render functions for various types of search results (다양한 유형의 검색 결과를위한 함수 렌더링)
searchItemRenderers = { 
    images: function (item, index, count) {
        var height = 120;
        var width = Math.max(Math.round(height * item.thumbnail.width / item.thumbnail.height), 120);
        var html = [];
        if (index === 0) html.push("<p class='images'>");
        var title = escape(item.name) + "\n" + getHost(item.hostPageDisplayUrl);
        html.push("<p class='images' style='max-width: " + width + "px'>");
        html.push("<img src='"+ item.thumbnailUrl + "&h=" + height + "&w=" + width + 
            "' height=" + height + " width=" + width + "'>");
        html.push("<br>");
        html.push("<nobr><a href='" + item.contentUrl + "'>Image</a> - ");
        html.push("<a href='" + item.hostPageUrl + "'>Page</a></nobr><br>");
        html.push(title.replace("\n", " (").replace(/([a-z0-9])\.([a-z0-9])/g, "$1.<wbr>$2") + ")</p>");
        return html.join("");
    },
    relatedSearches: function(item) {
        var html = [];
        html.push("<p class='relatedSearches'>");
        html.push("<a href='#' onclick='return doRelatedSearch(&quot;" + 
            escape(item.text) + "&quot;)'>");
        html.push(item.displayText + "</a>");
        return html.join("");
    }
}


// render image search results (이미지 검색 결과 렌더링)
function renderImageResults(items) {
    var len = items.length;
    var html = [];
    if (!len) {
        showDiv("noresults", "No results.");
        hideDivs("paging1", "paging2");
        return "";
    }
    for (var i = 0; i < len; i++) {
        html.push(searchItemRenderers.images(items[i], i, len));
    }
    return html.join("\n\n");
}

// render related items (관련 항목 렌더링)
function renderRelatedItems(items) {
    var len = items.length;
    var html = [];
    for (var i = 0; i < len; i++) {
        html.push(searchItemRenderers.relatedSearches(items[i], i, len));
    }
    return html.join("\n\n");
}

// render the search results given the parsed JSON response (구문 분석 된 JSON 응답이 있으면 검색 결과를 렌더링합니다.)
function renderSearchResults(results) {

    // add Prev / Next links with result count (결과 개수가있는 이전 / 다음 링크 추가)
    var pagingLinks = renderPagingLinks(results);
    showDiv("paging1", pagingLinks);
    showDiv("paging2", pagingLinks);

    showDiv("results", renderImageResults(results.value));
    if (results.relatedSearches)
        showDiv("sidebar", renderRelatedItems(results.relatedSearches));
}

function renderErrorMessage(message) {
    showDiv("error", preFormat(message));
    showDiv("noresults", "No results.");
}

// handle Bing search request results (Bing 검색 요청 결과 처리)
function handleBingResponse() {
    hideDivs("noresults");

    var json = this.responseText.trim();
    var jsobj = {};

    // try to parse JSON results (JSON 결과를 구문 분석하려고 시도하십시오.)
    try {
        if (json.length) jsobj = JSON.parse(json);
    } catch(e) {
        renderErrorMessage("Invalid JSON response");
    }

    // show raw JSON and HTTP request (원시 JSON 및 HTTP 요청 표시) JSON.stringify 는 자바스크립트 문자열을 json 방식으로 바꿔준다.
    showDiv("json", preFormat(JSON.stringify(jsobj, null, 2)));
    //참고 https://medium.com/@cheonmyung0217/%EA%B5%AC%ED%98%84-json-stringify-%EB%A5%BC-%EC%9E%AC%EA%B7%80%ED%95%A8%EC%88%98%EB%A1%9C-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0-972f08622562
    //value(필수) jsobj : JSON 문자열로 변환할 값이다.(배열, 객체, 또는 숫자, 문자 등이 될 수 있다.)
    //replacer(선택) null : 함수 또는 배열이 될 수 있다. 이 값이 null 이거나 제공되지 않으면, 객체의 모든 속성들이 JSON 문자열 결과에 포함된다.
    //2 : 2칸의 공백
    
    //showDiv(id , html)
    showDiv("http", preFormat("GET " + this.responseURL + "\n\nStatus: " + this.status + " " + 
        this.statusText + "\n" + this.getAllResponseHeaders()));

    // if HTTP response is 200 OK, try to render search results (HTTP 응답이 200 OK이면 검색 결과 렌더링을 시도합니다.)
    if (this.status === 200) {
        var clientid = this.getResponseHeader("X-MSEdge-ClientID");
        if (clientid) retrieveValue(CLIENT_ID_COOKIE, clientid);
        if (json.length) {
            if (jsobj._type === "Images") {
                if (jsobj.nextOffset) document.forms.bing.nextoffset.value = jsobj.nextOffset;
                renderSearchResults(jsobj);
            } else {
                renderErrorMessage("No search results in JSON response");
            }
        } else {
            renderErrorMessage("Empty response (are you sending too many requests too quickly?)");
        }
    }

    // Any other HTTP response is an error (다른 HTTP 응답은 오류입니다.)
    else {
        // 401 is unauthorized; force re-prompt for API key for next request (401은 권한이 없습니다. 다음 요청을 위해 API 키를 재 입력하라.)
        if (this.status === 401) invalidateSubscriptionKey();

        // some error responses don't have a top-level errors object, so gin one up (일부 오류 응답에는 최상위 오류 개체가 없으므로 한 번만 실행하십시오.)
        var errors = jsobj.errors || [jsobj];
        var errmsg = [];

        // display HTTP status code (HTTP 상태 코드 표시)
        errmsg.push("HTTP Status " + this.status + " " + this.statusText + "\n");

        // add all fields from all error responses (모든 오류 응답의 모든 필드 추가)
        for (var i = 0; i < errors.length; i++) {
            if (i) errmsg.push("\n");
            for (var k in errors[i]) errmsg.push(k + ": " + errors[i][k]);
        }

        // also display Bing Trace ID if it isn't blocked by CORS (CORS에 의해 차단되지 않은 경우 Bing 추적 ID도 표시합니다.)
        var traceid = this.getResponseHeader("BingAPIs-TraceId");
        if (traceid) errmsg.push("\nTrace ID " + traceid);

        // and display the error message (오류 메시지를 표시하십시오.)
        renderErrorMessage(errmsg.join("\n"));
    }
}

// perform a search given query, options string, and API key(지정된 쿼리, 옵션 문자열 및 API 키 검색 수행)
function bingImageSearch(query, options, key) {

    // scroll to top of window(창 상단으로 스크롤)
    window.scrollTo(0, 0);
    if (!query.trim().length) return false;     // empty query, do nothing(빈 쿼리시, 아무것도하지 않는다.)

    showDiv("noresults", "Working. Please wait.");
    hideDivs("results", "related", "_json", "_http", "paging1", "paging2", "error");

    var request = new XMLHttpRequest();
    var queryurl = BING_ENDPOINT + "?q=" + encodeURIComponent(query) + "&" + options;

    // open the request(요청을 엽니다.)
    try {
        request.open("GET", queryurl);
    } 
    catch (e) {
        renderErrorMessage("Bad request (invalid URL)\n" + queryurl);
        return false;
    }

    // add request headers(요청 헤더 추가)
    request.setRequestHeader("Ocp-Apim-Subscription-Key", key);
    request.setRequestHeader("Accept", "application/json");
    var clientid = retrieveValue(CLIENT_ID_COOKIE);
    if (clientid) request.setRequestHeader("X-MSEdge-ClientID", clientid);

    // event handler for successful response(성공적인 응답을위한 이벤트 핸들러)
    request.addEventListener("load", handleBingResponse);

    // event handler for erorrs(erorrs에 대한 이벤트 처리기)
    request.addEventListener("error", function() {
        renderErrorMessage("Error completing request");
    });

    // event handler for aborted request(중단 된 요청에 대한 이벤트 핸들러)
    request.addEventListener("abort", function() {
        renderErrorMessage("Request aborted");
    });

    // send the request(요청을 보낸다.)
    request.send();
    return false;
}

// build query options from the HTML form (HTML 양식에서 쿼리 옵션 만들기)
function bingSearchOptions(form) {

    var options = [];
    options.push("mkt=" + form.where.value);
    options.push("SafeSearch=" + (form.safe.checked ? "strict" : "off"));
    if (form.when.value.length) options.push("freshness=" + form.when.value);
    var aspect = "all";
    for (var i = 0; i < form.aspect.length; i++) {
        if (form.aspect[i].checked) {
            aspect = form.aspect[i].value;
            break;
        }
    }
    options.push("aspect=" + aspect);
    if (form.color.value) options.push("color=" + form.color.value);
    options.push("count=" + form.count.value);
    options.push("offset=" + form.offset.value);
    return options.join("&");
}

// toggle display of a div (used by JSON/HTTP expandos) (div 표시 토글 (JSON / HTTP 확장으로 사용))
function toggleDisplay(id) {

    var element = document.getElementById(id);
    if (element) {
        var display = element.style.display;
        if (display === "none") {
            element.style.display = "block";
            window.scrollBy(0, 200);
        } else {
            element.style.display = "none";
        }
    }
    return false;
}

// perform a related search (used by related search links) (관련 검색을 수행합니다 (관련 검색 링크에서 사용).)
function doRelatedSearch(query) {
    var bing = document.forms.bing;
    bing.query.value = query;
    return newBingImageSearch(bing);
}

// generate the HTML for paging links (prev/next) (페이징 링크를위한 HTML 생성 (이전 / 다음))
function renderPagingLinks(results) {

    var html = [];
    var bing = document.forms.bing;
    var offset = parseInt(bing.offset.value, 10);
    var count = parseInt(bing.count.value, 10);
    html.push("<p class='paging'><i>Results " + (offset + 1) + " to " + (offset + count));
    html.push(" of about " + results.totalEstimatedMatches + ".</i> ");
    html.push("<a href='#' onclick='return doPrevSearchPage()'>Prev</a> | ");
    html.push("<a href='#' onclick='return doNextSearchPage()'>Next</a>");
    return html.join("");
}

// go to the next page (used by next page link) (다음 페이지로 이동 (다음 페이지 링크에서 사용))
function doNextSearchPage() {

    var bing = document.forms.bing;
    var query = bing.query.value;
    var offset = parseInt(bing.offset.value, 10);
    var stack = JSON.parse(bing.stack.value);
    stack.push(parseInt(bing.offset.value, 10));
    bing.stack.value = JSON.stringify(stack);
    bing.offset.value = bing.nextoffset.value;
    return bingImageSearch(query, bingSearchOptions(bing), getSubscriptionKey());
}

// go to the previous page (used by previous page link) (이전 페이지로 이동 (이전 페이지 링크로 사용))
function doPrevSearchPage() {

    var bing = document.forms.bing;
    var query = bing.query.value;
    var stack = JSON.parse(bing.stack.value);
    if (stack.length) {
        var offset = stack.pop();
        var count = parseInt(bing.count.value, 10);
        bing.stack.value = JSON.stringify(stack);
        bing.offset.value = offset;
        return bingImageSearch(query, bingSearchOptions(bing), getSubscriptionKey());
    }
    alert("You're already at the beginning!");
    return false;
}

function newBingImageSearch(form) {
    form.offset.value = "0";
    form.stack.value = "[]";
    return bingImageSearch(form.query.value, bingSearchOptions(form), getSubscriptionKey());
}
// --></script>

</head>
<body onload="document.forms.bing.query.focus();">

<form name="bing" onsubmit="return newBingImageSearch(this)">

<div id="logo"><!-- logo block including search market/language (검색 시장 / 언어를 포함한 로고 블록)-->
    <img src="data:image/png;base64,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">
    <I>api</I>
    <p><select name="where">
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
    <p>from Microsoft Cognitive Services
</div>

<div id="query"><!-- query controls including search field and options (검색 필드 및 옵션을 포함한 쿼리 컨트롤)-->
    <h1>Bing Image Search API demo</h2>    

        <input type="text" name="query" id="term" placeholder="Search for images" autocomplete=off>

        <p>Aspect
    <input type=radio name="aspect" id="any" value="all" checked>
        <label for="any">Any</label>
    <input type=radio name="aspect" id="square" value="square">
        <label for="square">Square</label>
    <input type=radio name="aspect" id="wide" value="wide">
        <label for="wide">Wide</label>
    <input type=radio name="aspect" id="tall" value="tall">
        <label for="tall">Tall</label>

        &nbsp;&nbsp;&nbsp;Color
    <select name="color">
        <option value="" selected>Any</option>
        <option value="coloronly">Only Color</option>
        <option value="monochrome">Black and White</option>
        <option value="black">Black</option>
        <option value="blue">Blue</option>
        <option value="black">Brown</option>
        <option value="gray">Gray</option>
        <option value="green">Green</option>
        <option value="orange">Orange</option>
        <option value="pink">Pink</option>
        <option value="purple">Purple</option>
        <option value="red">Red</option>
        <option value="teal">Teal</option>
        <option value="white">White</option>
        <option value="yellow">Yellow</option>                
    </select>

        &nbsp;&nbsp;&nbsp;From
    <select name="when">
        <option value="" selected>All time</option>
        <option value="month">Past month</option>
        <option value="week">Past week</option>
        <option value="day">Last 24 hours</option>
    </select>

    &nbsp;&nbsp;&nbsp;<input type=checkbox id="safe" name="safe" value="on" checked><label for="safe">SafeSearch</label>

    <!-- these hidden fields control paging 이러한 숨겨진 필드는 페이징을 제어합니다.-->
    <input type=hidden name="count" value="25">
    <input type=hidden name="offset" value="0">
    <input type=hidden name="nextoffset" value="">    
    <input type=hidden name="stack" value="[]">
</form>

<div>
    <div id="error">
    <h2>Error</h2>
    <div id="_error">
    </div>
</div>

<h2>Results</h2>
<div id="paging1">
    <div id="_paging1"></div>
</div>

<div id="noresults">
    <div id="_noresults">None yet.</div>
</div>

<div id="sidebar">
    <div id="_sidebar"></div>
</div>

<div id="results">
    <div id="_results"></div>
</div>


<div id="paging2">
    <div id="_paging2"></div>
</div>

<div id="json">
    <h3><a href="#" onclick="return toggleDisplay('_json')">JSON</a></h3>
    <div id="_json" style="display: none"></div>
</div>

<div id="http">
    <h3><a href="#" onclick="return toggleDisplay('_http')">HTTP</a></h3>
    <div id="_http" style="display: none"></div>
</div>

</body>
</html>