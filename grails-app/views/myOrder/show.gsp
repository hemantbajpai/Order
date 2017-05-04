<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'myOrder.label', default: 'MyOrder')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="application.js"></asset:javascript>
        <asset:javascript src="order.js"></asset:javascript>
    </head>
    <body>

    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Quantiy</th>
            <th>Size</th>
            <th>Price</th>
            <g:if test="${myOrder.currentOrder == true}">
                <th>Delete Item</th>
            </g:if>
        </tr>
        </thead>
        <tbody>
        <g:each var="item" in="${myOrder.items}">
            <g:if test="${item.showItem == true}">
                <g:render template="itemRow" model="[bean:item]" />
            </g:if>
        </g:each>
        </tbody>
    </table>

    <g:hasErrors bean="${myOrder}">
        <ul>
            <g:eachError var="err" bean="${myOrder}">
                <p style="color: red">${err.getField()} is not correct</p>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <h2><b>Total Price:</b> $ <label id="price">${myOrder.getTotal()}</label> </h2>

    <g:if test="${myOrder.currentOrder == true}">
    <br>
    <hr>
    <g:form controller="MyOrder" params="[id: myOrder.id]">
        <h2>Your Information</h2> <br>
        <sec:ifNotGranted roles="ROLE_ANONYMOUS">
            <table>
                <tr>
                    <td>
                        <label>First Name</label>
                    </td>
                    <td>
                        <g:textField name="firstName" value="${myOrder.user.firstName}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Last Name</label>
                    </td>
                    <td>
                        <g:textField name="lastName" value="${myOrder.user.lastName}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Address line 1</label>
                    </td>
                    <td>
                         <g:textField name="addressLine1" value="${myOrder.user.addressLine1}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Address line 2</label>
                    </td>
                    <td>
                        <g:textField name="addressLine2" value="${myOrder.user.addressLine2}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>City</label>
                    </td>
                    <td>
                        <g:textField name="city" value="${myOrder.user.city}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>State</label>
                    </td>
                    <td>
                        <g:textField name="state" value="${myOrder.user.state}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Zipcode</label>
                    </td>
                    <td>
                        <g:textField name="zipcode" value="${myOrder.user.zipcode}" />
                    </td>
                </tr>
            </table>
        </sec:ifNotGranted>
        <sec:ifAnyGranted roles="ROLE_ANONYMOUS">
            <table>
                <tr>
                    <td>
                        <label>First Name</label>
                    </td>
                    <td>
                        <g:textField name="firstName" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Last Name</label>
                    </td>
                    <td>
                        <g:textField name="lastName" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Address line 1</label>
                    </td>
                    <td>
                        <g:textField name="addressLine1" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Address line 2</label>
                    </td>
                    <td>
                        <g:textField name="addressLine2"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>City</label>
                    </td>
                    <td>
                        <g:textField name="city" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>State</label>
                    </td>
                    <td>
                        <g:textField name="state"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Zipcode</label>
                    </td>
                    <td>
                        <g:textField name="zipcode"  />
                    </td>
                </tr>
            </table>
        </sec:ifAnyGranted>
        <hr>
        <h2>Payment Information</h2> <br>
        <sec:ifNotGranted roles="ROLE_ANONYMOUS">
            <table>
                <tr>
                    <td>
                        <label>Credit card no.</label>
                    </td>
                    <td>
                        <g:textField name="creditCard" value="${myOrder.user.creditCard}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Expiry Date</label>
                    </td>
                    <td>
                        <g:field type="date" name="expiryDate" value="${myOrder.user.expiryDate}" /> <br>
                    </td>
                </tr>
            </table>
        </sec:ifNotGranted>
        <sec:ifAnyGranted roles="ROLE_ANONYMOUS">
            <table>
                <tr>
                    <td>
                        <label>Credit card no.</label>
                    </td>
                    <td>
                        <g:textField name="creditCard"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Expiry Date</label>
                    </td>
                    <td>
                        <g:field type="date" name="expiryDate"  /> <br>
                    </td>
                </tr>
            </table>
        </sec:ifAnyGranted>
        <g:actionSubmit style="float: right" value="Submit Order" action="submitOrder"/>
    </g:form>

    <br>
    </g:if>
    </body>
</html>
