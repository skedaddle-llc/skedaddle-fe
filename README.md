# SKEDADDLE README

### FEATURES
Users are able to log in into google OAuth and create or find a account. This application recommends parks, hiking trails, museums, restaurants! Information will help users save money and help users find many fun routes near them for a fun and adventurous weekend!

### Technical Requirements
Ruby 2.7.4

Rails 5.2.6

RSpec-Rails 4.0.1

JSON API Serializer

Factory Bot

Faker

SimpleCov

Postman

### Configuration
Clone down the repo and cd into it.
Run bundle and rails db:{create,migrate,seed}
Start a local rails server with rails s

### How to run the test suite
To run the test suite, make sure you are in the root of the project and run bundle exec rspec

### Routes


| Rails Routes  |  |  |
| ------------- | ------------- | ------------- |
| root  | welcome#index  | Index Page  |
| get  | '/auth/:provider/callback'  | 'sessions#omniauth'  |
| get  | '/dashboard'  | 'dashboard#show'  |
| delete  | '/sessions'  | 'sessions#destroy'  |
| get  | '/about'  | 'about_us_contact#about_us'  |
| get  | '/contact'  | 'about_us_contact#contact'  |
| resources  | '/itineraries'  | except: %i[edit update]  |
