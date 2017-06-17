class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  after_create :create_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :itenaries
  has_one :profile
  has_many :active_follows, class_name:  "Follow",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_follows, class_name:  "Follow",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy                                  
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  has_many :likes
  has_many :liked_itenary, through: :likes, source: :itenary

  has_many :bookmarks
  has_many :bookmarked_itenary, through: :bookmarks, source: :itenary

  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first
      end
    end

  def create_profile
    Profile.create(user_id: self.id)
  end

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def self.find_for_oauth(auth)

    if self.where(email: auth.info.email).exists?
      return_user = self.where(email: auth.info.email).first
      return_user.provider = auth.provider
      return_user.uid = auth.uid
    else
      return_user = self.create do |user|
         user.provider = auth.provider
         user.uid = auth.uid
         user.username = auth.info.name.gsub(/\s+/, "")
         user.email = auth.info.email
         user.password = Devise.friendly_token[0, 20]
      end
    end




    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   # user.email = auth.info.email
    #   user.password = Devise.friendly_token[0,20]
    #   user.username = auth.info.name   # assuming the user model has a name
    #   # user.image = auth.info.image # assuming the user model has an image
    #   # If you are using confirmable and the provider(s) you use validate emails, 
    #   # uncomment the line below to skip the confirmation emails.
    #   # user.skip_confirmation!
    # end
    # user = User.where(uid: auth.id, provider: auth.provider).first

    # unless user

    #   user = User.create(
    #     uid: auth.id,
    #     provider: auth.provider,
    #     username: auth.info.name.gsub(/\s+/, ""),
    #     email: auth.info.email,
    #     password: Devise.friendly_token[0, 20]
    #   )
    # end

    
    return_user

  end

  

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end

    end
  end
end
