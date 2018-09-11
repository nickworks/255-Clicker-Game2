package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * This is the controller class for the entire Game.
	 */
	public class Game extends MovieClip {
		
		/** This array should only hold Snow objects. */
		var snowflakes:Array = new Array();
		/** The number frames to wait before spawning the next Snow object. */
		var delaySpawn:int = 0;
		
		
		/**
		 * This is where we setup the game.
		 */
		public function Game() {
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		/**
		 * This event-handler is called every time a new frame is drawn.
		 * It's our game loop!
		 * @param e The Event that triggered this event-handler.
		 */
		private function gameLoop(e:Event):void {
			
			spawnSnow();
			
			updateSnow();
			
			
		} // function gameLoop
		
		/**
		 * Decrements the countdown timer, when it hits 0, it spawns a snowflake.
		 */
		private function spawnSnow(){
			// spawn snow:
			delaySpawn --;
			if(delaySpawn <= 0){
				var s:Snow = new Snow();
				addChild(s);
				snowflakes.push(s);
				delaySpawn = (int)(Math.random() * 10 + 10);
			}
		}
		
		private function updateSnow(){
			// update everything:
			for(var i = snowflakes.length - 1; i >= 0; i--){
				snowflakes[i].update();
				if(snowflakes[i].isDead){
					// remove it!!
					
					// 1. remove any event-listeners on the object
					snowflakes[i].dispose();
					
					// 2. remove the object from the scene-graph
					removeChild(snowflakes[i]);
					
					// 3. nullify any variables pointing to it
					// if the variable is an array,
					// remove the object from the array
					snowflakes.splice(i, 1);
				}
			} // for loop updating snow
		}
		
	} // class Game
} // package
