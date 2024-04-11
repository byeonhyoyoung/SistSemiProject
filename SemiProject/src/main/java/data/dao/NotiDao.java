package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.NotiDto;
import mysql.db.DbConnect;

public class NotiDao {

   DbConnect db=new DbConnect();
   
   public void insertNoti(NotiDto dto)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="insert into noti values (null,?,?,?,?,0,now())";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, dto.getN_writer());
         pstmt.setString(2, dto.getN_subject());
         pstmt.setString(3, dto.getN_content());
         pstmt.setString(4, dto.getN_juje());
         
         pstmt.execute();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
      
   }
   
   //paging list
   public List<NotiDto> getList(int start,int perPage)
   {
      List<NotiDto> list=new ArrayList<NotiDto>();
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from noti order by n_num desc limit ?,?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setInt(1, start);
         pstmt.setInt(2, perPage);
         rs=pstmt.executeQuery();
         
         while(rs.next())
         {
            NotiDto dto=new NotiDto();
            
            dto.setN_num(rs.getString("n_num"));
            dto.setN_writer(rs.getString("n_writer"));
            dto.setN_subject(rs.getString("n_subject"));
            dto.setN_content(rs.getString("n_content"));
            dto.setN_juje(rs.getString("n_juje"));
            dto.setN_readcount(rs.getInt("n_readcount"));
            dto.setN_writeday(rs.getTimestamp("n_writeday"));
            
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
   
   //전체갯수 반환
   public int getTotalCount()
   {
      int total=0;
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select count(*) from noti";
      
      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         if(rs.next())
            
            total=rs.getInt(1);
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      
      return total;
      
   }
   
   //num에 대한 dto반환
   public NotiDto getData(String n_num)
   {
      NotiDto dto=new NotiDto();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from noti where n_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, n_num);
         
         rs=pstmt.executeQuery();
         
         while(rs.next())
         {
            dto.setN_num(rs.getString("n_num"));
            dto.setN_writer(rs.getString("n_writer"));
            dto.setN_subject(rs.getString("n_subject"));
            dto.setN_content(rs.getString("n_content"));
            dto.setN_juje(rs.getString("n_juje"));
            dto.setN_readcount(rs.getInt("n_readcount"));
            dto.setN_writeday(rs.getTimestamp("n_writeday"));
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
   public void updateReadcount(String n_num)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="update noti set n_readcount=n_readcount+1 where n_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, n_num);
         
         pstmt.execute();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
      
   }

   //가장 최근 추가된 글의 N_num값 알기
   public int getMaxNum()
   {
      int max=0;
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select max(n_num) max from noti";
      
      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         if(rs.next())
            
            max=rs.getInt("max");
            
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      
      return max;
   }
   
   //수정(관리자 권한이니 제목, 내용만 수정
   public void updateNoti(NotiDto dto)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="update noti set n_subject=?,n_content=?,n_juje=? where n_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, dto.getN_subject());
         pstmt.setString(2, dto.getN_content());
         pstmt.setString(3, dto.getN_juje());
         pstmt.setString(4, dto.getN_num());
         
         pstmt.execute();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
      
   }
   
   //삭제
   public void deleteNoti(String n_num)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from noti where n_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, n_num);
         
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
      
   }
   
   
}
