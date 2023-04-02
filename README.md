This is a Rails 6.1.7.3 app.

## Documentation

This README describes the purpose of this repository and how to set up a development environment. Other sources of documentation are as follows:

- Local Server setup and how to use it via curl and Postman

## Getting started

- Clone this repository! *tada*
- (bundle install) Open your terminal and install the required dependencies
- Open your Postman (or terminal if you want to use curl)
- Check the available endpoints for this API
- *tada* You're good to go!


# Endpoints Available:

## Users
- GET all users: GET http://localhost:3000/users

## Clock-in/out
- GET all clock ins for user: GET http://localhost:3000/users/:user_id/clock_ins

- POST clock in for user: POST http://localhost:3000/users/clock_ins/clock_in

- POST clock out for a specific clock in: POST http://localhost:3000/users/:user_id/clock_ins/:clock_in_id/clock_out


## Followed/Followers

- GET all followed records for user: GET http://localhost:3000/users/:user_id/follows/followed_records

- POST follow a user: POST http://localhost:3000/users/:user_id/follows/:followed_id/follow_user

- POST unfollow a user: POST http://localhost:3000/users/:user_id/follows/:following_id/unfollow_user

# NOTE: you'll need to replace :user_id and :id with the actual IDs for the respective resources.

