package webm;

import cpp.Lib;
import haxe.io.Bytes;
import haxe.io.BytesData;
import openfl.display.BitmapData;
import openfl.utils.ByteArray;

class VpxDecoder {
	public static var version(get, null):String;
	static final get_version:Void->String = hx_vpx_codec_iface_name;

	private final context:Dynamic;
	
	public function new() {
		context = hx_vpx_codec_dec_init();
	}
	
	public function decode(data:BytesData) {
		hx_vpx_codec_decode(context, data);
	}
	
	public function getAndRenderFrame(bitmapData:BitmapData) {
		final info = hx_vpx_codec_get_frame(context);
		
		if (info != null) {
			var buffer = bitmapData.image.buffer;
			buffer.data.buffer = Bytes.ofData(info[2]);
			buffer.format = ARGB32;
			buffer.premultiplied = true;
			bitmapData.image.format = BGRA32;
			bitmapData.image.version++;
		}
	}
	
	static final hx_vpx_codec_iface_name:Void->String = Lib.load("extension-webm", "hx_vpx_codec_iface_name", 0);
	static final hx_vpx_codec_dec_init:Void->Dynamic = Lib.load("extension-webm", "hx_vpx_codec_dec_init", 0);
	static final hx_vpx_codec_decode:Dynamic->BytesData -> Array<Int> = Lib.load("extension-webm", "hx_vpx_codec_decode", 2);
	static final hx_vpx_codec_get_frame:Dynamic->Array<Dynamic> = Lib.load("extension-webm", "hx_vpx_codec_get_frame", 1);
}