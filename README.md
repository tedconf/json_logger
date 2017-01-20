## JSON Logger

Simple structured logging.

A subclass of Ruby's standard `Logger` which makes it easy to write structured
data to your log files.

## Basic Usage

```ruby
instance = JsonLogger.factory(
  :device => '/tmp/test.log', # anything understood by Logger.new
  :level => Logger::INFO,
  :progname => 'foo'
)
instance.info('a simple message')
instance.error(:key => 'value', :other => [1,2,3])
```

Output in `/tmp/test.log`:
```json
{
  "time":"2013-08-28T20:54:42.048Z",
  "progname":"foo",
  "level":"INFO",
  "level_id":1,
  "msg":"a simple message"
}
{
  "time":"2013-08-28T20:52:48.321Z",
  "progname":"foo",
  "level":"ERROR",
  "level_id":3,
  "data":"data",
  "other":[1,2,3]
}
```

Messages are actually written 1 per line (separated by a newline). I added the
extra newlines here for readability.

## Factory Defaults

You can set some defaults which will be added to every `factory` call. This
works well from a Rails initializer, for example.

Subsequent calls to `factory` will always include these defaults, though they
can be overridden if desired.

```ruby
JsonLogger.factory_defaults = {
  :device => '/tmp/test.log',
  :level => Logger::INFO
}
instance = JsonLogger.factory(:progname => 'foo')
instance.info 'a simple message'
```

## Presets

A `factory` call can include preset values which will be added to any log
messages created by the returned instance.

```ruby
instance = JsonLogger.factory(:progname => 'foo', :presets => {:a => 'b', :c => 'd'})
instance.error('hello')
```

Output:
```json
{
  "time":"2013-08-28T20:52:48.321Z",
  "progname":"foo",
  "level":"ERROR",
  "level_id":3,
  "a":"b",
  "c":"d",
  "msg":"hello",
}
```

## Copyright

Copyright (c) 2013 Alex Dean. See LICENSE.txt for
further details.


Tag for hackweek glossary:

<!--- project_def -->
Simple structured logging. A subclass of Ruby's standard Logger which makes it easy to write structured data to your log files.

Vertical: Tools

Related links: https://github.com/tedconf/json_logger
<!--- /project_def -->
