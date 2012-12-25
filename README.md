# homely\_mutt cookbook

Undertakes the configuration described at
http://stevelosh.com/blog/2012/10/the-homely-mutt/

In other words, you give it a firstname, lastname, and email address, and it
assumes you want accounts named and described and inter-related in mutt,
offlineimap, and msmtp according to that blog post.

# Requirements

- mutt (my mutt\_cookbook repo, see the Berksfile)

# Usage

# Attributes

- fname - the firstname of the user using the account
- lname - the lastname of the user using the account
- email - the email address of the account

# Recipes

For now, there is only the default, and it does everything.

# Author

Author:: Will Milton (<the@willmilton.com>)
