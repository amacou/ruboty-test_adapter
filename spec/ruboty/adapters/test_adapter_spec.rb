require 'spec_helper'

describe Ruboty::Adapters::TestAdapter do 
  let(:robot) do
    Ruboty::Robot.new.tap { |robot| robot.run }
  end

  let(:messages) do
    robot.messages
  end

  describe 'message' do
    before do
      robot.receive({body: 'ruboty ping', from: 'a', to: 'b'})
    end

    it do
      expect(messages.count).to eq(1)
      expect(messages.first[:body]).to eq('pong')
    end
  end

  describe 'handler' do
    it 'called' do
      expect_any_instance_of(Ruboty::Handlers::Ping).to receive(:ping).with(any_args)
      robot.receive({body: 'ruboty ping', from: 'a', to: 'b'})
    end
  end
end


