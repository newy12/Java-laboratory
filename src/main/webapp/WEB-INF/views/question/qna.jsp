<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <style>
        .qna-section {
            margin: 0 auto;
            width: 1200px;
        }

        .qna-container {
            margin: 0 auto;
            width: 90%;
        }

        .qna-top {
            margin: 50px auto;
            width: 90%;
            height: 300px;
            padding: 1px;
            background-color: rgb(224, 224, 224, 0.5);
        }

        .qna-top>.title {
            width: 100%;
            margin-top: 60px;
            margin-left: 50px;

        }

        .qna-top>.title>.title-main {
            font-size: 30px;
        }

        .qna-center {
            margin: 0 auto;
            width: fit-content;
        }

        .qna-center table {
            border-top: 2px solid gray;
            border-bottom: 2px solid gray;
        }

        .qna-center table td {
            text-align: center;
        }

        .qna-center table tr {
            border-top: 1px solid lightgray;
        }

        .qna-center table>thead {
            background-color: rgb(235, 235, 235);
            font-size: medium;
            color: #282828;
        }

        .qna-center table>thead th {
            padding: 4px 0;
            color: #282828;
            text-align: center;
        }

        .qna-center table>thead th:nth-child(1) {
            width: 100px;
        }

        .qna-center table>thead th:nth-child(2) {
            width: 520px;
        }

        .qna-center table>thead th:nth-child(3) {
            width: 200px;
        }

        .qna-center table>thead th:nth-child(4) {
            width: 150px;
        }

        .qna-center table>tbody tr td {
            padding: 5px 0;
            font-size: medium;
        }

        .qna-bottom {
            margin: 0 auto;
            width: 90%;
            text-align: center;
        }

        .qna-bottom>.paging {
            display: inline-block;
        }

        .btn-write {
            display: inline-block;
            float: right;
        }

        .btn-answer {
            width: 50px;
            height: 20px;
            line-height: 20px;
            margin-left: 5px;
            outline: none;
            background-color: white;
            color: #314C83;
            border-radius: 5px;
            border: 2px solid #314C83;
            display: inline-block;
            text-decoration: none;
            font-size: small;
        }
        .btn-answer:hover{
            text-decoration: none;
            color: #314C83;
        }
        .btn-update{
            width: 50px;
            height: 20px;
            line-height: 20px;
            margin-left: 5px;
            outline: none;
            background-color: #314C83;
            color: white;
            border-radius: 5px;
            border: 2px solid #314C83;
            display: inline-block;
            text-decoration: none;
            font-size: small;
        }
        .btn-update:hover{            
            color: white;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section class="qna-section">
        <div class="qna-container">
            <div class="qna-top">
                <div class="title">
                    <div class="title-main">
                        문의사항
                    </div>
                    <div class="title-sub">
                        일구시에게 궁금한 점들을 물어보세요!
                    </div>
                </div>
            </div>
            <div class="qna-center">
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="qList" items="${questionList}">
                            <tr>
                                <td>${qList.QNo}</td>
                                <td>
                                    <a href="/questionView.do?qNo=${qList.QNo}">${qList.QTitle}</a>
                                    <c:if test="${qList.secretStatus == 1}">
                                        <span>&#128274;</span>
                                    </c:if>
                                    <c:if test="${qList.answerStatus == 0}">
                                        <a href="questionFrm.do?answerNo=${qList.QNo}" class="btn-answer">답변</a>
                                    </c:if>
                                </td>
                                <td>${qList.MId}</td>
                                <td>${qList.writeDate}</td>
                            </tr>
                            <c:if test="${qList.answerStatus == 1}">
                                <tr style="border-top: none;">
                                    <td></td>
                                    <td>
                                        <a href="/questionView.do?qNo=${qList.QNo}&answer=true">&#10551; 답변입니다.</a>
                                        <a href="questionFrm.do?answerNo=${qList.QNo}" class="btn-update">수정</a>
                                    </td>
                                    <td>
                                        관리자
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                    <tfoot>

                    </tfoot>
                </table>
            </div>
            <div class="qna-bottom">
                <div class="paging">
                    <c:forEach var="i" begin="${not empty param.page ?  begin : 1}" end="${end}" step="1">
                        <a
                            href="?page=${i}${not empty param.qna_type ? '&qna_type='+=param.qna_type : ''}${not empty param.qna_keyword ? '&qna_keyword='+=param.qna_keyword : ''}">${i}</a>
                    </c:forEach>
                </div>
                <div class="btn-write">
                    <a href="/questionFrm.do">글쓰기</a>
                </div>
                <div class="qna-search">
                    <form action="" method="get">
                        <select name="qna_type">
                            <option value="1">제목</option>
                            <option value="2">작성자</option>
                        </select>
                        <input type="text" name="qna_keyword">
                        <input type="submit" value="검색">
                    </form>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>