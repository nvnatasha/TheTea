# README

## Backend - Tea Subscription Service (Rails API)
## Overview
This backend service provides an API for managing a tea subscription system. It includes models for users, customers, subscriptions, and teas, with many-to-many relationships between customers, subscriptions, and teas.
	---
## Getting Started
Prerequisites
Ruby 3.0.0 (or the version specified in the Gemfile)
Rails 7.x
PostgreSQL (or your preferred database)

## Installation
1. Clone the Repository
   
   git clone https://github.com/yourusername/tea-subscription-backend.git
cd tea-subscription-backend

2. Install Dependencies

   bundle install

3. Setup the Database

Create and migrate the database:

bin/rails db:create
bin/rails db:migrate

4. Seed the Database (optional, if you want to add some initial data)

   bin/rails server

The API will be available at http://localhost:3000.

	


## Models and Relationships
User (Admin):

first_name, last_name, username

Users manage the admin portal.

Customer:

Can have many subscriptions and many teas through subscriptions.
Subscription:

Belongs to many customers and has many teas.
Tea:

Can belong to many subscriptions and customers.



## API Endpoints
	
### Users

GET /api/v1/users: Get all users (admins).
GET /api/v1/users/:id: Get a specific user.

	
### Customers

GET /api/v1/customers: Get all customers.
GET /api/v1/customers/:id: Get a specific customer.


### Subscriptions

GET /api/subscriptions: Get all subscriptions.
GET /api/subscriptions/:id: Get a specific subscription.
PATCH /api/v1/customers/:customer_id/subscriptions/:id: Update subscription status (in progress)


### Teas

GET /api/v1/teas: Get all teas.
GET /api/v1/teas/:id: Get a specific tea.



## Testing
Run your tests with the following command:

bundle exec rspec


