# Travel

# ![WebApp](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_1.png)


<br><br>
## 프로젝트 주제

실시간 항공 예약 사이트


<br><br>
## 프로젝트 선정 배경

<table>
<tr>
<td>
매년 항공 이용객들이 증가하면서, 2017년 기준 년간 1억명 이상의 항공여객 이용률을 돌파하며점진적으로 항공 수요가 늘고 있으며, 이 때문에 다수의 항공권 예매 사이트들도 늘어나고 있다.하지만 양질의 좋은 항공데이터들을 사용하고, 이용자들이 쉽고도 값싼 항공상품을 이용할 수 있는 서비스를 받을 수 있는 곳은 제한적이었다. 때문에 이용자들은 불편함을 감수하고 효율적이지 못한 정보를 가지고 항공사를 이용 할 수 밖에 없었다.따라서 보다 많은 데이터를 이용해 가장 저렴한 가격대 비교와 여행지 선택에 편의를 제공 할 수 있는 웹 사이트 구축에 필요성을 느꼈고, 복잡하지 않으면서도 접근성이 뛰어난 UI 구성을 통해 이용자들의 이용률을 증가 시키는데 필요를 느끼고 본 시스템을 개발하였다.이 프로젝트 개발을 통해, 우리는 이용자들이 보다 정확하고 구매목적에 부합할 수 있는 항공예약 사이트를 구축하는데 기대를 하고 여행, 관광, 운송 산업 진흥에 보탬이 되고자 한다.
</td>
</tr>
</table>


<br><br>
## 개발 환경

<table>
<tr><td rowspan="5">S/W</td><td>OS</td><td>Windows 7 Home Premium K</td></tr>  
<tr>                        <td>서버</td><td>Apache Tomcat 8.5.32</td></tr>
<tr>                        <td>개발언어</td><td>JAVA 1.8, HTML5, CSS3, JavaScript, Jsp</td></tr>
<tr>                        <td>데이터베이스</td><td>Oracle Database Express Edition 11g Release 2</td></tr>
<tr>                        <td>IDE</td><td>Eclipse Oxygen.3a Release (4.7.3a), SQL Developer</td></tr>
<tr><td rowspan="3">H/W</td><td>프로세스</td><td>Intel(R) Core i5-2500 CPU 3.30GHz</td></tr>  
<tr>                        <td>메모리</td><td>8192MB RAM</td></tr>
<tr>                        <td>보조 기억장치</td><td>HDD 368GB</td></tr>
</table>


<br><br>
## 데모

~~[Link]()~~

<br><br>
## 웹 화면 구성 및 관리자 UI(User Interface) 기능

      - 관리자 로그인 모드를 구성하여, 항공사이트 관리자 계정으로 접속할 시 사용자들이 Contact란의 이용 내역을 확인 할 수 있도록 일반 사용자들과 기능을 분할하여 구성하였다.

      - 회원들의 예약 목록을 확인 할 수 있도록 회원예약관리 페이지를 구성하였고, 회원아이디와 예약 등록 정보 등을 확인 할 수 있으며, 예약 취소를 할 수 있도록 하였고, 관리자의 데이터 가독성을 줄여 업무 처리의 부담을 줄였다.
      
      - 회원예약관리 페이지에서는 방대한 회원예약정보를 쉽게 검색 할 수 있도록 모든 항목에 단어 검색을 적용 하여, 관리자의 검색 시간을 줄이고 업무 처리량을 줄였다.

      - Subscribe 정기레터 구독을 신청한 사용자들에 대한 소식지를 정기적으로 보낼 수 있도록 메일전송 페이지를 구성하였고, 신청한 사용자들의 메일 주소로 단체 전송이 가능하게 메일링 서비스를 구현하여, 관리자가 간편하고 쉽게 관리를 할 수 있도록 하였다.

***
<br><br>
### 실시간 운항 정보
항공권 예매로 상용화된 스카이스캐너 사이트와 비교 했을 때 동일한 직항권에 대한 정보를 얻어 올 수 있다. 사용자가 출발지와 도착지를 선택 후 조회를 하면 현재 운항 가능한 항공편 정보가 출력된다.

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_3.png)

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_2.png)


