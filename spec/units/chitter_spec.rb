require 'chitter'

describe Chitter do

  describe '#all' do

     it 'returns a list of peeps from the database' do
       connection = PG.connect(dbname: 'chitter_manager_test')
       connection.exec("INSERT INTO chitter (name, message) VALUES ('user1', 'loves tea')")

       chitter = Chitter.all
       expect(chitter.first.name).to include("user1")
       expect(chitter.first.message).to eq('loves tea')
     end
  end


  describe '#create' do

     it 'adds peeps to the database' do
       chitter = Chitter.create(name: 'user1', message: 'loooves tea', date: '2019-05-12')
       expect(Chitter.all.first.message).to eq('loooves tea')
     end

     it 'adds the date that a Peep was posted' do
       chitter = Chitter.create(name: 'user1', message: 'loooves tea', date: '2019-05-12')
       expect(Chitter.all.first.date).to eq('2019-05-12')
     end
  end

end
