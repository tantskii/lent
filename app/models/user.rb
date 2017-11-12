class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :sources
  has_many :posts, through: :sources   

  def add_source(source)
    sources << source
  end

  def delete_source(source)
    sources.delete(source)
  end    
end
