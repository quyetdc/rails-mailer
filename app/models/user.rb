class User < ActiveRecord::Base
	after_create :send_confirmed_email

	def send_confirmed_email
		ExampleMailer.sample_email(self).deliver
	end
end
