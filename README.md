# CS425 project

This page is for the source code of CS425 project Medi-care management system. I made it by using SQL as backend database and jsp as website.

#### Test account information:

<table class="highlight1">
      <thead>
    <tr>
        <td>id</td>
        <td>priority</td>
        <td>password</td>
        <td>Name</td>
    </tr>
    </thead>
    <tr>
        <td>1</td>
        <td>admin</td>
        <td>123456</td>
        <td></td>
    </tr>
    <tr>
        <td>28</td>
        <td>patient</td>
        <td>456789</td>
        <td>Rebecca Torres</td>
    </tr>
    <tr>
        <td>29</td>
        <td>scheduler</td>
        <td>789456</td>
        <td></td>
    </tr>
    <tr>
        <td>30</td>
        <td>medical staff</td>
        <td>123789</td>
        <td></td>
    </tr>
</table>

#### Basic functions:

##### Login 

The application must provide a login portal for user to login. The application will validate the user credentials and privileges. For this project you are only required to provide the implementation of managers. 

##### Privileges 

1- Users with admin privileges can do the following: 

    a. Schedule an appointment 

    b. Create new patient 

    c. Create a new user account 

    d. Access the business reporting

2- Users with Doctor/Staff privileges can do the following:

    a. View and update patient record

    b. Create an Order

    c. View calendar and schedule appointment with medical staff

3- Users with Patient privileges can do the following:

    a. View the orders

    b. View bills

4- Users with Scheduler privileges can do the following:

    a. View the orders

    b. View bills

    c. View calendar and schedule appointment with medical staff

##### Order transaction 

Doctors can order diagnostics for a patient, once the diagnostics are completed and results are available. The system gets updated by medical staff. 

##### Reporting and analytics 

The admin will have the capability of running business analytics reports that will help them monitor business operations. 

• Total revenue from all diagnostic

• Total revenue from each doctor visit 

• Allow patient to view their bills, appointment and medical record
