
get '/comments' do
	@comments = Comment.all
	@properties = Property.all
	erb :"/comment"
end


post '/comments/new' do
	# byebug
	comment = Comment.new(comment: params[:comment], user_id: session[:user_id], property_id: params[:property_id])
	comment.save
	@property = Property.find(params[:property_id])
	@user = User.all
	@comments = Comment.all
	redirect to "/properties/#{@property.id}/show"
end


delete '/comments/:comment_id/delete' do 
	comment = Comment.find(params[:comment_id])
	@property = Property.find(comment.property_id)
	comment = Comment.delete(params[:comment_id])
	# redirect '/properties/:property_id/show'

	redirect to "/properties/#{@property.id}/show"
end

get '/comments/:comment_id/edit' do
	@comment = Comment.find(params[:comment_id])
	erb :"/edit"
end

patch '/comments/:comment_id/edit' do
	@comment = Comment.find(params[:comment_id])
	@property = Property.find(@comment.property_id)
	@comment.comment = params[:comment]
	@comment.save
	redirect to "/properties/#{@property.id}/show"
end