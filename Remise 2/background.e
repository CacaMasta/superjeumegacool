note
	description: "[
					Gêre l'affichage de l'arrière-plan
					Contient le chemin d'accès pour le fichier graphique de l'arrière-plan et envoir les informations nécessaire à la classe sprite
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"

class
	BACKGROUND
inherit
	SPRITE

create
	make

feature {NONE}-- Implementation


	make -- constructeur de la classe background

	local
		l_chemin_background:STRING


	do
		l_chemin_background := "background.bmp"

		initialize(l_chemin_background)

	end





note
	copyright:"Copyright - Samuel Forcier - David Lafrenière"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafrenière
				Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
]"

end
