import wollok.game.*
import PickleRick.*
import Niveles.*
import Enemigos.*
import Objetos.*
import intro.*
import Mapas.*

//------------------------- Configuraciones -----------------------------------

object config{

  // El ".say" casero
  method textoCharlado(inicio, fin, textoAImprimir){
      game.schedule(inicio, { game.addVisual(textoAImprimir) })
      game.schedule(fin, { game.removeVisual(textoAImprimir) })
  }

  // Teclas de Rick
  method configurarTeclasRick(){
    keyboard.w().onPressDo({ rick.arriba() })
    keyboard.s().onPressDo({ rick.abajo() })
    keyboard.a().onPressDo({ rick.izquierda() })
    keyboard.d().onPressDo({ rick.derecha()})

    keyboard.e().onPressDo({ rick.esPortal(game.uniqueCollider(rick))})

    keyboard.i().onPressDo({ self.textoCharlado(0000, 4000, inventario)})

    keyboard.f().onPressDo({ self.disparar()}) //Si no tiene arma no dispara

  }

  // Accion ni bien se colisiona
  method configurarColisiones() {
    game.onCollideDo(rick, { algo => algo.colision(rick)})

	}

  // Remover TODOS los visuales
  method removerVisuales(){
    game.allVisuals().forEach({ visual => game.removeVisual(visual)})
  }

  method crearPortal(x,y){
    const portal = new Portales(position = game.at(x,y))
    game.addVisual(portal)
    game.onTick(300, "titilaPortal", {portal.titila()})
  }

  method crearPlaca(x,y){
    const placa = new Placas(position = game.at(x,y))
    game.addVisual(placa)
    game.onTick(2000, "titilaPlaca", {placa.titila()})
  }

  method crearArma(x,y){
    const arma = new Armas(position = game.at(x,y))
    game.addVisual(arma)
    game.onTick(2000, "titilaArma", {arma.titila()})
  }
  
  // Lista para printearLoQueTenemos()
  method listarArmas(){
    return rick.objetos().filter({n => n.className() == "Objetos.Armas"})
  }

  // Lista para printearLoQueTenemos()
  method listarPlacas(){
    return rick.objetos().filter({n => n.className() == "Objetos.Placas"})
  }

  // Metodo para poder arrastar lo que agarramos
  method printearLoQueTenemos(){
        
    self.listarArmas().forEach({ objeto => game.addVisual(objeto)})

    self.listarPlacas().forEach({ objeto => game.addVisual(objeto)})

  }

  // Verificar que tenemos la pistolota
  method tenemosPistola(){
    return rick.objetos().any({n => n.className() == "Objetos.Armas"})
  }
  // Pichium
  method disparar(){
    if (self.tenemosPistola()){
      new Lasers().disparar()
    }
  }
}

object paleta {
  const property verde = "00FF00"
  const property rojo = "FF0000"
  const property blanco = "FFFFFF"
  const property amarillo = "FFFF00"
  const property negro = "000000"
}

/////////Textos de Rick sin game.say/////////1
class TextosRick{
  method position() = game.at(rick.position().x(),rick.position().y()+1)
  method textColor() = paleta.amarillo()
  method textbackground() = paleta.verde  ()
}

object prueba inherits TextosRick{  
  method text() = "¡Pepita te caga todo el auto!"
}

object inventario inherits TextosRick{
  method text() = "Partes de ArmaPortal:" + rick.objetos().toString() 
  //placa.contarPlacas().toString() 
  /*+ "perro:" + 3.toString() + "
  gilada:" + paleta.amarillo().toString()*/
  const lista = [paleta, saludo2]
}

object saludo2 inherits TextosRick{ 
  method text() = "qué mirás gato? 
  nunca viste un pickle?"
}

object pichium inherits TextosRick{ 
  method text() = "Ahora siiii!
  Pichium!
  PIchium!"
}

object mensajeSW {
  var property position = game.at(5,-6) //se mide en celdas de 50 x 50px
  
  method text() = "En una galazia muy muy lejana
  tu hermana, la nalgona
  nalgonea nalgas nalgunas en
  Nalgalandia"
  method textColor() = paleta.amarillo()

	method desplazamiento(){
  	const y = (position.y()+1)
		position = game.at(position.x(),y)
		
	}
}

object vidaRick {
  var property position = game.at(10,11) 
  method text() = "PH: " + rick.vida().toString()
  method textColor() = paleta.verde()
}