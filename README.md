# targs

A re-write of my other [Tags](https://github.com/expandrew/tags.git) system using Active Record.

## what

* a tagging system; allows a user to enter items and tags, and associate each to the other, as well as return the associations
* *#[selfdogfood](http://indiewebcamp.com/selfdogfood), #[onethingwell](http://onethingwell.org/)*
* a building block of an experiment I'm working on

## setup

1. Clone the repository using `$ git clone`
1. Run `$ bundle install` to install gems
1. Run `$ rake db:create` and `$ rake db:migrate` from the directory you cloned into
1. Run `$ ruby targs_ui.rb`

## plans

* run visualization on top of this system to see connected elements
* run UI framework on top of this system to allow interaction through a GUI

## meta

Active Record [assessment](http://www.learnhowtoprogram.com/lessons/active-record-assessment) for [Epicodus](http://epicodus.com)

26 August 2014

by [Andrew M Westling](http://andrewwestling.com)
a@andrewwestling.com
