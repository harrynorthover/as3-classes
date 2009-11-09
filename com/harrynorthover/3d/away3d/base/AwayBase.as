package com.harrynorthover.3d.away3d.base 
{
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	* ...
	* @author Harry Northover
	*/
	public class AwayBase extends MovieClip
	{
		public var scene:Scene3D;
		public var view:View3D;
		
		protected function Init(camZoom:int, viewX:int, viewY:int):void {
			InitAway3D(camZoom, viewX, viewY);
			Init3D();
			InitMaterials();
			InitEventListeners();
		}
		
		protected function InitAway3D(camZoom:int, viewX:int, viewY:int):void {
			// Initalize all the 3D stuff here.
			// Create the scene.
			scene = new Scene3D;
			// Create the viewport.
			view = new View3D( { x:viewX, y:viewY, scene:scene } );
			view.camera.zoom = camZoom;
			// Add it to the display list.
			addChild(view);
		}
		
		protected function Init3D():void {
			// Add all the 3D stuff here.
		}
		
		protected function InitMaterials():void {
			// Initalize all the material here.
		}
		
		protected function InitEventListeners():void {
			// Add the event listeners here...
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(Event.RESIZE, onResize);
		}
		
		protected function processFrame():void {
			// Add any animation here that you want to happen in the ENTER_FRAME event.
		}
		
		protected function onEnterFrame(evt:Event):void {
			// Call the animation
			processFrame();
			// Render the scene.
			view.render();
		}
		
		protected function onResize(evt:Event):void {
			view.x = 0;
			view.y = 0;
			view.width = stage.stageWidth;
			view.height = stage.stageHeight;
			view.render();
		}
	}
	
}