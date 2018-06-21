class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_signed_in?
   # 헬퍼메서드에 이름을 지정해 줘야지 view에서 사용이 가능함.
  
  # 현재 로그인 된 상태니?
  # 로그인이 되어있지 않으면 로그인하는 페이지로 이동 시켜줘.
    def user_signed_in?             # => true or false 로 결과값이 나올 것임
           # 존재하니?
        if session[:user_id].present? 
        else
            redirect_to '/sign_in'
        end
        session[:user_id].present?
    end
    
    # 로그인이 되어있지 않으면 로그인 하는 페이지로 이동시켜줌
    def authenticate_user
        unless user_signed_in?
            redirect_to "/sign_in"
        end
    end

    
  # 현재 로그인 된 사람이 누구니?  => 값을 리턴해야됨. 
    def current_user
        # 현재 로그인 했니?
        if user_signed_in?   # 메서드 호출해서 코드 반복 없이 바로 사용한다.
            @current_user = User.find(session[:user_id])
            
        else 

        end
    end
end
