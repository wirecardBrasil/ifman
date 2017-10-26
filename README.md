# ![IfMan](https://raw.githubusercontent.com/moip/ifman/master/app/assets/images/ifman.png)

**IfMan** is a GUI (Graphical User Interface) for **Curtain**.

Checkout about Curtain, an easy way to control your features using [redis](http://redis.io/), available for
- Java as [JCurtain](https://github.com/moip/jcurtain).
- Ruby as [RCurtain](https://github.com/moip/rcurtain).

## Running

IfMan uses Redis to control it's features. You can run IfMan with Redis locally using [docker](https://docs.docker.com/engine/installation/).
- `docker-compose up --build`

The default login for docker is:
```
Login:    redis
Password: redis
```

## Usage

* To use **IfMan**, first your need to initialize the configuration defining your **redis URI** as Login and **redis password** as Password.

```
Login:    10.0.1.1:6380
Password: p4ssw0rd
```

* With **IfMan** you can:

1. Create new features.
2. Delete existing features.
3. Manage the percentage of your features.
4. Manage the users of your features.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/moip/ifman. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( https://github.com/moip/ifman/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
