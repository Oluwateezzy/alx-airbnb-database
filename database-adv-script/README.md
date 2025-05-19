# Airbnb Database SQL Joins Practice

This repository contains SQL queries demonstrating different types of joins for an Airbnb-like database schema.

## Overview

The project focuses on mastering SQL joins by writing complex queries using:
- INNER JOIN
- LEFT JOIN
- FULL OUTER JOIN (simulated in MySQL)

## Schema Description

The database contains tables for:
- Users (guests, hosts, admins)
- Properties
- Bookings
- Payments
- Reviews
- Messages

## Queries Included

1. **INNER JOIN Query**  
   Retrieves all bookings with their respective user information.

2. **LEFT JOIN Query**  
   Retrieves all properties and their reviews, including properties with no reviews.

3. **FULL OUTER JOIN Query**  
   Retrieves all users and all bookings (simulated in MySQL since it doesn't natively support FULL OUTER JOIN).

## How to Use

1. Set up the database by running the provided schema SQL
2. Execute the join queries to see the results
3. Experiment with modifying the queries to explore different join behaviors

## Database Requirements

- MySQL (or compatible RDBMS)
- Basic understanding of relational database concepts

## Learning Objectives

By working with these queries, you'll understand:
- How different join types affect result sets
- When to use each type of join
- How to simulate FULL OUTER JOIN in MySQL
- Practical applications of joins in a real-world scenario

## Notes

- The FULL OUTER JOIN simulation uses UNION to combine results from LEFT JOINs
- Foreign key constraints ensure data integrity in the sample schema
- Indexes are properly set up for optimal join performance