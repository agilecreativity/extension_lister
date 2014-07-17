module ExtensionLister
  CustomError = Class.new(StandardError)
  class << self
    # main helper method
    def helper
      puts 'FYI: ExtensionLister::helper()'
    end
  end
end
