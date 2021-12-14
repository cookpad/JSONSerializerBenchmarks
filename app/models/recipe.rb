class Recipe < ApplicationRecord
  # Simulate pagination. 20 per page, page nr 2
  PER_PAGE = 20
  CURRENT_PAGE = 2

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  def self.for_benchmark_index
    where(state: "published").
      includes(:user, :comments).
      order("created_at DESC").
      limit(per_page).
      offset(pagination_offset)
  end

  scope :page, -> { Rational(offset_value, limit_value).to_i + 1 }

  def self.per_page
    PER_PAGE
  end

  def self.pagination_offset
    PER_PAGE * (CURRENT_PAGE - 1)
  end
end
