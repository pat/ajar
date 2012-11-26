# Ajar

Allow Facebook access to your local pages when creating Open Graph objects and actions via the Ajar API.

## Usage

Add the gem to your application's Gemfile:

    gem 'ajar', '0.1.0'

Wrap your Koala graph in an Ajar instance with your developer key from http://ajar-web.herokuapp.com, and use `put_connections` to create a new open graph object.

    graph = Ajar.new Koala::Facebook::API.new(token), 'my-token'
    graph.put_connections 'me', 'namespace:action', :object => object_uri

When you're operating in a local Rails environment (development or test), Ajar will copy the HTML from the given URI to a public address which Facebook can access. When anyone other than Facebook accesses it, it'll redirect back to the original URI.

The generated public URIs for Facebook use both your developer key and a per-graph-object unique key - so they're not easy to guess. Also: don't go sharing your developer key unnecessarily. All that said - if you're happy with Facebook accessing your page, you shouldn't be too concerned about the page being available to the general public anyway.

## Upcoming changes

* Proper domain for the site.
* Ability to customise which environments are considered 'local'.
* Developer key managed on a global level, instead of per instance.
* Tests.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
