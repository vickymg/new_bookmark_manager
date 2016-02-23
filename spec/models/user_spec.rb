describe User do

  let!(:user) do
  User.create(email: 'example@example.com',
              username: 'example_user',
              password: 'pa$$word',
              password_confirmation: 'pa$$word')
  end

  it 'saves a password recovery token when we generate a token' do
    expect{user.generate_token}.to change{user.password_token}
  end

  it 'saves a password recovery token time when token is generated' do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.now
    end
  end

  it 'can find a user with a valid token' do
    user.generate_token
    expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it 'can\'t find a user with a token over 1 hour in the future' do
    user.generate_token
    Timecop.travel(60*60+1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end

end
