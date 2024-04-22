package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import data.dto.TourDto;
import mysql.db.DbConnect;

public class TourDao {

   DbConnect db=new DbConnect();
   
   //insert
   public void insertTour(TourDto dto) {

      Connection conn  = db.getConnection();
      PreparedStatement pstmt =null;

      String sql ="insert into tour values(null,?,?,?,?,?,?,?,?,?,?,?,now())";

      try {
         pstmt = conn.prepareStatement(sql);
               
         pstmt.setString(1, dto.getT_category());
         pstmt.setString(2, dto.getT_subject());
         pstmt.setString(3, dto.getT_subject_j());
         pstmt.setString(4, dto.getT_content());
         pstmt.setString(5, dto.getT_image());
         pstmt.setString(6, dto.getT_location());
         pstmt.setString(7, dto.getT_link());
         pstmt.setString(8, dto.getT_time());
         pstmt.setString(9, dto.getT_tel());
         pstmt.setString(10, dto.getT_price());
         pstmt.setString(11, dto.getT_googlemap());
               
         pstmt.execute();

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
         
   //전체 목록
   public List<TourDto> getAllTour()
   {
      List<TourDto> list=new ArrayList<TourDto>();
      
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from tour order by t_num desc";
      
      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         while(rs.next())
         {
            TourDto dto=new TourDto();
            
            dto.setT_num(rs.getString("t_num"));
            dto.setT_category(rs.getString("t_category"));
            dto.setT_subject(rs.getString("t_subject"));
            dto.setT_subject_j(rs.getString("t_subject_j"));
            dto.setT_content(rs.getString("t_content"));
            dto.setT_image(rs.getString("t_image"));
            dto.setT_location(rs.getString("t_location"));
            dto.setT_link(rs.getString("t_link"));
            dto.setT_time(rs.getString("t_time"));
            dto.setT_tel(rs.getString("t_tel"));
            dto.setT_price(rs.getString("t_price"));
            dto.setT_googlemap(rs.getString("t_googlemap"));
            dto.setT_writeday(rs.getTimestamp("t_writeday"));
            
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
         
   //get data
   public TourDto getTour(String t_num)
   {
      TourDto dto=new TourDto();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from tour where t_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, t_num);
         rs=pstmt.executeQuery();
         
         if(rs.next())
         {
            dto.setT_num(rs.getString("t_num"));
            dto.setT_category(rs.getString("t_category"));
            dto.setT_subject(rs.getString("t_subject"));
            dto.setT_subject_j(rs.getString("t_subject_j"));
            dto.setT_content(rs.getString("t_content"));
            dto.setT_image(rs.getString("t_image"));
            dto.setT_location(rs.getString("t_location"));
            dto.setT_link(rs.getString("t_link"));
            dto.setT_time(rs.getString("t_time"));
            dto.setT_tel(rs.getString("t_tel"));
            dto.setT_price(rs.getString("t_price"));
            dto.setT_googlemap(rs.getString("t_googlemap"));
            dto.setT_writeday(rs.getTimestamp("t_writeday"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      return dto;
   }
   
   //get sawon
   public List<TourDto> getAllCategory(String t_category)
   {
      List<TourDto> list=new ArrayList<TourDto>();
      
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from tour where t_category=? order by t_num desc";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, t_category);
         rs=pstmt.executeQuery();
         
         while(rs.next())
         {
            TourDto dto=new TourDto();
            
            dto.setT_num(rs.getString("t_num"));
            dto.setT_category(rs.getString("t_category"));
            dto.setT_subject(rs.getString("t_subject"));
            dto.setT_subject_j(rs.getString("t_subject_j"));
            dto.setT_content(rs.getString("t_content"));
            dto.setT_image(rs.getString("t_image"));
            dto.setT_location(rs.getString("t_location"));
            dto.setT_link(rs.getString("t_link"));
            dto.setT_time(rs.getString("t_time"));
            dto.setT_tel(rs.getString("t_tel"));
            dto.setT_price(rs.getString("t_price"));
            dto.setT_googlemap(rs.getString("t_googlemap"));
            dto.setT_writeday(rs.getTimestamp("t_writeday"));
            
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
   public void deleteTour(String t_num){
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from tour where t_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, t_num);
         pstmt.execute();
      
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbClose(pstmt, conn);
         }
   }
      
   //수정
   public void updateTour(TourDto dto)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="update tour set t_category=?,t_subject=?,t_subject_j=?,t_content=?,t_image=?,t_location=?,t_link=?,t_time=?,t_tel=?,t_price=?,t_googlemap=? where t_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, dto.getT_category());
         pstmt.setString(2, dto.getT_subject());
         pstmt.setString(3, dto.getT_subject_j());
         pstmt.setString(4, dto.getT_content());
         pstmt.setString(5, dto.getT_image());
         pstmt.setString(6, dto.getT_location());
         pstmt.setString(7, dto.getT_link());
         pstmt.setString(8, dto.getT_time());
         pstmt.setString(9, dto.getT_tel());
         pstmt.setString(10, dto.getT_price());
         pstmt.setString(11, dto.getT_googlemap());
         
         pstmt.execute();
      
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }      
   }
   
   //검색
   public List<TourDto> searchTours(String keyword, String category){

      List<TourDto> list=new ArrayList<TourDto>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql = "";
       if (keyword != null && !keyword.trim().isEmpty()) {
           // 키워드가 있는 경우
           sql = "SELECT * FROM tour WHERE (t_subject LIKE ? OR t_subject_j LIKE ?) AND t_category = ? ORDER BY t_num DESC";
       } else {
           // 키워드가 없는 경우
           sql = "SELECT * FROM tour WHERE t_category = ? ORDER BY t_num DESC";
       }
      
      try {
      pstmt=conn.prepareStatement(sql);
      if (keyword != null && !keyword.trim().isEmpty()) {
            pstmt.setString(1, "%" + keyword + "%");
            pstmt.setString(2, "%" + keyword + "%");
            pstmt.setString(3, category);
        } else {
            pstmt.setString(1, category);
        }

      rs=pstmt.executeQuery();
      
      while(rs.next()) {
         TourDto dto=new TourDto();
         dto.setT_num(rs.getString("t_num"));
         dto.setT_category(rs.getString("t_category"));
         dto.setT_subject(rs.getString("t_subject"));
         dto.setT_subject_j(rs.getString("t_subject_j"));
         dto.setT_content(rs.getString("t_content"));
         dto.setT_image(rs.getString("t_image"));
         dto.setT_location(rs.getString("t_location"));
         dto.setT_link(rs.getString("t_link"));
         dto.setT_time(rs.getString("t_time"));
         dto.setT_tel(rs.getString("t_tel"));
         dto.setT_price(rs.getString("t_price"));
         dto.setT_googlemap(rs.getString("t_googlemap"));
         dto.setT_writeday(rs.getTimestamp("t_writeday"));
         
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