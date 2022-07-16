<%@ page import="lotte.com.a.poll.PollDto" %>
<%@ page import="java.util.List" %>
<%@ page import="lotte.com.a.poll.PollSubDto" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-16
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>투표 결과</title>
</head>
<body>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<%
    PollDto poll = (PollDto) request.getAttribute("poll");
    List<PollSubDto> list = (List<PollSubDto>) request.getAttribute("pollsublist");

    String json = "[";

    for(PollSubDto p : list) {
        json += "{ name:'" + p.getAnswer() + "', y:" + p.getAcount() + "}, ";
    }

    json = json.substring(0, json.lastIndexOf(","));
    json += "]";

    System.out.println(json);

    request.setAttribute("jsonData", json);

%>

<table class="list_table" style="width: 95%">
    <col width="200"><col width="500">
    <tr>
        <th>투표번호</th>
        <td style="text-align: left;">
            <input type="text" value="<%= poll.getPollid() %>" size="50" readonly="readonly">
        </td>
    </tr>

    <tr>
        <th>아이디</th>
        <td style="text-align: left;">
            <input type="text" value="<%= poll.getId() %>" size="50" readonly="readonly">
        </td>
    </tr>

    <tr>
        <th>투표기한</th>
        <td style="text-align: left;">
            <%= poll.getSdate() %> ~ <%= poll.getEdate() %>
        </td>
    </tr>

    <tr>
        <th>투표내용</th>
        <td style="text-align: left;">
            <textarea rows="5" cols="30"><%= poll.getQuestion() %></textarea>
        </td>
    </tr>

    <tr>
        <th>통계</th>
        <td>
            <div id="container"></div>
        </td>
    </tr>

</table>

<script type="text/javascript">
  Highcharts.chart('container', {
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
    },
    title: {
      text: "<%= poll.getQuestion() %>"
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
      point: {
        valueSuffix: '%'
      }
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '<b>{point.name}</b>: {point.percentage:.1f} %'
        }
      }
    },
    series: [{
      name: 'Brands',
      colorByPoint: true,
      data: <%= request.getAttribute("jsonData")%>
    }]
  });
</script>

</body>
</html>
