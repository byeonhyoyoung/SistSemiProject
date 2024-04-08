package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.QuestionAnswerDto;
import mysql.db.DbConnect;

public class QuestionAnswerDao {

	DbConnect db=new DbConnect();
	
		//추가
		public void insertAnswer(QuestionAnswerDto dto) {
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="insert into questionanswer values(null,?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getQa_num());
				pstmt.setString(2, dto.getQa_writer());
				pstmt.setString(3, dto.getQa_content());
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		public List<QuestionAnswerDto> getAnswerList(String qa_num){
			List<QuestionAnswerDto> list=new ArrayList<QuestionAnswerDto>();
	
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from questionanswer where qa_num=? order by qa_idx desc";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, qa_num);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					QuestionAnswerDto dto=new QuestionAnswerDto();
					
					dto.setQa_idx(rs.getString("qa_idx"));
					dto.setQa_num(rs.getString("qa_num"));
					dto.setQa_writer(rs.getString("qa_writer"));
					dto.setQa_content(rs.getString("qa_content"));
					dto.setQa_writeday(rs.getTimestamp("qa_writeday"));
					
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
		public QuestionAnswerDto getAnswerData(String qa_idx) {
			QuestionAnswerDto dto=new QuestionAnswerDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from questionanswer where qa_idx=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, qa_idx);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setQa_idx(rs.getString("qa_idx"));
					dto.setQa_num(rs.getString("qa_num"));
					dto.setQa_writer(rs.getString("qa_writer"));
					dto.setQa_content(rs.getString("qa_content"));
					dto.setQa_writeday(rs.getTimestamp("qa_writeday"));
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
		public void updateAnswer(QuestionAnswerDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update questionanswer set qa_writer=?,qa_content=? where qa_idx=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getQa_writer());
				pstmt.setString(2, dto.getQa_content());
				pstmt.setString(3, dto.getQa_idx());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//삭제
		public void deleteAnswer(String qa_idx) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from questionanswer where qa_idx=?";

			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, qa_idx);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
}
