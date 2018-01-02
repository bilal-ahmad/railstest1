class Project < ApplicationRecord
  has_many :employees
  belongs_to :client
end
