import wollok.game.*
import PickleRick.*
import Config.*
import Enemigos.*
import Objetos.*
import intro.*
import Mapas.*


//--------------------- Nivel 1 --------------------
object niveles {
  const ancho = 12 //se mide en celdas de 50 x 50px
  const alto = 12  //se mide en celdas de 50 x 50px

    method nivel1() {
    
        config.removerVisuales()

        game.addVisual(mapa0)
        game.title("Pickle Rick")
        game.height(alto) 
        game.width(ancho)

        config.crearPortal(0,5)
        config.crearPortal(11,5)

        config.crearPlaca(4,4)
        config.crearPlaca(3,4)
        config.crearPlaca(2,4)

        config.crearArma(3,3)

        game.addVisual(rata)
        game.addVisual(rata2)
        game.addVisual(rata3)
        game.onTick(800, "perseguir", {rata.perseguir()})
        game.onTick(900, "perseguir2", {rata2.perseguir()})
        game.onTick(1000, "perseguir3", {rata3.perseguir()})

        game.addVisual(rick)

        config.configurarTeclasRick()

    }

    method nivel2() {
        config.removerVisuales()
    
        game.addVisual(mapa1)
        game.title("Pickle Rick")

        config.crearPortal(0,5)
        config.crearPortal(11,5)

        config.printearLoQueTenemos()
    
        game.addVisual(rata)
        game.addVisual(rick)

    }

    method nivel3() {
        config.removerVisuales()
    
        game.addVisual(mapa2)
        game.title("Pickle Rick")

        config.crearPortal(0,5)
        config.crearPortal(11,5)

        config.printearLoQueTenemos()
    
        game.addVisual(rata)
        game.addVisual(rick)

    }

    method nivel4() {
        config.removerVisuales()
    
        game.addVisual(mapa3)
        game.title("Pickle Rick")

        config.crearPortal(0,5)
        config.crearPortal(11,5)

        config.printearLoQueTenemos()
    
        game.addVisual(rata)
        game.addVisual(rick)

    }

    method nivel5() {
        config.removerVisuales()
    
        game.addVisual(mapa4)
        game.title("Pickle Rick")

        config.printearLoQueTenemos()
    
        game.addVisual(rata)
        game.addVisual(rick)
    }

}