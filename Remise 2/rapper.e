note
	description: "[
					Wrapper librairie SDL, SDL_mixer et SDL_ttf.
					Sert à avoir accès aux fonctions/constantes des librairies externes SDL, SDL_mixer et SDL_ttf à partir de Eiffel Studio
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"

class
	RAPPER

feature -- Wrapper librairie SDL

feature -- Fonction SDL_init de la librairie SDL
	frozen SDL_init (flags: NATURAL_32): INTEGER
		external
			"C (Uint32):int | <SDL.h>"
		alias
			"SDL_Init"
		end

feature -- Fonction SDL_init_video de la librairie SDL
	frozen SDL_init_video: NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_INIT_VIDEO"
		end

feature -- Fonction SDL_init_audio de la librairie SDL
	frozen SDL_init_audio: NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_INIT_AUDIO"
		end

feature -- Fonction SDL_LoadBMP de la librairie SDL
	frozen SDL_LoadBMP(file: POINTER): POINTER
		external
			"C (const char *):SDL_Surface * | <SDL.h>"
		alias
			"SDL_LoadBMP"
		end

feature -- Fonction SDL_SetVideoMode de la librairie SDL
	frozen SDL_SetVideoMode(width, heigth, bitsperpixel: INTEGER; flags: NATURAL_32): POINTER
		external
			"C (int,int,int,Uint32):SDL_Surface * | <SDL.h>"
		alias
			"SDL_SetVideoMode"
	 	 end



feature -- Fonction SDL_SWSURFACE de la librairie SDL
	 frozen SDL_SWSURFACE: NATURAL_32
		external
			"C inline use <SDL.h>"
		alias
			"SDL_SWSURFACE"
		end

feature -- Fonction SDL_BlitSurface de la librairie SDL
	 frozen SDL_BlitSurface(src,srcect,dst,dstrect:POINTER):INTEGER
	 	external
	 		"C (SDL_Surface *, SDL_Rect *, SDL_Surface *, SDL_Rect *): int | <SDL.h>"
	 	alias
	 		"SDL_BlitSurface"
	 	end

feature -- Fonction SDL_Flip de la librairie SDL
	 frozen SDL_Flip(screen:POINTER):INTEGER
	 	external
	 		"C (SDL_Surface*):int | <SDL.h>"
	 	alias
	 		"SDL_Flip"
	 	end

feature -- Fonction SDL_Delay de la librairie SDL
	 frozen SDL_Delay(ms:NATURAL_32)
	 	external
	 		"C (Uint32) | <SDL.h>"
	 	alias
	 		"SDL_Delay"
	 	end

feature -- Fonction SDL_WM_SetCaption de la librairie SDL
	 frozen SDL_WM_SetCaption(title,icon:POINTER)
	 	 external
	 	 	"C (const char *, const char *) | <SDL.h>"
	 	 alias
	 	 	"SDL_WM_SetCaption"
	 	 end

feature -- Fonction SDL_PollEvent de la librairie SDL
	 frozen SDL_PollEvent (SDL_Event:POINTER):INTEGER
	 	  external
	 	  	"C (SDL_Event *):int | <SDL.h>"
	 	  	alias
	 	  		"SDL_PollEvent"
	 	  end

feature -- Retourne la constante SDL_Quit
	 frozen SDL_Quit_const:NATURAL_8
	 	 external
	 	 	"C inline use <SDL.h>"
	 	 	alias
	 	 		"SDL_QUIT"
	 	 end

feature -- Retourne la constante SDL_KeyDown
	 frozen SDL_KEYDOWN_const:NATURAL_8
	 	 external
	 	 	"C inline use <SDL.h>"
	 	 	alias
	 	 		"SDL_KEYDOWN"
	 	 end

feature -- Fonction SDL_SetColorKey de la librairie SDL
	 frozen SDL_KEYUP_const:NATURAL_8
	 	 external
	 	 	"C inline use <SDL.h>"
	 	 	alias
	 	 		"SDL_KEYUP"
	 	 end

feature -- Fonction SDL_Quit de la librairie SDL
	 frozen SDL_Quit
	 	external
	 		"C () | <SDL.h>"
	 		alias
	 			"SDL_Quit"
	 	end




