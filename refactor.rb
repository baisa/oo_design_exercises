class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end
end

class Rental

  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end
end

class Customer

  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rentals(arg)
    @rentals << arg
  end

  def statement
    # hash = {movies:[["titanic", 3],["Peppa", 1]], points: 3, total: 20.0}
    hash = calculate_hash
    result = "Rental Record for #{@name}\n"

    hash[:movies].each do |movie|
      result += "\t #{movie[0]} #{movie[1]}\n"
    end

    result += "Amount owed is #{hash[:total]}\n"
    result += "You earned #{hash[:points]} frequent renter points"
    result
  end

  def short_statement
    hash = calculate_hash
    result = ""
    result += "Amount owed is #{hash[:total]}\n"
    result += "You earned #{hash[:points]} frequent renter points"
    result
  end

  def calculate_hash
    hash = {}
    table = []
    total_amount, frequent_renter_points = 0, 0
    @rentals.each do |element|
      this_amount = 0
      case element.movie.price_code
      when Movie::REGULAR
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
      when Movie::NEW_RELEASE
        this_amount += element.days_rented * 3
      when Movie::CHILDRENS
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end
      table << [element.movie.title, this_amount.to_s]
      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end
      total_amount += this_amount
    end
    #tried this
    #@rentals.each do |element|
     # table << [element.movie.title, element.this_amount.to_s]
    #end
    hash[:movies] = table
    hash[:points] = frequent_renter_points
    hash[:total] = total_amount
    hash 
  end
end



