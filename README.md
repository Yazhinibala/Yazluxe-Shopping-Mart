# YazLuxe Shopping Mart 🛍️

A full-stack Java e-commerce web application built with:
- **Backend**: Java Servlets + JDBC
- **Frontend**: JSP, HTML, CSS, Bootstrap 5
- **Database**: MySQL
- **Server**: Embedded Apache Tomcat 10 (runs directly from VS Code)

---

## ✅ Prerequisites

Install these before running the project:

| Tool | Version | Download |
|------|---------|---------|
| Java JDK | 17+ | https://adoptium.net |
| Maven | 3.8+ | https://maven.apache.org/download.cgi |
| MySQL | 8.0+ | https://dev.mysql.com/downloads/mysql/ |
| VS Code | Latest | https://code.visualstudio.com |

### VS Code Extensions to Install
Open VS Code → Extensions (Ctrl+Shift+X) and install:
- **Extension Pack for Java** (by Microsoft)
- **Maven for Java** (by Microsoft)

---

## 🗄️ Step 1: Set Up the Database

1. Open **MySQL Workbench** (or MySQL CLI)
2. Run the file `db_setup.sql` in this project root:
   ```sql
   source /path/to/YazLuxe-Shopping-Mart/db_setup.sql
   ```
   This creates the `commerce_website` database, tables, and sample data.

---

## ⚙️ Step 2: Configure Database Password

Open this file:
```
src/main/java/commerce/jdbc_conn/dbcon.java
```

Change line 11 to your MySQL root password:
```java
private static final String DB_PASS = "your_actual_password";
```

---

## 🚀 Step 3: Run the Project in VS Code

### Option A — Using VS Code Terminal (Recommended)

1. Open the project folder in VS Code: `File → Open Folder`
2. Open Terminal: `Ctrl + ` ` (backtick)
3. Run:
   ```bash
   mvn tomcat10:run
   ```
4. Open your browser at: **http://localhost:8080**

### Option B — Using Maven Side Panel

1. Open the **Maven** panel in VS Code (left sidebar)
2. Expand `YazLuxe-Shopping-Mart` → `Plugins` → `tomcat10` → `tomcat10:run`
3. Double-click `tomcat10:run`

---

## 🌐 App Pages

| Page | URL |
|------|-----|
| Home (Products) | http://localhost:8080/ |
| Login | http://localhost:8080/login.jsp |
| Cart | http://localhost:8080/cart.jsp |
| My Orders | http://localhost:8080/orders.jsp |

**Demo login credentials** (from db_setup.sql):
- Email: `test@yazluxe.com` | Password: `test123`
- Email: `admin@yazluxe.com` | Password: `admin123`

---

## 🖼️ Product Images (Optional)

Place product image files in:
```
src/main/webapp/product-images/
```
The app shows a placeholder automatically if images are missing.

---

## 📁 Project Structure

```
YazLuxe-Shopping-Mart/
├── pom.xml                          ← Maven config + embedded Tomcat
├── db_setup.sql                     ← Run this first!
├── README.md
└── src/main/
    ├── java/commerce/
    │   ├── jdbc_conn/dbcon.java      ← DB connection (set password here)
    │   ├── model/                   ← user, product, cart, orders
    │   ├── dao/                     ← userdao, productdao, orderdao
    │   └── servlet/                 ← All servlets
    └── webapp/
        ├── index.jsp                ← Home page
        ├── login.jsp
        ├── cart.jsp
        ├── orders.jsp
        ├── product-images/          ← Put product images here
        ├── includes/
        │   ├── head.jsp
        │   ├── navbar.jsp
        │   └── footer.jsp
        └── WEB-INF/web.xml
```

---

## 🔧 Common Issues

| Problem | Fix |
|---------|-----|
| `Access denied for user 'root'` | Update password in `dbcon.java` |
| `Unknown database 'commerce_website'` | Run `db_setup.sql` in MySQL first |
| `Port 8080 already in use` | Change port in `pom.xml` → `<port>9090</port>` |
| Maven not found in terminal | Add Maven to PATH or restart VS Code after install |
| Java not found | Install JDK 17+ and set JAVA_HOME |
