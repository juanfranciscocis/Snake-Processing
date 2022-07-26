int counterLeader = 0;
PFont arcade;
void menuLeaderBoard() {

  //PANTALLA FINAL DE MUERTE, SE MUESTRA EL PUNTAJE FINAL Y SE ASIGNA VARIABLES A VALORES POR DEFECTO

  if (scoreFinal <= 0) {
    scoreFinal =0;
  }

  //ESTE CONTADOR ES NECESARIO DEBIDO A QUE SI NO REPETIRIAMOS ESTE CODIGO 60 VECES POR SEGUNDO
  if (counterLeader == 0) {
    //LEADERBOARD
    String[] loadScore =  loadStrings("LEADER_BOARD.txt"); //CARGO EL ARCHIVO DE LOS PUNTAJES
    String getScore=""; //VARIABLE DE GUARDADO TEMPORAL DE MEMORIA
    //RECORRO TODOS LOS PUNTAJES EN EL TXT
    for (int i = 0; i<5; i++) {
      getScore += loadScore[i] + " "; //CONCATENO ESOS PUNTAJES Y LOS GUARDO EN UNA VARIBLE PARA NO PERDERLOS NI SOBREESCRIBIRLOS
    }
    String saveScore = str(scoreFinal) + " " + getScore; //AGREGO EL NUEVO PUNTAJE A UN ARRAY DE STRINGS
    //SEPARO Y GUARDO EL STRING NUEVO EN EL TXT
    leaderBoard = split(saveScore, " "); 
    saveStrings("LEADER_BOARD.txt", leaderBoard);
    counterLeader++;
  }

  image(scoreMenu, 0, 0);
  fill(0, 0, 0); 
  textSize(30); 
  textAlign(CENTER); 
  text("YOUR SCORE: " + "\n" + leaderBoard[0]+ "\n BEFORE: \n" + leaderBoard[1] +  "\n" + leaderBoard[2]+  "\n" + leaderBoard[3]+  "\n" + leaderBoard[4]+  "\n" + leaderBoard[5] + "\n DEAD TYPE: \n" + deadType, width/2, height/3.5);
  arcade = createFont("ARCADE_I.TTF", 12);
  textFont(arcade);



  if (keyCode == TAB) { 
    x.clear(); 
    y.clear(); 
    x.add(0);  
    y.add(15);
    direction = 2;
    speed = 15;
    gameover = false;
    counterLeader=0;
    mainboolean = false;

    scoreFinal = 0;
    redApple.setFoodXandY(15, 15);
    goldApple.setFoodXandY(15, 15);
    wall.setFoodXandY(int(random(0, 30)), int(random(0, 30)));
    wall1.setFoodXandY(int(random(0, 30)), int(random(0, 30)));
    wall2.setFoodXandY(int(random(0, 30)), int(random(0, 30)));
    wall3.setFoodXandY(int(random(0, 30)), int(random(0, 30)));

    image(mainMenu, 0, 0);
  }
}


void showRowsAndColumns() {
  //GENERACION DE LA CUADRILLA 
  stroke(50);
  for (int i = 0; i<widthScreen; i++) {
    line(0, i*squaresScreen, width, i*squaresScreen);
  }
  for (int j = 0; j < heightOfScreen; j++) {
    line(j*squaresScreen, 0, j*squaresScreen, height);
  }
}
