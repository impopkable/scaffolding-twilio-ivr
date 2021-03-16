
// This is your new function. To start, set the name and path on the left.
const Moment = require('moment-timezone');
const MomentRange = require('moment-range');
const moment = MomentRange.extendMoment(Moment);

exports.handler = function(context, event, callback) {
  if (!event.timezone || !event.schedule) {
    callback('Invalid config', false);
  }
  
  const timezone = event.timezone;
  const schedule = JSON.parse(event.schedule);
  
  const currentDate = moment().tz(timezone).format('MM/DD/YYYY');

  const dayOfWeek = moment().tz(timezone).format('dddd');
  
  const begin = schedule[dayOfWeek].begin;
  const end = schedule[dayOfWeek].end;
  
  const now = moment().tz(timezone);

  const beginMomentObject = moment.tz(`${currentDate} ${begin}`, 'MM/DD/YYYY HH:mm:ss', timezone);
  const endMomentObject = moment.tz(`${currentDate} ${end}`, 'MM/DD/YYYY HH:mm:ss', timezone);
  const range = moment.range(beginMomentObject, endMomentObject);

  if (now.within(range)) {
    console.log('Hours ' + dayOfWeek + ' From: ' + begin + ' To: ' + end);
    callback(null, true);
  } else {
    callback('We are closed', false);
  }
};