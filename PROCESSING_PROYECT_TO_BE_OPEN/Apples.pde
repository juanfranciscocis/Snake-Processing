class Apples {

  //CONSTRUCTOR PARA UN OBJETO APPLE
  Apples(int x, int y, PImage Image) {
    //SE AIGNA PATRON DE LA SERPIENTE
    setImage(Image); //SETEO LA IMAGEN CORRESPONDIENTE DE CADA MANZANA
    setFoodXandY(x, y);   //LA PRIMERA COMIDA COMIENZA EN LA POSICION CENTRAL DE LA PANTALLA POR ESO TENEMOS 15 COMO VALORES INICIALES, LA PANTALLA TIENE 30 CUADRADOS DE ANCHO Y LARGO
  }




  //FUNCIONES SET y GET

  void setImage(PImage Img) {
    IMG = Img;
  }
  PImage getImage() {
    return IMG;
  }

  //FUNCION SET PARA LA POSICION DE LA COMIDA
  void setFoodXandY(int foodX_, int foodY_) {
    foodX = foodX_;
    foodY = foodY_;
  }


  //FUNCION PARA VERIFICAR SI UNA MANZANA ROJA HA SIDO COMIDA
  void posXposYAppleRed() { 
    if ( (x.get(0) == foodX && y.get(0) == foodY)) {
      //LA COMIDA NO PUEDE GENERARSE AFUERA DE LOS BORDES DE LA PANTALLA
      foodX= (int)random(0, widthScreen); 
      foodY= (int)random(0, heightOfScreen);
      speed-=2; //VELOCIDAD AUMENTA AL COMERSE UNA MANZANA ROJA
      touchApple = true; //VARIABLE PASA A VERDADERO PARA QUE LA SERPIENTE CRESCA UNO DE TAMANO
      scoreFinal+=2; //SE AGREGAN 2 PUNTOS AL PUNTAJE FINAL
      foodSoundRedGold.play();//SONIDO DE COMIDA

      goldApple.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS MANZANAS PARA COMPLICAR EL JUEGO
      blueApple.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS MANZANAS PARA COMPLICAR EL JUEGO
    }
  }

  //FUNCION PARA VERIFICAR SI UNA MANZANA DORADA HA SIDO COMIDA
  void posXposYAppleGold() {
    if ( (x.get(0) == foodX && y.get(0) == foodY)) {
      //LA COMIDA NO PUEDE GENERARSE AFUERA DE LOS BORDES DE LA PANTALLA
      foodX= (int)random(0, widthScreen); 
      foodY= (int)random(0, heightOfScreen);
      speed++; //VELOCIDAD DISMINUYE AL COMERSE UNA MANZANA ROJA
      touchApple = true; //VARIABLE PASA A VERDADERO PARA QUE LA SERPIENTE CRESCA UNO DE TAMANO
      scoreFinal--;  //SE QUITA 1 PUNTO AL PUNTAJE FINAL
      foodSoundRedGold.play();//SONIDO DE COMIDA
      
      
      blueApple.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS MANZANAS PARA COMPLICAR EL JUEGO
      redApple.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS MANZANAS PARA COMPLICAR EL JUEGO
      
      
      wall.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall1.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall2.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall3.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall4.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall5.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall6.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
    }
  }

  //FUNCION PARA VERIFICAR SI UNA MANZANA AZUL HA SIDO COMIDA
  void posXposYAppleBlue() { 
    if ( (x.get(0) == foodX && y.get(0) == foodY)) {
      //LA COMIDA NO PUEDE GENERARSE AFUERA DE LOS BORDES DE LA PANTALLA
      foodX= (int)random(0, widthScreen); 
      foodY= (int)random(0, heightOfScreen);
      speed = 15; //VELOCIDAD REGRESA A VALOR POR DEFECTO
      touchApple = true; //VARIABLE PASA A VERDADERO PARA QUE LA SERPIENTE CRESCA UNO DE TAMANO
      scoreFinal+=11; //SE AGREGAN 11 PUNTOS AL PUNTAJE FINAL DEBIDO A QUE ES UNA MANZANA AZUL
      foodSoundBlue.play();//SONIDO SIUUU
      
      wall.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall1.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall2.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall3.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall4.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall5.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      wall6.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS PAREDES PARA COMPLICAR EL JUEGO
      
      goldApple.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS MANZANAS PARA COMPLICAR EL JUEGO
      redApple.setFoodXandY(int(random(0, 30)), int(random(0, 30))); //MUEVO LAS MANZANAS PARA COMPLICAR EL JUEGO
    }
  }







  //FUNCION QUE MUESTRA EN PANTALLA A LAS MANZANAS
  void showApple() {
    image(IMG, foodX*squaresScreen, foodY*squaresScreen);
  }



  //POSICION DE LA COMIDA:
  int foodX;
  int foodY;

  //IMAGEN DE MANZANA
  PImage IMG;
}
