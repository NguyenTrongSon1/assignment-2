<%@ page import="com.example.assignment1.entity.Product" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   Product product=(Product) request.getAttribute("product");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<jsp:include page="/admin/include/head.jsp">
    <jsp:param name="title" value="Detail Product"/>
</jsp:include>

<!-- Sidebar/menu -->
<jsp:include page="/admin/include/left-menu.jsp"/>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;">

    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b>Detail Product</b></h5>
    </header>
    <div class="w3-card-4">
        <form class="w3-container" >
            <p>
                <label class="w3-text-brown"><b>Id</b></label>
                <p><%=product.getId()%></p>
            </p>
            <p>
                <label class="w3-text-brown"><b>Name</b></label>
                <p><%=product.getName()%></p>
            </p>
            <p>
                <label class="w3-text-brown"><b>Category</b></label>
                <p><%=product.getCategory()%></p>
            </p>
            <p>
                <label class="w3-text-brown"><b>Description</b></label>
                <p><%=product.getDescription()%></p>
            </p>
            <p>
                <label class="w3-text-brown"><b>Image</b></label>
                <img src="<%=product.getThumbnail()%>" alt="<%=product.getName()%>" width="200px">
            </p>
            <p>
                <label class="w3-text-brown"><b>Price</b></label>
                 <p><%=product.getPrice()%></p>
            </p>
            <p>
                <label class="w3-text-brown"><b>Created_at</b></label>
                <p><%=dateFormat.format(product.getCreated_at())%></p>
            </p>
            <p>
                <label class="w3-text-brown"><b>Updated_at</b></label>
            <p><%=product.getUpdated_at()%></p>
            </p>
            <p>
                <label class="w3-text-brown"><b>Status</b></label>
                <p><%=product.getStatus()%></p>
            </p>

        </form>
    </div>

    <jsp:include page="/admin/include/footer.jsp"/>
</div>

<jsp:include page="/admin/include/script.jsp"/>
</body>
</html>
