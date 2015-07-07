class ExampleMailer < ApplicationMailer

  # This will use sample_email.html.erb as email's content	
  def sample_email(user)
    @user = user
    # send email to user
    mail(to: @user.email, subject: 'Sample Email')
  end

end
