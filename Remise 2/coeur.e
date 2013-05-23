note
	description: "Summary description for {COEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COEUR
inherit
	SPRITE
create
	make

	feature{NONE}

	make(position:INTEGER)

	local
		chemin_coeur:STRING

	do
		chemin_coeur := "coeur.bmp"
		initialise_coeur(chemin_coeur,position)
		set_transparency

	end



end
