class Book < ApplicationRecord
  scope :sorted, lambda { order("id ASC") }
end
