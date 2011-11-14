require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, 
                         :password, 
                         :password_confirmation, 
                         :time_zone, 
                         :remember_me,
                         :provider,
                         :uid,
                         :fbimg
  
  has_and_belongs_to_many :events, :uniq => true
  
  has_many :relationships, :dependent   => :destroy,
                           :foreign_key => "follower_id"
  has_many :reverse_relationships, :dependent => :destroy,
                                   :foreign_key => "followed_id",
                                   :class_name => "Relationship"
  has_many :following, :through => :relationships, 
                       :source  => :followed
  has_many :followers, :through => :reverse_relationships,
                       :source  => :follower
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, :presence => true,
                   :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }     
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 },
                       :if => :should_validate_password?
                       
  before_save :encrypt_password, :if => :should_validate_password?
  
  def should_validate_password?
    self.pwsave
  end
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.fbimg = auth["info"]["image"]
      user.pwsave = false
    end
  end
  
  def event_feed
    ids = self.following.collect(&:id) << self.id
    Event.includes(:users).where(["users.id IN (#{ids.join(',')})"])
  end
  
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  private
    
    def encrypt_password
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
