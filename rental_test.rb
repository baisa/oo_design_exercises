require "minitest/autorun"
require_relative "refactor.rb"

class TestRental < Minitest::Test
  def setup
    movie_1 = Movie.new("Hair", Movie::REGULAR)
    movie_2 = Movie.new("Titanic", Movie::NEW_RELEASE)
    movie_3 = Movie.new("Peppa", Movie::CHILDRENS)

    @customer_1 = Customer.new("Anna")

    rental_1 = Rental.new(movie_3, 4)
    rental_2 = Rental.new(movie_1, 10)
    rental_3 = Rental.new(movie_2, 1)

    @customer_1.add_rentals(rental_1)
    @customer_1.add_rentals(rental_2)
    @customer_1.add_rentals(rental_3)
  end

  def test_that_kitty_can_eat
    assert_equal expected_hash, @customer_1.calculate_hash
  end

  def expected_hash
    hash = {movies:[["Titanic", 3],["Peppa", 1], ["Hair", 0]], points: 3, total: 20.0}
  end
end