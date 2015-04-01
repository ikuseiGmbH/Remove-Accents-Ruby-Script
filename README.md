Removing Accents In a Ruby String
=================================

In short, you can use this extension to the String class to convert "àéêîôûù" to "aeeiouu".

It's fairly easy to convert a string to a URL-safe version. Both PHP and Ruby have a way to do this, but what happens in this case is that extended characters are escaped rather than being replaced and that's often not what I want.

If you're like me, you've probably had many occasions where you wanted to get a 7bits ASCII version of a string where the accents are converted to the base letter. For example, you want to give each user his page at : [domain.com]/[name]. When the name is "Steve Smith", that's not a problem, but what if the name is "François Léveillé" ?

What you want in this case is "francois_leveille" or "francoisleveille" and this is where this script will help you.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'remove_accents'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install remove_accents

## Usage


===========

	# Set a sample string to test things out
	```ruby
	mystring = "Ceci Est UN test : éàòù"
	```

	# The removeaccents method simple removes the accents and returns the string
	```ruby
	mystring.removeaccents
	```
 
	# The urlize method not only calls removeaccents, 
	# but also a bunch of others to make it truly URL-ready.
	mystring.urlize

	# You can customize urlize with options:
	# :downcase => true
	#     will convert entire string to lowercase
	# :convert_spaces => true
	#     will convert space to underscore
	# :regexp => //
	#     matching characters will be removed

	mystring.urlize({:downcase => true})
