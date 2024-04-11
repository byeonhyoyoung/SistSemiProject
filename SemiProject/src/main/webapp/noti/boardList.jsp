<%@page import="data.dto.SemiMemberDto"%>
<%@page import="data.dao.SemiMemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.NotiDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.NotiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
   a:link ,a:visited{
   
   text-decoration: none;
   color: black;
}

   a:hover {
   text-decoration: underline;
   color: gray;
}

   #head{
      font-size: 1.5em;
      color: black;
      padding-top: 50px;
   }
   
    /* 테이블 오른쪽과 왼쪽 테두리 제거 */
   table.table-bordered {
       border-left: none;
       border-right: none;
   }
   
   table.table-bordered th, table.table-bordered td {
       border-right: none;
       border-left: none;
   }
   
   i.bi-plus{
         color: gray;
   }
   
   /* hover 효과 적용 */
    tr.hover-effect:hover td {
        background-color: rgba(128, 128, 128, 0.1); /* 마우스를 갖다대면 배경색 변경 */
        cursor: pointer; /* 마우스 커서를 포인터로 변경 */
    }
    
    /* 페이지 네이션 테두리 제거 */
   ul.pagination {
       border: none;
   }
   
   ul.pagination li.page-item a.page-link {
       border: none;
       border-radius: 0; /* 필요에 따라 테두리의 모서리를 조정할 수 있습니다 */
   }
   
   ul.pagination li.page-item.active a.page-link {
       background-color: #007bff; /* 활성 페이지의 배경색을 원하시는 색상으로 변경하세요 */
       color: #fff; /* 활성 페이지의 텍스트 색상을 원하시는 색상으로 변경하세요 */
   }
   
   .bs_ipt {
    display: flex;
    align-items: center;
    width: 260px;
    height: 42px;
    border: 1px solid #e7e8ed;
    border-left: none;
    background: #f8f9fb;
    font-size: 0;
    float: right;
    }
    
    .reviewimg {
    	width: 65px;
    	height: 65px;
    }

	.image-and-text {
	    display: flex; /* 부모 요소를 플렉스 컨테이너로 설정하여 내부 요소를 가로로 나란히 배치 */
	    align-items: center; /* 내부 요소를 수직 중앙 정렬 */
	    background-color: rgba(128, 128, 128, 0.1);
	    width: 900px;
	    height: 140px;
	    padding-left: 15px;
	    padding-right: 15px;
	    
	}
	
	.board-text {
	    margin-left: 10px; /* 이미지와 텍스트 사이의 간격 조정 */
	    font-size: 15px;
	    font-weight: bold;
	}
   
