<%@ attribute name="html" required="true" type="java.lang.String" %>
<%@ attribute name="divID" required="true" type="java.lang.String" %>
<%@ attribute name="section" required="true" type="org.ironbrain.core.Section" %>
<%@ attribute name="ticket" required="true" type="org.ironbrain.core.Ticket" %>
<%@ attribute name="editorName" required="true" type="java.lang.String" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="ib" tagdir="/WEB-INF/tags" %>
<%@ tag pageEncoding="UTF-8" %>

<button onclick="document.execCommand('bold',false,null);"><b>B</b></button>
<button onclick="document.execCommand('italic',false,null);"><i>I</i></button>
<button onclick="document.execCommand('underline',false,null);"><span style="text-decoration: underline;">U</span>
</button>

<button onclick="document.execCommand('fontName',false,'monospace');"><span style="font-family: monospace">CODE</span>
</button>

<button onclick="document.execCommand('insertImage',false,'http://upload.wikimedia.org/wikipedia/commons/8/8c/JPEG_example_JPG_RIP_025.jpg');">
    <IMG>
</button>

<button onclick="document.execCommand('removeFormat',false,null);" title="Очистить формат">X</button>
<button onclick="document.execCommand('backColor',false,'9CEBFF');"><ib:marker color="#9CEBFF"/></button>
<button onclick="document.execCommand('backColor',false,'FFFFFF');"><ib:marker color="#FFFFFF"/></button>

<button onclick="document.execCommand('strikeThrough',false,null);"><s>abc</s></button>

<button onclick="document.execCommand('createLink',false,'vk.com');">createLink</button>
<button onclick="document.execCommand('insertUnorderedList',false,null);">list</button>

<button onclick="onEditorModeChange(${editorName}Editor);">HTML</button>
<button onclick="pasteHtmlFromBuffer();">past from IDEA</button>
<button onclick="newLineDown(${editorName}Editor);">newline Down</button>
<button onclick="newLineUp(${editorName}Editor);">newline Up</button>

<div onblur="onEditorBlur(event)" onfocus="onEditorFocus(event)"
     class="richTextEditor" id="${divID}" onload="alert('ddd')"
     contenteditable="true">${html}</div>

<script>
    var ${editorName}Editor = {
        htmlMode: false,
        div: $("#${divID}")
    };
    initEditor(${editorName}Editor.div);

    function initEditor(editor) {
        console.log(editor);

        editor[0].addEventListener("paste", function (e) {
            var html = e.clipboardData.getData("text/html");

            if (!jQuery.isEmptyObject(html)) {
                e.preventDefault();

                //Small fix (Windows - copy from Intellij IDEA)
                html = html.replace("font-size:12pt", "font-size:12px") + "<br>";

                document.execCommand("insertHTML", false, html);
            }
        });
    }

    function onEditorFocus(event) {
        //activeEditor = $(event.srcElement);
    }

    function onEditorBlur(event) {
        //activeEditor = null;
    }

    function onEditorModeChange(editorObject) {
        var editorDiv = editorObject.div;
        editorObject.htmlMode = !editorObject.htmlMode;

        if (editorObject.htmlMode) {
            editorDiv.text(editorDiv.html());
            editorDiv.addClass("plainHtmlEditor");
        } else {
            editorDiv.removeClass("plainHtmlEditor");
            editorDiv.html(editorDiv.text());
        }
    }

    function newLineDown(editorObject) {
        var editorDiv = editorObject.div;
        editorDiv.append("<br>");
    }

    function newLineUp(editorObject) {
        var editorDiv = editorObject.div;
        editorDiv.prepend("<br>");
    }

    function pasteHtmlFromBuffer() {
        pasteHtmlAtCaret("<code> fd gdf gdf     fdgdfg   fdgfdgdfgfd</code>");
    }
</script>