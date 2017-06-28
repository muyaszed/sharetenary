class Authentication < ApplicationRecord
  belongs_to :user



  def self.find_for_oauth(auth)
    
    if User.where(email: auth.info.email).exists?
    	user= User.where(email: auth.info.email).first
    	authentication = self.where(uid: auth.uid, provider: auth.provider, user_id: user.id).first
    	
    	if authentication
    		return_user = authentication.user
    	else
    		authentication = self.create!(uid: auth.uid, provider: auth.provider, user_id: user.id)
    		return_user = authentication.user
    	end
    	
    else
    	
    	
    	return_user = User.new do |user|
    		user.username = auth.info.name.gsub(/\s+/, "")
    		user.email = auth.info.email
    		user.password = Devise.friendly_token[0, 20]
    	end
    	
    	return_user.save!
        

    	autenthication = self.create!(uid: auth.uid, provider: auth.provider, user_id: return_user.id)
    end
    
    return_user

  end

end
