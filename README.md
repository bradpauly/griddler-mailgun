# Griddler::Mailgun

This was extracted from the [griddler gem](https://github.com/thoughtbot/griddler) and is used to
parse emails forwarded to your application from [mailgun](http://mailgun.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'griddler'
gem 'griddler-sendgrid'
```

Then execute:

```
bundle install
```

## Usage

[Griddler](http://griddler.io/) comes with a route that, when used, handles the params passed to your application and then sends a Griddler::Email to EmailProcessor#process. Read [a blog post about it](http://robots.thoughtbot.com/handle-incoming-email-with-griddler) on the Thoughtbot blog.

#### Getting mailgun to POST to your application

Mailgun uses [routes](http://documentation.mailgun.com/user_manual.html#routes) to filter incoming emails and forward them to your app. A route is made up of a filter and an action. [The filter](http://documentation.mailgun.com/api-routes.html#filters) matches emails based on its properties and [the action](http://documentation.mailgun.com/api-routes.html#actions) determines what happens to the matched email.

For example, to forward any email sent to an example.net address to http://example.com/email_processor 
the following route would be used:

Filter Expression:

```
match_recipient(".*@example.net")
```

Action:

```
forward("http://example.com/email_processor")
```

## More Information

* [mailgun](http://www.mailgun.com)
* [mailgun API - Routes](http://documentation.mailgun.com/api-routes.html)
* [mailgun User Maunual - Routes](http://documentation.mailgun.com/user_manual.html#routes)
