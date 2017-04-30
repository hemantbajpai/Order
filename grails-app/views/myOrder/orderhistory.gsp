<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'myOrder.label', default: 'MyOrder')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <table>
            <thead>
            <tr>
                <th>
                    <label>Date Created</label>
                </th>
                <th>
                    <label>Last Updated</label>
                </th>
                <th>
                    <label>Date Purchased</label>
                </th>
                <th>
                    <label>Total Amount</label>
                </th>
            </tr>
            <g:each var="order" in="${orders}">

                <tr>
                    <td>
                        <a href="/myorder/show/${order.id}">
                            <g:formatDate format="MM-dd-yyyy" date="${order.dateCreated}" />
                        </a>
                    </td>
                    <td>
                        <a href="/myorder/show/${order.id}">
                            <g:formatDate format="MM-dd-yyyy" date="${order.lastUpdated}" />
                        </a>
                    </td>
                    <td>
                        <a href="/myorder/show/${order.id}">
                            <g:if test="${order.currentOrder == false}">
                                <g:formatDate format="MM-dd-yyyy" date="${order.lastUpdated}" />
                            </g:if>
                            <g:else>
                                <label>Still Pending</label>
                            </g:else>
                        </a>
                    </td>
                    <td>
                        <a href="/myorder/show/${order.id}">
                            <label>${order.getTotal()}</label>
                        </a>
                    </td>
                </tr>

            </g:each>
            </thead>
        </table>
    </body>
</html>
