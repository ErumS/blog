class Comment < ApplicationRecord
  belongs_to :article
  has_many :feedbacks, dependent: :destroy
end
