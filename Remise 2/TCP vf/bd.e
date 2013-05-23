note
	description: "[
					Gêre l'interaction avec la base de donnée
					Crer/modifie selon le besoin, la base de donnée contenant la liste des scores obtenue par le joueur
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"


class
	BD

inherit
	SQLITE_SHARED_API

create
	createdatabase

feature

	createdatabase
	--createdatabase
		-- Créer/modifie la base de données en utilisant l'objet score
		local
				l_insert: SQLITE_INSERT_STATEMENT
				l_verification:BOOLEAN
				l_after:BOOLEAN
			do
				create db.make_create_read_write ("score.sqlite")
				create query.make ("SELECT `name` FROM `sqlite_master`;", db)
				l_verification := FALSE

				across query.execute_new as l_cursor loop
					if l_cursor.item.string_value (1).same_string ("Score")
					then
					l_verification:=TRUE
					end
				end

				if l_verification = FALSE
				then
					create modify.make ("CREATE TABLE `Score` (Id INTEGER PRIMARY KEY,`hi-score` INTEGER);", db)
							modify.execute
					create query.make ("INSERT INTO `score` (id,`hi-score`) VALUES (1,0);", db)
					inutile:=query.execute_new
				end
			end

	updateDatabase(a_score:INTEGER_32)
	local
		l_score:INTEGER_32
		l_highscore:INTEGER_32
			do
				l_score:=a_score
				l_highscore := envoiHighScore
				--"+l_score.out+"

				if  l_highscore < l_score then
					create modify.make ("UPDATE `score` set `hi-score` = '"+l_score.out+"' where `Id`='1';", db)
					modify.execute
				end
			end

	envoiHighScore:INTEGER_32
	local
		l_id: SQLITE_STATEMENT_ITERATION_CURSOR
		do
			create query.make ("SELECT `hi-score` FROM `score`;", db)
						l_id := query.execute_new
						l_id.start
						if  l_id.after = false then
							result :=l_id.item.integer_value (1)
						else
							result := 0
						end
		end

	closeDatabase
	do
		db.close
	end

query: SQLITE_QUERY_STATEMENT
query1: SQLITE_QUERY_STATEMENT
modify: SQLITE_MODIFY_STATEMENT
db: SQLITE_DATABASE
inutile:SQLITE_STATEMENT_ITERATION_CURSOR

invariant
note
	copyright:"Copyright - Samuel Forcier - David Lafrenière"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafrenière
				Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
]"

end
