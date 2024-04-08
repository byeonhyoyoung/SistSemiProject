package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ReviewAnswerDto;
import mysql.db.DbConnect;

public class ReviewAnswerDao {

	DbConnect db=new DbConnect();
	
	//추가
		public void insertAnswer(ReviewAnswerDto dto) {
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="insert into reviewanswer values(null,?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getRa_num());
				pstmt.setString(2, dto.getRa_writer());
				pstmt.setString(3, dto.getRa_content());
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		public List<ReviewAnswerDto> getAnswerList(String ra_num){
			List<ReviewAnswerDto> list=new ArrayList<ReviewAnswerDto>();

			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from reviewanswer where ra_num=? order by ra_idx desc";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, ra_num);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ReviewAnswerDto dto=new ReviewAnswerDto();
					
					dto.setRa_idx(rs.getString("ra_idx"));
					dto.setRa_num(rs.getString("ra_num"));
					dto.setRa_writer(rs.getString("ra_writer"));
					dto.setRa_content(rs.getString("ra_content"));
					dto.setRa_writeday(rs.getTimestamp("ra_writeday"));
					
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
		
		//수정시 나타낼 데이터
		public ReviewAnswerDto getAnswerData(String ra_idx) {
			ReviewAnswerDto dto=new ReviewAnswerDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from reviewanswer where ra_idx=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, ra_idx);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setRa_idx(rs.getString("ra_idx"));
					dto.setRa_num(rs.getString("ra_num"));
					dto.setRa_writer(rs.getString("ra_writer"));
					dto.setRa_content(rs.getString("ra_content"));
					dto.setRa_writeday(rs.getTimestamp("ra_writeday"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return dto;
		}
		
		//수정
		public void updateAnswer(ReviewAnswerDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update reviewanswer set ra_writer=?,ra_content=? where ra_idx=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getRa_writer());
				pstmt.setString(2, dto.getRa_content());
				pstmt.setString(3, dto.getRa_idx());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//삭제
		public void deleteAnswer(String ra_idx) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from reviewanswer where ra_idx=?";

			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, ra_idx);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
}
