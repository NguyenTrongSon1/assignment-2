<%@ page import="com.example.assignment1.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product product = (Product) request.getAttribute("product");
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


    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b>Update Product</b></h5>
    </header>
    <div class="w3-card-4">
        <div class="w3-container w3-brown">
            <h2>Add new product</h2>
        </div>
        <form class="w3-container" action="/admin/product/edit" method="post">
            <input class="w3-input w3-border w3-sand" name="id" type="hidden" value="<%=product.getId()%>">
            <p>
                <label class="w3-text-brown"><b>Name</b></label>
                <input class="w3-input w3-border w3-sand" name="name" type="text" value="<%=product.getName()%>">
            </p>
            <p>
                <label class="w3-text-brown"><b>Category</b></label>
                <input class="w3-input w3-border w3-sand" name="category" type="text" value="<%=product.getCategory()%>">
            </p>
            <p>
                <label class="w3-text-brown"><b>Description</b></label>
                <input class="w3-input w3-border w3-sand" name="description" type="text" value="<%=product.getDescription()%>">
            </p>
            <p>
                <label class="w3-text-brown"><b>Image</b></label>
                <input class="w3-input w3-border w3-sand" name="thumbnail" type="url" value="<%=product.getThumbnail()%>">
            </p>
            <p>
                <label class="w3-text-brown"><b>Price</b></label>
                <input class="w3-input w3-border w3-sand" name="price" type="text" value="<%=product.getPrice()%>">
            </p>
            <p>
                <label class="w3-text-brown"><b>Status</b></label>
                <input class="w3-input w3-border w3-sand" name="status" type="number" value="<%=product.getStatus()%>">
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
