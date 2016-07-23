Global $AutoAcceptPluginLoaded = True
Global $AAState = True
Global $PixelDecline, $ColorDecline, $PixelAccept, $ColorAccept
Opt("PixelCoordMode", 2)
Opt("MouseCoordMode", 2)
Func AutoAccept($iX, $iY)
	If $AAState = False Then Return 0
	LoadCoordinates($iX, $iY)
	If Not WinActive("Dota 2") Then Return (0)
	PixelSearch($PixelDecline[0], $PixelDecline[1], $PixelDecline[0], $PixelDecline[1], $ColorDecline, 1);decline search
	If Not @error = 1 Then
		PixelSearch($PixelAccept[0], $PixelAccept[1], $PixelAccept[0], $PixelAccept[1], $ColorAccept, 1);accept search
		If Not @error = 1 Then
			MouseClick("primary", $PixelAccept[0], $PixelAccept[1], 2, 0)
			MouseMove(0, 0, 0)
		EndIf
	EndIf
	return 2
EndFunc   ;==>AutoAccept
Func toggleAA()
	If $AAState = True Then
		$AAState = False
		Beep(400, 50)
	ElseIf $AAState = False Then
		$AAState = True
		Beep(700, 50)
		Sleep(50)
		Beep(700, 50)
	EndIf
EndFunc   ;==>toggleAA
Func LoadCoordinates($iX, $iY)
	Select
		Case $iX = "1920" And $iY = "1080" ;confirmed
			Global $PixelDecline = [1202, 589]
			$ColorDecline = 0x869797
			Global $PixelAccept = [960, 503]
			$ColorAccept = 0x3D6251
		Case $iX = "1768" And $iY = "992" ;confirmed
			Global $PixelDecline = [1106, 539]
			$ColorDecline = 0x869797
			Global $PixelAccept = [884, 459]
			$ColorAccept = 0x3A5D4D
		Case $iX = "1600" And $iY = "900" ;confirmed
			Global $PixelDecline = [1000, 491]
			$ColorDecline = 0x869797
			Global $PixelAccept = [799, 419]
			$ColorAccept = 0x3C6250
		Case $iX = "1360" And $iY = "768" ;confirmed
			Global $PixelDecline = [847, 418]
			$ColorDecline = 0x869797
			Global $PixelAccept = [682, 358]
			$ColorAccept = 0x3E6553
		Case $iX = "1366" And $iY = "768" ;confirmed
			Global $PixelDecline = [851, 418]
			$ColorDecline = 0x869797
			Global $PixelAccept = [679, 355]
			$ColorAccept = 0x3C614F
		Case $iX = "1280" And $iY = "720" ;confirmed
			Global $PixelDecline = [802, 391]
			$ColorDecline = 0x869797
			Global $PixelAccept = [641, 334]
			$ColorAccept = 0x3C6250
		Case $iX = "1176" And $iY = "664" ;confirmed
			Global $PixelDecline = [736, 363]
			$ColorDecline = 0x869797
			Global $PixelAccept = [589, 309]
			$ColorAccept = 0x3D6351
		Case $iX = "1280" And $iY = "1024" ;confirmed
			Global $PixelDecline = [866, 558]
			$ColorDecline = 0x869797
			Global $PixelAccept = [636, 478]
			$ColorAccept = 0x3F6654
		Case $iX = "1280" And $iY = "960" ;confirmed
			Global $PixelDecline = [857, 522]
			$ColorDecline = 0x869797
			Global $PixelAccept = [641, 447]
			$ColorAccept = 0x3C6251
		Case $iX = "1152" And $iY = "864"
			Global $PixelDecline = [769, 471]
			$ColorDecline = 0x869797
			Global $PixelAccept = [576, 406]
			$ColorAccept = 0x416A55
		Case $iX = "1024" And $iY = "768"
			Global $PixelDecline = [680, 418]
			$ColorDecline = 0x869797
			Global $PixelAccept = [512, 357]
			$ColorAccept = 0x3D6451
		Case $iX = "800" And $iY = "600"
			Global $PixelDecline = [536, 326]
			$ColorDecline = 0x869797
			Global $PixelAccept = [395, 281]
			$ColorAccept = 0x3F6754
		Case $iX = "720" And $iY = "576"
			Global $PixelDecline = [489, 313]
			$ColorDecline = 0x869797
			Global $PixelAccept = [354, 267]
			$ColorAccept = 0x3C604F
		Case $iX = "640" And $iY = "480"
			Global $PixelDecline = [428, 262]
			$ColorDecline = 0x869797
			Global $PixelAccept = [315, 224]
			$ColorAccept = 0x3C6251
		Case $iX = "1680" And $iY = "1050"
			Global $PixelDecline = [1071, 571]
			$ColorDecline = 0x869797
			Global $PixelAccept = [839, 488]
			$ColorAccept = 0x3C6250
		Case $iX = "1600" And $iY = "1024"
			Global $PixelDecline = [1027, 557]
			$ColorDecline = 0x869797
			Global $PixelAccept = [801, 474]
			$ColorAccept = 0x3C6150
		Case $iX = "1440" And $iY = "960"
			Global $PixelDecline = [934, 524]
			$ColorDecline = 0x869797
			Global $PixelAccept = [714, 449]
			$ColorAccept = 0x3E6653
		Case $iX = "1440" And $iY = "900"
			Global $PixelDecline = [919, 490]
			$ColorDecline = 0x869797
			Global $PixelAccept = [724, 421]
			$ColorAccept = 0x3E6553
		Case $iX = "1280" And $iY = "800"
			Global $PixelDecline = [817, 437]
			$ColorDecline = 0x869797
			Global $PixelAccept = [643, 373]
			$ColorAccept = 0x3D6351
		Case $iX = "1280" And $iY = "768"
			Global $PixelDecline = [807, 417]
			$ColorDecline = 0x869797
			Global $PixelAccept = [638, 357]
			$ColorAccept = 0x3E6451
		Case $iX = "720" And $iY = "480"
			Global $PixelDecline = [467, 261]
			$ColorDecline = 0x869797
			Global $PixelAccept = [364, 225]
			$ColorAccept = 0x3E6553

			;should be blank template
		Case $iX = "" And $iY = ""
			Global $PixelDecline = []
			$ColorDecline = 0x869797
			Global $PixelAccept = []
			$ColorAccept = 0x000000
	EndSelect
EndFunc   ;==>LoadCoordinates

