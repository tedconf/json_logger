require 'time'
require 'json'
require 'json_logger/version'

class JsonLogger < Logger
  @@factory_defaults = {}
  def self.factory_defaults=(options)
    @@factory_defaults = options
  end

  # return a new JsonLogger
  #   - file is set in settings
  #   - progname and level can be set by options. (default level is in settings)
  def self.factory(options={})
    device = options[:device] || @@factory_defaults[:device]
    inst = new(device)

    inst.level = options[:level] || @@factory_defaults[:level] || Logger::WARN
    inst.progname = options[:progname] || @@factory_defaults[:progname]
    inst.presets = options[:presets]
    inst
  end

  attr_accessor :presets

  def initialize(*args)
    super

    self.formatter = proc { |severity, datetime, progname, raw|
      out = {
        'time' => datetime.utc.iso8601(3),
        'level' => severity,
        'level_id' => @levels[severity]
      }

      if self.presets
        out.merge!(self.presets)
      end

      if raw.respond_to?(:to_hash)
        #TODO: raise error if raw has a key which overrides time, level, or level_id?
        out.merge!(raw.to_hash)
      elsif raw.respond_to?(:to_s)
        out['msg'] = raw.to_s
      end

      out['progname'] = progname if progname

      out.to_json + "\n"
    }

    @levels = {}
    Logger::SEV_LABEL.each_with_index { |label,idx| @levels[label] = idx }
  end
end
