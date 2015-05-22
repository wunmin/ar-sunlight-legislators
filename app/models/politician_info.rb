class PoliticianInfo < ActiveRecord::Base
  validates :type, :name, :phone, :gender, :birthdate, :party, :state, :active?, presence: true
  validate :valid_phone?

  def valid_phone?
      if self.phone.scan(/\d+/).join.length < 10
          errors.add(:phone, "must contain at least 10 digits, excluding non-numeric characters")
      end
  end
end