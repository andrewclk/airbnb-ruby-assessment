
get '/bookings' do
	@bookings = Booking.all
	@properties = Property.all
	@booking_exist = Booking.find_by(user_id: session[:user_id])
	erb :"/booking"
end

get '/bookings/new' do
	@property = Property.find(params[:property_id])
	erb :"/new"
end

post '/bookings/new' do
	booking = Booking.new(booking_date: params[:date], booking_info: params[:info], user_id: session[:user_id], property_id: params[:property_id], status: true)
	booking.save
	redirect to '/bookings'
end


delete '/bookings/:booking_id/delete' do 
	booking = Booking.delete(params[:booking_id])
	redirect '/bookings'
end

get '/bookings/:id/edit' do
	@booking = Booking.find(params[:booking_id])
	erb :"/edit"
end

patch '/bookings/:id/edit' do
	@booking = Booking.find(params[:booking_id])
	@booking.booking_date = params[:date]
	@booking.booking_info = params[:info]
	@booking.status = true
	@booking.save
	redirect to '/bookings'
end