<br><br>
### 공항 날씨
사용자가 출발공항을 선택하면 해당 공항의 기온 및 풍속 날씨를 보여준다. 날씨는 Clear, Mostly Clear, Cloudy, Rain, Showers, Smog 로 구분되고 이를 JSONP 방식으로 받아 이미지로 보여준다.

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_4.png)


<br><br>
### 가까운 공항 찾기
사용자의 현재 위치 반경 30마일 이내 가장 가까운 공항의 위도 경도 값을 가져온다. 반경은 더 큰 값을 줄 수 있다.

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_5.png)


<br><br>
### 항공기 등급
실시간 항공편을 통해 예약한 사용자의 항공기가 정시에 출발 했는지, 지연 출발은 없었는지, 결항 회수는 몇 회인지 등을 고려하여 계산된 총점을 볼 수 있다.

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_6.png)


<br><br>
### 실시간 급상승
메인 화면의 오른쪽 상단의 실시간 급상승의 기준은 사용자가 도착 나라 항공권 예약을 했을 때 조회수가 1씩 증가 된다. 나라 조회수가 높은 순위는 데이터베이스에서 오름차순으로 가져와 보여준다.

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_7.png)


<br><br>
### 예약 결제

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_8.png)
![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_9.png)
![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_10.png)
<br><br>
***

### 관리자

***
<br><br>
#### 문의 확인 정보

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_11.png)


<br><br>
#### 회원 예약 관리 정보

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_12.png)


<br><br>
#### 메일 전송 정보

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_13.png)


<br><br>
### 채팅

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_14.png)

![](https://github.com/dlehdrjs36/travel/blob/master/DemoImage/travel_15.png)

***
<br><br>
## 사용 API

- [결제](https://github.com/iamport/iamport-manual) - 아임포트
- [주소 검색](https://github.com/daumPostcode/QnA) - 다음 주소 검색
- [썸머노트](https://github.com/summernote/summernote) - 썸머노트
- [구글 맵](https://github.com/googlemaps/google-maps-services-go) - 지도 정보
- [Bing Web Search](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/cognitive-services/Bing-Web-Search/tutorial-bing-web-search-single-page-app.md) - Bing Web Search
- [FlightStats](https://developer.flightstats.com/?utm_source=flightstats&utm_medium=ResourcesMenuLink&utm_campaign=DeveloperCenter) - 항공 정보


<br><br>
## 향후 발전 방향

국제적 항공데이터들을 조금 더 수집하여, 보다 완벽한 항공권 이용을 할 수 있도록 지속적으로 보완할 예정이다. 
각 항공사가 특정하게 제공하는 서비스들을 참고 분석하여, 사이트 유저들이 비교하여 이용 할 수 있도록 하는 서비스 비교 및 안내 기능을 추가하여 보다 자세하고 편리한 서비스 이용에 도움이 되게 할 것이다. 그리고 고객후기, 서비스 이용 평점기능란을 따로 구성하여, 고객들의 요구사항과 보완할 점 등의
소통을 강화하여 질 높은 서비스 제공을 위한 노력을 할 것이다.


<br><br>
## Team

[![정현욱](https://dlehdrjs36.github.io/SupportForMe/DemoImages/대체이미지.jpg)](https://github.com/)  | [![문준영](https://dlehdrjs36.github.io/SupportForMe/DemoImages/대체이미지.jpg)](https://github.com/)  | [![이동건](https://dlehdrjs36.github.io/SupportForMe/DemoImages/대체이미지.jpg)](https://github.com/dlehdrjs36)  
---|---|---
[정현욱](https://github.com/) |[문준영](https://github.com/) |[이동건](https://github.com/dlehdrjs36) 

<br><br>
## [License](https://github.com/dlehdrjs36/travel/blob/master/LICENSE.md)

MIT ©[dlehdrjs36](https://github.com/dlehdrjs36)
