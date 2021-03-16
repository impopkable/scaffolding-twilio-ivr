/*
* Author Sompop Kulapalanont
* Email pop@impekable.com
*/

/*
* for widget http request
* parameter: PhoneNumber 
*/

exports.handler = function(context, event, callback) {
    // Here's an example of setting up some TWiML to respond to with this function
      //let twiml = new Twilio.twiml.VoiceResponse();
    var words = ['zero','one','two','three','four','five','six','seven','eight','nine']
    var phone = event.PhoneNumber
    
    if (phone[0] === '+') {
      phone = phone.slice(2);//remove +1
    }
  
  //12072034336
  //remove +1
    var parts = []
    parts[0] = phone.slice(0,3).split("").map(x => words[x]?words[x]:x).join("-");
    parts[1] = phone.slice(3,6).split("").map(x => words[x]?words[x]:x).join("-");
    parts[2] = phone.slice(6).split("").map(x => words[x]?words[x]:x).join("-");
    
  //+ one seven seven three eight zero seven one five seven one
    var answer = parts.join('. ')//phone.split("").map(x => words[x]?words[x]:x).join("-");
    ///twiml.say('Hello World');
    
    
    //let variable = 'welcome!';
  
    // You can log with console.log
    //console.log('error', variable);
    console.log(answer)
    // This callback is what is returned in response to this function being invoked.
    // It's really important! E.g. you might respond with TWiML here for a voice or SMS response.
    // Or you might return JSON data to a studio flow. Don't forget it!
    return callback(null, {
      answer:answer + '.'
    });
  };