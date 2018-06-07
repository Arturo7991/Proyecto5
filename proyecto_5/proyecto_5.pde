//Proyecto 5 Edgar Arturo Yebra González
int P=1;

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList boundaries;
PImage c1, F;

Box box;
Box box11;
Box box111;
Box1 box1;
Box2 box2;
Box3 box3;
Box4 box4;
Box5 box5;

Spring spring;
Spring spring11;
Spring spring111;
Spring1 spring1;
Spring2 spring2;
Spring3 spring3;
Spring4 spring4;
Spring5 spring5;

void setup(){
size(500,600);
  smooth();
  c1 = loadImage("caja.jpg");
  F = loadImage("fabrica.jpg");
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
 box = new Box(100,200);
 box11 = new Box(400,200);
 box111 = new Box(400,100);
 box1 = new Box1(200,200);
 box2 = new Box2(300,200);
 box3 = new Box3(100,300);
 box4 = new Box4(200,300);
 box5 = new Box5(300,300);
 
 spring = new Spring();
  spring11 = new Spring();
   spring111 = new Spring();
 spring1 = new Spring1();
 spring2 = new Spring2();
 spring3 = new Spring3();
 spring4 = new Spring4();
 spring5 = new Spring5();

 boundaries = new ArrayList();
 boundaries.add(new Boundary(width/2,height-5,width,10,0));
 boundaries.add(new Boundary(width/2,5,width,10,0));
 boundaries.add(new Boundary(width-5,height/2,10,height,0));
 boundaries.add(new Boundary(5,height/2,10,height,0));}
 
void mouseReleased() {
 spring.destroy();
 spring11.destroy();
 spring111.destroy();
 spring1.destroy();
 spring2.destroy();
 spring3.destroy();
 spring4.destroy();
 spring5.destroy();}


void mousePressed() {
  if (box.contains(mouseX, mouseY)) {
    spring.bind(mouseX,mouseY,box);}
    if (box11.contains(mouseX, mouseY)) {
    spring.bind(mouseX,mouseY,box11);}
    if (box111.contains(mouseX, mouseY)) {
    spring.bind(mouseX,mouseY,box111);}
  if (box1.contains(mouseX, mouseY)) {
    spring1.bind1(mouseX,mouseY,box1);}
  if (box2.contains(mouseX, mouseY)) {
    spring2.bind2(mouseX,mouseY,box2);}
  if (box3.contains(mouseX, mouseY)) {
    spring3.bind3(mouseX,mouseY,box3);}
  if (box4.contains(mouseX, mouseY)) {
    spring4.bind4(mouseX,mouseY,box4);}
  if (box5.contains(mouseX, mouseY)) {
    spring5.bind5(mouseX,mouseY,box5);}
}
void draw(){
if(P==1){
  pantalla1();}
if(P==2){
  pantalla2();}
if(P==3){
  pfacil();}
if(P==4){
  pdificil();}


 box2d.step();

  spring.update(mouseX,mouseY);
  spring11.update(mouseX,mouseY);
  spring111.update(mouseX,mouseY);
  spring1.update(mouseX,mouseY);
  spring2.update(mouseX,mouseY);
  spring3.update(mouseX,mouseY);
  spring4.update(mouseX,mouseY);
  spring5.update(mouseX,mouseY);

  for (int i = 0; i < boundaries.size(); i++) {
  Boundary wall = (Boundary) boundaries.get(i);
  wall.display();
  }}
  
void espacio(){
if(key==' '){
  P=2;}}
  
  void eleccion(){
if(mouseX<325 && mouseX>175 && mouseY<300 && mouseY>250){
noFill();
stroke(0,0,255);
strokeWeight(7);
rect(250,275,150,50,7);}
else if(mouseX<325 && mouseX>175 && mouseY<375 && mouseY>325){
noFill();
stroke(255,0,0);
strokeWeight(7);
rect(250,350,150,50,7);}}

void mouseClicked(){
if(P==2){
  if(mouseX<325 && mouseX>175 && mouseY<300 && mouseY>250){
  P=3;}
  if(mouseX<325 && mouseX>175 && mouseY<375 && mouseY>325){
  P=4;}}}
  
  
//pantalla 1
void pantalla1(){
background(255);
textAlign(CENTER);
textSize(100);
fill(0);
text("Towers",250,300);
textSize(17);
text("Presiona espacio para comenzar",250,385);
espacio();}
    
//pantalla 2
void pantalla2(){
background(255);
rectMode(CENTER);
noFill();
stroke(0);
strokeWeight(7);
text("Fácil",250,285);
text("Difícil",250,360);
rect(250,275,150,50,7);
rect(250,350,150,50,7);
textSize(30);
text("Selecciona la dificultad",250,150);
eleccion();}
    
//facil
void pfacil(){
image(F,255,300,500,600);
textSize(15);
text("Apila las cajas utilizando el mouse",250,50);
text("Presiona 'Esc' para salir",250,70);
text("punto mas alto de la torre",250,150);
text("----------------------------------",250,170);
box.display();
box1.display();
box2.display();
box3.display();
box11.display();
box111.display();
spring2.display();
spring3.display();
spring.display();
spring1.display();
spring11.display();
spring111.display();
}


//dificil
void pdificil(){
image(F,255,300,500,600);
textSize(15);
text("Apila las cajas utilizando el mouse",250,50);
text("Presiona 'Esc' para salir",250,70);
text("punto mas alto de la torre",250,150);
text("----------------------------------",250,170);
box.display();
box1.display();
box2.display();
box3.display();
box4.display();
box5.display();
spring.display();
spring1.display();
spring2.display();
spring3.display(); 
spring4.display();
spring5.display();
}