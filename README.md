# spring-boot-keycloak-react-frontend
Tutorial/Example for integration between keycloak and spring boot and integrating with client app.

If you follow the installation guide, you will have Java Spring Boot backend, React Frontend and
Keycloak running on your local machine integrated to each other

* Frontend (React) will allow you to login with user through Keycloak and obtain JWT token
* Java Spring Boot Backend will connect to Keycloak, validate JWT token sent from Frontend and return Keycloak userId
* Keycloak provides the Authentication (this example provides Docker commands and Terraform scripts to setup Keycloak automatically)

This example is based on two projects. The changes are minimal, most credits go to Nishada and Baeldung.

### Baeldung - A Quick Guide to Using Keycloak With Spring Boot
https://github.com/eugenp/tutorials/tree/d4136a922d78411557ec6a30bfea17a37fb5b3b8/spring-boot-modules/spring-boot-keycloak

https://www.baeldung.com/spring-boot-keycloak

### Nishada Liyanage - Securing a React App using Keycloak
https://medium.hexadefence.com/securing-a-react-app-using-keycloak-ac0ee5dd4bfc

https://github.com/tnishada/keycloak-react-js-example

## Installation
The project was tested with these technologies installed:

* npm 10.2.3
* node 20.10.0
* terraform 1.6.6
* java 17.0.9
* docker 24.0.6

These ports must be available

* 8080 (java spring backend)
* 8081 (keycloak)
* 3000 (react frontend)

### Step-by-step:
Note that it was tested on Windows - although nothing windows-native was used, 
some commands/behaviour may slightly differ

#### Keycloak
1) Install keycloak and expose on 8081 port:
```
docker run -p 8081:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:23.0.4 start-dev
```
Then you can go to http://localhost:8081 to Admin Console of Keycloak and login with `admin/admin` if you want 
(but it is not necessary to run the project, terraform will set up everything automatically)

2) Go to /terraform folder
3) run `terraform init`
4) run `terraform apply` (and confirm "yes" when asked if execute the plan)

Now you should have keycloak running and configured realm for login from React 

#### Java Spring
1) Go to `/java-spring-boot` folder
2) Run `./gradlew clean build` (the keycloak must be running in order to successfully built)
3) Run `./gradlew bootRun`

Or open project in Intellij Idea (tested with 2023.3.2) and click default "run"

#### React frontend
1) Go to `/react-frontend` folder
2) Run `npm install`
3) Run `npm start`
4) http://localhost:3000 should open with React app
5) Click on "Login" button - you should be redirected to Keycloak
6) Login with `springreact/springreact` username/password you will be redirected back to React Frontend
7) Click on "Request Java Spring ..." button - you should see User ID
