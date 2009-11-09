package com.harrynorthover.utils
{
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.special.LineMaterial;
	
	public class RandomFunctions
	{
		public function randVertex():Vertex3D 
		{
			return new Vertex3D(randNum(),randNum(),randNum());
		}

		public function randLineMaterial():LineMaterial 
		{
			return new LineMaterial(randColor());
		}
	 
		public function randColor():Number 
		{
			return Math.floor((Math.random() * 0xFFFFFF));
		}
		
		public function randNum():Number 
		{
			return 800 - (Math.random() * 1600);
		}
	}
}