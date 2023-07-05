class Todo < ApplicationRecord
    attribute :status, :integer, default: 0
    validates :task, presence: true

    enum :status, [ :open, :in_progress, :closed] 
end
