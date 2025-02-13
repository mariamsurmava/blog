# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible
  belongs_to :user
  has_rich_text :body
  has_one :approver
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  accepts_nested_attributes_for :categories, allow_destroy: true, reject_if: lambda { |attributes|
                                                                               attributes[:name].blank?
                                                                             }
  validates_associated :categories
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy

  def set_default_approver
    self.approver ||= nil
  end

  enum language: %i[english georgian]
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :dislikes, as: :dislikeable, dependent: :destroy
end
