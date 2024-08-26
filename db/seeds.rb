# Seed Users
Task.destroy_all
Taskman.destroy_all
Client.destroy_all
User.destroy_all

users = [
  { email: "anas@gmail.com", password: "123456", user_name: "johndoe", phone_number: "+21261123123", first_name: "John", last_name: "Doe" },
  { email: "jane.smith@example.com", password: "123456", user_name: "janesmith", phone_number: "+21261123123", first_name: "Jane", last_name: "Smith" },
  { email: "mike.jones@example.com", password: "123456", user_name: "mikejones", phone_number: "+21261123123", first_name: "Mike", last_name: "Jones" },
  { email: "anna.brown@example.com", password: "123456", user_name: "annabrown", phone_number: "+21261123123", first_name: "Anna", last_name: "Brown" },
  { email: "david.white@example.com", password: "123456", user_name: "davidwhite", phone_number: "+21261123123", first_name: "David", last_name: "White" },
  { email: "laura.green@example.com", password: "123456", user_name: "lauragreen", phone_number: "+21261123123", first_name: "Laura", last_name: "Green" }
]


p "start seeding"
users.each do |user|
  User.create!(user)
end

# Seed Clients
clients = User.limit(3).map do |user|
  Client.create!(user_id: user.id)
end

# Seed Taskmen
taskmen = User.offset(3).limit(3).map do |user|
  Taskman.create!(user_id: user.id)
end

# Seed Tasks
tasks = [
  { title: "Submit1", category: "Others", description: "Submit project report", from: "15 avenue Hassan II", to: "Marrakech", client_id: clients[0].id, taskman_id: taskmen[0].id,  },
  { title: "Submit2", category: "Specials", description: "Renew driving license", from: "10 rue de la Liberté", to: "Casablanca", client_id: clients[1].id, taskman_id: taskmen[1].id },
  { title: "Submit3", category: "Others", description: "File tax returns", from: "50 avenue Mohammed V", to: "Rabat", client_id: clients[2].id, taskman_id: taskmen[2].id },
  { title: "Submit4", category: "Specials", description: "Register for conference", from: "123 boulevard Zerktouni", to: "Tanger", client_id: clients[0].id, taskman_id: taskmen[1].id },
  { title: "Submit5", category: "Others", description: "Collect passport", from: "22 rue de Paris", to: "Agadir", client_id: clients[1].id, taskman_id: taskmen[2].id },
  { title: "Submit6", category: "Documents", description: "Submit visa application", from: "78 boulevard Anfa", to: "Casablanca", client_id: clients[2].id, taskman_id: taskmen[0].id },
  { title: "Submit7", category: "Packages", description: "Schedule medical appointment", from: "45 avenue des Fleurs", to: "Fès", client_id: clients[0].id, taskman_id: taskmen[2].id },
  { title: "Submit8", category: "Documents", description: "Renew ID card", from: "30 rue de Marrakech", to: "Marrakech", client_id: clients[1].id, taskman_id: taskmen[0].id },
  { title: "Submit9", category: "Packages", description: "Attend court hearing", from: "89 boulevard d'Anfa", to: "Casablanca", client_id: clients[2].id, taskman_id: taskmen[1].id }
]

tasks.each do |task|
  Task.create!(task)
end

p "end seeding"
