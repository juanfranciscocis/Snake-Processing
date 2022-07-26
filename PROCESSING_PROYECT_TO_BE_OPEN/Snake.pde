void generateSnake() {
  //GENERACION DE LA SERPIENTE
  for (int i = 0; i < x.size(); i++) {
    image(snakeImg, x.get(i)*squaresScreen, y.get(i)*squaresScreen); //TOMO LA IMAGEN DE LA SERPIENTE Y LA MUESTRO EN PANTALLA EN LA POSICION DESEADA DEL ARRAY
  }
}

void makeSnakeLonger() {
  //ALARGO EL ARRAY EN 1 
  x.add(0, x.get(0) + x_direction[direction]); 
  y.add(0, y.get(0) + y_direction[direction]);
}

void snakeDidntEat() {
  //EN CASO DE QUE LA SERPIENTE NO COMA EN ESE FRAME SE REMUEVE 1 A LA COLA
  x.remove(x.size()-1); 
  y.remove(y.size()-1);
}

void snakeTouchBorder() {
  //LA SERPIENTE MUERE SI TOCA LOS BORDES DE LA PANTALLA
  if (x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= widthScreen || y.get(0) >= heightOfScreen) {
    gameover = true;  //MUERTE DE LA SERPIENTE VERDADERO
    deadType = "BOUND CRASH"; //SE MENCIONA AL USUARIO EL TIPO DE MUERTE
    gameoverSound.play(); //SE ESCUCHA EL SONIDO DE LA MUERTE
  }
}

void snakeEatself() {
  //LA SERPIENTE MUERE SI SE CHOCA CON SI MISMA
  for (int i=1; i<x.size(); i++) {
    if (x.get(0)==x.get(i)&&y.get(0)==y.get(i)) {
      gameover=true; //MUERTE DE LA SERPIENTE VERDADERO
      deadType = "EAT YOURSELF"; //SE MENCIONA AL USUARIO EL TIPO DE MUERTE
      gameoverSound.play(); //SE ESCUCHA EL SONIDO DE LA MUERTE
    }
  }
}
