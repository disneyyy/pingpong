/*
ping-pong
*/
final int gameStart = 0, gameEndless = 2, gameClassic = 1, gameBattle = 3, gameWin = 4, gameLose = 5, gameOver = 6, gamePause = 7, gameReset = 8;
int gameState;

int i, gameMode = 1;
int color1 = 255, color2 = 0, color3 = 0, colorEndless = 0, colorClassic = 255, colorBattle = 0;

int numberX, numberY;
int numberW;

int gamemodeX, gamemodeY;
int gamemodeW, gamemodeH;

int padW, padH;

//p2 is computer
//PImage illuminati, illuminati2;
int p1X, p2X;
int p1L = 100, p2L = 100;
float p1Y, p2Y, speedP2Y, p2YN;

int ballX, ballY;
int speedX, speedY, speedN;
int ballR;

int upOrDown;
int life = 3;


int difficulty = 1;

int circle;

int pauseColor = 0;
int conColor = 0;
int startColor = 0;

int scoreboardX, scoreboardY, scoreboardW, scoreboardH;
int score = 0;
int [] bestCl = new int [5];
int [] bestEn = new int [5];
void setup(){
  size(1200,900);
  gameState = 0;
  //textFont(createFont("font/Square_One.ttf", 20)); 
  textSize(width/12);
  textAlign(CENTER);
  //Pad
  padW = width/80;
  padH = width/20;
  p1X = width-width/16;
  p1Y = mouseY;
  
  p2X = width/16;
  p2Y = height/2;
  //illuminati = loadImage("pic/illuminati.png");
  //illuminati2 = loadImage("pic/illuminati2.png");
  
  numberX = width/4;
  numberY = height/7*2;
  numberW = height/15;
  
  gamemodeX = width/2;
  gamemodeY = height/6;
  gamemodeW = width/5;
  gamemodeH = height/15;
  
  ballX = width/2;
  ballY = width/2;
  speedX = -1*(width/300);
  speedY = floor(random(1,6));
  if(floor(random(0,2)) == 1){
     upOrDown = 1;
  }else{
    upOrDown = -1;
  }
  ballR = width/40;
  
  scoreboardX = width/2;
  scoreboardY = height/15;
  scoreboardW = width/2;
  scoreboardH = height/15;
  
  for(int i=0; i<bestCl.length; i++){
    bestCl[i] = 0;
    bestEn[i] = 0;
  }
  
}

