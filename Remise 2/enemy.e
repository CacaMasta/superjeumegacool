note
	description: "[
					Gêre l'affichage et le mouvement des enemies à l'écran
					Contient le chemin d'accès pour le fichier graphique de l'enemie ainsi que les routines pour le mouvement des enemies: envoir les informations nécessaire à la classe sprite
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"



class
	ENEMY

inherit
SPRITE

create
	make

	feature

	make -- Constructeur de la classe enemy

	local
		l_chemin_mouche:STRING

	do
		l_chemin_mouche := "enemy1.bmp"
		initialize(l_chemin_mouche)
		count := 0
		x := 600
		y := 230
		w_rect := 225
		h_rect := 150
		hp:= 20

		set_transparency

	end

	mouvement_mouche -- s'occupe de faire bouger l'enemie (la mouche)

	do
		if count = 7 then

		x := x-10

		y := 230 + ((4*{SINGLE_MATH}.sine(x/50)) * 10)

		count := 0

		end


		count := count + 1

	end

	count:INTEGER -- compteur utilisé dans la classe
	hp:INTEGER -- point de vie d'un enemie


invariant
note
	copyright:"Copyright - Samuel Forcier - David Lafrenière"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafrenière
				Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
]"

end
