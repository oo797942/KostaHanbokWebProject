package ho.service;

import java.util.HashMap;
import java.util.List;
import ho.model.HoMember;
import ho.model.HoGoods;
import ho.session.HoMemberRepository;


public class HoMemberService {
	//---------------------------Singleton 객체(instance)
		private static HoMemberService service;
		
		private HoMemberService(){	}
		
		public static HoMemberService getInstance(){
			if(service == null) service=new HoMemberService();
			return service;
		}
		
		HoMemberRepository repo = new HoMemberRepository();
		
		public List<HoMember> selectAll(){
			return repo.selectAll(); 
		}
		public HoMember selectHoMemberByPrimaryKey(HashMap<String, Object> id){
			return repo.selectById(id);
		}
		
		public void GoodsInsert(HashMap<String,Object> goods){
			System.out.println("GoodsInsert에 들어왔음");
			repo.insertgoods(goods);
		}
		public void GoodsimageInsert(HashMap<String,Object> goods){
			System.out.println("GoodsimageInsert에 들어왔음");
			repo.insertgoodsimg(goods);
		}
		public List<HoGoods> GoodsList(){
			System.out.println("GoodsList에 들어왔음");
			return repo.selectGoods();
		}
		
		public HoGoods GoodsView(HashMap id){
			System.out.println("GoodsView에 들어왔음");
			return repo.selectGoodsView(id);
		}
		
		public void GoodsDelete(HashMap<String,Object>  admin){
			System.out.println("GoodsDelete에 들어왔음"+admin);	
			repo.GoodsDelte(admin);
		}
		public void GoodsImgDelete(HashMap<String,Object>  admin){
			System.out.println("GoodsDelete에 들어왔음"+admin);	
			repo.GoodsImgDelte(admin);
		}

		public void GoodsUpdate(HashMap<String,Object>  goods){
			System.out.println("GoodsUpdate에 들어왔음"+goods);	
			repo.updategoods(goods);
		}
		
		public void GoodsimageUpdate(HashMap<String,Object>  goods){
			System.out.println("GoodsimageUpdate에 들어왔음"+ goods);	
			repo.updategoodsimg(goods);
		}
		
		public void MypageUpdate(HashMap<String,Object>  member){
			System.out.println("MypageUpdate에 들어왔음"+ member);	
			repo.updatemember(member);
		}

}