void draw(){
  switch(gameState){
    case gameStart:
      background(#e8e8d0);
      rectMode(RADIUS);
      noStroke();
      textSize(width/15);
      
      //illuminati
      //image(illuminati, width/16, height/2, height/4,height/4);
      //image(illuminati2, width/16*15-height/4, height/2, height/4,height/4);
      
      fill(0);
      //Difficulty
      text("Difficulty", width/2, height/6);
      /*for(i=1; i<4; i++){
        rect(width/4*i, numberY,width/18 ,width/18);
      }
      */
      textSize(width/12);
      //1
      fill(color1,0,0);
      rect(numberX*1, numberY,numberW ,numberW);
      fill(255);
      text("1", numberX*1, numberY+width/36);
      if(mouseX>=(numberX*1-numberW) && mouseX<=(numberX*1+numberW) && mouseY>=(numberY-numberW) && mouseY<=(numberY+numberW) && mousePressed){
         color1 = 255;
         color2 = 0;
         color3 = 0;
         difficulty = 1;
      }
      
      //2
      fill(color2,0,0);
      rect(numberX*2, numberY,numberW ,numberW);
      fill(255);
      text("2", numberX*2, numberY+width/36);
      if(mouseX>=(numberX*2-numberW) && mouseX<=(numberX*2+numberW) && mouseY>=(numberY-numberW) && mouseY<=(numberY+numberW) && mousePressed){
         color1 = 0;
         color2 = 255;
         color3 = 0;
         difficulty = 2;
      }
      
      //3
      fill(color3,0,0);
      rect(numberX*3, numberY ,numberW ,numberW);
      fill(255);
      text("3", numberX*3, numberY+width/36);
      if(mouseX>=(numberX*3-numberW) && mouseX<=(numberX*3+numberW) && mouseY>=(numberY-numberW) && mouseY<=(numberY+numberW) && mousePressed){
         color1 = 0;
         color2 = 0;
         color3 = 255;
         difficulty = 4;
      }
      
      
      //Game Mode
      fill(0);
      textSize(width/15);
      text("Game Mode",width/2 ,height/2-height/20);
      /*for(i=1; i<3; i++){
        rect(width/2, height/6*(3+i), width/5, width/18);
      }
      */
      
      //Classic
      fill(colorClassic, 0, 0);
      rect(gamemodeX, gamemodeY*(3+1)-height/10, gamemodeW, gamemodeH);
      fill(255);
      text("Classic", gamemodeX, gamemodeY*4+width/36-height/10);
      if(mouseX>=(gamemodeX-gamemodeW) && mouseX<=(gamemodeX+gamemodeW) && mouseY>=(gamemodeY*(3+1)-gamemodeH-height/10) && mouseY<=(gamemodeY*(3+1)+gamemodeH-height/10) && mousePressed){
        colorClassic = 255;
        colorEndless = 0;
        colorBattle = 0;
        gameMode = 1;
        life = 3;
      }
      //Endless
      fill(colorEndless, 0, 0);
      rect(gamemodeX, gamemodeY*(3+2)-height/10, gamemodeW, gamemodeH);
      fill(255);
      text("Endless", gamemodeX, gamemodeY*5+width/36-height/10);
      if(mouseX>=(gamemodeX-gamemodeW) && mouseX<=(gamemodeX+gamemodeW) && mouseY>=(gamemodeY*(3+2)-gamemodeH-height/10) && mouseY<=(gamemodeY*(3+2)+gamemodeH-height/10) && mousePressed){
        colorClassic = 0;
        colorEndless = 255;
        colorBattle = 0;
        gameMode = 2;
        life = 1;
      }
      //Battle
      fill(colorBattle, 0, 0);
      rect(gamemodeX, gamemodeY*(3+3)-height/10, gamemodeW, gamemodeH);
      fill(255);
      text("Battle", gamemodeX, gamemodeY*6+width/36-height/10);
      if(mouseX>=(gamemodeX-gamemodeW) && mouseX<=(gamemodeX+gamemodeW) && mouseY>=(gamemodeY*(3+3)-gamemodeH-height/10) && mouseY<=(gamemodeY*(3+3)+gamemodeH-height/10) && mousePressed){
        colorBattle = 255;
        colorEndless = 0;
        colorClassic = 0;
        gameMode = 3;
        life = 1;
      }
      
      //Info
      
      if(mouseX>(width/8*7-width/15) && mouseX<(width/8*7+width/15) && mouseY>(height/8*7-width/20) && mouseY < (height/8*7+width/20)){
        startColor = 255;
        if(mousePressed){
          gameState = gameMode;
        }
      }else{
        startColor = 0;
      }
      colorMode(RGB);
      fill(startColor, 0, 0);      
      rect(width/8*7, height/8*7, width/15, width/20);
      fill(255);
      textSize(width/18);
      text("Start",width/8*7, height/16*15-height/27); //<>//
      
      break;
//**********************************************
    case gameClassic:
      stroke(0);
      if(difficulty == 4){
        noStroke();
        circle = floor(random(width/50, width/5));
        colorMode(HSB);
        speedN = difficulty;
        for(i = 0; i<50; i++){
          //background(random(0,255),random(0,255),random(0,255));
          fill(random(0,255),255,255);
          ellipse(random(0, width), random(0, height), circle, circle);
        }
      }else{
        background(#e8e8d0);
        speedN = difficulty*2;
      }
      rectMode(RADIUS);
      colorMode(RGB);
      //P1
      fill(#8cea00);
      p1X = width-width/16;
      p1Y = mouseY;
      if(p1Y<height/15*2+width/20){
        p1Y = height/15*2+width/20;
      }
      if(p1Y>height-width/20){
        p1Y = height-width/20;
      }
      //constrain(p1Y, height/15*2+width/20*2, height-width/20*2);
      rect(p1X, p1Y, padW, padH);
      
      //P2
      fill(#642100);
      //p2X = width/16;
      p2Y = ballY;
      //constrain(p1Y, height/15*2+width/20*2, height-width/20*2);
      
      if(p2Y>height-padH){
        p2Y = height-padH;
      }
      if(p2Y<height/15*2+padH){
          p2Y = height/15*2+padH;
      }
      //image(illuminati, p2X-height/12, p2Y-height/17, height/12,height/12);
      rect(p2X, p2Y, padW, padH);

      
      //ball
      fill(0);
      ellipse(ballX, ballY, ballR, ballR);
        ballX += speedX*speedN;
        ballY += speedY*speedN*upOrDown;
      if(ballY < scoreboardH*2+ballR/2 || ballY > height-ballR/2){
        speedY = speedY*-1;
      }
      if(ballX < p2X+padW+ballR/2){
        speedX = speedX*-1;
        if(speedY<0){
          speedY = -1*floor(random(1,6));
        }else{
          speedY = floor(random(1,6));
        }
      }
      if(ballX > p1X-padW-ballR/2 && ballX < p1X-padW && ballY < p1Y+padH && ballY > p1Y-padH){
        speedX = speedX*-1;
        score += 10;
        if(speedY<0){
          speedY = -1*floor(random(1,6));
        }else{
          speedY = floor(random(1,6));
        }
      }
      
      //Score Board
      textSize(width/15);
      fill(#9f5000);
      rect(scoreboardX, scoreboardY, scoreboardW, scoreboardH);
      /*
      fill(0);
      text("Score:", width-width/4, scoreboardH+height/40);
      text(score, width-width/12, scoreboardH+height/40);
      */
      fill(0);
      textSize(width/20);
      text("Score:", width-width/4, scoreboardH+height/18);
      text(score, width-width/12, scoreboardH+height/18);
      
      if(score > bestCl[difficulty]){
        bestCl[difficulty] = score;
      }
      
      text("Best:", width-width/4, scoreboardH);
      text(bestCl[difficulty], width-width/12, scoreboardH);
      
      
      fill(0);
      textSize(width/25);
      text("Balls left", width/15+width/30, width/15);
      for(i=0; i<(life-1); i++){
        ellipse(ballR*(i+1)+width/100*i+width/9+width/15, width/18, ballR, ballR);
      }
      
      //Pause
      fill(pauseColor, 0, 0);
      rect(width/2, scoreboardY, width/18, width/30);
      fill(255);
      textSize(width/30);
      text("Pause", width/2, scoreboardY+width/72);
      if(mouseX>width/2-width/18 && mouseX<width/2+width/18 && mouseY>scoreboardY- width/30 && mouseY<scoreboardY+ width/30){
        pauseColor = 255;
        if(mousePressed){
          gameState = gamePause;
        }
      }else{
        pauseColor = 0;
      }
      
      //Lose
      if(ballX>width+ballR && life>0){
        gameState = gameLose;
        life -= 1;
      }
      
      //Game Over
      if(life == 0){
        gameState = gameOver;
      }
      
      break;
//************************************************
    case gameEndless:
      if(difficulty == 4){
        noStroke();
        circle = floor(random(width/50, width/5));
        colorMode(HSB);
        speedN = difficulty;
        for(i = 0; i<50; i++){
          //background(random(0,255),random(0,255),random(0,255));
          fill(random(0,255),255,255);
          ellipse(random(0, width), random(0, height), circle, circle);
        }
      }else{
        background(#e8e8d0);
        speedN = difficulty*2;
      }
      stroke(0);
      rectMode(RADIUS);
      colorMode(RGB);
      //P1
      fill(#8cea00);
      p1X = width-width/16;
      p1Y = mouseY;
      if(p1Y<height/15*2+width/20){
        p1Y = height/15*2+width/20;
      }
      if(p1Y>height-width/20){
        p1Y = height-width/20;
      }
      //constrain(p1Y, height/15*2+width/20*2, height-width/20*2);
      rect(p1X, p1Y, padW, padH);
      
      //P2
      fill(#642100);
      //p2X = width/16;
      p2Y = ballY;
      if(p2Y>height-padH){
        p2Y = height-padH;
      }
      if(p2Y<height/15*2+padH){
          p2Y = height/15*2+padH;
      }
      //image(illuminati, p2X-height/12, p2Y-height/17, height/12,height/12);
      rect(p2X, p2Y, padW, padH);

      
      //ball
      fill(0);
      ellipse(ballX, ballY, ballR, ballR);
        ballX += speedX*speedN;
        ballY += speedY*speedN*upOrDown;
      if(ballY < scoreboardH*2+ballR/2 || ballY > height-ballR/2){
        speedY = speedY*-1;
      }
      if(ballX < p2X+padW+ballR/2){
        speedX = speedX*-1;
        if(speedY<0){
          speedY = -1*floor(random(1,6));
        }else{
          speedY = floor(random(1,6));
        }
      }
      if(ballX > p1X-padW-ballR/2 && ballX < p1X-padW && ballY < p1Y+padH && ballY > p1Y-padH){
        speedX = speedX*-1;
        score += 1;
        if(speedY<0){
          speedY = -1*floor(random(1,6));
        }else{
          speedY = floor(random(1,6));
        }
      }
      
      //Score Board
      textSize(width/20);
      //textSize(width/15);
      fill(#9f5000);
      rect(scoreboardX, scoreboardY, scoreboardW, scoreboardH);
      /*
      fill(0);
      text("Hits:", width-width/4, scoreboardH+height/40);
      text(score, width-width/12, scoreboardH+height/40);
      */
      
      fill(0);
      text("Hits:", width-width/4, scoreboardH+height/18);
      text(score, width-width/12, scoreboardH+height/18);
      
      fill(0);
      if(score > bestEn[difficulty]){
        bestEn[difficulty] = score;
      }
      
      text("Best:", width-width/4, scoreboardH);
      text(bestEn[difficulty], width-width/12, scoreboardH);
      
      
      //Pause
      fill(pauseColor, 0, 0);
      rect(width/2, scoreboardY, width/18, width/30);
      fill(255);
      textSize(width/30);
      text("Pause", width/2, scoreboardY+width/72);
      if(mouseX>width/2-width/18 && mouseX<width/2+width/18 && mouseY>scoreboardY- width/30 && mouseY<scoreboardY+ width/30){
        pauseColor = 255;
        if(mousePressed){
          gameState = gamePause;
        }
      }else{
        pauseColor = 0;
      }
      
      //Lose
      if(ballX>width+ballR && life>0){
        gameState = gameLose;
        score = 0;
      } 
      break;
//*****************************************
    case gameBattle:
      if(difficulty == 4){
        noStroke();
        circle = floor(random(width/50, width/5));
        colorMode(HSB);
        speedN = difficulty;
        for(i = 0; i<50; i++){
          //background(random(0,255),random(0,255),random(0,255));
          fill(random(0,255),255,255);
          ellipse(random(0, width), random(0, height), circle, circle);
        }
      }else{
        background(#e8e8d0);
        speedN = difficulty*2;
      }
      rectMode(RADIUS);
      colorMode(RGB);
      //P1
      fill(#8cea00);
      p1X = width-width/16;
      p1Y = mouseY;
      if(p1Y<height/15*2+width/20){
        p1Y = height/15*2+width/20;
      }
      if(p1Y>height-width/20){
        p1Y = height-width/20;
      }
      //constrain(p1Y, height/15*2+width/20*2, height-width/20*2);
      rect(p1X, p1Y, padW, padH);
      
      //P2
      fill(#642100);
      //p2X = width/16;
      p2Y = ballY;
      //constrain(p1Y, height/15*2+width/20*2, height-width/20*2);
      if(p2Y>height-padH){
        p2Y = height-padH;
      }
      if(p2Y<height/15*2+padH){
          p2Y = height/15*2+padH;
      }
      //image(illuminati, p2X-height/12, p2Y-height/17, height/12,height/12);
      rect(p2X, p2Y, padW, padH);

      
      //ball
      fill(0);
      ellipse(ballX, ballY, ballR, ballR);
        ballX += speedX*speedN;
        ballY += speedY*speedN*upOrDown;
      if(ballY < scoreboardH*2+ballR/2 || ballY > height-ballR/2){
        speedY = speedY*-1;
      }
      if(ballX < p2X+padW+ballR/2){
        speedX = speedX*-1;
        if(floor(random(0,201))==0){
          p2L -= 10;
        }else{
          p2L -= floor(random(1,6));
        }
        if(speedY<0){
          speedY = -1*floor(random(1,6));
        }else{
          speedY = floor(random(1,6));
        }
      }
      
      if(ballX > p1X-padW-ballR/2 && ballX < p1X-padW && ballY < p1Y+padH && ballY > p1Y-padH){
        speedX = speedX*-1;
        p1L -= 1;
        if(speedY<0){
          speedY = -1*floor(random(1,6));
        }else{
          speedY = floor(random(1,6));
        }
      }
      
      //Score Board
      textSize(width/20);
      fill(#9f5000);
      rect(scoreboardX, scoreboardY, scoreboardW, scoreboardH);
      
      //Life bars
      if(p1L<0){
        p1L = 0;
      }
      if(p2L<0){
        p2L = 0;
      }
      rectMode(CORNERS);
      stroke(0);
      //P2
      fill(255);
      rect(width/40, height/30, width/40+width/4, height/10);
      rect(width -(width/40+width/4), height/30, width-width/40-width/4+width/4, height/10);
      fill(255, 0, 0);
      rect(width/40, height/30, width/40+width/4/100*p2L, height/10);
      fill(0);
      text(p2L, width/40+width/4/2, height/11);
      //P1
      fill(255, 0, 0);
      rect(width -(width/40+width/4), height/30, width-width/40-width/4+width/4/100*p1L, height/10);
      fill(0);
      text(p1L, width-width/40-width/4+width/4/2, height/11);
      
      rectMode(RADIUS);
      
      //Pause
      fill(pauseColor, 0, 0);
      rect(width/2, scoreboardY, width/18, width/30);
      fill(255);
      textSize(width/30);
      text("Pause", width/2, scoreboardY+width/72);
      if(mouseX>width/2-width/18 && mouseX<width/2+width/18 && mouseY>scoreboardY- width/30 && mouseY<scoreboardY+ width/30){
        pauseColor = 255;
        if(mousePressed){
          gameState = gamePause;
        }
      }else{
        pauseColor = 0;
      }
      
      //Lost
      if(ballX>width+ballR && life>0){
        p1L -= 40/difficulty;
        if(difficulty == 4){
          p1L -= 5;
        }
        gameState = gameLose;
      }
      
      //Game Over
      if(p1L <= 0){
        gameState = gameOver;
      }
      if(p2L<=0){
        gameState = gameWin;
      }
      
      
      break;
    case gameWin:
      background(#424200);
      textSize(width/15);
      text("You Defeat Luminatis!!!", width/2, height/2);
      
      
      if(mouseX>(width/2-width/15) && mouseX<(width/2+width/15) && mouseY>(height/8*7-width/20) && mouseY < (height/8*7+width/20-width/72)){
        startColor = 255;
        if(mousePressed){
          gameState = gameReset;
        }
      }else{
        startColor = 0;
      }
      colorMode(RGB);
      fill(startColor, 0, 0);      
      rect(width/2, height/8*7-width/72, width/15, width/20);
      fill(255);
      textSize(width/20);
      text("Menu",width/2, height/16*15-height/27-width/72);
      
      break;
    case gameLose:
      ballX = width/2;
      ballY = height/2;
      speedX = -1*(width/300);
      speedY = floor(random(1,6));
      if(floor(random(0,2)) == 1){
         upOrDown = 1;
      }else{
        upOrDown = -1;
      } 
      background(#424200);
      fill(255);
      textSize(width/10);
      text("You Missed!",width/2, height/2-width/18);
      textSize(width/30);
      fill(conColor, 0, 0);
      rect(width/2, height/8*7-width/72, width/5, width/36);
      fill(255);
      text("click here to continue...", width/2, height/8*7);
      if(mouseX>(width/2-width/5) && mouseX<(width/2+width*5) && mouseY>(height/8*7-width/36-width/72) && mouseY<(height/8*7+width/36-width/72)){
        conColor = 255;
        if(mousePressed){
          gameState = gameMode;
        }
      }else{
        conColor = 0;
      }
      break;
//*****************************************
    case gameOver:
      background(#424200);
      //illuminati
      //image(illuminati, width/16, height/2, height/4,height/4);
      //image(illuminati2, width/16*15-height/4, height/2, height/4,height/4);
      textSize(width/15);
      text("Illuminati Comfirmed!!!", width/2, height/2);
      
      textSize(width/12);      
      if(gameMode == 1){
        text("Score:", scoreboardW-width/10, scoreboardH*2);
      }
      if(gameMode == 2){
        text("Hits:", scoreboardW-width/10, scoreboardH*2);
      }
      
      fill(255);
      if(gameMode != 3){
        text(score, scoreboardW+width/10, scoreboardH*2);
      }
      if(mouseX>(width/2-width/15) && mouseX<(width/2+width/15) && mouseY>(height/8*7-width/20) && mouseY < (height/8*7+width/20-width/72)){
        startColor = 255;
        if(mousePressed){
          gameState = gameReset;
        }
      }else{
        startColor = 0;
      }
      colorMode(RGB);
      fill(startColor, 0, 0);      
      rect(width/2, height/8*7-width/72, width/15, width/20);
      fill(255);
      textSize(width/20);
      text("Menu",width/2, height/16*15-height/27-width/72);
      
      
      break;
//*****************************************
    case gamePause:
      background(#424200);
      textSize(width/10);
      text("Paused", width/2, height/2);
      textSize(width/30);
      fill(conColor, 0, 0);
      rect(width/4*3, height/8*7-width/72, width/5, width/36);
      fill(255);
      text("click here to continue...", width/4*3, height/8*7);
      if(mouseX>(width/4*3-width/5) && mouseX<(width/4*3+width*5) && mouseY>(height/8*7-width/36-width/72) && mouseY<(height/8*7+width/36-width/72)){
        conColor = 255;
        if(mousePressed){
          gameState = gameMode;
        }
      }else{
        conColor = 0;
      }
      
      
      if(mouseX>(width/8-width/15) && mouseX<(width/8+width/15) && mouseY>(height/8*7-width/20) && mouseY < (height/8*7+width/20-width/72)){
        startColor = 255;
        if(mousePressed){
          gameState = gameReset;
        }
      }else{
        startColor = 0;
      }
      colorMode(RGB);
      fill(startColor, 0, 0);      
      rect(width/8, height/8*7-width/72, width/15, width/20);
      fill(255);
      textSize(width/20);
      text("Menu",width/8, height/16*15-height/27-width/72);
      
      break;
//*****************************************
    case gameReset:
      p1L = 100;
      p2L = 100;
      ballX = width/2;
      ballY = height/2;
      speedX = -1*(width/300);
      speedY = floor(random(1,6));
      score = 0;
      if(floor(random(0,2)) == 1){
         upOrDown = 1;
      }else{
        upOrDown = -1;
      }    
      difficulty = 1;
      gameMode = 1;
      life = 3;
      color1 = 255;
      color2 = 0;
      color3 = 0;
      colorEndless = 0;
      colorClassic = 255;
      colorBattle = 0;
      
      gameState = gameStart;
      break;
  }
}
