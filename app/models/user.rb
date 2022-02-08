class User < ActiveRecord::Base
  has_secure_password
  #downcase email used for create user and login
  scope :ci_find, lambda { |attribute, value| where("lower(#{attribute})=?",value.downcase).first}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, 
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, 
                      length: {minimum: 6}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials (email, password)
    # strip = removes trailing whitespace 
    email = email.strip

    @user = User.ci_find('email', email)
   
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(password)
      @user
    else 
      nil
    end
  end
  
end
