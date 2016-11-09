package ho.command;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import ho.command.CommandException;
import ho.model.HoException;
import ho.model.HoGoods;
import ho.model.HoMember;
import ho.service.HoMemberService;

public class CommandGoodsInputSearch implements Command {
	private String next;

	public CommandGoodsInputSearch(String _next) {
		next = _next;
	}

	public String execute(HttpServletRequest request) throws CommandException {
		try {
			request.setCharacterEncoding("utf-8");

			HashMap<Object, String> hm = new HashMap<Object, String>();

			String option = request.getParameter("option");
			String check = request.getParameter("check");
			String val = request.getParameter("val");

			if (check.equals("title")) {
				hm.put("name", val);
			} else if (check.equals("content")) {
				hm.put("info", val);
			}

			if (option.equals("ge")) {
				hm.put("cate", "개량 한복");
				request.setAttribute("categoryTemp",  "개량 한복");
			} else if (option.equals("se")) {
				hm.put("cate", "생활 한복");
				request.setAttribute("categoryTemp",  "생활 한복");
			} else if (option.equals("fu")) {
				hm.put("cate", "퓨전 한복");
				request.setAttribute("categoryTemp",  "퓨전 한복");
			} else if (option.equals("ah")) {
				hm.put("cate", "아동 한복");
				request.setAttribute("categoryTemp",  "아동 한복");
			} else if (option.equals("ak")) {
				hm.put("cate", "악세서리");
				request.setAttribute("categoryTemp",  "악세서리");
			}

			System.out.println("옵션: " + option);
			System.out.println("체크: " + check);
			System.out.println("검색값: " + val);

			System.out.println("CommandGoodsInputSearch에 들어왔음");
			List<HoGoods> list = (List<HoGoods>) HoMemberService.getInstance().GoodsInputSearch(hm);
			System.out.println("list에 몇 개가 들어오나? : " + list.size());
			request.setAttribute("GoodsSearchFin", list);
			
		} catch (Exception ex) {
			throw new CommandException("CommandGoodsInputSearch.java < 입력시 > " + ex.toString());
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
