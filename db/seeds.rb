# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Categories

Category.where(title: 'Arts & Entertainment').first_or_create
Category.where(title: 'College & University').first_or_create
Category.where(title: 'Food,').first_or_create
Category.where(title: 'Food & Drink Shop').first_or_create
Category.where(title: 'Gym / Fitness Center').first_or_create
Category.where(title: 'Nightlife Spot').first_or_create
Category.where(title: 'Outdoors & Recreation').first_or_create
Category.where(title: 'Professional & Other Places').first_or_create
Category.where(title: 'Residence, Shop & Service').first_or_create
Category.where(title: 'School').first_or_create
Category.where(title: 'Shop & Service').first_or_create
Category.where(title: 'Travel & Transport').first_or_create
Category.where(title: 'Other').first_or_create

#Todas las preguntas en el sitio
question1 = Question.where(content: 'Piensa regresar nuevamente?').first_or_create
Response.where(content: 'Si', question_id: question1.id).first_or_create
Response.where(content: 'No', question_id: question1.id).first_or_create
Response.where(content: 'Porque', question_id: question1.id).first_or_create

question2 = Question.where(content: "Cual es su grado de satisfaccion?").first_or_create
Response.where(content: 'Muy Satisfecho', question_id: question2.id).first_or_create
Response.where(content: 'Satisfecho', question_id: question2.id).first_or_create
Response.where(content: 'Regular', question_id: question2.id).first_or_create
Response.where(content: 'Poco', question_id: question2.id).first_or_create

question3 = Question.where(content: "Como califica el servicio de nuestro personal?").first_or_create
Response.where(content: 'Muy Bueno', question_id: question3.id).first_or_create
Response.where(content: 'Bueno', question_id: question3.id).first_or_create
Response.where(content: 'Regular', question_id: question3.id).first_or_create
Response.where(content: 'Malo', question_id: question3.id).first_or_create

question4 = Question.where(content: "Como le parecieron nuestros precios?").first_or_create
Response.where(content: 'Muy Altos', question_id: question4.id).first_or_create
Response.where(content: 'Altos', question_id: question4.id).first_or_create
Response.where(content: 'Correctos', question_id: question4.id).first_or_create
Response.where(content: 'Bajos', question_id: question4.id).first_or_create


question5 = Question.where(content: "Que opina de nuestras instalaciones?").first_or_create
Response.where(content: 'Muy Buenas', question_id: question5.id).first_or_create
Response.where(content: 'Buenas', question_id: question5.id).first_or_create
Response.where(content: 'Regulares', question_id: question5.id).first_or_create
Response.where(content: 'Malas', question_id: question5.id).first_or_create


question6 = Question.where(content: "El tiempo de respuesta fue el esperado?").first_or_create
Response.where(content: 'No', question_id: question6.id).first_or_create
Response.where(content: 'Si', question_id: question6.id).first_or_create
