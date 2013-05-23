note
	description: "Summary description for {THREAD_MANAGER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	THREAD_MANAGER
inherit
	THREAD

	create
		constructeur
	feature -- Thread d'update réseau constant
			-- boucle till bool false (execute) ((timeout))
			-- fonction bool à false
			-- call thread_manager.join dans afficher a la fin du programme

		constructeur(a_score:SCORE;a_reseau:RESEAU)

		do
			score:=a_score
			reseau:=a_reseau
			make
		end

		execute

		local

			l_count:INTEGER

		do

			l_count := 0

			from
				must_stop := false
			until
				must_stop = true
			loop

				if (l_count = 0) then
					reseau.envoieScore(score)
					score.highscore := reseau.recoieHighScore
				end

				l_count := l_count +1

				if (l_count = 400000) then
					l_count := 0
				end



			end

		end

		set_must_stop(a_bool:BOOLEAN)

		do

			must_stop := a_bool

		end


		reseau:RESEAU
		score:SCORE
		must_stop:BOOLEAN assign set_must_stop

end
