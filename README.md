# SAP-Stock-Tracker
This repository contains a modern, Fiori Elements-based SAP application that tracks (simulated) stock market data, ETFs, and analyst ratings. 

The project is being built in phases to demonstrate the evolution from basic ABAP Core Data Services (CDS) to a fully transactional ABAP RESTful Application Programming Model (RAP) application with external API integration.

> **Current Status: Version 1.0 (Read-Only CDS Model)**
> <img width="1823" height="904" alt="version1_stock-tracker" src="https://github.com/user-attachments/assets/3f595027-cb1e-4547-8729-c8e1f1e2c5e5" />

## Features (Version 1.0)
* **Smart Search:** Built-in Fiori (fuzzy) search functionality based on `Company Name` and `Ticker` using `@Search.searchable` annotations.
* **Visual Criticality:** Custom UI coloring logic implemented directly in the CDS View using `CASE` statements for daily price changes and analyst ratings (Buy = Green, Sell = Red, Hold = Grey).
* **Dynamic Data Formatting:** User-friendly percentage calculations handled at the database level without backend ABAP logic.
* **Data Generation:** Includes an ABAP OO class (`ZSTOCK_FILL`) to populate the database tables with dummy data for testing.
<img width="1834" height="356" alt="version1_fuzzysearch_stock-tracker" src="https://github.com/user-attachments/assets/d6247dfc-0273-45cb-8c32-40da0ce9ffa7" />


## Tech Stack
* **Backend:** ABAP 7.5+ / SAP S/4HANA (abap-cloud-developer-trial)
* **Data Modeling:** ABAP Core Data Services (CDS)
* **API:** OData V4
* **Frontend:** SAP Fiori Element
* **Version Control:** abapGit

* ## Project Roadmap

This project follows a phased approach to showcase different ABAP development skills.

### 🟢 v1.0: Data Modeling & UI Annotations (Current)
* Creation of base database tables.
* Development of a unified CDS View with `LEFT OUTER JOIN`.
* Implementation of UI annotations for Fiori Elements.
* Read-only OData service exposure.

### 🟡 v2.0: ABAP RAP Implementation (Planned)
* Transition to the RESTful Application Programming Model (RAP).
* Addition of a Behavior Definition (BDEF).
* Enabling Create, Update, and Delete (CRUD) operations directly from the Fiori UI.

### 🔴 v3.0: External API Integration (Planned)
* Implementation of an ABAP HTTP Client.
* Fetching real-time stock data from external sources (e.g., Yahoo Finance API).
* Updating backend tables automatically via ABAP logic.
