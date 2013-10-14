# Hopstop
![Hopstop screeshot](http://i.imgur.com/IhEVItr.png)

Hopstop is a mobile-first beer search app built using the Brunch with Chaplin skeleton (boilerplate) for [Brunch](http://brunch.io)
based on [Chaplin](http://chaplinjs.org) architecture.

Requires Brunch 1.7+.

![](https://david-dm.org/jhabdas/hopstop.png)

## Getting started
* Clone this repo.
* Use node version v0.10.15 or greater (earlier versions may be supported, but have not been tested)
* Install brunch with `sudo npm install -g brunch`, optionally passing the `--no-bin-links` flag if using Vagrant.
* Install bower with `sudo npm install -g bower`, optionally passing the `--no-bin-links` flag if using Vagrant.
* Install node and bower deps with `npm install` and `bower install`, respectively, optionally passing the `--no-bin-links` flag if using Windows.
* Build the project with `sudo brunch b` or `sudo brunch w`.
* Open the `/usr/share/nginx/www` dir to see the result.
* To function, requires Nginx configured to authenticate and connect to the Untappd API. Use the following config with completed values for `client_id` and `client_secret` to enable reverse proxy to end-point, like:

```
# Reverse proxy to Untappd API
# Variation of http://goo.gl/cAV9h
location ^~ /api/untappd/ {
        rewrite ^/api/untappd/(.*) /v4/$1$is_args$args&client_id=&client_secret= break;
        proxy_pass http://api.untappd.com/;
        proxy_cache STATIC;
        proxy_cache_valid 200 204 302 1d;
}
```

See [Chaplin site](http://chaplinjs.org) for docs and more info.

## Difference from Chaplin Boilerplate
[Chaplin Boilerplate](https://github.com/chaplinjs/chaplin-boilerplate)
is a official boilerplate all for chaplin. This skeleton is almost the same,
except a few changes:

* Added Header.
* CommonJS is used instead of AMD, because it's easier to use & debug.

## Features
* Ready for Bower components.
* Bootstrap 3 included.
* Leverages Untappd end-points to enable beer searching.
* CoffeeScript + Stylus + Handlebars as app languages
(you can change this to anything you want)
* Backbone as main MVC/MVP library, Chaplin as meta-framework.
* Support of IE8 and up.
* Cross-module communication using the Mediator and Publish/Subscribe patterns
* Controllers for managing individual UI views
* Rails-style routes which map URLs to controller actions
* An application view as dispatcher and view manager
* Extended model, view and collection classes to avoid repetition and
enforce conventions
* Strict memory management and object disposal
* A collection with additional manipulation methods for smarter change events
* A collection view for easy and intelligent list rendering

## Authentication
If you build an application with authentication, there are some useful abstractions for it out there: https://github.com/chaplinjs/chaplin-auth.

## License
The MIT license.

Copyright (c) 2012 Paul Miller (http://paulmillr.com/)

Copyright (c) 2012 Moviepilot GmbH, 9elements GmbH et al.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
