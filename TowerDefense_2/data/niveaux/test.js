carte.definirTaille(1200, 1200)

for(i = 0; i < 4; i++){

	for(j = 0; j < 10; j++){

		carte.ajouterMur(i * 60 + 30, j * 60 + 30, "img/objets/mur.png", 60, 60)
		carte.ajouterMur(600 - (i * 60 + 30), j * 60 + 30, "img/objets/mur.png", 60, 60)
	}
	
}

carte.ajouterTourEtPorteeEtPV("BASE", 210, 150, "img/objets/tour.png", 60, 60, 200, 100)
carte.ajouterTourEtPorteeEtPV("BASE", 210, 210, "img/objets/tour.png", 60, 60, 150, 200)