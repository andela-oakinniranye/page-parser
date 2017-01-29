# Page Parser

[![Coverage Status](https://coveralls.io/repos/github/andela-oakinniranye/page-parser/badge.svg?branch=master)](https://coveralls.io/github/andela-oakinniranye/page-parser?branch=master)


This is a page parser project that indexes the contents of a web page.

### API
For convenience, a working api is available at: [indices](http://indices.herokuapp.com) and you can find the [Endpoint Docs here](http://indices.herokuapp.com/docs/)

Tech design for this application is [available here](https://gist.github.com/andela-oakinniranye/244834419baa5ca6374c899f9705d7e6)

## Objective

The objective of this project is to create a tiny RESTful API to index a page's content. "Indexing the content" means to parse the page content and store its content - in this case to store the content that is found inside the tags h1, h2 and h3 and the links.

## Concepts used

- RESTful Architecture
- Background Processing

## Application Requirements
- minimum of Ruby 2.3
- Rails 5
- Redis

## Get Started

For local development,

- First, ensure you're on Ruby 2.3 or greater
- Install Redis, required by Sidekiq: `brew install redis` on Mac with Homebrew
- Run `bundle install`
- Run `bundle exec rails db:migrate`
- Run `bundle exec rails server`
- Start your sidekiq server `bundle exec sidekiq`
- open your browser to: `http://localhost:3000/docs` you should find the docs
- try out the application according to the doc


## External gems
- Sidekiq - We send every new link created to sidekiq to process the job, this ensures that a user is not timed out on a response
- ActiveModelSerializer - All response from the API is serialized with this
- Nokogiri - Used to parse the web page
- open_uri_redirections - Used to follow redirection, especially when page redirects from HTTP to HTTPS


## Testing
This application makes use of RSpec for Unit and Behavioural Testing

## Considerations/Future Opportunities
- Namespacing the `API`, so that we can have multiple versions
- We may want to paginate the responses, this would not really matter at the initial stages, but when we have lots of records, this is an ideal
- There are no plans for a front end for this API, this gives the flexibity to anyone to build one either with React or something else

## Other comments
The basic requirement for this application is to parse a page, which can be done with the *WebPageParser* and fetch the `h1,h2,h3 and urls` on the parsed page, to fetch other contents outside the requirements, a fetcher could be easily implemented, which initializes with 2 arguments: `type` and a `webpage document`, a webpage responds to `document` and `url` message.
Basic implementation can be found in the `app/parsers/fetchers/basic_tag_fetcher`, which you can also inherit from, as it already implements matches, which are elements on the page that match your other contents.

TDD was strictly followed on the model, controller and requests level, however, even though it was followed on the parsers, it wasn't as strict!
