package webm;

import openfl.events.EventType;
import openfl.events.Event;

class WebmEvent extends Event {
	public static final PLAY:EventType<WebmEvent> = "play";
	public static final STOP:EventType<WebmEvent> = "stop";
	public static final COMPLETE:EventType<WebmEvent> = "complete";
	public static final RESTART:EventType<WebmEvent> = "restart";
	public static final PAUSE:EventType<WebmEvent> = "pause";
	
	public function new(type:String, bubbles:Bool = false, cancelable:Bool = false) {
		super(type, bubbles, cancelable);
	}
}