note
	description: "[
		Gêre l'affichage à l'écran du programme
		Sert à gêrer l'afficher des divers sprites, gêrer les commandes au clavier et coordonner le programme de manière générale
	]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"

class
	AFFICHER

inherit
	ARGUMENTS

create
	make

feature {NONE}

	make -- Constructeur de la classe Afficher

	local

		l_must_stop:BOOLEAN
		l_sym:INTEGER

		do
			initialisation

			from
					l_must_stop := false
			until
					l_must_stop = true
			loop

				from
				until
					{RAPPER}.SDL_PollEvent (event) /= 1
				loop

					l_sym := key_manager

					if {RAPPER}.get_type_from_SDL_Event (event) = {RAPPER}.SDL_Quit_const then
						l_must_stop := true
					end

				end

					if l_sym = {RAPPER}.SDLK_ESCAPE_const then
					l_must_stop := true
					end

					creation_projectile

					mega_mouvement

					mur_invisible

					--megastop
				if mega_go_droite = false and mega_go_gauche = false and mega_saute_anim = false then
					megaman.megaman_stop
				end


				enemy.mouvement_mouche
				if (enemy.x <= -225) then
					enemy.make

				end

				le_collisioneur

				affiche_sprite

				projectiles_daddy

				finition
			end

			fin

		end



	le_collisioneur

	do

					from
							liste_gprojectiles.start
						until
							liste_gprojectiles.exhausted
						loop

							if (liste_gprojectiles.item.mr_collision (enemy) = true) then
								liste_gprojectiles.remove
								score.point := score.point + 5
								end

							if not liste_gprojectiles.exhausted then
								liste_gprojectiles.forth
							end

					end

				if invincible = false then
					if megaman.mr_collision (enemy) then
						megaman.mega_hp := megaman.mega_hp - 1
						invincible := true
						tick_store := {RAPPER}.SDL_GetTicks
				end

					end

					if (tick_store + 1000) < {RAPPER}.SDL_GetTicks then
						invincible := false
					end



	end

	affiche_sprite  -- s'occupe d'afficher les sprites à l'écran

