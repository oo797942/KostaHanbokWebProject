package ho.service;

import java.util.HashMap;
import java.util.List;
import ho.model.HoMember;
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
}
