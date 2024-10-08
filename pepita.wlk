object pepita {
	var energia = 100

	method energia() {
		return energia
	}

	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		energia = energia - self.energiaGastadaAlVolar(distancia)
	}

	method energiaGastadaAlVolar(distancia) {
		return distancia + 10
	}

	method puedeVolar(distancia) {
		return self.energiaGastadaAlVolar(distancia) <= energia
	}

}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia = energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
		energia = energia - self.energiaGastadaAlVolar(distancia)
	}

	method energiaGastadaAlVolar(distancia) {
		return 2 * distancia + 20
	}

	method puedeVolar(distancia) {
		return self.energiaGastadaAlVolar(distancia) <= energia
	}	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

object milena {
	const aves = #{}

	method agregarAve(ave) {
		aves.add(ave)
	}

	method movilizar(distancia) {
		self.validarMovilizacion(distancia)
		aves.forEach({ave => ave.volar(distancia)})
	}

	method validarMovilizacion(distancia) {
		if(not self.puedeMovilizar(distancia))
			self.error("Milena no puede movilizar a las aves. Al menos una no tiene la energía suficiente.")
	}

	method puedeMovilizar(distancia){
		return aves.all({ave => ave.puedeVolar(distancia)})
	}
}

