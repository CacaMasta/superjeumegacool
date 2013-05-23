note
	description: "[
		Gêre l'affichage de texte
		Sert a initialisé un objet texte et à le mettre à jour pour l'afficher à l'écran dans la classe Sprite
	]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"

class
	TEXTE
inherit
	SPRITE

create
	make

feature {NONE} -- Initialization

	make

		do

			texte:="texte par défault"
			initialise_text("comic.ttf")


		end

feature -- mise a jour du texte

		update_texte(text:STRING)

		do
			modifie_texte(text)
		end


note
	copyright: "Copyright - Samuel Forcier - David Lafrenière"
	licence: "GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source: "[
		Samuel Forcier						David Lafrenière
		Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
	]"

end
