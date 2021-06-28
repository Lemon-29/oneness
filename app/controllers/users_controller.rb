class UsersController < ApplicationController
  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com', name: 'Guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def admin_sign_in
    user = User.find_or_create_by!(name: "admin", email: "admin@gmail.com", admin: true) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to posts_path, notice: '管理者ユーザーとしてログインしました。'
  end

end
