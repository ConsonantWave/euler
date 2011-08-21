require 'rubygems'
require 'bundler/setup'
require 'require_all'
require 'sinatra'
require 'haml'
require_all 'lib'

set :haml, :format => :html5
set :root, File.dirname(__FILE__)

get '/' do
  @title = 'euler project solutions'
  @problems = Problem.problems
  haml :index
end

get '/problems/:id' do
  @id = params[:id]
  @title = "solution for euler problem #{@id}"
  @problem = find_problem_from_id(@id)
  @code = file_contents(@id)
  haml :problem
end

get '/solutions/:id' do
  @id = params[:id]
  @problem = find_problem_from_id(@id)
  thr = Thread.new { (@solution, @time) = benchmark(@problem) }
  thr.join(60)
  haml :solution, :layout => false
end

helpers do
  def find_problem_from_id(id)
    begin
      Object.const_get "Problem#{id}"
    rescue NameError
      pass
    end
  end

  def benchmark(problem)
    t_0 = Time.now
    solution = problem.solve
    t_1 = Time.now
    elapsed_time = (t_1 - t_0) * 1000 # in milliseconds
    [solution, elapsed_time]
  end

  def file_contents(id)
    IO.read(Dir.pwd << "/lib/problems/problem_#{id}.rb")
  end
end
