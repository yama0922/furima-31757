require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
    expect(@user).to be_valid
  end

  it "nick_nameが空では登録できないこと" do
    @user.nic_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nic_name can't be blank")
  end

  it "emailが空では登録できないこと" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "@が空では登録できないこと" do
    @user.@ = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("@ can't be blank")
  end
  
  it "passwordが空では登録できないこと" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it "passwordが6文字以上であれば登録できること" do
    @user.password = "123456"
    @user.password_confirmation = "123456"
    expect(@user).to be_valid
  end


  it "passwordとpassword_confirmationが不一致では登録できないこと" do
    @user.password = "123456"
    @user.password_confirmation = "1234567"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "last_nameが空では登録できないこと" do
    @user.nic_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last＿name can't be blank")
  end

  it "first_nameが空では登録できないこと" do
    @user.nic_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First＿name can't be blank")
  end

  it "last_name_kanaが空では登録できないこと" do
    @user.nic_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last＿name_kana can't be blank")
  end

  t "first_name_kanaが空では登録できないこと" do
    @user.nic_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First＿name_kana can't be blank")
  end

  t "first_name_kanaが空では登録できないこと" do
    @user.nic_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First＿name_kana can't be blank")
  end

  t "birth_dateが空では登録できないこと" do
    @user.nic_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth_date can't be blank")
  end
  
  it 'password:半角英数混合(半角英語のみ)' do
    @user.password = 'aaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
  end

 end
end