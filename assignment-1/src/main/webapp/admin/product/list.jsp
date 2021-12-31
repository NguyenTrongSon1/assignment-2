<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.assignment1.entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.assignment1.repository.JpaRepository" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    ArrayList<Product> list =(ArrayList<Product>) request.getAttribute("list");
    int totalPage = (int) request.getAttribute("totalPage");
    int pageNumber  = (int) request.getAttribute("page");
    
%>
<!DOCTYPE html>
<html>
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
        <div class="w3-container w3-brown">
            <img src="/admin/assets/images/logo.png" alt="logo" width="90" height="90" style="float: right;margin: 6px">
            <h2 style="margin-top: 35px">Add New Product</h2>
        </div>
    </header>
    <div class="w3-container">
        <table class="w3-table-all">
            <tr>
                <th>Id</th>
                <th>Image</th>
                <th>Name</th>
                <th>Category</th>
                <th>Description</th>
                <th>Price</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
           <%
               for (int i = 0; i < list.size(); i++) {
           %>
            <tr>
                <th><%=list.get(i).getId()%></th>
                <th><img src="<%=list.get(i).getThumbnail()%>" style="width: 70px;height: 50px" class="w3-border w3-padding" alt="Alps"></th>
                <th><%=list.get(i).getName()%></th>
                <th><%=list.get(i).getCategory()%></th>
                <th><%=list.get(i).getDescription()%></th>
                <th><%=list.get(i).getPrice()%></th>
                <th>
                    <%
                    if (list.get(i).getStatus() == 1){
                    %>
                        Đang bán
                    <%
                    }
                     %>
                    <%
                        if (list.get(i).getStatus() == 0){
                    %>
                        Dừng bán
                    <%
                        }
                    %>
                    <%
                        if (list.get(i).getStatus() == -1){
                    %>
                        Đã xóa
                    <%
                        }
                    %>
                </th>
                <th>
                    <a href="/admin/product/detail?id=<%=list.get(i).getId()%>"><i class="fa fa-info" aria-hidden="true"></i></a>&nbsp;&nbsp;
                    <a href="/admin/product/edit?id=<%=list.get(i).getId()%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;
                    <a href="#" onclick="deleteProdouct(<%=list.get(i).getId()%>)"><i class="fa fa-trash-o" aria-hidden="true"></i></a>&nbsp;&nbsp;
                </th>
            </tr>
           <%
               }
           %>
        </table>
        <div class="ml-3 mt-3">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li><a href="">-</a></li>
                    <%
                        for (int i = 1; i <= totalPage; i++) {
                    %>
                    <li><a href="/admin/product/list?page=<%=i%>" onclick="addClass()"><%= i%></a></li>
                    <%
                        }
                    %>
                    <li><a href="">+</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <jsp:include page="/admin/include/footer.jsp"/>
</div>

<jsp:include page="/admin/include/script.jsp"/>
<script>
    function deleteProdouct(id) {
        if (confirm("Bạn có muốn xóa sản phẩm này không")){
            var xhr = new XMLHttpRequest()
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200){
                    alert("Xóa thành công!")
                    window.location.reload();
                }
            }
            xhr.open('DELETE', '/admin/product/delete?id=' + id);
            xhr.send();
        }
    }
    function addClass(){
            alert('Bạn đã click vào nút này!');
    }


</script>
</body>
</html>
