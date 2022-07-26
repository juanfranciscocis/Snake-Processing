
class Walls extends Apples {

  Walls(int x, int y, PImage wallImage) {
    super(x, y, wallImage); //USO EL CONSTRUCTOR DE LA CLASE APPLES
  }

  void showWall() {
    image(IMG, foodX*squaresScreen, foodY*squaresScreen); //MUESTRO UNA PARED EN LA POSICON DADA Y CON LA IMAGEN DE PARED ILUSTRADA
  }

  //FUNCION PARA VERIFICAR SI UNA PARED HA SIDO TOPADA
  void posXposYWall() { 
    if ( (x.get(0) == foodX && y.get(0) == foodY)) {
      //LA COMIDA NO PUEDE GENERARSE AFUERA DE LOS BORDES DE LA PANTALLA
      foodX= (int)random(0, widthScreen); 
      foodY= (int)random(0, heightOfScreen);
      deadType = "WALL CRASH"; //TIPO DE MUERTE MOSTRADA AL USUARIO
      gameover = true; //MUERTE
      gameoverSound.play(); //SONIDO DE MUERTE
    }
  }
}


void createWalls() {
  //CREACION DE PAREDES DE LA CLASE MANZANAS
  wall = new Walls( int(random(0, 30)), int(random(0, 30)), wallImg);
  wall1 = new Walls( int(random(0, 30)), int(random(0, 30)), wallImg);
  wall2 = new Walls( int(random(0, 30)), int(random(0, 30)), wallImg);
  wall3 = new Walls(  int(random(0, 30)), int(random(0, 30)), wallImg);
  wall4 = new Walls(  int(random(0, 30)), int(random(0, 30)), wallImg);
  wall5 = new Walls(  int(random(0, 30)), int(random(0, 30)), wallImg);
  wall6 = new Walls(  int(random(0, 30)), int(random(0, 30)), wallImg);
}



void drawWalls() {
  //MUESTO LAS PAREDES EN PANTALLA

  wall.showWall();
  wall1.showWall();
  wall2.showWall();
  wall3.showWall();
  wall4.showWall();
  wall5.showWall();
  wall6.showWall();


  wall.posXposYWall();
  wall1.posXposYWall();
  wall2.posXposYWall();
  wall3.posXposYWall();
  wall4.posXposYWall();
  wall5.posXposYWall();
  wall6.posXposYWall();
}
