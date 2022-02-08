require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should be created successfully will all required fields' do 
      @user = User.create(first_name: 'Lucy', last_name: 'Lee', email: 'lucy@lee.com', password:'lucylee123', password_confirmation: 'lucylee123')
      expect(@user).to be_valid
    end

   it 'should fail if first name is missing' do 
      @user = User.create(last_name: 'Lee', email: 'lucy@lee.com', password:'lucylee123', password_confirmation: 'lucylee123')
      expect(@user).to be_invalid
    end 

    it 'should fail if last _name is missing' do 
      @user = User.new(first_name: 'Lucy', email: 'lucy@lee.com', password:'lucylee123', password_confirmation: 'lucylee123')
      @user.save
      expect(@user).to be_invalid
    end  

    it 'should fail if email is missing' do 
      @user = User.create(first_name: 'Lucy', last_name: 'Lee', password:'lucylee123', password_confirmation: 'lucylee123')
      expect(@user).to be_invalid
    end
   
    it 'should fail if password is different than password confirmation' do 
      @user = User.create(first_name: 'Lucy', last_name: 'Lee', email: 'lucy@lee.com', password:'lucylee123', password_confirmation: 'lucylee456')
      expect(@user).to be_invalid
    end 

    it 'should fail if email is not unique - not case sensitive' do 
      @user1 = User.create(first_name: 'Lucy', last_name: 'Lee', email: 'lucy@lee.com', password:'lucylee123', password_confirmation: 'lucylee123')
      @user2 = User.create(first_name: 'Lulu', last_name: 'Leeson', email: 'LUCY@LEE.com', password:'lululee123', password_confirmation: 'lululee123')
      expect(@user2).to be_invalid
    end 

    it 'should fail if password has less than 6 characters' do 
      @user = User.create(first_name: 'Lucy', last_name: 'Lee', email: 'lucy@lee.com', password:'lucy', password_confirmation: 'lucy')
      expect(@user).to be_invalid
    end

  end
end
