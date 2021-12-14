class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  def self.for_benchmark_index
    where(state: "published").
      includes(:user, :comments).
      order("created_at DESC").
      limit(per_page).
      offset(pagination_offset)
  end

  scope :page, -> { Rational(offset_value, limit_value).to_i + 1 }

  def self.per_page
    20
  end

  def self.pagination_offset
    # Simulate pagination. 20 per page, page nr 2
    current_page = 2
    per_page * (current_page - 1)
  end
end
