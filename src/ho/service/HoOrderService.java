package ho.service;

import java.util.HashMap;
import java.util.List;

import ho.model.HoGoods;
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

}
