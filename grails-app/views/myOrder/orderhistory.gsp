<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'myOrder.label', default: 'MyOrder')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <table>

            <tr>
                <th class="col-xs-3">
                    <label>Date Created</label>
                </th>
                <th class="col-xs-3">
                    <label>Last Updated</label>
                </th>
                <th class="col-xs-3">
                    <label>Date Purchased</label>
                </th>
                <th class="col-xs-3">
                    <label>Total Amount</label>
                </th>
            </tr>
            <g:each var="order" in="${orders}">

                <tr>
                    <td class="col-xs-3">
                        <a href="/myorder/show/${order.id}">
                            <g:formatDate format="MM-dd-yyyy" date="${order.dateCreated}" />
                        </a>
                    </td>
                    <td class="col-xs-3">
                            <g:formatDate format="MM-dd-yyyy" date="${order.lastUpdated}" />
                    </td>
                    <td class="col-xs-3">
                            <g:if test="${order.currentOrder == false}">
                                <g:formatDate format="MM-dd-yyyy" date="${order.lastUpdated}" />
                            </g:if>
                            <g:else>
                                <label>Still Pending</label>
                            </g:else>
                    </td>
                    <td class="col-xs-3">
                            <label>${order.getTotal()}</label>
                    </td>
                </tr>

            </g:each>

        </table>
    </body>
</html>
