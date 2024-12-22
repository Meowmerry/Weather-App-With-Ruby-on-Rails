# Ozone

 <img width="1068" alt="Screenshot 2024-12-22 at 5 07 18 PM" src="https://github.com/user-attachments/assets/8e4e8017-3bf4-4460-9e81-91498a6eda2d" />

Ozone is a Ruby on Rails application.
## How to Create Rails 

- Create Rails project
``` 
rails new ozone
```

- Generate the controlloer or web page
``` 
rails g controller home index 
```

- Install Bootsrap
    - Go to https://rubygems.org and add to Gemfile
    - https://github.com/twbs/bootstrap-rubygem
## Requirements

- Ruby version: specified in [.ruby-version](.ruby-version)
- Rails version: specified in [Gemfile](Gemfile)

## Setup

1. Clone the repository:
    ```sh
    git clone <repository-url>
    cd ozone
    ```

2. Install dependencies:
    ```sh
    bundle install
    ```

3. Setup the database:
    ```sh
    rails db:setup
    ```

## Running the Application

To start the application, run:
```sh
rails server
