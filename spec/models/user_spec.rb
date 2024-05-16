require 'rails_helper'

RSpec.describe User, type: :model do
  it 'nicknameが空では登録できない' do
    user = User.new(nickname: '', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    user.valid?
    expect(user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'emailが空では登録できない' do
    user = User.new(nickname: 'testuser', email: '', password: 'password123', password_confirmation: 'password123')
    user.valid?
    expect(user.errors.full_messages).to include("Email can't be blank")
  end

  it 'last_nameが空では登録できない' do
    user = User.new(nickname: 'testuser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '')
    user.valid?
    expect(user.errors.full_messages).to include("Last name can't be blank")
  end

  it 'first_nameが空では登録できない' do
    user = User.new(nickname: 'testuser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', first_name: '')
    user.valid?
    expect(user.errors.full_messages).to include("First name can't be blank")
  end

  it 'last_name_kanaが空では登録できない' do
    user = User.new(nickname: 'testuser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name_kana: '')
    user.valid?
    expect(user.errors.full_messages).to include("Last name kana can't be blank")
  end

  it 'last_name_kanaが全角でない場合登録できない' do
    user = User.new(nickname: 'testuser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name_kana: 'Yamada')
    user.valid?
    expect(user.errors.full_messages).to include("Last name kana は全角で入力して下さい。")
  end

  it 'first_name_kanaが空では登録できない' do
    user = User.new(nickname: 'testuser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', first_name_kana: '')
    user.valid?
    expect(user.errors.full_messages).to include("First name kana can't be blank")
  end

  it 'first_name_kanaが全角でない場合登録できない' do
    user = User.new(nickname: 'testuser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', first_name_kana: 'Taro')
    user.valid?
    expect(user.errors.full_messages).to include("First name kana は全角で入力して下さい。")
  end

  it 'birthdateが空では登録できない' do
    user = User.new(nickname: 'testuser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', birthdate: '')
    user.valid?
    expect(user.errors.full_messages).to include("Birthdate can't be blank")
  end

  it 'passwordが不正なフォーマットの場合登録できない' do
    user = User.new(nickname: 'testuser', email: 'test@example.com', password: 'password', password_confirmation: 'password')
    user.valid?
    expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
  end
end

