# Roberts
Small app to automate the management of interruptions to the development team by other departments of the company.

### What is the Robert Pirate?
The Robert Pirate is just a role that one of the members of the development team plays during a certain amount of time. This member is in charge of taking care of all the interruptions coming from other departments of the company. It's a duty of the Robert Pirate communicate the bugs other deparments find and take care of their questions, requests, etc. Of course, the pirate can delegate some of the tasks to other members of the team.

That's how we do it in [Upplication](https://github.com/Upplication).

This app aims to remove the whole interruption thing (the pirate will decide when it's the right time to check the tickets without being interrupted) and centralize all issues in a single place where they are kept and they can't be forgotten.

## What can you do with Roberts?
* Anyone can create a ticket (bug, question, task, ...). It's suposed to be an internal tool so you should not make it available outside your company's network.
* Only admins (which are created through the CLI) can manage the tickets. They can change the priority of the ticket and close/solve them. They also have the ability to leave a comment for every action.
* When a new ticket is created, the dev team is notified via Slack.
* When an administrator changes anything in a ticket (close, solve, change priority, ...) the user who created the ticket will receive a notification email if a reply email has been entered on the creation process.

TL;DR: it's an easy way to manage interruptions using tickets.

## Prerequisites
* Ruby (tested on Ruby 2.2.1)
* bundle gem (```gem install bundle```)
* rake gem (```gem install rake```)
* Node.js, NPM and bower

## How do I install it?

* Clone this repo.
```
git clone https://github.com/mvader/Roberts
cd Roberts
```
* Create a ```.env``` file under the ```config``` directory.
```
cp config/.env.development config/.env
```
* Edit the config variables.
```
vi config/.env
```
* Install all dependencies.
```
bundle
cd apps/web/public
bower install
cd ../../../
```
* Create the database schema.
```
rake db:migrate LOTUS_ENV=production
```
* Start the puma server.
```
env LOTUS_ENV=production bundle exec lotus server
```

## Create administrators

* Run the following command
```
rake user:new_admin['User name', 'User email', 'User password'] LOTUS_ENV=production
```

## Change user password

* Run the following command
```
rake user:change_pass['user email', 'new password'] LOTUS_ENV=production
```

## Using MySQL instead of SQLite3

* Add the following line to your ```Gemfile```:
```
gem 'mysql2'
```

* Install the gem:
```
bundle
```

* Change your ```.env``` file with the following database URL:
```
mysql2://user:pwd@host/db
```
