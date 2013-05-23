note
	description: "[
					Gêre l'aspect réseau du programme
					Envoie le score du joueur vers le serveur qui l'entrepose dans une base de donnée. Reçoie le score le plus haut contenu dans la base de donnée du serveur sur demande.
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"


class
	RESEAU

create
	make

feature {NONE}-- Initialization

	--faire un make
	-- faire une routine d'envoie du score
	-- fuck le is online

	make(adresse:STRING)

	local
			l_addr_factory:INET_ADDRESS_FACTORY
			l_address:INET_ADDRESS
			l_addr:STRING
			l_port:INTEGER

			do
				l_addr:=adresse

				create l_addr_factory

				l_port:=12345

				l_address:= l_addr_factory.create_from_name (l_addr)
			if l_address = Void then
				has_error:=true

			else
				create socket.make_client_by_address_and_port (l_address, l_port)
				if socket.invalid_address then
					has_error:=true
				else

					socket.set_connect_timeout (2000)
					socket.set_nodelay
					socket.connect
					if not socket.is_connected then
						has_error:=true
						socket.cleanup
					else
						has_error:=false
					end
				end
			end
			end

		feature
			envoieScore(score:SCORE)

			do
				socket.put_integer_32 (score.point)
			end



			fermeSocket

			do
				socket.close
			end


			envoieCodeSecret

			do
				socket.put_integer_32 (2)
			end

			recoieHighScore:INTEGER_32

			do
				socket.read_integer_32
				result := socket.last_integer_32
			end

			socket: NETWORK_STREAM_SOCKET
			has_error:BOOLEAN





--	make (a_score:SCORE) -- constructeur de la classe réseau, nécessite un objet score vue que c'est le pointage score qui est communiqué sur le réseau. Gêre la connection avec le serveur et l'envoie de donnée vers celui-ci.
--		local
--			l_addr_factory:INET_ADDRESS_FACTORY
--			l_address:INET_ADDRESS
--			l_socket: NETWORK_STREAM_SOCKET
--			l_addr:STRING
--			l_port:INTEGER
--			l_score:SCORE
--		do
--			l_score:=a_score
--			create l_addr_factory
--			l_addr:="10.70.17.250"
--			l_port:=12345

--		--	io.put_string ("Ouverture du client. Adresse: "+l_addr+", port: "+l_port.out+".%N")

--			l_address:= l_addr_factory.create_from_name (l_addr)
--			if l_address = Void then
--				io.put_string ("Erreur: Adresse " + l_addr + " non reconnue!%N")

--			else
--				create l_socket.make_client_by_address_and_port (l_address, l_port)
--				if l_socket.invalid_address then
--					io.put_string ("Ne peut pas se connecter a l'adresse " + l_addr + ":" + l_port.out+".%N")
--				else
--					l_socket.connect
--					if not l_socket.is_connected then
--						io.put_string ("Ne peut pas se connecter a l'adresse " + l_addr + ":" + l_port.out+".%N")
--					else
--										l_socket.put_integer_32 (l_score.point)
--									--	l_socket.read_line
--									--	io.put_integer_32 (l_score.point)
--										l_socket.close
--					end
--				end
--			end
--		end




invariant
note
	copyright:"Copyright - Samuel Forcier - David Lafrenière"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafrenière
				Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
]"
end
