package openfl;

// Currently telemetty is only available in CPP
#if (cpp && hxtelemetry)
import hxtelemetry.HxTelemetry;

class Telemetry {

  public static var hxt:HxTelemetry;
  public static function start(host:String="localhost",
                               port:String="7934"):Void {
    trace("Starting telemetry...");
    var cfg = new hxtelemetry.HxTelemetry.Config();
    //cfg.allocations = false;
    cfg.host = host;
#if android
    cfg.app_name = "Android App";
#else
    cfg.app_name = "Test App";
#end
    hxt = new hxtelemetry.HxTelemetry(cfg);
  }

  public static inline function start_timing(name:String):Void
  {
    // TODO: compatibility layer /w Adobe Scout custom metrics?

    hxt.start_timing(name);
  }

  public static inline function end_timing(name:String=".user"):Void
  {
    // TODO: compatibility layer /w Adobe Scout custom metrics?

    hxt.end_timing(name);
  }

}
#end
