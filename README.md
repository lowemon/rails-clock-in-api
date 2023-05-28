This is a Rails 6.1.7.3 app.

## Documentation

This README describes the purpose of this repository and how to set up a development environment. Other sources of documentation are as follows:

- Local Server setup and how to use it via curl and Postman

## Getting started

- Clone this repository! *tada*
- (bundle install) Open your terminal and install the required dependencies
- Setup database
- Open your Postman (or terminal if you want to use curl)
- Check the available endpoints for this API
- *tada* You're good to go!

### Database
    ```
      > rails db:create
      > rails db:migrate
      > rails db:seed
    ```

# Endpoints Available:

## API

### Endpoints

#### GET /api/v1/users
##### Description
    Fetch Users
----------------------------------------------------------------------
#### GET /api/v1/users/:id/followed-users/:followed_user_id/sleep_sessions
##### Description
    View Followed User's sleep logs
##### Parameters
    - id -> User ID
    - followed_user_id -> ID of followed User that you want to view sleep logs
----------------------------------------------------------------------
#### GET /api/v1/users/:id/followed-users
##### Description
    Fetch Followed Users
##### Parameters
    - id -> User ID
----------------------------------------------------------------------
#### POST /api/v1/users/follow-user
##### Description
    Follow a User
##### Parameters
    - id -> User ID
    - followed_user_id -> ID of the User that you want to follow
----------------------------------------------------------------------

#### DELETE /api/v1/users/unfollow-user
##### Description
    Unfollow a User
##### Parameters
    - id -> User ID
    - followed_user_id -> ID of the User that you want to follow
----------------------------------------------------------------------
#### POST /api/v1/users/log-session
##### Description
    Log sleep session
##### Parameters
    - id -> User ID
----------------------------------------------------------------------

### Responses
  - 200 -> Success Request
  - 400 -> Validation Error e.g User already followed
  - 404 -> User or Followed User not found

