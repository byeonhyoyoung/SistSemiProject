package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

import data.dto.GiftDto;
import mysql.db.DbConnect;

public class GiftDao {
   DbConnect db=new DbConnect();

   //insert
   public void insertGift(GiftDto dto) {

      Connection conn  = db.getConnection();
      PreparedStatement pstmt =null;

      String sql ="insert into gift values(null,?,?,?,?,?,?,now())";


      try {
         pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, dto.getG_name());
         pstmt.setString(2, dto.getG_subject());
         pstmt.setString(3, dto.getG_content());
         pstmt.setString(4, dto.getG_price());
         pstmt.setString(5, dto.getG_image_1());
         pstmt.setString(6, dto.getG_image_2());

         pstmt.execute();

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }


   }

   //전체 목록
   public List<GiftDto> getAllGifts()
   {
      List<GiftDto> list=new ArrayList<GiftDto>();


      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;

      String sql="select * from gift order by g_num desc";

      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();

         while(rs.next())
         {
            GiftDto dto=new GiftDto();

            dto.setG_num(rs.getString("g_num"));
            dto.setG_name(rs.getString("g_name"));
            dto.setG_subject(rs.getString("g_subject"));
            dto.setG_content(rs.getString("g_content"));
            dto.setG_price(rs.getString("g_price"));
            dto.setG_image_1(rs.getString("g_image_1"));
            dto.setG_image_2(rs.getString("g_image_2"));
            dto.setG_writeday(rs.getTimestamp("g_writeday"));

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
   public GiftDto getGift(String g_num)
   {
      GiftDto dto=new GiftDto();

      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;

      String sql="select * from gift where g_num=?";

      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, g_num);
         rs=pstmt.executeQuery();

         if(rs.next())
         {
            dto.setG_num(rs.getString("g_num"));
            dto.setG_name(rs.getString("g_name"));
            dto.setG_subject(rs.getString("g_subject"));
            dto.setG_content(rs.getString("g_content"));
            dto.setG_price(rs.getString("g_price"));
            dto.setG_image_1(rs.getString("g_image_1"));
            dto.setG_image_2(rs.getString("g_image_2"));
            dto.setG_writeday(rs.getTimestamp("g_writeday"));
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
   public void updateGift(GiftDto dto)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="update gift set g_name=?, g_subject=?, g_content =?, g_price=?, g_image_1 =?, g_image_2 =? where g_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, dto.getG_name());
         pstmt.setString(2, dto.getG_subject());
         pstmt.setString(3, dto.getG_content());
         pstmt.setString(4, dto.getG_price());
         pstmt.setString(5, dto.getG_image_1());
         pstmt.setString(6, dto.getG_image_2());
         
         pstmt.setString(7, dto.getG_num());
         
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
      
   }
   
   //삭제
   public void deleteGift(String g_num)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from gift where g_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, g_num);
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
      
   }
   
   
   
   
<<<<<<< HEAD
=======
   
   
>>>>>>> refs/heads/main
}