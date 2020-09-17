import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  var calendarEl = document.getElementById('calendar');
  const path = location.pathname;
  const eventRegex = /^\/exhibitions\/\d+\/events$/

  if(eventRegex.test(path)) {
 
    var calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin, interactionPlugin ],
      events: 'events.json'
    });
    
    calendar.render();
  }
});

