package openfl;

// Currently telemetty is only available in CPP
#if (cpp && hxtelemetry)
import hxtelemetry.HxTelemetry;
#end

class Timing {

  // OpenFL custom activities
  public static inline var EVENT:String = ".event";
  public static inline var RENDER:String = ".render";

  public static var OPENFL_DESCRIPTORS:Array<ActivityDescriptor> = [
    { name:EVENT, description:"Event Handler", color:0x2288cc },
    { name:".render", description:"Rendering", color:0x66aa66 }
  ];
}

class Telemetry {

#if (cpp && hxtelemetry)
  public static var hxt:HxTelemetry;
#end

  public static var config = {
    allocations:true,
    host:"localhost",
    port:"7934",
    app_name:"OpenFL App",
  }

  public inline static function start():Void {
#if (cpp && hxtelemetry)
    trace("Starting telemetry...");
    var cfg = new hxtelemetry.HxTelemetry.Config();
    cfg.allocations = config.allocations;
    cfg.host = config.host;
    cfg.app_name = config.app_name;
    cfg.activity_descriptors = Timing.OPENFL_DESCRIPTORS;
    hxt = new hxtelemetry.HxTelemetry(cfg);
#end
  }

  public static inline function advance_frame():Void
  {
#if (cpp && hxtelemetry)
    hxt.advance_frame();
#end
  }

  public static inline function start_timing(name:String):Void
  {
    // TODO: compatibility layer /w Adobe Scout custom metrics?
#if (cpp && hxtelemetry)
    hxt.start_timing(name);
#end
  }

  public static inline function end_timing(name:String=".user"):Void
  {
    // TODO: compatibility layer /w Adobe Scout custom metrics?
#if (cpp && hxtelemetry)
    hxt.end_timing(name);
#end
  }

  public static inline function unwind_stack():String
  {
#if (cpp && hxtelemetry)
    return hxt.unwind_stack();
#end
  }

  public static inline function rewind_stack(stack:String):Void
  {
#if (cpp && hxtelemetry)
    hxt.rewind_stack(stack);
#end
  }

}
