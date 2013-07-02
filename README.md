Writing Activities
=================
About
------
Proof-of-concept project experimenting with peer review for writing education.

Installation
------------

Install Ruby and RVM.

`git clone https://github.com/helpnet/writingactivities.git` to get a local copy.

`cd` into the directory and accept the RVM prompt. If you do not have the proper version of ruby, it will prompt you to download it.

Run `bundle install` to install all the dependencies.

Run `rake db:schema:load` to load the database schema.

Run `rake db:seed` to seed the database with initial values.

Run `rails server` to start the server. View it in the browser at `http://localhost:30000`
