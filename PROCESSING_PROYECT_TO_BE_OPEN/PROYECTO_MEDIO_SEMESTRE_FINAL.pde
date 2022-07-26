//CREO DOS ARRAYLIST: UNO PARA LA POSICION X Y OTRO PARA LA POSICION Y DE LA SERPIENTE, USO ARRAY LIST DEBIDO A QUE PUEDO MODIFICAR LOS VALORES DE ESTOS CON FUNCIIONES DE LA CLASE ARRAYLIST
ArrayList<Integer> x = new ArrayList<Integer>();
ArrayList<Integer>y = new ArrayList<Integer>();
//VOY A TENER UNA CUADRICULA DE 30 CUADRADOS POR 30 CUADRADOS
int widthScreen=30, heightOfScreen=30;
//ESTE ES EL TAMANO DE CADA CUADRADO, SE OBTIENE DIVIDIENDO EL ANCHO/2, DEBIDO A QUE ES UN CUADRADO ESTE SERIA DE 20X20
int squaresScreen=20;
//DIRECCION INICIAL DE LA QUE EMPIEZA LA SERPIENTE, VA A IR HACIA LA DERECHA DEBIDO A QUE COMIENZA EN LA PARTE CENTRAL IZQUIERDA DE LA PANTALLA POR ESO SE ASIGNA 2
int direction=2; 
//ARRAYS PARA MOVER A LA SERPIENTE
int[]x_direction={0, 0, 1, -1};
int[]y_direction={1, -1, 0, 0};
//LA PRIMERA COMIDA ROJA COMIENZA EN LA POSICION CENTRAL DE LA PANTALLA POR ESO TENEMOS 15 COMO VALORES INICIALES, LA PANTALLA TIENE 30 CUADRADOS DE ANCHO Y LARGO
int foodXRED=15;
int foodYRED=15;
//LA PRIMERA COMIDA ROJA COMIENZA EN LA POSICION CENTRAL DE LA PANTALLA POR ESO TENEMOS 15 COMO VALORES INICIALES, LA PANTALLA TIENE 30 CUADRADOS DE ANCHO Y LARGO
int foodXGOLD=10;
int foodYGOLD=10;
//VELOCIDAD SE INCREMENTARA
int speed = 15;
//PUNTAJE FINAL
int scoreFinal = 0;
//VARIABLE DE VERIFICACION SI SE TOPO ALGUNA MANZANA
boolean touchApple = false;
//DEFINO 2 OBJETOS DE LA CLASE APPLES
Apples redApple;
Apples goldApple;
Apples blueApple;
Walls wall, wall1, wall2, wall3, wall4, wall5, wall6;
//PORQUE SE MURIO EL USUARIO?
String deadType="UNKNOWN";

//MUERTE DE LA SERPIENTE
boolean gameover=false;

//SONIDO LIBRERIA
import processing.sound.*;
SoundFile foodSoundRedGold, foodSoundBlue, gameSound, gameoverSound; //CREACION DE OBJETOS DE SONIDO
//GUARDADO DE PUNTAJES
String[] leaderBoard;

//MENUS
PImage mainMenu, controlsMenu, scoreMenu, redAppleImg, snakeImg, blueAppleImg, goldAppleImg, wallImg, gameImg;

//MAIN MENU BOOLEAN
boolean mainboolean = false;


