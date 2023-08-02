<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>mycart- Home</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
            body{
                background: linear-gradient(-225deg, #231557 0%, #44107A 29%, #FF1361 67%, #FFF800 100%);
                height:100vh;
            }
            .card {
                height: 400px;
                width: 300px;
            }

            .card-img-top {
                height: 150px;
                width: 100%;
                object-fit: cover; /* This ensures that the image fills the entire image container without distorting its aspect ratio */
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">
                <%String cat = request.getParameter("category");

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null) {
                        list = dao.getAllProducts();
                    } else if (cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>
                <!--show categories-->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All products
                        </a>


                        <%
                            for (Category c : clist) {
                        %>
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <!--show products-->



                <div class="col-md-10">
                    <div class="row mt-4">
                        <div clas="col-md-12">
                            <div class="card-columns">
                                <!--traversing products-->
                                <%
                                    for (Product p : list) {
                                %>
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img class="card-img-top m-2" style="max-height: 200px;max-width: 100%;width:auto;" src="img/products/<%= p.getpPhoto()%>" alt="...">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text">
                                            <%=Helper.get10Words(p.getpDesc())%>
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getPriceAfterApplyDiscount()%>)">Add to cart</button>
                                        <button class="btn btn-outline-success">&#8377;<%= p.getPriceAfterApplyDiscount()%>/-<span class="text-secondary discount-label"> &#8377; <%= p.getpPrice()%>  <%=p.getpDiscount()%>% off</span></button>
                                    </div>
                                </div>


                                <%
                                    }
                                    if (list.size() == 0) {
                                        out.println("<h3>No Items in these category</h3>");
                                    }
                                %>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%@include file="components/common_modal.jsp"%>


    </body>
</html>
