note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

create
	make_serveur

feature {NONE} -- Initialization

	make_serveur
		local
			l_port: INTEGER
			l_serveur_address, l_client_address: NETWORK_SOCKET_ADDRESS
		do
			l_port := 12345
			io.put_string ("Ouverture du serveur sur le port: " + l_port.out + ".%N")
			create serveur_socket.make_server_by_port (l_port)
			if not serveur_socket.is_bound then
				io.put_string ("Impossible de reserver le port " + l_port.out + ".%N")
			else
				l_serveur_address := serveur_socket.address
				check
					Address_attached: l_serveur_address /= Void
				end
				io.put_string ("Socket ouvert et en ecoute sur l'adresse:" + l_serveur_address.host_address.host_address + ":" + l_serveur_address.port.out + ".%N")
				serveur_socket.listen (1)
				serveur_socket.accept
				client_socket := serveur_socket.accepted
				if client_socket = Void then
					io.put_string ("Impossible de connecter le client.%N")
				else
					l_client_address := client_socket.peer_address
					check
						client_address_attached: l_client_address /= Void
					end
					io.put_string ("Connexion client: " + l_client_address.host_address.host_address + ":" + l_client_address.port.out + ".%N")
					create db.createdatabase
					recevoirScore
				end
			end
		end

	recevoirScore
		local
			l_score: INTEGER_32
			l_muststop: BOOLEAN
		do
			from
				l_muststop := false
			until
				l_muststop = true
			loop
				client_socket.read_integer_32
				l_score := client_socket.last_integer_32
				if l_score = 2 then
					l_muststop := true
				else
				db.updatedatabase (l_score)
				io.put_integer_32 (l_score)
				Highscore
				end

			end

			client_socket.close
			serveur_socket.close
			db.closedatabase
			make_serveur
		end

		Highscore
		local
		 lastHigh:INTEGER_32
		do
			lastHigh:= db.envoihighscore
			client_socket.put_integer_32 (lastHigh)
		end

	socket: NETWORK_STREAM_SOCKET

	serveur_socket: NETWORK_STREAM_SOCKET

	client_socket: NETWORK_STREAM_SOCKET

	db: BD

end
