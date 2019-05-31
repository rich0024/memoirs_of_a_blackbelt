class Move < ActiveRecord::Base
  validates :start_position, presence: true
  validates :type_of_move, presence: true
  validates :description, presence: true

  belongs_to :user
end
