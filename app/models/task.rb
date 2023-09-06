# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  body       :text
#  expired_at :datetime
#  name       :string           not null
#  status     :string           default("ongoing"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  extend Enumerize

  # constants
  STATUSES = %i[ongoing completed canceled].freeze

  # validations
  validates :name, presence: true
  validates :status, presence: true

  # attributes
  enumerize :status, in: STATUSES
end
