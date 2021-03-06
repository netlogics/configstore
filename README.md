Config Store
==================

Using the language of your choice, write some code that can parse a
configuration file following the specifications below. Follow your
own best practices and coding/design principles.
 
- Do not use existing "complete" configuration parsing
  libraries/functions, we want to see how you would write the code
  to do this.
- Use of core and stdlib functions/objects such as string
  manipulation, regular expressions, etc is ok.
- We should be able to get the values of the config parameters in
  code, via their name. How this is done specifically is up to you.
- Boolean-like config values (on/off, yes/no, true/false) should
  return real booleans: true/false.
- Numeric config values should return real numerics: integers,
  doubles, etc
- Ignore or error out on invalid config lines, your choice.
- Please include a short example usage of your code so we can see
  how you call it/etc.
- Push your work to a public github repository and send us the link.
 
### Valid config file ###
```
# This is what a comment looks like, ignore it
# All these config lines are valid
host = test.com
server_id=55331
server_load_alarm=2.5
user= user
# comment can appear here as well
verbose =true
test_mode = on
debug_mode = off
log_file_path = /tmp/logfile.log
send_notifications = yes
```

### Usage ###
```ruby
config = ConfigStore.new

puts config.debug_mode # Prints 'false' given the example config file above
```

### Running the tests ###
```
$ rspec --color config_store_spec.rb
..........

Finished in 0.00467 seconds
8 examples, 0 failures

```
