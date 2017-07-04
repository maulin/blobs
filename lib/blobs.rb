require 'gosu'
Dir[File.join(".", "lib/blobs/**/*.rb")].reverse.each { |f| require f }

game = Game.new
game.show
