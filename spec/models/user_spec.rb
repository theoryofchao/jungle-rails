require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new
  end

  describe 'Validations' do
    it "should have matching passwords" do
      user = User.new(first_name: 'first_name', last_name: 'last_name', email: "first@last.com", password: 'password', password_confirmation: 'password')
      expect(user.save).to be_truthy
    end

    it "should not have mismatched passwords" do
      user = User.new(first_name: 'first_name', last_name: 'last_name', email: "first@last.com", password: 'right', password_confirmation: 'wrong')
      expect(user.save).to be_falsey
    end

    it "should not have accounts with same email" do
      user = User.create(first_name: 'first_name', last_name: 'last_name', email: "first@last.com", password: 'password', password_confirmation: 'password')
      user2 = User.new(first_name: 'first_name', last_name: 'last_name', email: "first@last.com", password: 'password', password_confirmation: 'password')
      expect(user2.save).to be_falsey
    end

    it "should not matter about email case" do
      user = User.create(first_name: 'first_name', last_name: 'last_name', email: "first@last.com", password: 'password', password_confirmation: 'password')
      user2 = User.new(first_name: 'first_name', last_name: 'last_name', email: "FIRST@LAST.com", password: 'password', password_confirmation: 'password')
      expect(user2.save).to be_falsey
    end

    it "should have email first_name last_name 1" do
      user = User.new(first_name: 'firstname', last_name: nil, email: nil, password: 'password', password_confirmation: 'password')
      expect(user.save).to be_falsey
    end

    it "should have email first_name last_name 2" do
      user = User.new(first_name: 'firstname', last_name: 'lastname', email: nil, password: 'password', password_confirmation: 'password')
      expect(user.save).to be_falsey
    end

    it "should have email first_name last_name 3" do
      user = User.new(first_name: 'firstname', last_name: 'last_name', email: "first@last.com", password: 'password', password_confirmation: 'password')
      expect(user.save).to be_truthy
    end

    it "should have 8 characters minimum password (test 7 characters)" do
      user = User.new(first_name: 'firstname', last_name: 'lastname', email: "first@last.com", password: 'passwor', password_confirmation: 'passwor')
      expect(user.save).to be_falsey
    end

    it "should have 8 characters minimum password (test 8 characters" do
      user = User.new(first_name: 'firstname', last_name: 'lastname', email: "first@last.com", password: 'password', password_confirmation: 'password')
      expect(user.save).to be_truthy
    end
  end

  describe '.authenticate_with_credentials' do
    it "should authenticate even with extra whitespaces" do
      User.create(first_name: 'first_name', last_name: 'last_name', email: "first@last.com", password: 'password', password_confirmation: 'password')
      user = User.authenticate_with_credentials('first@last.com', 'password   ')
      expect(user).to be_truthy
    end

    it "should authenticate when wrong case" do
      User.create(first_name: 'first_name', last_name: 'last_name', email: "first@last.com", password: 'password', password_confirmation: 'password')
      user = User.authenticate_with_credentials('FIRST@last.com', 'password')
      expect(user).to be_truthy
    end
  end
end


# validates :first_name, :last_name, :email, :password_digest, presence: true
# validates :email, uniqueness: true
# has_many :reviews
# has_secure_password