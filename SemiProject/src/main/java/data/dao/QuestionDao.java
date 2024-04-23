package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.QuestionDto;
import mysql.db.DbConnect;

public class QuestionDao {

	DbConnect db=new DbConnect();
	
		//추가
		public void insertQusetion(QuestionDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
				
			String sql="insert into question(q_writer,q_subject,q_content,q_image,q_writeday) values(?,?,?,?,now())";
				
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getQ_writer());
				pstmt.setString(2, dto.getQ_subject());
				pstmt.setString(3, dto.getQ_content());
				pstmt.setString(4, dto.getQ_image());
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//전체목록
		public List<QuestionDto> getAllQusetion(){
			List<QuestionDto> list=new ArrayList<QuestionDto>();
					
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
				
			String sql="select * from question order by q_num desc";
					
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
						
				while(rs.next()) {
					QuestionDto dto=new QuestionDto();
					dto.setQ_num(rs.getString("q_num"));
					dto.setQ_writer(rs.getString("q_writer"));
					dto.setQ_subject(rs.getString("q_subject"));
					dto.setQ_content(rs.getString("q_content"));
					dto.setQ_image(rs.getString("q_image"));
					dto.setQ_likes(rs.getInt("q_likes"));
					dto.setQ_readcount(rs.getInt("q_readcount"));
					dto.setQ_writeday(rs.getTimestamp("q_writeday"));
							
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
		
		//페이징 리스트
		public List<QuestionDto> getList(int startNum,int perPage){
			List<QuestionDto> list=new ArrayList<QuestionDto>();

			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from question order by q_num desc limit ?,?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, perPage);
				rs=pstmt.executeQuery();

				while(rs.next()) {
					QuestionDto dto=new QuestionDto();
					dto.setQ_num(rs.getString("q_num"));
					dto.setQ_writer(rs.getString("q_writer"));
					dto.setQ_subject(rs.getString("q_subject"));
					dto.setQ_content(rs.getString("q_content"));
					dto.setQ_image(rs.getString("q_image"));
					dto.setQ_likes(rs.getInt("q_likes"));
					dto.setQ_readcount(rs.getInt("q_readcount"));
					dto.setQ_writeday(rs.getTimestamp("q_writeday"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(null, pstmt, conn);
			}
			return list;
		}
		
		//total
		public int getTotalCount() {
			int total=0;
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from question";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					total=rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return total;
		}
		
		//num에 해당하는 dto반환
		public QuestionDto getData(String q_num) {
			QuestionDto dto=new QuestionDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from question where q_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, q_num);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setQ_num(rs.getString("q_num"));
					dto.setQ_writer(rs.getString("q_writer"));
					dto.setQ_subject(rs.getString("q_subject"));
					dto.setQ_content(rs.getString("q_content"));
					dto.setQ_image(rs.getString("q_image"));
					dto.setQ_likes(rs.getInt("q_likes"));
					dto.setQ_readcount(rs.getInt("q_readcount"));
					dto.setQ_writeday(rs.getTimestamp("q_writeday"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return dto;
		}
		
		//readcount
		public void updateReadcount(String q_num) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update question set q_readcount=q_readcount+1 where q_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, q_num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//maxnum.. 가장 최신에 추가된 글의 num값 알기
		public int getMaxNum() {
			int max=0;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select max(q_num) max from question";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					max=rs.getInt("max"); //rs.getInt(1)과 동일
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return max;
		}
		
		//수정
		public void updateQusetion(QuestionDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update question set q_writer=?,q_subject=?,q_content=?,q_image=? where q_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getQ_writer());
				pstmt.setString(2, dto.getQ_subject());
				pstmt.setString(3, dto.getQ_content());
				pstmt.setString(4, dto.getQ_image());
				pstmt.setString(5, dto.getQ_num());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//삭제
		public void deleteQusetion(String q_num) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from question where q_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, q_num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//추천 클릭시 추천 증가
		public void updateLikes(String q_num) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update question set q_likes=q_likes+1 where q_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, q_num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//추천 클릭시 추천 감소
		public void decreLikes(String q_num) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
					
			String sql="update question set q_likes=q_likes-1 where q_num=?";
					
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, q_num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//검색
		public List<QuestionDto> searchQuestion(String category, String keyword){
			
			List<QuestionDto> list=new ArrayList<QuestionDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql = "";
		    if (keyword != null && !keyword.trim().isEmpty() && category.equalsIgnoreCase("제목")) {
		        // 키워드가 있고 제목으로 찾을 경우
		        sql = "SELECT * FROM question WHERE q_subject LIKE ? ORDER BY q_num DESC";
		    } else if(keyword != null && !keyword.trim().isEmpty() && category.equalsIgnoreCase("작성자")){
		    	// 키워드가 있고 작성자로 찾을 경우
		        sql = "SELECT * FROM question WHERE q_writer LIKE ? ORDER BY q_num DESC";
		    }
		   
		   try {
			pstmt=conn.prepareStatement(sql);
			if (keyword != null && !keyword.trim().isEmpty() && category.equalsIgnoreCase("제목")) {
	            pstmt.setString(1, "%" + keyword + "%");
	        } else if(keyword != null && !keyword.trim().isEmpty() && category.equalsIgnoreCase("작성자")){
	            pstmt.setString(1, "%" + keyword + "%");
	        }
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					QuestionDto dto=new QuestionDto();
					dto.setQ_num(rs.getString("q_num"));
					dto.setQ_writer(rs.getString("q_writer"));
					dto.setQ_subject(rs.getString("q_subject"));
					dto.setQ_content(rs.getString("q_content"));
					dto.setQ_image(rs.getString("q_image"));
					dto.setQ_likes(rs.getInt("q_likes"));
					dto.setQ_readcount(rs.getInt("q_readcount"));
					dto.setQ_writeday(rs.getTimestamp("q_writeday"));
					
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
}
