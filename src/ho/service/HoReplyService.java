package ho.service;

import java.util.HashMap;
import java.util.List;

import ho.model.HoGoods;
import ho.model.HoOrder;
import ho.session.HoBagRepository;
import ho.session.HoOrderRepository;
import ho.session.HoReplyRepository;

public class HoReplyService {
	
	private static HoReplyService service;

	private HoReplyService() {
	}

	public static HoReplyService getInstance() {
		if (service == null)
			service = new HoReplyService();
		return service;
	}
	
	HoReplyRepository repo = new HoReplyRepository();
	
	public void insertReply(HashMap<String,Object> map){
		System.out.println("insertReply에 들어왔음");
		repo.insertReply(map);
	}

	public List<HoOrder> selectOrderList(HashMap<String,Object> id) {
		System.out.println("selectOrderList에 들어왔음");
		return repo.selectOrderList(id);
	}

}