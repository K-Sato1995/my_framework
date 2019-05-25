require 'spell_generator'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      temp = File.read('views/index.erb')
      content = ERB.new(temp)
      ['200', {'Content-Type' => 'text/html'}, [content.result]]
    when '/spell'
      spell = SpellGenerator::Generator.generate
      ['200', {'Content-Type' => 'text/html'},  ["<html><body><b><em>#{spell}</em></b></body></html>"]]
    else
      [
        '404',
        {'Content-Type' => 'text/html'},
        ["<html><body><h4>404 Not Found</h4></body></html>"]
      ]
    end
  end
end
