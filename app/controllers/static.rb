get '/' do
	if session[:user_id] != nil
		@properties = Property.all
		@bookings = Booking.all
		@comments = Comment.all
	  erb :"/user"
	else
  	erb :"static/index"
  end
end