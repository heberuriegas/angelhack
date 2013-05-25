namespace :db do
	desc "Fill database with sample data" 
	task populate: :environment do
    	99.times do |n|
    		name = Faker::Name.name
    		email = "prueba-#{n+1}@plusreports.org"
    		password = "password"
    		User.create!(name: name,
    					 email: email,
    					 password: password,
    					 password_confirmation: password)
    	end
        users = User.all(limit: 10)
        50.times do
            content = Faker::Lorem.sentence(5)
            users.each{|user| user.reports.create!(content: content, 
                                                   latitude: rand(25.686088..25.76774), 
                                                   longitude: rand(-100.530396..-100.085449)
                                                   )}
        end
    end
end