get '/user' do
	if session[:user_id] != nil
		@properties = Property.all
		@bookings = Booking.all
		@comments = Comment.all
	  erb :"/user"
	else
		redirect to '/'
	end
end


post '/user/signup' do
	user = User.new(name: params[:user][:name], email: params[:user][:email])
	user.password = params[:user][:password]
	user.save
	redirect to '/'
end



post '/user/login' do
	@user = User.find_by_email(params[:user][:email])
	# byebug
	if BCrypt::Password.new(@user.encrypted_password) == params[:user][:password]

	  session[:user_id] = @user.id
	  redirect '/user'
	else
	  redirect to '/fail'
	end
end

post '/user/logout' do
	session[:user_id] = nil
	redirect to '/'
end

get '/success' do
	user = User.find_by_id(session[:user_id])
	if user
		"success"
	else 
		redirect to '/'
	end
end


