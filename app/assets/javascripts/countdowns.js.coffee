# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

if $('#countdown').length
	year = document.getElementById('year').innerHTML;
	month = document.getElementById('month').innerHTML;
	day = document.getElementById('day').innerHTML;
	hour = document.getElementById('hour').innerHTML;
	minute = document.getElementById('minute').innerHTML;
	second = document.getElementById('second').innerHTML;

	# // set the date we're counting down to
	target_date = new Date(year, month, day, hour, minute, second);
	 
	# // get tag element
	countdown =  document.getElementById("countdown");
	days_span = document.createElement("SPAN");
	days_span.className = 'days top_holder';
	countdown.appendChild(days_span);
	hours_span = document.createElement("SPAN");
	hours_span.className = 'hours top_holder';
	countdown.appendChild(hours_span);
	minutes_span = document.createElement("SPAN");
	minutes_span.className = 'minutes top_holder';
	countdown.appendChild(minutes_span);
	secs_span = document.createElement("SPAN");
	secs_span.className = 'secs top_holder';
	countdown.appendChild(secs_span);
	 
	# // update the tag with id "countdown" every 1 second
	setInterval ->
	 
	    # // find the amount of "seconds" between now and target
	    current_date = new Date().getTime();
	    seconds_left = (target_date - current_date) / 1000;
	 
	    # // do some time calculations
	    days = parseInt(seconds_left / 86400);
	    seconds_left = seconds_left % 86400;
	     
	    hours = parseInt(seconds_left / 3600);
	    seconds_left = seconds_left % 3600;
	     
	    minutes = parseInt(seconds_left / 60);
	    seconds = parseInt(seconds_left % 60);
	     
	    # // format countdown string + set tag value.
	  
	    days_span.innerHTML = '<div class="holder"><span class="number">' + days + '</span>' + '<span class="text">DAYS</span></div>';
	    hours_span.innerHTML = '<div class="holder"><span class="number">' + hours + '</span>' + '<span class="text">HOURS</span></div>';
	    minutes_span.innerHTML = '<div class="holder"><span class="number">' + minutes + '</span>' + '<span class="text">MINUTES</span></div>';
	    secs_span.innerHTML = '<div class="holder"><span class="number">' + seconds + '</span>' + '<span class="text">SECONDS</span></div>';
	    
	  
	    # //countdown.innerHTML = days + "d, " + hours + "h, "
	   # // + minutes + "m, " + seconds + "s";  
	 
	, 1