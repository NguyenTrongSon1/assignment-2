<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.assignment1.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product product =(Product)  request.getAttribute("product");
    HashMap<String,String> errors =(HashMap<String,String>) request.getAttribute("errors");
    if(product == null){
        product = new Product();
    }
    if (errors == null){
        errors = new HashMap<>();
    }
%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<jsp:include page="/admin/include/head.jsp">
    <jsp:param name="title" value="Admin page"/>
</jsp:include>
<!-- Sidebar/menu -->
<jsp:include page="/admin/include/left-menu.jsp"/>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;">
    <div class="w3-card-4">
        <header class="w3-container" style="padding-top:22px">
            <div class="w3-container w3-brown">
                <img src="/admin/assets/images/logo.png" alt="logo" width="90" height="90" style="float: right;margin: 6px">
                <h2 style="margin-top: 35px">Add New Product</h2>
            </div>
        </header>
        <form class="w3-container" action="/admin/product/create" method="post">
            <p>
                <label class="w3-text-brown"><b>Name</b></label>
                <input class="w3-input w3-border w3-sand" name="name" type="text" required value="<%=product.getName()%>">
                <%
                    if (errors.containsKey("name")){
                %>
                <span class="w3-text-red w3-margin">*<%=errors.get("name")%></span>
                <%
                    }
                %>
            </p>
            <p>
                <label class="w3-text-brown"><b>Category</b></label>

                <input class="w3-input w3-border w3-sand" name="category" type="text" required value="<%=product.getCategory()%>">
                <%
                    if (errors.containsKey("category")){
                %>
                <span class="w3-text-red w3-margin">*<%=errors.get("category")%></span>
                <%
                    }
                %>
            </p>
            <p>
                <label class="w3-text-brown"><b>Description</b></label>
                <input class="w3-input w3-border w3-sand" name="description" type="text" required value="<%=product.getDescription()%>">
                <%
                    if (errors.containsKey("description")){
                %>
                <span class="w3-text-red w3-margin">*<%=errors.get("description")%></span>
                <%
                    }
                %>
            </p>
            <p>
                <label class="w3-text-brown"><b>Image</b></label>
                <input class="w3-input w3-border w3-sand" name="thumbnail" type="url" required value="<%=product.getThumbnail()%>">
                <%
                    if (errors.containsKey("thumbnail")){
                %>
                <span class="w3-text-red w3-margin">*<%=errors.get("thumbnail")%></span>
                <%
                    }
                %>
            </p>
            <p>
                <label class="w3-text-brown"><b>Price</b></label>
                <input class="w3-input w3-border w3-sand" name="price" type="text" required value="<%=product.getPrice()%>">
                <%
                    if (errors.containsKey("price")){
                %>
                <span class="w3-text-red w3-margin">*<%=errors.get("price")%></span>
                <%
                    }
                %>
            </p>
            <p>
                <label class="w3-text-brown"><b>Status</b></label>
                <input class="w3-input w3-border w3-sand" name="status" type="number" required value="<%=product.getStatus()%>">
            </p>
            <p>
                <button class="w3-btn w3-brown">Submit</button>
            </p>
        </form>
    </div>

    <jsp:include page="/admin/include/footer.jsp"/>
</div>

<jsp:include page="/admin/include/script.jsp"/>
</body>
</html>