local
	l_nouveauScore:STRING
	l_nouveauHighScore:STRING
	do
		l_nouveauScore := "Score : " + score.point.out
		l_nouveauHighScore := "Highscore : " + score.highscore.out

		texte_score.update_texte(l_nouveauScore)
		texte_highscore.update_texte (l_nouveauHighScore)
		background.sprite_affiche (screen)
		megaman.sprite_affiche (screen)
		enemy.sprite_affiche (screen)
		texte_score.sprite_affiche (screen)
		texte_highscore.sprite_affiche (screen)
		if megaman.mega_hp = 3 then
		coeur1.sprite_affiche (screen)
		coeur2.sprite_affiche (screen)
		coeur3.sprite_affiche (screen)
		elseif megaman.mega_hp = 2 then
			coeur1.sprite_affiche (screen)
		coeur2.sprite_affiche (screen)
		elseif megaman.mega_hp = 1 then
			coeur1.sprite_affiche (screen)
			else

				end



	end


	creation_projectile -- gêre la création de nouveau projectile produit par megaman

	do
		if projectile_exist = false then
			if can_shoot = true then

				gprojectile_recent := create {GENTILPROJECTILE}.maker (megaman)
				if megaman.direction_droite then
					gprojectile_recent.assigne_direction_droite
				else
					gprojectile_recent.assigne_direction_gauche
				end
				liste_gprojectiles.extend (gprojectile_recent)
			end
		end
	end


	mega_mouvement -- gere les animations pour le personnage principal : megaman

	do
		if mega_saute then
					mega_saute_anim := true
				end
				if mega_saute_anim then
					count := count + 1
					megaman.megaman_saute (count)
					if count = 20 then
						mega_saute_anim := false
						count := 0
					end
				end
				if mega_saute_anim = false then
					if megaman_limite_gauche = false then
						if mega_go_droite = true then
							megaman.megaman_droite
						end
					end
					if megaman_limite_droite = false then
						if mega_go_gauche = true then
							megaman.megaman_gauche
						end
					end
				end
	end


	mur_invisible -- delimite des murs insibles pour empêcher le joueur de sortir de l'écran

	do
		if megaman.x >= 660 then
					megaman_limite_gauche := true
				else
					megaman_limite_gauche := false
				end
				if megaman.x <= 70 then
					megaman_limite_droite := true
				else
					megaman_limite_droite := false
				end
	end


	projectiles_daddy -- une fois les projectiles créer, projectiles_daddy s'occupe de les enlever quand ils sortent de l'écran. Ils gêre aussi quand un projectiles peut être créer ou non en modifiant les valeurs boolean de projectile_state utilisé par creation_projectile

	do
		if liste_gprojectiles.is_empty = false then
					from
						liste_gprojectiles.start
					until
						liste_gprojectiles.exhausted
					loop
						liste_gprojectiles.item.sprite_affiche (screen)
						if liste_gprojectiles.item.direction_projectile_droite = true then
							liste_gprojectiles.item.bouger_droite
						else
							liste_gprojectiles.item.bouger_gauche
						end
						if liste_gprojectiles.item.x >= 840 or liste_gprojectiles.item.x <= 0 then
							liste_gprojectiles.remove
						end
						if not liste_gprojectiles.exhausted then
							liste_gprojectiles.forth
						end
					end
					projectile_exist := true
					check
						gprojectile_recent /= Void
					end
					if gprojectile_recent.direction_projectile_droite = true then
						if gprojectile_recent.x - megaman.x > 150 then
							projectile_exist := false
						end
					elseif megaman.x - gprojectile_recent.x > 60 then
						projectile_exist := false
					end
				end

	end


	initialisation -- s'occupe d'initialisé les objets utilisé par la classe, d'initialisé les librairies et d'initialisé des variables utilisé dans toute la classe

	local
		l_titre:STRING
		l_titre_c:C_STRING
		l_adresse:STRING

		do
			count := 0
			create memoire
			create {ARRAYED_LIST [GENTILPROJECTILE]} liste_gprojectiles.make (0)

			l_titre := "Megaman Zombie Edition"
			create l_titre_c.make (l_titre)
			unused_value := {RAPPER}.SDL_Init ({RAPPER}.SDL_INIT_VIDEO)
			unused_value:= {RAPPER}.TTF_Init
			screen := {RAPPER}.SDL_SetVideoMode (840, 640, 32, {RAPPER}.SDL_SWSURFACE)
			{RAPPER}.SDL_WM_SetCaption (l_titre_c.item, create {POINTER})
			event := event.memory_calloc ({RAPPER}.sizeof_SDL_Event, 1)
			create coeur1.make(1)
			create coeur2.make(2)
			create coeur3.make(3)
			create background.make
			create megaman.make
			create score.make
			create enemy.make
			create musique.make
			create texte_score.make
			create texte_highscore.make
			texte_highscore.y := 40

			if (argument_count > 0)
			then
			l_adresse:=argument(1)
			end

			l_adresse:= "10.70.17.250"

			create reseau.make(l_adresse)

			if (reseau.has_error = false) then
			create thread.constructeur(score,reseau)
			thread.launch
			thread_is_on := true
			else
				thread_is_on := false
			end


		end


	finition -- la "finition" effectuer a la fin de chaque tour de boucle de la boucle principal du jeu

		do
				if megaman.mega_hp = 0 then
					score.point := 0
					megaman.mega_hp := 3
				end

				unused_value := {RAPPER}.SDL_Flip (screen)
				memoire.full_collect
				{RAPPER}.SDL_Delay (1)




		end


	fin -- effectue certaines actions lorsque le jeu se termine

	do
		musique.stop_audio
	--	reseau.envoieScore (score)

	if thread_is_on then
		thread.must_stop := true
		thread.join
		reseau.envoieCodeSecret
		reseau.fermesocket
	end

		event.memory_free

	end


	key_manager:INTEGER -- gêre les entrées au clavier et se qui en résulte(par l'entremise de valeur boolean)

	local

		l_key:POINTER
		l_keysym:POINTER
		l_sym:INTEGER

	do

		if {RAPPER}.get_type_from_SDL_Event (event) = {RAPPER}.SDL_KEYDOWN_const then
						l_key := {RAPPER}.get_key_from_event (event)
						l_keysym := {RAPPER}.get_keysym_from_keyboardevent (l_key)
						l_sym := {RAPPER}.get_sym_from_keysym (l_keysym)
						if l_sym = {RAPPER}.SDLK_SPACE_const then
							can_shoot := true
						end
						if l_sym = {RAPPER}.SDLK_RIGHT_const then
							mega_go_droite := true
						end
						if l_sym = {RAPPER}.SDLK_LEFT_const then
							mega_go_gauche := true
						end
						if l_sym = {RAPPER}.SDLK_UP_const then
							mega_saute := true
						end
					end
					if {RAPPER}.get_type_from_SDL_Event (event) = {RAPPER}.SDL_KEYUP_const then
						l_key := {RAPPER}.get_key_from_event (event)
						l_keysym := {RAPPER}.get_keysym_from_keyboardevent (l_key)
						l_sym := {RAPPER}.get_sym_from_keysym (l_keysym)
						if l_sym = {RAPPER}.SDLK_RIGHT_const then
							mega_go_droite := false
						end
						if l_sym = {RAPPER}.SDLK_LEFT_const then
							mega_go_gauche := false
						end
						if l_sym = {RAPPER}.SDLK_SPACE_const then
							can_shoot := false
							projectile_exist := false

						end
						if l_sym = {RAPPER}.SDLK_UP_const then
							mega_saute := false
						end
					end



	end


			unused_value: INTEGER_32
			screen: POINTER
			event: POINTER
			background: BACKGROUND
			megaman: MEGAMAN
			score: SCORE
			liste_gprojectiles: LIST [GENTILPROJECTILE]
			memoire: MEMORY
			projectile_exist: BOOLEAN
			gprojectile_recent: GENTILPROJECTILE
			mega_go_gauche: BOOLEAN
			mega_go_droite: BOOLEAN
			mega_saute: BOOLEAN
			can_shoot: BOOLEAN
			megaman_limite_gauche: BOOLEAN
			megaman_limite_droite: BOOLEAN
			reseau: RESEAU
			x_backup: REAL
			y_backup: REAL
			enemy: ENEMY
			mega_saute_anim: BOOLEAN
			count: INTEGER
			musique:MUSIQUE
			texte_score:TEXTE
			texte_highscore:TEXTE
			thread:THREAD_MANAGER
			thread_is_on:BOOLEAN
			coeur1:COEUR
			coeur2:COEUR
			coeur3:COEUR
			invincible:BOOLEAN
			tick_store:NATURAL_32


invariant



note
	copyright: "Copyright - Samuel Forcier - David Lafrenière"
	licence: "GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source: "[
		Samuel Forcier						David Lafrenière
		Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
	]"

end
