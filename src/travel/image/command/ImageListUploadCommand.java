package travel.image.command;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import travel.image.com.ImageListDAO;
import travel.image.com.ImageListDTO;
import travel.sendMessage.com.sendMessageDAO;

public class ImageListUploadCommand implements ImageListCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String uploadPath = "C:\\Users\\User\\git\\JSP\\travel\\WebContent\\Imagelist";

		int maxSize = 1024 * 1024 * 10;
		
		MultipartRequest multi = null;
		
		String filepath = "";
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			ImageListDTO dto = new ImageListDTO();			
			
			dto.setThumnail(multi.getOriginalFileName("thumnail"));
			dto.setDetail(multi.getOriginalFileName("detail"));
			dto.setTitle(multi.getParameter("title"));
			dto.setContent(multi.getParameter("content"));
			dto.setPrice(multi.getParameter("price"));
			dto.setHits(multi.getParameter("hits"));			
					
			ImageListDAO dao = new ImageListDAO();
			
			dao.ImageInsert(dto);
			
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
