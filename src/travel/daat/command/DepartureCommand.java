package travel.daat.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class DepartureCommand implements DaatCommand{
	
    // tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();	    
	    
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int page = 1;	// 페이지 초기값 
		String date = "0600";
		List<String> list = new ArrayList<>();
		
		try{
			while(true){
				// parsing할 url 지정(API 키 포함해서)
				String url = "http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList?ServiceKey=dRWo2wKq2B%2FKrt7Y7XfVsQkh5Kd5K%2BblTUQR2rCFXPVLNO5ThHE%2BTgha3kfg4eAJP76aeHgLQqQOaSsj%2BC%2BKeg%3D%3D&schDeptCityCode=GMP&schArrvCityCode=HND&pageNo="+page+"&schDate=20180828&internationalTime=0600";
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);					
				
				// root tag 
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("item");
				//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						
						Element eElement = (Element) nNode;
						System.out.println("######################");
						//System.out.println(eElement.getTextContent());
						System.out.println("항공사  : " + getTagValue("airlineKorean", eElement));
						System.out.println("출발시간  : " + getTagValue("internationalEddate", eElement));
						list.add("<li>"+getTagValue("airlineKorean", eElement)+":"+getTagValue("internationalEddate", eElement)+"</li>");
						
					}	// for end
				}	// if end
				
								
				//request.setAttribute("nList", list);
				//System.out.println(nList);
				
				page += 1;
				System.out.println("page number : "+page);
				if(page > 12){	
					break;
				}
			}	// while end
			for(String str : list) {
				System.out.println(str);
			}
			request.setAttribute("nList", list);
		} catch (Exception e){	
			e.printStackTrace();
		}//try catch end
		
	}//execute end
}
