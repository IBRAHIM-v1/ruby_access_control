# Constants for user authentication
EMAIL = "collin@example.com"
PASSWORD = "goskate"
PASSWORD_VAULT = {aws: {username: "collin", password: "asdfasdf"}}

# Welcome message
puts "Welcome to Access Control - A Password Manager"

# === User Authentication ===
puts "Please sign in to continue"
print "Enter email: "

user_email = gets.chomp

if user_email == EMAIL
    print "Enter Password: "
    user_password = gets.chomp
else
    puts "Invalid email"
    exit
end

if user_password == PASSWORD 
    puts "Hello, #{user_email}."
    # === Main Menu ===
    puts "What would you like to do?"
    puts "1. Add new service credentials"
    puts "2. Retrieve an existing services credentials"
    puts "3. Exit"
    user_selection = gets.chomp
else
    puts "Invalid Password"
    exit
end

# === Handle User Selection ===
case user_selection
when "1"
    # Add new service credentials
    print "Enter the name of the new service: "
    new_service = gets.chomp
    PASSWORD_VAULT[new_service] = {}

    print "Please enter the username for this new service: "
    new_service_username = gets.chomp
    PASSWORD_VAULT[new_service]["username"] = new_service_username

    print "Please enter the password for this new service: "
    new_service_password = gets.chomp
    PASSWORD_VAULT[new_service]["password"] = new_service_password
    puts "Service credentials added successfully for #{new_service}."
when "2"
    # Retrieve existing service credentials
    print "Please enter the name of the service you wish to access credentials for: "
    requested_service_name = gets.chomp
    credentials = PASSWORD_VAULT[requested_service_name.to_sym]

    unless credentials.nil? 
        puts "Here is the credentials for #{requested_service_name}"
        credentials.each do |key, val|
            puts "#{key}: #{val}"
        end
    else 
        puts "Service not found."
    end
    else
        # Exit the program
        puts "Exiting the program. Goodbye."
end