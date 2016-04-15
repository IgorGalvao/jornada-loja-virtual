<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<%@ attribute name="name" required="true" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="value" required="true" %>
<%@ attribute name="text" required="true" %>

<div class="radio">
	<label><input type="radio" name="${name}" id="${id}" value="${value}">${text}</label>
</div>
