require "minitest/autorun"
require_relative "../lib/application.rb"

class TestRental < Minitest::Test
  def setup
    movie_1 = Movie.new("Hair", Movie::REGULAR)
    movie_2 = Movie.new("Titanic", Movie::NEW_RELEASE)
    movie_3 = Movie.new("Peppa", Movie::CHILDRENS)

    @rental_1 = Rental.new(movie_1, 10)
    @rental_2 = Rental.new(movie_2, 1)
    @rental_3 = Rental.new(movie_3, 4)

  end

  def test_charge
    assert_equal 14, @rental_1.charge
    assert_equal 3, @rental_2.charge
    assert_equal 3.0, @rental_3.charge
  end

end