</style>
<script type="text/javascript">
  //head단에서는 $(function)
  $(function(){
     
   //내용 숨겼더
     $("tr.noticontent").hide();
     
     //전체체크 클릭시 체크값 얻어서 모든체크값에 전달
     $(".alldelcheck").click(function(){
        
        //전체 체크값 얻기(alldelcheck를 this라고하면)
        var chk=$(this).is(":checked");
        //console.log(chk);
        
        //전체체크값을 글앞에 체크에 일괄 전달하기
        $(".alldel").prop("checked",chk);
     });
     
     //삭제버튼 클릭시 삭제(몇개인지 값 잘 넘어오는지 확인할것)
     $("#btndel").click(function(){
        
        var len=$(".alldel:checked").length;
        //alert(len); //삭제 갯수 확인
        
        if(len==0){
           alert("최소 1개이상의 글을 선택해 주세요");
        }else{
           
           var a=confirm(len+"개의 글을 삭제하려면 [확인]을 눌러주세요"); //->체크된것의 val값 읽어야함
           
           //체크된 곳의 value값(num(dto.getNum심어놓음))얻기
           var n=""; //여러개의 value값을 n에 누적시킬것이니까
           $(".alldel:checked").each(function(idx){
              n+=$(this).val()+","; //누적시키기..하나가 아니니까 ","
           });
           
           //마지막 컴마 제거
           n=n.substring(0,n.length-1); //n= 다시 n이 되어야지(잊지말것)
           console.log(n);
           
           //삭제파일로 전송
           location.href="noti/allDelete.jsp?nums="+n; //num을 보냈는데 여러개야
        }
     })
     
     //아이콘 누르면 나왔다가 없어지게
     /* $(document).on("click","i.bi-plus",function(){
        $(this).closest("tr").next("tr.noticontent").slideToggle();
        $(this).removeClass("bi-plus").addClass("bi-dash");
        
     }) */
     
     
          // bi-plus 아이콘을 클릭했을 때 content 내용을 보이거나 숨김
          $(document).on("click", "i.bi-plus", function() {
              var contentDiv = $(this).closest("tr").next("tr.noticontent"); // 해당 공지사항의 content div 요소 가져오기
              contentDiv.slideToggle(); // content 내용을 보이거나 숨김

              // 아이콘 클래스 변경: bi-plus에서 bi-dash로 바꿈
              $(this).removeClass("bi-plus").addClass("bi-dash");
          });

          // bi-dash 아이콘을 클릭했을 때 content 내용을 숨김
          $(document).on("click", "i.bi-dash", function() {
              var contentDiv = $(this).closest("tr").next("tr.noticontent"); // 해당 공지사항의 content div 요소 가져오기
              contentDiv.slideToggle(); // content 내용을 보이거나 숨김

              // 아이콘 클래스 변경: bi-dash에서 bi-plus로 바꿈
              $(this).removeClass("bi-dash").addClass("bi-plus");
          });
          
          
          $(document).on("mouseover", "#effect", function() {
              $(this).addClass("hover");
          }).on("mouseout", "#effect", function() {
              $(this).removeClass("hover");
          });
     
  })
  
   $(document).ready(function() {
    // 공지사항 제목을 클릭했을 때 내용 표시
       $(".noti-link").click(function() {
           var n_num = $(this).data("n_num"); // 해당 공지사항의 번호 가져오기
           var contentDiv = $(this).next(".noti-content"); // 해당 공지사항의 내용을 담을 div 가져오기
   
           // 이미 내용이 로드되어 있는지 확인
           if (contentDiv.html().trim().length === 0) {
               // Ajax를 통해 공지사항 내용 가져오기
               $.ajax({
                   type: "get",
                   url: "noti/contentView.jsp", // 내용을 가져올 서버의 주소
                   data: { "n_num": n_num }, // 공지사항 번호 전달
                   success: function (res) {
                       contentDiv.html(res); // 가져온 내용을 해당 div에 삽입
                       contentDiv.show(); // 내용을 보이도록 설정
                   }
               });
           } else {
               // 이미 내용이 로드되어 있는 경우, 내용을 보이거나 숨김
               contentDiv.toggle();
           }
   
           return false; // 링크의 기본 동작 방지
       });
    
   });
  
  function funcdel(n_num, currentPage){
      var ans = confirm("삭제하려면 [확인]을 눌러주세요");
      if(ans){
         location.href='noti/delete.jsp?n_num='+n_num+"&currentPage="+currentPage;
      }
  }
 
  

</script>
</head>
<%
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");

NotiDao dao=new NotiDao();

//전체갯수
int totalCount=dao.getTotalCount();
int perPage=5; //한페이지당 보여질 글의 갯수
int perBlock=5; //한블럭당 보여질 페이지 갯수
int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
int startPage; //각블럭당 보여질 시작페이지
int endPage; //각블럭당 보여질 끝페이지
int currentPage;  //현재페이지
int totalPage; //총페이지수
int no; //각페이지당 출력할 시작번호

//현재페이지 읽는데 단 null일경우는 1페이지로 준다
if(request.getParameter("currentPage")==null)
   currentPage=1;
else
   currentPage=Integer.parseInt(request.getParameter("currentPage")); //계산해야하니까 int로 변환

//총페이지수 구한다
//총글갯수/한페이지당보여질갯수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요) //로직 복사사용하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭당(하단 숫자1 2 3 4 5 6) 보여질 시작페이지
//perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가1,끝페이지가 5
//현재가 13일경우 시작:11 끝:15
startPage=(currentPage-1)/perBlock*perBlock+1; //이런 공식이다..
endPage=startPage+perBlock-1;

//총페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
if(endPage>totalPage)
   endPage=totalPage;

//각페이지에서 보여질 시작번호
//1페이지:0, 2페이지:5 3페이지: 10.....
startNum=(currentPage-1)*perPage;

//각페이지당 출력할 시작번호 구하기
//총글개수가 23  , 1페이지:23 2페이지:18  3페이지:13
no=totalCount-(currentPage-1)*perPage;

//페이지에서 보여질 글만 가져오기
List<NotiDto>list=dao.getList(startNum, perPage);

//List<SimpleBoardDto>list=dao.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
//int count=list.size();

//컨텐츠 내용 가져오기
String n_num=request.getParameter("n_num");

SemiMemberDao sdao=new SemiMemberDao();
SemiMemberDto sdto=sdao.getMemberById(myid);


%>

