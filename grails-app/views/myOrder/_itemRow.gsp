
<div class="container">

    <g:set var="item" value="${bean}"/>
    <g:form controller="MyOrder" action="changeQuantity" params="[id: item.id]">
    <tr>
        <td>${item.name}</td>
        <td><g:select data-id="${item.id}" id="quantity" name="quantity" from="${1..10}" value="${item.quantity}"/></td>
        <td><g:select id="size" name="size" from="${["small","medium","large"]}" value="${item.size}"/></td>
        <td>${item.price}</td>
        <td><g:actionSubmit id="delete" value="Delete" action="deleteItem"/></td>
    </tr>
    </g:form>
</div>
