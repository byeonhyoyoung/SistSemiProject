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
   
   	//cartinsert
 	public void insertCart(CartDto dto)
 	{
 		Connection conn=db.getConnection();
 		PreparedStatement pstmt=null;
 		
 		String sql="insert into cart values(null,?,?,?,now())";
 		
 		try {
 			pstmt=conn.prepareStatement(sql);
 			
 			pstmt.setString(1, dto.getG_num());
 			pstmt.setString(2, dto.getNum());
 			pstmt.setInt(3, dto.getCnt());
 			
 			
 			pstmt.execute();
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}finally {
 			db.dbClose(pstmt, conn);
 		}
 		
 	}
 	
 		//cart 
 		public List<HashMap<String, String>> getCartList(String id)
 		{
 			List<HashMap<String, String>> list=new ArrayList<HashMap<String,String>>();
 			
 			Connection conn=db.getConnection();
 			PreparedStatement pstmt=null;
 			ResultSet rs=null;
 			
 			String sql="select c.idx, g.g_name, g.g_num, g.g_image_1 , g.g_price, c.cnt, c.cartday from cart c, gift g, semimember m where c.g_num=g.g_num and c.num=m.num and m.id=?";
 					
 			try {
 				pstmt=conn.prepareStatement(sql);
 				pstmt.setString(1, id);
 				rs=pstmt.executeQuery();
 				
 				while(rs.next())
 				{
 					HashMap<String, String> map=new HashMap<String, String>();
 					
 					map.put("idx", rs.getString("idx"));
 					map.put("g_name", rs.getString("g_name"));
 					map.put("g_num", rs.getString("g_num"));
 					map.put("g_image_1", rs.getString("g_image_1"));
 					map.put("g_price", rs.getString("g_price"));
 					map.put("cnt", rs.getString("cnt"));
 					map.put("cartday", rs.getString("cartday"));
 					
 					list.add(map);
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
 		public void deleteCart(String idx)
 		{
 			Connection conn=db.getConnection();
 			PreparedStatement pstmt=null;
 			
 			String sql="delete from cart where idx=?";
 			
 			try {
 				pstmt=conn.prepareStatement(sql);
 				pstmt.setString(1, idx);
 				pstmt.execute();
 				
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}finally {
 				db.dbClose(pstmt, conn);
 			}
 			
 		}
 		
 		//cart구매 성공 후 장바구니에 있는 데이터 삭제(해당 회원번호인 num을 지우기) 
 		public void deleteCartAfterPay(String num)
 		{
 			Connection conn=db.getConnection();
 			PreparedStatement pstmt=null;
 			
 			String sql="delete from cart where num=?";
 			
 			try {
 				pstmt=conn.prepareStatement(sql);
 				pstmt.setString(1, num);
 				pstmt.execute();
 				
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}finally {
 				db.dbClose(pstmt, conn);
 			}
 			
 		}
 		
   
   
   
   
   
}