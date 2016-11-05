package ho.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import ho.model.HoMember;
public class HoMemberRepository {
	String namespace="ho.mapper.HoMemberMapper"; //HoMemberMapper의 namespace
	private SqlSessionFactory getSqlSessionFactory(){
		String resource = "mybatis-config.xml";//db연결과 관련된 파일
		InputStream in = null;
		try{
			in = Resources.getResourceAsStream(resource);
		}catch(Exception ex){}
		SqlSessionFactory sessFac = new SqlSessionFactoryBuilder().build(in);
		return sessFac;
	}
	public List<HoMember> selectAll(){
		//연결객체 얻어오기 (SqlSession)
		SqlSession sess=getSqlSessionFactory().openSession();
		try{
			return sess.selectList(namespace+".selectHoMember");
		}finally{
			sess.close();
		}
		
	}
	public HoMember selectById(HashMap<String, Object> id){
		SqlSession sess=getSqlSessionFactory().openSession();
		try{
			return sess.selectOne(namespace+".selectHoMember",id);
		}finally{
			sess.close();
		}
	}

}
