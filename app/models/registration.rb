class Registration < ApplicationRecord
  belongs_to :event

  validates :name, presence: true

  validates :email, format: { with: /\s+@\s+/ }

  HOW_HEARD_OPTIONS = [
    'News latter',
    'Blog post',
    'Twitter',
    'Web search',
    'Friend/Coworker',
    'other'
  ]

  validates :how_heard,
            inclusion: { in: HOW_HEARD_OPTIONS }
end
