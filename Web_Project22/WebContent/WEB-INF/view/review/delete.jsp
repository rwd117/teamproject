<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<title>������Ʈ</title>
<link href="css/view.css" rel="stylesheet">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/slidescript.js"></script>
<script src="js/1.js"></script>
<script src="js/4.js"></script>
</head>

<%
String pageNum=request.getParameter("pageNum");

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
int q_id=0, q_hit=0, q_ref=0, q_step=0, q_level=0;
String q_idname="", q_title="", q_content="", q_fname="", q_ip="", q_email="";
Timestamp q_date=null;


try{
q_id=Integer.parseInt(request.getParameter("q_id"));
}catch (Exception e){	
}
qtableDBBean db=qtableDBBean.getInstance();
qtableBean board=db.getBoard(q_id, false);



if(board!=null){
	q_id=board.getQ_id();
	q_idname=board.getQ_idname();
	q_email=board.getQ_email();
	q_title=board.getQ_title();
	q_content=board.getQ_content();
	q_date=board.getQ_date();
	q_hit=board.getQ_hit();
	q_ip=board.getQ_ip();
	q_fname=board.getQ_fname();
	
	q_ref=board.getQ_ref();
	q_step=board.getQ_step();
	q_level=board.getQ_level();
	
	
}
%>
<body>
        <!-- <�����̵�, �α���,�޴��� ����κ�> -->
        <div id="contents1">
            <div class="topAreaout">
                <div class="topArea">
                    <div class="menu1">
                        <ul>
                            <li><a href="#">�� FAVORITE</a></li>
                            <li><a href="#">�� DESKTOP ICON</a></li>
    
                        </ul>
                    </div>
                    <div class="menu2">
                        <ul>
                           <li><a href="qna.jsp">NOTICE</a></li>
						<li><a href="order.jsp">ORDER</a></li>
						<li><a href="#">MYPAGE</a></li>
						<li><a href="login.jsp">LOGIN</a></li>
						<li><a href="join.jsp">JOIN</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="topAreaout2">
                <div class="topArea2">
                    <div class="topArea3">
                        <h1>
                            <a href="index.jsp">SSA DA GU</a>
                        </h1>
                    </div>
    
                    <div class="topArea4">
                        <li><a href="#"><img src="img/insta.png"></a></li>
                        <li><a href="#"><img src="img/face.png"></a></li>
                        <li><a href="#"><img src="img/blog.png"></a></li>
                        <li><a href="#"><img src="img/kakao.png"></a></li>
                    </div>
                </div>
            </div>
        </div>
    
        </div>
        <header>
            <div class="inner">
    
                <div class="inner1">
                    <!-- ���ʻ��̵�޴���ư       -->
                    <button class="btn1">
                        <img src="img/menu11.png" alt="menu-icon">
                    </button>
                    <!-- �˻�â  -->
                    <li class="sideMenu3"><input type="text" title="�˻�">
                        <button class="btn2" type="submit" value="�˻�">
                            <img src="img/search.png" alt="menu-icon">
                        </button></li>
    
                    <!-- <�α��κκ�> -->
                    <div class="menu3">
                        <ul>
                          <li class="mainMenu1"><a href="top.jsp">TOP</a></li>
						<li class="mainMenu1"><a href="bottom.jsp">BOTTOM</a></li>						
						<li class="mainMenu1"><a href="outer.jsp">OUTER</a></li>
						<li class="mainMenu1"><a href="shoes&bag.jsp">SHOES & BAG</a></li>
						<li class="mainMenu1"><a href="acc.jsp">ACC</a></li>
						<li class="mainMenu1"><a href="set.jsp">SET</a></li>
						<li class="mainMenu1"><a href="home_easy.jsp">HOME/EASY</a></li>
                        </ul>
                    </div>
                </div>
            </div>
    
        </header>
        </div>
        <!-- �߰��� �������κ� -->
       <div id="contents2">
            <div id="contents3">
                <input type="button" value="Q & A">
        </div>
            <div id="contents4">
            <form action="qdeleteok.jsp">
		<input type="hidden" name="q_id" value="<%=q_id%>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
            <table border="1" class="table">
                    <th>IMAGE</th>
                    <td></td>
                </table>
            
        <table border="1" class="table">
            <tr>
                <th>�۹�ȣ</th>
                <td colspan="3"><%=q_id%></td>  
            </tr>
            <tr>
                <th>����</th>
                <td colspan="3"><%=q_title%></td>  
            </tr>
            <tr>
                <th>�ۼ���</th>
                <td colspan="3" ><%=q_idname%></td>
                
            </tr>
            <tr>
                <th>�̸���</th>
                <td colspan="3"><%=q_email %>
                </td>
            </tr>
             <tr>
                <th>�����</th>
                <td><%=q_date %></td>  
            </tr>
            <tr>
                <th>��ȸ��</th>
                <td><%=q_hit %></td> 
            </tr>
            <tr class="tr20">
                
                <td colspan="4"><textarea name="q_content"><%=q_content %></textarea></td>
			</tr>
			<tr>
                <th>��й�ȣ</th>
                <td colspan="1"><input type="password" name="q_pwd">�����Ϸ��� ��й�ȣ�� �Է��ϼ���.</td>	
            </tr>
            
        </table>
        <div class="section3">
            <input type="submit" value="����" >
            <input type="button" value="���" onclick="location.href='qna.jsp'">
            </div>     
       </div>
    <!-- Ǫ�� -->
	<div id="footer">
		<div class="left">
			<ul>
				<li><a href="#">��������</a></li>
				<li><a href="#">�̸��Ϲ��ܼ����ź�</a></li>
				<li><a href="#">�̿���</a></li>
				<li><a href="#">����������޹�ħ</a></li>
				<li><a href="#">������</a></li>
				<li><a href="#">��������</a></li>
			</ul>
		</div>
		<div class="right">
			<select>
				<option>�ٷΰ���</option>
				<option>aaaa</option>
				<option>bbbb</option>
				<option>cccc</option>
				<option>dddd</option>
				<option>eeee</option>
			</select>
		</div>
	</div>


	<!-- /* ���ʻ��̵�� */ -->
	<aside>
		<nav id="aside nav">

			<ul>
				<li class="sideMenu1"><a href="#">NEW</a></li>
				<li class="sideMenu1"><a href="#">BEST ITEM</a></li>


				<li class="sideMenu1"><a href="#">TOP</a>
					<ul class="subMenu1">
						<li><a href="#">BL / SHIRT</a></li>
						<li><a href="#">TEE / KNIT</a></li>
						<li><a href="#">HOOD / MANTOMAN</a></li>
					</ul></li>


				<li class="sideMenu1"><a href="#">BOTTOM</a>
					<ul class="subMenu1">
						<li><a href="#">PANTS</a></li>
						<li><a href="#">SKIRT</a></li>
					</ul></li>


				<li class="sideMenu1"><a href="#">OUTER</a>
					<ul class="subMenu1">
						<li><a href="#">JACKET /COAT</a></li>
						<li><a href="#">CARDIGAN </a></li>
						<li><a href="#">JP/PADDING</a></li>
					</ul></li>

				<li class="sideMenu1"><a href="#">SHOES & BAG</a>
					<ul class="subMenu1">
						<li><a href="#">SHOES</a></li>
						<li><a href="#">BAG</a></li>

					</ul></li>

				<li class="sideMenu1"><a href="#">ACC</a>
					<ul class="subMenu1">
						<li><a href="#"> JEWELRY </a></li>
						<li><a href="#"> HAT </a></li>
						<li><a href="#"> ETC</a></li>
					</ul></li>

				<li class="sideMenu1"><a href="#">SET</a></li>

				<li class="sideMenu1"><a href="#">HOME/EASY</a></li>

			</ul>
		</nav>

	</aside>
	<!-- /* �����ʻ��̵�� */ -->
	<right-sidebar>
	<div class="right">
		<ul class="subMenu2">
			<li><a href="order.jsp"><img src="img/ico_cart_b.png"> CART</a></li>
			<li><a href="order.jsp"><img src="img/ico_order_b.png"> ORDER</a></li>
			<li><a href="qna.jsp"><img src="img/my_icon2.png"> DELIVERY</a></li>	
            <li><a href="qna.jsp"><img src="img/rsi_22.png"> EVENT</a></li>
            <li><a href="write.jsp"><img src="img/lsi_theday_off.png"> Q&A</a></li>
			<li><a href="qna.jsp"><img src="img/lsi_best50_off.png"> REVIEW</a></li>
		</ul>
		<button class="up1">
			<img src="img/up1.png">
		</button>
		<a href="#"><button class="up">
				<img src="img/up.png">
			</button></a>
	</div>
	</right-sidebar>

</body>
</html>



</html>