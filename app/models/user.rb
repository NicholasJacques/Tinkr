class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.save!
    end
  end
end
