import wollok.game.*
import PickleRick.*
import Config.*
import Mapas.*
import Objetos.*
import intro.*
import Niveles.*

// Aca van los enemigos. Las ratas y el enemigo Final
class Personajes {
    var property vida 
    var property poder 

    method morir() {
        if (self.vida()<=0) {game.removeVisual(self)}
    }

    method vidaRestar(x) {
    self.vida()-x.poder()
    }
}

class Ratas  inherits Personajes (vida = 20, poder = 5) {
  var posicion
  var imageRata = "ratafrente1.png"
  
  method image () = imageRata
  method position() = posicion

  method derecha() {
    imageRata = "rataderecha2.png"
    posicion = posicion.right(0.5)
    game.schedule(200, {imageRata = "rataderecha1.png"})
    posicion = posicion.right(0.5)
  }

  method izquierda() {
    imageRata = "rataizquierda2.png"
    posicion = posicion.left(0.5)
    game.schedule(200, {imageRata = "rataizquierda1.png"})
    posicion = posicion.left(0.5)
  }

  method arriba() {
    imageRata = "rataespalda2.png"
    posicion = posicion.up(0.5)
    game.schedule(200, {imageRata = "rataespalda1.png"})
    posicion = posicion.up(0.5)
  }

  method abajo() {
    imageRata = "ratafrente2.png"
    posicion = posicion.down(0.5)
    game.schedule(200, {imageRata = "ratafrente1.png"})
    posicion = posicion.down(0.5)
  }
  method perseguir() {
    if(rick.position().x() > self.position().x()){
      self.derecha()
    } else if (rick.position().x() < self.position().x()){
      self.izquierda()
    }

    if(rick.position().y() > self.position().y()){
      self.arriba()
    } else if (rick.position().y() < self.position().y()){
      self.abajo()
    }  
  }

  method kill(){
      game.removeVisual(self)
  }

}

const rata  = new Ratas(posicion = game.at(-3.randomUpTo(3).truncate(0),-3.randomUpTo(15).truncate(0)))
const rata2  = new Ratas(posicion = game.at(8.randomUpTo(15).truncate(0),-3.randomUpTo(15).truncate(0)))
const rata3  = new Ratas(posicion = game.at(-3.randomUpTo(15).truncate(0),8.randomUpTo(15).truncate(0)))

