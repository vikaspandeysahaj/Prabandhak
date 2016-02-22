class User < ActiveRecord::Base
  has_many :expenses
  
  Roles = [ :admin , :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

	def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.email = auth.info.email
      user.profileurl = auth.info.image
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

      if(user.email=='vikasp@sahajsoft.com')
        user.role = 'admin'
      else
        user.role = 'default'
      end

      user.save!
    end
  end
end
