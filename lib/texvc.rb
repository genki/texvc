require 'RMagick'
require 'escape'
require 'temp_dir'

module Texvc
  VERSION = '0.1.1.1'

  class SyntaxError < StandardError; end
  class LexingError < StandardError; end
  class UnknownFunctionError < StandardError; end
  class UnknownError < StandardError; end

  class << self
    def parse(latex, options = {})
      image = nil
      latex = "{}_{#{latex}}" if options[:inline]

      TempDir.create :basename => 'texvc' do |tmp|
        cmd = Escape.shell_command(['texvc', tmp, tmp, latex, 'utf8'])
        result = nil
        IO.popen(%Q{#{cmd.to_s} 2>/dev/null}, 'r+') do |io|
          io.puts latex rescue nil
          result = io.gets
        end
      
        path = File.join(tmp, "#{result[1, 32]}.png")

        image = case result[0]
        when ?+; read_image(path)
        when ?c; read_image(path)
        when ?m; read_image(path)
        when ?l; read_image(path)
        when ?C; read_image(path)
        when ?M; read_image(path)
        when ?L; read_image(path)
        when ?X; read_image(path)
        when ?S; raise SyntaxError.new
        when ?E; raise LexingError.new
        when ?F; raise UnknownFunctionError.new(result[1..-1])
        else raise UnknownError.new(result)
        end
      end

      image
    end

  private
    def read_image(path)
      Magick::Image.from_blob(open(path).read)[0]# rescue nil
    end
  end
end
