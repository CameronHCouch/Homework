require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  user1 = User.create(email: 'beep@boop.com')
  user1.password = 'booperino'

  describe '#is_password?' do
    it 'verifies that the user submitted the correct password' do
      expect(user1.is_password?('booperino')).to be(true)
      expect(user1.is_password?('marlboro')).to be(false)
    end
    
    it 'only stores encrypted passwords in the database' do
      expect(user1.password_digest).to_not eq('booperino') 
    end
  end

  describe '#reset_session_token!' do
    it 'creates a new session token' do
      original_token = user1.session_token
      user1.reset_session_token!
      expect(user1.session_token).to_not eq(original_token)
    end

    it 'saves this token to the database' do
      expect(user1).to receive(:save!)
      user1.reset_session_token!
    end
  end

  describe 'User.find_by_credentials' do
    before { user1.save! }

    # why isn't this working?
    it 'only matches a user if both email and password are correct' do
      expect(User.find_by_credentials('beep@boop.com', 'booperino')).to eq(user1)
    end

    it 'returns nil if no user is found' do
      expect(User.find_by_credentials('football', 'football')).to be(nil)
    end
  end
end
