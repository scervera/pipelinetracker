class AccountExecutive < ApplicationRecord
  has_many :opportunities
  #scope :account_executive_fullname, -> { firstname + lastname }

  def account_executive_fullname
  	firstname + " " + lastname
  end



end

