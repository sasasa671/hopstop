exports.config =
  # See http://brunch.io/#documentation for docs.
  paths:
    public: '/usr/share/nginx/www'
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(vendor|bower_components)/
        'test/javascripts/test.js': /^test[\\/](?!(vendor|bower_components))/
        'test/javascripts/test-vendor.js': /^test[\\/](?=(vendor|bower_components))/

    stylesheets:
      joinTo:
        'stylesheets/app.css': /^(app|vendor|bower_components)/
        'test/stylesheets/test.css': /^test/
      order:
        before: [
          'vendor/styles/bootstrap/normalize.less'
        ]
        after: [
          'vendor/styles/helpers.css'
        ]

    templates:
      joinTo: 'javascripts/app.js'
