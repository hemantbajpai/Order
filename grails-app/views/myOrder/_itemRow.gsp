<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<div class="container">

    <g:set var="item" value="${bean}"/>
    <tr>
        <td class="col-sm-1 col-xs-2">${item.name}</td>
        <td class="col-sm-1 col-xs-2">${item.quantity}</td>
        <td class="col-sm-1 col-xs-2">${item.size}</td>
        <td class="col-sm-1 col-xs-2">${item.price}</td>
    </tr>
</div>