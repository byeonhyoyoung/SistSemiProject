package data.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import org.json.simple.JSONObject;

import data.dto.SemiMemberDto;
import mysql.db.DbConnect;

public class SemiMemberNaverDao {


	DbConnect db = new DbConnect();


	//아이디체크
	public int isIdCheck(String id) {

		int isid=0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.println(id);
		String sql = "select count(*) from semimember where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				if(rs.getInt(1)==1)
					isid=1;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return isid;

	}




	//아이디에 대한 dto(회원정보전부) 반환
	public SemiMemberDto getMemberById(String id) {
		SemiMemberDto dto = new SemiMemberDto();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs  = null;

		String sql = "select * from semimember where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setEmail(rs.getString("email"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		return dto;
	}


	//insert:회원가입
	public void insertMember(SemiMemberDto dto) {

		Connection conn  = db.getConnection();
		PreparedStatement pstmt =null;

		String sql ="insert into semimember values(null,?,?,?,?,?,?,now())";


		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getEmail());

			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}


	}

	//로그인시 아이디와 비번체크
	public boolean isidPass(String id,String pass)
	{
		boolean b=false;

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from semimember where id=? and pass=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();

			if(rs.next())
			{
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;
	}

	//아이디에 대한 이름반환 
	//id보내서 name받기
	public String getName(String id)
	{
		String name="";

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from semimember where id=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();

			if(rs.next())
			{
				name=rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}


		return name;
	}


	//회원목록
	public List<SemiMemberDto> getAllMembers()
	{
		List<SemiMemberDto> list=new Vector<SemiMemberDto>();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from semimember order by id";

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next())
			{
				SemiMemberDto dto=new SemiMemberDto();

				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setEmail(rs.getString("email"));
				dto.setGaipday(rs.getTimestamp("gaipday"));

				list.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	//삭제
	public void deleteMember(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;

		String sql="delete from semimember where num=?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}


	//수정
	public void updateMember(SemiMemberDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;

		String sql="update semimember set name=?,hp=?,addr=?,email=? where num=?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getAddr());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getNum());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}


	//비밀번호 체크
	public boolean isEqualPass(String num,String pass)
	{
		boolean b=false;

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from semimember where num=? and pass=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();

			if(rs.next())
				b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}


		return b;
	}

	//회원 dto반환
	public SemiMemberDto getDataMember(String num)
	{
		SemiMemberDto dto=new SemiMemberDto();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from semimember where num=?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, num);
			rs=pstmt.executeQuery();

			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setEmail(rs.getString("email"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}


		return dto;
	}

	
	// 네이버 로그인 콜백에서 액세스 토큰을 가져오는 메서드
	public String getNaverAccessToken(String clientId, String clientSecret, String redirectURI, String code, String state) {
	    String accessToken = null;

	    try {
	        // 네이버 로그인 API에 요청할 URL 구성
	        String tokenURL = "https://nid.naver.com/oauth2.0/token";
	        String params = "grant_type=authorization_code" +
	                        "&client_id=" + clientId +
	                        "&client_secret=" + clientSecret +
	                        "&redirect_uri=" + redirectURI +
	                        "&code=" + code +
	                        "&state=" + state;

	        // HTTP 요청을 보내고 액세스 토큰 획득
	        URL url = new URL(tokenURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        conn.getOutputStream().write(params.getBytes());

	        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        StringBuilder response = new StringBuilder();
	        String line;
	        while ((line = reader.readLine()) != null) {
	            response.append(line);
	        }
	        reader.close();

	        // JSON 형식의 응답에서 액세스 토큰 추출
	        JSONObject jsonObject = new JSONObject(response.toString());
	        accessToken = jsonObject.getString("access_token");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return accessToken;
	}

	// 네이버 로그인 콜백에서 사용자 정보를 가져오는 메서드
	public String getNaverUserInfo(String accessToken) {
	    String userInfo = null;

	    try {
	        // 네이버 사용자 프로필 조회 API에 요청할 URL 구성
	        String userInfoURL = "https://openapi.naver.com/v1/nid/me";
	        URL url = new URL(userInfoURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        // HTTP 요청을 보내고 사용자 정보 획득
	        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        StringBuilder response = new StringBuilder();
	        String line;
	        while ((line = reader.readLine()) != null) {
	            response.append(line);
	        }
	        reader.close();

	        // JSON 형식의 응답에서 사용자 정보 추출
	        JSONObject jsonObject = new JSONObject(response.toString());
	        userInfo = jsonObject.getJSONObject("response").toString();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return userInfo;
	}

	// 네이버 아이디로 로그인한 사용자가 이미 회원으로 등록되어 있는지 확인하는 메서드
	public boolean isNaverUserExist(String naverId) {
	    boolean exist = false;

	    // 여기에 네이버 아이디로 회원 테이블에서 검색하여 존재 여부를 확인하는 로직을 추가하세요.

	    return exist;
	}


}
