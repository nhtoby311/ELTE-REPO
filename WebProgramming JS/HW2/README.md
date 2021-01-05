The National Health Centre organizes vaccinations at various times in its central building. Your task is to create a web application using PHP where people can schedule an appointment for a coronavirus vaccination.

Tasks
List page
On the list page (a.k.a. the main page) a static title and a short introduction should be visible.
Users who are not logged in are free to browse the available times and availability data (see below).
The booking contains a few pieces of data: on what day, at what time, how many people can come for a vaccine.
The available dates in the given month should be listed on the list page in the format of "day, date, free slots / total slots" (eg 2021.01.22 15:00 3/5 free slots).
Free appointments should be green (with text, background, frame or other style markings), already filled dates should be red.
There should be two links below the table: one to list the previous month and the other to list the next month.
There should be a "Book this date" link at each time.
If you are not logged in, clicking on "Book this date" will take you to the login page.
Authentication pages
It should be possible to access the login and registration page from the main page.

During registration an user must enter their full name, SSN number (social security number), address, email address and their password twice.

Full name: required
SSN number: required, 9 characters long, consists of numbers only, e.g. 123456789
address: required
e-mail: required, unique for each user, email format
Password: required
Password confirmation: required, must match the password
In case of an error, display appropriate error messages! The form must be persistent, so after an error, previously filled data should remain in the form. After a successful registration, go to the login page!

On the login page users can identify themselves with their e-mail address and password:

e-mail: required, unique, email format
Password: required
If there was an error logging in, display a message about it above the login form! After successful login, redirect the user to the list page!

Details of booking a date
After logging in, clicking on the "Book this date" button will take the user to the page detailing the given time. Here the site must display the date, time, and the logged in user's data (name, address and SSN number), and a checkbox to accept terms and conditions (eg that it is mandatory to show up on the appointment after booking it, or that there may be side effects of vaccination).
Then, by clicking on the "Confirm" button, the system will record the user's name for that time. If the checkbox is not checked, display an error message on the page! After a successful booking, the user will be taken to a separate page where the system informs them that the booking was successful.
If the user already has an appointment, ...
... the list page's top should show the details of the booked date. Design this part to be extra noticeable!
... under the booked date, a button should show up, pressing which cancels the appointment and resets the list page.
... the "Book this date" link does not show up for dates in the list.
Admin functions
Have a special user, admin (email: admin@nemkovid.hu, password: admin), who can do two things:
At the bottom of the date details page (where a user could apply), the admin sees a list of users who applied for that date. (Show name, SSN, and email address!)

The list page contains a new "Post a new date" link. By clicking on it, the admin can add a new available date (on a separate page, only accessible by the admin user) with the following input data:

Date: required, valid date
Date: required, valid date
Total slots: required, number (How many people can apply for this date)
Display all errors on the page! The form must be persistent, so if an error occurs, the form should keep the input values. After the new date was added, redirect the browser to the list page..

Extra features
On the list page, display the dates of the given month in calendar format. Weeks as rows, days (Monday to Sunday) as columns, and times listed inside each day. If using this format, the "Book this date" link can be the time itself inside a table cell.
If an user clicks the "Book this date" while not logged in, remember it, and after logging in, redirect to the correct date details page instead of the list page. Technical help: This information is usually preserved inside the URL on login pages, but you can use the session as well.
Solve the changing of the displayed month with AJAX, without reloading all of the index page!
On the registration and admin/new date pages: instead of above/near the forms, display error messages next to the relevant input fields!
Additional expectations and help
Design is important. Your submission doesn't have to be really pretty and filled with frills, but it should look nice on a screen of at least 1024×768 pixels. You can use minimalist design, custom CSS with extra graphical elements or a CSS framework.

Add the novalidate attribute to the attributes of the <form> elements of the forms to disable browser validation!

<form action = "" novalidate>
</form>
There are two types of data in the assignment: times and users. These two types of data refer to each other, since at a time it is necessary to store who has already applied for it, and for a user (optionally, because it can be solved in another way) it is necessary to store which time you have chosen. When two types of data refer to each other, this information must be stored in your data structure. For example, for the dates, the registered users can be in an array, where we could store the username, email address, etc. Or, you could store ids from the data structure where you stored your users, as that id is unique to the user.

