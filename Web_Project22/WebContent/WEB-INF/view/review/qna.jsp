<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jula.qtableBean"%>
<%@page import="jula.qtableDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <c:set var='conPath' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<link href="../css/tab_style.css" rel="stylesheet">
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/slidescript.js"></script>
<script src="../js/1.js"></script>
<script src="../js/4.js"></script>
<script>
        $(function () {
            var $tabBtn = $('.tabArea .tabBtn');
            var $tabCon = $('.tabArea .tabCon');
            $tabBtn.click(function (e) {
                e.preventDefault();              //기본 동작을 취소
                $tabBtn.removeClass('xx');
                $(this).addClass('xx');
                $tabCon.hide();
                $(this).next('.tabCon').show();

            });
        });
    </script>
</head>
<%
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
//중요----------------------------------	
	qtableDBBean db=qtableDBBean.getInstance();  //boardDBBean객체생성(db객체)
	ArrayList<qtableBean> boardlist=db.listBoard(pageNum); //★
//-------------------------------------	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	String q_idname, q_email, q_title, q_content , q_fname;
	int q_id=0, q_hit=0, q_level=0, q_fsize ;
	Timestamp q_date=null;
	
	int count=0;
	int i,k;
	
%>
<body>
 <c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	</div>
	<!-- 중간에 컨텐츠부분 -->
	<div id="contents2">

    <div class="tabArea">
        <ul class="tabList">
            <li><a href="#" class="tabBtn">NOTICE/EVENT</a>
                <div class="tabCon notice">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="cols">번호</th>
                                <th scope="cols">제목</th>
                                <th scope="cols">작성자</th>
                                <th scope="cols">등록일</th>
                                <th scope="cols">조회수</th>
                            </tr>
                            
                        </thead>
                        <tbody>
                            <tr>
                                <td scope="row"></td>
                                <td></td>
                                <td></td>
                                <td></td>
								<td></td>
								<td></td>
									<td></td>                                
                            </tr>
                        </tbody>
                    </table>
                </div>
            </li>
            <li>
                <a href="#" class="tabBtn">Q&A</a>
                <div class="tabCon notice">
                    <table class="table">
                        <thead>
                            <tr>
								<th scope="cols">번호</th>
								<th scope="cols">상품정보</th>
                                <th scope="cols">제목</th>
                                <th scope="cols">작성자</th>
                                <th scope="cols">등록일</th>
                                <th scope="cols">조회수</th>
                            </tr>
                            
                        </thead>
                        <%
				for(i=0;i<boardlist.size(); i++) {
					qtableBean board=boardlist.get(i);
					
					q_id=board.getQ_id();
					q_idname=board.getQ_idname();
					q_email=board.getQ_email();
					q_title=board.getQ_title();
					q_content=board.getQ_content();
					q_date=board.getQ_date();
					q_hit=board.getQ_hit();
					q_level=board.getQ_level();
					q_fname=board.getQ_fname();
			%>
                        <tbody>
                            <tr>
                                <td scope="row"><%=q_id %></td>
                                <td><a href="view.jsp?q_id=<%=q_id%>&pageNum=<%=pageNum%>"><%=q_fname %></a></td>
                                <td><a href="view.jsp?q_id=<%=q_id%>&pageNum=<%=pageNum%>">
				<%if(q_level >0) {
					for(k=0;k<q_level;k++){ %>
					<img src="img/00.png"  width="15 " height="15" border="0" >
				
				<%} }%>
				<%=q_title %></a></td>                 
								<td><a href="mail.jsp?b_name=<%=q_idname %>"><%=q_idname %></a></td>
								<td><%=q_date %></td>
								<td><%=q_hit%></td>
                            </tr>
                          <%	} %>
                        </tbody>
                    </table>
                </div>
			</li>
			<li>
                <a href="#" class="tabBtn">교환/반품</a>
                <div class="tabCon notice">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="cols">번호</th>
                                <th scope="cols">제목</th>
                                <th scope="cols">작성자</th>
                                <th scope="cols">등록일</th>
                                <th scope="cols">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td scope="row">1</td>
                                <td>공지사항1</td>
                                <td>관리자</td>
                                <td>2020-12-22</td>
                                <td>1</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			</li>
			<li>
                <a href="#" class="tabBtn">REVIEW</a>
                <div class="tabCon notice">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="cols">번호</th>
								<th scope="cols">상품정보</th>
                                <th scope="cols">제목</th>
                                <th scope="cols">작성자</th>
                                <th scope="cols">등록일</th>
                                <th scope="cols">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td scope="row">1</td>
                                <td>공지사항1</td>
                                <td>관리자</td>
                                <td>2020-12-22</td>
								<td>1</td>
								<td>1</td>
                            </tr>
                            <tr>
                                <td scope="row">2</td>
                                <td>공지사항2</td>
                                <td>관리자</td>
                                <td>2020-12-22</td>
								<td>1</td>
								<td>1</td>
                            </tr>
                            <tr>
                                <td scope="row">3</td>
                                <td>공지사항3</td>
                                <td>관리자</td>
                                <td>2020-12-22</td>
								<td>1</td>
								<td>1</td>
                            </tr>
                            <tr>
                                <td scope="row">4</td>
                                <td>공지사항4</td>
                                <td>관리자</td>
                                <td>2020-12-22</td>
								<td>1</td>
								<td>1</td>
                            </tr>
                            <tr>
                                <td scope="row">5</td>
                                <td>공지사항5</td>
                                <td>관리자</td>
                                <td>2020-12-22</td>
								<td>1</td>
								<td>1</td>
							</tr>
					
                        </tbody>
                    </table>
                </div>
            </li>
		</ul>
			
	</div>
	<div class="content2">
		<a href="${conPath }write"><img src="../img/btn_write.gif" alt="글쓰기"></a>
	</div>
	<div class="content3">
		<ul>
			<li><a href="#"><img src="../img/btn_page_prev.gif" alt="이전"></a></li>
			<li class="page"><a href="#" >1</a></li>
			<li class="page"><a href="#" >2</a></li>
			<li class="page"><a href="#" >3</a></li>
			<li class="page"><a href="#" >4</a></li>
			<li class="page"><a href="#" >5</a></li>
			<li><a href="#"><img src="../img/btn_page_next.gif" alt="다음"></a></li>
		</ul>
	</div>
	<div class="content4">
		<ul>
			검색어 <select>
			<a><option value="1">일주일</option>
			<option value="2">한달</option>
			<option value="3">세달</option>
			<option value="4">전체</option></select></a>
			<a><select>
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">글쓴이</option>
				<option value="2">아이디</option>
				<option value="3">별명</option>
				<option value="4">상품정보</option></select></a>
			<a><input placeholder value type="search"> </a>	
			<a><a href="" onclick=""><img src="../img/btn_find.gif"></a></a>
			</ul>
	</div>
    </div>
    


	<c:import url="/WEB-INF/view/include/bottom_menu.jsp"/>
</body>

</html>
</html>