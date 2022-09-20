# Skedaddle

<ul>
<li><b>Skedaddle</b> is a <b>Rails</b> application that has both frontend and backend repositories.</li>

<li>The frontend consumes API endpoints exposed by the backend, which is consuming data from <b>AllTrails API</b> and <b>Yelp Fusion API</b>.</li>
  
  <li>This app creates a <i>custom itinerary</i> with <b>three trails</b> and <b>three restaraunts</b> based on geodata.</li>

<li>This application utilizes a <b>relational database</b> to store user and itinerary data.</li>

<li>The application was deployed on <b>Heroku</b> but can also be viewed on a local server.</li></ul>

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#techical-requirements"> ➤ Technical Requirements</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#routes"> ➤ Routes</a></li>
    <li><a href="#db-schema"> ➤ Database Schema</a></li>
    <li><a href="#getting-started"> ➤ Getting Started</a></li>
    <li><a href="#test-suite"> ➤ Test Suite</a></li>
    <li><a href="#scenario1"> ➤ Scenario 1: Login </a></li>
    <li><a href="#scenario2"> ➤ Scenario 2: Discover Movies </a></li>
    <li><a href="#scenario3"> ➤ Scenario 3: Create a Viewing Party  </a></li>
    <li><a href="#scenario4"> ➤ Scenario 4: View User Dashboard</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
</details>

<!-- TECHNICAL REQUIREMENTS -->
<h2 id="techical-requirements"> 💻 Technical Requirements</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.6</li>
  <li>RSpec-Rails 4.0.1</li>
   <li>Bootstrap 4</li>
  <li>Faraday</li>
  <li>Figaro</li>
  <li>Webmock</li>
  <li>VCR</li>
  <li>Capybara</li>
  <li>SimpleCov</li>
  <li>Launchy</li>
  <li>Factory Bot</li>
  <li>Faker</li>
  <li>JSON API Serializer</li>
  <li>Postman</li>
  <li>Shoulda-Matchers</li>
  </ul>
  <p><i>Installation instructions found in</i> <a href="#getting-started"> ➤ Getting Started</a></p>
   
<!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description"> :floppy_disk: Project Files Description</h2>
<ul>
  <li><b>app/controllers/application_controller</li></b>
  <ol>
  <li>Application controller which includes helper method to account for current user</li>
    <li>Directs rendering of several elements based on whether a user has logged in</li></ol>
  <li><b>app/controllers/welcome_controller.rb</li></b>
  <ol>
  <li>Welcome page controller that initiates login via Google OAuth v2</li></ol>
  <li><b>app/controllers/sessions_controller.rb</li></b>
  <ol>
  <li>Sessions controller that checks for OmniAuth authentication and creates a new session for user if authentication is successful </li></ol>
  <li><b>app/controllers/dashboard_controller.rb</li></b>
  <ol>
  <li>Dashboard controller that creates user dashboard view which provides destination search functionality</li></ol>
  <li><b>app/controllers/itineraries_controller.rb</li></b>
  <ol>
  <li>Uses before_action to call backend API in order to receive data on trails and restaraunts based on the destination the user has searched for</li></ol>
 <li><b>app/controllers/itineraries_controller.rb</li></b>
  <ol>
  <li>Uses before_action to call backend API in order to receive data on trails and restaraunts based on the destination the user has searched for</li></ol>
 <li><b>app/models/user.rb</li></b>
  <ol>
  <li>User model that finds or creates a user after successful OAuth authentication for</li></ol>
  <ol>
 <li><b>app/models/itinerary.rb</li></b>
  <ol>
  <li>Itinerary model which references park and restaraunt objects created from API calls for</li></ol>
  
 <li><b>app/views/</li></b>
  <ol>
  <li>Dynamic pages built in HTML and CSS using Bootstrap</li></ol>

<h3>Some other supporting files</h3>
<ul><li><b>spec</b><ol>
  <li>Contains test suite files</li>
  <li><i>spec/fixtures/vcr_cassettes</i><ol>
  <li>Subfolder that contains mocked data used in tests to prevent API endpoint calls every time testing suite is run</li></ol>
