package com.jfw.engine.motion
{
	import com.jfw.engine.animation.AtlasObject;
	import com.jfw.engine.animation.BmdMovieClip;
	import com.jfw.engine.animation.Texture;

	/**
	 * 多状态MovieClip
	 * 
	 */	
	public class MutiStateMovieClip extends BmdMovieClip
	{
		/** 
		 * @param keyFrams		关键帧列表。MutiStateMovieClip将使用向量首个元素作为当前播放帧
		 * @param fps			帧频
		 */		
		public function MutiStateMovieClip(atlasObj:AtlasObject, fps:Number=12)
		{
			super(atlasObj, fps);
		}
		
		private function updateStartTime(index:int):void
		{
			if(index>0)
			{
				mStartTimes[index] = mStartTimes[index-1] + mDurations[index-1];
			}
			else
			{
				mStartTimes.length = 0;
				mStartTimes[index]=0; 
			}
		}
		
		/**  
		 * 改变当前MovieClip所用动画纹理序列 
		 * 
		 */
		protected function changeTextures(atlasObj:AtlasObject):void
		{
			stop();
			
			this.xOffset=atlasObj.xOffset;
			this.yOffset=atlasObj.yOffset;
			var len:int = atlasObj.textures.length;
			
			if(len>numFrames)
			{
				for(var i:int=0; i<len; i++)
				{
					if( i < numFrames )
					{
						setFrameTexture(i, atlasObj.textures[i]);//改变动画中该帧纹理
						updateStartTime(i);
					}
					else
					{
						addFrameAt(i, atlasObj.textures[i]);
					}
				}
			}
			else if(len==numFrames)
			{
				for(var j:int=0; j<len; j++)
				{				
					setFrameTexture(j, atlasObj.textures[j]);
					updateStartTime(j);
				}
			}
			else//if(len<numFrames)
			{
				var len2:int=numFrames;
				
				for(var k:int=0; k<len2; k++)
				{
					if( k < len )
					{
						setFrameTexture(k, atlasObj.textures[k]);
						updateStartTime(k);
					}
					else
					{
						removeFrameAt(numFrames-1);
					}
				}
			}
			
			play();
		}
	}
}