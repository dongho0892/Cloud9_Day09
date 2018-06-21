Rails.application.routes.draw do
    root                       'board#index'
    get '/boards'           => 'board#index' # 전체목록 보기
    get '/board/new'        => 'board#new'      # :id 가 먼저오면 /new 를 파라미터로 보고 오류날 수 있음.
    get '/board/:id'        => 'board#show'     # board의 글 하나로 오면 show 액션으로 가고
    post '/boards'          => 'board#create'   #
    get '/board/:id/edit'   => 'board#edit' # 수정하기

    put '/board/:id'        => 'board#update'  # 둘다 수정이지만, put 은 전체 수정
    patch '/board/:id'      => 'board#update'   # patch는 부분 수정 
    # 똑같은 모양이지만 요청 방식이 다름.

    delete '/board/:id'     => 'board#destroy'

    # 가장 restful 하게 짜여진 라우팅.
    # '/board/:id' 가 get / put / patch 

    get '/users'        => 'user#index'     # 회원목록
    get '/sign_up'      => 'user#new'
    get '/sign_in'      => 'user#sign_in'   #
    post '/sign_in'     => 'user#login'     # 
    get '/logout'       => 'user#logout'     
    get '/user/:id'    => 'user#show'      # 회원정보 보여주는 화면
    post '/users'        => 'user#create'     # 회원목록

    get '/user/:id/edit'    => 'user#edit'
    put '/user/:id'         => 'user#update'
    patch '/user/:id'       => 'user#update'



#   #user - 한움이것
#     get '/users'            => 'user#index'     #Read
#     get '/sign_up'          => 'user#new'       #Create
#     post '/users'           => 'user#create'
#     get '/user/:id'         => 'user#show'      #Read
    
#     get '/user/:id/edit'    => 'user#edit'      #update
#     put '/user/:id'         => 'user#update'
#     patch '/user/:id'       => 'user#update'






    
    # get '/users'        => 'user#index'     # 회원목록
    # get '/user/new'     => 'user#new'       # 회원가입
    # post '/user/sign_up'  => 'user#sign_up'
    # get '/user/:id'    => 'user#show'      # 회원정보 보여주는 화면


end
