class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @reviews = Review.order_review.page(params[:page]).per Settings.paginate.per
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      flash[:success] = t "create_review_success"
      redirect_to review_url
    else
      @feed_items = []
      render "reviews/index"
    end
  end

  def show; end

  def destroy
    @review.destroy
    flash[:success] = t "delete_review_success"
    redirect_to request.referrer || review_url
  end

  private

  def review_params
    params.require(:review).permit :content, :picture
  end

  def correct_user
    @review = current_user.reviews.find_by id: params[:id]
    redirect_to reviews_url if @review.nil?
  end

  def find_review
    @review = Review.find_by id: params[:id]
  end
end
