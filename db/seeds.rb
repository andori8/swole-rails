# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(id: 1, name: "Ryan", username:"andori", email:"andori@gmail.com", password:"admin", password_confirmation:"admin")
User.create(id: 2, name: "test", username:"test", email:"test@example.com", password: "password", password_confirmation: "password")
User.create(id: 3, name: "try", username:"try", email:"try@example.com", password: "password", password_confirmation: "password")

Workout.create(title: "Chest Pump", time: "30 minutes", user_id: 1)
Workout.create(title: "Leg Pump", time: "60 minutes", user_id: 2)
Workout.create(title: "Easy Mode", time: "10 minutes", user_id: 3)

Exercise.create(name:"Bench Press", sets: 5 , reps: 10, description:"great exercise", user_id: 1, category_id: 1)
Exercise.create(name:"Squat", sets: 3, reps: 12, description:"get killer legs", user_id: 2, category_id: 5)
Exercise.create(name:"Push Ups", sets: 5, reps: 12, description:"everybody should do these", user_id: 3, category_id: 1)


Category.create(name: "Chest")
Category.create(name: "Tris")
Category.create(name: "Back")
Category.create(name: "Bis")
Category.create(name: "Legs")
Category.create(name: "Shoulders")
Category.create(name: "Neck")
Category.create(name: "Glutes")
Category.create(name: "Calves")