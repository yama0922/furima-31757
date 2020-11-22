require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "入力内容に不備がなければ登録できること" do
    expect(@user).to be_valid
  end

  it "nick_nameが空では登録できないこと" do
    @user.nic_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nick_name can't be blank")
  end

  it "emailが空では登録できないこと" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  
  it "emailに「＠」がない場合、登録できないこと" do
    @uesr.email = "test.gmail.com"
    user.valid?
    expect(user.errors[:email]).to include("は不正な値です")
  end   

  it "重複したemailが存在する場合登録できない" do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
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

  it "passwordが5文字以下であれば登録できないこと" do
    @user.password = "12345"
    @user.password_confirmation = "12345"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  
  it "passwordとpassword_confirmationが不一致では登録できないこと" do
    @user.password = "123456"
    @user.password_confirmation = "1234567"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "パスワードが英字１文字、数字１文字以上入っていないと進めない" do
    @uesr.password = "test.password.com"
    user.valid?
    expect(user.password_complexity).to include("は英字と数字をそれぞれ1文字以上含める必要があります")
  end
  
  it "last_nameが空では登録できないこと" do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last＿name can't be blank")
  end

  it "first_nameが空では登録できないこと" do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First＿name can't be blank")
  end

  it "last_name_kanaが空では登録できないこと" do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last＿name_kana can't be blank")
  end

  t "first_name_kanaが空では登録できないこと" do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First＿name_kana can't be blank")
  end


  t "birth_dateが空では登録できないこと" do
    @user.birth_date = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth_date can't be blank")
  end
  
  
  it "名字が全角で入力されていないと進めない(アルファベットver)" do
    @uesr.family_name = "test.family_name.com"
    user.valid?
    expect(user.errors[:family_name]).to include("は全角で入力してください")
  

# ↑半角文字一種類分でOK



    it "名前(カナ)が全角入力されていないと進めない(アルファベットver)" do
    @uesr.first_name_kana = "test.first_name.com"
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カタカナで入力してください")
    end
     
  
  
    it "名字（カナ）がカタカナで入力されていないと進めない（ひらがなver）" do
      @uesr.family_name_kana = "test.family_name.com"
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナで入力してください")
    end
  
    

    it "名前(カナ)がカタカナで入力されていないと進めない(ひらがなver)" do
      @uesr.first_name_kana = "test.first_name.com"
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カタカナで入力してください")
    end
  
    
  end
end