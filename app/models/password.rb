# frozen_string_literal: true

class Password < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validates :username, presence: true
  validates :password, presence: true
end
