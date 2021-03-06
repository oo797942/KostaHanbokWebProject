package ho.service;

import java.util.HashMap;
import java.util.List;
import ho.model.HoMember;
import ho.model.HoBoard;
import ho.model.HoGoods;
import ho.model.HoGoodsImg;
import ho.session.HoMemberRepository;

public class HoMemberService {
	// ---------------------------Singleton 객체(instance)
	private static HoMemberService service;

	private HoMemberService() {
	}

	public static HoMemberService getInstance() {
		if (service == null)
			service = new HoMemberService();
		return service;
	}

	HoMemberRepository repo = new HoMemberRepository();

	public List<HoMember> selectAll() {
		return repo.selectAll();
	}

	public HoMember selectHoMemberByPrimaryKey(HashMap<String, Object> id) {
		return repo.selectById(id);
	}
	
	public void updateHoMemeberCoin(HashMap<String, Object> coin) {
		repo.coinupdate(coin);
	}

	public void GoodsInsert(HashMap<String, Object> goods) {
		System.out.println("GoodsInsert에 들어왔음");
		repo.insertgoods(goods);
	}

	public void GoodsimageInsert(HashMap<String, Object> goods) {
		System.out.println("GoodsimageInsert에 들어왔음");
		repo.insertgoodsimg(goods);
	}

	public List<HoGoods> GoodsList() {
		System.out.println("GoodsList에 들어왔음");
		return repo.selectGoods();
	}

	public List<HoGoods> GoodsCategory(HashMap category) {
		System.out.println("GoodsCategory에 들어왔음");
		return repo.selectGoodsByCategory(category);
	}

	public List<HoGoods> GoodsInputSearch(HashMap options) {
		System.out.println("GoodsInputSearch에 들어왔음");
		return repo.selectGoodsByInput(options);
	}

	public HoGoods GoodsView(HashMap id) {
		System.out.println("GoodsView에 들어왔음");
		return repo.selectGoodsView(id);
	}
	
	public HoGoodsImg GoodsItemImgView(HashMap name) {
		System.out.println("GoodsItemImgView에 들어왔음");
		return repo.selectGoodsItemImgView(name);
	}


	public void GoodsDelete(HashMap<String, Object> admin) {
		System.out.println("GoodsDelete에 들어왔음" + admin);
		repo.GoodsDelte(admin);
	}

	public void GoodsImgDelete(HashMap<String, Object> admin) {
		System.out.println("GoodsDelete에 들어왔음" + admin);
		repo.GoodsImgDelte(admin);
	}

	public void GoodsUpdate(HashMap<String, Object> goods) {
		System.out.println("GoodsUpdate에 들어왔음" + goods);
		repo.updategoods(goods);
	}

	public void GoodsimageUpdate(HashMap<String, Object> goods) {
		System.out.println("GoodsimageUpdate에 들어왔음" + goods);
		repo.updategoodsimg(goods);
	}

	public void MemberJoin(HashMap<String, Object> member) {
		System.out.println("MemberJoin에 들어왔음");
		repo.insertMember(member);
	}

	public void MypageUpdate(HashMap<String, Object> member) {
		System.out.println("MypageUpdate에 들어왔음" + member);
		repo.updatemember(member);
	}

	public HoMember MemberView(HashMap<String, Object> id) {
		System.out.println("MemberView에 들어왔음");
		return repo.selectById(id);
	}

	public void MemberDelete(HashMap hm) {
		System.out.println("MemberDelete에 들어왔음");
		repo.deleteMember(hm);
	}

	public void MemUpdate(HashMap hm) {
		System.out.println("MemUpdate에 들어왔음");
		repo.updateMember(hm);
	}

	public List<HoBoard> BoardList() {
		System.out.println("BoardList에 들어왔음");
		return repo.selectBoard();
	}

	public HoBoard BoardView(HashMap board) {
		System.out.println("BoardView에 들어왔음");
		return repo.BoardView(board);
	}
	
	public void BoardReply(HashMap board){
		System.out.println("BoardReply에 들어왔음");	
		repo.BoardReply(board);
	}

	public void InsertQna(HashMap<String, Object> qnaMap) {
		System.out.println("InsertQna");
		repo.insertQna(qnaMap);
	}
	public void GoodsInventory(HashMap board){
		System.out.println("GoodsInventory에 들어왔음" + board);	
		repo.GoodsInventory(board);
	}
	public int getTotalCount(HashMap tm){
		System.out.println("getTotalCount");
		return repo.getTotalCount(tm);
	}
	public List<HoGoods> AllGoodsList(HashMap gm){
		System.out.println("AllGoodsList");
		return repo.selectAllGoods(gm);
	}
	public List<HoBoard> AllBoardList(HashMap bm){
		System.out.println("AllGoodsList");
		return repo.selectAllBoard(bm);
	}
	
	public List<HoMember> AllMemberList(HashMap mm){
		System.out.println("AllMemberList");
		return repo.selectAllMember(mm);
	}
	
	public List<HoBoard> MyBoardList(HashMap bm){
		System.out.println("MyBoardList");
		return repo.selectMyBoard(bm);
	}
	
	
}
