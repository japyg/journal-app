class Task < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  
  validates :status, inclusion: { in: ['not-started', 'in-progress', 'done'] }

  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    ['Done', 'done']
  ]

  def badge_color
    case status
    when 'not-started'
      'dark'
    when 'in-progress'
      'warning'
    when 'done'
      'success'
    end
  end

  def done?
    status == 'done'
  end

  def in_progress?
    status == 'in-progress'
  end

  def not_started?
    status == 'not-started' 
  end
end
