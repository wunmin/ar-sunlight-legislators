class PoliticianInfo < ActiveRecord::Base
  validates :type, presence: true
  validates :name, presence: true
  validates :gender, presence: true
  validates :birthdate, presence: true
  validates :party, presence: true
  validates :state, presence: true

  has_many :tweets

  # validate :valid_phone?

  # def valid_phone?
  #     if self.phone.scan(/\d+/).join.length < 10
  #         errors.add(:phone, "must contain at least 10 digits, excluding non-numeric characters")
  #     end
  # end
end