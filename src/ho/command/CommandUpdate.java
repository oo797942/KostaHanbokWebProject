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

public class CommandUpdate implements Command {
	private String next;

	public CommandUpdate(String _next) {
		next = _next;
	}

	public String execute(HttpServletRequest request) throws CommandException {
		try {
			request.setCharacterEncoding("utf-8");
			HashMap<String, Object> memMap = new HashMap<String, Object>();

			System.out.println("CommandUpdate에 들어왔음");
			String cmd = request.getParameter("cmd");

			if (cmd.equals("adminGoodsimgUpdate")) {

				System.out.println("CommandUpdate에서 imgUpdate부분에 들어왔음");
				String GoodsName = request.getParameter("GoodsName");
				System.out.println(GoodsName);
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

				HoMemberService.getInstance().GoodsUpdate(memMap);
				System.out.println("insert성공");
			}

			if (cmd.equals("adminGoodsUpList")) {
				System.out.println("CommandUpdate에서 imgListUpdate부분에 들어왔음");
				String GoodsName = request.getParameter("GoodsName");
				System.out.println(GoodsName);
				Part filePart1 = request.getPart("image1");
				System.out.println(filePart1);
				String realPath1 = FileSaveHelper.save(
						"C:\\JavaClass\\workspace\\ProjectExam\\WebContent\\ho\\upload\\", filePart1.getInputStream());
				Part filePart2 = request.getPart("image1");
				String realPath2 = FileSaveHelper.save(
						"C:\\JavaClass\\workspace\\ProjectExam\\WebContent\\ho\\upload\\", filePart2.getInputStream());
				Part filePart3 = request.getPart("image1");
				String realPath3 = FileSaveHelper.save(
						"C:\\JavaClass\\workspace\\ProjectExam\\WebContent\\ho\\upload\\", filePart3.getInputStream());

				memMap.put("GoodsName", GoodsName);
				memMap.put("image1", realPath1);
				memMap.put("image2", realPath2);
				memMap.put("image3", realPath3);

				HoMemberService.getInstance().GoodsimageUpdate(memMap);

				System.out.println("imageInsert 성공");
			}

			if (cmd.equals("submit-mypage")) {
				System.out.println("CommandUpdate에서 mypage수정");
				String id = request.getParameter("myId");
				String email = request.getParameter("email");
				String tel = request.getParameter("tel");
				String addr = request.getParameter("addr");
				String height = request.getParameter("height");
				String bust = request.getParameter("bust");
				String shoulder = request.getParameter("shoulder");

				memMap.put("memEmail", email);
				memMap.put("memId", id);
				memMap.put("memTel", tel);
				memMap.put("memAddr", addr);
				memMap.put("memHeight", height);
				memMap.put("memBust", bust);
				memMap.put("memShoulder", shoulder);
				
				HoMemberService.getInstance().MypageUpdate(memMap);

			}

		} catch (Exception ex) {
			throw new CommandException("CommandInsert.java < 입력시 > " + ex.toString());
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
