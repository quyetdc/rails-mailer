## README

### Intro
This is a tutorial project I created for simple sending email

### What I uses 

* rails action mailer

### Database

* user model: 
- name: string, email: string

### How to

* Change your email and password in config/environments/development.rb
* Create a sample user (in rails console) and open gmail inbox to see new comming email

### What need to be pointed out

* rails g mailer example_mailer

* change default mail in app/mailers/application_mailer.rb

* create a sample_mailer like this

```
# This will use sample_email.html.erb as email's content	
  def sample_email(user)
    @user = user
    # send email to user
    mail(to: @user.email, subject: 'Sample Email')
  end
```

* Create app/views/example_mailer/sample_email.html.erb

```
<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Hi <%= @user.name %></h1>
    <p>
      Sample mail sent using smtp.
    </p>
  </body>
</html>
```

* Config for sending email in app/environments/production.rb (or development.rb)

```
config.action_mailer.delivery_method = :smtp
# SMTP settings for gmail
config.action_mailer.smtp_settings = {
 :address              => "smtp.gmail.com",
 :port                 => 587,
 :user_name            => 'YOUR USER EMAIL',
 :password             => 'YOUR USER EMAIL PASSWORD',
 :authentication       => "plain",
:enable_starttls_auto => true
}
```

* Send email (in controller or model)
 
```
ExampleMailer.sample_email(@user).deliver

#or

class User < ActiveRecord::Base
	after_create :send_confirmed_email

	def send_confirmed_email
		ExampleMailer.sample_email(self).deliver
	end
end

```
