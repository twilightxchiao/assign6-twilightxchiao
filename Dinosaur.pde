class Dinosaur extends Enemy{
  Dinosaur(float   x, float y){
    super(x,y);
  }
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float currentSpeed = 1;


  void display(){
    int direction = (currentSpeed > 0) ? RIGHT : LEFT;
      pushMatrix();
        translate(x, y);
        if (direction == RIGHT) {
          scale(1, 1);
          image(dinosaur, 0, 0, w, h); 
        } else {
          scale(-1, 1);
          image(dinosaur, -w, 0, w, h); 
        }
      popMatrix();
  }
  void update(){ 
      if(player.y == y && (currentSpeed>0 && player.x>x) || (currentSpeed<0 && player.x<x ) ){
        x += currentSpeed*TRIGGERED_SPEED_MULTIPLIER;
    }else{
      x += currentSpeed;
  }
    if(x+w>=width || x<=0)currentSpeed*=-1; 

  }
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
