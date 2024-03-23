class Meeting < ApplicationRecord
	# Define the attributes
	attribute :time, :time
	attribute :description, :text
  
	# Associations
	has_many :budget_items
	has_many :announcements
	has_many :meetings_members
	has_many :members, through: :meetings_members
  
	# Validations
	validates :name, presence: true
	validates :date, presence: true
	validates :time, presence: true
	validates :location, presence: true
  end
  