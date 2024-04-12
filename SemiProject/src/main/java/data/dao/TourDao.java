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

      String sql ="insert into tour values(null,?,?,?,?,?,?,?,now())";


      try {
         pstmt = conn.prepareStatement(sql);

               
         pstmt.setString(1, dto.getT_category());
         pstmt.setString(2, dto.getT_subject());
         pstmt.setString(3, dto.getT_content());
         pstmt.setString(4, dto.getT_image());
         pstmt.setString(5, dto.getT_location());
         pstmt.setString(6, dto.getT_link());
         pstmt.setString(7, dto.getT_googlemap());
               
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
            dto.setT_content(rs.getString("t_content"));
            dto.setT_image(rs.getString("t_image"));
            dto.setT_location(rs.getString("t_location"));
            dto.setT_link(rs.getString("t_link"));
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
            dto.setT_content(rs.getString("t_content"));
            dto.setT_image(rs.getString("t_image"));
            dto.setT_location(rs.getString("t_location"));
            dto.setT_link(rs.getString("t_link"));
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
}