require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it '入力内容に不備がなければ登録できること' do
    expect(@user).to be_valid
  end

  it 'nick_nameが空では登録できないこと' do
    @user.nickname = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'emailが空では登録できないこと' do
    @user.email = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'emailに「＠」がない場合、登録できないこと' do
    @user.email = 'test.gmail.com'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end

  it '重複したemailが存在する場合登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

  it 'passwordが空では登録できないこと' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordが6文字以上であれば登録できること' do
    @user.password = '123aaa'
    @user.password_confirmation = '123aaa'
    expect(@user).to be_valid
  end

  it 'passwordが5文字以下であれば登録できないこと' do
    @user.password = '123aa'
    @user.password_confirmation = '123aa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it 'passwordとpassword_confirmationが不一致では登録できないこと' do
    @user.password = '123aaa'
    @user.password_confirmation = '123456a'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'パスワードが半角英字のみの場合登録できない' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
  end

  it 'パスワードが半角数字のみの場合登録できない' do
    @user.password = '123aaa'
    @user.password_confirmation = '123456'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'パスワードが全角英数字の場合登録できない' do
    @user.password = '123aaa'
    @user.password_confirmation = 'BB3AAA'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'last_nameが空' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
  end
  it 'last_nameが半角' do
    @user.last_name = 'yakiniku'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
  end
  it 'first_nameが空' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
  end
  it 'first_nameが半角' do
    @user.first_name = 'yakiniku'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
  end
  it 'last_name_kanaが空' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana 全角カタカナのみで入力して下さい')
  end
  it 'last_name_kanaが漢字' do
    @user.last_name_kana = '山田'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
  end
  it 'last_name_kanaが平仮名' do
    @user.last_name_kana = 'やまだ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
  end
  it 'last_name_kanaが半角' do
    @user.last_name_kana = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
  end
  it 'first_name_kanaが空' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana 全角カタカナのみで入力して下さい')
  end
  it 'first_name_kanaが漢字' do
    @user.first_name_kana = '太朗'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
  end
  it 'first_name_kanaが平仮名' do
    @user.first_name_kana = 'たろう'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
  end
  it 'first_name_kanaが半角' do
    @user.first_name_kana = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
  end
  it 'birth_dateが空' do
    @user.birth_date = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end