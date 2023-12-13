package webm;

import haxe.io.BytesData;
import openfl.utils.ByteArray;
import haxe.io.BytesInput;

class WebmIoByteArray extends WebmIo {
	var bytesInput:BytesInput;

	public function new(bytes:ByteArray) {
		bytesInput = new BytesInput(bytes);
		super();
	}

	override function read(count:Int):BytesData {
		return bytesInput.read(count).getData();
	}

	override function seek(offset:Float, whence:Int):Int {
		switch(whence)  {
			case 0: bytesInput.position = Std.int(offset);
			case 1: bytesInput.position = Std.int(bytesInput.position + offset);
			case 2: bytesInput.position = Std.int(bytesInput.length + offset);
		}
		return 0;
	}

	override function tell():Float {
		return bytesInput.position;
	}
}