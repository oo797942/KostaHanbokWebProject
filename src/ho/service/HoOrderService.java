package ho.service;

import java.util.HashMap;
import java.util.List;

import ho.model.HoGoods;
import ho.model.HoOrder;
import ho.session.HoBagRepository;
import ho.session.HoOrderRepository;

public class HoOrderService {
	
	private static HoOrderService service;

	private HoOrderService() {
	}

	public static HoOrderService getInstance() {
		if (service == null)
			service = new HoOrderService();
		return service;
	}
	
	HoOrderRepository repo = new HoOrderRepository();
	
	public void insertOrder(HashMap map){
		repo.insertOrder(map);
	}

	public List<HoOrder> selectOrderList(HashMap<String,Object> id) {
		System.out.println("selectOrderList에 들어왔음");
		return repo.selectOrderList(id);
	}
	
	public List<HoOrder> AllOrderList(HashMap om){
		System.out.println("HoOrderService내 AllOrderList의 selectGoods 실행");
		return repo.selectOrder(om);
		
		
	}


}
