# Sweater Weather  

## Overview  
Sweater Weather was a 5-day project for Turing School of Software & Design's Backend Program.  This is a backend application that exposes API endpoints (outlined below) for a frontend team to utilize.  These endpoints include current weather, hourly weather, daily weather, and future weather and travel time for a road trip destination! 

## README Content
- [Learning Goals](#learning-goals)
- [Getting Started](#getting-started)
- [Testing](#testing)
- [Database Schema](#database-schema)
- [Endpoints](#endpoints)
- [Author](#author)

## Learning Goals  
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Getting Started  
```  
$ git clone git@github.com:saundracatalina/sweater-weather.git
(or fork from that repo and clone your own fork)  
$ cd sweater-weather  
```  
### Prerequisites  
![rails-badge](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat-square)    
![ruby-badge](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat-square)  

### Content being exposed through this API can be attributed to:
#### MapQuest, OpenWeather, and Unsplash
- Request your own API Keys here:  
- [MapQuest](https://developer.mapquest.com/documentation/geocoding-api/)
- [OpenWeather](https://openweathermap.org/appid#signup)  
- [Unsplash](https://unsplash.com/developers)

### Installing
#### Install gems and setup your database:
```
$ bundle install
$ rails db:create
$ rails db:migrate
```
#### Run your own development server:  
- The command below starts a local server where you can check out endpoints from this API.  
- Once your spin up that server you can use Postman to check responses. This will make it easier for the end points where params need to be passed in the body of the request.  

```
$ rails s
```

## Testing Tools Utilized
- RSpec  
- Capybara  
- Webmock  
- VCR
- SimleCov  
- To run test suite:  
```
$ bundle exec rspec  
```
- After the test suite runs you can enter this in the command line to see a test coverage report:  
```
$ open coverage/index.html
```  

## Database Schema

<img width="310" alt="Screen Shot 2021-03-10 at 12 08 39 AM" src="https://user-images.githubusercontent.com/68261312/110590243-c5b22100-8134-11eb-9a25-e2f4ae7e6622.png">


## API Endpoints

### Retrieve weather for a specified city
- Returns current weather, 5 days of daily weather and 8 hours of hourly weather  
```
GET http://localhost:3000/api/v1/forecast?location=denver,co
```
<img width="501" alt="Screen Shot 2021-03-08 at 9 44 30 PM" src="https://user-images.githubusercontent.com/68261312/110419921-7813b680-8057-11eb-95b1-2ccc01dcde69.png">  

### Retrieve background image for a city
```
GET http://localhost:3000/api/v1/backgrounds?location=denver,co
```
<img width="710" alt="Screen Shot 2021-03-09 at 11 31 43 AM" src="https://user-images.githubusercontent.com/68261312/110519844-07a67d00-80cb-11eb-8c7c-fd7fc31ae5de.png">

### User Registration
```
NOTE: User information must be sent in the body of the request NOT in query params

POST http://localhost:3000/api/v1/users
Content-Type: application/json
Accept: application/json

body:
{
  "email": "user@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
<img width="471" alt="Screen Shot 2021-03-09 at 2 27 22 PM" src="https://user-images.githubusercontent.com/68261312/110540307-91624480-80e3-11eb-96ad-0552f637f8c3.png">

### User Login
```
NOTE: User information must be sent in the body of the request NOT in query params

POST http://localhost:3000/api/v1/sessions
Content-Type: application/json
Accept: application/json

body:
{
  "email": "whatever@example.com",
  "password": "password"
}

```
<img width="476" alt="Screen Shot 2021-03-09 at 3 50 22 PM" src="https://user-images.githubusercontent.com/68261312/110549349-29b1f680-80ef-11eb-991c-0f0157f5b667.png">

### Create Road Trip by a User
```
NOTE: User information must be sent in the body of the request NOT in query params

POST http://localhost:3000/api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
<img width="360" alt="Screen Shot 2021-03-10 at 12 02 59 AM" src="https://user-images.githubusercontent.com/68261312/110589655-fb0a3f00-8133-11eb-8b44-05689d6da6c8.png">

## Author

- Saundra Catalina | [github](https://github.com/saundracatalina) | [linkedin](https://www.linkedin.com/in/saundra-catalina/)
