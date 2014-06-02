# SassyExport is a lightweight plugin for SassyJSON
# ----------------------------------------------------------------------------------------------------
# @dependency https://github.com/HugoGiraudel/SassyJSON
# ----------------------------------------------------------------------------------------------------

require "SassyJSON"

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('SassyExport', :path => extension_path)

# Version is a number. If a version contains alphas, it will be created as a prerelease version
# Date is in the form of YYYY-MM-DD
module SassyExport
  VERSION = "1.0.15"
  DATE = "2014-06-02"
end

# SassyExport : write passed json string to path/to/filename.json
# ----------------------------------------------------------------------------------------------------
# @param path [string] : directory path to write string
# @param string [string] : json to write to filename
# ----------------------------------------------------------------------------------------------------
# @return string | write filename to path

module Sass::Script::Functions
    def SassyExport(path, json)
        # define root path up to current working directory
        root = Dir.pwd
        # open file [create new file if file does not exist], write string to root/path/to/filename.json
        File.open("#{root}#{path}", "w") { |f| f.write(json) }
        # return string for use in css
        return json
    end
end