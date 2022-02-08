<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${tourdetail.parking }
${tourdetail.chkpet }
${tourdetail.infocenter }
${tourdetail.restdate }
${tourdetail.usetime }
${tourdetail.expguide }
${tourdetail.expagerange }
${tourdetail.chkbabycarriage }
<hr>
<c:forEach var="c" items="${tourdetail2}">
	${c.infoname }
	${c.infotext }	
</c:forEach>
<hr>
${tourdetail3.createdtime }


</body>
</html>