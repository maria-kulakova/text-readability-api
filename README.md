
* Ruby version: 2.6.5

* Configuration
  - bundle install
  - rake db:reset - to create db, run migration and run seeds
  - rails s

  For authorization run example command:
  $ curl -H "Content-Type: application/json" -X POST -d '{"email":"test@test.com" , "password":"12345678"}' http://localhost:3000/authenticate

  Use auth-token example:

  $ curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzU1ODI0ODh9.o3nwiwlVhUrIE21Lv-QJGkZUwbZkerQGC1Lu57Oydx4" -X GET "http://localhost:3000/admin/users/1"
