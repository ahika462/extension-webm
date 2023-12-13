## WEBM:

Information about webm:
* https://www.webmproject.org/

## Setup/Installing:

You need Haxe and OpenFL. https://openfl.org/

```
haxelib git extension-webm https://github.com/ahika462/extension-webm
```

## Simple Example:

```actionscript
var io:WebmIo = new WebmIoFile("c:/projects/test.webm");
var player:WebmPlayer = new WebmPlayer();
player.fuck(io, true);
player.addEventListener(WebmEvent.PLAY, function(e:WebmEvent) {
	trace("play!");
});
player.addEventListener(WebmEvent.STOP, function(e:WebmEvent) {
	trace("stop!");
});
player.addEventListener(WebmEvent.COMPLETE, function(e:WebmEvent) {
	trace("complete!");
});
player.addEventListener(WebmEvent.RESTART, function(e:WebmEvent) {
	trace("restart!");
});
player.addEventListener(WebmEvent.PAUSE, function(e:WebmEvent) {
	trace("pause!");
});
player.play();
```
