require 'spell_generator'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', {'Content-Type' => 'text/plain'}, ['Hello World']]
    when '/spell'
      spell = SpellGenerator::Generator.generate
      ['200', {'Content-Type' => 'text/plain'}, [spell]]
    else
      [
        '404',
        {'Content-Type' => 'text/plain', 'Content-Length' => '13'},
        ['404 Not Found']
      ]
    end
  end
end
