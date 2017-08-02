# TINKR

This project is a proof of concept app build with Edmunds API. It is still in the early stages of development. This app currently includes the following features:

* Login with Facebook through omniauth
* Vehicle look up by VIN
* User can add car's to their "garage"
* Builds unique and dynamic maintenance schedules for a user's car

Features to be implemented next:
* Give user ability to set reminders for vehicle maintence
* Find vehicles by make/model/year
* Ability to store maintenance records
* Recall notifications

### Project Set Up:

This project require that you have Firefox v46 installed on your machine in order to run the testing suite using Selenium Webdriver.

Clone this repo

 `git clone git@github.com:NicholasJacques/tinkr.git`

 And then in the project's directory:

 `bundle install`

 Create and migrate the database:

 `rake db:create && rake db:migrate`

 Run the test suite:

 `rspec`

### Version Info

This project uses Ruby v2.3.1 and Rails v5.1.2

### Author
Nicholas Jacques