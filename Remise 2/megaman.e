note
	description: "[
					Gêre l'affichage du personnage contrôlé par le joueur (megaman)
					Contient le chemin d'accès au fichier graphique du personnage, ainsi que ses coordoné et envoie les informations nécessaire à la classe sprites pour l'affichage
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"



class
	MEGAMAN
inherit
	SPRITE
create
	make
feature -- Implementation


	chemin_droite:STRING -- String contenant l'emplacement du fichier contenant l'image de megaman se dirigeant vers la droite
	chemin_gauche:STRING -- String contenant l'emplacement du fichier contenant l'image de megaman se dirigeant vers la gauche
	chemin_haut_droite:STRING -- String contenant l'emplacement du fichier contenant l'image de megaman se dirigeant vers le haut et la droite
	chemin_haut_gauche:STRING -- String contenant l'emplacement du fichier contenant l'image de megaman se dirigeant vers le haut et la gauche

	chemin_droite_c:C_STRING -- String C contenant l'emplacement du fichier contenant l'image de megaman se dirigeant vers la droite
	chemin_gauche_c:C_STRING -- String C contenant l'emplacement du fichier contenant l'image de megaman se dirigeant vers la gauche
	chemin_haut_droite_c:C_STRING -- String C contenant l'emplacement du fichier contenant l'image de megaman se dirigeant vers le haut et la droite
	chemin_haut_gauche_c:C_STRING -- String C contenant l'emplacement du fichier contenant l'image de megaman se dirigeant vers le haut et la gauche
	direction_droite:BOOLEAN -- indique si megaman se dirige vers la droite, sinon il se dirige vers la gauche

	ptr_droite:POINTER -- pointeur de l'image de megaman lorsque celui-ci se dirige vers la droite
	ptr_gauche:POINTER -- pointeur de l'image de megaman lorsque celui-ci se dirige vers la gauche
	ptr_haut_droite:POINTER -- pointeur de l'image de megaman lorsque celui-ci se dirige vers le haut et la droite
	ptr_haut_gauche:POINTER -- pointeur  de l'image de megaman lorsque celui-ci se dirige vers le haut et la gauche
	mega_hp:INTEGER assign set_hp


	make -- Constructeur de la classe megaman, initialize les paramètres de megaman

	do

chemin_droite := "megamananimation.bmp"
chemin_gauche := "megamananimation2.bmp"
chemin_haut_droite := "megamansaute.bmp"
chemin_haut_gauche := "megamansaute2.bmp"
create chemin_droite_c.make (chemin_droite)
create chemin_gauche_c.make (chemin_gauche)
create chemin_haut_droite_c.make (chemin_haut_droite)
create chemin_haut_gauche_c.make (chemin_haut_gauche)

ptr_droite:={RAPPER}.SDL_LoadBMP(chemin_droite_c.item)
ptr_gauche:={RAPPER}.SDL_LoadBMP(chemin_gauche_c.item)
ptr_haut_droite:={RAPPER}.SDL_LoadBMP(chemin_haut_droite_c.item)
ptr_haut_gauche:={RAPPER}.SDL_LoadBMP(chemin_haut_gauche_c.item)


	initialize("megamananimation.bmp")


	direction_droite:=true
	x := 50
	y := 342
	w_rect := 120
	h_rect := 94
	mega_hp:= 3

	set_transparency


	end

	megaman_droite -- gêre le mouvement à droite de megaman

	do

	h_rect :=94
	direction_droite := true
	x := x + 6

	ptr := ptr_droite
	set_transparency

	if x_rect = 1800
	then
		x_rect := 480
	else
		x_rect := x_rect + 120
	end

	end

	megaman_gauche -- gêre le mouvement à gauche de megaman

	do
		h_rect := 94
	direction_droite := false
	x := x - 6
	ptr := ptr_gauche
	set_transparency

	if x_rect = 0
	then
		x_rect := 1440
	else
		x_rect := x_rect - 120
	end

	end

	megaman_stop -- gêre l'arrêt du mouvement de megaman
	do

		h_rect := 94
		if direction_droite then
			ptr := ptr_droite
			set_transparency
			x_rect := 0
		else
			ptr := ptr_gauche
			set_transparency
		x_rect := 1800
		end
	end

	megaman_saute (frame:INTEGER) -- gêre le saut pour megaman
	do

		if frame = 1 then
			x_rect := 0
			h_rect := 130
			y := y - 46
		end
		if direction_droite then
		ptr := ptr_haut_droite
		set_transparency
		else
			ptr := ptr_haut_gauche
		set_transparency
		end



	if frame = 20 then
		y := y + 46
	end

	if frame <= 10 then
	y := y - 5
	elseif frame > 10 then
	y := y + 5
	end

	if x_rect = 2160
	then
		x_rect := 0
	else
		x_rect := x_rect + 120
	end
	end

	set_hp(a_hp:INTEGER)

	do
		mega_hp := a_hp

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

