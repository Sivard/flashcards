class CollectStatistic
  def initialize(app)
    @app = app
  end

  def call(env)
    dup._call(env)
  end

  def _call(env)
    @status, @headers, @response = @app.call(env)

    if @headers['Content-Type'].present? && @headers['Content-Type'].include?('text/html')
      Statistic.create(
        controller: env['action_dispatch.request.path_parameters'][:controller],
        action: env['action_dispatch.request.path_parameters'][:action],
        user_id: env['action_dispatch.request.unsigned_session_cookie']['user_id']
      )
    end

    [@status, @headers, self]
  end

  def each(&block)
    @response.each(&block)
  end
end

# "REQUEST_METHOD"=>"GET",
# "HTTP_REFERER"=>"http://localhost:3000/ru/cards",
# "SERVER_PORT"=>"3000",
# "REMOTE_ADDR"=>"127.0.0.1",
# "ORIGINAL_FULLPATH"=>"/ru/blocks/new",
# "action_dispatch.request.path_parameters"=>{:controller=>"dashboard/blocks", :action=>"new", :locale=>"ru"},
# "action_dispatch.request.unsigned_session_cookie"=>{"session_id"=>"24abd79e4ac20a9b6fc041a18e0618c0", "locale"=>"ru", "_csrf_token"=>"bZDZuyHrfbVx73wORqKmKnymU6kuTzmLZju7IaPp93M=", "user_id"=>"1"},
