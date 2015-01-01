<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="ib" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
    <body>
        <head>
            <link rel="stylesheet" type="text/css" href="res/css/jquery-ui.css"/>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <script type="text/javascript" src="res/js/jquery.js"></script>
            <script type="text/javascript" src="res/js/jquery-ui.js"></script>

            <script type="text/javascript" src="res/js/exam.js"></script>
            <script type="text/javascript" src="res/js/addPage.js"></script>

            <link rel="stylesheet" type="text/css" href="res/css/common.css" media="screen"/>
            <meta name="viewport" content="width=320"/>

            <title>Результаты экзамена</title>
        </head>
        <table style="width:100%;">
            <tr>
                <ib:mainMenuBlock data="${data}"/>
            </tr>

            <tr>
                <td style="width: 200px;vertical-align: top;">
                    <div class="bg">
                        <ib:examList exams="${exams}"/>
                    </div>
                </td>
                <td valign="top">
                    <div class="bg">
                        Длительность экзамена - ${exam.durationMin} минут(ы)

                        <ib:margin/>

                        <% int i = 0; %>
                        <table class="base_table">
                            <tr class="base_tr">
                                <th class="base_th">
                                    №
                                </th>
                                <th class="base_th">
                                    Попытка
                                </th>
                                <th class="base_th">
                                    Текст
                                </th>
                                <th class="base_th">
                                    Действия
                                </th>
                            </tr>

                            <c:forEach var="tempTry" items="${tries}">
                                <tr class="base_tr"  style="background-color: ${tempTry.color}">
                                    <td class="base_td">
                                        <%= ++i %>
                                    </td>

                                    <td class="base_td">
                                            ${tempTry.attemptNum}
                                    </td>

                                    <td class="base_td">
                                            ${tempTry.shortText}
                                    </td>
                                    <td class="base_td">
                                        <button onclick="window.open('edit_ticket?id=${tempTry.ticket}')">
                                            Редактировать
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>