class User < ApplicationRecord

# 유저는 여러개의 글을 가질 수 있다.   (user.rb)
# 글은 유저 1명을 가질 수 있다.

    has_many :posts               # posts 여야만 함!

end
