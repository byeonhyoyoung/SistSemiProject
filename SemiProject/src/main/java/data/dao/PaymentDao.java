package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.sql.Timestamp;

import data.dto.CartDto;
import data.dto.GiftDto;
import data.dto.PaymentDto;
import mysql.db.DbConnect;

public class PaymentDao {
   DbConnect db=new DbConnect();

   //insert: 장바구니cart -> payment
   public void insertPayment(PaymentDto dto, String memberNum) {
       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;

       String sql = "INSERT INTO payment (g_num, num, cnt, cartday, payment_date) " +
                    "SELECT g_num, ?, cnt, cartday, NOW() " +
                    "FROM cart " +
                    "WHERE num = ?";

       try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, memberNum); // Assuming memberNum is the member number
           pstmt.setString(2, memberNum); // Assuming memberNum is the member number

           pstmt.executeUpdate();
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(pstmt, conn);
       }
   }



 //전체 목록: 마이페이지 -> 결제 내역 확인용
   public List<PaymentDto> getAllPaymentsGroupedByDate() {
       List<PaymentDto> list = new ArrayList<PaymentDto>();

       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       // SQL query to retrieve payments grouped by date
       String sql = "SELECT * FROM payment ORDER BY payment_date DESC";

       try {
           pstmt = conn.prepareStatement(sql);
           rs = pstmt.executeQuery();

           while (rs.next()) {
               PaymentDto dto = new PaymentDto();

               // Assuming PaymentDto has fields for all columns in the payment table
               dto.setPayment_id(rs.getString("payment_id"));
               dto.setG_num(rs.getString("g_num"));
               dto.setNum(rs.getString("num"));
               dto.setCnt(rs.getInt("cnt"));
               dto.setCartday(rs.getTimestamp("cartday"));
               dto.setPayment_date(rs.getTimestamp("payment_date"));

               list.add(dto);
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(rs, pstmt, conn);
       }

       return list;
   }

   
   
   //전체 목록: 상세 결제 페이지 -> 결제 내역 확인용:날짜 넣어서!!!
   public List<PaymentDto> getAllPaymentsGroupedByDate(Timestamp paymenttime) {
       List<PaymentDto> list = new ArrayList<PaymentDto>();

       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       // SQL query to retrieve payments grouped by date
       String sql = "SELECT * FROM payment where payment_date=?";

       try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setTimestamp(1, paymenttime);
           rs = pstmt.executeQuery();

           while (rs.next()) {
               PaymentDto dto = new PaymentDto();

               // Assuming PaymentDto has fields for all columns in the payment table
               dto.setPayment_id(rs.getString("payment_id"));
               dto.setG_num(rs.getString("g_num"));
               dto.setNum(rs.getString("num"));
               dto.setCnt(rs.getInt("cnt"));
               dto.setCartday(rs.getTimestamp("cartday"));
               dto.setPayment_date(rs.getTimestamp("payment_date"));

               list.add(dto);
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(rs, pstmt, conn);
       }

       return list;
   }



   //get data
   public PaymentDto getPayment(String payment_id)
   {
      PaymentDto dto=new PaymentDto();

      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;

      String sql="select * from gift where payment_id=?";

      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, payment_id);
         rs=pstmt.executeQuery();

         if(rs.next())
         {
            dto.setPayment_id(rs.getString("payment_id"));
             dto.setG_num(rs.getString("g_num"));
             dto.setNum(rs.getString("num"));
             dto.setCnt(rs.getInt("cnt"));
             dto.setCartday(rs.getTimestamp("cartday"));
             dto.setPayment_date(rs.getTimestamp("payment_date"));
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