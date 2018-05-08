Goodgamebets
================

This project is a Proof of Concept for the OST Kit alpha II challenge. We intent to use this API and Branded Token to implement a functional E-sports betting platform.

A better explanation can be found in the [blog post describing the teams of this challenge](https://medium.com/ostdotcom/14-more-osta2-projects-pt-2-d74348d47aa3):

> Blocksmith is building a betting platform for e-sports. Its users will be able to bet on their favourite team to win e-sports events. Once an event is finished, Blocksmith will reward the users that bet on the wining team with all the tokens that were staked on that event. The rewards will be distributed according to the amount of tokens each user staked.

At the beginning we plan to keep the kinds of bets simple in order to test the system, after gaining more maturity we will try to bring to the e-sports world many features you already encounter during traditional sports events/seasons.

Features
--------

For the alpha version the implemented features are:

* Integration with the OST Kit API
* Authentication and Authorization into the betting platform
* Managing user wallets through the OST kit API
* Place several bets on the available games
* Automated winnings redistribution after a given game ends
* Historical data of the results of personal bets
* Transaction history
* Email notifications
* Help pages


Follow the network
------------------

One the great benefits of using OST and dedicated branded token for our platform is transparency. Behind the scenes, you value is always backed by the Ethereum network and form performance each token (GGT as well) run in an exclusive side-chain. 

This way you can monitor yourself all the activity in the betting platform, for example you can use the official OST visualizer: [OST View](https://view.ost.com/chain-id/1409/tokendetails/0xedd6b2857135391e10900675d5fa610054608529)


Requirements
------------

This application requires:

- Ruby 2.4.1
- Rails 5.2.0
- PostgreSQL
- Redis
- Sidekiq

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Setup the development environment
---------------------------------

Since this project is a traditional Ruby on Rails application, to start developing and contributing to it is very simple.

You just need to make sure the above requirements are installed, then follow the next steps:

1.
> $ git clone git@github.com:blocksmithtech/goodgamebets.git

2.
> $ cd goodgamebets
> $ bundle install

3.
Create a `.env` file based on the `.env.sample` present on this repository

4.
> $ rails db:setup

5.
Finally run the project with:
> $ rails s

> $ sidekiq


Issues
------

All issues found and discussion about the technical aspects of the project, can be done through the [Issues section of the Github Repository](https://github.com/blocksmithtech/goodgamebets/issues).

Contributing
------------

During the challenge we will not accept external contributions (since this repository is part of the on-going challenge). 

After this period and the results published, anyone is welcome to send their contributions and patches through as Pull Request.

Credits
-------
![Blocksmith Logo](https://avatars1.githubusercontent.com/u/36672632?s=200&v=4)

