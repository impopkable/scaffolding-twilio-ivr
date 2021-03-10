//BUSINESS_HOURS=[ ["Sunday", 14.00, 22.00], ["Monday", 7.30, 22.00], ["Tuesday", 7.30, 22.00], ["Wednesday", 7.30, 22.00], ["Thursday", 7.30, 22.00], ["Friday", 7.30, 17.00], ["Saturday", 10.00, 14.00] ]
//dayjs 1.9.4
const dayjs = require('dayjs');
// This is your new function. To start, set the name and path on the left.
exports.handler = function (context, event, callback) {   
  var weekdays = JSON.parse(context.BUSINESS_HOURS);
  var nextDay =  dayjs();

  function getTimeStr(timeParts){
      return `${timeParts[0]}:${timeParts.length === 2 ? timeParts[1] <= 6 ? `${timeParts[1]}0` : timeParts[1] : "00"}`;
  }
  
  function businessHours() {
    // My timezone East Coast (other choices: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
    //const now = moment().tz('America/New_York');
    var dateNow = dayjs();
    var n = dateNow.day();
    var now = dateNow.hour() + "." + dateNow.minute();
    
    var day = weekdays[n];
    console.log(day);
    console.log(now);
    if(now > day[2]){
      nextDay =  dayjs().add(1, 'day');      
    }
        
    if (now < day[1] || now > day[2]) {
      console.log("Sorry, we're closed!");
      return false;
    }
    else {
      console.log("We're open right now!");
      return true;
   }
  }
  const isOpen = businessHours();
  var message = 'An agent will be with you momentarily.';
  if (!isOpen){
    var nextWeekday = weekdays[nextDay.day()];
    var nextOpenTimeParts = ('' + nextWeekday[1]).split('.');
    var nextCloseTimeParts = ('' + nextWeekday[2]).split('.');
    message = `
    Sorry, we are outside of working hours.
    Please contact us on ${nextWeekday[0].toLowerCase()} 
    from ${getTimeStr(nextOpenTimeParts)} AM 
    to ${getTimeStr(nextCloseTimeParts)} PM.
    Thank you.`;
    
  }
  return callback(null, { 
    isOpen,
    message
  });
};
