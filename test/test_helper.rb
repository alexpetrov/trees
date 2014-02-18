# trees/test/test_helper.rb
require "test/unit"

this_dir = File.join(File.dirname(__FILE__),"..")
$LOAD_PATH.unshift File.expand_path(this_dir)

require "trees"
