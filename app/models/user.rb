class User < ApplicationRecord
  has_many :posts

  def user_details
    "#{name}: #{gender}.green"
  end
end
