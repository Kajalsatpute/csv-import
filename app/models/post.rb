class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  delegate :user_details, to: :user
end
