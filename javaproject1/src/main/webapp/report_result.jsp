<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Report Results - Mark Management System</title>
    
    <!-- Google Fonts: Montserrat & Open Sans -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Open+Sans&display=swap" rel="stylesheet" />
    
    <!-- Bootstrap grid only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    
    <style>
        /* General Reset */
        * {
            box-sizing: border-box;
        }
        
        body {
            margin: 0;
            background: #f3f6f8;
            font-family: 'Open Sans', sans-serif;
            color: #2c3e50;
            line-height: 1.6;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        
        header {
            background: linear-gradient(135deg, #305f72, #ea5c5a);
            color: #fff;
            padding: 2rem 1rem;
            text-align: center;
            font-family: 'Montserrat', sans-serif;
            letter-spacing: 1.1px;
            box-shadow: 0 4px 8px rgba(234, 92, 90, 0.3);
        }
        header h1 {
            margin: 0;
            font-size: 2.5rem;
            user-select: none;
        }
        
        main {
            max-width: 1100px;
            margin: 2rem auto 4rem;
            padding: 0 1rem;
        }
        
        .stats {
            display: flex;
            gap: 2rem;
            justify-content: space-between;
            margin-bottom: 3rem;
            flex-wrap: wrap;
        }
        .stat-card {
            flex: 1 1 200px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(48, 95, 114, 0.1);
            padding: 1.8rem 1.5rem;
            text-align: center;
            transition: transform 0.3s ease;
            cursor: default;
            user-select: none;
        }
        .stat-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 24px rgba(234, 92, 90, 0.2);
        }
        .stat-number {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 2.8rem;
            color: #ea5c5a;
            margin-bottom: 0.3rem;
        }
        .stat-label {
            font-size: 1rem;
            color: #7a8a99;
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }
        
        .table-wrapper {
            overflow-x: auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(48, 95, 114, 0.12);
            padding: 1rem;
        }
        
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
            font-size: 0.95rem;
            color: #34495e;
        }
        
        thead tr th {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 1rem;
            color: #ea5c5a;
            padding-bottom: 0.8rem;
            text-align: left;
            border-bottom: 3px solid #ea5c5a;
            user-select: none;
        }
        
        tbody tr {
            background: #fefefe;
            box-shadow: 0 2px 5px rgba(48, 95, 114, 0.05);
            border-radius: 8px;
            transition: background 0.3s ease;
        }
        
        tbody tr:hover {
            background: #ea5c5a22;
        }
        
        tbody tr td {
            padding: 0.9rem 1rem;
            vertical-align: middle;
        }
        
        .badge {
            display: inline-block;
            padding: 0.25em 0.7em;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.85rem;
            color: white;
            user-select: none;
            white-space: nowrap;
        }
        
        .badge-subject {
            background-color: #305f72;
        }
        
        .badge-grade-A {
            background-color: #2ecc71;
        }
        .badge-grade-B {
            background-color: #f39c12;
        }
        .badge-grade-C {
            background-color: #e74c3c;
        }
        
        .rank-badge {
            font-weight: 700;
            font-size: 1.1rem;
            color: #ea5c5a;
            user-select: none;
            white-space: nowrap;
        }
        
        .rank-badge.top-3 {
            color: #f39c12;
        }
        
        .no-results {
            background: #fff;
            padding: 3rem;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(48, 95, 114, 0.1);
            text-align: center;
            color: #7a8a99;
            font-size: 1.3rem;
            font-style: italic;
            margin-top: 3rem;
            user-select: none;
        }
        
        footer {
            text-align: center;
            padding: 1rem 0;
            color: #7a8a99;
            font-size: 0.85rem;
            border-top: 1px solid #ddd;
            margin-top: 4rem;
            user-select: none;
        }
        
        /* Buttons */
        .btn {
            display: inline-block;
            font-weight: 600;
            color: #fff;
            background-color: #ea5c5a;
            padding: 0.6rem 1.5rem;
            border-radius: 40px;
            border: none;
            cursor: pointer;
            transition: background-color 0.25s ease;
            text-decoration: none;
            font-size: 1rem;
            user-select: none;
            margin-right: 10px;
            margin-top: 1rem;
            white-space: nowrap;
            box-shadow: 0 4px 8px rgba(234, 92, 90, 0.2);
        }
        
        .btn:hover,
        .btn:focus {
            background-color: #d24f4b;
            outline: none;
            box-shadow: 0 6px 12px rgba(210, 79, 75, 0.5);
        }
        
        .btn-secondary {
            background-color: #305f72;
        }
        
        .btn-secondary:hover,
        .btn-secondary:focus {
            background-color: #274a57;
            outline: none;
            box-shadow: 0 6px 12px rgba(39, 74, 87, 0.5);
        }
        
        @media (max-width: 768px) {
            .stats {
                flex-direction: column;
                gap: 1.5rem;
            }
            .stat-card {
                flex: 1 1 auto;
            }
            .btn {
                width: 100%;
                text-align: center;
                margin-right: 0;
            }
        }
        
        /* Utility class for screen readers */
        .visually-hidden {
            position: absolute !important;
            width: 1px !important;
            height: 1px !important;
            padding: 0 !important;
            margin: -1px !important;
            overflow: hidden !important;
            clip: rect(0,0,0,0) !important;
            border: 0 !important;
        }
    </style>
