class User < ApplicationRecord

  def self.from_omniauth(response)
    require "pry"; binding.pry
    User.find_or_create_by
  end
end
