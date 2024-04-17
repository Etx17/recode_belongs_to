class Book < ApplicationRecord
  extend ActiveRecord::Associations::ClassMethods
  belongs_to :user
end
