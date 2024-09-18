object pepita {
	var energia = 100

	method energia() {
		return energia
	}

	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.validarCapacidadDeVolar(distancia)
		energia = energia - self.energiaGastadaAlVolar(distancia)
	}

	method energiaGastadaAlVolar(distancia) {
		return distancia + 10
	}

	method validarCapacidadDeVolar(distancia) {
		if (self.energiaGastadaAlVolar(distancia) > energia)
			self.error("La energia que gastaria al volar (" + self.energiaGastadaAlVolar(distancia) + ") es mayor que su energia actual (" + energia + ").")
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
		energia += energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
		self.validarCapacidadDeVolar(distancia)
		energia = energia - self.energiaGastadaAlVolar(distancia)
	}

	method energiaGastadaAlVolar(distancia) {
		return 2 * distancia + 20
	}

	method validarCapacidadDeVolar(distancia) {
		if (self.energiaGastadaAlVolar(distancia) > energia)
			self.error("La energia que gastaria al volar (" + self.energiaGastadaAlVolar(distancia) + ") es mayor que su energia actual (" + energia + ").")
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
		aves.forEach({ave => ave.volar(distancia)})
	}
}

