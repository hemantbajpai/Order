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
            <th class="col-sm-1 col-xs-2">Name</th>
            <th class="col-sm-1 col-xs-2">Quantiy</th>
            <th class="col-sm-1 col-xs-2">Size</th>
            <th class="col-sm-1 col-xs-2">Price</th>
            <th class="col-sm-1 col-xs-2">Delete Item</th>
        </tr>
        </thead>
        <tbody>
        <g:each var="item" in="${myOrder.items}">
            <g:render template="itemRow" model="[bean:item]" />
        </g:each>
        </tbody>
    </table>

    <h2><b>Total Price:</b> $ ${myOrder.getTotal()} </h2>
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
    </body>
</html>
