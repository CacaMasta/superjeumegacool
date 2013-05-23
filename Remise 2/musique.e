note
	description: "[
				    Joue la musique d'ambiance du programme
					Contient le chemin d'accès pour le fichier sonore de la musique d'ambiance, initialise et joue cette musique en utilisant Sound_manager
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"


class
	MUSIQUE

inherit
	SOUND_MANAGER

create
	make

feature{NONE}

	make -- Constructeur de la classe musique, initialise les valeurs de la musique dans le jeu

	local
		l_chemin:STRING
	do

		l_chemin := "music.wav"

		open_audio
		initialise_son(l_chemin)

		play_son(9999)

	end




note
	copyright:"Copyright - Samuel Forcier - David Lafrenière"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafrenière
				Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
]"

end
