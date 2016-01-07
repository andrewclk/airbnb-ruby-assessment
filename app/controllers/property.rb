require 'byebug'
get '/properties' do
	@bookings = Booking.all
	@properties = Property.all
	@property_exist = Property.find_by(user_id: session[:user_id])
	erb :"/property"
end

get '/properties/:id/show' do
	@property = Property.find(params[:id])
	@user = User.all
	@comments = Comment.all
	erb :"/show"
end



post '/properties/new' do
	property = Property.new(name: params[:name], info: params[:info], user_id: session[:user_id], price: params[:price])
	property.save
	redirect to '/properties'
end


delete '/properties/:property_id/delete' do 
	property = Property.delete(params[:property_id])
	redirect '/properties'
end

get '/properties/:id/edit' do
	# byebug
	@property = Property.find(params[:property_id])
	erb :"/edit"
end

patch '/questions/:id/edit' do
	@property = Property.find(params[:property_id])
	@property.name = params[:name]
	@property.info = params[:info]
	@property.price = params[:price]
	@property.save
	redirect to '/properties'
end