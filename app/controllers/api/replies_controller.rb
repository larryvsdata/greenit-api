class Api::RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :update, :destroy]

  # GET /replies
  def index
    @replies = Reply.all

    render json: @replies
  end

  # GET /replies/1
  def show
    render json: @reply
  end

  # POST /replies
  def create
    # binding.pry
    if params[:user_id]
      @reply = Reply.new(reply_params)
    else
      user = User.all.sample
      @reply = Reply.new(entry: params[:reply][:entry] ,
         topic_id: params[:topic_id] , user_id: user.id ,comment_id: params[:comment_id] )
    end

    if @reply.save
      render json: @reply, status: :created,  location: 'topics#index'
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /replies/1
  def update
    if @reply.update(reply_params)
      render json: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replies/1
  def destroy
    @reply.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reply_params
      params.require(:reply).permit(:entry, :user_id, :topic_id, :comment_id)
    end
end
