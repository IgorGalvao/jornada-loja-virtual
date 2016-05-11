<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ attribute name="id" required="true" %>
<%@ attribute name="type" required="true" %>
<%@ attribute name="text" required="true" %>
<%@ attribute name="errorsPath" required="false" %>

<div class="form-group">
	<label for="${id}">${text}</label>
	<form:errors path="${errorsPath}" cssClass="erro"/>
	<input type="${type}" id="${id}" name="${id}" class="form-control">
</div>
