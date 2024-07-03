class Posts::CommentsController < Posts::ApplicationController
	def new
		@post = resource_post
		@post_comment = resource_post.comments.build
	end
		
	def create
		@post = resource_post

		@comment = resource_post.comments.build(post_comment_params)
		if @comment.save
			redirect_to @post, notice: 'Comment was successfully created.'
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def post_comment_params
		params.require(:comment).permit(:content)
	end

end
