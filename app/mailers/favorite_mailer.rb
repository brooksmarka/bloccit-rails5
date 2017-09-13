class FavoriteMailer < ApplicationMailer
  default from: "markabrooks@gmail.com"

  def new_comment(user, post, comment)

    headers["Message_ID"] = "<comments/#{comment.id}@aqueous-harbor-56142.example>"
    headers["In-Reply_To"] = "<post/#{post.id}@aqueous-harbor-56142.example>"
    headers["References"] = "<post/#{post.id}@aqueous-harbor-56142.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, cc: "brittany.martin@bloc.com", subject: "New comment on #{post.title}")
  end

  def new_post(post)

    headers["Message_ID"] = "<posts/#{post.id}@aqueous-harbor-56142.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@aqueous-harbor-56142.example"
    headers["References"] = "<post/#{post.id}@aqueous-harbor-56142.example"

    @post = post

    mail(to: post.user.email, cc:"brittany.martin@bloc.com", subject: "Your post, #{post.title}, has been favorited!")
  end

end
