note
	description: "[
					Gêre le système de pointage
					Calcule le pointage du joueur
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"


class
	SCORE

create
	make
feature
	make -- constructeur de la classe scoore, initialise le pointage à la valeur 0


			do
				point := 0
				highscore := 0
			end

	point:INTEGER_32 assign set_point
	highscore:INTEGER_32 assign set_highscore
		-- Le pointage

	set_point(a_point:INTEGER_32) -- assignateur de la variable point
		-- Assigne le pointage
		do
			point:=a_point
		end

	set_highscore(a_highscore:INTEGER_32)

		do
			highscore:=a_highscore
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
