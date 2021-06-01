class Team < ApplicationRecord
    include PublicActivity::Model  
    has_many :project, dependent: :destroy
    has_many :users

    accepts_nested_attributes_for :users, allow_destroy: true

    tracked owner: Proc.new { |controller, model| controller.current_user }
end
