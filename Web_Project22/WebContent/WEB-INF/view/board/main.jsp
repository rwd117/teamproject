<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<body>
 <c:import url="/WEB-INF/view/include/top_menu.jsp"/>
	</div>
	<!-- 중간에 컨텐츠부분 -->
	<div id="contents2">

    <div class="tabArea">   
        <ul class="tabList" >           
            <c:forEach var="obj" items="${qnaTopList}">
        	 <li><a href="${conPath }board/main?board_info_idx=${obj.board_info_idx}"> ${obj.board_info_name }</a><li>
         	</c:forEach>
                <div class="tabCon notice" >                
                    <table class="table table-striped" >
                        <thead>
                            <tr>
                                <th scope="cols">번호</th>
                                <th scope="cols">이미지</th>
                                <th scope="cols">제목</th>
                                <th scope="cols">작성자</th>
                                <th scope="cols">등록일</th>
                                <th scope="cols">조회수</th>
                            </tr>
                            
                        </thead>
                        <tbody>
                        <c:forEach var="obj"  items="${contentList}" >
                            <tr>
                                <td scope="row">${obj.content_idx}</td>
                                 <td>${obj.content_file}</td>
                                <td><a href='${conPath }board/read?board_info_idx=${board_info_idx}&content_idx=${obj.content_idx}&page=${page}'>${obj.content_subject}</a></td>                             
                                <td>${obj.content_write_name}</td>
                                <td>${obj.content_date}</td>
						  		<td></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="${conPath}board/main?board_info_idx=${board_list[idx.index].board_info_idx}">더보기</a>
                </div>
           </ul>
  		</div>
	 
	<div class="content2">
		<a href="${conPath }board/write?board_info_idx=${board_info_idx}"><img src="../img/btn_write.gif" alt="글쓰기"></a>
	</div>
	<div class="content3">
	
	<ul>
		<c:choose>
			<c:when test="${pageBean.prevPage <= 0 }">
			<li><a href="#"><img src="../img/btn_page_prev.gif" alt="이전"></a></li>
			</c:when>
			<c:otherwise>
			<li class="page-item">
			<a href="${conPath }board/main?board_info_idx=${board_info_idx}&page=${pageBean.prevPage}" class="page-link">이전</a>
			</li>
			</c:otherwise>
			</c:choose>
			<!-- [1][2][3][4][5][6][7][8][9][10] -->	
					<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
					    <c:choose>
					    	<c:when test="${idx==pageBean.currentPage }">
								<li class="page-item active">
									<a href="${conPath }board/main?board_info_idx=${board_info_idx}&page=${idx}" class="page-link">
									[ ${idx } ]
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${conPath }board/main?board_info_idx=${board_info_idx}&page=${idx}" class="page-link">
									[ ${idx } ]
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
			<li><a href="#"><img src="../img/btn_page_next.gif" alt="다음"></a></li>
			</c:when>
					<c:otherwise>
						<li class="page-item">
							<a href="${conPath }board/main?board_info_idx=${board_info_idx}&page=${pageBean.nextPage}" class="page-link"><img src="../img/btn_page_next.gif" alt="다음"></a>
						</li>
					</c:otherwise>
				</c:choose>
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