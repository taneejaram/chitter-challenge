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
       chitter = Chitter.create(name: 'user1', message: 'loooves tea')
       expect(Chitter.all.first.message).to eq('loooves tea')
     end
  end

end
