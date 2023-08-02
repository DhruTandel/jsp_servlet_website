

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
    </head>
    <body>
        <form action="CheckoutServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name"><br>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address"><br>

            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone"><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email"><br>

            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber"><br>

            <label for="expirationDate">Expiration Date:</label>
            <input type="text" id="expirationDate" name="expirationDate"><br>

            <button type="submit">Submit</button>
        </form>
    </body>
</html>
