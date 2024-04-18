package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.HotelDto;

import mysql.db.DbConnect;

public class HotelDao {
   
   DbConnect db=new DbConnect();
   
   //insert
   public void insertHotel(HotelDto dto) {

       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;

       // Using the VALUES syntax directly in the INSERT statement
       String sql = "INSERT INTO hotel (h_subject, h_content, h_image, h_location, h_link, h_category, h_googlemap, h_writeday) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";

       try {
           pstmt = conn.prepareStatement(sql);

           pstmt.setString(1, dto.getH_subject());
           pstmt.setString(2, dto.getH_content());
           pstmt.setString(3, dto.getH_image());
           pstmt.setString(4, dto.getH_location());
           pstmt.setString(5, dto.getH_link());
           pstmt.setString(6, dto.getH_category());
           pstmt.setString(7, dto.getH_googlemap());

           pstmt.execute();

       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(pstmt, conn);
       }
   }

      
      //전체 목록 가져오기
      public List<HotelDto> getAllHotels()
      {
         List<HotelDto> list=new ArrayList<HotelDto>();
         
         
         Connection conn=db.getConnection();
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         
         String sql="select * from hotel order by h_num desc";
         
         try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            
            while(rs.next())
            {
               HotelDto dto=new HotelDto();
               
               dto.setH_num(rs.getString("h_num"));
               dto.setH_subject(rs.getString("h_subject"));
               dto.setH_content(rs.getString("h_content"));
               dto.setH_image(rs.getString("h_image"));
               dto.setH_location(rs.getString("h_location"));
               dto.setH_link(rs.getString("h_link"));
               dto.setH_category(rs.getString("h_category"));
               dto.setH_writeday(rs.getTimestamp("h_writeday"));
               dto.setH_googlemap(rs.getString("h_googlemap"));
               
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
      public HotelDto getHotel(String h_num)
      {
         HotelDto dto=new HotelDto();
         
         Connection conn=db.getConnection();
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         
         String sql="select * from hotel where h_num=?";
         
         try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, h_num);
            rs=pstmt.executeQuery();
            
            if(rs.next())
            {
               dto.setH_num(rs.getString("h_num"));
               dto.setH_subject(rs.getString("h_subject"));
               dto.setH_content(rs.getString("h_content"));
               dto.setH_image(rs.getString("h_image"));
               dto.setH_location(rs.getString("h_location"));
               dto.setH_link(rs.getString("h_link"));
               dto.setH_category(rs.getString("h_category"));
               dto.setH_writeday(rs.getTimestamp("h_writeday"));
               dto.setH_googlemap(rs.getString("h_googlemap"));
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbClose(rs, pstmt, conn);
         }
         
         return dto;
      }
      
      
      //수정..
      public void updateHotel(HotelDto dto)
      {
         Connection conn=db.getConnection();
         PreparedStatement pstmt=null;
         
         String sql="update hotel set h_subject=?, h_content=?, h_image=?, h_location=?, h_link=?, h_category=?, h_googlemap=? where h_num=?";
         
         try {
            pstmt=conn.prepareStatement(sql);
            
            pstmt.setString(1, dto.getH_subject());
            pstmt.setString(2, dto.getH_content());
            pstmt.setString(3, dto.getH_image());
            pstmt.setString(4, dto.getH_location());
            pstmt.setString(5, dto.getH_link());
            pstmt.setString(6, dto.getH_category());
            pstmt.setString(7, dto.getH_googlemap());
         
            pstmt.setString(8, dto.getH_num());
            
            pstmt.execute();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbClose(pstmt, conn);
         }
         
      }
      
      //삭제
      public void deleteHotel(String h_num)
      {
         Connection conn=db.getConnection();
         PreparedStatement pstmt=null;
         
         String sql="delete from hotel where h_num=?";
         
         try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, h_num);
            pstmt.execute();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbClose(pstmt, conn);
         }
         
      }
      
      
}