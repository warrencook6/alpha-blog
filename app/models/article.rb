class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minumum: 3, maximum: 50}
  validates :description, presence: true, length: {minumum: 5, maximum: 300}
  validates :user_id, presence: true
end
