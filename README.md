# Digikala QA Automation Task

This project is part of a QA evaluation and includes automation and manual testing strategies for an e-commerce website inspired by Digikala.

---

## 📁 Project Structure

```
digikala_qa_task/
├── api-tests/
│ ├── product-api-test.py
│ ├── mock_response.json
│ └── .pytest_cache/
│
├── bug-reports/
│ ├── bug-report-1.md
│ └── bug-report-2.md
│
├── performance-test/
│ ├── locustfile.py
│ └── performance-test-reports/
│ └── performance-test-report.pdf
│
├── robot-tests/
│ ├── cart-tests.robot
│ └── login-tests.robot
│
├── test-cases/
│ ├── add-to-cart.feature
│ ├── checkout.feature
│ ├── invalid-login.feature
│ ├── login.feature
│ └── search-product.feature
│
├── .git/
├── .gitignore
├── cart-log.html
├── cart-output.xml
├── cart-report.html
├── digikala-manual-test-cases.pdf
├── log.html
├── login-log.html
├── login-output.xml
├── login-report.html
├── output.xml
├── performance-summary.md
├── README.md
├── report.html
├── requirements.txt
└── selenium-screenshot-1.png
```

---

## ✅ Tools Used

- Robot Framework + SeleniumLibrary
- Python (Requests library for API tests)
- Locust for load testing
- Markdown for bug reports
- PDF for manual test documentation

---

## 🚀 How to Run the Tests

## 📦 Setup & Installation

Install all dependencies using:
```bash
pip install -r requirements.txt
```
2. Run tests:
```bash
robot robot-tests/login-tests.robot
robot robot-tests/cart-tests.robot
```

---

### API Tests (Python)

Run with:

```bash
python api-tests/product-api-test.py
```

---

### Performance Test (Locust)


1. Run the test:

```bash
locust -f performance-test/locustfile.py
```

Then open `http://localhost:8089` in your browser and start the test.

---

## 🐞 Bug Reports

Bug reports are located in the `bug-reports` folder. Each includes:
- Title
- Steps to reproduce
- Expected vs actual result
- Severity

---

## 📄 Manual Test Cases

Manual test cases are documented in the file:
- `digikala-manual-test-cases.pdf`

---

## 📊 Performance Summary

See `performance-summary.md` for notes on system behavior under load.

---


