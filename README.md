# Recycle Right

A web-based waste management and segregation guidance system that helps users identify the appropriate category, recyclability and disposal methods for different waste items

## Features
- Search for Waste Items
- View waste category and subcategory
- View disposal instructions and recycling information
- Registered users can suggest missing waste items, while admin can review, approve or reject suggestions.
- Approved suggestions are added to waste-item database.
- View disposal points

## Tech Stack
- **Frontend:** HTML, CSS, JavaScript, JSP
- **Backend:** Java, Java Servlets, JDBC
- **Database:** PostgreSQL
- **Server:** Apache Tomcat

## Working
- User searches for a waste item
- The request is handled by Java Servlet
- JDBC communicates with PostgreSQL
- Matching records are mapped to Java model objects.
- The results are passed to JSP for display.

## Setup

### Prerequisites
- Java
- Apache Tomcat
- PostgreSQL
- Eclipse IDE (or any other Java IDE)

### Database Setup
Recycle Right uses PostgreSQL with following tables:
- `users` : Stores registered users, login information and roles
- `waste_items`: Stores verified waste_item information
- `suggestions`: Stores waste items submitted by users for admin review
- `disposal_centers`: Stores disposal center information and location details

The database schema is inside `database/init.sql`

#### Steps:
1. Clone the repository
2. Create PostgreSQL database named `recycleright`
3. Run the database initialization script: 
```
psql -U postgres -d recycleright -f database/init.sql
```
4. Configure the database connection with your own PostgreSQL credentials
```
Host: localhost
Port: 5432
Database: recycleright
Username: your_psql_username
Password: your_psql_password
```
5. Import project into Eclipse
6. Configure Apache Tomcat
7. Deploy the project to Tomcat
8. Start the server
9. Open the application in your browser
Example:
`http://localhost:8080/RecycleRight/home.jsp`


