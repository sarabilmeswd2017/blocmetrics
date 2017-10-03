== README

Used for adding client side Javascript with Ajax:
var blocmetrics= {};
blocmetrics.report = functoin(eventName){
  var event = {event: { name: eventName }};
  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};

Made with my mentor at [Bloc](http://bloc.io).
