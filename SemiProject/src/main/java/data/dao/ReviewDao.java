package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ReviewDto;
import mysql.db.DbConnect;

public class ReviewDao {

	DbConnect db=new DbConnect();
	
	//추가
		public void insertReview(ReviewDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="insert into review(r_writer,r_subject,r_content,r_image,r_writeday) values(?,?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getR_writer());
				pstmt.setString(2, dto.getR_subject());
				pstmt.setString(3, dto.getR_content());
				pstmt.setString(4, dto.getR_image());
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//전체목록
		public List<ReviewDto> getAllReview(){
			List<ReviewDto> list=new ArrayList<ReviewDto>();
					
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
				
			String sql="select * from review order by r_num desc";
					
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
						
				while(rs.next()) {
					ReviewDto dto=new ReviewDto();
					dto.setR_num(rs.getString("r_num"));
					dto.setR_writer(rs.getString("r_writer"));
					dto.setR_subject(rs.getString("r_subject"));
					dto.setR_content(rs.getString("r_content"));
					dto.setR_image(rs.getString("r_image"));
					dto.setR_likes(rs.getInt("r_likes"));
					dto.setR_readcount(rs.getInt("r_readcount"));
					dto.setR_writeday(rs.getTimestamp("r_writeday"));
							
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
		public List<ReviewDto> getList(int startNum,int perPage){
			List<ReviewDto> list=new ArrayList<ReviewDto>();

			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from review order by r_num desc limit ?,?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, perPage);
				rs=pstmt.executeQuery();

				while(rs.next()) {
					ReviewDto dto=new ReviewDto();
					dto.setR_num(rs.getString("r_num"));
					dto.setR_writer(rs.getString("r_writer"));
					dto.setR_subject(rs.getString("r_subject"));
					dto.setR_content(rs.getString("r_content"));
					dto.setR_image(rs.getString("r_image"));
					dto.setR_likes(rs.getInt("r_likes"));
					dto.setR_readcount(rs.getInt("r_readcount"));
					dto.setR_writeday(rs.getTimestamp("r_writeday"));
					
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
			
			String sql="select count(*) from review";
			
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
		public ReviewDto getData(String r_num) {
			ReviewDto dto=new ReviewDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from review where r_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, r_num);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setR_num(rs.getString("r_num"));
					dto.setR_writer(rs.getString("r_writer"));
					dto.setR_subject(rs.getString("r_subject"));
					dto.setR_content(rs.getString("r_content"));
					dto.setR_image(rs.getString("r_image"));
					dto.setR_likes(rs.getInt("r_likes"));
					dto.setR_readcount(rs.getInt("r_readcount"));
					dto.setR_writeday(rs.getTimestamp("r_writeday"));
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
		public void updateReadcount(String r_num) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update review set r_readcount=r_readcount+1 where r_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, r_num);
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
			
			String sql="select max(r_num) max from review";
			
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
		public void updateReview(ReviewDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update review set r_writer=?,r_subject=?,r_content=?,r_image=? where r_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getR_writer());
				pstmt.setString(2, dto.getR_subject());
				pstmt.setString(3, dto.getR_content());
				pstmt.setString(4, dto.getR_image());
				pstmt.setString(5, dto.getR_num());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//삭제
		public void deleteReview(String r_num) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from review where r_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, r_num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//추천 클릭시 추천 증가
		public void updateLikes(String r_num) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update review set r_likes=r_likes+1 where r_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, r_num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//추천 클릭시 추천 감소
				public void decreLikes(String r_num) {
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					
					String sql="update review set r_likes=r_likes-1 where r_num=?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, r_num);
						pstmt.execute();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						db.dbClose(pstmt, conn);
					}
				}
}
