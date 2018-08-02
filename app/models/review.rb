class Review < ApplicationRecord
  attr_writer :hastags_list

  belongs_to :user, required: true

  has_many :comments, dependent: :destroy
  has_many :hastag_posts, dependent: :destroy
  has_many :hastags, through: :hastag_posts

  validates :title, presence: true
  validates :content, presence: true

  after_save :make_hastags

  scope :order_by_time, ->{order created_at: :desc}

  def hastags_list
    @hastags_list || hastags.map(&:name).join(", ")
  end

  private

  def make_hastags
    return unless @hastags_list
    self.hastags = @hastags_list.split(",").map do |name|
      name = name.strip if name[0..0] == " "
      name = name.downcase
      Hastag.find_or_create_by title: name
    end
  end
end
