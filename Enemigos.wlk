import wollok.game.*
import PickleRick.*
import Config.*
import Mapas.*
import Objetos.*
import intro.*
import Niveles.*

// Aca van los enemigos. Las ratas y el enemigo Final
class Ratas  {
  var property poder = 5
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
      posicion = game.at(-3.randomUpTo(3).truncate(0),-3.randomUpTo(15).truncate(0))
  }

}


class Pepitas  {
  var property poder = 5
  var posicion
  var imageRata = "pepitaabajo.png"
  
  method image () = imageRata
  method position() = posicion

  method derecha() {
    imageRata = "pepitaderecha.png"
    posicion = posicion.right(0.5)
    game.schedule(200, {imageRata = "pepitaderecha.png"})
    posicion = posicion.right(0.5)
  }

  method izquierda() {
    imageRata = "pepitaizquierda.png"
    posicion = posicion.left(0.5)
    game.schedule(200, {imageRata = "pepitaizquierda.png"})
    posicion = posicion.left(0.5)
  }

  method arriba() {
    imageRata = "pepitaarriba.png"
    posicion = posicion.up(0.5)
    game.schedule(200, {imageRata = "pepitaarriba.png"})
    posicion = posicion.up(0.5)
  }

  method abajo() {
    imageRata = "pepitaabajo.png"
    posicion = posicion.down(0.5)
    game.schedule(200, {imageRata = "pepitaabajo.png"})
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
      posicion = game.at(-3.randomUpTo(3).truncate(0),-3.randomUpTo(15).truncate(0))
  }

}
object generarEnemigos {
    var property cantEnemigos = []
    var property cantEnemigos2 = []

    method horda(x) {
      if (cantEnemigos.size()<3 && x == 1){
        const nuevoEnemigo  = new Ratas(posicion = game.at(8.randomUpTo(15).truncate(0),-3.randomUpTo(15).truncate(0)))
        cantEnemigos.add(nuevoEnemigo)
        game.addVisual(nuevoEnemigo)
      }
      if (cantEnemigos2.size()<3 && x == 2){
        const nuevoEnemigo  = new Pepitas(posicion = game.at(8.randomUpTo(15).truncate(0),-3.randomUpTo(15).truncate(0)))
        cantEnemigos2.add(nuevoEnemigo)
        game.addVisual(nuevoEnemigo)
      }
    }

    method moverEnemigos() {cantEnemigos.forEach({ z => z.perseguir()})}

    method moverEnemigos2() {cantEnemigos2.forEach({ z => z.perseguir()})}
    
}
