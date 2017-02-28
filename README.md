# URLockBox

This is an app for tracking links you'd like to read as well as whether or not you have read them.
Visit in production: [https://rocky-sea-61967.herokuapp.com/](https://rocky-sea-61967.herokuapp.com/)

# How to install

### First: 
Pick your favorite directory, then:

`git clone https://github.com/AliSchlereth/final.git`

`cd final`

### Second: 
Run `bundle`. You'll need to be using Ruby 2.3.0.

### Third:
Now, you'll need to make sure your PostgreSQL database is running. If you've got

a small elephant at the top of your screen: great. If not, spin up your PostgreSQL app.

(If you don't have the app, go [here](http://postgresapp.com/) and follow the install instructions.)

### Fourth:
Next: run the following command in your terminal:

`rake db:create db:migrate db:test:prepare`

### Fifth: 
 Go ahead and run `rspec` - make sure all the

tests pass. If not, you might be missing a gem or maybe you should go back and run

`rake db:test:prepare` 

### Sixth:  
Run the app locally 
`rails s`
Visit
[http://localhost:3000](http://localhost:3000)

## Technical details:

A Rails API storing a large amount of data in a PostgreSQL database. Tests written
in rspec-rails. Coverage provided by simplecov.

## Licensing

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
