// cookie names for data we store(저장하는 데이터의 쿠키 이름)
// YOUR API KEY DOES NOT GO IN THIS CODE; don't paste it in.(귀하의 API 키는이 코드를 따르지 않습니다. 그것을 붙이지 마십시오.)
API_KEY_COOKIE   = "938c20c182734b108a3220a76b57e728";
CLIENT_ID_COOKIE = "938c20c182734b108a3220a76b57e728";

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
    //var key = retrieveValue(API_KEY_COOKIE);
	var key = "938c20c182734b108a3220a76b57e728";
    console.log(key);
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
        var height = 100;
        var width = 100;/*Math.max(Math.round(height * item.thumbnail.width / item.thumbnail.height), 120);*/
        var html = [];
        if (index === 0) html.push("<p class='images'>");
        var title = escape(item.name) + "\n" + getHost(item.hostPageDisplayUrl);
        html.push("<span class='images' style='max-width: " + width + "px;'>");
        html.push("<a href='" + item.contentUrl + "' target='_blank'><img src='"+ item.thumbnailUrl + "&h=" + height + "&w=" + width + 
            "' height=" + height + " width=" + width + "'></a>");
/*      html.push("<br>");
        html.push("<nobr><a href='" + item.contentUrl + "'>Image</a> - ");
        html.push("<a href='" + item.hostPageUrl + "'>Page</a></nobr><br>");
        html.push(title.replace("\n", " (").replace(/([a-z0-9])\.([a-z0-9])/g, "$1.<wbr>$2") + ")</p>");*/
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
    html.push("<a href='javascript:;' onclick='return doPrevSearchPage()'>Prev</a> | ");
    html.push("<a href='javascript:;' onclick='return doNextSearchPage()'>Next</a>");
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
// -->