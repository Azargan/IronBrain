<%@ attribute name="reminds" required="true" type="java.util.List<org.ironbrain.core.Remind>" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="ib" tagdir="/WEB-INF/tags" %>
<%@ tag pageEncoding="UTF-8" %>

<% int i = 1; %>
<table class="base_table" width="100%">
    <tr class="base_tr">
        <th class="base_th">
            Номер
        </th>
        <th class="base_th">
            Вспомнить
        </th>
        <th class="base_th">
            Путь
        </th>
        <th class="base_th">
            Название
        </th>
        <th class="base_th">
            Действия
        </th>
    </tr>
    <c:forEach var="remind" items="${reminds}">
        <tr class="base_tr">
            <td class="base_td">
                <%= i++ %>
            </td>
            <td class="base_td">
                <input id="stateRemind${remind.id}" type="checkbox"
                       checked="true" onchange="changeRemindState(${remind.id})"/>
            </td>
            <td class="base_td">
                    ${remind.path}
            </td>
            <td class="base_td">
                    ${remind.label}
            </td>
            <td class="base_td">
                <button onclick="deleteRemind(${remind.id});">
                    Удалить
                </button>
            </td>

            <!--Remind:
            ID = ${remind.id}
            TicketID = ${remind.ticket}
            User = ${remind.user}
            -->
        </tr>
    </c:forEach>

    <script>
        reminds = [
            <c:forEach var="remind" items="${reminds}">
            {id: ${remind.id}, on: true},
            </c:forEach>
        ];
    </script>
</table>
<ib:margin/>
<button onclick="exam.remind()">Вспомнить</button>