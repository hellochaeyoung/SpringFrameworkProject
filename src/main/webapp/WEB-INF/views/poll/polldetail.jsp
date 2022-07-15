<%@ page import="lotte.com.a.poll.PollDto" %>
<%@ page import="lotte.com.a.poll.PollSubDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-15
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String id = (String) request.getSession().getAttribute("loginId");

    PollDto poll = (PollDto) request.getAttribute("poll");
    List<PollSubDto> pollsublist = (List<PollSubDto>) request.getAttribute("pollsublist");
%>

<form action="polling" method="get">
    <table class="list_table" style="width: 95%">
        <col width="200"><col width="200">

        <tr>
            <th>투표번호</th>
            <td style="text-align: left;">
                <%= poll.getPollid()%>
                <input type="hidden" name="pollid" value="<%= poll.getPollid()%>">
            </td>
        </tr>

        <tr>
            <th>아이디</th>
            <td style="text-align: left;">
                <%= id%>
                <input type="hidden" name="id" value="<%= id%>">
            </td>
        </tr>

        <tr>
            <th>투표기한</th>
            <td style="text-align: left;">
                <%= poll.getSdate()%> ~ <%= poll.getEdate()%>
            </td>
        </tr>

        <tr>
            <th>투표내용</th>
            <td style="text-align: left;">
                <textarea rows="10" cols="50" name="question"><%= poll.getQuestion()%></textarea>
            </td>
        </tr>

        <tr>
            <th>보기수</th>
            <td style="text-align: left;">
                <%= poll.getItemcount()%>
            </td>
        </tr>

        <tr>
            <th>투표 보기들</th>
            <td style="text-align: left;">
                <%
                    for(int i=0;i< pollsublist.size();i++) {
                        PollSubDto pollsub = pollsublist.get(i);
                %>
                        <%= i + 1%>번&nbsp;
                        <input type="radio" name="pollsubid" <%= (i == 0) ? "checked='checked'" : "" %> value="<%= pollsub.getPollsubid()%>">

                        <input type="text" name="answer" size="60" value="<%= pollsub.getAnswer()%>" readonly="readonly"><br>
                <%
                    }
                %>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit" value="투표하기">
            </td>
        </tr>


    </table>

</form>

</body>
</html>
