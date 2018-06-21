class Post < ApplicationRecord

# 유저는 여러개의 글을 가질 수 있다.  
# 글은 유저 1명을 가질 수 있다.        (post.rb)

    belongs_to :user            # user 1명을 가진다.

end
