# Ozone

Ozone is a Ruby on Rails application.

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