</head>
<body>

<header role="banner">
    <h1>Mark Management System - Report Results</h1>
</header>

<main role="main" aria-labelledby="pageTitle">
    <%
        String reportTitle = (String) request.getAttribute("reportTitle");
        List<StudentMark> reportResults = (List<StudentMark>) request.getAttribute("reportResults");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        if (reportResults != null && !reportResults.isEmpty()) {
            double totalMarks = 0;
            int maxMarks = Integer.MIN_VALUE;
            int minMarks = Integer.MAX_VALUE;
            for (StudentMark mark : reportResults) {
                totalMarks += mark.getMarks();
                maxMarks = Math.max(maxMarks, mark.getMarks());
                minMarks = Math.min(minMarks, mark.getMarks());
            }
            double averageMarks = totalMarks / reportResults.size();
    %>

    <section class="stats" aria-label="Summary statistics">
        <article class="stat-card" role="region" aria-labelledby="totalStudentsLabel">
            <div class="stat-number" id="totalStudentsCount"><%= reportResults.size() %></div>
            <div class="stat-label" id="totalStudentsLabel">Total Students</div>
        </article>
        <article class="stat-card" role="region" aria-labelledby="averageMarksLabel">
            <div class="stat-number" id="averageMarksCount"><%= String.format("%.1f", averageMarks) %></div>
            <div class="stat-label" id="averageMarksLabel">Average Marks</div>
        </article>
        <article class="stat-card" role="region" aria-labelledby="highestMarksLabel">
            <div class="stat-number" id="highestMarksCount"><%= maxMarks %></div>
            <div class="stat-label" id="highestMarksLabel">Highest Marks</div>
        </article>
        <article class="stat-card" role="region" aria-labelledby="lowestMarksLabel">
            <div class="stat-number" id="lowestMarksCount"><%= minMarks %></div>
            <div class="stat-label" id="lowestMarksLabel">Lowest Marks</div>
        </article>
    </section>

    <section class="table-wrapper" role="region" aria-labelledby="detailedResultsHeading">
        <h2 id="detailedResultsHeading" style="margin-bottom: 1rem; color:#ea5c5a; font-family: 'Montserrat', sans-serif;">
            <%= reportTitle != null ? reportTitle : "Detailed Report Results" %>
        </h2>
        <table role="table" aria-describedby="tableSummary">
            <caption id="tableSummary" class="visually-hidden">
                Student marks sorted by rank
            </caption>
            <thead>
                <tr>
                    <th scope="col">Rank</th>
                    <th scope="col">Student ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Subject</th>
                    <th scope="col">Marks</th>
                    <th scope="col">Grade</th>
                    <th scope="col">Exam Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int rank = 1;
                    for (StudentMark mark : reportResults) {
                        String gradeClass;
                        String gradeText;
                        if (mark.getMarks() >= 80) {
                            gradeClass = "badge-grade-A";
                            gradeText = "A";
                        } else if (mark.getMarks() >= 60) {
                            gradeClass = "badge-grade-B";
                            gradeText = "B";
                        } else {
                            gradeClass = "badge-grade-C";
                            gradeText = "C";
                        }
                %>
                <tr>
                    <td>
                        <% if (rank <= 3) { %>
                            <span class="rank-badge top-3" title="Top <%= rank %>">🏆 <%= rank %></span>
                        <% } else { %>
                            <span class="rank-badge"><%= rank %></span>
                        <% } %>
                    </td>
                    <td><%= mark.getStudentId() %></td>
                    <td><%= mark.getStudentName() %></td>
                    <td><span class="badge badge-subject"><%= mark.getSubject() %></span></td>
                    <td><%= mark.getMarks() %></td>
                    <td><span class="badge <%= gradeClass %>"><%= gradeText %></span></td>
                    <td><%= dateFormat.format(mark.getExamDate()) %></td>
                </tr>
                <%
                        rank++;
                    }
                %>
            </tbody>
        </table>
    </section>

    <div style="margin-top: 2rem;">
        <button onclick="window.print()" class="btn" aria-label="Print report results">Print Report 🖨️</button>
        <a href="report_form.jsp" class="btn btn-secondary" role="button">Generate New Report ↩️</a>
    </div>

    <% } else if (reportResults != null) { %>

    <div class="no-results" role="alert" aria-live="polite">
        <p>No results found for the specified criteria.</p>
        <a href="report_form.jsp" class="btn btn-secondary" role="button" style="margin-top: 1rem;">Try Another Report</a>
    </div>

    <% } else { %>

    <div class="no-results" role="alert" aria-live="polite">
        <p>No report generated yet. Please generate a report to view results.</p>
        <a href="report_form.jsp" class="btn btn-secondary" role="button" style="margin-top: 1rem;">Generate Report</a>
    </div>

    <% } %>

</main>

<footer role="contentinfo">
    &copy; 2025 Mark Management System &bull; Designed by You
</footer>

</body>
</html>
