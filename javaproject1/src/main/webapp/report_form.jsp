<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Generate Reports - Mark Management System</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet" />

  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: #f0f4f8;
      min-height: 100vh;
      margin: 0;
      padding: 2rem 0;
    }
    .container {
      max-width: 960px;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgb(0 0 0 / 0.1);
      padding: 2rem 3rem;
    }
    h1 {
      font-weight: 700;
      color: #2c3e50;
      margin-bottom: 1.5rem;
      text-align: center;
    }
    .report-types {
      display: flex;
      gap: 1.2rem;
      justify-content: center;
      margin-bottom: 2rem;
      flex-wrap: wrap;
    }
    .report-card {
      flex: 1 1 28%;
      background: #f9fbfd;
      border: 2px solid #d1d9e6;
      border-radius: 10px;
      padding: 1.8rem 1.4rem;
      cursor: pointer;
      text-align: center;
      user-select: none;
      transition: border-color 0.25s ease, background-color 0.25s ease, box-shadow 0.3s ease;
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 0.5rem;
      min-width: 160px;
    }
    .report-card:hover {
      border-color: #007bff;
      background-color: #e7f1ff;
      box-shadow: 0 8px 15px rgb(0 123 255 / 0.25);
    }
    .report-card.selected {
      border-color: #007bff;
      background-color: #d0e4ff;
      box-shadow: 0 10px 20px rgb(0 123 255 / 0.3);
    }
    .report-icon {
      font-size: 3rem;
      color: #007bff;
      user-select: none;
    }
    .report-title {
      font-weight: 600;
      font-size: 1.1rem;
      color: #1a2637;
    }
    .report-desc {
      font-size: 0.9rem;
      color: #5a6a81;
      line-height: 1.3;
    }
    #criteriaSection {
      background: #f7f9fc;
      border-radius: 10px;
      padding: 1.6rem 2rem;
      box-shadow: inset 0 0 8px rgb(0 0 0 / 0.03);
      margin-bottom: 2rem;
      display: none;
      max-width: 500px;
      margin-left: auto;
      margin-right: auto;
    }
    #criteriaSection.active {
      display: block;
    }
    label.form-label {
      font-weight: 600;
      margin-bottom: 0.4rem;
      color: #3a4756;
    }
    input.form-control,
    select.form-select {
      border-radius: 6px;
      border: 1.5px solid #cbd3db;
      font-size: 1rem;
      padding: 0.6rem 0.9rem;
      transition: border-color 0.3s ease;
    }
    input.form-control:focus,
    select.form-select:focus {
      border-color: #007bff;
      box-shadow: 0 0 6px rgba(0, 123, 255, 0.35);
      outline: none;
    }
    .form-text {
      color: #6c757d;
      font-size: 0.85rem;
      margin-top: 0.25rem;
    }
    button#generateBtn {
      display: block;
      margin: 0 auto;
      padding: 0.7rem 3rem;
      font-weight: 600;
      font-size: 1.05rem;
      border-radius: 8px;
      transition: background-color 0.3s ease;
      min-width: 180px;
    }
    button#generateBtn:disabled {
      background-color: #94c6ff;
      cursor: not-allowed;
    }
    .instructions {
      background: #e8f0fe;
      border-radius: 10px;
      padding: 1.5rem 2rem;
      max-width: 720px;
      margin: 0 auto;
      color: #2c3e50;
      box-shadow: 0 3px 15px rgb(0 0 0 / 0.07);
    }
    .instructions h2 {
      text-align: center;
      margin-bottom: 1rem;
      font-weight: 700;
      color: #0056b3;
    }
    .instructions ul {
      list-style: inside disc;
      line-height: 1.6;
      font-size: 1rem;
      color: #374151;
    }

    /* Accessibility: focus outline for cards */
    .report-card:focus-visible {
      outline: 3px solid #007bff;
      outline-offset: 4px;
    }
  </style>
