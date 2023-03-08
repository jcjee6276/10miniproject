<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>Model2 MVC Shop</title>

	<link href="/css/left.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script type="text/javascript">
	
	$( function() {
	    var state = true;
	    $( ".Depth03:contains('����������ȸ')" ).hover(function() {
	      if ( state ) {
	        $( ".Depth03:contains('����������ȸ')" ).animate({
	          backgroundColor: "#aa0000",
	          color: "#fff",
	          width: 159
	        }, 1000 );
	      } else {
	        $( ".Depth03:contains('����������ȸ')" ).animate({
	          backgroundColor: "#fff",
	          color: "#000",
	          width: 159
	        }, 1000 );
	      }
	      state = !state;
	    });
	  } );
	
	$( function() {
	    var state = true;
	    $( ".Depth03:contains('ȸ��������ȸ')" ).hover(function() {
	      if ( state ) {
	        $( ".Depth03:contains('ȸ��������ȸ')" ).animate({
	          backgroundColor: "#aa0000",
	          color: "#fff",
	          width: 159
	        }, 20 );
	      } else {
	        $( ".Depth03:contains('ȸ��������ȸ')" ).animate({
	          backgroundColor: "#fff",
	          color: "#000",
	          width: 159
	        }, 20 );
	      }
	      state = !state;
	    });
	  } );
	
	
	
		//==> jQuery ���� �߰��� �κ�
		 $(function() {
			 
			//==> ����������ȸ Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('����������ȸ')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
			});
			
			$(".Depth03:contains('�ֱ� �� ��ǰ')").on("click", function() {
				popWin = window.open("/history.jsp", "popWin",
				"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
			});
			
			
			//==> ȸ��������ȸ Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('ȸ��������ȸ')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
		 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
			}); 
			
			$( ".Depth03:contains('�ǸŻ�ǰ���')").on("click", function() {
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/addProduct");
				
			});
			
			$( ".Depth03:contains('�ǸŻ�ǰ����')").on("click", function() {
				$(window.parent.frames["rightFrame"].document.location).attr("href", "/product/listProduct?menu=manage");
			});
			
			$( ".Depth03:contains('�� ǰ �� ��')").on("click", function() {
				$(window.parent.frames["rightFrame"].document.location).attr("href", "/product/listProduct?menu=search");
			});
			
			$( ".Depth03:contains('�����̷���ȸ')").on("click", function(){
				$(window.parent.frames["rightFrame"].document.location).attr("href", "/purchase/listPurchase")
			});
			
		});	
		 
	</script>
	
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
			<tr>
				<c:if test="${ !empty user }">
					<tr>
						<td class="Depth03">
							<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/getUser?userId=${user.userId}" target="rightFrame">����������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							����������ȸ
						</td>
					</tr>
				</c:if>
			
				<c:if test="${user.role == 'admin'}">
					<tr>
						<td class="Depth03" >
							<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/listUser" target="rightFrame">ȸ��������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							ȸ��������ȸ
						</td>
					</tr>
				</c:if>
			
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
		</table>
	</td>
</tr>

<!--menu 02 line-->
<c:if test="${user.role == 'admin'}">
	<tr>
		<td valign="top"> 
			<table  border="0" cellspacing="0" cellpadding="0" width="159">
				<tr>
					<td class="Depth03">
						�ǸŻ�ǰ���
					</td>
				</tr>
				<tr>
					<td class="Depth03">
						�ǸŻ�ǰ����
					</td>
				</tr>
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</c:if>

<!--menu 03 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159">
			<tr>
				<td class="Depth03">
					�� ǰ �� ��
				</td>
			</tr>
			
			<c:if test="${ !empty user}">
			<tr>
				<td class="Depth03">
					�����̷���ȸ
				</td>
			</tr>
			</c:if>
			
			<tr>
				<td class="DepthEnd">&nbsp;</td>
			</tr>
			<tr>
				<td class="Depth03">�ֱ� �� ��ǰ</td>
			</tr>
		</table>
	</td>
</tr>

</table>

</body>

</html>