class Todo < ApplicationRecord
    validates :todo, presence: true

    scope :ordered, -> { order(id: :desc)}

    # after_create_commit { broadcast_prepend_to "todos"}
    # after_update_commit { broadcast_replace_to "todos"}
    # after_destroy_commit { broadcast_remove_to "todos"}

    broadcasts_to -> (todo) {:todos}, inserts_by: :prepend

    after_create_commit { broadcast_update_to "todos", target: "total", html: Todo.size}
    after_destroy_commit { broadcast_update_to "todos", target: "total", html: Todo.size}

    def self.size
        Todo.all.size
    end
end
