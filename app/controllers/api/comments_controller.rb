class Api::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
  
   if params[:user_id] and params[:topic_id]
     @comment = Comment.new(comment_params)
   else
     user = User.all.sample
     @comment = Comment.new(entry: params[:comment][:entry] , topic_id: params[:topic_id] ,user_id: user.id )
     # binding.pry
   end

    if @comment.save
      render json: @comment, status: :created, location: 'topics#index'
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:entry, :user_id, :topic_id)
    end
end
