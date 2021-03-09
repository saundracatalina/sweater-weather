# Sweater Weather  

## Overview  
Sweater Weather was a 5 day project for Turing School of Software & Design's Backend Program. This is a backend application that exposes API endpoints (outlined below) for a frontend team to utilize for an application where users can plan a road trip. This application exposes endpoints to see the current weather as well as the forecasted weather at a specified destination.  

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
$ rails db:seed
```
#### Run your own development server:  
- The command below starts a local server where you can check out endpoints from this API.  
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




## API Endpoints

### Weather Endpoint Examples
#### Retrieve weather for a city
- Returns current weather, 5 days of daily weather and 8 hours of hourly weather  
```
GET http://localhost:3000/api/v1/forecast?location=denver,co
```
<img width="501" alt="Screen Shot 2021-03-08 at 9 44 30 PM" src="https://user-images.githubusercontent.com/68261312/110419921-7813b680-8057-11eb-95b1-2ccc01dcde69.png">  

```
# Retrieve background image for a city
GET http://localhost:3000/api/v1/backgrounds?location=denver,co
```
- IMAGE OF JSON RESPONSE HERE

### User Login Endpoint Examples

```
# Create a user registration
POST http://localhost:3000/api/v1/users
```
- IMAGE OF JSON RESPONSE HERE

```
# Create a session for a user
POST http://localhost:3000/api/v1/sessions
```
- IMAGE OF JSON RESPONSE HERE

### User Road Trip Endpoint Examples

```
# Create a road trip
POST http://localhost:3000/api/v1/road_trip
```
- IMAGE OF JSON RESPONSE HERE


## Author

- Saundra Catalina | [github](https://github.com/saundracatalina) | [linkedin](https://www.linkedin.com/in/saundra-catalina/)
