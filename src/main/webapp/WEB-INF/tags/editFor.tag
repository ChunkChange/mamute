<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@attribute name="item" type="br.com.caelum.brutal.model.Updatable" required="true" %>
<%@attribute name="field" type="java.lang.String" required="true" %>
<%@attribute name="value" required="true" %>
<%@attribute name="ajaxResult" required="true" %>
<c:set var="editKey" value="${not empty currentUser and item.author.id eq currentUser.id ? 'edit' : 'suggest_edition'}" />
<span class="edit-via-ajax">
	<a href="#"><fmt:message key="${editKey }" /></a>
	<span>
		<form action="<c:url value="/${item.typeName }/${item.id }/edit/${field }"/>" class="validated-form ajax" data-ajax-result="${ajaxResult }">
			<textarea class="required to-focus hintable" minlength="15" name="value" data-hint-id="${ajaxResult }-hint">${value }</textarea>
			<input type="submit"
				value="<fmt:message key="${editKey }_submit"/>" />
		</form>
		<span id="${ajaxResult }-hint"><fmt:message key="${field}.hint"/></span>
	</span>
</span>