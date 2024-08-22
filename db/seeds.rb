# Seed Users
Task.destroy_all
Taskman.destroy_all
Client.destroy_all
User.destroy_all

users = [
  { email: "anas@gmail.com", password: "123456", user_name: "johndoe", first_name: "John", last_name: "Doe" },
  { email: "jane.smith@example.com", password: "123456", user_name: "janesmith", first_name: "Jane", last_name: "Smith" },
  { email: "mike.jones@example.com", password: "123456", user_name: "mikejones", first_name: "Mike", last_name: "Jones" },
  { email: "anna.brown@example.com", password: "123456", user_name: "annabrown", first_name: "Anna", last_name: "Brown" },
  { email: "david.white@example.com", password: "123456", user_name: "davidwhite", first_name: "David", last_name: "White" },
  { email: "laura.green@example.com", password: "123456", user_name: "lauragreen", first_name: "Laura", last_name: "Green" }
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
  { description: "Submit project report", position: "15 avenue Hassan II", destination: "Marrakech", client_id: clients[0].id, taskman_id: taskmen[0].id,  },
  { description: "Renew driving license", position: "10 rue de la Liberté", destination: "Casablanca", client_id: clients[1].id, taskman_id: taskmen[1].id },
  { description: "File tax returns", position: "50 avenue Mohammed V", destination: "Rabat", client_id: clients[2].id, taskman_id: taskmen[2].id },
  { description: "Register for conference", position: "123 boulevard Zerktouni", destination: "Tanger", client_id: clients[0].id, taskman_id: taskmen[1].id },
  { description: "Collect passport", position: "22 rue de Paris", destination: "Agadir", client_id: clients[1].id, taskman_id: taskmen[2].id },
  { description: "Submit visa application", position: "78 boulevard Anfa", destination: "Casablanca", client_id: clients[2].id, taskman_id: taskmen[0].id },
  { description: "Schedule medical appointment", position: "45 avenue des Fleurs", destination: "Fès", client_id: clients[0].id, taskman_id: taskmen[2].id },
  { description: "Renew ID card", position: "30 rue de Marrakech", destination: "Marrakech", client_id: clients[1].id, taskman_id: taskmen[0].id },
  { description: "Attend court hearing", position: "89 boulevard d'Anfa", destination: "Casablanca", client_id: clients[2].id, taskman_id: taskmen[1].id }
]

tasks.each do |task|
  Task.create!(task)
end

p "end seeding"
