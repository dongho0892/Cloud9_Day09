class UserController < ApplicationController
    
    def index
        @users = User.all
#       @login_user = User.find(session[:user_id]) if session[:user_id]          # 현재 로그인 된 유저 봐보기

        @current_user = User.find(session[:user_id]) if session[:user_id]

    end

    def show
        @user = User.find(params[:id])
    end

    def new
    end

    def create
        user = User.new
        user.u_id = params[:user_id]
        user.u_password = params[:password]
        user.ip_address = request.ip
        user.save
        redirect_to "/user/#{user.id}"
    end

    def edit
        @user  =User.find(params[:id])
    end
    
    def update
        user = User.find(params[:id])
        user.u_password = (param[:password])
        user.save
        redirect_to "user/#{user.id}"
    end

    # def sign_up
    #     user = User.new 
    #     user.u_id       = params[:user_id]
    #     user.u_password = params[:password]
    #     user.ip_address = request.ip
    #     user.save

    #     redirect_to "/user/#{user.id}"
            
    # end
    
    def sign_in         # 빈 껍데기 
#2차    # 로그인이 되어있는지 확인하고
        # 로그인이 되어있으면 원래 페이지로 돌아가기.


# 1차    # session.delete(:user_id)
    end
    
    
    
    def login           # 아이디가 맞는지, 패스워드가 맞는지, 이 사람이 몇번 유저인지만 쳐주면 됨.
# 2차
        # 유저가 입력한 ID, PW를 바탕으로 실제로 로그인이 이루어지는 곳
        id = params[:user_id]
        pw = params[:password]
        user = User.find_by_u_id(id) # user입력한 id로 찾아서 그 id 값을 넣어줌.
        
            # 해당 user_id 로 가입한 유저가 있고, 패스워드도 일치하는 경우
        if !user.nil? and user.u_password.eql?(pw) # 값이 있으면 
            session[:user_id] = user.id                 # 찾은 값의 table id를 넣어줌. ()
        #   session[:login_user, current_user 등등 써도 됨 ]
            flash[:success] = "로그인에 성공하였습니다."
            redirect_to "/users"
            
        else    # 가입한 유저 아이디가 없거나, 패스워드가 틀린 경우 
            flash[:error] = "가입된 유저가 아니거나, 비밀번호가 틀립니다."
            redirect_to "/sign_in"
        end
# 1차
        # user = User.find_by_u_id(params[:user_id])          # 여기 값이 비어있으면 에ㄴ러가 발생함!
        # #           find_by_u_id
        # #           find_by_u_password      
        
        # if !user.nil? and user.u_password.eql?(params[:password])
        #   # user가 비어있지않거나 = 뭔가 있을 때 / user 비밀번호가 맞는 경우
        #     flash[:success] = "로그인 되었습니다."
        #     session[:user_id] = user.id     # session[:user_id] 얘가 차있는 순간 로그인이 된 것임.
        #         # 이 사람의 유저번호만 세션에 저장해서 
        #     redirect_to "/users"        # + 현재 로그인 된 유저 확인해보기.
        
            
        # else        # user가 비어있거나 비밀번호가 틀린 경우
        #     flash[:error] = "아이디가 없거나 비밀번호가 틀립니다."
        #     redirect_to "/sign_in"
        # end
    end
    

    
    def logout
        session.delete(:user_id)
        flash[:success] = "로그아웃에 성공했습니다."
        redirect_to '/users'
    end
    
        
end