$users = [
  'userid1' => [
    'id' => 'userid1',
    'username' => 'user1',
    'email' => 'email1',
  ],
  'userid2' => [
    'id' => 'userid2',
    'username' => 'user2',
    'email' => 'email2',
  ],
];

$appointments = [
  'appid1' => [
    'id' => 'appid1',
    'time' => '2021-01-04 15:00',
    'users' => [
      'userid2',
    ],
  ]
];
Breaking down development into steps
We also want to help those who have a harder time seeing and planning a bigger task. You can plan the whole task in advance and improve it later, but the following steps can also be used to solve smaller subtasks: We would like to help out those who have a harder time planning for a complex task. You can lay out the whole task in advance and improve it late, but the following steps can also be used to solve shorter subtasks:

First, create a static HTML prototype for your application! This means that as a first step, you should design the list page, the date details page, the succesful application page, the new date page and so on. Some pages contain conditional information, eg. the date an user booked on the list page, or on the date details page, the data of a user. Design these as well, even use placeholder data in the HTML before getting PHP to generate similar output. You can try out CSS statically as well, simply decide some placeholder data will be red or green and test with that.
Think about what data you will need. What kind of data structure can store it, with what fields?
Where do you store users?
Where do you store the possible dates?
How do you store which users are booked for which date?
Think about how you will extract the right data format from the data structures in the previous stage! You can create functions, or even better, Storage class methods to implement transformations like there.
How do you retrieve the dates? (date, time)
How do you know if an user has already booked a date?
How do you know if a given date has booked users or not?
For forms, you need to think about two things:
what happens on a success
how do you detect errors, how the form becomes persistent
Grading
By solving the assignment, 20 points can be obtained. There are minimum requirements without which the submission will not be acceptable. An additional 5 points can be earned for extra tasks. That is, if someone does everything they can get to 25 points.

Minimum requirements (5 points)
List page: gets displayed (0 points)
List page: static text and information (0 points)
List page: list all dates (1 point)
Admin: add a new time, error handling (without login and admin functions) (2 points)
Admin: add a new time, save successfully (without login and admin functions) (2 points)
Basic tasks (15 points)
List page: Lists dates in a given month (0.5 points)
List page: Lists previous and next month (1 points)
List page: Free dates are green, full dates are red (0.5 points)
List page: "Book this date" button appears next to the dates for an user before logging in (0.5 points)
List page: "Book this date" button appears next to the dates for an user who has logged in, but has no appointment (0.5 points)
List page: "Book this date" button does not appear next to the dates, if the user already has a reservation (0.5 points)
List page: "Book this date" button URL points to the details page of the corresponding date (0.5 points)
List page: if the user already has an appointment and is logged in, the appointment details are displayed (1 point)
List page: if the user already has an appointment and is logged in, the appointment can be cancelled (0.5 points)
List page: logged in users can only cancel their own reservation (eligibility check) (0.5 points)
Registration form: contains appropriate elements (0.5 points)
Registration form: handling of errors, error messages, persistence (1.5 points)
Registration form: successful registration (0.5 points)
Login: handling errors (1 point)
Login: successful login (0.5 points)
Date details: date and user details are displayed correctly (0.5 points)
Date details: correct handling of the checkbox (0.5 points)
Date details: successful application (1 point)
Admin: admin can log in with the credentials of an admin user (0.5 points)
Admin: the details of the registered users are displayed on the date details page (0.5 points)
Admin: announcing a new date is only available with admin user (0.5 points)
No major errors, no strange phenomena (0.5 points)
Nice, well-designed interface (1 point)
1 week delay (-3 points)
2 weeks delay (-6 points)
Delay of more than 2 weeks (not accepted, no ticket)
Extra tasks (plus 5 points)
List page: dates in calendar format (2.5 points)
List page: AJAX calendar scrolling (1 point)
Login: saves the selected date (1 point)
Forms: error messages appear next to the form fields on the registration and new date forms (0.5 points)
Additional tasks
The assignment should be compressed into an archive containing all necessary files AND the README.md file in the root folder of the program, and uploaded to Canvas by the deadline.
You cannot use any external, third-party PHP libraries. Only CSS frameworks are permitted.
The README.md file has the following requirements:
You fill in your own data at the start of the file (marked by < > signs)
You mark all (partially) finished subtasks with an x in place of the space between the square brackets [ ] in the file.
