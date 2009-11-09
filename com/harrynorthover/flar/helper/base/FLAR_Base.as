package com.harrynorthover.flar.helper.base
{
	import com.harrynorthover.flar.helper.interfaces.IFlarToolkitBase;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.utils.ByteArray;
	
	import org.libspark.flartoolkit.core.FLARCode;
	import org.libspark.flartoolkit.core.param.FLARParam;
	import org.libspark.flartoolkit.core.raster.rgb.FLARRgbRaster_BitmapData;
	import org.libspark.flartoolkit.core.transmat.FLARTransMatResult;
	import org.libspark.flartoolkit.detector.FLARSingleMarkerDetector;
	
	public class FLAR_Base extends Sprite implements IFlarToolkitBase
	{
		
		// This is the pattern that FLAR will look for to display the objects from.
		[Embed(source="../assets/HN_Marker.pat", mimeType="application/octet-stream")]
		private var pattern:Class;
		
		// The data used to setup the camera for best performence. 
		[Embed(source="../assets/camera_para.dat", mimeType="application/octet-stream")]
		private var params:Class;
		
		private var mpattern:FLARCode;
		private var cam:Camera;
		private var _movieWidth:int;
		private var _movieHeight:int;
		private var _frameRate:int;
		
		private var _camParametersURL:String;
		private var _patternURL:String;

		// PROTECTED VARS...
		protected var raster:FLARRgbRaster_BitmapData;
		protected var detector:FLARSingleMarkerDetector;
		protected var tmr:FLARTransMatResult;
		protected var vid:Video;
		
		//PUBLIC VARS...
		public var bmd:BitmapData;
		public var fparams:FLARParam;
		
		public function Init(movieWidth:int = 640, movieHeight:int = 480, frameRate:int = 30):void
		{
			_movieWidth = movieWidth;
			_movieHeight = movieHeight;
			_frameRate = frameRate;
			
			setFLAR();
			setCamera();
			setBitmap();
			setDetector();
		}

		public function setFLAR():void
		{
			fparams = new FLARParam();
			fparams.loadARParam(new params() as ByteArray);
			
			mpattern = new FLARCode(16,16);
			mpattern.loadARPatt(new pattern());	
		}
		
		public function setCamera():void
		{
			vid = new Video(_movieWidth, _movieHeight);
			cam = Camera.getCamera();
			cam.setMode(_movieWidth, _movieHeight, _frameRate);
			vid.attachCamera(cam);
			addChild(vid);
		}
		
		public function setBitmap():void
		{
			bmd = new BitmapData(_movieWidth, _movieHeight);
			bmd.draw(vid);
		}
		
		public function setDetector():void
		{
			raster = new FLARRgbRaster_BitmapData(bmd);
			detector = new FLARSingleMarkerDetector(fparams, mpattern, 80);
		}
	}
}