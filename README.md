Bookmark Manager
----------------

Makers Academy Week 4 Project

This project is to create a bookmark manager, enabling users to view their links, add new links, tag them, and filter by tag.

Technologies used:
* Testing - RSpec, Capybara
* Back-end - Ruby, ERB
* Front-end - HTML, CSS
* Others - PostgreSQL, DataMapper, Sinatra, Database Cleaner, BCrypt, Mailgun

The app is live at https://new-bookmark-manager.herokuapp.com/links

![bookmarkmanager](http://i.imgur.com/EaG8TRF.png)

User stories:

```
As a user
So I can visit my favourite websites easily
I want to see a list of my links

As a user
So I can add websites to the list
I want to add a new link

As a user
So I can categorize my links
I want to tag my links

As a user
So I can find recently bookmarked sites
I want to see links in reverse chronological order
```

To download and use...
```
$ git clone https://github.com/vickymg/new_bookmark_manager.git
$ cd new_bookmark_manager
$ bundle
```
Create two databases using PostgreSQL:
```
$ psql
$ create database bookmark_manager_test;
$ create database bookmark_manager_development;
```
Run the database migrations:
```
$ rake auto_migrate                  # For development db purposes
$ rake auto_migrate RACK_ENV=test    # For testing db purposes
```
To start the app:
```
$ rackup
```
The page will be on http://localhost:9292/
