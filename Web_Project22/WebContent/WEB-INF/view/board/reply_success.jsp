<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='conPath' value='${pageContext.request.contextPath }/'/>
<script>
	alert('저장되었습니다')
	location.href = '${conPath}board/main?board_info_idx=${writeContentBean.content_board_idx}&content_idx=${writeContentBean.content_idx}&page=${page}'
</script>