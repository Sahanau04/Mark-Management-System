<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Delete Student Mark - Mark Management System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body.delete-mark-page {
            background-color: #eef2f7;
            padding-top: 40px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #343a40;
        }
        .card.delete-mark-card {
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(50,50,93,.1), 0 2px 5px rgba(0,0,0,.07);
            transition: box-shadow 0.3s ease;
        }
        .card.delete-mark-card:hover {
            box-shadow: 0 8px 30px rgba(50,50,93,.15), 0 4px 10px rgba(0,0,0,.1);
        }
        .delete-mark-card-header {
            background: linear-gradient(90deg, #4a90e2 0%, #357ABD 100%);
            color: #fff;
            font-weight: 700;
            font-size: 1.25rem;
            border-radius: 12px 12px 0 0 !important;
            letter-spacing: 0.05em;
            text-transform: uppercase;
        }
        .delete-mark-nav-pills .nav-link {
            border-radius: 0.5rem;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        .delete-mark-nav-pills .nav-link.active,
        .delete-mark-nav-pills .nav-link:hover {
            background-color: #357ABD;
            color: #fff !important;
        }
        .btn-warning {
            background-color: #f5a623;
            border-color: #f5a623;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .btn-warning:hover {
            background-color: #d48806;
            border-color: #d48806;
        }
        .btn-danger {
            background-color: #e04e39;
            border-color: #e04e39;
            font-weight: 700;
            box-shadow: 0 4px 15px rgba(224, 78, 57, 0.4);
            transition: background-color 0.3s ease;
        }
        .btn-danger:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            box-shadow: none;
        }
        .btn-danger:hover:not(:disabled) {
            background-color: #b63020;
            border-color: #b63020;
        }
        .delete-mark-confirm-label {
            color: #e04e39;
            font-weight: 700;
            user-select: none;
        }
        .delete-mark-student-info {
            background-color: #fff;
            border: 1px solid #ced4da;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1.8rem;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }
        .delete-mark-student-info h5 {
            margin-bottom: 1rem;
            color: #e04e39;
            font-weight: 700;
        }
        .delete-mark-alert {
            border-radius: 8px;
            font-size: 0.95rem;
        }
        .delete-mark-search-icon {
            font-size: 60px;
            color: #adb5bd;
            user-select: none;
        }
        .form-control:focus {
            border-color: #357ABD;
            box-shadow: 0 0 0 0.25rem rgba(53, 122, 189, 0.25);
        }
        .form-check-input:checked {
            background-color: #e04e39;
            border-color: #e04e39;
        }
        /* Smooth alert fade */
        .alert {
            animation: fadeIn 0.6s ease forwards;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-10px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body class="delete-mark-page">
<div class="container">
    <div class="row">
        <!-- Sidebar navigation -->
        <div class="col-lg-3 mb-4">
            <div class="card delete-mark-card shadow-sm">
                <div class="card-header delete-mark-card-header">
                    Navigation
                </div>
                <div class="card-body p-3">
                    <ul class="nav nav-pills flex-column delete-mark-nav-pills gap-2">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="markadd.jsp">Add Marks</a></li>
                        <li class="nav-item"><a class="nav-link" href="markupdate.jsp">Update Marks</a></li>
                        <li class="nav-item"><a class="nav-link active" href="markdelete.jsp">Delete Marks</a></li>
                        <li class="nav-item"><a class="nav-link" href="DisplayMarksServlet">Display Marks</a></li>
                        <li class="nav-item"><a class="nav-link" href="report_form.jsp">Generate Reports</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <div class="col-lg-9">
            <div class="card delete-mark-card shadow-sm">
                <div class="card-header delete-mark-card-header">
                    Delete Student Mark
                </div>
                <div class="card-body p-4">
                    <!-- Alerts -->
                    <% if (request.getAttribute("successMessage") != null) { %>
                        <div class="alert alert-success alert-dismissible fade show delete-mark-alert" role="alert">
                            <%= request.getAttribute("successMessage") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show delete-mark-alert" role="alert">
                            <%= request.getAttribute("errorMessage") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <!-- Search form -->
                    <div class="mb-4">
                        <form action="DeleteMarkServlet" method="get" class="d-flex gap-2">
                            <input
                                type="number"
                                name="studentId"
                                class="form-control"
                                placeholder="Enter Student ID"
                                required
                                min="1"
                                aria-label="Search Student ID"
                            />
                            <button type="submit" class="btn btn-warning fw-semibold px-4">
                                Search
                            </button>
                        </form>
                    </div>

                    <%
                        StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                        if (studentMark != null) {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    %>
                    <!-- Student Info -->
                    <div class="delete-mark-student-info">
                        <h5>⚠️ Student Record Found</h5>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Student ID:</strong> <%= studentMark.getStudentId() %></p>
                                <p><strong>Student Name:</strong> <%= studentMark.getStudentName() %></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Subject:</strong> <%= studentMark.getSubject() %></p>
                                <p><strong>Marks:</strong> <%= studentMark.getMarks() %></p>
                                <p><strong>Exam Date:</strong> <%= dateFormat.format(studentMark.getExamDate()) %></p>
                            </div>
                        </div>
                    </div>

                    <div class="alert alert-warning delete-mark-alert" role="alert">
                        <h6 class="alert-heading mb-2">⚠️ Warning!</h6>
                        This action will permanently delete the student record and cannot be undone.
                    </div>

                    <!-- Delete confirmation form -->
                    <form action="DeleteMarkServlet" method="post" id="deleteForm" class="needs-validation" novalidate>
                        <input type="hidden" name="studentId" value="<%= studentMark.getStudentId() %>" />

                        <div class="mb-3 form-check">
                            <input
                                type="checkbox"
                                class="form-check-input"
                                id="confirmDelete"
                                name="confirmation"
                                value="yes"
                                required
                            />
                            <label class="form-check-label delete-mark-confirm-label" for="confirmDelete">
                                I confirm that I want to permanently delete this student record
                            </label>
                            <div class="invalid-feedback">
                                You must confirm the deletion before proceeding.
                            </div>
                        </div>

                        <div class="d-flex gap-3">
                            <button type="submit" class="btn btn-danger flex-grow-1" id="deleteBtn" disabled>
                                Delete Student Record
                            </button>
                            <a href="markdelete.jsp" class="btn btn-outline-secondary flex-grow-1">Cancel</a>
                        </div>
                    </form>
                    <% } else { %>

                    <!-- No record found / initial state -->
                    <div class="text-center text-secondary mt-5 pt-4">
                        <div class="mb-3" style="font-size: 64px; user-select:none;">🔍</div>
                        <h5>Search for a student record to delete</h5>
                        <p class="mb-0">Enter a Student ID in the search box above to find the record you want to delete.</p>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Enable delete button only if checkbox checked
    const confirmCheckbox = document.getElementById('confirmDelete');
    const deleteButton = document.getElementById('deleteBtn');

    if (confirmCheckbox) {
        confirmCheckbox.addEventListener('change', () => {
            deleteButton.disabled = !confirmCheckbox.checked;
        });
    }

    // Bootstrap form validation for confirmation checkbox
    (() => {
        'use strict';
        const form = document.getElementById('deleteForm');
        if (form) {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                } else {
                    // Confirm dialog
                    if (!confirm('Are you absolutely sure you want to delete this student record? This action cannot be undone.')) {
                        event.preventDefault();
                    }
                }
                form.classList.add('was-validated');
            });
        }
    })();
</script>
</body>
</html>
