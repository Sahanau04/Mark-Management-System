<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Student Mark Management System</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Poppins:wght@600&display=swap" rel="stylesheet" />

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

<!-- FontAwesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

<style>
  /* Reset and base */
  body {
    margin: 0;
    font-family: 'Inter', sans-serif;
    background: #f9fafb;
    color: #2c3e50;
    min-height: 100vh;
  }

  header {
    padding: 3rem 1rem 2rem;
    text-align: center;
    background: #2a9df4;
    color: white;
    box-shadow: 0 4px 10px rgb(42 157 244 / 0.4);
  }
  header h1 {
    font-family: 'Poppins', sans-serif;
    font-weight: 600;
    font-size: 2.8rem;
    margin-bottom: 0.2rem;
  }
  header p {
    font-weight: 500;
    font-size: 1.15rem;
    opacity: 0.85;
  }

  main.main-container {
    max-width: 1200px;
    margin: 2rem auto 4rem;
    padding: 0 1rem;
    display: flex;
    gap: 2rem;
    flex-wrap: wrap;
  }

  nav.sidebar {
    flex: 0 0 240px;
    background: white;
    border-radius: 12px;
    padding: 1.5rem 1rem;
    box-shadow: 0 6px 18px rgb(0 0 0 / 0.07);
    height: fit-content;
  }
  nav.sidebar ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  nav.sidebar ul li {
    margin-bottom: 1rem;
  }
  nav.sidebar ul li a {
    display: block;
    padding: 0.65rem 1rem;
    font-weight: 600;
    font-size: 1rem;
    border-radius: 8px;
    color: #2a9df4;
    text-decoration: none;
    transition: background-color 0.25s ease, color 0.25s ease;
    border: 2px solid transparent;
  }
  nav.sidebar ul li a:hover,
  nav.sidebar ul li a.active {
    background-color: #2a9df4;
    color: white;
    border-color: #1e81d3;
    box-shadow: 0 4px 12px rgb(42 157 244 / 0.4);
  }

  section.features {
    flex: 1 1 0;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 1.8rem;
  }

  /* For tablets */
  @media (max-width: 992px) {
    section.features {
      grid-template-columns: repeat(2, 1fr);
    }
  }
  /* For phones */
  @media (max-width: 576px) {
    main.main-container {
      flex-direction: column;
    }
    nav.sidebar {
      width: 100%;
      margin-bottom: 1.5rem;
    }
    section.features {
      grid-template-columns: 1fr;
    }
  }

  article.feature-item {
    background: white;
    border-radius: 14px;
    padding: 2rem 1.5rem;
    box-shadow: 0 6px 20px rgb(0 0 0 / 0.06);
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    transition: transform 0.25s ease, box-shadow 0.25s ease;
    cursor: default;
  }
  article.feature-item:hover {
    transform: translateY(-6px);
    box-shadow: 0 14px 30px rgb(42 157 244 / 0.3);
  }

  .feature-icon {
    font-size: 3.5rem;
    color: #2a9df4;
    margin-bottom: 1rem;
  }

  article.feature-item h5 {
    font-family: 'Poppins', sans-serif;
    font-weight: 600;
    font-size: 1.25rem;
    margin-bottom: 0.75rem;
    color: #0c3e7d;
  }
  article.feature-item p {
    font-weight: 400;
    font-size: 0.95rem;
    margin-bottom: 1.2rem;
    color: #566573;
    line-height: 1.3;
  }

  .feature-item .btn {
    background: #2a9df4;
    color: white;
    border: none;
    font-weight: 600;
    padding: 0.6rem 1.6rem;
    border-radius: 12px;
    box-shadow: 0 5px 12px rgb(42 157 244 / 0.45);
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
  }
  .feature-item .btn:hover {
    background: #1e81d3;
    box-shadow: 0 8px 22px rgb(30 129 211 / 0.7);
  }

  /* Footer */
  footer {
    background: #2a9df4;
    color: white;
    padding: 2.8rem 1rem 3rem;
    text-align: center;
    position: relative;
    font-weight: 500;
  }

  footer .footer-wave {
    position: absolute;
    top: -70px;
    left: 0;
    width: 100%;
    overflow: hidden;
    line-height: 0;
  }
  footer .footer-wave svg {
    position: relative;
    display: block;
    width: 100%;
    height: 70px;
  }
