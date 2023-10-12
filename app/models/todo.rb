class Todo < ApplicationRecord
    validates :todo, presence: true

    scope :ordered, -> { order(id: :desc)}


    def self.size
        Todo.all.size
    end
end
