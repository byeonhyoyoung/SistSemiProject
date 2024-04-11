<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONObject" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "8D8NHhYi_PFhnBVqI0FM";// 네이버 애플리케이션 클라이언트 아이디
    String clientSecret = "m0rEGsiM54";// 네이버 애플리케이션 클라이언트 시크릿
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/SemiProject/index.jsp?main=login/loginForm3_api.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    System.out.println("apiURL="+apiURL);
    
    try {
      // 네이버 로그인 API로 access_token 요청
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");

      // 응답 코드 확인
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if(responseCode==200) { // 요청이 성공적으로 처리됨
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else { // 요청이 실패함
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }

      // 응답 본문 읽기
      StringBuilder response = new StringBuilder(); // 첫번째 response 변수
      String inputLine;
      while ((inputLine = br.readLine()) != null) {
        response.append(inputLine);
      }
      br.close();

      // 응답으로 받은 JSON 데이터 파싱
      JSONObject jsonResponse = new JSONObject(response.toString());
      String accessToken = jsonResponse.getString("access_token");

      // 사용자 정보 가져오기
      String userInfoApiURL = "https://openapi.naver.com/v1/nid/me";
      URL userInfoURL = new URL(userInfoApiURL);
      HttpURLConnection userInfoCon = (HttpURLConnection) userInfoURL.openConnection();
      userInfoCon.setRequestMethod("GET");
      userInfoCon.setRequestProperty("Authorization", "Bearer " + accessToken);

      int userInfoResponseCode = userInfoCon.getResponseCode();
      BufferedReader userInfoBR;
      if (userInfoResponseCode == 200) { // 요청이 성공적으로 처리됨
        userInfoBR = new BufferedReader(new InputStreamReader(userInfoCon.getInputStream()));
      } else { // 요청이 실패함
        userInfoBR = new BufferedReader(new InputStreamReader(userInfoCon.getErrorStream()));
      }

      // 사용자 정보 응답 본문 읽기
      StringBuilder userInfoResponse = new StringBuilder(); // 두번째 response 변수
      String userInfoInputLine;
      while ((userInfoInputLine = userInfoBR.readLine()) != null) {
        userInfoResponse.append(userInfoInputLine);
      }
      userInfoBR.close();

      // 사용자 정보 JSON 파싱
      JSONObject userInfoJSON = new JSONObject(userInfoResponse.toString());
      JSONObject userInfo = userInfoJSON.getJSONObject("response");

      // 사용자 정보 추출
      String id = userInfo.getString("id");
      String name = userInfo.getString("name");
      String email = userInfo.getString("email");
      String nickname = userInfo.getString("nickname");

      // 여기서부터는 해당 정보를 이용하여 회원가입을 진행하면 됩니다.
      // 예를 들어, SemiMemberDao를 사용하여 회원가입을 진행할 수 있습니다.
      // SemiMemberDao semiMemberDao = new SemiMemberDao();
      // semiMemberDao.registerUser(id, name, email, nickname);

      // 회원가입 후 처리 작업을 진행하시면 됩니다. 예를 들어, 메인 페이지로 리디렉션하거나 다른 작업을 수행할 수 있습니다.
      response.sendRedirect("http://localhost:8080/SemiProject/index.jsp");
    } catch (Exception e) {
      e.printStackTrace();
    }
  %>
  </body>
</html>
