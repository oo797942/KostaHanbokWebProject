package ho.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import ho.model.HoGoods;

public class HoOrderRepository {

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

	public void insertOrder(HashMap map){
		SqlSession sess = getSqlSessionFactory().openSession();
		try{
			System.out.println("insertOrder에 들어옴");

			int result = sess.insert(namespace+".insertOrder",map);
			if (result > 0) { // JDBC : AUTO-COMMIT , MYBATIS -> NOT AUTO-COMMIT
				// 커밋해줘야함 이녀석은
				sess.commit();
			} else {
				sess.rollback();
			}
		}finally{
			sess.close();
		}
	}

}