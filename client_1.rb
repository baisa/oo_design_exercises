require_relative "refactor.rb"

movie_1 = Movie.new("Hair", Movie::REGULAR)
movie_2 = Movie.new("Titanic", Movie::NEW_RELEASE)
movie_3 = Movie.new("Peppa", Movie::CHILDRENS)

customer_1 = Customer.new("Anna")

rental_1 = Rental.new(movie_3, 4)
rental_2 = Rental.new(movie_1, 10)
rental_3 = Rental.new(movie_2, 1)


customer_1.add_rentals(rental_1)
customer_1.add_rentals(rental_2)
customer_1.add_rentals(rental_3)

puts customer_1.statement
puts customer_1.short_statement
puts "----\n"
puts customer_1.hash_statement