class Todo < ApplicationRecord
    validates :todo, presence: true

    scope :ordered, -> { order(id: :desc)}
end
