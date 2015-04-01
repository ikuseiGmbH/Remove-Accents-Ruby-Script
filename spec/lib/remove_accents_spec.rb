require 'spec_helper'
require 'remove_accents'

describe RemoveAccents do
  it 'has a version' do
    expect(RemoveAccents::VERSION).to match(/\d+\.\d+\.\d+/)
  end
end

describe RemoveAccents::Base do
  before(:each) do
    @logger = RemoveAccents.new
  end

  it 'has a valid configuration' do
    expect(@logger.config["log_rotator"]).to eq("none")
    expect(@logger.config["global_logger"]).to eq(true)
    expect(@logger.config["csv"]["encoding"]).to eq("UTF8")
    expect(@logger.config["csv"]["col_sep"]).to eq(";")
    expect(@logger.config["logfile_destination"]).to eq("local")
  end

end