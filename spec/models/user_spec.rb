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

  it "email@があれば登録できること" do
    @user.email = "@"
    @user.email_confirmation = "@"
    expect(@user).to be_valid
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
    user = build(:user,password: "aaaaaaa",password_confirmation: "aaaaaaa")
    user.valid?
    expect(user.password_complexity).to include("は英字と数字をそれぞれ1文字以上含める必要があります")
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

  it "名字が全角で入力されていないと進めない(アルファベットver)" do
    user = build(:user,family_name: "yamada")
    user.valid?
    expect(user.errors[:family_name]).to include("は全角で入力してください")
  
  it "名字が全角で入力されていないと進めない(半角ｶﾀｶﾅver)" do
      user = build(:user,family_name: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:family_name]).to include("は全角で入力してください")
    end
    it "名前(カナ)が全角入力されていないと進めない(アルファベットver)" do
      user = build(:user,given_name_kana: "tarou")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は全角カタカナで入力してください")
    end
     
    it "名前(カナ)が全角入力されていないと進めない(半角ｶﾀｶﾅver)" do
      user = build(:user,given_name_kana:"ﾀﾛｳ")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は全角カタカナで入力してください")
    end
  
    it "名字（カナ）がカタカナで入力されていないと進めない（ひらがなver）" do
      user = build(:user,family_name_kana: "やまだ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナで入力してください")
    end
  
    it "名字（カナ）がカタカナで入力されていないと進めない(漢字ver)" do
      user = build(:user,family_name_kana: "山田")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナで入力してください")
    end

    it "名前(カナ)がカタカナで入力されていないと進めない(ひらがなver)" do
      user = build(:user,given_name_kana: "たろう")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は全角カタカナで入力してください")
    end
  
    it "名前(カナ)がカタカナで入力されていないと進めない(漢字ver)" do
      user = build(:user,given_name_kana:"ﾀﾛｳ")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は全角カタカナで入力してください")
    end
  
  end
end