Chitter Challenge
=================

Tan's Unfinished Solution

Features:
-------

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter


As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

Initially created an end-point '/home' which displays posts. It also contains parameters 'name', 'message' and 'date' that get saved in the database. the display method in chitter.rb contains the logic behind this.
```  
def self.all
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_manager_test')
  else
    connection = PG.connect(dbname: 'chitter_manager')
  end

  result = connection.exec("SELECT * FROM chitter;")
  result.map { |peep| Chitter.new(peep['name'], peep['message'], peep['date'])}
end
```

To allow the user to enter the date, I used a website Bootstrap in the view 'https://v4-alpha.getbootstrap.com/components/forms/' to get the form.

The end-point '/written-peep' was created to allow the data to save and redirects the user back to home where they can see their peep in the list of posts.
```
post '/written-peep' do
  Chitter.create(name: params['name'], message: params['message'], date: params['date'])
  erb :peep
  redirect '/home'
end
```

Here this uses the Chitter.create method to interact with the database table.

Next I added the end-point '/logged-in' which contains a form to allow users to log-in. My next step would be to save the username and password variables in another database table.
