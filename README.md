# Page Parser

This is a page parser project that indexes the contents of a web page.

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

## External gems

- Sidekiq
- 
