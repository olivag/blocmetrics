# [Blocmetrics](#): An API Tracking Service and Reporting Tool
##### Blocmetrics builds an analytics service and reporting tool that you can use with web apps to track user activity.
![alt tag](https://olivag.github.io/img/blocmetrics.png "Blocmetrics")

### What Users/Developers can do
***
1.  As a user, sign up for a free account by providing a name, password, and email, and sign in and out of Blocmetrics
2. As a user, register an application with Blocmetrics for tracking and create events associated with registered applications
3. As a developer, receive incoming events in an API controller
4. As a user, use JavaScript to capture client-side events in your application 
5. As a user, view a graph of events for each registered application
### Tools used
***
* Devise gem for authentication
* Pundit gem for authorization
* Faker gem to simulate a variety of tracked events
* Namespace API controller to receive requests in JSON format by skipping verify_authenticity_token
* CORS to allow cross-orign request in a controllled manner without opening up securities vulnerabilities.
* Chartkick gem to show pie chart

##### Snippet used to capture client-side events in my application:
```javascript
var blocmetrics = {};
blocmetrics.report = function(eventName) {
  var event = {event: { name: eventName }};
  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
}
```