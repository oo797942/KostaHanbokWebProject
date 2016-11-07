package ho.command;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandInsert implements Command{
	private String next;
	
	public CommandInsert( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			request.setCharacterEncoding("utf-8");
			HashMap<String, Object> memMap= new HashMap<String,Object>();

			System.out.println("CommandInsert에 들어왔음");
			String cmd = request.getParameter("cmd");
			
			if(cmd.equals("adminGoodsimgInsert")){
			
			System.out.println("CommandInsert에서 imgInsert부분에 들어왔음");
			String GoodsName = request.getParameter("GoodsName");
			String GoodsCate = request.getParameter("GoodsCate");
			String GoodsInfo = request.getParameter("GoodsInfo");
			String GoodsColor = request.getParameter("GoodsColor");
			String GoodsSize = request.getParameter("GoodsSize");
			int GoodsSoo = Integer.parseInt(request.getParameter("GoodsSoo"));
			int GoodsPrice = Integer.parseInt(request.getParameter("GoodsPrice"));
			int GoodsRentPrice = Integer.parseInt(request.getParameter("GoodsRentPrice"));
		
			
			Part filePart = request.getPart("GoodsImg");
			String realPath = FileSaveHelper.save("C:\\JavaClass\\workspace\\ProjectExam\\WebContent\\ho\\upload\\",
					filePart.getInputStream());
			
			
			memMap.put("GoodsName", GoodsName);
			memMap.put("GoodsCate", GoodsCate);
			memMap.put("GoodsImg", realPath);
			memMap.put("GoodsInfo", GoodsInfo);
			memMap.put("GoodsColor", GoodsColor);
			memMap.put("GoodsSize", GoodsSize);
			memMap.put("GoodsSoo", GoodsSoo);
			memMap.put("GoodsPrice", GoodsPrice);
			memMap.put("GoodsRentPrice", GoodsRentPrice);
			
			HoMemberService.getInstance().GoodsInsert(memMap);
			System.out.println("insert성공");
			}
			
			if(cmd.equals("adminGoodsList")){
				System.out.println("니 여기 왔니?");
				System.out.println("CommandInsert에서 imgListInsert부분에 들어왔음");
				String GoodsName = request.getParameter("GoodsName");
				Part filePart1 = request.getPart("image1");
				String realPath1 =FileSaveHelper.save("C:\\JavaClass\\workspace\\ProjectExam\\WebContent\\ho\\upload\\",
						filePart1.getInputStream());
				Part filePart2 = request.getPart("image1");
				String realPath2 = FileSaveHelper.save("C:\\JavaClass\\workspace\\ProjectExam\\WebContent\\ho\\upload\\",
						filePart2.getInputStream());
				Part filePart3 = request.getPart("image1");
				String realPath3 = FileSaveHelper.save("C:\\JavaClass\\workspace\\ProjectExam\\WebContent\\ho\\upload\\",
						filePart3.getInputStream());
				
				memMap.put("GoodsName", GoodsName);
				memMap.put("image1", realPath1);
				memMap.put("image2", realPath2);
				memMap.put("image3", realPath3);
			

				HoMemberService.getInstance().GoodsimageInsert(memMap);
				System.out.println("imageInsert 성공");
			}
			
		}catch( Exception ex ){
			throw new CommandException("CommandInsert.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}

	
	private String getFileName(Part part) throws UnsupportedEncodingException {
		System.out.println("getFileName");
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
