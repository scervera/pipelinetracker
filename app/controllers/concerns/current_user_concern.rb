module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User",
                  firstname: "Guest",
                  lastname: "User",
                  email: "guest@example.com",
                  role: "guest"
                  )
  end
end