# Cărturești SQL Database Project

A comprehensive SQL-based database management system designed to simulate the operations of a retail bookstore, inspired by the Cărturești ecosystem. This project focuses on database normalization, relational mapping, and complex querying to manage inventory, customers, and sales.

## 📌 Project Overview

This repository contains the full SQL implementation for a bookstore management system. The goal is to provide a structured backend capable of handling:
* **Inventory Management:** Tracking books, genres, authors, and publishers.
* **Customer Relations:** Managing user profiles, addresses, and loyalty data.
* **Transaction Processing:** Recording orders, payment statuses, and shipping details.
* **Business Insights:** SQL scripts for reporting on best-selling items, monthly revenue, and stock alerts.

## 🛠️ Database Schema

The database is built on a relational model (RDBMS) featuring several interconnected tables. Below are the core entities:

* **Books:** Title, ISBN, price, stock levels, and publication dates.
* **Authors/Publishers:** Biographical data and catalog linking.
* **Customers:** Contact information and purchase history.
* **Orders:** Linking customers to specific books with quantities and timestamps.
* **Categories:** Hierarchical organization of genres (Fiction, Art, Manga, etc.).

## 🚀 Getting Started

### Prerequisites
* A SQL Server environment (MySQL, PostgreSQL, or SQL Server Management Studio).
* Basic knowledge of executing `.sql` scripts.

### Installation
1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/CiprianRad/Carturesti_SQL_DB.git](https://github.com/CiprianRad/Carturesti_SQL_DB.git)
    ```
2.  **Initialize the Schema:**
    Open your SQL client and run the creation script:
    ```sql
    SOURCE schema_creation.sql;
    ```
3.  **Seed Data:**
    Populate the tables with sample bookstore data:
    ```sql
    SOURCE insert_data.sql;
    ```

## 📊 Key Queries & Features

This project includes a collection of T-SQL/MySQL scripts for common bookstore operations:

* **Stock Management:** Identify books with less than 5 units in stock.
* **Sales Analytics:** Calculate the total revenue generated in a specific month.
* **Customer Loyalty:** Find the top 10 customers based on total spend.
* **Search Optimization:** Multi-table joins to search for books by author name or genre.

## 📂 Repository Structure

* `/scripts`: Contains DDL (Data Definition Language) and DML (Data Manipulation Language) files.
* `/queries`: Stored procedures and complex views for reporting.
* `/docs`: Entity-Relationship Diagrams (ERD) and documentation.

## 🤝 Contributing

Contributions are welcome! If you'd like to improve the schema or add new reporting queries:
1. Fork the Project.
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`).
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the Branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---
**Author:** [Ciprian Rad](https://github.com/CiprianRad)
