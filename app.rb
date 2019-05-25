require 'spell_generator'

class App
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      status = '200'
      response(status, static) do
        erb :index
      end
    when '/spell'
      spell = SpellGenerator::Generator.generate
      status = '200'
      response(status, static) do
        erb(:spell, spell: spell)
      end
    else
      status = '404'
      response(status, static) do
        erb(:not_found)
      end
    end
  end

  private

  def erb(filename, options={})
    b = binding
    spell = options[:spell]
    temp = File.read("views/#{filename}.erb")
    content = ERB.new(temp).result(b)
  end

  def response(status, headers, body='')
    body = yield if block_given?
    [status, headers, [body]]
  end

  def static
     {"Content-Type" => 'text/html'}
  end
end
