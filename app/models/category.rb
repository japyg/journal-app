class Category < ApplicationRecord
  has_many :tasks
  belongs_to :user

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

  def status
    return 'not-started' if tasks.none?

    if tasks.all? { |task| task.done? }
      'done'
    elsif tasks.any? { |task| task.in_progress? }
      'in-progress'
    else
      'not-started'
    end
  end

  def percent_complete
    return 0 if tasks.none?

    ((total_complete.to_f / total_tasks) * 100).round
  end

  def total_complete
    tasks.select { |task| task.done? }.count
  end

  def total_tasks
    tasks.count
  end

end