feature -- Fonction SDL_SetColorKey de la librairie SDL
	 frozen SDL_SetColorKey(SDL_Surface:POINTER;flag:INTEGER;key:NATURAL_32):INTEGER
	 	external
	 		"C (SDL_Surface *,int,Uint32):int | <SDL.h>"
	 		alias
	 			"SDL_SetColorKey"
	 	end

feature -- function SDL_FreeSurface de la librairie SDL
	frozen SDL_FreeSurface(SDL_Surface:POINTER)
		external
			"C (SDL_Surface *) | <SDL.h>"
			alias
				"SDL_FreeSurface"
		end

feature -- Fonction SDL_MapRGB de la librairie SDL
	 frozen SDL_MapRGB (SDL_PixelFormat:POINTER;r,g,b:NATURAL_8):NATURAL_32
	 	external
	 		"C (SDL_PixelFormat *,Uint8,Uint8,Uint8):Uint32 | <SDL.h>"
	 		alias
	 			"SDL_MapRGB"
	 	end

feature -- Retourne la constante SDL_SrcColorKey
	 frozen SDL_SRCCOLORKEY:INTEGER
	 	external
	 		"C inline use <SDL.h>"
	 		alias
	 			"SDL_SRCCOLORKEY"
	 	end

feature -- Structure Getter Key from SDL_Event
	 frozen get_key_from_event(event:POINTER):POINTER
	 	external
	 		"C inline use <SDL.h>"
	 	alias
	 		"(SDL_KeyboardEvent *)&(((SDL_Event *)$event)->key)"
		end

feature -- Structure Getter KeySym from SDL_KeyboardEvent
	frozen get_keysym_from_keyboardevent(keyboardevent:POINTER):POINTER
		external
			"C inline use <SDL.h>"
			alias
				"(SDL_keysym *)&(((SDL_KeyboardEvent *)$keyboardevent)->keysym) "
				end

feature -- Structure Getter Sym from SDL_KeySym
	frozen get_sym_from_keysym(keysym:POINTER):INTEGER
		external
			"C [struct <SDL.h>] (struct SDL_keysym):sym"
			alias
				"sym"
		end

feature
	frozen SDL_GetTicks():NATURAL_32
		external
			"C ():Uint32 | <SDL.h>"
			alias
				"SDL_GetTicks"
		end

feature -- Retourne la constante SDLK_SPACE
	frozen SDLK_SPACE_const():INTEGER
		external
			"C inline use <SDL.h>"
			alias
				"SDLK_SPACE"
		end

feature -- Retourne la constante SDLK_ESCAPE
	frozen SDLK_ESCAPE_const():INTEGER
		external
			"C inline use <SDL.h>"
			alias
				"SDLK_ESCAPE"
		end

feature -- Retourne la constante SDLK_UP
	frozen SDLK_UP_const():INTEGER
		external
			"C inline use <SDL.h>"
			alias
				"SDLK_UP"
		end

feature -- Retourne la constante SDLK_RIGHT
	frozen SDLK_RIGHT_const():INTEGER
		external
			"C inline use <SDL.h>"
			alias
				"SDLK_RIGHT"
		end

feature -- Retourne la constante SDLK_LEFT
	frozen SDLK_LEFT_const():INTEGER
		external
			"C inline use <SDL.h>"
			alias
				"SDLK_LEFT"
		end

feature -- Structure Getter PixelFormat from SDL_Surface- SDL.h

	frozen get_Format_from_SDL_Surface (SDL_Surface:POINTER):POINTER
			-- Le champ PixelFormat de la structure `SDL_Surface'
		external
			"C [struct <SDL.h>] (struct SDL_Surface):SDL_PixelFormat *"
		alias
			"format"
		end


feature -- structure getter type SDL_Event

	 frozen get_type_from_SDL_Event (SDL_Event:POINTER):NATURAL_8
	 	external
	 		"C [struct <SDL.h>] (SDL_Event):Uint8"
	 		alias
	 			"type"
	 	end


feature -- Structure Setter h SDL_Surface- SDL.h

	frozen set_h_from_SDL_Surface (SDL_Surface:POINTER;value: INTEGER)
			-- Modifie le champ err la structure C `SDL_Surface' par la valeur `value'.
		external
			"C [struct <SDL.h>] (SDL_Surface, int)"
		alias
			"h"
		end