</head>
<body>
  <div class="container" role="main" aria-labelledby="pageTitle">
    <h1 id="pageTitle">Generate Reports</h1>

    <form id="reportForm" action="ReportServlet" method="post" novalidate>
      <section aria-label="Report Types" class="report-types" role="radiogroup">
        <div tabindex="0" role="radio" aria-checked="false" class="report-card" data-value="aboveThreshold" aria-labelledby="title1 desc1">
          <div class="report-icon" aria-hidden="true">📊</div>
          <h3 id="title1" class="report-title">Students Above Threshold</h3>
          <p id="desc1" class="report-desc">Find students with marks above a specified value</p>
          <input type="radio" name="reportType" value="aboveThreshold" class="d-none" required />
        </div>

        <div tabindex="0" role="radio" aria-checked="false" class="report-card" data-value="bySubject" aria-labelledby="title2 desc2">
          <div class="report-icon" aria-hidden="true">📚</div>
          <h3 id="title2" class="report-title">Students by Subject</h3>
          <p id="desc2" class="report-desc">View all students who took a specific subject</p>
          <input type="radio" name="reportType" value="bySubject" class="d-none" required />
        </div>

        <div tabindex="0" role="radio" aria-checked="false" class="report-card" data-value="topStudents" aria-labelledby="title3 desc3">
          <div class="report-icon" aria-hidden="true">🏆</div>
          <h3 id="title3" class="report-title">Top Students</h3>
          <p id="desc3" class="report-desc">Display top N students based on their marks</p>
          <input type="radio" name="reportType" value="topStudents" class="d-none" required />
        </div>
      </section>

      <section id="criteriaSection" aria-live="polite" aria-atomic="true" aria-relevant="additions removals">
        <!-- Dynamic criteria inputs inserted here -->
      </section>

      <div class="text-center">
        <button type="submit" id="generateBtn" class="btn btn-primary" disabled>Generate Report</button>
      </div>
    </form>

    <!--  <section class="instructions mt-5" aria-label="Instructions for report generation">
      <h2>Report Types Explained</h2>
      <ul>
        <li><strong>Students certain Threshold:</strong></li>
        <li><strong>Students by specific Subject:</strong></li>
        <li><strong>Top scores:</strong></li>
      </ul>
      -->
      <p class="mt-3"><em>Select a report type above to see relevant options for generating your report.</em></p>
    </section>
  </div>

  <!-- Bootstrap Bundle JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    const cards = document.querySelectorAll('.report-card');
    const criteriaSection = document.getElementById('criteriaSection');
    const generateBtn = document.getElementById('generateBtn');
    const form = document.getElementById('reportForm');

    function resetSelection() {
      cards.forEach(c => {
        c.classList.remove('selected');
        c.setAttribute('aria-checked', 'false');
        c.querySelector('input[type=radio]').checked = false;
      });
      criteriaSection.classList.remove('active');
      criteriaSection.innerHTML = '';
      generateBtn.disabled = true;
    }

    function buildCriteria(type) {
      let html = '';
      switch(type) {
        case 'aboveThreshold':
          html = `
            <label for="threshold" class="form-label">Minimum Marks Threshold</label>
            <input type="number" id="threshold" name="threshold" class="form-control" min="0" max="100" placeholder="Enter minimum marks (0-100)" required />
            <div class="form-text">Students with marks equal to or above this value will be included.</div>
            <div class="invalid-feedback">Please enter a valid marks threshold (0-100).</div>
          `;
          break;

        case 'bySubject':
          html = `
            <label for="subject" class="form-label">Select Subject</label>
            <select id="subject" name="subject" class="form-select" required>
              <option value="" disabled selected>Select a subject</option>
              <option>Mathematics</option>
              <option>Physics</option>
              <option>Chemistry</option>
              <option>Biology</option>
              <option>Computer Science</option>
              <option>English</option>
              <option>History</option>
              <option>Geography</option>
            </select>
            <div class="invalid-feedback">Please select a subject.</div>
          `;
          break;

        case 'topStudents':
          html = `
            <label for="count" class="form-label">Number of Top Students</label>
            <input type="number" id="count" name="count" class="form-control" min="1" max="100" placeholder="Enter number of students" required />
            <div class="form-text">Top performers based on marks will be displayed in descending order.</div>
            <div class="invalid-feedback">Please enter a valid number between 1 and 100.</div>
          `;
          break;
      }
      criteriaSection.innerHTML = html;
      criteriaSection.classList.add('active');
    }

    cards.forEach(card => {
      card.addEventListener('click', () => {
        resetSelection();
        card.classList.add('selected');
        card.setAttribute('aria-checked', 'true');
        card.querySelector('input[type=radio]').checked = true;
        generateBtn.disabled = false;
        buildCriteria(card.dataset.value);
      });
      card.addEventListener('keydown', e => {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault();
          card.click();
        }
      });
    });

    // Bootstrap native validation
    form.addEventListener('submit', e => {
      if (!form.checkValidity()) {
        e.preventDefault();
        e.stopPropagation();
        form.classList.add('was-validated');
      }
    });
  </script>
</body>
</html>
