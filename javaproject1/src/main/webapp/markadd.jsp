<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Add Student Mark - Mark Management System</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

  <style>
    body {
      background: #f5f7fa;
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
    }

    header {
      background-color: #343a40;
      color: white;
      padding: 1.25rem 2rem;
      text-align: center;
      font-weight: 600;
      font-size: 1.5rem;
      letter-spacing: 0.05em;
      box-shadow: 0 2px 5px rgb(0 0 0 / 0.1);
    }

    main.container {
      flex: 1;
      padding: 2rem 1rem;
      max-width: 900px;
      margin: 1.5rem auto 3rem;
      background: white;
      border-radius: 15px;
      box-shadow: 0 6px 20px rgb(0 0 0 / 0.1);
    }

    .nav-pills .nav-link {
      font-weight: 600;
      font-size: 0.95rem;
      border-radius: 10px;
      color: #495057;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    .nav-pills .nav-link:hover {
      background-color: #0d6efd;
      color: white;
    }
    .nav-pills .nav-link.active {
      background-color: #0d6efd;
      color: white;
      box-shadow: 0 0 8px #0d6efdaa;
    }

    .form-title {
      font-size: 1.8rem;
      font-weight: 700;
      margin-bottom: 1.75rem;
      color: #212529;
      border-bottom: 3px solid #0d6efd;
      padding-bottom: 0.25rem;
      letter-spacing: 0.05em;
    }

    label.form-label {
      font-weight: 600;
      color: #343a40;
    }

    input.form-control,
    select.form-select {
      border-radius: 8px;
      font-size: 1.1rem;
      padding: 0.5rem 0.75rem;
      border: 1.8px solid #ced4da;
      transition: border-color 0.3s ease;
    }
    input.form-control:focus,
    select.form-select:focus {
      border-color: #0d6efd;
      box-shadow: 0 0 6px #0d6efd66;
      outline: none;
    }

    .btn-primary {
      background: #0d6efd;
      border: none;
      border-radius: 50px;
      font-weight: 600;
      font-size: 1.1rem;
      padding: 0.65rem 1.8rem;
      transition: background-color 0.3s ease;
    }
    .btn-primary:hover {
      background: #0b5ed7;
    }

    .btn-secondary {
      border-radius: 50px;
      padding: 0.65rem 1.8rem;
      font-weight: 600;
      font-size: 1.1rem;
    }

    .alert {
      border-radius: 12px;
      font-weight: 600;
      font-size: 1rem;
      margin-bottom: 1.5rem;
    }

    @media (min-width: 768px) {
      main.container {
        display: grid;
        grid-template-columns: 1fr 2.3fr;
        gap: 3rem;
        align-items: start;
      }

      nav.sidebar {
        border-right: 1px solid #dee2e6;
        padding-right: 1rem;
      }
    }

  </style>
</head>
<body>

<header>
  Mark Management System - Add Student Mark
</header>

<main class="container">

  <nav class="sidebar mb-4 mb-md-0">
    <ul class="nav nav-pills flex-column">
      <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
      <li class="nav-item"><a class="nav-link active" href="markadd.jsp">Add Marks</a></li>
      <li class="nav-item"><a class="nav-link" href="markupdate.jsp">Update Marks</a></li>
      <li class="nav-item"><a class="nav-link" href="markdelete.jsp">Delete Marks</a></li>
      <li class="nav-item"><a class="nav-link" href="DisplayMarksServlet">Display Marks</a></li>
      <li class="nav-item"><a class="nav-link" href="report_form.jsp">Generate Reports</a></li>
    </ul>
  </nav>

  <section>
    <h1 class="form-title">Add New Student Mark</h1>

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

    <form action="AddMarkServlet" method="post" id="addMarkForm" class="needs-validation" novalidate>

      <div class="mb-3">
        <label for="studentId" class="form-label">Student ID</label>
        <input
          type="text"
          class="form-control"
          id="studentId"
          name="studentId"
          pattern="\d+"
          placeholder="Enter numeric Student ID"
          required
        />
        <div class="invalid-feedback">Please enter a valid numeric Student ID.</div>
      </div>

      <div class="mb-3">
        <label for="studentName" class="form-label">Student Name</label>
        <input
          type="text"
          class="form-control"
          id="studentName"
          name="studentName"
          maxlength="100"
          placeholder="Enter full student name"
          required
        />
        <div class="invalid-feedback">Please enter a Student Name (max 100 characters).</div>
      </div>

      <div class="mb-3">
        <label for="subject" class="form-label">Subject</label>
        <select class="form-select" id="subject" name="subject" required>
          <option value="" selected disabled>Select a subject</option>
          <option>Mathematics</option>
          <option>Physics</option>
          <option>Chemistry</option>
          <option>Biology</option>
          <option>Computer Science</option>
          <option>English</option>
          <option>History</option>
          <option>Geography</option>
        </select>
        <div class="invalid-feedback">Please select a Subject.</div>
      </div>

      <div class="mb-3">
        <label for="marks" class="form-label">Marks</label>
        <input
          type="number"
          class="form-control"
          id="marks"
          name="marks"
          min="0"
          max="100"
          placeholder="Enter marks between 0 and 100"
          required
        />
        <div class="invalid-feedback">Please enter Marks (0-100).</div>
      </div>

      <div class="mb-4">
        <label for="examDate" class="form-label">Exam Date</label>
        <input type="date" class="form-control" id="examDate" name="examDate" required />
        <div class="invalid-feedback">Please select a valid Exam Date.</div>
      </div>

      <div class="d-flex gap-3 flex-wrap">
        <button type="submit" class="btn btn-primary flex-grow-1">Add Student Mark</button>
        <button type="reset" class="btn btn-secondary flex-grow-1">Clear Form</button>
      </div>
    </form>
  </section>

</main>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
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

  document.getElementById('examDate').addEventListener('change', function () {
    const selectedDate = new Date(this.value);
    const today = new Date();
    today.setHours(0,0,0,0);

    if (selectedDate > today) {
      this.setCustomValidity('Exam date cannot be in the future');
    } else {
      this.setCustomValidity('');
    }
  });

  document.getElementById('studentId').addEventListener('input', function () {
    const value = this.value;
    if (/^\d*$/.test(value)) {
      this.setCustomValidity('');
    } else {
      this.setCustomValidity('Student ID must contain only numbers.');
    }
  });
</script>

</body>
</html>
