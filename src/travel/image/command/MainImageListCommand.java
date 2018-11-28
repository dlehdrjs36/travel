package travel.image.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.image.com.ImageListDAO;
import travel.image.com.ImageListDTO;

public class MainImageListCommand implements ImageListCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ImageListDAO dao = new ImageListDAO();
		ImageListDTO dto = new ImageListDTO();
		List<ImageListDTO> list = new ArrayList<ImageListDTO>();
		
		int count = dao.ImageListTotalCount();
		
		list = dao.imageList(count);
		
		request.setAttribute("list", list);				
	}
}