</style>
</head>
<body>

<header>
  <h1>Student Mark Management System</h1>
  <p>A comprehensive system to manage student examination marks</p>
</header>

<main class="main-container">
  <nav class="sidebar" aria-label="Primary Navigation">
    <ul>
      <li><a href="index.jsp" class="active">Home</a></li>
      <li><a href="markadd.jsp">Add Marks</a></li>
      <li><a href="markupdate.jsp">Update Marks</a></li>
      <li><a href="markdelete.jsp">Delete Marks</a></li>
      <li><a href="DisplayMarksServlet">Display Marks</a></li>
      <li><a href="report_form.jsp">Generate Reports</a></li>
    </ul>
  </nav>

  <section class="features" aria-label="Features">
    <article class="feature-item" tabindex="0">
      <div class="feature-icon"><i class="fas fa-plus-circle"></i></div>
      <h5>Add Student Marks</h5>
      <p>Add marks.</p>
      <a href="markadd.jsp" class="btn" role="button">Add Marks</a>
    </article>

    <article class="feature-item" tabindex="0">
      <div class="feature-icon"><i class="fas fa-edit"></i></div>
      <h5>Update Marks</h5>
      <p>Modify.</p>
      <a href="markupdate.jsp" class="btn" role="button">Update Marks</a>
    </article>

    <article class="feature-item" tabindex="0">
      <div class="feature-icon"><i class="fas fa-trash-alt"></i></div>
      <h5>Delete Marks</h5>
      <p>Delete Record</p>
      <a href="markdelete.jsp" class="btn" role="button">Delete Marks</a>
    </article>

    <article class="feature-item" tabindex="0">
      <div class="feature-icon"><i class="fas fa-table"></i></div>
      <h5>Display Marks</h5>
      <p>view the marks.</p>
      <a href="DisplayMarksServlet" class="btn" role="button">Display Marks</a>
    </article>

    <article class="feature-item" tabindex="0">
      <div class="feature-icon"><i class="fas fa-chart-bar"></i></div>
      <h5>Generate Reports</h5>
      <p>Create reports</p>
      <a href="report_form.jsp" class="btn" role="button">Generate Reports</a>
    </article>

   <!--<article class="feature-item" tabindex="0">
      <div class="feature-icon"><i class="fas fa-info-circle"></i></div>
      <h5>About</h5>
      <p>Learn more about the Student Mark Management System.</p>
      <button class="btn" data-bs-toggle="modal" data-bs-target="#aboutModal" type="button">About System</button>
    </article>
    -->
  </section>
</main>

<footer>
  <div class="footer-wave">
    <svg viewBox="0 0 1200 70" preserveAspectRatio="none"><path d="M0,40 C300,90 900,0 1200,40 L1200,0 L0,0 Z" fill="#fff" opacity="0.15"></path></svg>
  </div>
  <p>&copy; 2025 Student Mark Management System. All rights reserved.</p>
</footer>

<!-- About Modal -->
<div class="modal fade" id="aboutModal" tabindex="-1" aria-labelledby="aboutModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header border-0">
        <h5 class="modal-title" id="aboutModalLabel" style="color:#2a9df4; font-weight:600;">About Student Mark Management System</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color:#34495e; font-size: 1rem;">
        <p>This system was developed to manage student examination marks efficiently. It follows the MVC architecture pattern and utilizes JSP, Servlets, and JDBC for database operations.</p>
        <p>Key features include:</p>
        <ul>
          <li>Adding new student marks</li>
          <li>Updating existing records</li>
          <li>Deleting records</li>
          <li>Displaying all records or searching by student ID</li>
          <li>Generating various reports like top performers, subject-wise performance, etc.</li>
        </ul>
      </div>
      <div class="modal-footer border-0">
        <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
