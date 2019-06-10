require 'pg'

class Chitter
  attr_reader :name, :message, :date

  def initialize(name, message, date)
    @name = name
    @message = message
    @date = date
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peep| Chitter.new(peep['name'], peep['message'], peep['date'])}
  end


  def to_s
    "#{@name}: #{@message} #{@date}"
  end


  def self.create(name:, message:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    connection.exec("INSERT INTO chitter (name, message, date) VALUES ('#{name}', '#{message}', '#{date}')")
  end

end
