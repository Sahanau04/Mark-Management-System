<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Update Student Mark - Mark Management System</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f5f7fa;
            min-height: 100vh;
            margin: 0;
            padding: 40px 0;
        }
        .container {
            max-width: 1100px;
        }
        .sidebar {
            background: #2c3e50;
            border-radius: 12px;
            padding: 25px 20px;
            height: 100%;
            color: #ecf0f1;
            box-shadow: 0 8px 25px rgba(44, 62, 80, 0.2);
        }
        .sidebar h3 {
            font-weight: 700;
            margin-bottom: 30px;
            letter-spacing: 1px;
            text-align: center;
            border-bottom: 2px solid #3498db;
            padding-bottom: 12px;
        }
        .sidebar nav a {
            display: block;
            color: #bdc3c7;
            padding: 12px 15px;
            margin-bottom: 10px;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            font-size: 1.05rem;
        }
        .sidebar nav a.active,
        .sidebar nav a:hover {
            background-color: #3498db;
            color: white;
            box-shadow: 0 0 10px #3498db;
        }
        main {
            background: white;
            border-radius: 15px;
            padding: 30px 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            min-height: 600px;
        }
        main h1 {
            font-weight: 700;
            color: #34495e;
            margin-bottom: 25px;
            letter-spacing: 0.02em;
        }
        .alert {
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.95rem;
        }
        .form-label {
            font-weight: 600;
            color: #34495e;
        }
        input.form-control, select.form-select {
            border-radius: 12px;
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.12);
            font-size: 1.05rem;
            transition: border-color 0.3s ease;
        }
        input.form-control:focus, select.form-select:focus {
            border-color: #3498db;
            box-shadow: 0 0 6px #3498db;
            outline: none;
        }
        .btn-primary {
            background: linear-gradient(135deg, #2980b9, #3498db);
            border: none;
            font-weight: 700;
            font-size: 1.1rem;
            padding: 12px 0;
            border-radius: 50px;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #1c5980, #2176ba);
        }
        .btn-secondary {
            border-radius: 50px;
            font-weight: 600;
            padding: 12px 0;
            font-size: 1.05rem;
        }
        .search-card {
            background: #e9f1f7;
            border-radius: 12px;
            padding: 20px 25px;
            margin-bottom: 35px;
            box-shadow: 0 4px 20px rgba(52, 152, 219, 0.15);
        }
        .search-card h5 {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 15px;
        }
        .search-input {
            border-radius: 50px;
            padding: 12px 20px;
            font-size: 1rem;
            border: 1.8px solid #3498db;
            transition: border-color 0.3s ease;
        }
        .search-input:focus {
            border-color: #1c5980;
            outline: none;
            box-shadow: 0 0 8px #3498db;
        }
        .search-btn {
            border-radius: 50px;
            font-weight: 600;
            padding: 12px 25px;
            font-size: 1rem;
            background: #3498db;
            border: none;
            color: white;
            transition: background 0.3s ease;
        }
        .search-btn:hover {
            background: #2176ba;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row g-4">

        <!-- Sidebar -->
        <aside class="col-lg-3">
            <div class="sidebar">
                <h3>Menu</h3>
                <nav>
                    <a href="index.jsp">Home</a>
                    <a href="markadd.jsp">Add Marks</a>
                    <a href="markupdate.jsp" class="active">Update Marks</a>
                    <a href="markdelete.jsp">Delete Marks</a>
                    <a href="DisplayMarksServlet">Display Marks</a>
                    <a href="report_form.jsp">Generate Reports</a>
                </nav>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="col-lg-9">

            <h1>Update Student Mark</h1>

            <%-- Success and error messages --%>
            <% if (request.getAttribute("successMessage") != null) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <%= request.getAttribute("successMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <%= request.getAttribute("errorMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <%-- Search Student by ID --%>
            <section class="search-card">
                <h5>Search Student by ID</h5>
                <form action="UpdateMarkServlet" method="get" class="d-flex gap-3">
                    <input type="number" name="studentId" placeholder="Enter Student ID" class="form-control search-input" required />
                    <button type="submit" class="btn search-btn">Search</button>
                </form>
            </section>

            <% 
                StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            %>

            <%-- Update Form --%>
            <form action="UpdateMarkServlet" method="post" id="updateMarkForm" class="needs-validation" novalidate>

                <div class="mb-4">
                    <label for="studentId" class="form-label">Student ID</label>
                    <input 
                        type="number" 
                        id="studentId" 
                        name="studentId" 
                        class="form-control" 
                        value="<%= studentMark != null ? studentMark.getStudentId() : "" %>" 
                        <%= studentMark != null ? "readonly" : "" %>
                        required
                        />
                    <div class="invalid-feedback">Please enter a valid Student ID.</div>
                </div>

                <div class="mb-4">
                    <label for="studentName" class="form-label">Student Name</label>
                    <input 
                        type="text" 
                        id="studentName" 
                        name="studentName" 
                        class="form-control" 
                        maxlength="100" 
                        value="<%= studentMark != null ? studentMark.getStudentName() : "" %>" 
                        required 
                    />
                    <div class="invalid-feedback">Please enter a Student Name (max 100 characters).</div>
                </div>

                <div class="mb-4">
                    <label for="subject" class="form-label">Subject</label>
                    <select id="subject" name="subject" class="form-select" required>
                        <option value="" disabled <%= studentMark == null ? "selected" : "" %>>Select a subject</option>
                        <option value="Mathematics" <%= studentMark != null && "Mathematics".equals(studentMark.getSubject()) ? "selected" : "" %>>Mathematics</option>
                        <option value="Physics" <%= studentMark != null && "Physics".equals(studentMark.getSubject()) ? "selected" : "" %>>Physics</option>
                        <option value="Chemistry" <%= studentMark != null && "Chemistry".equals(studentMark.getSubject()) ? "selected" : "" %>>Chemistry</option>
                        <option value="Biology" <%= studentMark != null && "Biology".equals(studentMark.getSubject()) ? "selected" : "" %>>Biology</option>
                        <option value="Computer Science" <%= studentMark != null && "Computer Science".equals(studentMark.getSubject()) ? "selected" : "" %>>Computer Science</option>
                        <option value="English" <%= studentMark != null && "English".equals(studentMark.getSubject()) ? "selected" : "" %>>English</option>
                        <option value="History" <%= studentMark != null && "History".equals(studentMark.getSubject()) ? "selected" : "" %>>History</option>
                        <option value="Geography" <%= studentMark != null && "Geography".equals(studentMark.getSubject()) ? "selected" : "" %>>Geography</option>
                    </select>
                    <div class="invalid-feedback">Please select a subject.</div>
                </div>

                <div class="mb-4">
                    <label for="marks" class="form-label">Marks</label>
                    <input 
                        type="number" 
                        id="marks" 
                        name="marks" 
                        class="form-control" 
                        min="0" max="100" 
                        value="<%= studentMark != null ? studentMark.getMarks() : "" %>" 
                        required
                    />
                    <div class="invalid-feedback">Please enter marks between 0 and 100.</div>
                </div>

                <div class="mb-4">
                    <label for="examDate" class="form-label">Exam Date</label>
                    <input 
                        type="date" 
                        id="examDate" 
                        name="examDate" 
                        class="form-control" 
                        value="<%= studentMark != null ? sdf.format(studentMark.getExamDate()) : "" %>" 
                        required
                    />
                    <div class="invalid-feedback">Please select the exam date.</div>
                </div>

                <button type="submit" class="btn btn-primary w-100">Update Mark</button>
            </form>
        </main>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Bootstrap form validation
    (() => {
      'use strict';
      const forms = document.querySelectorAll('.needs-validation');
      Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
          if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    })();
</script>

</body>
</html>
