package ho.service;

import java.util.HashMap;
import java.util.List;

import ho.model.HoGoods;
import ho.session.HoBagRepository;

public class HoBagService {

	private static HoBagService service;

	private HoBagService() {
	}

	public static HoBagService getInstance() {
		if (service == null)
			service = new HoBagService();
		return service;
	}

	HoBagRepository repo = new HoBagRepository();

	public List<HoGoods> selectShoppingBag(HashMap map) {
		System.out.println("selectShoppingBag에 들어왔음");
		return repo.selectShoppingBagByMap(map);
	}

	public void insertShoppingBag(HashMap map) {
		System.out.println("insertShoppingBag에 들어왔음");
		repo.insertShoppingBagByMap(map);
	}

}
