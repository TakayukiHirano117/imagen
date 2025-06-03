class Image < ApplicationRecord
    # TODO: 画像のバリデーションを追加する
    validates :image, presence: true

    # TODO: Cloudinaryに画像を保存してそのURLをテーブルに保存するメソッドなどはここに記載する。

end