feature -- Structure Setter w SDL_Surface- SDL.h

	frozen set_w_from_SDL_Surface (SDL_Surface :POINTER;value: INTEGER)
			-- Modifie le champ err la structure C `SDL_Surface' par la valeur `value'.
		external
			"C [struct <SDL.h>] (SDL_Surface, int)"
		alias
			"w"
		end

feature -- Structure Getter h SDL_Surface- SDL.h

	frozen get_h_from_SDL_Surface (SDL_Surface:POINTER):INTEGER
			-- Le champ image_height de la structure `SDL_Surface'
		external
			"C [struct <SDL.h>] (struct SDL_Surface):int"
		alias
			"h"
		end

feature -- Structure Getter w SDL_Surface- SDL.h

	frozen get_w_from_SDL_Surface (SDL_Surface:POINTER):INTEGER
			-- Le champ image_width de la structure `SDL_Surface'
		external
			"C [struct <SDL.h>] (struct SDL_Surface):int"
		alias
			"w"
		end

feature -- Structure Setter x SDL_Rect - SDL.h

	frozen set_x_from_SDL_Rect (SDL_Rect:POINTER;value: INTEGER_16)
			-- Modifie le champ err la structure C `SDL_Rect' par la valeur `value'.
		external
			"C [struct <SDL.h>] (SDL_Rect, Sint16)"
		alias
			"x"
		end

feature -- Structure Setter y SDL_Rect - SDL.h

	frozen set_y_from_SDL_Rect (SDL_Rect:POINTER;value: INTEGER_16)
			-- Modifie le champ err la structure C `SDL_Rect' par la valeur `value'.
		external
			"C [struct <SDL.h>] (SDL_Rect, Sint16)"
		alias
			"y"
		end

		feature -- Structure Setter x SDL_Rect - SDL.h

frozen set_w_from_SDL_Rect (SDL_Rect:POINTER;value: NATURAL_16)
			-- Modifie le champ err la structure C `SDL_Rect' par la valeur `value'.
		external
			"C [struct <SDL.h>] (SDL_Rect, Uint16)"
		alias
			"w"
		end

feature -- Structure Setter y SDL_Rect - SDL.h

	frozen set_h_from_SDL_Rect (SDL_Rect:POINTER;value: NATURAL_16)
			-- Modifie le champ err la structure C `SDL_Rect' par la valeur `value'.
		external
			"C [struct <SDL.h>] (SDL_Rect, Uint16)"
		alias
			"h"
		end

feature -- Sizeof - SDL_Rect

	frozen sizeof_SDL_Rect:INTEGER
			-- La taille d'une structure SDL_Rect en octet.
		external
			"C inline use <SDL.h>"
		alias
			"sizeof(SDL_Rect)"
		end

feature -- Sizeof - SDL_Event

	frozen sizeof_SDL_Event:INTEGER
			-- La taille d'une structure SDL_Event en octet.
		external
			"C inline use <SDL.h>"
		alias
			"sizeof(SDL_Event)"
		end


feature -- Wrapper Librairie SDL_mixer ---------------------

	feature -- Fonction mix_init de la librairie SDL_mixer
		frozen Mix_init (flags: NATURAL_32): INTEGER
			external
				"C (Uint32):int | <SDL_mixer.h> "
			alias
				"Mix_Init"
			end

feature -- Fonction Mix_CloseAusio de la librairie SDL
	 frozen Mix_CloseAudio
	 	external
	 		"C () | <SDL_mixer.h>"
	 		alias
	 			"Mix_CloseAudio"
	 	end

feature -- Fonction Mix_OpenAudio de la librairie SDL
	frozen Mix_OpenAudio(frequency:INTEGER; format: NATURAL_16;channels:INTEGER; chunksize:INTEGER): INTEGER
		external
			"C (int,Uint16,int,int):Mix_OpenAudio | <SDL_mixer.h>"
		alias
			"Mix_OpenAudio"
	 	 end

feature -- Fonction LoadMUS de la libraire SDL_mixer
frozen Mix_LoadMUS(file:POINTER):POINTER
		external
			"C (const char *):Mix_Music * | <SDL_mixer.h>"
			alias
				"Mix_LoadMUS"
		end

