class Api::TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all
    # @commentsList = @topics.map{|topic|
    #    topic.comments }
    # @replies = @commentsList.map{|comments| comments.map{|comment| comment.replies.map{|reply| reply }}}
    # @reply_users = @commentsList.map{|comments| comments.map{|comment| comment.replies.map{|reply| User.find_by_id(reply.user_id) }}}
    # modified_topics={ topics: @topics , comments: @commentsList, replies: @replies ,   reply_users: @reply_users}
    render json: @topics
  end

  # GET /topics/1
  def show
    #binding.pry
    if @topic.comments
      @users= @topic.comments.map{|comment| User.find_by_id(comment.user_id)}
      @replies = @topic.comments.map{|comment| comment.replies}
    end

    if @replies
      @reply_users = @replies.map{|array|
        array.map {|reply| User.find_by_id(reply.user_id)}}
    end

    if @topic.comments and @users and @replies and @reply_users
        modified_topic={topic: @topic , comments: @topic.comments ,  users: @users ,
          replies: @replies , reply_users: @reply_users}
    end
    # binding.pry
    if modified_topic
      render json: modified_topic
    else
      render json: @topic
    end


  end

  # POST /topics
  def create
    # binding.pry
    @topic = Topic.new(topic_params)

    if @topic.save
      # binding.pry
      render json: @topic, status: :created, location: 'topics#index'
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  def update

    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end
