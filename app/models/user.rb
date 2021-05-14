class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %i[admin ae se saleslead manager]
  CARRIER = %i[verizon att t-mobile all]

  scope :user_with_role_se, -> { where(role: "se") }
  scope :user_with_role_ae, -> { where(role: "ae") }
  scope :user_with_role_saleslead, -> { where(role: "saleslead") }
  scope :user_with_role_manager, -> { where(role: "manager") }
  scope :user_with_role_admin, -> { where(role: "admin") }
  
  def fullname
    firstname.to_s + " " + lastname.to_s
  end

  def name_with_initial
    "#{firstname} #{lastname}"
  end





end
