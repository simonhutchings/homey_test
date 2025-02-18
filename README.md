# README

Starting at 9:00 18th Feb 2025

* Basic setup of the project
1. As this is a company which based on the sale of homes lets set out the basic process of selling a home (the Project model)
2. We will need a User model, [:first_name, :last_name, :email, :role] (eventually with association to itself, so the buyer has a solicitor etc.)
3. Role will be a model with roles [sales_agent, buyer, seller, solicitor]
4. Project has many Users, eg. all of the roles above with their associations (Agent has a buyer and a seller, buyer has a solicitor as does the seller)
5. Comments is a model which belongs to a Project and a User. The user will be able to change the Project status
6. The Project status will run as a state machine (prob aasm gem). Statuses will be [:for_sale, :offer_made, :offer_agreed, :completed, :cancelled]. Kepp it simple for the time being
7. The Comment will represent when the state is changed. States will only be able to transition from certain other states, eg. you will not be able to transition from completed to for_sale


* Users
