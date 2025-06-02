class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # 新規登録後の遷移先をカスタマイズ
  def after_sign_up_path_for(resource)
    images_path
  end

  # ログイン後の遷移先をカスタマイズ（必要に応じて）
  def after_sign_in_path_for(resource)
    images_path
  end
end
