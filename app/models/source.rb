class Source < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts, dependent: :destroy

  validates :link, presence: true
  validates :name, presence: true
end
