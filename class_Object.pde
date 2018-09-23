class Object{
  float x, y, mass;
  PVector forces;
  PVector inertia;
  Object(float x, float y, float mass){
    this.x = x; this.y = y;
    this.mass = mass;
    forces = new PVector(0, 0);
    inertia = new PVector(0, 0);
  }
  
  void update_forces(Object o){
    forces = new PVector(0, 0);
    
    //figure something out with mass of o, mass of this, dist btwn o and this
    float force = o.mass / this.mass;
    float distance_x = abs(this.x - o.x) * distance_fac;
    
    if(distance_x < 1) distance_x = 1;
    float pull_x = force / distance_x;
    
    
    if(this.x > o.x){
      forces.x -= pull_x;
      inertia.x -= pull_x / inertia_fac / (force * inertia_fac);
    } else {
      forces.x += pull_x;
      inertia.x += pull_x / inertia_fac / (force * inertia_fac);
    }
    
    
    float distance_y = abs(this.y - o.y) * distance_fac;
    
    if(distance_y < 1) distance_y = 1;
    float pull_y = force / distance_y;
    
    if(this.y > o.y){
      forces.y -= pull_y;
      inertia.y -= pull_y / inertia_fac / (force * inertia_fac);
    } else {
      forces.y += pull_y;
      inertia.y += pull_y / inertia_fac / (force * inertia_fac);
    }
  }
  
  void update(){
    this.x += step * (forces.x + inertia.x);
    this.y += step * (forces.y + inertia.y);
  }
  
  void draw_object(){
    if(!trail){
      ellipse(x, y, 10, 10);
    } else {
      ellipse(x, y, 2, 2);
      
    }
  }
}
