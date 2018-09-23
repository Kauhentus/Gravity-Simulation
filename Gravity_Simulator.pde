Object[] objects;

float inertia_fac = 0.9; // less than 1 more inertia, more than 1 less inertia
float distance_fac = 0.01; // smaller = faster speed
float step = 0.001;
boolean trail = false;
int object_count = 50; //do not go above 255

void setup(){
  background(100);
  frameRate(120);
  size(800, 800);
  colorMode(HSB);
  
  objects = new Object[object_count];

  for(int i = 0; i < objects.length; i++){
    objects[i] = new Object(random(100, width - 100), random(100, height - 100), random(10, 3200));
  }
}

void draw(){
  if(!trail){
    background(100);
  }
  
  for(int i = 0; i < objects.length; i++){
    for(int j = 0; j < objects.length; j++){
      if(i != j){
        objects[i].update_forces(objects[j]);
      }
    }
  }
  
  noStroke();
  for(int i = 0; i < objects.length; i++){
    fill(255 / objects.length * i, 255, 255);
    
    objects[i].update();
    objects[i].draw_object();
  }
}
