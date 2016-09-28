class User < ActiveRecord::Base
  include Clearance::User

   has_many :authentications, :dependent => :destroy
   has_many :listings
   has_many :reservations
   mount_uploaders :avatars, AvatarUploader


  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      # this depends on what you have in your user table
      # u.first_name = auth_hash["info"]["first_name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.encrypted_password = rand(1..9999999999)  # this allows the user to log in with a sample password at first but subsequently, dont need password when login again
      u.authentications<<(authentication) 
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end
