class Member < ApplicationRecord
    has_many :meetings_members
    has_many :meetings, through: :meetings_members
end
