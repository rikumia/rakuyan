require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit new_user_session_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Sign up')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in '会社名', with: @user.company
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（確認用）', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      expect(
        find('.user_nav').find('span').hover
      ).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  #   it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
  #     # トップページに遷移する
  #     visit root_path
  #     # ログインしていない場合、サインインページに遷移していることを確認する
  #     expect(current_path).to eq(new_user_session_path)
  #   end
  # end

  #   it 'ログインに成功し、トップページに遷移する' do
  #     # 予め、ユーザーをDBに保存する
  #     @user = FactoryBot.create(:user)
  #     # サインインページへ移動する
  #     visit  new_user_session_path
  #     # ログインしていない場合、サインインページに遷移していることを確認する
  #     expect(current_path).to eq(new_user_session_path)
  #     # すでに保存されているユーザーのemailとpasswordを入力する
  #     fill_in 'user_email', with: @user.email
  #     fill_in 'user_password', with: @user.password
  #     # ログインボタンをクリックする
  #     click_on('Log in')
  #     # トップページに遷移していることを確認する
  #     expect(current_path).to eq(root_path)
  #   end
  end
end
