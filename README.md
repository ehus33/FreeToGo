```markdown
# Free Food Rescue Backend (Go + PostgreSQL)

This repository contains the backend service for the **Free Food Rescue** app, built in **Go** using **Gin** and **GORM** with a **PostgreSQL** database.

---

## 📋 Overview

- **Language & Frameworks:** Go 1.22, Gin (HTTP router), GORM (ORM)
- **Database:** PostgreSQL
- **Purpose:**
  - Businesses post surplus food they would otherwise discard.
  - Customers fetch available listings and claim items.

---

## 🔧 Prerequisites

1. **Go** (>=1.22) installed and in your `PATH`. Check with:
   ```bash
   go version
   ```
2. **PostgreSQL** server running (local install, Docker container, or managed service).
3. (Optional) **pgAdmin 4** for GUI database management.

---

## ⚙️ Setup & Installation

### 1. Clone the repository

```bash
```bash
git clone https://github.com/your-org/free_food_backend.git
cd free_food_backend
```
```

### 2. Install Go dependencies

```bash
go mod tidy
```

### 3. Configure Environment Variables

Before running the service, set these variables in your shell (PowerShell example):

```powershell
$env:DB_HOST     = "localhost"
$env:DB_USER     = "postgres"
$env:DB_PASSWORD = "<your_db_password>"
$env:DB_NAME     = "free_food_db"
$env:DB_PORT     = "5432"
```

> **Note:** If using Docker, match these settings to your container’s configuration.

### 4. Run the Server

```bash
go run main.go
```

- The server listens on `http://localhost:8080` by default.
- On first run, GORM will **auto-migrate** the `FoodListing` model.

---

## 🚀 API Endpoints

| Method | Endpoint               | Description                               |
|:------:|------------------------|-------------------------------------------|
| GET    | `/api/health`          | Health check (returns `{"message": "Backend is alive!"}`) |
| GET    | `/api/listings`        | Fetch all **unclaimed** food listings     |
| POST   | `/api/listings`        | Create a new listing (business use)       |
| POST   | `/api/claim`           | Claim an existing listing by `id`         |

### Example: Create a Listing

```bash
curl -X POST http://localhost:8080/api/listings \
  -H "Content-Type: application/json" \
  -d '{
        "business_name": "Joe’s Bakery",
        "item_name":     "Pastries",
        "quantity":      5,
        "pickup_time":   "21:00",
        "address":       "123 Main St"
      }'
```

---

## 🗄️ Database Setup

### Option A: Local Install
1. Download and run the PostgreSQL Windows installer (pgAdmin included).
2. Create database:
   ```sql
   CREATE DATABASE free_food_db;
   ```
3. Confirm credentials match your environment variables.

### Option B: Docker Container

```bash
docker run --name freefood-postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=yourpassword \
  -e POSTGRES_DB=free_food_db \
  -p 5432:5432 -d postgres
```

---

## 📈 Next Steps

- Integrate with the **Flutter** frontend: make HTTP calls to these endpoints.
- Add **authentication** for businesses (e.g., JWT, Firebase Auth).
- Deploy to a cloud provider (Heroku, Railway, AWS, etc.).
- Add **rate limiting**, **logging**, and **error tracking** for production.

---

*Happy coding!* 🚀
```

