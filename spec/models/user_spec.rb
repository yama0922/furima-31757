require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "入力内容に不備がなければ登録できること" do
    expect(@user).to be_valid
  end

  it "nick_nameが空では登録できないこと" do
    @user.nickname = nil
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
    @user.password = "123aaa"
    @user.password_confirmation = "123aaa"
    expect(@user).to be_valid
  end

  it "passwordが5文字以下であれば登録できないこと" do
    @user.password = "123aaa"
    @user.password_confirmation = "123aa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  
  it "passwordとpassword_confirmationが不一致では登録できないこと" do
    @user.password = "123aaa"
    @user.password_confirmation = "123456a"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "パスワードが半角英字のみの場合登録できない" do
    @uesr.password = "123aaa"
    @user.password_confirmation = "aaaaaa"
    user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  
  it "パスワードが半角数字のみの場合登録できない" do
    @uesr.password = "123aaa"
    @user.password_confirmation = "123456"
    user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  
  t "パスワードが全角英数字の場合登録できない" do
    @uesr.password = "123aaa"
    @user.password_confirmation = "BB3AAA"
    user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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
  
    
    it "category_idが空では登録できないこと" do
      @user.category_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Category_id can't be blank")
    end
  
    t "sale_status_idが空では登録できないこと" do
      @user.sale_status_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Sale_status_id  can't be blank")
    end
  
    t "shipping_fee_status_idが空では登録できないこと" do
      @user.shipping_fee_status_id  = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Shipping_fee_status_id  can't be blank")
    end
   
    t "prefecture_idが空では登録できないこと" do
      @user.prefecture_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture_id  can't be blank")
    end
  
    t "scheduled_delivery_idが空では登録できないこと" do
      @user.scheduled_delivery_id  = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Scheduled_delivery_id  can't be blank")
    end
    
  
  end
end