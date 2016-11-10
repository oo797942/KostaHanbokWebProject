package ho.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import ho.model.HoGoods;

public class HoBagRepository {
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

	public List<HoGoods> selectShoppingBagByMap(HashMap map) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			System.out.println("selectShoppingBagByMap에 들어왔음");

			return sess.selectList(namespace + ".shoppingBag", map);
		} finally {
			sess.close();
		}
	}

}
