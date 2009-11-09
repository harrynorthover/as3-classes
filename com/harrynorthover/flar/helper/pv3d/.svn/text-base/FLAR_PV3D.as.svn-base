package com.harrynorthover.flar.helper.pv3d
{
	import com.harrynorthover.flar.helper.base.FLAR_Base;
	
	import flash.events.Event;
	
	import org.libspark.flartoolkit.core.transmat.FLARTransMatResult;
    import org.libspark.flartoolkit.pv3d.FLARBaseNode;
	import org.libspark.flartoolkit.pv3d.FLARCamera3D;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;

	public class FLAR_PV3D extends FLAR_Base /*implements I3DEngineSetup*/
	{
		// Public variables:
		
		public var scene:Scene3D; // Not needed to be public because all 3D objects are 
								  // added to 'FLAR_Container'. See example for details.
		public var FLAR_Container:FLARBaseNode;
		public var FLAR_Camera:FLARCamera3D;
		public var viewport:Viewport3D;
		public var b_RenderEngine:BasicRenderEngine;
		
		public function FLAR_PV3D(width:int = 640, height:int = 480, framerate:int = 30)
		{
			Init(width, height, framerate);
			set3D();
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function set3D():void
		{
			scene = new Scene3D(); // Sets up the whole scene.
			FLAR_Camera = new FLARCamera3D(fparams); // Creates a special FLAR camera.
			FLAR_Container = new FLARBaseNode(); // Creates an object for all our 3D objects to go into.
			scene.addChild(FLAR_Container); // Add the container to the scene.
			
			add3D();
			
			tmr = new FLARTransMatResult();
			b_RenderEngine = new BasicRenderEngine();
			
			viewport = new Viewport3D();
			addChild(viewport);
		}
		
		protected function loop(e:Event):void
		{
			bmd.draw(vid);
			add3DAnimation();

			try {
				if (detector.detectMarkerLite(raster, 80) && detector.getConfidence() > 0.5)
				{
					detector.getTransformMatrix(tmr);
					FLAR_Container.setTransformMatrix(tmr);
					b_RenderEngine.renderScene(scene, FLAR_Camera, viewport);
					viewport.visible = true;
				} 
				
				else 
				{
					viewport.visible = false;
				}
			}
			
			catch(e:Error) {
				// Deal with errors here.
			}
		}
		
		public function add3D():void
		{
			// Override this function.
		}
		
		public function add3DAnimation():void
		{
			// Override this function.
		}
		
	}
}