feature -- Fonction PlayMusic de la libraire SDL_mixer
frozen Mix_PlayMusic(music:POINTER;loops:INTEGER):INTEGER
		external
			"C (Mix_Music *,int):int | <SDL_mixer.h>"
			alias
				"Mix_PlayMusic"
		end

feature -- constante MIX_DEFAULT_FORMAT
frozen MIX_DEFAULT_FORMAT:NATURAL_16
	external
		"C inline use <SDL_mixer.h>"
		alias
			"MIX_DEFAULT_FORMAT"
	end

feature -- wrapper Play_Channel
frozen Mix_PlayChannel(channel:INTEGER;chunk:POINTER;loops:INTEGER):INTEGER
	external
			"C (int,Mix_Chunk *,int):int | <SDL_mixer.h>"
			alias
				"Mix_PlayChannel"
		end

feature -- wrapper Load_WAV
frozen Mix_LoadWAV(fname:POINTER):POINTER
	external
		"C (const char *):Mix_Chunk * | <SDL_mixer.h>"
		alias
			"Mix_LoadWAV"
	end

feature -- wrapper Mix_FreeChunk
frozen Mix_FreeChunk (Mix_Chunk:POINTER)
	external
		"C (Mix_Chunk *) | <SDL_mixer.h>"
		alias
			"Mix_FreeChunk"
			end

feature -- wrapper halt_channel

frozen Mix_HaltChannel(channel:INTEGER):INTEGER
	external
		"C (int):int | <SDL_mixer.h>"
		alias
			"Mix_HaltChannel"
	end


----------------------------------------------------
--WRAPPER SDL_TTF
----------------------------------------------------

feature -- Fonction TTF_Quit de la librairie SDL_TTF
	 frozen TTF_Quit
	 	external
	 		"C () | <SDL_ttf.h>"
	 		alias
	 			"TTF_Quit"
	 	end

feature -- Fonction TTF_init de la librairie SDL_TTF
	frozen TTF_Init:INTEGER
		external
			"C ():int | <SDL_ttf.h> "
		alias
			"TTF_Init"
		end

feature -- Fonction TTF_OpenFont de la librairie SDL_TTF
	frozen TTF_OpenFont (file:POINTER;ptsize:INTEGER):POINTER
		external
			"C (const char *, int):TTF_Font * | <SDL_ttf.h>"
			alias
				"TTF_OpenFont"
		end


feature -- Fonction TTF_RenderText_Blended de la libraire SDL_TTF
	frozen TTF_RenderText_Blended(font,text,fg:POINTER):POINTER
		external
			"C inline use <SDL_ttf.h>"
		alias
			"TTF_RenderText_Blended((TTF_Font *)$font,(const char *)$text,*((SDL_Color *)$fg))"
		end

feature -- sizeof de la structure SDL_COLOR
	frozen sizeof_SDL_Color:INTEGER
			-- La taille d'une structure SDL_Color en octet.
		external
			"C inline use <SDL_ttf.h>"
		alias
			"sizeof(SDL_Color)"
		end

feature -- Structure Setter r SDL_Color- SDL.h

	frozen set_r_from_SDL_Color (SDL_Color:POINTER;value: NATURAL_8)
			-- Modifie le champ r de la structure C `SDL_Color' par la valeur `value'.
		external
			"C [struct <SDL_ttf.h>] (SDL_Color, Uint8)"
		alias
			"r"
		end

feature -- Structure Setter r SDL_Color- SDL.h

	frozen set_g_from_SDL_Color (SDL_Color:POINTER;value: NATURAL_8)
			-- Modifie le champ g de la structure C `SDL_Color' par la valeur `value'.
		external
			"C [struct <SDL_ttf.h>] (SDL_Color, Uint8)"
		alias
			"g"
		end

feature -- Structure Setter r SDL_Color- SDL.h

	frozen set_b_from_SDL_Color (SDL_Color:POINTER;value: NATURAL_8)
			-- Modifie le champ b de la structure C `SDL_Color' par la valeur `value'.
		external
			"C [struct <SDL_ttf.h>] (SDL_Color, Uint8)"
		alias
			"b"
		end



note
	copyright:"Copyright - Samuel Forcier - David Lafrenière"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafrenière
				Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
]"

end
