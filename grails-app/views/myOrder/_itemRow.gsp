
<div class="container">

    <g:set var="item" value="${bean}"/>

    <tr id="${item.id}">
        <td>${item.name}</td>
        <g:if test="${item.order.currentOrder == true}">
            <td><g:select data-id="${item.id}" class="quantity" name="quantity" from="${1..10}" value="${item.quantity}"/></td>
            <td><g:select data-id="${item.id}" class="size" name="size" from="${["small","medium","large"]}" value="${item.size}"/></td>
        </g:if>
        <g:else>
            <td><label>${item.quantity}</label></td>
            <td><label>${item.size}</label></td>
        </g:else>
        <td><label id="label-${item.id}">${item.currentPrice}</label></td>
        <g:if test="${item.order.currentOrder == true}">
            <td><button type="button" data-id="${item.id}" class="delete">Delete</button></td>
        </g:if>
    </tr>
</div>
