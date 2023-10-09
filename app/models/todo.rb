class Todo < ApplicationRecord
    broadcasts_to ->(todo) { :todos }, inserts_by: :append
end
