Rails.application.routes.draw do
  devise_for :users
# *1
  resources :messages do |message|
    resources :comments
  end 
# **
  root 'messages#index'

end

# 1)Les commentaires 'appartiennent' aux messages => nested resource 
#   On le voit bien dans les routes ex: 

#     message_comment GET    /messages/:message_id/comments/:id(.:format)      comments#show
