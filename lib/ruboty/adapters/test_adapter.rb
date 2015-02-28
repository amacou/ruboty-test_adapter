class Ruboty::Robot
  delegate :messages, to: :adapter
  delegate :clear, to: :adapter
end

module Ruboty
  module Adapters
    class TestAdapter < Base
      attr_accessor :messages

      def run
      end

      def clear
        self.messages = []
      end

      def say(message)
        messages << message
      end

      def messages
        @messages ||= []
      end
    end
  end
end
