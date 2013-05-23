note
	description: "[
		Initialise les projectiles lancés par megaman.
		Initialise les coordonnées initiales de chaque projectiles lancés par megaman ainsi que le chemin d'accès a l'image du sprite.
	]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"

class
	GENTILPROJECTILE

inherit

	PROJECTILE

create
	maker


feature {NONE} -- Implementation

		son_megaman:SON_MEGAMAN

		maker (megaman: MEGAMAN) -- Constructeur de la classe gentilprojectile, nécessite un objet megaman pour déterminer l'emplacement initial d'un nouveau projectile





		do
			chemin_gentil_droite := "projectile1.bmp"
			chemin_gentil_gauche := "projectile2.bmp"
			create chemin_gentil_droite_c.make (chemin_gentil_droite)
			create chemin_gentil_gauche_c.make (chemin_gentil_gauche)
			create son_megaman.make
			son_megaman.play_son(0)
			if megaman.direction_droite then
				initialize("projectile1.bmp")

			x := megaman.x + 112
			direction_projectile_droite := true
			else
				initialize("projectile2.bmp")
			x := megaman.x - 20
			direction_projectile_droite := false
			end
			set_transparency
			y := megaman.y + 26
			w := 26
			h := 20
		end



note
	copyright: "Copyright - Samuel Forcier - David Lafrenière"
	licence: "GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source: "[
		Samuel Forcier						David Lafrenière
		Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
	]"

end
