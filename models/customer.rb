require_relative("../db/sql_runner")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end
  
  def save()
    sql = "INSERT INTO customers
    (
      name, funds
    )
    values
    (
      $1, $2
    )
    RETURNING id;"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.map_customers(customer_data)
    return customer_data.map {|customer_hash| Customer.new(customer_hash)}
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = Customer.map_customers(customers)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets on films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map {|film_hash| Film.new(film_hash)}
  end
  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
  def update()
    sql = "UPDATE customers SET (name, funds) =($1, $2) WHERE id = $3;"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end
  def decrease_funds(film)
    answer = @funds - film.price.to_i
    sql = "UPDATE customers SET funds = $1 WHERE id = $2;"
    values = [answer, @id]
    SqlRunner.run(sql, values)
  end
end
