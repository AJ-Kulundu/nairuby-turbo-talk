class Todo < ApplicationRecord
    # after_create_commit -> { broadcast_append_to "todos" }
    # after_update_commit -> { broadcast_replace_to "todos" }
    # after_destroy_commit -> { broadcast_remove_to "todos" }

    broadcasts_to -> (todo) { "todos" }, insert_by: :append
end
