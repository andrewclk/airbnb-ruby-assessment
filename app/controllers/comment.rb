
get '/comments' do
	@comments = Comment.all
	@properties = Property.all
	erb :"/comment"
end


post '/comments/new' do
	comment = Comment.new(comment: params[:comment], user_id: session[:user_id], property_id: params[:property_id])
	comment.save
	@property = Property.find(params[:property_id])
	@user = User.all
	@comments = Comment.all
	redirect to '/user'
end


delete '/comments/:comment_id/delete' do 
	comment = Comment.delete(params[:comment_id])
	# redirect '/properties/:property_id/show'
	redirect to '/user'
end

get '/comments/:id/edit' do
	@comment = Comment.find(params[:comment_id])
	erb :"/edit"
end

patch '/comments/:id/edit' do
	@comment = Comment.find(params[:comment_id])
	@comment.comment = params[:comment]
	@comment.save
	redirect to '/user'
end