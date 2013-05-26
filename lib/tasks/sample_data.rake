namespace :db do
	desc "Fill database with sample data" 
	task populate: :environment do
        # admins
        User.create(email: "iosdsv@gmail.com", password: "Sosads.12", password_confirmation: "Sosads.12", role: 0)
        User.create(email: "ever@noreplay.com", password: "1234", password_confirmation: "1234", role: 0)
        # Usuarios
    	100.times do |n|
    		email = "prueba-#{n+1}@angelhack.org"
    		password = "password"
    		User.create!(email: email,
    					 password: password,
    					 password_confirmation: password)
    	end
        #Reportes
        100.times do |n|
            name_data = Faker::Lorem.sentence(1)
            content = Faker::Lorem.sentence(5)
            Report.create!(content: content, user_id: n, venue_id: n)
        end
        #Votos
        100.times do |n|
            Vote.create!(report_id:n,user_id:n,calification:[true, false].sample)
        end
        #Comentarios
        100.times do |n|
            content = Faker::Lorem.sentence(2)
            Comment.create!(description:content, report_id:n, user_id:n)
        end
    end
end