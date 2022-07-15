<%@ page import="lotte.com.a.dto.PdsDto" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-15
  Time: 오후 4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    PdsDto dto = (PdsDto) request.getAttribute("pdsdetail");
%>

<table class="list_table" width="85%">

    <tr>
        <th>아이디</th>
        <td style="text-align: left"; ">
            <%= dto.getId()%>
        </td>
    </tr>

    <tr>
        <th>제목</th>
        <td style="text-align: left";>
            <%= dto.getTitle()%>
        </td>
    </tr>

    <tr>
        <th>조회수</th>
        <td style="text-align: left";>
            <%= dto.getReadcount()%>
        </td>
    </tr>

    <tr>
        <th>다운로드수</th>
        <td style="text-align: left";>
            <%= dto.getDowncount()%>
        </td>
    </tr>

    <tr>
        <th>등록일자</th>
        <td style="text-align: left";>
            <%= dto.getRegdate()%>
        </td>
    </tr>

    <tr>
        <th>내용</th>
        <td style="text-align: left";>
            <textarea rows="10" cols="50" name="content"><%= dto.getContent()%></textarea>
        </td>
    </tr>

    <tr>
        <th>이미지</th>
        <td>

        </td>
    </tr>

    <tr>
        <td>
            <a href="redirect/pdslist.do"></a>
        </td>
    </tr>
</table>

</body>
</html>
