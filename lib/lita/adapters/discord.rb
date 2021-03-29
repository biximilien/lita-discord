require 'discordrb'

module Lita
  module Adapters
    class Discord < Adapter

      config :token,    type: String, required: true
      config :channels, type: Array

      def initialize(robot)
        super
        @bot = ::Discordrb::Bot.new token: config.token
      end

      def run
        # register message handler and convert to Lita data model
        @bot.message do |event|
          user = Lita::User.find_by_name(event.user.username)
          user = Lita::User.create(event.user.username) unless user
          source = Lita::Source.new(user: user, room: event.channel)
          message = Lita::Message.new(robot, event.message.content, source)
          robot.receive(message)
        end

        # The `mention` event is called if the bot is *directly mentioned*, i.e. not using a role mention or @everyone/@here.
        # @bot.mention do |event|
        #
        #
        #   # The `pm` method is used to send a private message (also called a DM or direct message) to the user who sent the
        #   # initial message.
        #   event.user.pm('You have mentioned me!')
        # end

        # Run the bot in another thread in the background:
        @bot.run(true)

        config.channels.each do |channel|
          @bot.send_message(channel, 'Bot is now active!')
        end

        # Join the bot's thread back with the main thread:
        @bot.join
      end

      def send_messages(target, messages)
        messages.each do |message|
          @bot.send_message(target.room || target.user, message)
        end
      end

      def shut_down
        # TODO
      end

      def set_topic(target, topic)
        # TODO
      end

      def join(channel_id)
        # TODO
      end

      def part(channel_id)
        # TODO
      end

      Lita.register_adapter(:discord, self)
    end
  end
end
