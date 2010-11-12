class Point < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'user_id'

  def validate
    errors.add(:point, 'This param is a wrong value') if point.blank?
  end
end
