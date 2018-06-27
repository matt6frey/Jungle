require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
      @user = User.create(
        name: "Juan Carlos",
        email: "juanCarlos@heroku.com",
        password: "nacho",
        password_confirmation: "nacho"
        )
      expect(@user).to (be_valid)
    end

    it 'should have password and password confirmation' do
      user = User.create(
        name: "Juan Carlos",
        email: "juan@heroku.com",
        password: "nacho",
        password_confirmation: nil
        )
      expect(user).to_not (be_valid)
    end

    it 'should not save without unique email' do
      @user = User.create(
        name: "Juan Carlos",
        email: "juan@heroku.com",
        password_digest: "na"
        )
      @user2 = User.create(
        name: "Juan Carlos",
        email: "juan@heroku.com",
        password_digest: "na"
        )
    expect(@user2).to_not be_valid
    end

    it 'should have matching password and password confirmation' do
      password = User.create(
        name: "Juan Carlos",
        email: "Juan Carloskato@gmail.com",
        password: "nacho",
        password_confirmation: "taco"
        )
      expect(password).to_not be_equal(password.password_confirmation)
    end

    it 'should have name to be a valid user' do
      user = User.create(
        name: nil,
        email: "juan@heroku.com",
        password: "nacho",
        password_confirmation: "nacho")
      expect(user).to_not (be_valid)
    end

    it 'should have a password with a minimum length of 3' do
      user = User.create(
        name: "Juan Carlos",
        email: "juan@heroku.com",
        password: "n",
        password_confirmation: "n"
        )
      expect(user).to_not be_valid
    end
  end

  it '.authenticate_with_credentials' do
    user = User.create(
      name: "Juan Carlos",
      email: "juan@heroku.com",
      password: "super",
      password_confirmation: "super"
      )
    authenticate = User.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to_not be_valid
  end
end