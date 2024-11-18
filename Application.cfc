component {

	this.applicationtimeout    = createTimespan( 30, 0, 0, 0 );
	this.sessiontimeout        = createTimeSpan( 0, 0, 30, 0 );
	this.enablerobustexception = false;
	this.enablecfoutputonly    = true;
	this.showdebugoutput       = false;
	this.sessionstorage        = "redis";
    
	this.cache.connections["redis"] = {
        class: 'ortus.extension.cache.redis.RedisCache'
      , storage: true
      , custom: {
          "idleConnections":"5",
          "cacheKeyCaseSensitivity":"false",
          "maxConnections":"100",
          "host":"redis",
          "keyprefix":"lucee-cache",
          "password":"",
          "useSSL":"false",
          "database":"0",
          "port":"6379",
          "timeout":"2000",
          "socketTimeout":"2000",
          "username":"",
          "poolWaitTimeout":"2000"
      }
      , default: ''
  };

	public function onApplicationStart() {
		return true;
	}

	public function onApplicationEnd( struct applicationScope ) {
	}

	public function onRequestStart() {
		
		return true;
	}

	public function onRequest( string targetPage ) {
		include arguments.targetPage;
		return true;
	}

	public function onRequestEnd() {
	}

	public function onSessionStart() {
        session.things = new MyObject()
        session.stuff = session.things.myFunc()
	}

	public function onSessionEnd( struct sessionScope, struct applicationScope ) {
	}


	public function onCFCRequest( cfcname, method, struct args ) {
		return;
	}

	public function onError( any exception, string eventName ) {
		writedump(exception)
	}

	public function onAbort( required string targetPage ) {
		debugLog( "Page abort detected! #targetPage#" );
	}

	public function onMissingTemplate( required string targetPage ) {
		cfheader( statustext = "File not found", statusCode = 404 );
	}

	
}

