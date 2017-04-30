<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'myOrder.label', default: 'MyOrder')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

    <g:hasErrors bean="${user}">
        <ul>
            <g:eachError var="err" bean="${user}">
                <p style="color: red">${err.getField()} is not correct</p>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form controller="MyOrder">
        <h2>Your Information</h2> <br>
        <table>
            <tr>
                <td>
                    <label>Username</label>
                </td>
                <td>
                    <div class='value ${hasErrors(bean:user,field:'username','errors')}'>
                        <g:textField name="username"  value="${fieldValue(bean:user,field:'username')}"/>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Password</label>
                </td>
                <td>
                        <g:field type="password" name="password" value="${fieldValue(bean:user,field:'password')}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>First Name</label>
                </td>
                <td>
                        <g:textField name="firstName"  value="${fieldValue(bean:user,field:'firstName')}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Last Name</label>
                </td>
                <td>
                        <g:textField name="lastName"  value="${fieldValue(bean:user,field:'lastName')}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Address line 1</label>
                </td>
                <td>
                        <g:textField name="addressLine1" value="${fieldValue(bean:user,field:'addressLine1')}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Address line 2</label>
                </td>
                <td>
                        <g:textField name="addressLine2"   value="${fieldValue(bean:user,field:'addressLine2')}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>City</label>
                </td>
                <td>
                        <g:textField name="city"  value="${fieldValue(bean:user,field:'city')}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>State</label>
                </td>
                <td>
                        <g:textField name="state"  value="${fieldValue(bean:user,field:'state')}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Zipcode</label>
                </td>
                <td>
                        <g:textField name="zipcode"   value="${fieldValue(bean:user,field:'zipcode')}"/>
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
                        <g:textField name="creditCard"    value="${fieldValue(bean:user,field:'creditCard')}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Expiry Date</label>
                </td>
                <td>
                        <g:field type="date" name="expiryDate"  value="${fieldValue(bean:user,field:'expiryDate')}"/>
                </td>
            </tr>
        </table>

        <g:actionSubmit style="float: right" value="Create Account" action="createAccount"/>
    </g:form>
    <br>
    </body>
</html>
