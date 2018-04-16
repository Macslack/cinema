require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require('pry-byebug')
Customer.delete_all
Film.delete_all

customer1 = Customer.new({
  'name' => 'bob',
  'funds' => 10
  })
  customer1.save()
  customer2 =  Customer.new({
    'name' => 'bill',
    'funds' => 20
    })
    customer2.save()
    customer3 = Customer.new({
      'name' => 'john',
      'funds' => '30'
      })
      customer3.save()

      film1 = Film.new({
        'title' => 'The 120 Days of Sodom',
        'price' => '5'
        })
        film1.save()
        film2 = Film.new({
          'title' => 'A serbian film',
          'price' => '8'
          })
          film2.save()
          film3 = Film.new({
            'title' => 'the room',
            'price' => '10'
            })
            film3.save()

            ticket1 = Ticket.new({
              'customer_id' => customer1.id,
              'film_id' => film1.id
              })
              ticket1.save()
              ticket2 = Ticket.new({
                'customer_id' => customer2.id,
                'film_id' => film2.id
                })
                ticket2.save()
                ticket3 = Ticket.new({
                  'customer_id' => customer3.id,
                  'film_id' => film3.id
                  })
                  ticket3.save()
                  ticket4 = Ticket.new({
                    'customer_id' => customer1.id,
                    'film_id' => film1.id
                    })
                    ticket4.save()
                    binding.pry
                    nil
