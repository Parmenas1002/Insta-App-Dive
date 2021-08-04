class RegisterMailer < ApplicationMailer
    def register_mail(post)
        @post = post
        mail to: @post.user.email, subject: "Adding new Post" 
    end
end
