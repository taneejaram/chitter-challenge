require 'pg'

class Chitter
  attr_reader :name, :message

  def initialize(name, message)
    @name = name
    @message = message
  end


  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peep| Chitter.new(peep['name'], peep['message'])}
  end


  def self.create(name: name, message: message)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    connection.exec("INSERT INTO chitter (name, message) VALUES ('#{name}', '#{message}')")
  end

end
