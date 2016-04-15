<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<%@ attribute name="id" required="true" %>
<%@ attribute name="type" required="true" %>
<%@ attribute name="text" required="true" %>

<div class="form-group">
	<label for="${id}">${text}</label>
	<input type="${type}" id="${id}" name="${id}" class="form-control">
</div>