</ul>

   
<!-- ROUTES -->
<h2 id="routes"> :open_file_folder: Routes</h2>

| Rails Routes  |  |  |
| ------------- | ------------- | ------------- |
| root  | welcome#index  | Index Page  |
| get  | '/auth/:provider/callback'  | 'sessions#omniauth'  |
| get  | '/dashboard'  | 'dashboard#show'  |
| delete  | '/sessions'  | 'sessions#destroy'  |
| get  | '/about'  | 'about_us_contact#about_us'  |
| get  | '/contact'  | 'about_us_contact#contact'  |
| resources  | '/itineraries'  | except: %i[edit update]  |


<!-- DATABASE SCHEMA -->
<h2 id="db-schema"> :desktop_computer: Database Schema</h2>

![image](https://user-images.githubusercontent.com/95776577/191345428-e697d55a-a33b-4b8e-b469-b31e422727dd.png)


<!-- GETTING STARTED -->
<h2 id="getting-started"> :book: Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/skedaddle-fe</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/skedaddle-fe</code></pre>
<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>

![183747041-40f47875-442e-4008-8d00-8c45bf2731fe](https://user-images.githubusercontent.com/95776577/183752233-c9130b38-ce16-4b4c-aeb4-fdf0d0d4a137.png)

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:JohnSantosuosso/skedaddle-fe.git</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>6. </b> Install dependencies found in Gemfile</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>10. </b> Run migrations</p>
<pre><code>$ rails db:{create,migrate,seed}</code></pre>

<p><b>11. </b> Initiate the application on your local server</a>.</p>
<pre><code>$ rails s</code></pre>

<p><b>12. </b> Open your favorite web browser and enter the URL in the address bar:</p>
<pre><code>localhost:3000</code></pre>

<!-- TEST SUITE -->
<h2 id="test-suite"> :heavy_check_mark: Test Suite</h2>
To run the test suite, make sure you are in the root of the project and run: <pre><code>bundle exec rspec</code></pre>

<!-- SCENARIO1 -->
<h2 id="scenario1"> :small_orange_diamond: Scenario 1: Login</h2>
<p>Login using Google OAuth Services</p>

![ezgif com-gif-maker](https://user-images.githubusercontent.com/95776577/191350939-5b522e88-631f-45be-8171-439e9f827c01.gif)



<!-- SCENARIO2 -->
<h2 id="scenario2"> :small_orange_diamond: Scenario 2: Discover Movies </h2>
<p>A user can search for movies by title and view that movie's details.  A user can also see top rate movies by clicking the <b>Top Movies</b> button</p>

![step 2](https://user-images.githubusercontent.com/95776577/188296031-01b7d35f-cf38-49e0-9bd4-8cc33aa1264b.gif)


<!-- SCENARIO3 -->
<h2 id="scenario3"> :small_orange_diamond: Scenario 3: Create a Viewing Party </h2>
<p>A user can select a movie and create a viewing party for that movie.</p>


![step 3](https://user-images.githubusercontent.com/95776577/188296382-4d1656c0-a27a-44c2-ba90-ff262ab24d21.gif)

<!-- SCENARIO4 -->
<h2 id="scenario4"> :small_orange_diamond: Scenario 4: View User Dashboard </h2>
<p>A user can view the viewing parties they are hosting, as well as the parties they have been invited to.</p>

![step 4](https://user-images.githubusercontent.com/95776577/188296671-a1de8a83-b5a5-4099-853c-a167471fa152.gif)


<!-- CREDITS -->
<h2 id="credits"> :scroll: Credits</h2>
<h3>Nick Jones</h3>

<h3>Drew MacNicholas</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dmacnicholas)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/drew-macnicholas-20b75660/)

<h3>Wes Miranda</h3>

<h3>Eli Sachs</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/easachs)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/easachs)


<h3>John Santosuosso</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/johnsantosuosso)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/john-santosuosso)


<p>Project built as part of Turing School of Software and Design's <a href="https://backend.turing.edu/module3/projects/consultancy/"> Consultancy Competition.</a></p>


