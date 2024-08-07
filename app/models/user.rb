class User < ApplicationRecord
  # Associations
  has_many :services, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_many :transactions, dependent: :destroy

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # Validations
  validates :website, presence: true, uniqueness: true,
                      format: {
                        without: /\s/, # Ensure no spaces
                        message: 'cannot contain spaces'
                      }

  validate :validate_website_format
  validate :ensure_single_admin, if: :admin_changed?

  # before_validation :set_default_website, on: :create

  def validate_website_format
    return if website.blank? || website.match(/\A\S+\z/)

    errors.add(:website, 'is not valid. Please ensure no spaces are included.')
  end

  private
  def ensure_single_admin
    if admin? && User.where(admin: true).where.not(id: id).exists?
      errors.add(:admin, 'There can only be one admin user.')
    end
  end
end
