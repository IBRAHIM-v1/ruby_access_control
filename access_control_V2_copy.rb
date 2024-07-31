# Constants for user authentication
EMAIL = "collin@example.com"
PASSWORD = "goskate"
PASSWORD_VAULT = {aws: {username: "collin", password: "asdfasdf"}}

# Welcome message
def welcome_message
    puts "Welcome to Access Control - A Password Manager"
end

# Prompts user for email
def prompt_user_for_email
    puts "Please sign in to continue"
    print "Enter email: "
    gets.chomp
end

# Verifies the entered email against the stored email
def verify_user_email(user_email)
    if user_email != EMAIL
        puts "Invalid email"
        exit
    end
end

# Prompts user for password
def prompt_user_for_password
    print "Enter password: "
    gets.chomp
end

# User Password Authentication
def verify_user_password(user_password)
    if user_password != PASSWORD
        puts "Invalid password"
        exit
    end
end

# Greets the user after successful login
def greet_user(user_email) 
    puts "Hello, #{user_email}."
    puts "What would you like to do?"
end

# Displays the main menu options to the user
def menu_options
    puts "1. Add new service credentials"
    puts "2. Retrieve an existing services credentials"
    puts "3. Exit"
end

# Catchs user's input for menu options
def get_user_menu_selection
    gets.chomp
end

# Handles the user's input for menu selection
def handle_user_selection(user_selection)
    case user_selection
    when "1"
        # Add new service credentials
        new_service = set_new_service_name
        set_username_for(new_service)
        set_password_for(new_service)
        display_service_credentials(new_service, PASSWORD_VAULT[new_service.to_sym])
    when "2"
        # Retrieve existing service credentials
        requested_service_name = retrieve_service_name
        credentials = retrieve_service_credentials_for(requested_service_name)
        display_service_credentials(requested_service_name, credentials)
    else
        exit_program
    end
end

def set_new_service_name
    print "Enter the name of the new service: "
    new_service = gets.chomp
    PASSWORD_VAULT[new_service.to_sym] = {}
    new_service
end

def set_username_for(service)
    print "Please enter the username for this new service: "
    new_service_username = gets.chomp
    PASSWORD_VAULT[service.to_sym][:username] = new_service_username
end
 
def set_password_for(service)
    print "Please enter the password for this new service: "
    new_service_password = gets.chomp
    PASSWORD_VAULT[service.to_sym][:password] = new_service_password
    puts "Service credentials added successfully for #{service}."
end

def retrieve_service_name
    print "Please enter the name of the service you wish to access credentials for: "
    gets.chomp
end

def retrieve_service_credentials_for(service_name)
    PASSWORD_VAULT[service_name.to_sym]
end

def display_service_credentials(service_name, credentials)
    unless credentials.nil?
        puts "Here is the credentials for #{service_name}"
        credentials.each do |key, val|
            puts "#{key}: #{val}"
        end
    else
        puts "Service Not Found"
        exit
    end
end

def exit_program
    # Exit the program
    puts "Exiting the program. Goodbye."
    exit
end



welcome_message
user_email = prompt_user_for_email
verify_user_email(user_email)
user_password = prompt_user_for_password
verify_user_password(user_password)
greet_user(user_email)
menu_options
user_selection = get_user_menu_selection
handle_user_selection(user_selection)

loop do 
    menu_options
    user_selection = get_user_menu_selection
    handle_user_selection(user_selection)
end