package ho.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import ho.model.HoMember;
import ho.model.HoBoard;
import ho.model.HoGoods;

public class HoMemberRepository {
	String namespace = "ho.mapper.HoMemberMapper"; // HoMemberMapper의 namespace

	private SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config.xml";// db연결과 관련된 파일
		InputStream in = null;
		try {
			in = Resources.getResourceAsStream(resource);
		} catch (Exception ex) {
		}
		SqlSessionFactory sessFac = new SqlSessionFactoryBuilder().build(in);
		return sessFac;
	}

	public List<HoMember> selectAll() {
		// 연결객체 얻어오기 (SqlSession)
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			return sess.selectList(namespace + ".selectHoMember");
		} finally {
			sess.close();
		}

	}

	public HoMember selectById(HashMap<String, Object> id) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			return sess.selectOne(namespace + ".selectHoMember", id);
		} finally {
			sess.close();
		}
	}

	public void insertgoods(HashMap<String, Object> goods) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			System.out.println("insertgoods에 들어왔음");
			int result = sess.insert(namespace + ".insertGoods", goods);
			if (result > 0) { // JDBC : AUTO-COMMIT , MYBATIS -> NOT AUTO-COMMIT
								// 커밋해줘야함 이녀석은
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}

	public void insertgoodsimg(HashMap<String, Object> goods) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			System.out.println("insertgoodsimg에 들어왔음");
			int result = sess.insert(namespace + ".insertGoodsimg", goods);
			if (result > 0) { // JDBC : AUTO-COMMIT , MYBATIS -> NOT AUTO-COMMIT
								// 커밋해줘야함 이녀석은
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}

	public List<HoGoods> selectGoods() {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			System.out.println("selectGoods에 들어왔음");

			return sess.selectList(namespace + ".Goodlist");
		} finally {
			sess.close();
		}
	}
	
	public List<HoGoods> selectGoodsByCategory(HashMap category) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			System.out.println("selectGoods에 들어왔음");

			return sess.selectList(namespace + ".Goodlist", category);
		} finally {
			sess.close();
		}
	}

	public HoGoods selectGoodsView(HashMap id) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			System.out.println("selectGoods에 들어왔음");

			return sess.selectOne(namespace + ".Goodlist", id);
		} finally {
			sess.close();
		}
	}

	public void GoodsDelte(HashMap<String, Object> id) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int result = sess.delete(namespace + ".Goodsdelete", id);
			System.out.println(result);
			if (result > 0) { // JDBC : AUTO-COMMIT , MYBATIS -> NOT AUTO-COMMIT
								// 커밋해줘야함 이녀석은
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}

	public void GoodsImgDelte(HashMap<String, Object> id) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			int result = sess.delete(namespace + ".GoodsImgdelete", id);
			System.out.println(result);
			if (result > 0) { // JDBC : AUTO-COMMIT , MYBATIS -> NOT AUTO-COMMIT
								// 커밋해줘야함 이녀석은
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}

	public void updategoods(HashMap<String, Object> goods) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			System.out.println("updategoods에 들어왔음");
			int result = sess.update(namespace + ".UpdateGoods", goods);
			if (result > 0) { // JDBC : AUTO-COMMIT , MYBATIS -> NOT AUTO-COMMIT
								// 커밋해줘야함 이녀석은
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}

	public void updategoodsimg(HashMap<String, Object> goods) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			System.out.println("updategoodsimg에 들어왔음");
			int result = sess.update(namespace + ".UpdateGoodsimg", goods);
			if (result > 0) { // JDBC : AUTO-COMMIT , MYBATIS -> NOT AUTO-COMMIT
								// 커밋해줘야함 이녀석은
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}
 
	public void updatemember(HashMap<String, Object> member) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			System.out.println("updatemember에 들어왔음");
			int result = sess.update(namespace + ".UpdateMypage", member);
			if (result > 0) { // JDBC : AUTO-COMMIT , MYBATIS -> NOT AUTO-COMMIT
								// 커밋해줘야함 이녀석은
				sess.commit();
			} else {
				sess.rollback();
			}
		} finally {
			sess.close();
		}
	}
	
	public void deleteMember(HashMap hm) {
		SqlSession sess=getSqlSessionFactory().openSession();
		try{
			String stmt = namespace+".deleteMember";
			int result = sess.delete(stmt, hm);
			if(result>0){
				sess.commit();
			}else{
				sess.rollback();
			}
		}finally{
			sess.close();
		}
	}
	public void insertMember(HashMap<String, Object> member){
		SqlSession sess=getSqlSessionFactory().openSession();
		try{
		int result = 	sess.insert(namespace+".insertMember",member);
		if ( result > 0 ){	 //JDBC : AUTO-COMMIT , MYBATIS -> NOT AUTO-COMMIT 커밋해줘야함 이녀석은
				sess.commit();
		}else{
				sess.rollback();
		}
		}finally{
			sess.close();
		}
	}

	
	public void updateMember(HashMap hm) {
		SqlSession sess=getSqlSessionFactory().openSession();
		try{
			String stmt = namespace+".updateMember";
			int result = sess.update(stmt, hm);
			if(result>0){
				sess.commit();
			}else{
				sess.rollback();
			}
		}finally{
			sess.close();
		}
	}
	
	public List<HoBoard> selectBoard(){
		//연결객체 얻어오기 (SqlSession)
		SqlSession sess=getSqlSessionFactory().openSession();
		try{
			System.out.println("selectBoard에 들어왔음");
			return sess.selectList(namespace+".selectBoard");
		}finally{
			sess.close();
		}
	}
	
	public HoBoard BoardView(HashMap board){
		//연결객체 얻어오기 (SqlSession)
		SqlSession sess=getSqlSessionFactory().openSession();
		try{
			System.out.println("BoardView에 들어왔음");
			return sess.selectOne(namespace+".selectBoard" , board);
		}finally{
			sess.close();
		}
	}
}
