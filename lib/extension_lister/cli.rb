require 'thor'
require 'agile_utils'
module ExtensionLister
  class CLI < Thor
    using AgileUtils::HashExt

    desc 'list', 'List all unique extensions'
    method_option "base_dir",
                  aliases:  "-b",
                  desc:     "Base directory",
                  default:  File.expand_path(".")

    method_option 'version',
                  aliases: '-v',
                  desc: 'Display version number'
    def list
      opts = options.symbolize_keys
      if opts[:version]
        puts "You are using ExtensionLister version #{ExtensionLister::VERSION}"
        exit
      end
      puts list_extensions(opts[:base_dir])
    end

    private

    def list_extensions(base_dir = ".")
      extensions = Dir.glob(File.join(File.expand_path(base_dir), "**/*")).reduce([]) do |exts, file|
        exts << File.extname(file)
      end
      extensions.sort.uniq.delete_if { |e| e == "" }
    end
  end
end
