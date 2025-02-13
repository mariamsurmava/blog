# frozen_string_literal: true

# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @comment = Comment.find(params[:comment][:id])
    @article = Article.find(params[:comment][:article_id])
    @user = User.find(@comment.user_id)
    "#{@user.user_name} #{t("commented on")} #{@article.title.truncate_words(10)}"
  end
end
