<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
	

	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
--%>








<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">

function fncGetProductList(currentPage){
	$("#currentPage").val(currentPage)
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=search").submit();
	}
	
	
$(function() {
	$( "td.ct_btn01:contains('�˻�')").on("click", function(){
		fncGetProductList(${search.currentPage });
	});
	
	
	
	<c:forEach var="i" begin="0" end="${list.size()-1}">
	
	$("#${i+1}").on("click", function() {
		self.location ="/purchase/addPurchaseView?prodNo=${list.get(i).prodNo}"
	});
	
	
	$( "#${i+1}").hover(function() {
		
		//var prodNo = ${list.get(0).prodNo}
		
		$.ajax(	{
				url : "/product/json/getProduct/"+${list.get(i).prodNo} ,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
						},
				success : function(JSONData , status) {
					var displayValue = "<h3>"
								+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
								+"��ǰ�̸� : "+JSONData.prodName+"<br/>"
								+"���� : "+JSONData.price+"<br/>"
								+"����� : "+JSONData.regDateString	
								+"</h3>";
						$("h3").remove();
						$( "#"+${list.get(i).prodNo}+"").html(displayValue);
						
						
				
				}			
			}
				);
		
	//self.location ="/product/getNameProduct?prodName="+$(this).text().trim()
	//console.log($(this).text().trim());
	});
	
	</c:forEach>
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
	$("h7").css("color" , "red");

	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/product/listProduct?menu=search" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
							��ǰ ��� ��ȸ
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
		<select name="searchCondition" class="ct_input_g" style="width:80px">
			<option value="0"${search.searchCondition ==0 ? "selected" : "" }>��ǰ��ȣ</option>
			<option value="1"${search.searchCondition ==1 ? "selected" : "" }>��ǰ��</option>
			<option value="2"${search.searchCondition ==2 ? "selected" : "" }>��ǰ����</option>
				</select>
			<input type="text" name="searchKeyword" value="${search.searchKeyword }" class="ct_input_g" style="width:200px; height:19px" />
				
		</td>
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('${search.currentPage }');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü  ${resultPage.totalCount } �Ǽ�,	���� ${resultpage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%--
		int no1=list.size();
			for(int i=0; i<list.size(); i++) {
			Product vo1 = (Product)list.get(i);
	--%>
	
	
	
	
	<c:if test="${user.userId == 'admin' }">
	<c:set var="i" value="0" />
	<c:forEach var="prod" items="${list }">
	<c:set var="i" value="${i+1 }"/>
	<tr class="ct_list_pop">
		<div> 
		<td align="center">${i }</td>
		<td></td>
		
		<td  align="left" id="${i }">${prod.prodName }</td>
		
		<td></td>
		<td align="left">${prod.price }</td>
		<td></td>
		<td align="left">${prod.regDate }</td>
		<td></td>
		<c:choose>
		<c:when test="${empty prod.proTranCode }">
		<td align="left">
		<c:out value="�Ǹ���" />
		</td>	
		</c:when>
		<c:when test="${'1' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="���ſϷ�" />
		</td>	
		</c:when>
		<c:when test="${'2' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="�����" />
		</td>	
		</c:when>
		<c:when test="${'3' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="��ۿϷ�" />
		</td>	
		</c:when>
		</c:choose>
	</tr>
	<tr class="ct_list_pop2">
		<td id="${prod.prodNo }"  colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
</c:forEach>
</c:if>	

	<c:if test="${user.userId != 'admin' }">
	<c:set var="i" value="0" />
	<c:forEach var="prod" items="${list }">
	<c:set var="i" value="${i+1 }"/>
>	<tr class="ct_list_pop">
		<td align="center">${i }</td>
		<td></td>
		<c:if test="${empty prod.proTranCode}">
		<td align="left" id="${i }">${prod.prodName }</td>
		</c:if>
		<c:if test="${not empty prod.proTranCode }">
		<td>${prod.prodName }</td>
		</c:if>
		<td></td>
		<td align="left">${prod.price }</td>
		<td></td>
		<td align="left">${prod.regDate }</td>
		<td></td>
		<c:choose>
		<c:when test="${empty prod.proTranCode }">
		<td align="left">
		<c:out value="�Ǹ���" />
		</td>	
		</c:when>
		<c:when test="${'1' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="������" />
		</td>	
		</c:when>
		<c:when test="${'2' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="������" />
		</td>	
		</c:when>
		<c:when test="${'3' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="������" />
		</td>	
		</c:when>
		</c:choose>
	</tr>
	<tr class="ct_list_pop2">
		<td id="${prod.prodNo }" colspan="11" bgcolor="D6D7D6" height="1">		
		</td>
	
	</tr>
</c:forEach>
</c:if>	
</div>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage }"/>
			<jsp:include page="../common/pageNavigatorProduct.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>

</body>

</html>


