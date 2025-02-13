# frozen_string_literal: true

module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived', 'members only'].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end

  def private?
    status == 'private'
  end
end
