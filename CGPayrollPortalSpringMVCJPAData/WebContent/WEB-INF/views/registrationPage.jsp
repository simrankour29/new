<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Registration</title>
<style>
.error{
color:red;
font-weight:bold;
}
</style>
</head>
<body>
<div align="center">
<h2>Enroll Associate Details Here</h2>
<table>
<form:form action="registerAssociate" method="post" modelAttribute="associate">
<tr>
    <td> FirstName:</td>
    <td><form:input path="firstName" size="30"/></td>
        <td><form:errors path="firstName" cssClass="error"/></td>
    
    </tr>
    <tr>
    <td>LastName:</td>
     <td><form:input path="lastName" size="30"/></td>
        <td><form:errors path="lastName" cssClass="error"/></td>
     </tr>
     <tr>
     
     <td>yearlyInvestmentUnder80C:</td>
     <td><form:input path="yearlyInvestmentUnder80C" size="30"/></td>
        <td><form:errors path="yearlyInvestmentUnder80C" cssClass="error"/></td>
     </tr>
     <tr>
    
    <td>BankDetails:</td>
     <td><form:input path="BankDetails.bankName" size="30"/></td>
        <td><form:errors path="BankDetails.bankName" cssClass="error"/></td>
     </tr>
     <tr>
    
     <td>accountNumber:</td>
     <td><form:input path="bankDetails.accountNumber" size="30"/></td>
        <td><form:errors path="bankDetails.accountNumber" cssClass="error"/></td>
     </tr>
     <tr>
    
    <td>ifscCode</td>
     <td><form:input path="bankDetails.ifscCode" size="30"/></td>
        <td><form:errors path="bankDetails.ifscCode" cssClass="error"/></td>
     </tr>
     <tr>
    
     <td>basicSalary</td>
     <td><form:input path="salary.basicSalary" size="30"/></td>
        <td><form:errors path="salary.basicSalary" cssClass="error"/></td>
     </tr>
     <tr>
     
      <td>hra</td>
     <td><form:input path="salary.hra" size="30"/></td>
        <td><form:errors path="salary.hra" cssClass="error"/></td>
     </tr>
     <tr>
    
    <td>conveyenceAllowance</td>
     <td><form:input path="salary.conveyenceAllowance" size="30"/></td>
        <td><form:errors path="salary.conveyenceAllowance" cssClass="error"/></td>
     </tr>
     <tr>
     
     <td>otherAllowance</td>
     <td><form:input path="salary.otherAllowance" size="30"/></td>
        <td><form:errors path="salary.otherAllowance" cssClass="error"/></td>
     </tr>
     <tr>
     
     <td>personalAllowance</td>
     <td><form:input path="salary.personalAllowance" size="30"/></td>
        <td><form:errors path="salary.personalAllowance" cssClass="error"/></td>
     </tr>
     <tr>
    
     <td>epf</td>
     <td><form:input path="salary.epf" size="30"/></td>
        <td><form:errors path="salary.epf" cssClass="error"/></td>
     </tr>
     <tr>
     
      <td>monthlyTax</td>
     <td><form:input path="salary.monthlyTax" size="30"/></td>
        <td><form:errors path="salary.monthlyTax" cssClass="error"/></td>
     </tr>
     <tr>
     
      <td>companyPf</td>
     <td><form:input path="salary.companyPf" size="30"/></td>
        <td><form:errors path="salary.companyPf" cssClass="error"/></td>
     </tr>
     <tr>
     
      <td>grossSalary</td>
     <td><form:input path="salary.grossSalary" size="30"/></td>
        <td><form:errors path="salary.grossSalary" cssClass="error"/></td>
     </tr>
     <tr>
     
      <td>netSalary</td>
     <td><form:input path="salary.netSalary" size="30"/></td>
        <td><form:errors path="salary.netSalary" cssClass="error"/></td>
     </tr>
<tr>
<td><input type="submit" value="Submit"/></td>

</form:form>
</table></div>

</body>
</html>
