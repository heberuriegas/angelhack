namespace :db do
	desc "Fill database with sample data" 
	task populate: :environment do
    	# 99.times do |n|
    	# 	email = "prueba-#{n+1}@angelhack.org"
    	# 	password = "password"
    	# 	User.create(email: email,
    	# 				 password: password,
    	# 				 password_confirmation: password)
    	# end
        User.create(email: "iosdsv@gmail.com", password: "Sosads.12", password_confirmation: "Sosads.12")
        r = Random.new
        50.times do |n|
            content = Faker::Lorem.sentence(5)
            name = Faker::Lorem.sentence(1)
            lat = r.rand(25.686088..25.76774)
            long = r.rand(-100.530396..-100.085449)
            Report.create!(content: content, latitude: lat, longitude: long, name: name)
        end
    end
end