<body>
<div class="image-and-text" style="margin: 40px auto 0;">
	<img class="reviewimg" src="noti/image_noti/mega.png">
    <div>    
        <b class="board-text">공지사항</b><br>
        <span class="board-text" style="color: gray; font-size: 0.8em;">공지사항을 안내합니다.</span>
    </div>
</div>

<div style="margin: 0 auto; width: 900px;">
   
   <!-- <h6 style="" id="head"><b>공지사항</b> -->
      <div class="bs_ipt">
       <input type="text" id="searchKeyword" name="" class="search_input" autocomplete="off">
          <a class="btn_del" style="display: none;">삭제</a>
          <label id="searchButton"></label>
      </div>
   </h6><br>
   <table class="table table-group-divider">
   
        <%-- <caption align="top" style="padding-bottom: 15px;"><b>총 <%=totalCount %>건의 글이 있습니다</b></caption>
      <caption align="top" style="padding-bottom: 20px;"><b>공지사항</b></caption>
      <h6><b>총 <%=totalCount %>건의 글이 있습니다</b></h6>
      <tr style="text-align: center;" class="table-group-divider">
         <th width="80">번호</th>
         <th width="450">제목</th>
         <!-- <th width="150">작성자</th> -->
         <th width="130">등록일</th>
         <!-- <th width="80">조회수</th> -->
         <th width="80"></th>
      </tr> --%>
      
      <%
        if(totalCount==0){%>
           <tr>
             <td colspan="4" align="center">
               <h6><b>등록된 게시글이 없습니다</b></h6>
             </td>
           </tr>
        <%}else{
           for(NotiDto dto:list)
           {%>
              <tr class="hover-effect">
                <td width="80" style="vertical-align: middle; font-size: 0.8em; color: gray;"><%=dto.getN_juje() %></td>
                
                <td style="font-family: 'Noto Sans KR'; vertical-align: middle; width: 450">
                <a href="#" class="noti-link" n_num="<%=dto.getN_num()%>">
                    <%=dto.getN_subject() %>
                </a>
                <!-- <div class="noti-content" style="display: none;"></div> 공지사항 내용을 담을 div 추가 -->
              </td>
                
                <%-- <td align="center"><%=dto.getN_writer() %></td> --%>
                <td align="center" style="font-family: 'Noto Sans KR'; vertical-align: middle; width:180"><%=sdf.format(dto.getN_writeday()) %></td>
                <%-- <td align="center"><%=dto.getN_readcount() %></td> --%>
                <td style="width: 50px;"><i class="bi bi-plus fs-3" n_num="<%=dto.getN_num() %>"
                style="cursor: pointer;"></i></td>
                
              </tr>
              
              <tr class="noticontent">
                 
                 <td colspan="4">
                    <%=dto.getN_content() %>
                    <div align="right">   
                    <%
                       if(loginok!=null && sdto.getId().equals("admin"))
                       {%>
                          <button type="button" class="btn btn-secondary btn-sm" 
                               onclick="location.href='index.jsp?main=noti/updateForm.jsp?n_num=<%=dto.getN_num()%>&currentPage=<%=currentPage%>'">수정</button>
                          <button type="button" class="btn btn-secondary btn-sm" 
                               onclick="funcdel(<%=dto.getN_num()%>,<%=currentPage%>)">삭제</button>
                       <%}
                    %>
                    </div>
                 </td>
              </tr>
           <%}%>
        <%}
      %>
   </table>
   <%
   
         if(loginok!=null && sdto.getId().equals("admin"))
         {%>
            <button type="button" class="btn btn-secondary btn-sm" style="float: right;"
            onclick="location.href='index.jsp?main=noti/addForm.jsp'">글쓰기</button>
         <%}
   %>
</div>

<div style="margin: 50px auto; width: 800px; text-align: center;">
  <!-- 페이지 번호 출력 -->
  <ul class="pagination justify-content-center">
  <%
  //이전
  if(startPage>1)
  {%>
     <li class="page-item ">
        <a class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=startPage-1%>">
        <img src="noti/image_noti/left-arrow-bold.png" style="width: 13px; height: 15px;"></a>
     </li>
  <%}
    for(int pp=startPage;pp<=endPage;pp++)
    {
       if(pp==currentPage)
       {%>
          <li class="page-item active">
          <a class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
          </li>
       <%}else
       {%>
          <li class="page-item">
          <a class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=pp%>"><%=pp %></a>
          </li>
       <%}
    }
    
    //다음
    if(endPage<totalPage)
    {%>
       <li class="page-item">
          <a  class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=endPage+1%>">
          <img src="noti/image_noti/right-arrow-bold.png" style="width: 13px; height: 15px;"></a>
       </li>
    <%}
  %>
  </ul>
</div>
</body>
</html>