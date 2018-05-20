class CommentsController < ApplicationController
  before_action :find_message 
  before_action :find_comment, only:[:edit, :update, :destroy]
  before_action :authenticate_user!


  def create 
    @comment = @message.comments.create(comment_params)#2*
    @comment.user_id = current_user.id #4*

    if @comment.save
      redirect_to message_path(@message)
    end 
  end 

  def edit 
  end

  def update
    if @comment.update(comment_params)
      redirect_to message_path(@message)
    else 
      render 'edit'
    end 
  end 
  
  def destroy 
    @comment.destroy
      redirect_to message_path
  end

  private 
    def comment_params  #3*
      params.require(:comment).permit(:content)
    end 

    def find_message
      @message = Message.find(params[:message_id])
    end

    def find_comment
      @comment = @message.comments.find(params[:id])
    end
end

# 1 : trouver le message qui est à la source du commentaire
# 2 : Créer un commentaire relatif à ce message 
# 3 : definir la methode qui contient les attributs nécessaires à la création d'un commentaire.
# 4 : Lier le commentaire à son auteur (l'utilisateur actuel)