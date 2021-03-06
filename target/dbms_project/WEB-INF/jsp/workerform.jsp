<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

		<head>
<link href="<c:url value="/resources/css/navtable.css" />" rel="stylesheet">
</head>
<body background="${pageContext.request.contextPath}/resources/images/back2.jpg">
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
			<ul>
			  <li class="left"><a class="active" href="/dbms_project/welcome/">Home</a></li>
			  <li class="right"><a href="javascript:formSubmit()"> Logout</a></li>
			</ul>
	</c:if>
	<div class="loginBox">
		<h1>Add New Worker</h1>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
       <form:form method="post" action="/dbms_project/worker/save">  
      	<table id="tab">
      	<tr>  
          <td>UserName : </td> 
          <td><form:input path="username"  required="true"/></td>
         </tr>  
         <tr>  
          <td>Name : </td> 
          <td><form:input path="name"  required="true"/></td>
         </tr>  
         <tr>  
          <td>Contact Number :</td>  
          <td><form:input path="contact_No" required="true" pattern="[789][0-9]{9}" maxlength="10"/></td>
         </tr> 
         <tr>  
          <td>Aadhar Number :</td>  
          <td><form:input path="aadhar_No" required="true" maxlength="12"/></td>
         </tr>
         <tr>  
          <td>House number :</td>  
          <td><form:input path="house_No" required="true" type="number"/></td>
         </tr>
         <tr>  
          <td>Street :</td>  
          <td><form:input path="street" required="true"/></td>
         </tr>
         <tr>  
          <td>Area :</td>  
          <td><form:input path="area" required="true"/></td>
         </tr>
         <tr>  
          <td>Salary per Annum :</td>  
          <td><form:input path="salary_per__annum" required="true" type="number"/></td>
         </tr>
         <tr>  
          <td>Joining Date :</td>  
          <td><input name="joining_Date" type="date" /></td>
         </tr>
         <tr>  
          <td>Medical Store Branch :</td>  
          <td><form:select path="ms_id" required="true">
          		<c:forEach var="msb" items="${list}">
          		<form:option value="${msb.MS_Id}">${msb.major_Location}</form:option>
          		</c:forEach>
          	</form:select>
          </td>
         </tr>  
        </table>
        <input class="link" type="submit" value="Set Password" />  
       </form:form>  
       </div>