void setup() { 
  size(600, 600); 
  //POSICION INICIAL DE LA SERPIENTE
  x.add(0); 
  y.add(15);

  //MANZANAS CARGA DE IMAGEN Y PARED
  redAppleImg = loadImage("RedApple.png");
  blueAppleImg = loadImage("BlueApple.png");
  goldAppleImg = loadImage("GoldApple.png");
  wallImg = loadImage("Wall.png");

  //CREACION DEL OBJETO MANZANAS
  redApple = new Apples( 15, 15, redAppleImg);
  goldApple = new Apples(10, 20, goldAppleImg);
  blueApple = new Apples( 15, 5, blueAppleImg);


  //CREACION DE PAREDES DE LA CLASE WALLS
  createWalls();



  //CARGO SONIDO COMIDA ROJA Y DORADA
  foodSoundRedGold = new SoundFile(this, "1.wav");
  //CARGO SONIDO COMIDA AZUL
  foodSoundBlue = new SoundFile(this, "Siuu.wav");
  //CARGO PERDIDA DE JUEGO SONIDO
  gameoverSound = new SoundFile(this, "gameover.wav");
  //CARGO SONIDO DE JUEGO
  gameSound = new SoundFile(this, "ps4.wav");

  //CARGO IMAGEN DE FONDO DEL JUEGO
  gameImg = loadImage("Game.png");
  //CARGO IMAGEN MENU PRINCIPAL
  mainMenu = loadImage("Artboard 3.png");
  //CARGO IMAGEN MENU DE CONTROLES
  controlsMenu =loadImage("Artboard 1.png");
  //CARGO IMAHEN MENU SCORE
  scoreMenu = loadImage("Artboard 4.png");
  //CARGO LA IMAGEN DE LA SERPIENTE
  snakeImg = loadImage("Snake.png");

  //ASIGNO UN VOLUMEN Y QUE SE DE PLAY A LA CANCION QUE SONARA DURANTE TODO EL JUEGO
  gameSound.play();
  gameSound.amp(0.2);
}   
void draw() {  
  //ASIGNO EL FONDO DEL JUEGO POR DONDE SE MUEVE LA SERPIENTE
  background(gameImg);



  if (mainboolean == false) {
    image(mainMenu, 0, 0); //MUESTRO LA PANTALLA INICIAL DEL JUEGO CUANDO COMIENZA A CORRER EL PROGRAMA

    if (keyCode == ENTER) {
      mainboolean = true; //EN CASO DE PRESIONAR ENTER CAMBIA LA VARIABLE PARA QUITAR EL MENU Y COMENZAR EL JUEGO
    } else if (keyCode == SHIFT) {
      image(controlsMenu, 0, 0); // EN CASO DE PRESIOANR SHIFT MUESTRO LA PANTALLA DE CONTROLES
    }
  } else {
    //GENERACION DE LA CUADRILLA 
    showRowsAndColumns();

    //GENERO LA SERPIENTE
    generateSnake();

    if (!gameover) {  //EN CASO DE NO PERDER

      if (scoreFinal !=0) { //EN CASO DE QUE EL PUNTAJE DEL USUARIO ES 0 QUE SUCEDE CUANDO COMIENZA EL JUEGO A CORRER, NO MUESTRO PAREDES PARA HACER QUE LA PRIMERA MANZANA SE MUESTRE SOLA EN PANTALLA
        drawWalls();//SE MUESTRAN LAS PAREDES
      }

      if (scoreFinal % 10 == 0  && scoreFinal !=0 ) { //LA MANZANA AZUL SE MUESTRA SOLO SI EL PUNTAJE ES MULTIPLO DE 10 DEBIDO A QUE ES MUY OVER POWERED
        blueApple.showApple(); //SE MUESTRA LA MANZANA AZUL
      }

      redApple.showApple(); //SIEMPRE SE MUESTRA LA MANZANA ROJA


      if (scoreFinal >= 2) { //LA MANZANA DORADA NO SE MUESTRA SI EL PUNTAJE ES MUY BAJO, EVITA BUG DE MENU PRINCIPAL Y ADEMAS EVITA PUNTAJES MENORES A 0
        goldApple.showApple(); //SE MUESTRA LA MANZANA DORADA
      }


      if (touchApple == true) {  //CAMBIO DE CHEQUEO DE VARIABLE, ESTO SE DEBE EJECUTAR ANTES DEL CHEQUEO POR SI LA SERPIENTE YA TOCO UNA MANZANA, DEBIDO A QUE SI NO NO SE GENERAN NUEVAS MANZANAS
        touchApple  = false;
      }

      if (speed == 0) { //EVITO UN BUG QUE HABIA EN LA ANTERIOR VERSION DONDE SE PODIA HACER UNA DIVISION PARA 0 LO CUAL CAUSABA UN PROBLEMA LOGICO FATAL
        speed = 1;
      }

      if (frameCount%speed==0) { //COMO PROCESSING USA 60 FRAMES POR SEGUNDO EN DRAW, LE DIGO AL PROGRAMA QUE CADA X TIEMPO EN SU FRAME RATE MUEVA LA SERPIENTE Y LA HAGA LARGA MAS UNO SIEMPRE
        makeSnakeLonger(); //SIEMPRE ALARGO LA SERPIENTE PASE LO QUE PASE

        snakeTouchBorder(); //LA SERPIENTE TOCO EL BORDE DE LA PANTALLA?

        snakeEatself(); //LA SERPIENTE SE AUTO CHOCA ?

        //CHEQUEO SI UNA MANZANA HA SIDO COMIDA
        redApple.posXposYAppleRed();
        goldApple.posXposYAppleGold();
        blueApple.posXposYAppleBlue();

        if (touchApple == false) {
          snakeDidntEat(); //LA SERPIENTE NO COMIO UNA MANZANA?
        }
      }
    } else {
      menuLeaderBoard(); //EN CASO DE MORIR, MUESTRO EL SCORE BOARD
    }
  }
}


//FUNCION PARA MOVER LA SERPIENTE CON LAS FLECHAS
void keyPressed() { 
  int newdir=keyCode == DOWN? 0:(keyCode == UP?1:(keyCode == RIGHT?2:(keyCode == LEFT?3:-1)));
  if (newdir != -1) direction = newdir;
}
