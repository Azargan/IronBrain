<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="ib" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <ib:headBlock title="-Билеты-"/>
    </head>
    <body>
        <script>
            updateTime = ${pageGenerateDate};
        </script>

        <table width="100%">
            <tr>
                <ib:mainMenuBlock data="${data}"/>
            </tr>

            <tr>
                <td colspan="2">
                    <div class="bg path">
                        <ib:path list="${path}"/>
                    </div>
                </td>
            </tr>

            <tr>
                <c:if test="${ticket == null}">
                    <td valign="top">
                        <c:if test="${data.user != null}">
                            <div class="bg" style="width: 300px">
                                <c:if test="${section.parent != null}">
                                    <a href="add?sec=${section.parent}">← Назад</a>
                                    <br>
                                </c:if>

                                <ib:sections list="${sections}"/>

                                <ib:gap px="5"/>
                                <input placeholder="Имя раздела" style="width:100%;" type="text" size="20"
                                       id="newSectionName">
                                <ib:gap px="5"/>
                                <button id="addSectionButton" onClick="onAddSection(${section.id});">Добавить раздел
                                </button>
                                <ib:gap px="5"/>
                                <button id="addTicketButton" onClick="onAddNewTicket(${section.id});">Добавить билет
                                </button>
                            </div>
                        </c:if>
                    </td>
                </c:if>

                <c:if test="${ticket == null}">
                    <td valign="top" style="width: 100%">
                        <div class="bg">
                            <ib:fieldEditor target="section" fieldMappers="${secToFlds}" targetId="${section.id}"
                                            unusedFields="${unusedFields}"/>
                        </div>
                    </td>
                </c:if>

                <c:if test="${ticket != null}">
                    <td style="width: 200px;vertical-align: top;">
                        <div class="bg">
                            Менюшка
                        </div>
                    </td>

                    <td valign="top">
                        <div class="bg">
                            <script>
                                setSaveOnBlur(${ticket.id}, ${ticketSection.id});
                                setSaveOnUnload(${ticket.id}, ${ticketSection.id});
                                setRegularSave(${ticket.id}, ${ticketSection.id});
                            </script>
                            <ib:ticketEditor ticket="${ticket}" section="${ticketSection}"
                                             secToFields="${secToFlds}" unusedFields="${unusedFields}"/>
                        </div>
                    </td>
                </c:if>
            </tr>
        </table>
    </body>
</html>