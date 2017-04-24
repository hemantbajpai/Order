<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'myOrder.label', default: 'MyOrder')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

    <g:form controller="MyOrder">
        <h2>Your Information</h2> <br>
        <table>
            <tr>
                <td>
                    <label>Username</label>
                </td>
                <td>
                    <g:textField name="username"  />
                </td>
            </tr>
            <tr>
                <td>
                    <label>Password</label>
                </td>
                <td>
                    <g:field type="password" name="password"  />
                </td>
            </tr>
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
                    <g:textField name="state" />
                </td>
            </tr>
            <tr>
                <td>
                    <label>Zipcode</label>
                </td>
                <td>
                    <g:textField name="zipcode" />
                </td>
            </tr>
        </table>
        <hr>
        <h2>Payment Information</h2> <br>
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
                    <g:field type="date" name="expiryDate" /> <br>
                </td>
            </tr>
        </table>

        <g:actionSubmit style="float: right" value="Create Account" action="createAccount"/>
    </g:form>
    <br>
    </body>
</html>
