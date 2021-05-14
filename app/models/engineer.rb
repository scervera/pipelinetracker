class Engineer < ApplicationRecord
  has_many :opportunities

  def engineer_fullname
  	firstname + " " + lastname
  end
end
