class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float speed = 2f;
  
  boolean checkX;
  boolean checkY;

  Robot(float x, float y){
    super(x,y);
  }
  
  void display(){
    pushMatrix();
    translate(x, y);
    if(speed!= 0){
      int direction = (speed > 0 ) ? RIGHT : LEFT;
          if (direction == RIGHT) {
            scale(1, 1);
            image(robot, 0, 0, w, h); 
          } else {
            scale(-1, 1);
            image(robot, -w, 0, w, h); 
          }
        
    }else if (player.x>x){
            scale(1, 1);
            image(robot, 0, 0, w, h);

    }else{
            scale(-1, 1);
            image(robot, -w, 0, w, h); 
    
    }
    popMatrix();
    
  }
  void update(){
    //if (checkY){
    //  laser.display();
    //}else{
    x += speed;
    if(x+w>=width || x<=0)speed*=-1;
    if(player.y <= y+PLAYER_DETECT_RANGE_ROW*80 && player.y >= y-PLAYER_DETECT_RANGE_ROW*80){
      if((speed>=0 && player.x>x) || (speed<0 && player.x<x)){
        speed = 0;
     
        checkY = true;
      
    }
      


    }
  }
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
