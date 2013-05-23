note
	description: "[
					Controleur des projectiles.
					Controle la vitesse des projectiles de tirés par megaman ainsi que ceux tirés par les ennemis.

]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"

deferred class
	PROJECTILE

inherit
	SPRITE


feature

	direction_projectile_droite:BOOLEAN -- indique si un projectile se dirige vers la droite, sinon il se dirige vers la gauche
	chemin_gentil_droite:STRING -- String contenant l'emplacement du fichier contenant l'image d'un projectile se dirigeant vers la droite
	chemin_gentil_droite_c:C_STRING -- String C contenant l'emplacement du fichier contenant l'image d'un projectile se dirigeant vers la droite
	chemin_gentil_gauche:STRING -- String contenant l'emplacement du fichier contenant l'image d'un projectile se dirigeant vers la gauche
	chemin_gentil_gauche_c:C_STRING -- String C contenant l'emplacement du fichier contenant l'image d'un projectile se dirigeant vers la gauche

	bouger_droite
		-- Déplace les projectiles vers la droite.

			do
					x := x +9
			end

	bouger_gauche
		-- Déplace les projectiles vers la gauche.

			do
					x := x -9
			end

	assigne_direction_droite
		-- assigne la direction vers la droite

	do
		direction_projectile_droite := true
	end

	assigne_direction_gauche
		-- assigne la direction vers la gauche
	do
		direction_projectile_droite := false
	end


invariant
note
	copyright:"Copyright - Samuel Forcier - David Lafrenière"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafrenière
				Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
]"

end
