class BoardController < ApplicationController
#06.21
  before_action :set_post, only: [:show, :edit, :update, :destroy]
                          # [: ,:, :, :, ] 일때만    /   # 심볼이 됨.
                          # 액션을 실행하기 전에 동작 가능함.
#  before_action :set_post, except: [:index, :new, :create]

# 로그인 된 상태에서만 접속할 수 있는 페이지는?
# index, show만 로그인 하지 않은 상태에서 볼 수 있게
# 나머지는 반드시 로그인이 필요하게.
  before_action :authenticate_user, except: [:index, :show]
##########  

  def index
    @posts = Post.all
#06.21
    p current_user        # current_user를 호출해서 이용함
                    # p를 쓰면 내용물을 싹다 보여줌
#####               # puts 를 쓰면 값만
  end

  def show
    # @post = Post.find(params[:id])      # model 명으로!!
    # set_post      => 맨 위에 before_action으로 지정됨. (필터로)
    puts @post
  end

  def new
  end

  def edit
#    @post = Post.find(params[:id])
    # set_post      => 맨 위에 before_action으로 지정됨. (필터로)
  end
  
  def create
    post = Post.new       # 빈 껍데기
    post.title = params[:title]
    post.contents = params[:contents]
#06.21
  # post를 등록 할 떄 이 글을 작성한 사람은
  # 현재 로그인 되어 있는 유저이다.
    post.user_id = current_user.id
#####    
    post.save             # 빈 껍데기 채워주기.
      
    redirect_to "/board/#{post.id}"          

  end
  
  def update
    # @post = Post.find(params[:id])     # 원래 있던 것을 찾아서 내용을 바꿔줌.
    # set_post      => 맨 위에 before_action으로 지정됨. (필터로)
    
    @post.title = params[:title]
    @post.contents = params[:contents]
    @post.save
    redirect_to "/board/#{post.id}"
  end
  
  def destroy
    # @post = Post.find(params[:id])   # 원래 있던 것을 찾아서 지우고 전체 목록으로..
    # set_post   => 맨 위에 before_action으로 지정됨. (필터로)
  
    @post.destroy
    redirect_to "/boards"
  end


    # 가장 CRUD 코드임!
  
  
  
  
  def set_post

    @post = Post.find(params[:id])      # 다른 곳에서 불려지면 계속 유지가 됨.
  end  



end
