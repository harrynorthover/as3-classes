package com.harrynorthover.particle {
	
	import flash.display.*;
	import flash.geom.*;
	import flash.events.Event;
	
	public class Particle extends Sprite {
		
		private var _xpos:Number;
		private var _ypos:Number;
		private var _xvel:Number;
		private var _yvel:Number;
		private var _grav:Number;
		private var _alpha:Number;
		private var _useRandomColor:Boolean;
		
		public function Particle(xp:Number, yp:Number, xvel:Number, yvel:Number, grav:Number, col:uint, alpha:Number, useRandomColor:Boolean) {
			_xpos = xp;
			_ypos = yp;
			_xvel = xvel;
			_yvel = yvel;
			_grav = grav;
			_alpha = alpha;
			_useRandomColor = useRandomColor;
			
			var ball:Sprite = new Ball();
			addChild(ball);
			
			x = _xpos;
			y = _ypos;
			alpha = _alpha;
			scaleX = scaleY = Math.random() * 1.9 + .1;
			
			if (_useRandomColor)
			{
				var colorInfo:ColorTransform = ball.transform.colorTransform;
				colorInfo.color = uint(col);
				ball.transform.colorTransform = colorInfo;
			}
			
			addEventListener(Event.ENTER_FRAME, onRun, false, 0, true);
		}
		
		private function onRun(evt:Event):void {
			_yvel += _grav;
			_xpos += _xvel;
			_ypos += _yvel;
			x = _xpos;
			y = _ypos;
			
			if ( _xpos < 0 || _ypos < 0 || _xpos > stage.stageWidth || _ypos > stage.stageHeight) {
				removeEventListener(Event.ENTER_FRAME, onRun);
				parent.removeChild(this);
			}
		}
	}
}