class Book < ApplicationRecord

	belongs_to :user

	# 1件のpostは複数のlikesを持つ(色々なユーザーが、1件のブログ記事にいいね！ をする)
	has_many :favorites, dependent: :destroy
	# 1件のpostが持つ複数のlikesを介して、複数のusersとつながっている(この記事にいいねした全てのユーザー)[自己結合/自己関連]
	has_many :favorited_users, through: :favorites, source: :user

	has_many :book_comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true,length: {maximum: 200}
end
