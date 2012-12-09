package com.pianfeng.engine.utils 
{
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	
	public class CollisionDetection{
		static public function checkForCollision(parentObj: DisplayObject,
												 p_clip1:DisplayObject,
												 p_clip2:DisplayObject,
												 p_alphaTolerance:Number=255):Rectangle {
			// get bounds:
			var bounds1:Rectangle = p_clip1.getBounds(parentObj);
			var bounds2:Rectangle = p_clip2.getBounds(parentObj);
		
			// rule out anything that we know can't collide:
			if (((bounds1.right < bounds2.x) || (bounds2.right < bounds1.x)) || ((bounds1.bottom < bounds2.y) || (bounds2.bottom < bounds1.y)) ) {
				return null;
			}
		
			// determine test area boundaries:
			var bounds:Rectangle = new Rectangle();
			bounds.x = Math.max(bounds1.x,bounds2.x);
			bounds.right = Math.min(bounds1.right,bounds2.right);
			bounds.y = Math.max(bounds1.y,bounds2.y);
			bounds.bottom = Math.min(bounds1.bottom,bounds2.bottom);
		
			// set up the image to use:
			
			if ((bounds.width < 1) || (bounds.height < 1)) return null;
			//BitmapData argu width and heigth must >= 1
			var img:BitmapData = new BitmapData(bounds.width,bounds.height,false);
		    
			// draw in the first image:
			var mat:Matrix = p_clip1.transform.concatenatedMatrix;
			mat.tx -= bounds.x;
			mat.ty -= bounds.y;
			img.draw(p_clip1,mat, new ColorTransform(1,1,1,1,255,-255,-255,p_alphaTolerance));
		
			// overlay the second image:
			mat = p_clip2.transform.concatenatedMatrix;
			mat.tx -= bounds.x;
			mat.ty -= bounds.y;
			img.draw(p_clip2,mat, new ColorTransform(1,1,1,1,255,255,255,p_alphaTolerance),"difference");
		
			// find the intersection:
			var intersection:Rectangle = img.getColorBoundsRect(0xFFFFFFFF,0xFF00FFFF);
		
			// if there is no intersection, return null:
			if (intersection.width == 0) { return null; }
		
			// adjust the intersection to account for the bounds:
			intersection.x += bounds.x;
			intersection.y += bounds.y;

			return intersection;
		}
	}
}