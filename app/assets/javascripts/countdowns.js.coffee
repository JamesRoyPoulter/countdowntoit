# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# // update the tag with id "countdown" every 1 second
my_var_one = ()-> 
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
    	$('.number').css('font-size','6em') if String(days).length == 2
    	$('.number').css('font-size','5em') if String(days).length == 3
    	$('.number').css('font-size','4em') if String(days).length == 4
    	$('.number').css('font-size','3em') if String(days).length == 5

if $('#countdown').length
	# get data off page
	d = ['year', 'month', 'day', 'hour', 'minute', 'second' ]
	d2 = []
	for element in d
		a = document.getElementById(element).innerHTML
		d2.push a
	target_date = new Date(d2[0], d2[1], d2[2], d2[3], d2[4], d2[5])
	 
	# get tag element
	countdown =  document.getElementById("countdown");

	# create html and append to tag element above
	days_span = document.createElement("SPAN");
	hours_span = document.createElement("SPAN");
	minutes_span = document.createElement("SPAN");
	secs_span = document.createElement("SPAN");

	d3 = [days_span, hours_span, minutes_span, secs_span]
	d4 = ['days', 'hours', 'minutes', 'secs']
	
	# create html and append to tag element above
	for element in d3
		bah = 0
		element.className = "#{d4[bah]} top_holder";
		bah +=
		countdown.appendChild(element);
	
	my_var_one()
	setInterval ->
		my_var_one()
	, 1000

# make the date boxes the right width
width = $('.date_select').width()
day_width = (width-1)/2/3
for i in [1..5] by 1
	select = '#countdown_countdown_date_'+i+'i'
	$(select).width(day_width)

