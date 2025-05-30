<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Display Student Marks - Mark Management System</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet" />
    
    <style>
        body {
            background: #f9fafb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #2c3e50;
            padding-top: 40px;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.07);
            margin-bottom: 30px;
            background: #fff;
        }
        .card-header {
            background: #3498db;
            color: white;
            font-weight: 700;
            font-size: 1.1rem;
            border-radius: 12px 12px 0 0 !important;
            letter-spacing: 0.03em;
        }
        .badge {
            font-size: 0.85em;
            font-weight: 600;
            padding: 0.4em 0.75em;
            border-radius: 8px;
            letter-spacing: 0.02em;
        }
        .bg-success {
            background-color: #27ae60 !important;
            color: white !important;
        }
        .bg-warning {
            background-color: #f1c40f !important;
            color: #2c3e50 !important;
        }
        .bg-danger {
            background-color: #e74c3c !important;
            color: white !important;
        }
        .btn-primary {
            background-color: #2980b9;
            border-color: #2980b9;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #1c5980;
            border-color: #1c5980;
        }
        .btn-warning {
            background-color: #f39c12;
            border-color: #f39c12;
            font-weight: 600;
            color: #fff;
        }
        .btn-warning:hover {
            background-color: #c87f0a;
            border-color: #c87f0a;
            color: #fff;
        }
        .btn-danger {
            font-weight: 600;
        }
        .btn-sm {
            font-size: 0.85rem;
            padding: 0.35rem 0.65rem;
            border-radius: 10px;
        }
        form input.form-control {
            border-radius: 10px;
            border: 2px solid #a7c7e7;
            box-shadow: none;
            transition: border-color 0.3s ease;
        }
        form input.form-control:focus {
            border-color: #2980b9;
            box-shadow: 0 0 8px rgba(41,128,185,0.4);
        }
        .alert-danger {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #842029;
            border-radius: 12px;
        }
        .table {
            margin-bottom: 0;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0,0,0,0.05);
        }
        .table thead th {
            background: #3498db;
            color: white;
            border: none;
            font-weight: 700;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            font-size: 0.95rem;
        }
        .table tbody tr:hover {
            background-color: #d4e9ff;
            color: #1e3c72;
            transition: background-color 0.3s ease;
        }
        .text-center .bi-search, .text-center .bi-table {
            font-size: 50px;
            color: #9eb8c2;
            margin-bottom: 12px;
        }
        
        /* Responsive: Switch table to cards on small screens */
        @media (max-width: 767px) {
            table.table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
            tbody tr {
                display: block;
                border: 1px solid #ddd;
                border-radius: 10px;
                padding: 15px;
                margin-bottom: 15px;
                background: #fff;
                box-shadow: 0 2px 8px rgba(0,0,0,0.04);
                white-space: normal;
            }
            tbody tr td {
                display: flex;
                justify-content: space-between;
                padding: 8px 0;
                border: none;
                font-size: 0.9rem;
                border-bottom: 1px solid #eee;
            }
            tbody tr td:last-child {
                border-bottom: none;
            }
            tbody tr td::before {
                content: attr(data-label);
                font-weight: 600;
                color: #555;
                flex: 1 0 40%;
            }
            tbody tr td span.badge {
                flex: 1 0 40%;
                text-align: right;
            }
            .btn-sm {
                padding: 0.25rem 0.5rem;
                font-size: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <!-- Navigation Column -->
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-header">
                        Navigation
                    </div>
                    <div class="card-body">
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="markadd.jsp">Add Marks</a></li>
                            <li class="nav-item"><a class="nav-link" href="markupdate.jsp">Update Marks</a></li>
                            <li class="nav-item"><a class="nav-link" href="markdelete.jsp">Delete Marks</a></li>
                            <li class="nav-item"><a class="nav-link active" href="DisplayMarksServlet">Display Marks</a></li>
                            <li class="nav-item"><a class="nav-link" href="report_form.jsp">Generate Reports</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Main Content Column -->
            <div class="col-lg-9">
                <div class="card">
                    <div class="card-header">
                        Display Student Marks
                    </div>
                    <div class="card-body">
                        <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <%= request.getAttribute("errorMessage") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <% } %>

                        <!-- Search Form -->
                        <div class="card mb-3">
                            <div class="card-header bg-success text-white">
                                Search Student by ID
                            </div>
                            <div class="card-body">
                                <form action="DisplayMarksServlet" method="get" class="d-flex">
                                    <input type="number" class="form-control me-2" name="studentId" placeholder="Enter Student ID" />
                                    <button type="submit" class="btn btn-success me-2">Search</button>
                                    <a href="DisplayMarksServlet" class="btn btn-outline-secondary">Show All</a>
                                </form>
                            </div>
                        </div>

                        <%
                            StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                            List<StudentMark> marksList = (List<StudentMark>) request.getAttribute("marksList");
                            Boolean searchPerformed = (Boolean) request.getAttribute("searchPerformed");
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                            if (studentMark != null) {
                        %>
                        <!-- Single Student Result -->
                        <div class="card">
                            <div class="card-header bg-info text-white">
                                Search Result
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p><strong>Student ID:</strong> <%= studentMark.getStudentId() %></p>
                                        <p><strong>Student Name:</strong> <%= studentMark.getStudentName() %></p>
                                        <p><strong>Subject:</strong> <span class="badge bg-primary"><%= studentMark.getSubject() %></span></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>Marks:</strong> 
                                            <span class="badge <%= studentMark.getMarks() >= 80 ? "bg-success" : studentMark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
                                                <%= studentMark.getMarks() %> 
                                                <i class="bi <%= studentMark.getMarks() >= 80 ? "bi-check-circle" : studentMark.getMarks() >= 60 ? "bi-exclamation-triangle" : "bi-x-circle" %>" style="margin-left: 5px;"></i>
                                            </span>
                                        </p>
                                        <p><strong>Exam Date:</strong> <%= dateFormat.format(studentMark.getExamDate()) %></p>
                                        <p><strong>Grade:</strong> 
                                            <span class="badge <%= studentMark.getMarks() >= 80 ? "bg-success" : studentMark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
                                                <%= studentMark.getMarks() >= 80 ? "A" : studentMark.getMarks() >= 60 ? "B" : "C" %>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <a href="UpdateMarkServlet?studentId=<%= studentMark.getStudentId() %>" class="btn btn-warning btn-sm">
                                        <i class="bi bi-pencil-square"></i> Edit
                                    </a>
                                    <a href="DeleteMarkServlet?studentId=<%= studentMark.getStudentId() %>" class="btn btn-danger btn-sm">
                                        <i class="bi bi-trash"></i> Delete
                                    </a>
                                </div>
                            </div>
                        </div>

                        <% } else if (marksList != null && !marksList.isEmpty()) { %>

                        <!-- All Students Table -->
                        <div class="card">
                            <div class="card-header">
                                All Student Marks (Total: <%= marksList.size() %> records)
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Student ID</th>
                                                <th>Name</th>
                                                <th>Subject</th>
                                                <th>Marks</th>
                                                <th>Grade</th>
                                                <th>Exam Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (StudentMark mark : marksList) { %>
                                            <tr>
                                                <td data-label="Student ID"><%= mark.getStudentId() %></td>
                                                <td data-label="Name"><%= mark.getStudentName() %></td>
                                                <td data-label="Subject"><%= mark.getSubject() %></td>
                                                <td data-label="Marks">
                                                    <span class="badge <%= mark.getMarks() >= 80 ? "bg-success" : mark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
                                                        <%= mark.getMarks() %> 
                                                        <i class="bi <%= mark.getMarks() >= 80 ? "bi-check-circle" : mark.getMarks() >= 60 ? "bi-exclamation-triangle" : "bi-x-circle" %>" style="margin-left: 5px;"></i>
                                                    </span>
                                                </td>
                                                <td data-label="Grade">
                                                    <span class="badge <%= mark.getMarks() >= 80 ? "bg-success" : mark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
                                                        <%= mark.getMarks() >= 80 ? "A" : mark.getMarks() >= 60 ? "B" : "C" %>
                                                    </span>
                                                </td>
                                                <td data-label="Exam Date"><%= dateFormat.format(mark.getExamDate()) %></td>
                                                <td data-label="Actions">
                                                    <a href="UpdateMarkServlet?studentId=<%= mark.getStudentId() %>" class="btn btn-warning btn-sm" title="Edit">
                                                        <i class="bi bi-pencil-square"></i>
                                                    </a>
                                                    <a href="DeleteMarkServlet?studentId=<%= mark.getStudentId() %>" class="btn btn-danger btn-sm" title="Delete">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <% } else if (searchPerformed != null && searchPerformed) { %>
                            <div class="alert alert-danger">
                                No records found for the given Student ID.
                            </div>
                        <% } else { %>
                            <div class="text-center text-muted mt-5">
                                <i class="bi bi-table"></i>
                                <h5>No student marks to display. Use the search or add marks.</h5>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
