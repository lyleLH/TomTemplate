module Pod

  class ConfigureIOS
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      #prefix
      prefix = nil
      loop do
        prefix = configurator.ask("What is your class prefix（类前缀）")

        if prefix.include?(' ')
          puts 'Your class prefix cannot contain spaces.'.red
        else
          break
        end
      end
      #工程配置
      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/ios/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :prefix => prefix
      }).run

      #移动工程位置
      `mv ./templates/ios/* ./`
    end
  end
end
