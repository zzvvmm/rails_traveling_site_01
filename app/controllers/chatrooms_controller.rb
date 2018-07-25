class ChatroomsController < ApplicationController
  before_action :find_chatroom, only: [:show, :edit, :update]

  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
  end

  def new
    flash[:notice] = nil if request.referrer.split("/").last == "chatrooms"
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new chatroom_params
    if @chatroom.save
      respond_to do |format|
        format.html{redirect_to @chatroom}
        format.js
      end
    else
      respond_to do |format|
        format.html{redirect_to new_chatroom_path}
      end
    end
  end

  def show
    @message = Message.new
  end

  def edit; end

  def update
    chatroom.update chatroom_params
    redirect_to chatroom
  end

  private

  def chatroom_params
    params.require(:chatroom).permit :topic
  end

  def find_chatroom
    @chatroom = Chatroom.find_by slug: params[:slug]
  end
end
