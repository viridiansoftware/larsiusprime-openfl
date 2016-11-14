package openfl.display;


import lime.app.Application in LimeApplication;
import lime.app.Config;
import openfl.Lib;


class Application extends LimeApplication {
	
	
	public function new () {
		
		super ();
		
		if (Lib.application == null) {
			
			Lib.application = this;
			
		}
		
	}
	
	
	public override function create (config:Config):Void {
		
		this.config = config;
		
		backend.create (config);
		
		if (config != null) {
			
			if (Reflect.hasField (config, "fps")) {
				
				frameRate = config.fps;
				
			}
			
			if (Reflect.hasField (config, "windows")) {
				
				for (windowConfig in config.windows) {
					
					var window = new Window (windowConfig);
					createWindow (window);
					
					#if (flash || html5)
					break;
					#end
					
				}
				
			}
			
			if (preloader == null || preloader.complete) {
				
				onPreloadComplete ();
				
			}
			
		}
		
		#if crashdumper
		
		LimeApplication.dispatchErrorEventCallback = __dispatchErrorEvent;
		
		#end
	}
	
	#if crashdumper
	
	private function __dispatchErrorEvent( msg:Dynamic) :Void {
		
		var err:Dynamic = null;
		if (msg != null) {
			
			err = msg;
			
			if (Std.is(msg, String)) {
				
				err = new openfl.errors.Error("UNCAUGHT ERROR : " + msg, 0);
				
			}
			
		}
		
		if (openfl.Lib.current != null && openfl.Lib.current.loaderInfo != null && openfl.Lib.current.loaderInfo.uncaughtErrorEvents != null) {
			
			openfl.Lib.current.loaderInfo.uncaughtErrorEvents.dispatchEvent(new openfl.events.UncaughtErrorEvent(openfl.events.UncaughtErrorEvent.UNCAUGHT_ERROR, true, true, err));
			
		}
		
	}
	
	#end
}