require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'JsonLogger' do
  it 'Returns a new JsonLogger with default options' do
    expect(JsonLogger.factory).to_not eq nil
  end

  it 'Sets device, level & progname options' do
    options = {
      level: Logger::INFO,
      progname: 'myfile',
      device: STDOUT
    }
    logger = JsonLogger.factory(options)
    expect(logger.level).to eq 1
    expect(logger.progname).to eq 'myfile'
  end
end
