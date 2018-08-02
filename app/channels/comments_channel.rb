class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments_#{params['review_id']}_channel"
  end
end
