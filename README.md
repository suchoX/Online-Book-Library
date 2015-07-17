# Online-Book-Library
User Profile based Library on J2EE and JDBC

Features-

1. It is an online physical book library in which the user after registering and logging in can surf through books.
2. Books can be searched for in the search box, and if the exact book is not founf matching books based on search keyword will be shown.
3. Books can be viewed based on genre and Author.
4. Clicking on a book will take the user to the book's page which will contain the book information and an option to add to user's Wishlist and Library.
5. Books in wishlist can be viewed in user's profile.
6. When user clicks on '+Library', a request for the book will be notified to the admin. The admin logs in the admin panel and after viewing the request dispatches the book. The book gets added to the user's library.
7. If the 'Number of Books' for a particular book is 0 and the user clicks on '+Library', an 'Out of Stock' error will be shown to user and a notification is made to the admin. The Admin later from the Admin panel can add copies of that book.
8. The user's profile contains the books listed in user's 'Wishlist', 'Library' and 'History'.
9. The user can remove book from wishlist and can return a book before it's issued return date.
10. Returning a book will give a notification to the Admin, and the admin has to attend to this Return request from the admin panel which will remove it from the User's profile.
11. If Return Date of any issued books is reached, The admin will be notified.
12. Admin can Add New Book, Add Author Info, Dispatch Requested Books, Attend to Return request, Attend to 'Out of Stock' Books and Add Copies of Library Books from the Admin panel-> ../admin/admin.html


Incomplete Points-

1. As of Now, +Library automatically adds the book to library. Admin Intervention has to be introduced.
2. From above, featurea 10 and 11 is missing.
3. Making Profile Changes is not possible as of now.


Notes-

1. Oracle 11g Express Edition has been used for database.
2. Apache Tomcat was used to run this project. You can follow the steps here to set up Apache Tomcat. http://www.ntu.edu.sg/home/ehchua/programming/howto/Tomcat_HowTo.html
3. Place the project in directory- C:\apache-tomcat-8.0.23\webapps\ROOT\, an place the contents of 'Bean' folder in C:\apache-tomcat-8.0.23\webapps\ROOT\WEB-INF\classes (Create Directory if not present).
4. JDBC and J2EE is required for running the project.

