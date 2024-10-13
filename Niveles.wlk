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

        
        game.onTick(1000, "generar", {generarEnemigos.horda(1)})
        game.onTick(500, "perseguir", {generarEnemigos.moverEnemigos()})
        
        game.addVisual(vidaRick)
        game.addVisual(rick)
        config.configurarTeclasRick()
        
        // game.whenCollideDo(rick, {ratas => rick.vida()-5})
        //game.whenCollideDo(rick, {ratas => game.addVisual(vidaRick)})   Rompe todo.
        
    }

    method nivel2() {
        config.removerVisuales()
    
        game.addVisual(mapa1)
        game.title("Pickle Rick")

        config.crearPortal(0,5)
        config.crearPortal(11,5)

        config.printearLoQueTenemos()
    
    
        game.addVisual(rick)

    }

    method nivel3() {
        config.removerVisuales()
    
        game.addVisual(mapa2)
        game.title("Pickle Rick")

        config.crearPortal(0,5)
        config.crearPortal(11,5)

        config.printearLoQueTenemos()
    
        game.addVisual(vidaRick)
        game.addVisual(rick)

    }

    method nivel4() {
        config.removerVisuales()
        
        game.addVisual(mapa3)
        game.title("Pickle Rick")

        config.crearPortal(0,5)
        config.crearPortal(11,5)

        config.printearLoQueTenemos()
        
        game.addVisual(vidaRick)
        game.addVisual(rick)

        
        
        game.onTick(1000, "generar", {generarEnemigos.horda(2)})
        game.onTick(500, "perseguir", {generarEnemigos.moverEnemigos2()})
        
    }

    method nivel5() {
        config.removerVisuales()
    
        game.addVisual(mapa4)
        game.title("Pickle Rick")

        config.printearLoQueTenemos()


        game.addVisual(vidaRick)
        game.addVisual(rick)

    }

}