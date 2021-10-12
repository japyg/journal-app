class Task < ApplicationRecord
  belongs_to :category

  validates :status, inclusion: { in: ['Not started', 'In progress', 'Done'] }

  STATUS_OPTIONS = [
    ['Not started', 'Not started'],
    ['In progress', 'In progress'],
    ['Done', 'Done']
  
  ]
end
