@echo off
Title [MS-board]

:Checkroot
Cd C:\
If Exist root goto iAdminPassword
goto Mdroot

:Mdroot
Cd C:\
MKDIR root
Attrib +h +s C:\root

:MdUserName
Cd C:\root
MKDIR %USERNAME%
Attrib +h +s C:\root\%USERNAME%

:MdAdministrator
Cd C:\root\%USERNAME%
MKDIR Administrator
Attrib +h +s C:\root\%USERNAME%\Administrator

:MdSuperuser
Cd C:\root\%USERNAME%
MKDIR Superuser
Attrib +h +s C:\root\%USERNAME%\Superuser

:MdUserDefault
Cd C:\root\%USERNAME%
MKDIR UserDefault
Attrib +h +s C:\root\%USERNAME%\UserDefault

::For Data Backup

:MdBin
Cd C:\
Md Bin
Attrib +h +s +r C:\Bin

:MdRootBin
Cd C:\root\%USERNAME%
MKDIR RootBin
Attrib +h +s +r C:\root\%USERNAME%\RootBin


::MKDIR %AppData%\System32\cmdacoBin

:MdSystem32
Cd %AppData%
MKDIR System32
Attrib +h +s %AppData%\System32

:MdcmdacoBin
Cd %AppData%\System32
MKDIR cmdacoBin
Attrib +h +s %AppData%\System32\cmdacoBin
goto iAdmin


:iAdmin
cls
@echo off
cls
CD C:\root\%USERNAME%\Administrator
If exist iAdmin goto home
else goto iAdminPassword


:iAdminPassword
cls
@echo off
cls
Set /p iAdminpasswords=Insert new iAdmin's Passwords:

if /i %iAdminpasswords%==%iAdminpasswords% goto iAdmincurrentpasswords
Pause >nul 
Goto iAdminpasswords
:iAdmincurrentpasswords
cls
@echo off
CLS
Set /p iAdmincurrentpasswords=Insert current passwords:
CLS
If /i %iAdmincurrentpasswords%==%iAdminpasswords% goto iAdminout
Pause >nul 
Goto iAdmincurrentpasswords

:iAdminout
cls
@echo off
CD C:\root\%USERNAME%\Administrator
MKDIR iAdmin
MKDIR %iAdminpasswords%
Echo %iAdminpasswords% >> c:\root\%USERNAME%\Administrator\iAdmin.txt
CLS
goto Attention

    :Attention
	cls
@echo off
		color 0b
		title Attention!
						
				echo Attention!
				echo --------------------------------------
				echo Username :iAdmin
				echo Password :%iAdmincurrentpasswords%
				echo.
				echo.
				echo.
				echo.
				Timeout 6
		    	goto iAdminAbout


    
            :iAdminAbout
			cls
@echo off
                CLS
                color 07
                echo "                                               Create i-Admin                                                  "
                echo ________________________________________________________________________________________________________________
                echo The first person who runs [MS-board] , is in the from o i-Admin .
                echo [i-Admin] can be create the other admins and sub users.
                echo [i-Admin] can be control all users . (Revork access:Deny-Grant , Create-Remove)
                echo [i-Admin] can be completly access to [main-console] and [mainPanel] .
                echo [i-Admin] can be control the entire system with a few key .
                echo.
                echo The [i-Admin] Abilities Access to the professional or experienced person . 
                echo Only a one [i-Admin] can be exist Dont remember [i-Admin Passwords] .
                echo.
                echo.
                echo.
                echo Good luck and Enjoy !
            Timeout 6
           GOTO home


		
:home
CLS
MODE CON COLS=150 LINES=14
Title [MS-board]-Login
Color 07
@echo off
cls
echo MS-Dos Account
echo --------------------------------------
echo [1] Log-In
echo [2] Sign-Up
echo [F] FORGET-Password
echo [E] Exit
echo.
echo.
echo.
:chooseshow
echo --------------------------------------------------------------
CHOICE /C 12feh /n /M "[1]Log-In   [2]Sign-Up   [F]FORGET-Password   [E]xit:"

IF /i %errorlevel% EQU 1 goto signInButton

IF /i %errorlevel% EQU 2 goto signUpButton		

IF /i %errorlevel% EQU 3 goto ForgetPasswordButton

IF /i %errorlevel% EQU 4 Exit						

IF /i %errorlevel% EQU 5 goto Keyboardlogin




:signUpButton
cls

color 07
echo [b] Back.  [F] Forget-Password.  [E] Exit.
echo -----------------------------------------------------
:usr
set /p newname=Insert New Username:

IF /i %newname%==b GOTO home

IF /i %newname%==f GOTO ForgetPasswordButton

IF /i %newname%==e EXIT

IF %newname%==%newname% GOTO IFuname



:signUpUerror
color 04

echo [b] Back. [F] Forget-Password. [E] Exit.
echo -----------------------------------------------------
echo Incorrect Username!
set /p newname=Insert New Username:
GOTO usr


:IFuname
IF NOT EXIST %AppData%\System32\cmdacoBin\%newname% GOTO Dirnu
else goto nUExistYes


:Dirnu
CD %AppData%\System32\cmdacoBin
mkdir %newname%
cls
 md %newname%
 cls
Attrib +h +s %AppData%\System32\cmdacoBin\%newname%
GOTO mkNout



:mkNout

CD %AppData%\System32\cmdacoBin\%newname%

echo %newname% >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
echo --------------------------------------------------------------- >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
echo %TIME% >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
echo %DATE% >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt


echo %newname% >> C:\root\%USERNAME%\UserDefault\%newname%\%newname%.txt		
echo --------------------------------------------------------------- >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
echo %TIME% >> C:\root\%USERNAME%\UserDefault\%newname%\%newname%.txt	
echo %DATE% >> C:\root\%USERNAME%\UserDefault\%newname%\%newname%.txt	

Attrib +h +s C:\root\%USERNAME%\UserDefault\%newname%\%newname%.txt
Cd C:\Bin
MKDIR %newname%
Attrib +h +s +r C:\Bin\%newname%					
GOTO pass



:pass
CLS
color 0b

echo [b] Back  [E] Exit.
echo -----------------------------------------------------

SET /p pswd=Enter New Password:

IF /i "%pswd%"==b GOTO usr

IF /i %pswd%==e EXIT

IF /i %pswd%==%pswd% GOTO PassCurrent

PAUSE >nul
GOTO Passred



:Passred
color 04

echo [b] Back  [E] Exit.
echo -----------------------------------------------------
echo Incorrect Password!

SET /p Passred=Enter New Password:

IF /i "%Passred%"==b GOTO signUpButton

IF /i %Passred%==e EXIT

IF /i %Passred%==%pswd% GOTO PassCurrent

PAUSE >nul
GOTO Passred




:PassCurrent
CLS
color 09

echo [b] Back  [E] Exit.

echo -----------------------------------------------------
SET /p pswdcrrnt=Enter Current Password:

IF /i "%pswdcrrnt%"==b GOTO pass

IF /i %pswdcrrnt%==e EXIT

IF %pswdcrrnt%==%pswd% GOTO Dirnp

PAUSE >nul
GOTO PassCurrentred



:PassCurrentred
CLS
color 04

echo [b] Back  [E] Exit.
echo -----------------------------------------------------
echo Incorrect Current Password!

SET /p PassCurrentred=Enter Current Password:

IF /i "%PassCurrentred%"==b GOTO pass

IF /i %PassCurrentred%==e EXIT

IF %PassCurrentred%==%pswd% GOTO Dirnp

PAUSE >nul
GOTO PassCurrentred



:Dirnp
@echo off
CLS
CD %AppData%\System32\cmdacoBin\%newname%

echo %pswd% >> %AppData%\System32\cmdacoBin\%newname%\%pswd%.txt
echo --------------------------------------------------------------- >> %AppData%\System32\cmdacoBin\%newname%\%pswd%.txt
echo %TIME% >> %AppData%\System32\cmdacoBin\%newname%\%pswd%.txt
echo %DATE% >> %AppData%\System32\cmdacoBin\%newname%\%pswd%.txt

Cd C:\root\%USERNAME%

echo %pswd% >> C:\root\%USERNAME%\UserDefault\%newname%\%pswd%.txt
echo --------------------------------------------------------------- >> %pswd% >> C:\root\%USERNAME%\UserDefault\%newname%\%pswd%.txt
echo %TIME% >> C:\root\%USERNAME%\UserDefault\%newname%\%pswd%.txt >> C:\root\%USERNAME%\UserDefault\%newname%\%pswd%.txt
echo %DATE% >> C:\root\%USERNAME%\UserDefault\%newname%\%pswd%.txt >> C:\root\%USERNAME%\UserDefault\%newname%\%pswd%.txt

Attrib +h +s C:\root\%USERNAME%\UserDefault\%newname%\%pswd%.txt

Cd C:\Bin
MKDIR %pswd%
Attrib +h +s +r C:\Bin\%pswd%
Attrib +h +s +r C:\Bin\%newname%
goto RandQues


:RandQues

CLS
COLOR 0b
echo ------------------------------------------------------------------------------------------
::ModeCOLS=90 LINES=20
echo Press Insert [1-6] to choose select Random Question :
echo.
echo. [KEY-1] :  ??????????????
echo.
echo. [KEY-2] :  ??????????????
echo.
echo. [KEY-3] :  ??????????????
echo.
echo. [KEY-4] :  ??????????????
echo.
echo. [KEY-5] :  ??????????????
echo.
echo. [KEY-6] :  ??????????????
echo.
echo.
echo.
echo -----------------------------------------------------
choice /c 123456 /n /m "[1]  [2]  [3]  [4]  [5]  [6] Choose:"


		IF /i %errorlevel% EQU 1 GOTO Ques1
		
		IF /i %errorlevel% EQU 2 GOTO Ques2

		IF /i %errorlevel% EQU 3 GOTO Ques3
		
		IF /i %errorlevel% EQU 4 GOTO Ques4
		
		IF /i %errorlevel% EQU 5 GOTO Ques5
		
		IF /i %errorlevel% EQU 6 GOTO Ques6

		
											
											
										:Ques1
										CLS
											TITLE [MS-board] Signig up...
											CLS
											COLOR 0e
											echo.
											echo Whats your highschool name ?
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo -----------------------------------------------------
											echo [E] Exit.
											echo --------------------------------------------------------
								SET /p Answer1=My highschool's name:
									IF /i %Answer1%==e EXIT
									IF /i %Answer1%==%Answer1% GOTO Answer1out
								PAUSE >nul
									GOTO Ques1
											
											
										:Answer1out
											CD %AppData%\System32\cmdacoBin\%newname%
											echo %Answer1% >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
											mkdir %Answer1%
											CD C:\root\%USERNAME%\UserDefault
											mkdir %Answer1%
											
											echo %newname% >> %AppData%\System32\cmdacoBin\%Answer1\%Answer1%.txt
											echo %pswd% >>%AppData%\System32\cmdacoBin\%Answer1\%Answer1%.txt
											echo %TIME% >> %AppData%\System32\cmdacoBin\%Answer1%\%Answer1%.txt
											echo %DATE% >> %AppData%\System32\cmdacoBin\%Answer1\%Answer1%.txt
											echo %newname% >> C:\root\%USERNAME%\UserDefault\%Answer1%\%Answer1%.txt
											echo %pswd% >> C:\root\%USERNAME%\UserDefault\%Answer1%\%Answer1%.txt
											echo %Answer1% >> C:\root\%USERNAME%\UserDefault\%Answer1%\%Answer1%.txt	
											echo %TIME% >> C:\root\%USERNAME%\UserDefault\%Answer1%\%Answer1%.txt	
											echo %DATE% >> C:\root\%USERNAME%\UserDefault\%Answer1%\%Answer1%.txt	
											CLS
										GOTO Successfullycreated


											
											
										:Ques2
										CLS
											TITLE [MS-board] Signig up...
											CLS
											COLOR 0e
											echo.
											echo Whats your Best Friend name ?
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo -----------------------------------------------------
											echo [E] Exit.
									
											echo --------------------------------------------------------
								SET /p Answer2=My Bestfriend's name:
								
									IF /i %Answer2%==e EXIT
									IF /i %Answer2%==%Answer2% GOTO Answer2out
								PAUSE >nul
								GOTO Ques2
						
										:Answer2out
											CD %AppData%\System32\cmdacoBin\%newname%
											echo %Answer2% >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
											mkdir %Answer2%
											CD C:\root\%USERNAME%\UserDefault
											mkdir %Answer2%
											
											echo %newname% >> %AppData%\System32\cmdacoBin\%Answer2\%Answer2%.txt
											echo %pswd% >>%AppData%\System32\cmdacoBin\%Answer2\%Answer2%.txt
											echo %TIME% >> %AppData%\System32\cmdacoBin\%Answer2%\%Answer2%.txt
											echo %DATE% >> %AppData%\System32\cmdacoBin\%Answer2\%Answer2%.txt
											echo %newname% >> C:\root\%USERNAME%\UserDefault\%Answer2%\%Answer2%.txt
											echo %pswd% >> C:\root\%USERNAME%\UserDefault\%Answer2%\%Answer2%.txt
											echo %Answer2% >> C:\root\%USERNAME%\UserDefault\%Answer2%\%Answer2%.txt	
											echo %TIME% >> C:\root\%USERNAME%\UserDefault\%Answer2%\%Answer2%.txt	
											echo %DATE% >> C:\root\%USERNAME%\UserDefault\%Answer2%\%Answer2%.txt	
											CLS
										GOTO Successfullycreated
											
											
											:Ques3
											TITLE [MS-board] Signig up...
											CLS
											COLOR 0e
											echo.
											echo Whats your favorite City ?
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo -----------------------------------------------------
											echo [E] Exit.
											echo --------------------------------------------------------
					
										SET /p Answer3=My Cities name:
								
										IF /i %Answer3%==e EXIT
										IF /i %Answer3%==%Answer3% GOTO Answer3out
									PAUSE >nul
									GOTO Ques3
						
						
									:Answer3out
											CD %AppData%\System32\cmdacoBin\%newname%
											echo %Answer3% >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
											mkdir %Answer3%
											CD C:\root\%USERNAME%\UserDefault
											mkdir %Answer3%
											
											echo %newname% >> %AppData%\System32\cmdacoBin\%Answer3\%Answer3%.txt
											echo %pswd% >>%AppData%\System32\cmdacoBin\%Answer3\%Answer3%.txt
											echo %TIME% >> %AppData%\System32\cmdacoBin\%Answer3%\%Answer3%.txt
											echo %DATE% >> %AppData%\System32\cmdacoBin\%Answer3\%Answer3%.txt
											echo %newname% >> C:\root\%USERNAME%\UserDefault\%Answer3%\%Answer3%.txt
											echo %pswd% >> C:\root\%USERNAME%\UserDefault\%Answer3%\%Answer3%.txt
											echo %Answer3% >> C:\root\%USERNAME%\UserDefault\%Answer3%\%Answer3%.txt	
											echo %TIME% >> C:\root\%USERNAME%\UserDefault\%Answer3%\%Answer3%.txt	
											echo %DATE% >> C:\root\%USERNAME%\UserDefault\%Answer3%\%Answer3%.txt	
											CLS
										GOTO Successfullycreated
											

											
											
											:Ques4
											TITLE [MS-board] Signig up...
											CLS
											COLOR 0e
											echo.
											echo Whats your favorite Color ?
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo -----------------------------------------------------
											echo [E] Exit.
											echo --------------------------------------------------------
						
							SET /p Answer4=My favorite color:
							
								IF /i %Answer4%==e EXIT
								IF /i %Answer4%==%Answer4% GOTO Answer4out
							PAUSE >nul
							GOTO Ques4
											
									:Answer4out
											CD %AppData%\System32\cmdacoBin\%newname%
											echo %Answer4% >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
											mkdir %Answer4%
											CD C:\root\%USERNAME%\UserDefault
											mkdir %Answer4%
											
											echo %newname% >> %AppData%\System32\cmdacoBin\%Answer4\%Answer4%.txt
											echo %pswd% >>%AppData%\System32\cmdacoBin\%Answer4\%Answer4%.txt
											echo %TIME% >> %AppData%\System32\cmdacoBin\%Answer4%\%Answer4%.txt
											echo %DATE% >> %AppData%\System32\cmdacoBin\%Answer4\%Answer4%.txt
											echo %newname% >> C:\root\%USERNAME%\UserDefault\%Answer4%\%Answer4%.txt
											echo %pswd% >> C:\root\%USERNAME%\UserDefault\%Answer4%\%Answer4%.txt
											echo %Answer4% >> C:\root\%USERNAME%\UserDefault\%Answer4%\%Answer4%.txt	
											echo %TIME% >> C:\root\%USERNAME%\UserDefault\%Answer4%\%Answer4%.txt	
											echo %DATE% >> C:\root\%USERNAME%\UserDefault\%Answer4%\%Answer4%.txt	
											CLS
										GOTO Successfullycreated

											
											
											:Ques5
											TITLE [MS-board] Signig up...
											CLS
											COLOR 0e
											echo.
											echo Whats your favorite Sport ?
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo -----------------------------------------------------
											echo [E] Exit.
											echo --------------------------------------------------------
								SET /p Answer5=My favorite sport:
								
									IF /i %Answer5%==e EXIT
									IF /i %Answer5%==%Answer5% GOTO Answer5out
										PAUSE >nul
									GOTO Ques5
									
										:Answer5out
											CD %AppData%\System32\cmdacoBin\%newname%
											echo %Answer5% >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
											mkdir %Answer5%
											CD C:\root\%USERNAME%\UserDefault
											mkdir %Answer5%
											
											echo %newname% >> %AppData%\System32\cmdacoBin\%Answer5\%Answer5%.txt
											echo %pswd% >>%AppData%\System32\cmdacoBin\%Answer5\%Answer5%.txt
											echo %TIME% >> %AppData%\System32\cmdacoBin\%Answer5%\%Answer5%.txt
											echo %DATE% >> %AppData%\System32\cmdacoBin\%Answer5\%Answer5%.txt
											echo %newname% >> C:\root\%USERNAME%\UserDefault\%Answer5%\%Answer5%.txt
											echo %pswd% >> C:\root\%USERNAME%\UserDefault\%Answer5%\%Answer5%.txt
											echo %Answer5% >> C:\root\%USERNAME%\UserDefault\%Answer5%\%Answer5%.txt	
											echo %TIME% >> C:\root\%USERNAME%\UserDefault\%Answer5%\%Answer5%.txt	
											echo %DATE% >> C:\root\%USERNAME%\UserDefault\%Answer5%\%Answer5%.txt	
											CLS
										GOTO Successfullycreated
	
	

											
											
											:Ques6
											TITLE [MS-board] Signig up...
											CLS
											COLOR 0e
											echo.
											echo Whats your Favorite Car ?
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo -----------------------------------------------------
											echo [E] Exit.
											echo --------------------------------------------------------
							
							SET /p Answer1=My favorite car:
								
									IF /i %Answer6%==e EXIT
									IF /i %Answer6%==%Answer6% GOTO Answer6out
								PAUSE >nul
								GOTO Ques6
									
								:Answer6out
											CD %AppData%\System32\cmdacoBin\%newname%
											echo %Answer6% >> %AppData%\System32\cmdacoBin\%newname%\%newname%.txt
											mkdir %Answer6%
											CD C:\root\%USERNAME%\UserDefault
											mkdir %Answer6%
											
											echo %newname% >> %AppData%\System32\cmdacoBin\%Answer6\%Answer6%.txt
											echo %pswd% >>%AppData%\System32\cmdacoBin\%Answer6\%Answer6%.txt
											echo %TIME% >> %AppData%\System32\cmdacoBin\%Answer6%\%Answer6%.txt
											echo %DATE% >> %AppData%\System32\cmdacoBin\%Answer6\%Answer6%.txt
											echo %newname% >> C:\root\%USERNAME%\UserDefault\%Answer6%\%Answer6%.txt
											echo %pswd% >> C:\root\%USERNAME%\UserDefault\%Answer6%\%Answer6%.txt
											echo %Answer6% >> C:\root\%USERNAME%\UserDefault\%Answer6%\%Answer6%.txt	
											echo %TIME% >> C:\root\%USERNAME%\UserDefault\%Answer6%\%Answer6%.txt	
											echo %DATE% >> C:\root\%USERNAME%\UserDefault\%Answer6%\%Answer6%.txt	
											CLS
										GOTO Successfullycreated
	
	
								:ForgetPasswordButton
								TITLE [MS-board] Signig up...
											CLS
											echo.
											echo You must have your previos Username!
											echo If you don't ,better create a new one.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo -----------------------------------------------------
											echo [1] I Have last my Username.
											echo [2] I Have only last my answer.
											echo [B] Back.
											echo [E] Exit.
											echo -----------------------------------------------------
										choice /c 12be /n /m "Choose:"
											
											
											IF %errorlevel% EQU 1 GOTO Insertlastusername
											IF %errorlevel% EQU 2 GOTO Insertlastasnwer
											IF %errorlevel% EQU 3 GOTO goto home
											IF %errorlevel% EQU 4 EXIT
											
											
											:Insertlastusername
											CLS
											COLOR 0d
											TITLE [MS-board] [Forget-Password] [Username]
											echo The Last my Username...
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.																
											echo.
											echo.
											echo.
											echo -----------------------------------------------------
											
										SET /p ForgetPasswordInsertLastUsername=Last Username:

											CD %AppData%\System32\cmdacoBin
											IF /i EXIST %ForgetPasswordInsertLastUsername% GOTO RDlastusername

										PAUSE >nul
											COLOR 04
											echo It's Wrong!
											echo Try again.
										PAUSE >nul
										GOTO ForgetPasswordButton
										
										
										
								:RDlastusername
										CD %AppData%\System32\cmdacoBin
										RD %ForgetPasswordInsertLastUsername% /s /q
										mkdir %ForgetPasswordInsertLastUsername%
										IF /i %errorlevel% EQU 1 GOTO nUExistYes
										CD %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastUsername%
										echo %ForgetPasswordInsertLastUsername% >> %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastUsername%\%ForgetPasswordInsertLastUsername%.txt
										echo %TIME% >> %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastUsername%\%ForgetPasswordInsertLastUsername%.txt
										
										CLS
									GOTO createNewpassword
										
											
								:Insertlastasnwer
								
										CLS
										COLOR 0d
											
											echo What answer did you give the question?
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo The answer's question of my last Username was...
											echo -----------------------------------------------------
										
											SET /p ForgetPasswordInsertLastquestion=Last answer:
											CD %AppData%\System32\cmdacoBin
											IF /i EXIST %ForgetPasswordInsertLastquestion% GOTO RDlastquestion
											PAUSE >nul
											COLOR 04
											echo Wrong Answer!
											echo Try again.
											PAUSE >nul
										GOTO Insertlastasnwer
										
										:RDlastquestion
										CLS
										CD %AppData%\System32\cmdacoBin
										RD %ForgetPasswordInsertLastquestion% /s /q
									
										mkdir %ForgetPasswordInsertLastquestion%
									SET /p createNewusername=New Username:
									
										IF /i %createNewusername%==%createNewusername% GOTO RDlastquestion2
								
									PAUSE >nul
									GOTO RDlastquestion
										:RDlastquestion2
										echo %createNewusername% >> %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastquestion%\%ForgetPasswordInsertLastquestion%.txt
										echo %TIME% %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastquestion%\%ForgetPasswordInsertLastquestion%.txt
										echo %ForgetPasswordInsertLastquestion% %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastquestion%\%ForgetPasswordInsertLastquestion%.txt
										GOTO createNewpassword2
										

											
											
											:createNewpassword
											CLS
											COLOR 0e
											CD %AppData%\System32\cmdacoBin
											SET /p createNewpassword=New Password:
											IF /i %createNewpassword%==%createNewpassword% GOTO createNewCurrentpassword
											PAUSE >nul
											GOTO createNewpasswordred
											
								:createNewpasswordred																									
											CLS
											COLOR 04
											CD %AppData%\System32\cmdacoBin
											echo Incorrect Password!
											SET /p createNewpassword=New Password:
											IF /i %createNewpassword%==%createNewpassword% GOTO createNewCurrentpassword
											PAUSE >nul
											GOTO createNewpasswordred
											
											:createNewCurrentpassword
											CLS
											COLOR 0e
											SET /p createNewCurrentpassword=Current Password:
											IF /i %createNewCurrentpassword%==%createNewpassword% GOTO createNewCurrentpasswordout
											PAUSE >nul
											GOTO createNewCurrentpasswordred


								:createNewCurrentpasswordred
											CLS
											color 04
											echo Incorrect Current Password!
											SET /p createNewCurrentpassword=Current Password:
											IF /i %createNewCurrentpassword%==%createNewpassword% GOTO createNewCurrentpasswordout
											PAUSE >nul
											GOTO createNewCurrentpasswordred
											
											
											
											:createNewCurrentpasswordout
											echo %createNewCurrentpassword% >> %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastUsername%\%ForgetPasswordInsertLastUsername%.txt
											echo %TIME% >> %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastUsername%\%ForgetPasswordInsertLastUsername%.txt
											CLS
											GOTO Successfullycreated
											
											:createNewpassword2
											CLS
											COLOR 0e
											CD %AppData%\System32\cmdacoBin
											SET /p createNewpassword=New Password:
											IF /i %createNewpassword%==%createNewpassword% GOTO createNewCurrentpassword2
											PAUSE >nul
											GOTO createNewpassword2red
											
											
								:createNewpassword2red
											CLS
											COLOR 04
											CD %AppData%\System32\cmdacoBin
											echo Incorrect Password!
											SET /p createNewpassword=New Password:
											IF /i %createNewpassword%==%createNewpassword% GOTO createNewCurrentpassword2
											PAUSE >nul
											GOTO createNewpassword2
											
											
											
									:createNewCurrentpassword2
									CLS
									color 0e
											SET /p createNewCurrentpassword=Current Password:
											IF /i %createNewCurrentpassword%==%createNewpassword% GOTO createNewCurrentpassword2out
											PAUSE >nul
											GOTO createNewCurrentpassword2
										
								:createNewCurrentpassword2red	
											CLS
											color 04
											echo Incorrect Current Password!
											SET /p createNewCurrentpassword=Current Password:
											IF /i %createNewCurrentpassword%==%createNewpassword% GOTO createNewCurrentpassword2out
											PAUSE >nul
											GOTO createNewCurrentpassword2
											
											:createNewCurrentpassword2out
											echo %createNewCurrentpassword% >> %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastquestion%\%ForgetPasswordInsertLastquestion%.txt
											echo %TIME% >> %AppData%\System32\cmdacoBin\%ForgetPasswordInsertLastquestion%\%ForgetPasswordInsertLastquestion%.txt
											CLS
											GOTO Successfullycreated
									
											

		:nUExistYes
			COLOR 0c

			echo The Entered UserName Already Exist.
			pause >nul
			GOTO home

						:Successfullycreated
						
								CLS
								COLOR 0a
								TITLE [MS-board] [Successfully-Created]
								echo ------------------------------------------------------------------------------------------
								echo MS-Dos Account
								echo ------------------------------------------------------------------------------------------
								echo.
								echo Your Account has been Successfully created!
								echo Username : %newname%
								echo Password : %pswd%
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo -----------------------------------------------------
							Pause >nul
								GOTO home


	:signInButton
	::ModeCOLS=90 LINES=20

	CLS
	COLOR 0a
	
			TITLE [MS-board] [Sign-In] [Insert-Username]
		echo ------------------------------------------------------------------------------------------
		echo  Accounts Log In [Insert-Username]
		echo ------------------------------------------------------------------------------------------
							
				echo Insert Username
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo [B] Back.
			    echo [E] Exit.
				echo -----------------------------------------------------
								
								
		SET /p logname=Enter Username:
		@echo off
			IF /i %logname%==b GOTO home
			IF /i %logname%==e EXIT
			IF /i %logname%==f GOTO ForgetPasswordButton
			IF /i %logname%==B GOTO home
			IF /i %logname%==E EXIT
			IF /i %logname%==F GOTO ForgetPasswordButton
			IF /i %logname%==iadmin GOTO iadminlogin
			IF /i %logname%==IADMIN GOTO iadminlogin
			IF /i %logname%==01012235756321006134010101 goto keyboardMode
			IF exist %AppData%\System32\cmdacoBin\%logname% goto logpass
			
			
	
			IF /i %logname%==hosseinpakzad GOTO keyboardlogin
			IF /i %logname%==Hosseinpakzad GOTO keyboardlogin
			IF /i %logname%==HOSSEINPAKZAD GOTO keyboardlogin
			IF /i %logname%==hosseinpakzadafshar GOTO keyboardlogin
			IF /i %logname%==HOSSEINPAKZADAFSHAR GOTO keyboardlogin
			IF /i %logname%==Hosseinpakzadafshar GOTO keyboardlogin
			IF /i %logname%==keyboard GOTO keyboardlogin
			IF /i %logname%==Keyboard GOTO keyboardlogin
			IF /i %logname%==KEYBOARD GOTO keyboardlogin
			IF /i %logname%==key4bard GOTO keyboardlogin
			IF /i %logname%==Keyboard GOTO keyboardlogin
			IF %logname%==KEY4BOARD GOTO keyboardlogin
			IF EXIST %AppData%\System32\cmdacoBin\%logname% GOTO logpass


		    	PAUSE >nul
		    	GOTO Uerrorlog

	:logpass
	::ModeCOLS=90 LINES=20
	TITLE [MS-board] [Sign-In] [Insert-Password]
	CLS
	cd C:\root\%USERNAME%\Administrator
		echo ------------------------------------------------------------------------------------------
		echo  Accounts Log In [Insert-Password]
		echo ------------------------------------------------------------------------------------------
							
			echo.
        	echo Insert Password:
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo [B] Back.
	    	echo [E] Exit.
			echo -----------------------------------------------------
							
			
	SET /p logpass="Password:"

			IF /i "%logpass%"==b GOTO signInButton
			IF /i "%logpass%"==B GOTO signInButton
			IF /i %logpass%==f GOTO ForgetPasswordButton
			IF /i %logpass%==F GOTO ForgetPasswordButton
			IF /i %logpass%==e EXIT
			IF /i %logpass%==E EXIT
			IF EXIST %logname% GOTO logdone
		PAUSE >nul
		GOTO Perrorlog
			
			
		:iadminlogin
		Set /p iadminlogin=Enter Password:
		
IF exist C:\root\%USERNAME%\Administrator\%logpass% goto iAdminMode
		pause >nul
		goto iadminloginred
		
		    :iadminloginred
	            Color 04
	            Echo Incorrect Password!
	            Echo Access Denied.
	            echo.
goto iadminlogin
			
			
		:Uerrorlog
		TITLE [MS-board] [Username-Error]
		
				COLOR 04
				echo.
				echo Incorrect Username!
				echo Access Denied.
				pause >nul
				GOTO signInButton
				
				
		:Perrorlog
		TITLE [MS-board] [Password-Error]
				COLOR 04
				echo.
				echo Incorrect Password!
				echo Access Denied.
				pause >nul
				GOTO logpass

	:logdone
	::ModeCOLS=90 LINES=20
	TITLE [MS-board] [Successfully-Logged in]
		CLS
			COLOR 0a
			echo ------------------------------------------------------------------------------------------
			echo MS-Board
			echo ------------------------------------------------------------------------------------------		
			echo.
				echo  Successfully Logged in!
				echo.
				pause >nul
				GOTO  mainmenu



	:ExitButton
	::ModeCOLS=90 LINES=20
	CLS
	COLOR 04
	TITLE [MS-board] [Exit-Mode]
	echo ------------------------------------------------------------------------------------------		
	echo [Exit-Mode]
	echo ------------------------------------------------------------------------------------------		
	echo.
	echo Are you sure ?
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo [Y] Yes.
	echo [N] No.
	echo ------------------------------------------------------------------------------------------
	choice /c yn /n /m "[Y]es   [N]o.

	IF %errorlevel% EQU 1 EXIT
	IF %errorlevel% EQU 2 GOTO home




		
	:iAdminACCESS
	::ModeCOLS=90 LINES=17
	CLS
	COLOR 0c
	TITLE [Administrator-Mode]
	echo ------------------------------------------------------------------------------------------		
	echo Administrator Mode!
	echo ------------------------------------------------------------------------------------------		
	echo Hi Admin
	echo Wellcome
	echo.
	echo We missed you!
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo [E] Exit.
	echo ------------------------------------------------------------------------------------------
	SET /p iAdminACCESS=Enter Password:
	IF /i %iAdminACCESS%==e EXIT
	IF /i %iAdminACCESS%==hossein22357563 GOTO keyboardMode
	IF /i %rootiAdmin%=="01012235756321006134010101" GOTO rootkeyboard
	IF /i %iAdminACCESS%==qolhovalahoahad goto mainmenu
	CD C:\root\%USERNAME%\Administrator\Administrator
	FIND %iAdminACCESS% C:\root\%USERNAME%\Administrator\Administrator.txt
	IF %errorlevel% EQU 0 GOTO rootiAdmin
	tskill explorer
	tskill taskmgr
	CLS
	COLOR 04
	echo Access Denied!
	echo Do NOT try again.
	Timeout 5
	GOTO lastchance


	:iAdminMode
	CLS
ModeCOLS=90 LINES=28
		COLOR 0a
				TITLE iAdmin [Successfully-Login]
				echo ------------------------------------------------------------------------------------------
				echo iAdmin [Successfully-Login]
				echo ------------------------------------------------------------------------------------------		
						echo Hi iAdmin
						echo Wellcome
							echo.
							echo [board] missed you!
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo ------------------------------------------------------------------------------------------
						Timeout 2
						GOTO rootiAdmin
						
	:rootiAdmin
	::ModeCOLS=98 LINES=36
		CLS
			COLOR 03
			
				TITLE [i-Admin]
			echo ------------------------------------------------------------------------------------------		
					echo [i-Admin]
			echo ------------------------------------------------------------------------------------------		
					
						echo Root
						echo.
						echo [-m] Main menu .
						echo [-ucfg] User accont Access control .
						echo [-profcfg] Edit Profile .
						echo [-darkpnl] Dark panel cheat .
						echo [-con] Console .
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo [Q] Sign out .
						echo [E] Exit .
						echo ------------------------------------------------------------------------------------------		
						SET /p rootiAdmin=Cli :
						
								IF /i %rootiAdmin%=="-m" GOTO MainMenu
								IF /i %rootiAdmin%=="-ucfg" GOTO rootiAdminUCFG
								IF /i %rootiAdmin%=="-profcfg" GOTO rootiAdminProfile
								IF /i %rootiAdmin%=="-darkpnl" GOTO rootiAdminDarkpnl
								IF /i %rootiAdmin%=="-con" GOTO rootiAdminConsole
								IF /i %rootiAdmin%=="01012235756321006134010101" GOTO rootkeyboard
								IF /i %rootiAdmin%==q GOTO home
								IF /i %rootiAdmin%==Q GOTO home
								IF /i %rootiAdmin%==e EXIT
								IF /i %rootiAdmin%==E EXIT
								PAUSE >nul
								GOTO rootiAdmin





	:keyboardlogin
	::ModeCOLS=98 LINES=36

			CLS	
			COLOR 0a
				TITLE [key4board][Login]
				echo ------------------------------------------------------------------------------------------
					echo [board] [Login]
				echo ------------------------------------------------------------------------------------------		
					
							echo Enter Keyboard's Password
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
						echo ------------------------------------------------------------------------------------------	
						set /p keyboardlogin=Enter Password:
						

							If /i %keyboardlogin%==b goto logpass
							If /i %keyboardlogin%==B goto logpass
							If /i %keyboardlogin%==e goto Exit
							If /i %keyboardlogin%==E goto Exit					
							If /i %keyboardlogin%==hossein22357563 GOTO keyboardMode
							If /i %keyboardlogin%==HOSSEIN22357563 GOTO keyboardMode
							Pause >nul
							goto keyboardloginred

	:keyboardloginred
	::ModeCOLS=98 LINES=36
color 04
echo Incorrect Password !
echo Access Denied !
echo.
						set /p keyboardloginred=Enter Password:
							If /i %keyboardloginred%==b goto logpass
							If /i %keyboardloginred%==B goto logpass
							If /i %keyboardloginred%==e goto Exit
							If /i %keyboardloginred%==E goto Exit					
							If /i %keyboardloginred%==hossein22357563 GOTO keyboardMode
							If /i %keyboardloginred%==HOSSEIN22357563 GOTO keyboardMode
							Pause >nul
							goto keyboardloginred










	:keyboardMode
	::ModeCOLS=98 LINES=36

			CLS	
			COLOR 0a
				TITLE [key-4board][Successfully-Login]
				echo ------------------------------------------------------------------------------------------
					echo [b-oard] [Successfully-Login]
				echo ------------------------------------------------------------------------------------------		
					
						echo Hi Board!
						echo Wellcome
							echo.
							echo [board] missed you!
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
						echo ------------------------------------------------------------------------------------------	
						Timeout 2
						GOTO rootkeyboard


	:rootkeyboard
	::ModeCOLS=98 LINES=37
		CLS
			COLOR 03
			
				TITLE [Key4board]
			echo ------------------------------------------------------------------------------------------		
					echo [Key4board]
			echo ------------------------------------------------------------------------------------------		
					
						echo Root
						echo.
						echo [!setaccss] Set/Get Access .
						echo [!lsuser] Show/Config Users-List .
						echo [!edit] Edit/Change Profile's Setting .
						echo [!convir] Create/Config Virus.
						echo [!conreg] Config Registerty-Editor .
						echo [!concmkdir] Config Command-Promtp .
						echo [!con] Console .
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo [!winrepass] Windows Break Password's .
						echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
						echo [Q] Sign out .
						echo [E] Exit .
						echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
						SET /p rootkeyboard=root/:
						
								IF /i %rootkeyboard%=="!setaccss" GOTO rootkeyboardUCFG
								IF /i %rootkeyboard%=="!edit" GOTO rootkeyboardPROF
								IF /i %rootkeyboard%=="!con" GOTO rootkeyboardCONSOLE
								IF /i %rootkeyboard%=="!winrepass" GOTO rootkeyboardWINREPASS
								IF /i %rootkeyboard%==q GOTO home
								IF /i %rootkeyboard%==Q GOTO home
								IF /i %rootkeyboard%==e EXIT
								IF /i %rootkeyboard%==E EXIT
								PAUSE >nul
								GOTO rootkeyboard
								


			
			:rootiAdminUCFG
			::ModeCOLS=98 LINES=36
				CLS
				COLOR 09
				TITLE [i-Admin] [UserAccess-Configuration]
				
			echo ------------------------------------------------------------------------------------------		
				echo [i-Admin] [UserAccess-Configuration] Menu
			echo ------------------------------------------------------------------------------------------		
	
				echo ~\Root\\UConfig
				echo.
				echo [A] Create/Remove - Administrator .
				echo [S] Create/Remove - SuperUser .
				echo [D] Create/Remove - UserDefault .
				echo [E] Edit / Change User .
				echo.		
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo [B] Back .
				echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				choice /c asdeb /n /m "Cli/ :"
				
						
						IF %errorlevel% EQU 1 GOTO rootiAdminUCFGmkdlAdministrator
						IF %errorlevel% EQU 2 GOTO rootiAdminUCFGmkdlSuperUser
						IF %errorlevel% EQU 3 GOTO rootiAdminUCFGmkdlUserDefault
						IF %errorlevel% EQU 4 GOTO rootiAdminUCFGeditAll
						IF %errorlevel% EQU 5 GOTO rootiAdmin


					:rootiAdminUCFGAdministrator
					::ModeCOLS=98 LINES=36
						CLS
						COLOR 0b
						TITLE [i-Admin] [UserAccess-Configuration] [Administrator]
	
							echo ------------------------------------------------------------------------------------------		
							echo [i-Admin] [UserAccess-Configuration] [Administrator] Menu
							echo ------------------------------------------------------------------------------------------		
				
							echo ~\Root\\UConfig\Administrator
							echo.
							echo [1] Show-Administrator .
							echo [2] Create-Administrator .
							echo [3] Remove-Administrator .
							echo.
							echo.		
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo [B] Back .
							echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							choice /c 123b /n /m "Cli/ :"
							
							
									IF %errorlevel% EQU 1 GOTO rootiAdminUCFGShowAdministrator
									IF %errorlevel% EQU 2 GOTO rootiAdminUCFGSetAdministrator
									IF %errorlevel% EQU 3 GOTO rootiAdminUCFGRemoveAdministrator
									IF %errorlevel% EQU 4 GOTO rootiAdminUCFG
									

														
:rootiAdminUCFGSetAdministrator

	CLS
	COLOR 0b
	TITLE [i-Admin] [UserAccess-Configuration] SetAdministrator

	CD "%AppData%\System32\cmdacoBin"
	CLS
	mkdir Administrators
	CLS
	CD "%AppData%\System32\cmdacoBin\Administrators"
	
	
			CLS
			SET /p SetAdministratorName=Insert Administrator's Username:
			CLS
					IF /i %SetAdministratorName%==%SetAdministratorName% GOTO SetAdministratorPass
					PAUSE >nul
					GOTO Mainboard_setaccess_SetAdministrator
					
			:SetAdministratorPass
				CLS
				SET /p SetAdministratorPass=Insert Administrator's Password
				CLS
				IF /i %SetAdministratorPass%==%SetAdministratorPass% GOTO SetAdministratorCurrentPass
						PAUSE >nul
						GOTO SetAdministratorPass
	
			:SetAdministratorCurrentPass
				CLS
				SET /p Set_Administrator_CurrentPas=Curent Password:
				CLS
					IF /i %SetAdministratorCurrentPass%==%SetAdministratorPass% GOTO SetAdministratorUserOut
					PAUSE >nul
					GOTO SetAdministratorCurrentPass
					
			:SetAdministratorUserOut
			::ModeCOLS=98 LINES=32
				CLS
				CD "%AppData%\System32\cmdacoBin\Administrators"
				mkdir %SetAdministratorName%
				CD "%AppData%\System32\cmdacoBin\Administrators\%SetAdministratorName%"
				echo %SetAdministratorName% >> "%AppData%\System32\cmdacoBin\Administrators\%SetAdministratorName%\%SetAdministratorName%.txt"
				echo %TIME% >> "%AppData%\System32\cmdacoBin\Administrators\%SetAdministratorName%\%SetAdministratorName%.txt"
				echo %SetAdministratorPass% >> "%AppData%\System32\cmdacoBin\Administrators\%SetAdministratorName%\%SetAdministratorName%.txt"
				echo %DATE% >> "%AppData%\System32\cmdacoBin\Administrators\%SetAdministratorName%\%SetAdministratorName%.txt"
				echo %TIME% >> "%AppData%\System32\cmdacoBin\Administrators\%SetAdministratorName%\%SetAdministratorName%.txt"
			CD %AppData%

			Timeout 2
			CLS
			::ModeCOLS=98 LINES=32
			COLOR 0a
			TITLE [i-Admin] Successfully Set-Administrator
			echo Successfully Created Administrator!
			echo Create is done.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo --------------------------------------------------------
			Timeout 2 
			rootiAdminUCFGSetAdministrator
			
			
																		
								:rootiAdminUCFGShowAdministrator
								::ModeCOLS=98 LINES=32
									CLS
									COLOR 09
									TITLE [i-Admin] [UserAccess-Configuration] [Administrator]

										CD "%AppData%\System32\cmdacoBin\Administrators"
										
										CLS
										echo ------------------------------------------------------------------------------------------		
										echo [i-Admin] [UserAccess-Configuration] [Administrator] Show
										echo ------------------------------------------------------------------------------------------		
										echo.
										echo ~\Root\\UConfig\Administrator\Show
										echo.
										CD "%AppData%\System32\cmdacoBin\Administrators"
										echo %TIME%
										echo %DATE%
										echo dir
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo [B] Back .
										echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
										choice /c b /n /m "Cli/ :"
										
										
												IF %errorlevel% EQU 1 GOTO rootiAdminUCFGAdministrator
												
										:rootiAdminUCFGShowSuperuser
										::ModeCOLS=98 LINES=32
										CLS
										COLOR 09
										[i-Admin] [UserAccess-Configuration] [Superuser]  
										CD "%AppData%\System32\cmdacoBin\SuperUser"
				
										echo ------------------------------------------------------------------------------------------		
										echo [i-Admin] [UserAccess-Configuration] [SuperUser] Show
										echo ------------------------------------------------------------------------------------------		
										echo.
										echo ~\Root\\UConfig\SuperUsers\Show
										echo.
										echo %TIME%
										echo %DATE%
										echo dir
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo [B] Back .
										echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
										choice /c b /n /m "Cli/ :"
										
										
												IF %errorlevel% EQU 1 GOTO rootiAdminUCFGSuperUser
											
											
												
										:rootiAdminUCFGShowUserDefault
										::ModeCOLS=98 LINES=32
										CLS
										COLOR 09
									title [i-Admin] [UserAccess-Configuration] [UserDefault]  
										CD "%AppData%\System32\cmdacoBin\UserDefault"
				
										echo ------------------------------------------------------------------------------------------		
										echo [i-Admin] [UserAccess-Configuration] [UserDefault] Show
										echo ------------------------------------------------------------------------------------------		
										echo.
										echo ~\Root\\UConfig\UserDefault\Show
										echo.
										echo %TIME%
										echo %DATE%
										echo dir
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo [B] Back .
										echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
										choice /c b /n /m "Cli/ :"
										
										
												IF %errorlevel% EQU 1 GOTO rootiAdminUCFGUserDefault
											
			
										
					
			:rootiAdminUCFGSuperUser
			::ModeCOLS=98 LINES=32
				CLS
				COLOR 09
				TITLE [i-Admin] [UserAccess-Configuration] [Superuser]
				
				echo ------------------------------------------------------------------------------------------		
				echo [i-Admin] [UserAccess-Configuration] [Superuser] Menu
				echo ------------------------------------------------------------------------------------------		

				echo ~\Root\\UConfig\Superuser
				echo.
				echo [1] Show-Superuser .
				echo [2] Create-Superuser .
				echo [3] Remove-Superuser .
				echo.
				echo.											
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo [B] Back .
				echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				
				choice /c 123b /n /m "Cli/ :"
					IF %errorlevel% EQU 1 GOTO rootiAdminUCFGShowSuperuser
					IF %errorlevel% EQU 2 GOTO rootiAdminUCFGSetSuperuser
					IF %errorlevel% EQU 3 GOTO rootiAdminUCFGRemoveSuperuser
					IF %errorlevel% EQU 4 GOTO rootiAdminUCFG
			
								
					:rootiAdminUCFGSetSuperuser
					
							CLS
							COLOR 0b
							TITLE title [i-Admin] [UserAccess-Configuration] [Superuser] Set
							

							CLS
							mkdir "UserDefault"
							CLS
							CD "%AppData%\System32\cmdacoBin"
							CLS
							mkdir SuperUsers
							CLS
							CD "%AppData%\System32\cmdacoBin\SuperUsers"
							
							
									CLS
									SET /p SetSuperusersName=Insert Superuser's Username:
									CLS
											IF /i %SetSuperusersName%==%SetSuperusersName% GOTO SetSuperuserPass
											PAUSE >nul
											GOTO rootiAdminUCFGSetSuperuser
											
									:SetSuperuserPass
										CLS
										SET /p SetSuperuserPass=Insert Superuser's Password
										CLS
										IF /i %SetSuperuserPass%==%SetSuperuserPass% GOTO SetSuperuserCurrentPass
												PAUSE >nul
												GOTO SetSuperuserPass
							
									:SetSuperuserCurrentPass
										CLS
										SET /p SetSuperuserCurrentPass=Curent Password:
										CLS
											IF /i %SetSuperuserCurrentPass%==%SetSuperuserPass% GOTO SetSuperuserUserOut
											PAUSE >nul
											GOTO SetSuperuserCurrentPass
											
									:SetSuperuserUserOut
									::ModeCOLS=98 LINES=32
										CLS
										CD "%AppData%\System32\cmdacoBin\SuperUsers"
										mkdir %SetSuperusersName%
										CD "%AppData%\System32\cmdacoBin\SuperUsers\%SetSuperusersName%"
										echo %SetSuperusersName% >> "%AppData%\System32\cmdacoBin\SuperUsers\%SetSuperusersName%\%SetSuperusersName%.txt"
										echo %TIME% >> "%AppData%\System32\cmdacoBin\SuperUsers\%SetSuperusersName%\%SetSuperusersName%.txt"
										echo %SetSuperuserPass% >> "%AppData%\System32\cmdacoBin\SuperUsers\%SetSuperusersName%\%SetSuperusersName%.txt"
										echo %DATE% >> "%AppData%\System32\cmdacoBin\SuperUsers\%SetSuperusersName%\%SetSuperusersName%.txt"
										echo %TIME% >> "%AppData%\System32\cmdacoBin\SuperUsers\%SetSuperusersName%\%SetSuperusersName%.txt"
									CD %AppData%
								
									CLS
									::ModeCOLS=98 LINES=32
									COLOR 0a
									TITLE [i-Admin] Successfully Create-Superuser
									Timeout 2
									CLS
									::ModeCOLS=98 LINES=32
									echo Successfully Created Superuser!
									echo Create is done.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo --------------------------------------------------------
							
							Timeout 1
								GOTO rootiAdminUCFGSuperUser


					
												

												
												

							:rootiAdminUCFGUserDefault
								::ModeCOLS=98 LINES=32
								CLS
								COLOR 09
								TITLE [i-Admin] [UserAccess-Configuration] [UserDefault]
								
								echo ------------------------------------------------------------------------------------------		
								echo [i-Admin] [UserAccess-Configuration] [UserDefault] Menu
								echo ------------------------------------------------------------------------------------------		
			
								echo ~\Root\\UConfig\UserDefault
								echo.
								echo [1] Show-UserDefault .
								echo [2] Create-UserDefault .
								echo [3] Remove-UserDefault .
								echo.
								echo.											
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo.
								echo [B] Back .
								echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								
								choice /c 123b /n /m "Cli/ :"
									IF %errorlevel% EQU 1 GOTO rootiAdminUCFGShowUserDefault
									IF %errorlevel% EQU 2 GOTO rootiAdminUCFGSetUserDefault
									IF %errorlevel% EQU 3 GOTO rootiAdminUCFGRemoveUserDefault
									IF %errorlevel% EQU 4 GOTO rootiAdminUCFG
							

		:rootiAdminUCFGSetUserDefault
			
					CLS
					COLOR 0b
					TITLE [i-Admin] [UserAccess-Configuration] [UserDefault] Set
					
					CD C:\
					CLS
					mkdir "Program Files (x64)"
					CLS
		
			
					CLS
					mkdir "UserDefault"
					CLS
					CD "%AppData%\System32\cmdacoBin"
					CLS
					mkdir UserDefault
					CLS
					CD "%AppData%\System32\cmdacoBin\UserDefault"
					
					
							CLS
							SET /p SetUserDefaultName=Insert UserDefault's Username:
							CLS
									IF /i %SetUserDefaultName%==%SetUserDefaultName% GOTO SetUserDefaultPass
									PAUSE >nul
									GOTO rootiAdminUCFGSetUserDefault
									
							:SetUserDefaultPass
								CLS
								SET /p SetUserDefaultPass=Insert UserDefault's Password
								CLS
								IF /i %SetUserDefaultPass%==%SetUserDefaultPass% GOTO SetUserDefaultCurrentPass
										PAUSE >nul
										GOTO SetUserDefaultPass
					
							:SetUserDefaultCurrentPass
								CLS
								SET /p SetUserDefaultCurrentPass=Curent Password:
								CLS
									IF /i %SetUserDefaultCurrentPass%==%SetUserDefaultPass% GOTO SetUserDefaultUserOut
									PAUSE >nul
									GOTO SetUserDefaultCurrentPass
									
							:SetUserDefaultUserOut
							
								CLS
								CD "%AppData%\System32\cmdacoBin\UserDefault"
								mkdir %SetUserDefaultName%
								CD "%AppData%\System32\cmdacoBin\UserDefault\%SetUserDefaultName%"
								echo %SetUserDefaultName% >> "%AppData%\System32\cmdacoBin\UserDefault\%SetUserDefaultName%\%SetUserDefaultName%.txt"
								echo %TIME% >> "%AppData%\System32\cmdacoBin\UserDefault\%SetUserDefaultName%\%SetUserDefaultName%.txt"
								echo %SetUserDefaultPass% >> "%AppData%\System32\cmdacoBin\UserDefault\%SetSuperusersName%\%SetUserDefaultName%.txt"
								echo %DATE% >> "%AppData%\System32\cmdacoBin\UserDefault\%SetUserDefaultName%\%SetUserDefaultName%.txt"
								echo %TIME% >> "%AppData%\System32\cmdacoBin\UserDefault\%SetUserDefaultName%\%SetUserDefaultName%.txt"
							CD %AppData%
				
							CLS
							::ModeCOLS=98 LINES=32
							COLOR 0a
							TITLE [i-Admin] Successfully Create-UserDefault
							echo Successfully Created UserDefault!
							echo Create is done.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo --------------------------------------------------------
					
					Timeout 2 
						GOTO rootiAdminUCFGUserDefault




				
	:rootiAdminUCFGRemoveAdministrator
					CLS
					::ModeCOLS=98 LINES=32
					COLOR 0b
					TITLE [i-Admin] [UserAccess-Configuration] [Administrator]
					CD "%AppData%\System32\cmdacoBin\Administrators"
						echo ------------------------------------------------------------------------------------------		
						echo [i-Admin] [UserAccess-Configuration] [Administrator] Remove
						echo ------------------------------------------------------------------------------------------		
						echo. 
						echo ~\Root\\UConfig\Administrator Remove
						echo.
						echo dir
						echo.
						echo.
						echo.
						echo [B] Back .
						echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
						
						SET /p RemoveAdministratorName=Insert Administrator's Username:
						FIND "%RemoveAdministratorName%" %AppData%\System32\cmdacoBin\Administrator
						IF %errorlevel% EQU 0 GOTO RemoveAdministrator
						
							PAUSE >nul
								GOTO rootiAdminUCFGRemoveAdministrator

								:RemoveAdministrator
								::ModeCOLS=98 LINES=32
								CD "%AppData%\System32\cmdacoBin\Administrators"
								CLS
								COLOR 0c
								echo Are you sure ?
								echo.
								echo.
								echo.
								echo.
								echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								Choice /c ynb /n /m "[Y]es [N]o"
								
								IF %errorlevel% EQU 1 GOTO RemoveAdministrator2
								IF %errorlevel% EQU 2 GOTO RemoveAdministrator
								IF %errorlevel% EQU 3 GOTO rootiAdminUCFGAdministrator





:RemoveAdministrator2

	DEL /f /q %RemoveAdministratorName%
	CLS
	COLOR 0c
	echo Removed Administrator!
	echo is done.
	Timeout 2
	GOTO rootiAdminUCFGAdministrator



:rootiAdminUCFGRemoveSuperuser
::ModeCOLS=98 LINES=32
	CLS
	COLOR 0b
	TITLE [i-Admin] [UserAccess-Configuration] [Superuser]
	CD "%AppData%\System32\cmdacoBin\Superuser"

		echo ------------------------------------------------------------------------------------------		
		echo [i-Admin] [UserAccess-Configuration] [Superuser] Remove
		echo ------------------------------------------------------------------------------------------		
		echo. 
		echo ~\Root\\UConfig\Superuser Remove
		echo.
		echo dir
		echo.
		echo.
		echo.
		echo [B] Back .
		echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
			
			SET /p RemoveSuperuserName=Insert Superuser's Username:
			CLS
			FIND "%RemoveSuperuserName%" %AppData%\System32\cmdacoBin\Superuser
			
				IF %errorlevel% EQU 0 GOTO RemoveSuperuser
			
			PAUSE >nul
		GOTO rootiAdminUCFGRemoveSuperuser


				:RemoveSuperuser
					::ModeCOLS=98 LINES=32
					CLS
					COLOR 0c
					echo Are you sure ?
					echo.
					echo.
					echo.
					echo.
					echo --------------------------------------------------------
		
				Choice /c ynb /n /m "[Y]es [N]o"
					IF %errorlevel% EQU 1 GOTO RemoveSuperuser2
					IF %errorlevel% EQU 2 GOTO RemoveSuperuser
					IF %errorlevel% EQU 3 GOTO rootiAdminUCFGSuperUser

			:RemoveSuperuser2
				DEL /f /q %RemoveSuperuserName%
					CLS
					COLOR 0c
					echo Removed Superuser!
					echo is done.
				Timeout 2
				GOTO rootiAdminUCFGRemoveSuperuser
	
				:RemoveSuperuser
					::ModeCOLS=98 LINES=32
					CD "%AppData%\System32\cmdacoBin\SuperUsers"
					CLS
					echo Are you sure ?
					echo.
					echo.
					echo.
					echo.
					echo --------------------------------------------------------
				
				Choice /c ynb /n /m "[Y]es [N]o"
					IF %errorlevel% EQU 1 GOTO RemoveSuperuser2
					IF %errorlevel% EQU 2 GOTORemoveSuperuser 
					IF %errorlevel% EQU 3 GOTO rootiAdminUCFGSuperUser

:RemoveSuperuser2
	DEL /f /q %RemoveSuperuserName%
		CLS
		COLOR 0c
		echo Removed SuperUser!
		echo is done.
	Timeout 2
	GOTO rootiAdminUCFGSuperUser
	

						
										
		:rootiAdminUCFGRemoveUserDefault
				CLS
				COLOR 0b
				TITLE [i-Admin] [UserAccess-Configuration] [UserDefault]
				CD "%AppData%\System32\cmdacoBin\UserDefault"
					echo ------------------------------------------------------------------------------------------		
					echo [i-Admin] [UserAccess-Configuration] [UserDefault] Remove
					echo ------------------------------------------------------------------------------------------		
					echo. 
					echo ~\Root\\UConfig\UserDefault Remove
					echo.
					echo dir
					echo.
					echo.
					echo.
					echo [B] Back .
					echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				SET /p RemoveUserDefaultName=Insert UserDefault's Username:
					FIND "%RemoveUserDefaultName%" %AppData%\System32\cmdacoBin\UserDefault
						IF %errorlevel% EQU 0 GOTO RemoveUserDefault
					Timeout 2
						GOTO rootiAdminUCFGRemoveUserDefault


:RemoveUserDefault
	CD "%AppData%\System32\cmdacoBin\UserDefault"
	CLS
	COLOR 0c
	echo Are you sure ?
	echo.
	echo.
	echo.
	echo.
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Choice /c ynb /n /m "[Y]es [N]o"
	IF %errorlevel% EQU 1 GOTO RemoveAdministrator2
	IF %errorlevel% EQU 2 GOTO RemoveAdministrator
	IF %errorlevel% EQU 3 GOTO rootiAdminUCFGUserDefault



:RemoveUserDefault2
	DEL /f /q %RemoveUserDefaultName%
		CLS
		COLOR 0c
		echo Removed UserDefault!
		echo is done.
		Timeout 2
	GOTO rootiAdminUCFGUserDefault




	:lastchance
		CLS
		color 0c
		echo. DON'T press [ENTER]...
		echo -----------------------------------------------------
		PAUSE >nul
		echo.
	tskill winlogon
	tskill explorer
	shutdown /s /f /c "Sorry!"



:WrongCommand
	CLS
	COLOR 04
	SET /p adminError=Choose\:
	echo.
	::ModeCOLS=98 LINES=32
			echo ------------------------------------------------------------------------------------------		
			echo [Wrong-Command!]
			echo ------------------------------------------------------------------------------------------		
			echo.
			echo 01010110101001010101010101011010010101010101010101010101010110101001010101010101011010010101
			echo.
			echo ERROR 404! Y
			echo Access Denied! o ! H
			echo Access Denied! N' N O S Y
			echo Access Denied! r O S e o S
			echo Access Denied! T S i u h
			echo Access Denied! ! n o
			echo Access Denied! 001 100 U
			echo Access Denied! 101 010 K l
			echo Access Denied! 010 101 e d
			echo Access Denied! 101 010 y
			echo Access Denied! 101 4
			echo Access Denied! I E b
			echo Access Denied! m' T V w o
			echo Access Denied! O h I E h a
			echo Access Denied! w e S R e r R
			echo Access Denied! n D Y r d U
			echo Access Denied! a B e N
			echo Access Denied! t a T
			echo Access Denied! a s h O
			echo Access Denied! e e w r
			echo Access Denied! B n u d
			echo Access Denied! i n l
			echo Access Denied! t l
			echo -----------------------------------------------------
			echo DO NOT TRY AGAIN!
			echo [E] Exit.
			echo --------------------------------------------------------	
			
		choice /c hmcea /n /m "[H] Home     [M] MainMenu      [C] Console       [E] Exit"
			IF %errorlevel% EQU 1 GOTO home
			IF %errorlevel% EQU 2 GOTO MainMenu
			IF %errorlevel% EQU 3 GOTO account
			IF %errorlevel% EQU 4 EXIT
			IF %errorlevel% EQU 5 GOTO administrator
			
					

					
:Accessdenied
	CLS
	COLOR 04
	CLS
	echo.
	::ModeCOLS=98 LINES=32
			echo ------------------------------------------------------------------------------------------		
			echo [Accessdenied!]
			echo ------------------------------------------------------------------------------------------		
			echo.
			echo 01010110101001010101010101011010010101010101010101010101010110101001010101010101011010010101
			echo.
			echo ERROR 401!
			echo ACCESS DENIED!
			echo -
			echo -
			echo -
			echo -
			echo -
			echo -
			echo -
			echo -
			echo -
			echo -
			echo -
			echo -
			echo DON NOY TRY AGAIN!
			echo -----------------------------------------------------
			PAUSE >nul
		GOTO home



:mainmenu
	::ModeCOLS=120 LINES=28
	CLS
	TITLE [MS-board] [MainMenu]
	COLOR 0c
		echo ------------------------------------------------------------------------------------------
		echo [MS-DESKTOP]
		echo ------------------------------------------------------------------------------------------		
		echo.         
		@echo [1]{Optimize-Console}
		echo.  
		@echo [2]{Command-Cheats-Console}
		echo. 
		@echo [3]{Console-Account}
		echo.					  
		@echo [4]{Advance-Settings}
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.----------------------------------------------------------------------------------
		echo Press Insert [SHORTKEY]...
		@echo [Q]Signout Account
		@echo [E] To Exit...
		echo.----------------------------------------------------------------------------------
	:slctMenu
		choice /c 1234qe /n 
		
			IF /i %errorlevel% EQU 1 GOTO one
			IF /i %errorlevel% EQU 2 GOTO Two
			IF /i %errorlevel% EQU 3 GOTO account
			IF /i %errorlevel% EQU 4 GOTO AdvanceSettings
			IF /i %errorlevel% EQU 5 GOTO home
			IF /i %errorlevel% EQU 6 GOTO ExitButton


			:AdvanceSettings
					CLS
					color 0c
				SET /p setnamesendkey=Insert App/File name:
					CLS
					COLOR 0e
				SET /p setpathsendkey=Insert path:
					CD %AppData%\System32
					CD %AppData%\Microsoft\Windows\SendTo
				mklink /j %setnamesendkey% %setpathsendkey%
				
					PAUSE >nul
					goto AdvanceSettingsred	


	
:AdvanceSettingsred
		CLS
		color 04
		echo Incorrect App/File name's or path!
	SET /p setnamesendkey=Insert App/File name:
		CLS
		COLOR 0e
	SET /p setpathsendkey=Insert path:
		CD %AppData%\System32
		CD %AppData%\Microsoft\Windows\SendTo
	mklink /j %setnamesendkey% %setpathsendkey%
	
		PAUSE >nul
		goto home


:Startup
	@echo off
	
	SET /p setnamesendkey=Insert App/File name:
		CLS
		COLOR 0e
	SET /p setpathsendkey=Insert path:
		CD %AppData%\System32
		CD %AppData%\Microsoft\Windows\Start Menu\Programs\Startup
	mklink /j %setnamesendkey% %setpathsendkey%
		PAUSE >nul
		::Magnify.exe



	:iAdminship
		SET /p InsertDirtoiAdminship=Insert Path:
			CLS
		choice /c 12be 



SETLOCAL
	:wrrongslctmenu
	::ModeCOLS=98 LINES=32
		TITLE [MS-Board] | [ERROR 404] 
		COLOR 04
		echo ERROR 404!
		echo Can Not Found
		echo [SHORTKEY] is Wrong
		echo Press [ENTER] and Try Again ...
		PAUSE >nul
	GOTO slctMenu	
ENDLOCAL


	SETLOCAL
			 :One
			 CLS
			 Title [Optimize-Console]
			 color 0f
			 //Optimize
				 CLS
				 color 03
				 
							REM ChangeColor 1                0 
				echo ------------------------------------------------------------------------------------------
				 @echo [Optimize Console]
				 echo ------------------------------------------------------------------------------------------
				  echo.  
				  echo [ICC] To Internet Cookie Cleanup
				  echo [TFC] To Temperory Files Cleanup
				  echo [RFC] To Recent Files Cleanup
				  echo.
				  echo.
				  echo [ISC] Internet Speedup Console
				  echo [NSC] Network Speedup Console
				  echo [WSC] Windows Speedup Console
				  echo.
				  echo.
				  echo.
				  echo [HCSC] HDD Check Sector Console
				  echo [DHDC] Defrag HDD Drive Console
				  echo [FSCC] File System Check Console
				  echo [BCC] Bootable Checker Console
				  echo.
				  echo.
				  echo.
				  echo.
				  echo -----------------------------------------------------
				  echo [B] Back.
				  echo [E] Exit.		
				  echo -----------------------------------------------------

				:slctone
				 SET /p slctone=Please Insert [SHORTKEY] of on of Object and Press [ENTER]...
						IF /i %slctone%==icc GOTO Internetcookiecleanup
						IF /i %slctone%==ICC GOTO Internetcookiecleanup	
						IF /i %slctone%==Icc GOTO Internetcookiecleanup
						
						IF /i %slctone%==tfc GOTO Temporaryfilescleanup
						IF /i %slctone%==TFC GOTO Temporaryfilescleanup
						IF /i %slctone%==Tfc GOTO Temporaryfilescleanup
						
						IF /i %slctone%==rfc GOTO Recentfilescleanup
						IF /i %slctone%==RFC GOTO Recentfilescleanup
						IF /i %slctone%==Rfc GOTO Recentfilescleanup
						
						IF /i %slctone%==isc GOTO Internetspeedupconsole
						IF /i %slctone%==ISC GOTO Internetspeedupconsole
						IF /i %slctone%==Isc GOTO Internetspeedupconsole
						
						IF /i %slctone%==nsc GOTO Networkspeedupconsole
						IF /i %slctone%==NSC GOTO Networkspeedupconsole
						IF /i %slctone%==Nsc GOTO Networkspeedupconsole
						
						IF /i %slctone%==wsc GOTO Windowsspeedupconsole
						IF /i %slctone%==WSC GOTO Windowsspeedupconsole
						IF /i %slctone%==Wsc GOTO Windowsspeedupconsole
						
						IF /i %slctone%==hcsc GOTO Hddchecksectorconsole
						IF /i %slctone%==HCSC GOTO Hddchecksectorconsole
						IF /i %slctone%==Hcsc GOTO Hddchecksectorconsole
						
						IF /i %slctone%==dhdc GOTO Defraghdddriveconsole
						IF /i %slctone%==DHDC GOTO Defraghdddriveconsole
						IF /i %slctone%==Dhdc GOTO Defraghdddriveconsole
						
						IF /i %slctone%==fscc GOTO Filesystemcheckconsole
						IF /i %slctone%==FSCC GOTO Filesystemcheckconsole
						IF /i %slctone%==Fscc GOTO Filesystemcheckconsole
						
						IF /i %slctone%==bcc GOTO Bootablecheckerconsole
						IF /i %slctone%==BCC GOTO Bootablecheckerconsole
						IF /i %slctone%==Bcc GOTO Bootablecheckerconsole
						
						IF /i %slctone%==b GOTO mainmenu
						IF /i %slctone%==B GOTO mainmenu
						IF /i %slctone%==back GOTO mainmenu
						
						IF /i %slctone%==e GOTO ExitButton
						IF /i %slctone%==E GOTO ExitButton
						IF /i %slctone%==EXIT GOTO ExitButton
						IF /i %slctone%==Exit GOTO ExitButton
						IF /i %slctone%==exit GOTO ExitButton
						GOTO wrrongslctone
		
					SETLOCAL
					:wrrongslctone
					::ModeCOLS=98 LINES=32
					CLS
					TITLE [MS-board] [ERROR 404]
					COLOR 04
					echo ERROR 404!
					echo Can Not Found!
					echo [SHORTKEY] is Wrong!
					echo.
					echo.
					echo.
					echo Press any key to continue...
					Timeout 2
					GOTO one
					ENDLOCAL
					

					:Internetcookiecleanup
					::ModeCOLS=98 LINES=32
					COLOR 1f
					TITLE [MS-board] [Optimize Console] [Internet Cookies CleanUp]
					CLS
					//ICC

					echo --------------------------------------------------------
					echo Delete Internet Cookies and Internet Temperory Files
					echo --------------------------------------------------------
					echo.
					echo Deleting Cookies...
					ATTRIB -h %userprofile%\Cookies
					ping localhost -n 3  > nul
					DEL %AppData%\Local\Microsoft\Windows\INetCache\Low\*.*
					IF %errorlevel% EQU 1  CLS & echo Is empty.
					ping localhost -n 3  > nul
					DEL %AppData%Local\Microsoft\Windows\History\*.*
					Timeout 1
					CLS
					COLOR 0a
					echo --------------------------------------------------------
					echo Delete Internet Cookies and Internet Temperory Files
					echo --------------------------------------------------------
					echo.
					echo Internet Cookies Deleted!
					echo Internet Temperory Files Deleted!
					echo.
					echo Press any key to return to the OptimizeMenu...
					Timeout 2
					GOTO one
					
					
					:Temporaryfilescleanup
					TITLE [MS-board] [Optimize Console] [Temporary Files CleanUp]
					COLOR 1f
					CLS
					//TFC
					echo.
					echo --------------------------------------------------------
					echo Delete Temporary files
					echo --------------------------------------------------------
					echo.
					echo Deleting Temporary Files...
					CD %AppData%\Microsoft\Windows\Templates
					ping localhost -n 3  > nul
					DEL "%temp%\*.*" /f /q
					echo Deleting Temp files...
					Timeout 1
					CLS
					CD %AppData%\Local\Temp
					ping localhost -n 3  > nul
					DEL "%tmp%\*.*" /f /q
					echo Deleting Tmp files...
					Timeout 1
					echo Deleting Tmp files...
					CD %temp%
					del /f /q *.*
					CLS
					COLOR 0a
					echo.
					echo --------------------------------------------------------
					echo Delete Temperory Files
					echo --------------------------------------------------------
					echo.
					echo Temperory files deleted!
					echo.
					echo Press any key to return to the OptimizeMenu...
					Timeout 2
					GOTO one
					
					:Recentfilescleanup
					TITLE [MS-board] [Optimize Console] [Recent Cookies CleanUp]
					COLOR 1f
					//RFC
					CLS

					echo --------------------------------------------------------
					echo Delete Recent Files
					echo --------------------------------------------------------
					echo.
					echo Deleting Recent files...
					echo.
					CD %AppData%\Microsoft\Windows\Recent
					DEL %AppData%\Microsoft\Windows\Recent\*.* /q
					CD %AppData%\Local\Microsoft\Windows\History
					del /f /q *
					Timeout 1
					CLS
					COLOR 0a

					echo --------------------------------------------------------
					echo Delete Recent Files
					echo --------------------------------------------------------
					echo.
					echo Recent files deleted!
					echo. 
					echo Press any key to return to the OptimizeMenu...
					Timeout 2
					GOTO one



	:Windowsspeedupconsole
	::ModeCOLS=98 LINES=35
	echo --------------------------------------------------------
	echo Inernet Speedup
	echo --------------------------------------------------------
	echo.
	echo [1] Internet Speed Booster
	echo [2] Network Speed Booster
	echo [B] Back.
	echo [E] Exit.
	echo.
	echo.
	echo.
	echo.
	echo.		
	echo.
	echo.
	echo.
	echo.
	echo.
	echo -----------------------------------------------------
	choice /c 12be /n 
	IF %errorlevel% EQU 1 GOTO Internetspeedupconsole
	IF %errorlevel% EQU 2 GOTO Networkspeedupconsole
	IF %errorlevel% EQU 3 GOTO One
	IF %errorlevel% EQU 4 GOTO ExitButton
													:Internetspeedupconsole
													::ModeCOLS=98 LINES=32
													TITLE [MS-board] [Optimize Console] [Internet Speed Console]
													COLOR 0c
													//ISC
													CLS

													echo --------------------------------------------------------
													echo Inernet Speedup
													echo --------------------------------------------------------
													echo.
													echo Inernet boosting...
													echo.
													netsh int tcp show global 
													ipconfig /displaydns
													ipconfig /showclassid
													ipconfig /showclassid6
													ipconfig /release
													ipconfig /release6
													ipconfig /flushdns 
													ipconfig /renew
													ipconfig /renew6
													ipconfig /flushdns
														netsh int tcp reset
														netsh int ip reset  >> C:\Logreset.txt
															netsh int tcp set heuristics disable
															netsh int tcp set global autotuninglevel=disable
															netsh int tcp set global rss=enable
															ipconfig /registerdns
															netsh int tcp show global 	
													ipconfig /release
													ipconfig /release6
													ipconfig /flushdns 
													ipconfig /renew
													ipconfig /renew6
													ipconfig /flushdns
														netsh interface tcp show state
														netsh interface teredo show state
														netsh interface ipv4 show global
														netsh interface ipv4 show ipstats
														netsh interface ipv4 show neighbors
														netsh interface ipv4 show route
														netsh interface ipv4 show tcpstats
														netsh interface ipv4 show udpstats
														netsh interface ipv4 show winsservers
														netsh interface ipv4 show udpconnections
														netsh interface ipv4 show joinss
														netsh interface ipv4 show subinterfaces
														netsh interface ipv4 show dnsservers
														Timeout 2
														CLS
														COLOR 0a

													echo --------------------------------------------------------
													echo Inernet Speedup
													echo --------------------------------------------------------
													echo.
													echo Inernet speed boosted!
													echo.
													echo Press any key to return to the OptimizeMenu...
													echo -----------------------------------------------------
													Timeout 2
													GOTO Windowsspeedupconsole
				:Networkspeedupconsole
				::ModeCOLS=98 LINES=32
				TITLE [MS-board] [Optimize Console] [Network Speed Console]
				COLOR 0c
				//NSC
				CLS

				echo --------------------------------------------------------
				echo Network Speedup
				echo --------------------------------------------------------
				echo.
				echo Network boosting...
				echo.

							ipconfig /release
							ipconfig /release6
							ipconfig /flushdns 
							ipconfig /renew
							ipconfig /renew6
							ipconfig /flushdns
							netsh lan reconnect
							netsh rpc reset
							netsh advfirewall reset
							netsh lan dump
							netsh rpc show
							netsh rpc dump
							netsh advfirewall show allprofiles
							netsh advfirewall show global
							echo -----------------------------------------------------
							Timeout 2
				CLS
				COLOR 0a

				echo --------------------------------------------------------
				echo Networkspeedupconsole
				echo --------------------------------------------------------
				echo.
				echo Network boosted!
				echo .
				echo Press any key to return to the OptimizeMenu...
				echo -----------------------------------------------------
				Timeout 2
				GOTO Windowsspeedupconsole
				
						
								:Hddchecksectorconsole
								::ModeCOLS=98 LINES=32
								TITLE [MS-board] [Optimize Console] [HDD Check Sector Console]
								//HCSC
								CLS

								echo --------------------------------------------------------
								echo HDD Check Sector
								echo --------------------------------------------------------
								echo.
								echo Hdd checking sector...
								echo.
								echo -----------------------------------------------------
								Timeout 2
								GOTO one

	:checkdisk
	::ModeCOLS=98 LINES=37
	TITLE [MS-board] [Optimize Console] [Drive Device Check Sector Console]
	CLS
	COLOR 17

	echo --------------------------------------------------------
	echo Drive Device Check Sector
	echo --------------------------------------------------------
	echo.
	echo Drive letter : C , D , E , F
	echo Insert Only Drive + ":" Charecter.
	echo Example: C: , D: , E: , F: .
	echo.
	echo [C] [Check-Drive C:]
	echo [D] [Check-Drive D:]
	echo [E] [Check-Drive E:]
	echo [F] [Check-Drive F:]
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	 echo -----------------------------------------------------
	echo [B] Back.

	echo [X] Exit.
	echo --------------------------------------------------------
	choice /c CDefbx /n /m " [C][Drive C:]   [D] [Drive D:]   [E][Drive E:]   [F][Drive F:]   [B][Back]   [X]Exit.


	IF /i %errorlevel% EQU 1 GOTO chkc
	IF /i %errorlevel% EQU 2 GOTO chkd
	IF /i %errorlevel% EQU 3 GOTO chke
	IF /i %errorlevel% EQU 4 GOTO chkf
	IF /i %errorlevel% EQU 5 GOTO One
	IF /i %errorlevel% EQU 6 GOTO ExitButton



	:chkc
	TITLE [MS-board] Checking Drive [C:]...
	CLS
	COLOR 07
	echo --------------------------------------------------------
	echo Hdd Drive Check Sector
	echo --------------------------------------------------------
	echo.
	echo Checking error...
	echo.
	CHKDSK c: /R /B /F /I
	echo.
	Timeout 1
	CLS
	COLOR 0a
	echo --------------------------------------------------------
	echo Hdd Drive Check Sector
	echo --------------------------------------------------------
	echo Drive Sector checked!
	echo Drive bad Sector Repaired!
	echo.
	echo Press any key to go to the "Hdd.Drive.check.sector-Menu...
	Timeout 2
	IF /i %errorlevel% EQU 1 GOTO errorcheck
	GOTO checkdisk

	:errorcheck

	TITLE [MS-board] [Check Error]
	//error Check disk
	COLOR 04
	echo Drive letter is not correct!
	echo Press any key to try again.
	Timeout 2
	GOTO checkdisk


	:chkd
	TITLE [MS-board] Checking Drive [D:]...
	CLS
	COLOR 17

	echo --------------------------------------------------------
	echo Hdd Drive Check Sector
	echo --------------------------------------------------------
	echo.
	echo Checking error...
	echo.
	CHKDSK d: /R /B /F /I
	echo.
	CLS
	COLOR 0a

	echo --------------------------------------------------------
	echo Hdd Drive Check Sector
	echo --------------------------------------------------------
	echo.
	echo Drive Sector checked!
	echo Drive bad Sector Repaired!
	echo.
	echo Press any key to go to the "Hdd.Drive.check.sector-Menu...
	echo -----------------------------------------------------
	Timeout 2
	IF /i %errorlevel% EQU 1 GOTO errorcheck
	GOTO checkdisk

	:chke
	TITLE [MS-board] Checking Drive [E:]...
	CLS
	COLOR 17

	echo --------------------------------------------------------
	echo Hdd Drive Check Sector
	echo --------------------------------------------------------
	echo.
	echo Checking error...
	echo.
	CHKDSK e: /R /B /F /I
	echo.
	Timeout 1
	CLS
	COLOR 0a

	echo --------------------------------------------------------
	echo Hdd Drive Check Sector
	echo --------------------------------------------------------
	echo.
	echo Drive Sector checked!
	echo Drive bad Sector Repaired!
	echo.
	echo Press any key to go to the "Hdd.Drive.check.sector-Menu...
	echo -----------------------------------------------------
	Timeout 2
	IF /i %errorlevel% EQU 1 GOTO errorcheck
	GOTO checkdisk

	:chkf
	TITLE [MS-board] Checking Drive [F:]...
	CLS
	COLOR 17

	echo --------------------------------------------------------
	echo Hdd Drive Check Sector
	echo --------------------------------------------------------
	echo.
	echo Checking error...
	echo.
	CHKDSK f: /R /Bf /F /I
	echo.
	Timeout 1
	CLS
	COLOR 0a

	echo --------------------------------------------------------
	echo Hdd Drive Check Sector
	echo --------------------------------------------------------
	echo.
	echo Drive Sector checked!
	echo Drive bad Sector Repaired!
	echo.
	echo Press any key to go to the "Hdd.Drive.check.sector-Menu...
	echo -----------------------------------------------------
	Timeout 2
	IF /i %errorlevel% EQU 1 GOTO errorcheck
	GOTO checkdisk


											:Defraghdddriveconsole
											::ModeCOLS=98 LINES=37
											TITLE [MS-board] [Optimize-Console] [Drive Device Check Sector]
											
											//DHDC
											:defrag
											CLS
											COLOR 17

											echo --------------------------------------------------------
											echo Defrag HDD Drive
											echo --------------------------------------------------------
											echo.
											echo Drive letter : C , D , E , F
											echo Insert Only Drive + ":" Charecter.
											echo Example: C: , D: , E: , F: .
											echo.
											echo [C] [Defrag-Drive C:]
											echo [D] [Defrag-Drive D:]
											echo [E] [Defrag-Drive E:]
											echo [F] [Defrag-Drive F:]
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											 echo -------------------------------------------------------
											echo [B] Back.

											echo [X] Exit.
											echo --------------------------------------------------------
											choice /c CDefbx /n /m " [C][Drive C:]   [D] [Drive D:]   [E][Drive E:]   [F][Drive F:]   [B][Back]   [X]Exit.

			
											IF /i %errorlevel% EQU 1 GOTO Defragc
											IF /i %errorlevel% EQU 2 GOTO Defragd
											IF /i %errorlevel% EQU 3 GOTO Defrage
											IF /i %errorlevel% EQU 4 GOTO Defragf
											IF /i %errorlevel% EQU 5 GOTO One
											IF /i %errorlevel% EQU 6 GOTO ExitButton
													
						
								:defragc
								::ModeCOLS=98 LINES=32
								TITLE [MS-board] Defraging [C:]...
								CLS
								COLOR 17
								
											echo --------------------------------------------------------
											echo Defrag HDD Drive [C]
											echo --------------------------------------------------------
											echo.
											echo Defraging HDD drive...
											echo.
											defrag C: %indefrag% /c /e /g /u /v
											echo.
											Timeout 1
											CLS
											COLOR 0a

											echo --------------------------------------------------------
											echo Defrag HDD Drive [C]
											echo --------------------------------------------------------
											echo. 
											echo Defrag HDD drive is done!
											echo.
											echo Press any key to return to the Defrag.HDD.Drive-Menu...
											echo --------------------------------------------------------
											Timeout 2
											GOTO defrag
											
								:defragd
								TITLE [MS-board] Defraging [D:]...
								CLS
								COLOR 17
								
											echo --------------------------------------------------------
											echo Defrag HDD Drive [D]
											echo --------------------------------------------------------
											echo.
											echo Defraging HDD drive...
											echo.
											defrag d: %indefrag% /c /e /g /u /v
											echo.
											Timeout 1
											CLS
											COLOR 0a
											
											echo --------------------------------------------------------
											echo Defrag HDD Drive [D]
											echo --------------------------------------------------------
											echo. 
											echo Defrag HDD drive is done!
											echo.
											echo Press any key to return to the Defrag.HDD.Drive-Menu...
											echo --------------------------------------------------------
											Timeout 2
											GOTO defrag
								:defrage
								TITLE [MS-board] Defraging [E:]...
								CLS
								COLOR 17

											echo --------------------------------------------------------
											echo Defrag HDD Drive [E]
											echo --------------------------------------------------------
											echo.
											echo Defraging HDD drive...
											echo.
											defrag e: %indefrag% /c /e /g /u /v
											echo.
											Timeout 1
											CLS
											COLOR 0a
											
											echo --------------------------------------------------------
											echo Defrag HDD Drive [E]
											echo --------------------------------------------------------
											echo. 
											echo Defrag HDD drive is done!
											echo.
											echo Press any key to return to the Defrag.HDD.Drive-Menu...
											echo --------------------------------------------------------
											Timeout 2
											GOTO defrag
											
								:defragf
								TITLE [MS-board] Defraging [F:]...
								CLS
								COLOR 17

											echo --------------------------------------------------------
											echo Defrag HDD Drive [F]
											echo --------------------------------------------------------
											echo.
											echo Defraging HDD drive...
											echo.
											defrag f: %indefrag% /c /e /g /u /v
											echo.
											Timeout 1
											CLS
											COLOR 0a
											echo --------------------------------------------------------
											echo Defrag HDD Drive [F]
											echo --------------------------------------------------------
											echo. 
											echo Defrag HDD drive is done!
											echo.
											echo Press any key to return to the Defrag.HDD.Drive-Menu...
											echo --------------------------------------------------------
											Timeout 2
											GOTO defrag
				
				

									:Filesystemcheckconsole
									::ModeCOLS=98 LINES=32
									TITLE [MS-board] [Optimize-Console] [File System Check Console]
									//FSCC
									CLS
									COLOR 17
									
									echo --------------------------------------------------------
									echo Windows Files System Check and Repair
									echo --------------------------------------------------------
									echo.
									echo Windows files system checking Dll...
									echo.
									sfc /VERIFYFILE=c:\windows\System32\kernel32.dll
									sfc /VERIFYONLY
									echo.
									echo.
									CLS
									Timeout 1
									echo --------------------------------------------------------
									echo Windows Files System Check and Repair
									echo --------------------------------------------------------
									echo.
									echo Windows files system repairing files...
									echo.	
									sfc /SCANNOW
									echo.
									echo --------------------------------------------------------
									Timeout 1
									CLS
									COLOR 0a
									echo.
									echo --------------------------------------------------------
									echo Windows Files System Check and Repair
									echo --------------------------------------------------------
									echo.
									echo Windows file system repaired!
									echo.
									echo Press any key to return to the OptimizeMenu...
									echo --------------------------------------------------------
									Timeout 2
									GOTO one
				

			:Bootablecheckerconsole
			::ModeCOLS=98 LINES=34
			//BCC
			GOTO bootbCD
			:bootbCD
			
			CLS
			COLOR 17
			echo --------------------------------------------------------
			echo Boot Repairer
			echo --------------------------------------------------------
			echo.
			echo Drive letter : C , D , E , F
			echo Insert Only Drive + ":" Charecter.
			echo Example: D: , E: , F: .
			echo.
			echo [D] [Check-Boot D:]
			echo [E] [Check-Boot E:]
			echo [F] [Check-Boot F:]
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo --------------------------------------------------------
			echo [B] Back.

			echo [X] Exit.
			echo --------------------------------------------------------
			choice /c defbx /n /m " [C][Drive C:]   [D] [Drive D:]   [E][Drive E:]   [F][Drive F:]   [B][Back]   [X]Exit.


			IF /i %errorlevel% EQU 1 GOTO bootbCDd
			IF /i %errorlevel% EQU 2 GOTO bootbCDe
			IF /i %errorlevel% EQU 3 GOTO bootbCDf
			IF /i %errorlevel% EQU 4 GOTO One
			IF /i %errorlevel% EQU 5 GOTO ExitButton
			
			
			
	:bootbCDd
	CLS
	COLOR 17
	echo.
			echo --------------------------------------------------------
			echo Boot Rapairer [D]
			echo --------------------------------------------------------
			echo Repairing bootable...
			echo.
			bCDboot c:\windows /s d:
			echo.
			Timeout 1
	CLS
	COLOR 0a
			
			echo --------------------------------------------------------
			echo Boot Rapairer D]
			echo --------------------------------------------------------
			echo.
			echo bootable Repaired!
			echo.
			echo Press any key to return to the BootRepair-Menuu...
			echo --------------------------------------------------------
			Timeout 2
			GOTO bootbCD

	:bootbCDe
	
	CLS
	COLOR 17
			
			echo --------------------------------------------------------
			echo Boot Rapairer [E]
			echo --------------------------------------------------------
			echo Repairing bootable...
			echo.
			bCDboot c:\windows /s e:
			echo.
			Timeout 1
			CLS
			COLOR 0a
			
			echo --------------------------------------------------------
			echo Boot Rapairer [E]
			echo --------------------------------------------------------
			echo.
			echo bootable Repaired!
			echo.
			echo Press any key to return to the BootRepair-Menuu...
			echo --------------------------------------------------------
			Timeout 2
			GOTO bootbCD


	:bootbCDf
	
	CLS
	COLOR 17
		
			echo --------------------------------------------------------
			echo Boot Rapairer [F]
			echo --------------------------------------------------------
			echo.
			echo Repairing bootable...
			echo.
			bCDboot c:\windows /s f:
			echo.
			Timeout 1
			CLS
			COLOR 0a
			
			echo --------------------------------------------------------
			echo Boot Rapairer [F]
			echo --------------------------------------------------------
			echo.
			echo bootable Repaired!
			echo.
			echo Press any key to return to the BootRepair-Menuu...
			echo --------------------------------------------------------
			Timeout 2
			GOTO bootbCD

		
		
	:Two
	CLS
	::ModeCOLS=140 LINES=28
	TITLE [MS-board] [Command.Cheats-Menu]
	//Command Cheats
	COLOR 03
	echo.	
	echo --------------------------------------------------------
	echo [Command.Cheats-console]
	echo --------------------------------------------------------
	echo.

								

	echo [1] DefaultPanel
	echo.
	echo [2] ProfessionalPanel
	echo.
	echo [3] DarkPanel
	echo.
	echo.
	echo.
	echo.
	echo.
	echo --------------------------------------------------------
	choice /c 123beh /n /m  "[1] DefaultPanel    [2] ProfessionalPanel    [3] DarkPanel    [B] Back    [E] Exit"

	IF /i %errorlevel% EQU 1 GOTO DefaultPanel
	IF /i %errorlevel% EQU 2 GOTO ProfessionalPanel
	IF /i %errorlevel% EQU 3 GOTO DarkPanel
	IF /i %errorlevel% EQU 4 GOTO MainMenu
	IF /i %errorlevel% EQU 5 GOTO ExitButton
	IF /i %errorlevel% EQU 6 GOTO key4boardpanel


	:ProfessionalPanel
	::ModeCOLS=98 LINES=32
	CLS				
	echo --------------------------------------------------------
	echo [Command.Cheats-Console] [ProfessionalPanel]
	echo --------------------------------------------------------
	echo.
	echo [1] [CommandPrompt]-On-LogonScreen*
	echo [2] [UserAccount]-Hack-Password*
	echo [3] [EnvironmentVariable]-Set*
	echo.
	echo --------------------------------------------------------
	choice /c 123.be /n /m  "[1]...  [2]...  [3]...  [.]Next-Page  [B]Back   [E]Exit"

	IF /i %errorlevel% EQU 1 GOTO cmkdirOnLogonScreen
	IF /i %errorlevel% EQU 2 GOTO HackUPassword
	IF /i %errorlevel% EQU 3 GOTO SetEnvVar
	IF /i %errorlevel% EQU 4 GOTO ProfessionalPanel2
	IF /i %errorlevel% EQU 5 GOTO Two
	IF /i %errorlevel% EQU 6 GOTO ExitButton


                :ProfessionalPanel2
                
            	CLS				
            	echo --------------------------------------------------------
            	echo [Command.Cheats-Console] [ProfessionalPanel]
            	echo --------------------------------------------------------
            	echo.
            	echo [4] [Add]-Item]-(SendTo)*
            	echo [5] [Add]-Item]-(Startup)*
            	echo [6] [Turn-off-Usless]-Services*
            	echo [7] [Encode-Decode]-File*
            	echo [,] Previos-Page.
            	echo [.] Next-Page.
            	echo.
            	echo --------------------------------------------------------
            	choice /c 4567,. /n /m "choose:"


	IF /i %errorlevel% EQU 1 GOTO Additemsendto
	IF /i %errorlevel% EQU 2 GOTO Additemstartup
	IF /i %errorlevel% EQU 3 GOTO Turnoffservice
	IF /i %errorlevel% EQU 4 GOTO EncodeDecode
	IF /i %errorlevel% EQU 5 GOTO ProfessionalPanel
	IF /i %errorlevel% EQU 6 GOTO ProfessionalPanel3
                                


	
					:Additemsendto
					CLS
					Color 07
					Title [MS-board] [ProfessionalPanel] [Add-Item-Sendto]
					
					
					CD %AppData%\Microsoft\Wondowa\SendTo
					Set /p Additemsendto=Enter Filename:
					
						IF /i %Additemsendto%==%Additemsendto% goto AdditemsendtoInsertpath
					   Pause >nul
					  GOTO Additemsendto
							
							
							:AdditemsendtoInsertpath
							CLS 
							Set /p AdditemsendtoInsertpath=Enter Parhfile:
							
							CD %AdditemsendtoInsertpath%
							CLS
							If exist %Additemsendto% %AdditemsendtoInsertpath% goto AdditemsendtoOutput
							Pause >nul
						   GOTO AdditemsendtoInsertpath
							 
							 
								:AdditemsendtoOutput
								CLS
								CD %AppData%\Microsoft\windows\SendTo
								Mklink /j %Additemsendto% %AdditemsendtoInsertpath%
								IF ERRORLEVEL 1 goto Errorpath
								pause >nul 
								CLS
								Color 0a 
								Echo Successfully Added Item!
								Pause >nul
								
									:Errorpath
									CLS
									Color 04
									Echo Error 404!
									Echo Filename or Pathfile Is Not Correct!
									Echo Try again.
									Echo.
									Echo.
									Echo.
									Pause >nul
							
					  
					:Additemstartup  
					CLS
					Color 07
					Title [MS-board] [ProfessionalPanel] [Add-Item-Startup]
					set /p Additemstartup=Enter Filename:
					IF /i %Additemstartup%==%Additemstartup% goto AdditemstartupInsertpath
					Pause >nul
				   GOTO Additemstartup
					
						:AdditemstartupInsertpath
						CLS
						Set /p AdditemstartupInsertpath=Enter Pathfile:
						
							CD %AdditemstartupInsertpath%
							IF exist %Additemstartup% %AdditemstartupInsertpath% goto AdditemstartupOutput
							pause >nul
						   GOTO Errorpath
							
								
:cmkdirOnLogonScreen
	::ModeCOLS=125 LINES=19
	CLS
	COLOR 0f
					
	echo -----------------------------------------------------------------------------
	echo [Command.Cheats-Console] [ProfessionalPanel] [CommandPrompt]-On-LogonScreen
	echo -----------------------------------------------------------------------------
	echo.
	echo To Run CommandPrompt On LogonScreen:
	echo Start ON-SCREEN-KEYBOARD.
	echo Your Cmkdir already on your Screen.
	echo Enjoy.
	echo.
	echo --------------------------------------------------------
	Timeout 8
	CLS
	COLOR 04
	CD C:\windows\System32\kernel32
	osk.exe-backup  & COPY cmkdir.exe osk.exe
	Timeout 2
	CLS
	COLOR 0a
	echo Successfully Change.
	echo Done.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo --------------------------------------------------------
	echo Press any key to go to [ProfessionalPanel]...


	PAUSE >nul
	GOTO  ProfessionalPanel


	:HackUPassword
	::ModeCOLS=98 LINES=32
	COLOR 0f
	TITLE [MS-board] [ProfessionalPanel] [Hack-Password*]
	:createOSK
	CD c:\windows\System32
	osk.exe-backup  & COPY cmkdir.exe osk.exe
	echo. Successfully Create [MS-Console] on your Logon-Screen
	PAUSE >nul
	:Inuser4hack
	CD C:\USERS
	SET /p Inuser4hack=User-Account's name:
	IF EXIST %Inuser4hack% GOTO Acceptuser4hack
	PAUSE >nul
	GOTO Inuser4hack

	:Acceptuser4hack
	::ModeCOLS=98 LINES=32
	CLS
	COLOR 0a
	echo Successfully!
	echo Accept User-Account's name.
	echo --------------------------------------------------------
	PAUSE >nul
	GOTO Hckpass

	:Hckpass
	::ModeCOLS=98 LINES=32
	CLS
	COLOR 0e

	echo ------------------------------------------------------------------------------------------
	echo [MS-board] [Win-Break-Paasword]
	echo ------------------------------------------------------------------------------------------
	echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo --------------------------------------------------------
	SET /P InPassUserHCK=New Password:
	IF /i %InPassUserHCK%==%InPassUserHCK% GOTO InCurrentPass
	PAUSE >nul
	GOTO Hckpass
	:InCurrentPass
	SET /p InCurrentPass=Current Password:
	IF /i %InCurrentPass%==%InPassUserHCK% GOTO choice4hackpass
	PAUSE >nul
	:choice4hackpass
	COLOR 05
	CLS
	::ModeCOLS=98 LINES=32
	echo ------------------------------------------------------------------------------------------
	echo [MS-board] [Win-Break-Paasword]
	echo ------------------------------------------------------------------------------------------
	echo Are you sure Remove %Inuser4hack% Password ?
	echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo. 
	 echo --------------------------------------------------------
	choice /c yn /n /m "[Y]es - [N]o"
	IF /i %errorlevel% EQU 1 GOTO YesUserPassHck
	IF /i %errorlevel% EQU 2 EXIT
	:YesUserPassHck
	::ModeCOLS=98 LINES=32
	CLS
	COLOR 04
	@echo on
	Net user %Inuser4hack% %InCurrentPass%
	@echo off

	CLS
	COLOR 0a
	echo.
	echo Process is done!
	echo.
	echo.
	echo.
	echo Enjoy.
	echo.
	Timeout 1
	GOTO ProfessionalPanel



	:SetEnvVar
	::ModeCOLS=110 LINES=32
	CLS
	COLOR 0f
					
	echo ------------------------------------------------------------------------
	echo [Command.Cheats-Console] [ProfessionalPanel] [EnvironmentVariable]-Set
	echo ------------------------------------------------------------------------
	echo.
	echo You need:
	echo.
	echo 1-Variable Name: (Like TEMP , TMP , WINDIR or SYSTEMROOT).
	echo 2-Value SZ: (Can be any PATH,Like: C:\Myfolder).
	echo 3-To Test: (Press [START+R] Or Start RUN and Inser Variable Name).
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo --------------------------------------------------------
	SET /p pproVarName=Insert Variable-Name:
		
		IF  /i %pproVarName%==%pproVarName% GOTO pproVarNameCurrent
		PAUSE >nul goto pproVarName%
	:pproVarNameCurrent
		SET /p pproVarNameCurrent=Inset Current Variable-Name:
		IF /i %pproVarNameCurrent%==%pproVarName% GOTO pproVarValue
		PAUSE >nul
		GOTO pproVarNameCurrent%

	:pproVarValue
			
			CLS
			COLOR 03
			SET /p pproVarValue=Insert Value:
			
				IF /i %pproVarValue%==%pproVarValue% GOTO pproVarValueCurrent
				PAUSE >nul
				GOTO pproVarValue
				
				:pproVarValueCurrent
				SET /p pproVarValueCurrent=Insert Current-Value:
					
					IF /i %pproVarValueCurrent%==%pproVarValue% GOTO CreateEnvVar
					PAUSE >nul
					GOTO pproVarValueCurrent
					
					:CreateEnvVar
					CLS
					COLOR 0e
					setx %pproVarName% %pproVarValue%
					echo.
					Timeout 2
					CLS
					COLOR 0a
					echo Set Environment Variable Successfull!
					echo Create is Done.
					echo.
					Timeout 2
					CLS
					COLOR 07
					echo Test Your Value.
					echo.
					START %windir%\explorer.exe shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}
					Timeout 2
					PAUSE >nul
					GOTO ProfessionalPanel


	: :Desktop %windir%\explorer.exe shell:::{3080F90D-D7AD-11D9-BD98-0000947B0257}
	::%windir%\System32\WindowsPowerShell\v1.0\powershell.exe
	:: %windir%\System32\control.exe /name Microsoft.DeviceManager
	:: Cmkdir User %windir%\System32\cmkdir.exe
	:: File Explorer %windir%\explorer.exe shell:::{52205fd8-5dfb-447d-801a-d0b52f2e83e1}
	: :Search %windir%\explorer.exe shell:::{2559a1f8-21d7-11d4-bdaf-00c04f60b9f0}
	: :Taskmanager %windir%\System32\taskmgr.exe /0
	: :Run %windir%\explorer.exe shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}
	:          :Computer\HKEY_CLASSES_ROOT\CLSID\{4026492F-2F69-46B8-B9BF-5654FC07E423} < = = == Windowsfirewall
	::%SystemRoot%\System32\control.exe
	:        :Computer\HKEY_CLASSES_ROOT\CLSID\{0DF44EAA-FF21-4412-828E-260A8728E7F1} < = = == Taskbar
	:       :Computer\HKEY_CLASSES_ROOT\CLSID\{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9} < = = == Taskbar AERA ICON

	::runas /user:administrator "cmkdir \" 2.bat\" " | echo hi
	:DefaultPanel
	::ModeCOLS=98 LINES=34
	CLS	
	COLOR 0c
	echo --------------------------------------------------------
	echo [Command.Cheats-Console] [DefaultPanel]
	echo --------------------------------------------------------
	echo.
	echo [1] Page-1
	echo [2] Page-2
	echo [3] Page-3
	echo [B] Back
	echo [E] Exit₹
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo --------------------------------------------------------
			choice /c 123be /n /m "[1] Page-1     [2] Page-2      [3] Page-3      [B] Back     [E] Exit"

				IF /i %errorlevel% EQU 1 GOTO cmkdircheat1
				IF /i %errorlevel% EQU 2 GOTO cmkdircheat2
				IF /i %errorlevel% EQU 3 GOTO cmkdircheat3
				IF /i %errorlevel% EQU 4 GOTO MainMenu
				IF /i %errorlevel% EQU 5 GOTO ExitButton

						:cmkdircheat1
						::ModeCOLS=98 LINES=40
						CLS
						COLOR 03
						echo [List] "sorted name A-Z" :
						echo.																	
						echo ------
						echo [D]
						echo -------
						echo.
						echo [key1] Disable [Shutdown-Button]
						echo [key2] Disable [Registery-Editor]
						echo [key3] Disable [Recemt-Files]
						echo [key4] Disable [RPCSS-Service]
						echo [key5] Disable [Show.Hidden-Files]
						echo [key6] Disable [Remote-Registery]
						echo [key7] Disable [Upadate-Windows]
						echo [key8] Disable [Firewall]
						echo [key9] Disable [Limit.Internet- "QOS.Packet" ]
						echo [key10] Disable [Workstation]
						echo.
						echo.
						echo [C] Choose:
						echo [2] Page-2
						echo [3] Page-3
						echo [B] Back.
						echo [E] Exit.
						echo.

						echo --------------------------------------------------------
						choice /c c23be /n /m "[2] Page-2      [3] Page-3      [B] Back     [E] Exit"

						IF /i %errorlevel% EQU 1 GOTO commandcheatechoose
						IF /i %errorlevel% EQU 2 GOTO cmkdircheat2
						IF /i %errorlevel% EQU 3 GOTO cmkdircheat3
						IF /i %errorlevel% EQU 4 GOTO DefaultPanel
						IF /i %errorlevel% EQU 5 GOTO ExitButton

	:commandcheatechoose
	::ModeCOLS=98 LINES=40
	CLS
	COLOR 0c
			echo [List] "sorted name A-Z" :
			echo.																	
			echo ------
			echo [D]
			echo -------
			echo.
			echo [key1] Disable [Shutdown-Button]
			echo [key2] Disable [Registery-Editor]
			echo [key3] Disable [Recemt-Files]
			echo [key4] Disable [RPCSS-Service]
			echo [key5] Disable [Show.Hidden-Files]
			echo [key6] Disable [Remote-Registery]
			echo [key7] Disable [Upadate-Windows]
			echo [key8] Disable [Firewall]
			echo [key9] Disable [Limit.Internet- "QOS.Packet" ]
			echo [key10] Disable [Workstation]
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo --------------------------------------------------------
			SET /p commandcheatechoose=Choose:
			
					
					IF /i %commandcheatechoose%==key1 GOTO key1
					IF /i %commandcheatechoose%==key2 GOTO key2
					IF /i %commandcheatechoose%==key3 GOTO key3
					IF /i %commandcheatechoose%==key4 GOTO key4
					IF /i %commandcheatechoose%==key5 GOTO key5
					IF /i %commandcheatechoose%==key6 GOTO key6
					IF /i %commandcheatechoose%==key7 GOTO key7
					IF /i %commandcheatechoose%==key8 GOTO key8
					IF /i %commandcheatechoose%==key9 GOTO key9
					IF /i %commandcheatechoose%==key10 GOTO key10
					
					IF /i %commandcheatechoose%==b GOTO cmkdircheat1
					PAUSE >nul
					GOTO commandcheatechoose
			

							
									:Key1
									
									echo.
									echo --------------------------------------------------------
									echo Key1
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  key1



									:Key2
									
									echo.
									echo --------------------------------------------------------
									echo Key2
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  key2



									:Key3
									
									echo.
									echo --------------------------------------------------------
									echo Key3
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  key3



									:Key4
									
									echo.
									echo --------------------------------------------------------
									echo Key4
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  Key4



									:Key5
									
									echo.
									echo --------------------------------------------------------
									echo Key5
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  Key5



									:Key6
									
									echo.
									echo --------------------------------------------------------
									echo Key6
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  Key6



									:Key7
									
									echo.
									echo --------------------------------------------------------
									echo Key7
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  Key7




									:Key8
									
									echo.
									echo --------------------------------------------------------
									echo Key8
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  Key8
									


									:Key9
									
									echo.
									echo --------------------------------------------------------
									echo Key9
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  key9
									



									:Key10
									
									echo.
									echo --------------------------------------------------------
									echo Key10
									echo --------------------------------------------------------
									echo.
									
									PAUSE >nul
									GOTO  key10
									
								
									
	:cmkdircheat2
	::ModeCOLS=98 LINES=40
	CLS
	COLOR 03

			echo --------
			echo [V]
			echo ----------
			echo.
			echo Virus Newfolder
			echo Virus Delete-All-ExE
			echo Virus Format-Drive
			echo Virus Restart-Loop
			echo Virus kill-Explorer
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo [C] Choose:
			echo [1] Page-1
			echo [3] Page-3
			echo [B] Back.
			echo [E] Exit.
			echo.

			echo --------------------------------------------------------
			
		choice /c c13be /n /m "[C] Choose     [1] Page-2      [3] Page-3      [B] Back     [E] Exit"

			IF /i %errorlevel% EQU 1 GOTO commandcheate2choose
			IF /i %errorlevel% EQU 2 GOTO cmkdircheat1
			IF /i %errorlevel% EQU 3 GOTO cmkdircheat3
			IF /i %errorlevel% EQU 4 GOTO DefaultPanel
			IF /i %errorlevel% EQU 5 GOTO ExitButton


	:commandcheate2choose
	::ModeCOLS=98 LINES=32
	CLS
	COLOR 0c
			echo --------
			echo [V]
			echo ----------
			echo.
			echo [1] Virus Newfolder
			echo [2] Virus Delete-All-ExE
			echo [3] Virus Format-Drive
			echo [4] Virus Restart-Loop
			echo [5] Virus kill-Explorer
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo --------------------------------------------------------
			
		choice /c 12345b /n /m "[1]Newfolder   [2]DeleteAllExE   [3]FormatDrive   [4]RestartLoop   [5]killExplorer   [B]Back.
			
			IF /i %errorlevel% EQU 1 GOTO Newfolder
			IF /i %errorlevel% EQU 2 GOTO DeleteAllExE
			IF /i %errorlevel% EQU 3 GOTO FormatDrive
			IF /i %errorlevel% EQU 4 GOTO RestartLoop
			IF /i %errorlevel% EQU 5 GOTO killExplorer
			IF /i %errorlevel% EQU 6 GOTO cmkdircheat2
			
				
						
															
									
									:Newfolder
									CLS
									COLOR 04
									echo Newfolder
									
									PAUSE >nul
									GOTO commandcheate2choose
									
									
									
									
									:DeleteAllExE
									CLS
									COLOR 04
									echo DeleteAllExE
									
									PAUSE >nul
									GOTO commandcheate2choose
									
									
									
									
									:FormatDrive
									CLS
									color04
									echo FormatDrive
									
									PAUSE >nul
									GOTO commandcheate2choose
									
									
									
									
									:RestartLoop
									CLS
									COLOR 04
									echo RestartLoop
									
									PAUSE >nul
									GOTO commandcheate2choose
									
									
									
									
									:killExplorer
									CLS
									COLOR 04
									echo killExplorer
									
									PAUSE >nul
									GOTO commandcheate2choose
									
									
															

	:cmkdircheat3
	::ModeCOLS=98 LINES=32
	CLS
	COLOR 03


			echo --------
			echo [?]
			echo ----------
			echo.
			echo ?
			echo ??
			echo ???
			echo ????
			echo ?????
			eecho.
			echo.
			echo [1] Page-1
			echo [2] Page-2
			echo [B] Back.
			echo [E] Exit.
			echo.

			echo --------------------------------------------------------
			
		choice /c 12be /n /m "[1] Page-1     [2] Page-2      [B] Back     [E] Exit"

			IF /i %errorlevel% EQU 1 GOTO cmkdircheat1
			IF /i %errorlevel% EQU 2 GOTO cmkdircheat3
			IF /i %errorlevel% EQU 3 GOTO DefaultPanel
			IF /i %errorlevel% EQU 4 GOTO ExitButton
			
	:DarkPanel
	CLS
	COLOR 0f

	PAUSE >nul
	GOTO DarkPanel
			
					


	:account
	::ModeCOLS=98 LINES=32
	CLS
	CD %AppData%\System32\cmdacoBin\%logname%
	CALL "%realusername%color.bat"
	CALL "%realusername%.bat"
	COLOR %colorcode%
	CLS
	echo.
	echo -------------------------------------------
	echo %realusername%
	echo -------------------------------------------
	@echo off

	TITLE [MS-board] [User-Console]
	COLOR 04
	CLS
	::ModeCOLS=98 LINES=32
	echo Type "home" any TIMEs to go to the current user profile directory.
	echo Type "desktop" any TIMEs to go to the current user desktop.
	echo.
	echo Type help to see list of common commands like CD,rd,mkdir,del
	echo ren,replace,copy,xcopy,move,attrib,tree,edit,and CLS
	echo Type [command]/? for detailed info.
	echo.echo.
	echo.
	echo.
	echo.
	echo.

	PAUSE
	CLS
	:cmkdir
	TITLE [MS-board] [Console]
	::ModeCOLS=125 LINES=40
	echo UserAccount: %logname
	echo Mode: Member
	SET /p CMC=Command:
	IF %Cmkdir%=="CLS" GOTO CLS

	IF %Cmkdir%=="profile" GOTO profile
	IF %Cmkdir%=="010122357563010101" GOTO keyboardAccess
	IF %Cmkdir%=="userhome" GOTO home2
	IF %Cmkdir%=="menu" GOTO mainmenu
	IF %Cmkdir%=="home" GOTO home
	IF %Cmkdir%=="signup" GOTO signUpButton
	IF %Cmkdir%=="signin" GOTO signInButton
	IF %Cmkdir%=="E" GOTO ExitButton
	IF %Cmkdir%=="ass" GOTO filtermode
	IF %Cmkdir%=="dashaq" GOTO filtermode
	IF %Cmkdir%=="dashagh" GOTO filtermode
	IF %Cmkdir%=="kir" GOTO filtermode
	IF %Cmkdir%=="kos" GOTO filtermode
	IF %Cmkdir%=="kun" GOTO filtermode
	IF %Cmkdir%=="kon" GOTO filtermode
	IF %Cmkdir%=="mame" GOTO filtermode
	IF %Cmkdir%=="gay" GOTO filtermode
	IF %Cmkdir%=="suck" GOTO filtermode
	IF %Cmkdir%=="cock" GOTO filtermode
	IF %Cmkdir%=="lesbian" GOTO filtermode
	IF %Cmkdir%=="les" GOTO filtermode
	IF %Cmkdir%=="trans" GOTO filtermode
	IF %Cmkdir%=="shemale" GOTO filtermode
	IF %Cmkdir%=="tranny" GOTO filtermode
	IF %Cmkdir%=="ladyboy" GOTO filtermode
	IF %Cmkdir%=="fuck" GOTO filtermode
	IF %Cmkdir%=="fucks" GOTO filtermode
	IF %Cmkdir%=="sex" GOTO filtermode
	IF %Cmkdir%=="administrator" GOTO WrongCommand
	IF %Cmkdir%=="hossein" GOTO WrongCommand
	IF %Cmkdir%=="hack" GOTO WrongCommand
	IF %Cmkdir%=="virus" GOTO WrongCommand
	IF %Cmkdir%=="crack" GOTO WrongCommand
	IF %Cmkdir%=="bug" GOTO WrongCommand
	IF %Cmkdir%=="pakzad" GOTO WrongCommand
	IF %Cmkdir%=="afshar" GOTO WrongCommand
	IF %Cmkdir%=="pakzad afshar" GOTO WrongCommand
	IF %Cmkdir%=="pakzadafshar" GOTO WrongCommand
	IF %Cmkdir%=="microsoft" GOTO WrongCommand
	IF %Cmkdir%==desktop  " goto desktop 
	IF %Cmkdir%==red GOTO red
	IF %Cmkdir%==green GOTO green
	IF %Cmkdir%==normal GOTO normal




			:filtermode
			::ModeCOLS=98 LINES=36
					COLOR 04
					TITLE [MS-board] [Error-xxx]
					CLS
						echo -----------------------------------------------------------------
						echo ERROR 01010
						echo -----------------------------------------------------------------
						echo.
						echo This Word is defined!
						echo some respact!
						echo.
						echo Please Don't be Brute ...
						echo Please don't try again ...
						echo. 
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo.
						echo you'r transfered to the ADMIN page...
						echo --------------------------------------------------------
						
					PAUSE >nul
					GOTO adminError
				
				
				:profile
				::ModeCOLS=98 LINES=23
				CLS
				TITLE [MS-board] [User-Profile]
				COLOR 0d
				
				echo.
				echo -----------------------------------------------------------------
				echo
				echo -----------------------------------------------------------------
				echo.
				echo UserAccount: %logname%
				echo.
				echo UserWake: ACTIVE
				echo UserMode: Default-Member
				echo UserGroup: 0
						
		%Cmkdir%
		CD C:\
		GOTO cmkdir
		
:CLS
	CLS
	GOTO cmkdir
	
:home2
	CD /d %USERPROFILE%
	CLS
	GOTO cmkdir
	
	
:desktop
	CD /d %Systemkdirrive%\Users\%USERNAME%\Desktop
	CLS
	GOTO cmkdir
	
	
:red
	COLOR 0c
	CLS
	GOTO cmkdir
	
	
:green
	COLOR 0a
	CLS
	GOTO cmkdir
	
	
:normal
	COLOR 0f
	CLS
	GOTO cmkdir
	
			echo Press any key to go to MainMenu...
			echo --------------------------------------------------------
		PAUSE >nul
		GOTO cmkdir
						
						
						
		


	::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online
	::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline
	::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline
	::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline
	::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline
	::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline
	::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline
	::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline
	::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline
	::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline
	::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline
	::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline
	::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline
	::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline
	::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline
	::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE
	::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE







	:rootkeyboardUCFG
		::ModeCOLS=98 LINES=34		
		CLS
		COLOR 09
		TITLE [Key4board] [UserAccess-Configuration]
		
		echo ------------------------------------------------------------------------------------------ 
		echo [Key4board] [UserAccess-Configuration] Menu
		echo ------------------------------------------------------------------------------------------ 

		echo ~\Root\\UConfig
		echo.
		echo [A] Create/Remove - Administrator .
		echo [S] Create/Remove - SuperUser .
		echo [D] Create/Remove - UserDefault .
		echo [E] Edit / Change User .
		echo.		
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo [B] Back .
		echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		choice /c asdeb /n /m root/:
		
			
			IF %errorlevel% EQU 1 GOTO rootkeyboardUCFGmkdlAdministrator
			IF %errorlevel% EQU 2 GOTO rootkeyboardUCFGmkdlSuperUser
			IF %errorlevel% EQU 3 GOTO rootkeyboardUCFGmkdlUserDefault
			IF %errorlevel% EQU 4 GOTO rootkeyboardUCFGeditAll
			IF %errorlevel% EQU 5 GOTO rootkeyboard


			:rootkeyboardUCFGAdministrator
			::ModeCOLS=98 LINES=34
				CLS
				COLOR 0b
				TITLE [Key4board] [UserAccess-Configuration] [Administrator]

					echo ------------------------------------------------------------------------------------------ 
					echo [Key4board] [UserAccess-Configuration] [Administrator] Menu
					echo ------------------------------------------------------------------------------------------ 
		
					echo ~\Root\\UConfig\Administrator
					echo.
					echo [1] Show-Administrator .
					echo [2] Create-Administrator .
					echo [3] Remove-Administrator .
					echo.
					echo.		
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo [B] Back .
					echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					
				choice /c 123b /n /m root/:		
			
					IF %errorlevel% EQU 1 GOTO rootkeyboardUCFGShowAdministrator
					IF %errorlevel% EQU 2 GOTO rootkeyboardUCFGSetAdministrator
					IF %errorlevel% EQU 3 GOTO rootkeyboardUCFGRemoveAdministrator
					IF %errorlevel% EQU 4 GOTO rootkeyboard
					
		
																						
			:rootkeyboardUCFGSetAdministrator
			
					CLS
					COLOR 0b
					TITLE [Key4board] [UserAccess-Configuration] Set:Administrator
					
					CLS
					CD "%AppData%\System32\cmdacoBin"
					CLS
					mkdir "UserDefault"
					CLS
					CD "%AppData%\System32\cmdacoBin"
					CLS
					mkdir Administrators
					CLS
					CD "%AppData%\System32\cmdacoBin\Administrators"
					
					
					
			CLS		
			SET /p rootkeyboardSetAdministratorName=Insert Administrator's Username:
			
				IF /i %rootkeyboardSetAdministratorName%==%rootkeyboardSetAdministratorName% GOTO rootkeyboardSetAdministratorPass
				PAUSE >nul
				GOTO rootkeyboardUCFGSetAdministrator
								
			
			
				:rootkeyboardSetAdministratorPass
					CLS
						SET /p rootkeyboardSetAdministratorPass=Insert Administrator's Password				
						
							IF /i %rootkeyboardSetAdministratorPass%==%rootkeyboardSetAdministratorPass% GOTO rootkeyboardSetAdministratorCurrentPass
							PAUSE >nul
							GOTO rootkeyboardSetAdministratorPass
					
					
					
			:rootkeyboardSetAdministratorCurrentPass
				CLS
					SET /p rootkeyboard_Set_Administrator_CurrentPas=Curent Password:
								
						IF /i %rootkeyboardSetAdministratorCurrentPass%==%rootkeyboardSetAdministratorPass% GOTO rootkeyboardSetAdministratorUserOut
						PAUSE >nul
						GOTO rootkeyboardSetAdministratorCurrentPass
									
									
									
		:rootkeyboardSetAdministratorUserOut
								CLS
								CD "%AppData%\System32\cmdacoBin\Administrators"
								mkdir %rootkeyboardSetAdministratorName%
								CD "%AppData%\System32\cmdacoBin\Administrators\%rootkeyboardSetAdministratorName%"
								echo %rootkeyboardSetAdministratorName% >> "%AppData%\System32\cmdacoBin\Administrators\%rootkeyboardSetAdministratorName%\%rootkeyboardSetAdministratorName%.txt"
								echo %TIME% >> "%AppData%\System32\cmdacoBin\Administrators\%rootkeyboardSetAdministratorName%\%rootkeyboardSetAdministratorName%.txt"
								echo %rootkeyboardSetAdministratorPass% >> "%AppData%\System32\cmdacoBin\Administrators\%rootkeyboardSetAdministratorName%\%rootkeyboardSetAdministratorName%.txt"
								echo %DATE% >> "%AppData%\System32\cmdacoBin\Administrators\%rootkeyboardSetAdministratorName%\%rootkeyboardSetAdministratorName%.txt"
								echo %TIME% >> "%AppData%\System32\cmdacoBin\Administrators\%rootkeyboardSetAdministratorName%\%rootkeyboardSetAdministratorName%.txt"
							CD %AppData%

							Timeout 2
							
							CLS
							COLOR 0a
							TITLE [Key4board] Successfully Set-Administrator
							::ModeCOLS=98 LINES=34
							echo --------------------------------------------------------
							echo [Key4board] Successfully Set-Administrator
							echo --------------------------------------------------------
							echo Successfully Created Administrator!
							echo Create is done.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo --------------------------------------------------------
						Timeout 2
							
							

													
			:rootkeyboardUCFGShowAdministrator
			
				CLS
				COLOR 09
				TITLE [Key4board] [UserAccess-Configuration] [Administrator]
				
				

					CD "%AppData%\System32\cmdacoBin\Administrators"
					CLS
					::ModeCOLS=98 LINES=34
					echo ------------------------------------------------------------------------------------------ 
					echo [Key4board] [UserAccess-Configuration] [Administrator] Show
					echo ------------------------------------------------------------------------------------------ 
					echo.
					echo ~\Root\\UConfig\Administrator\Show
					echo.
					CD "%AppData%\System32\cmdacoBin\Administrators"
					echo %TIME%
					echo %DATE%
					echo dir
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo [B] Back .
					echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					
				choice /c b /n /m root/:
					
					IF %errorlevel% EQU 1 GOTO rootkeyboardUCFGAdministrator
							
							
																
																
							:rootkeyboardUCFGShowSuperuser
							
								
								CLS
								COLOR 09
								title [Key4board] [UserAccess-Configuration] [Superuser]  
								CD "%AppData%\System32\cmdacoBin\SuperUser"
								::ModeCOLS=98 LINES=34
										echo ------------------------------------------------------------------------------------------ 
										echo [Key4board] [UserAccess-Configuration] [SuperUser] Show
										echo ------------------------------------------------------------------------------------------ 
										echo.
										echo ~\Root\\UConfig\SuperUsers\Show
										echo.
										echo %TIME%
										echo %DATE%
										echo dir
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo [B] Back .
										echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
										
									choice /c b /n /m root/:
								
										IF %errorlevel% EQU 1 GOTO rootkeyboardUCFGSuperUser
								
												
																				
							:rootkeyboardUCFGShowUserDefault
							
								CLS
								COLOR 09
								title [Key4board] [UserAccess-Configuration] [UserDefault]  
								CD "%AppData%\System32\cmdacoBin\UserDefault"
									::ModeCOLS=98 LINES=34
										echo ------------------------------------------------------------------------------------------ 
										echo [Key4board] [UserAccess-Configuration] [UserDefault] Show
										echo ------------------------------------------------------------------------------------------ 
										echo.
										echo ~\Root\\UConfig\UserDefault\Show
										echo.
										echo %TIME%
										echo %DATE%
										echo dir
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo.
										echo [B] Back .
										echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
										
									choice /c b /n /m root/:
								
										IF %errorlevel% EQU 1 GOTO rootkeyboardUCFGUserDefault
									
	
									
													
	:rootkeyboardUCFGSuperUser

		CLS
		COLOR 09
		TITLE [Key4board] [UserAccess-Configuration] [Superuser]
		::ModeCOLS=98 LINES=34
		echo ------------------------------------------------------------------------------------------ 
		echo [Key4board] [UserAccess-Configuration] [Superuser] Menu
		echo ------------------------------------------------------------------------------------------ 

		echo ~\Root\\UConfig\Superuser
		echo.
		echo [1] Show-Superuser .
		echo [2] Create-Superuser .
		echo [3] Remove-Superuser .
		echo.
		echo.											
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo [B] Back .
		echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
	choice /c 123b /n /m root/:

		IF %errorlevel% EQU 1 GOTO rootkeyboardUCFGShowSuperuser
		IF %errorlevel% EQU 2 GOTO rootkeyboardUCFGSetSuperuser
		IF %errorlevel% EQU 3 GOTO rootkeyboardUCFGRemoveSuperuser
		IF %errorlevel% EQU 4 GOTO rootkeyboardUCFG

							
					:rootkeyboardUCFGSetSuperuser
													
						CLS
							COLOR 0b
							TITLE title [Key4board] [UserAccess-Configuration] [Superuser] Set
								
						CLS
							CD "%AppData%\System32\cmdacoBin"
						CLS
							mkdir "UserDefault"
						CLS
							CD "%AppData%\System32\cmdacoBin"
						CLS
							mkdir SuperUsers
						CLS
							CD "%AppData%\System32\cmdacoBin\SuperUsers"
							
							
						CLS
						
					SET /p rootkeyboardSetSuperusersName=Insert Superuser's Username:
						
						IF /i %rootkeyboardSetSuperusersName%==%rootkeyboardSetSuperusersName% GOTO rootkeyboardSetSuperuserPass
						PAUSE >nul
						GOTO rootkeyboardUCFGSetSuperuser
								
								
		:rootkeyboardSetSuperuserPass
			CLS
			SET /p rootkeyboardSetSuperuserPass=Insert Superuser's Password:
			
				IF /i %rootkeyboardSetSuperuserPass%==%rootkeyboardSetSuperuserPass% GOTO rootkeyboardSetSuperuserCurrentPass
				PAUSE >nul
				GOTO rootkeyboardSetSuperuserPass




		:rootkeyboardSetSuperuserCurrentPass
			CLS
			SET /p rootkeyboardSetSuperuserCurrentPass=Curent Password:
										
				IF /i %rootkeyboardSetSuperuserCurrentPass%==%rootkeyboardSetSuperuserPass% GOTO rootkeyboardSetSuperuserUserOut
				PAUSE >nul
				GOTO rootkeyboardSetSuperuserCurrentPass
								

								
		:rootkeyboardSetSuperuserUserOut
			CLS
			CD "%AppData%\System32\cmdacoBin\SuperUsers"
			mkdir %rootkeyboardSetSuperusersName%
			CD "%AppData%\System32\cmdacoBin\SuperUsers\%rootkeyboardSetSuperusersName%"
			echo %SetSuperusersName% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootkeyboardSetSuperusersName%\%rootkeyboardSetSuperusersName%.txt"
			echo %TIME% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootkeyboardSetSuperusersName%\%rootkeyboardSetSuperusersName%.txt"
			echo %SetSuperuserPass% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootkeyboardSetSuperusersName%\%rootkeyboardSetSuperusersName%.txt"
			echo %DATE% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootkeyboardSetSuperusersName%\%rootkeyboardSetSuperusersName%.txt"
			echo %TIME% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootkeyboardSetSuperusersName%\%rootkeyboardSetSuperusersName%.txt"
		CD %AppData%


		CLS
		COLOR 0a
		TITLE [Key4board] Successfully Create-Superuser
		::ModeCOLS=98 LINES=34
				echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				echo [Key4board] Successfully Create-Superuser
				echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				echo Successfully Created Superuser!
				echo Create is done.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo --------------------------------------------------------
				
			Timeout 2
			GOTO rootkeyboardUCFGSuperUser




	

		:rootkeyboardUCFGUserDefault

			CLS
			COLOR 09
			TITLE [Key4board] [UserAccess-Configuration] [UserDefault]
			::ModeCOLS=98 LINES=34
					echo ------------------------------------------------------------------------------------------ 
					echo [Key4board] [UserAccess-Configuration] [UserDefault] Menu
					echo ------------------------------------------------------------------------------------------ 

					echo ~\Root\\UConfig\UserDefault
					echo.
					echo [1] Show-UserDefault .
					echo [2] Create-UserDefault .
					echo [3] Remove-UserDefault .
					echo.
					echo.											
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo [B] Back .
					echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					
					choice /c 123b /n /m root/:

						IF %errorlevel% EQU 1 GOTO rootkeyboardUCFGShowUserDefault
						IF %errorlevel% EQU 2 GOTO rootkeyboardUCFGSetUserDefault
						IF %errorlevel% EQU 3 GOTO rootkeyboardUCFGRemoveUserDefault
						IF %errorlevel% EQU 4 GOTO rootkeyboardUCFG
				
				
				
									
		:rootkeyboardUCFGSetUserDefault
												
			CLS
			COLOR 0b
			TITLE [Key4board] [UserAccess-Configuration] [UserDefault] Set
			


			CLS
			CD "%AppData%\System32\cmdacoBin"
			CLS
		mkdir UserDefault
			CLS
			CD "%AppData%\System32\cmdacoBin\UserDefault"
			CLS
			
		SET /p rootkeyboardSetUserDefaultName=Insert UserDefault's Username:
		
			CLS
				IF /i %rootkeyboardSetUserDefaultName%==%rootkeyboardSetUserDefaultName% GOTO rootkeyboardSetUserDefaultPass
				PAUSE >nul
				GOTO rootkeyboardUCFGSetUserDefault
					
					
					
						:rootkeyboardSetUserDefaultPass
						
							CLS
							SET /p rootkeyboardSetUserDefaultPass=Insert UserDefault's Password
							CLS
								IF /i %rootkeyboardSetUserDefaultPass%==%rootkeyboardSetUserDefaultPass% GOTO rootkeyboardSetUserDefaultCurrentPass
								PAUSE >nul
								GOTO rootkeyboardSetUserDefaultPass
				
				
				
			:rootkeyboardSetUserDefaultCurrentPass
				CLS
				SET /p SetUserDefaultCurrentPass=Curent Password:
				CLS
					IF /i %rootkeyboardSetUserDefaultCurrentPass%==%rootkeyboardSetUserDefaultPass% GOTO rootkeyboardSetUserDefaultUserOutt
					PAUSE >nul
					GOTO rootkeyboardSetUserDefaultCurrentPass
																

																
:rootkeyboardSetUserDefaultUserOut
		CLS
		CD "%AppData%\System32\cmdacoBin\UserDefault"
		mkdir %rootkeyboardSetUserDefaultName%
		CD "%AppData%\System32\cmdacoBin\UserDefault\%rootkeyboardSetUserDefaultName%"
		echo %rootkeyboardSetUserDefaultName% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootkeyboardSetUserDefaultName%\%rootkeyboardSetUserDefaultName%.txt"
		echo %TIME% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootkeyboardSetUserDefaultName%\%rootkeyboardSetUserDefaultName%.txt"
		echo %rootkeyboardSetUserDefaultPass% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootkeyboardSetSuperusersName%\%rootkeyboardSetUserDefaultName%.txt"
		echo %DATE% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootkeyboardSetUserDefaultName%\%rootkeyboardSetUserDefaultName%.txt"
		echo %TIME% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootkeyboardSetUserDefaultName%\%rootkeyboardSetUserDefaultName%.txt"
	CD %AppData%

	CLS
	COLOR 0a
	TITLE [Key4board] Successfully Create-UserDefault
Timeout 2
	CLS
	::ModeCOLS=98 LINES=34
	echo --------------------------------------------------------
	echo [Key4board] Successfully Create-UserDefault
	echo --------------------------------------------------------
	echo Successfully Created UserDefault!
	
	echo Create is done.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo --------------------------------------------------------
	
Timeout 2
GOTO rootkeyboardUCFGUserDefault




					
		:rootkeyboardUCFGRemoveAdministrator
						CLS
						COLOR 0b
						TITLE [Key4board] [UserAccess-Configuration] [Administrator]
						CD "%AppData%\System32\cmdacoBin\Administrators"
						CLS
						::ModeCOLS=98 LINES=22
							echo ------------------------------------------------------------------------------------------ 
							echo [Key4board] [UserAccess-Configuration] [Administrator] Remove
							echo ------------------------------------------------------------------------------------------ 
							echo. 
							echo ~\Root\\UConfig\Administrator Remove
							echo.
							echo dir
							echo.
							echo.
							echo.
							echo [B] Back .
							echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							
						SET /p rootkeyboardRemoveAdministratorName=Insert Administrator's Username:
						
							FIND "%rootkeyboardRemoveAdministratorName%" %AppData%\System32\cmdacoBin\Administrator
							
								IF %errorlevel% EQU 0 GOTO rootkeyboardRemoveAdministratorName
							
								PAUSE >nul
								GOTO rootkeyboardUCFGRemoveAdministrator

	:rootkeyboardRemoveAdministratorName
			::ModeCOLS=98 LINES=32
			CD "%AppData%\System32\cmdacoBin\Administrators"
			CLS
			COLOR 0c
			echo Are you sure ?
			echo.
			echo.
			echo.
			echo.
			echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		Choice /c ynb /n /m "[Y]es [N]o"
			
			IF %errorlevel% EQU 1 GOTO rootkeyboardRemoveAdministratorName2
			IF %errorlevel% EQU 2 GOTO rootkeyboardRemoveAdministratorName
			IF %errorlevel% EQU 3 GOTO rootkeyboardUCFGAdministrator



					:rootkeyboardRemoveAdministratorName2
		
							DEL /f /q %rootkeyboardRemoveAdministratorName%
							CLS
							COLOR 0c
							echo Removed Administrator!
							echo is done.
						Timeout 2
							GOTO rootkeyboardUCFGAdministrator
			

															
	:rootkeyboardUCFGRemoveSuperuser
	
			CLS
			COLOR 0b
			TITLE [Key4board] [UserAccess-Configuration] [Superuser]
			CD "%AppData%\System32\cmdacoBin\Superuser"
				CLS
				::ModeCOLS=98 LINES=22
					echo ------------------------------------------------------------------------------------------ 
					echo [Key4board] [UserAccess-Configuration] [Superuser] Remove
					echo ------------------------------------------------------------------------------------------ 
					echo. 
					echo ~\Root\\UConfig\Superuser Remove
					echo.
					echo dir
					echo.
					echo.
					echo.
					echo [B] Back .
					echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					
					SET /p rootkeyboardRemoveSuperuserName=Insert Superuser's Username:
					
						FIND "%rootkeyboardRemoveSuperuserName%" %AppData%\System32\cmdacoBin\Superuser
					
							IF %errorlevel% EQU 0 GOTO rootkeyboardRemoveSuperuser
							PAUSE >nul
							GOTO rootkeyboardUCFGRemoveSuperuser

	:RemoveSuperuser
	
			CLS
			COLOR 0c
			::ModeCOLS=98 LINES=22
			echo Are you sure ?
			echo.
			echo.
			echo.
			echo.
			echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		Choice /c ynb /n /m "[Y]es [N]o"
			
			IF %errorlevel% EQU 1 GOTO rootkeyboardRemoveSuperuser2
			IF %errorlevel% EQU 2 GOTO rootkeyboardRemoveSuperuser
			IF %errorlevel% EQU 3 GOTO rootkeyboardUCFGSuperUser





	:rootkeyboardRemoveSuperuser2
			::ModeCOLS=98 LINES=20
			
		DEL /f /q %rootkeyboardRemoveSuperuserName%
			CLS
			COLOR 0c
			echo Removed Superuser!
			echo is done.
			echo --------------------------------------------------------
	
	Timeout 2
		GOTO rootkeyboardUCFGRemoveSuperuser



	:rootkeyboardRemoveSuperuser
	
		CD "%AppData%\System32\cmdacoBin\SuperUsers"
			CLS
			::ModeCOLS=98 LINES=20
			echo Are you sure ?
			echo.
			echo.
			echo.
			echo.
			echo --------------------------------------------------------
	
	Choice /c ynb /n /m "[Y]es [N]o"
			
			IF %errorlevel% EQU 1 GOTO rootkeyboardRemoveSuperuser2
			IF %errorlevel% EQU 2 GOTO rootkeyboardRemoveSuperuser
			IF %errorlevel% EQU 3 GOTO rootkeyboardUCFGSuperUser




	:rootkeyboardRemoveSuperuser2
		::ModeCOLS=98 LINES=20
		
		DEL /f /q %rootkeyboardRemoveSuperuserName%
			CLS
			COLOR 0c
			echo Removed SuperUser!
			echo is done.
			echo --------------------------------------------------------
		
		Timeout 2
		GOTO rootkeyboardUCFGSuperUser

										
						
																
	:rootkeyboardUCFGRemoveUserDefault
					CLS
					COLOR 0b
					TITLE [Key4board] [UserAccess-Configuration] [UserDefault]
					CD "%AppData%\System32\cmdacoBin\UserDefault"
					CLS
					::ModeCOLS=98 LINES=20
						echo ------------------------------------------------------------------------------------------ 
						echo [Key4board] [UserAccess-Configuration] [UserDefault] Remove
						echo ------------------------------------------------------------------------------------------ 
						echo. 
						echo ~\Root\\UConfig\UserDefault Remove
						echo.
						echo dir
						echo.
						echo.
						echo.
						echo [B] Back .
						echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
						
					SET /p rootkeyboardRemoveUserDefaultName=Insert UserDefault's Username:
					
						FIND "%rootkeyboardRemoveUserDefaultName%" %AppData%\System32\cmdacoBin\UserDefault
						
							IF %errorlevel% EQU 0 GOTO rootkeyboardRemoveUserDefaultName
							PAUSE >nul
							GOTO rootkeyboardUCFGRemoveUserDefault



				:rootkeyboardRemoveAdministratorName

							CD "%AppData%\System32\cmdacoBin\UserDefault"
								CLS
								::ModeCOLS=98 LINES=20
								COLOR 0c
								echo Are you sure ?
								echo.
								echo.
								echo.
								echo.
								echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							
							Choice /c ynb /n /m "[Y]es [N]o"
								
								IF %errorlevel% EQU 1 GOTO rootkeyboardRemoveAdministratorName2
								IF %errorlevel% EQU 2 GOTO rootkeyboardRemoveAdministratorName
								IF %errorlevel% EQU 3 GOTO rootkeyboardUCFGAdministrator

				:rootkeyboardRemoveUserDefaultName2
							CLS
							::ModeCOLS=98 LINES=20
							
						DEL /f /q %rootkeyboardRemoveUserDefaultName%
								CLS
								COLOR 0c
								echo Removed UserDefault!
								echo is done.
								
							Timeout 2
							GOTO rootkeyboardUCFGUserDefault






		
						
							
							
							




	::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online ::online
	::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline ::offline
	::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline ::Inline
	::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline ::Underline
	::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline ::Enterline
	::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline ::Sideline
	::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline ::outline
	::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline ::fallowline
	::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline ::behindline
	::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline ::upline
	::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline::topline
	::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline ::Everyline
	::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline ::Anyline
	::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline ::Withoutline
	::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline ::noline
	::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE ::IS MINE
	::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE ::EVERYTHING HERE IS MINE






	:rootSuperuserUCFG
											
		CLS
		COLOR 09
		TITLE //Cli/[UserAccess-Configuration]
		::ModeCOLS=98 LINES=32
		echo ------------------------------------------------------------------------------------------ 
		echo //Cli/[UserAccess-Configuration] Menu
		echo ------------------------------------------------------------------------------------------ 

		echo ~\Root\\UConfig
		echo.
		echo [S] Create/Remove - SuperUser .
		echo [D] Create/Remove - UserDefault .
		echo [E] Edit / Change User .
		echo.		
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo [B] Back .
		echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
	choice /c sdeb /n /m ~bin/ :
		
				

				IF %errorlevel% EQU 1 GOTO rootSuperuserUCFGmkdlSuperUser
				IF %errorlevel% EQU 2 GOTO rootSuperuserUCFGmkdlUserDefault
				IF %errorlevel% EQU 3 GOTO rootSuperuserUCFGeditAll
				IF %errorlevel% EQU 4 GOTO rootSuperuser
				



							
																
														:rootSuperuserUCFGShowSuperuser
														
															
															CLS
															COLOR 09
															<\Superuser> [UserAccess-Configuration] [Superuser]  
															CD "%AppData%\System32\cmdacoBin\SuperUser"
															CLS
															::ModeCOLS=98 LINES=32
																	echo ------------------------------------------------------------------------------------------ 
																	echo //Cli/[UserAccess-Configuration] [SuperUser] Show
																	echo ------------------------------------------------------------------------------------------ 
																	echo.
																	echo ~\Root\\UConfig\SuperUsers\Show
																	echo.
																	echo %TIME%
																	echo %DATE%
																	echo dir
																	echo.
																	echo.
																	echo.
																	echo.
																	echo.
																	echo.
																	echo.
																	echo.
																	echo [B] Back .
																	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
																
																choice /c b /n /m ~bin/ :
															
																	IF %errorlevel% EQU 1 GOTO rootSuperuserUCFGSuperUser
															
																			
																				
							:rootSuperuserUCFGShowUserDefault
							
									CLS
									COLOR 09
									<\Superuser> [UserAccess-Configuration] [UserDefault]  
									CD "%AppData%\System32\cmdacoBin\UserDefault"
									CLS
									::ModeCOLS=98 LINES=32
											echo ------------------------------------------------------------------------------------------ 
											echo //Cli/[UserAccess-Configuration] [UserDefault] Show
											echo ------------------------------------------------------------------------------------------ 
											echo.
											echo ~\Root\\UConfig\UserDefault\Show
											echo.
											echo %TIME%
											echo %DATE%
											echo dir
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo.
											echo [B] Back .
											echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
									
										choice /c b /n /m ~bin/ :
									
											IF %errorlevel% EQU 1 GOTO rootSuperuserUCFGUserDefault
										
		
									
													
	:rootSuperuserUCFGSuperUser

		CLS
		COLOR 09
		TITLE //Cli/[UserAccess-Configuration] [Superuser]
		::ModeCOLS=98 LINES=34
		echo ------------------------------------------------------------------------------------------ 
		echo //Cli/[UserAccess-Configuration] [Superuser] Menu
		echo ------------------------------------------------------------------------------------------ 

		echo ~\Root\\UConfig\Superuser
		echo.
		echo [1] Show-Superuser .
		echo [2] Create-Superuser .
		echo [3] Remove-Superuser .
		echo.
		echo.											
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo [B] Back .
		echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
	choice /c 123b /n /m ~bin/ :

					IF %errorlevel% EQU 1 GOTO rootSuperuserUCFGShowSuperuser
					IF %errorlevel% EQU 2 GOTO rootSuperuserUCFGSetSuperuser
					IF %errorlevel% EQU 3 GOTO rootSuperuserUCFGRemoveSuperuser
					IF %errorlevel% EQU 4 GOTO rootSuperuserUCFG
			
							
					:rootSuperuserUCFGSetSuperuser
													
							CLS
							COLOR 0b
							TITLE title //Cli/[UserAccess-Configuration] [Superuser] Set
							

							CD "%AppData%\System32\cmdacoBin"
							CLS
							mkdir SuperUsers
							CLS
							CD "%AppData%\System32\cmdacoBin\SuperUsers"
							
							
									CLS
									SET /p rootSuperuserSetSuperusersName=Insert Superuser's Username:
									CLS
											IF /i %rootSuperuserSetSuperusersName%==%rootSuperuserSetSuperusersName% GOTO rootSuperuserSetSuperuserPass
											PAUSE >nul
											GOTO rootSuperuserUCFGSetSuperuser
											
											
											
								:rootSuperuserSetSuperuserPass
										CLS
										SET /p rootSuperuserSetSuperuserPass=Insert Superuser's Password
										CLS
												IF /i %rootSuperuserSetSuperuserPass%==%rootSuperuserSetSuperuserPass% GOTO rootSuperuserSetSuperuserCurrentPass
												PAUSE >nul
												GOTO rootSuperuserSetSuperuserPass
							
							
						
								:rootSuperuserSetSuperuserCurrentPass
										CLS
										SET /p rootSuperuserSetSuperuserCurrentPass=Curent Password:
										CLS
											IF /i %rootSuperuserSetSuperuserCurrentPass%==%rootSuperuserSetSuperuserPass% GOTO rootSuperuserSetSuperuserUserOut
											PAUSE >nul
											GOTO rootSuperuserSetSuperuserCurrentPass
										

									
								:rootSuperuserSetSuperuserUserOut
										CLS
										CD "%AppData%\System32\cmdacoBin\SuperUsers"
										mkdir %rootSuperuserSetSuperusersName%
										CD "%AppData%\System32\cmdacoBin\SuperUsers\%rootSuperuserSetSuperusersName%"
										echo %SetSuperusersName% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootSuperuserSetSuperusersName%\%rootSuperuserSetSuperusersName%.txt"
										echo %TIME% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootSuperuserSetSuperusersName%\%rootSuperuserSetSuperusersName%.txt"
										echo %SetSuperuserPass% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootSuperuserSetSuperusersName%\%rootSuperuserSetSuperusersName%.txt"
										echo %DATE% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootSuperuserSetSuperusersName%\%rootSuperuserSetSuperusersName%.txt"
										echo %TIME% >> "%AppData%\System32\cmdacoBin\SuperUsers\%rootSuperuserSetSuperusersName%\%rootSuperuserSetSuperusersName%.txt"
									CD %AppData%
			
									CLS
									COLOR 0a
									TITLE  Successfully Create-Superuser
									Timeout 2
									CLS
									::ModeCOLS=98 LINES=32
									echo --------------------------------------------------------
									echo Successfully Create-Superuser
									echo --------------------------------------------------------
									echo Successfully Created Superuser!
									echo Create is done.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo.
									echo --------------------------------------------------------
							
							Timeout 2 
								GOTO rootSuperuserUCFGSuperUser

							
																
																

																
																

				:rootSuperuserUCFGUserDefault

					CLS
					COLOR 09
					TITLE  [UserAccess-Configuration] [UserDefault]
					::ModeCOLS=98 LINES=34
					echo ------------------------------------------------------------------------------------------ 
					echo //Cli/[UserAccess-Configuration] [UserDefault] Menu
					echo ------------------------------------------------------------------------------------------ 

					echo ~\Root\\UConfig\UserDefault
					echo.
					echo [1] Show-UserDefault .
					echo [2] Create-UserDefault .
					echo [3] Remove-UserDefault .
					echo.
					echo.											
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo [B] Back .
					echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					
				choice /c 123b /n /m ~bin/ :

								IF %errorlevel% EQU 1 GOTO rootSuperuserUCFGShowUserDefault
								IF %errorlevel% EQU 2 GOTO rootSuperuserUCFGSetUserDefault
								IF %errorlevel% EQU 3 GOTO rootSuperuserUCFGRemoveUserDefault
								IF %errorlevel% EQU 4 GOTO rootSuperuserUCFG
						
											
:rootSuperuserUCFGSetUserDefault

		CLS
		COLOR 0b
		TITLE  [UserAccess-Configuration] [UserDefault] Set

		CD "%AppData%\System32\cmdacoBin"
		CLS
		mkdir UserDefault
		CLS
		CD "%AppData%\System32\cmdacoBin\UserDefault"
		CLS
		
	SET /p rootSuperuserSetUserDefaultName=Insert UserDefault's Username:
		CLS
		IF /i %rootSuperuserSetUserDefaultName%==%rootSuperuserSetUserDefaultName% GOTO rootSuperuserSetUserDefaultPass
		PAUSE >nul
	GOTO rootSuperuserUCFGSetUserDefault
					
					
					
:rootSuperuserSetUserDefaultPass

		CLS
	SET /p rootSuperuserSetUserDefaultPass=Insert UserDefault's Password
		CLS
		IF /i %rootSuperuserSetUserDefaultPass%==%rootSuperuserSetUserDefaultPass% GOTO rootSuperuserSetUserDefaultCurrentPass
		PAUSE >nul
	GOTO rootSuperuserSetUserDefaultPass




:rootSuperuserSetUserDefaultCurrentPass

		CLS
	SET /p SetUserDefaultCurrentPass=Curent Password:
		CLS
		IF /i %rootSuperuserSetUserDefaultCurrentPass%==%rootSuperuserSetUserDefaultPass% GOTO rootSuperuserSetUserDefaultUserOut
		PAUSE >nul
	GOTO rootSuperuserSetUserDefaultCurrentPass
		
		


		:rootSuperuserSetUserDefaultUserOut
				CLS
				CD "%AppData%\System32\cmdacoBin\UserDefault"
				mkdir %rootSuperuserSetUserDefaultName%
				CD "%AppData%\System32\cmdacoBin\UserDefault\%rootSuperuserSetUserDefaultName%"
				echo %rootSuperuserSetUserDefaultName% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootSuperuserSetUserDefaultName%\%rootSuperuserSetUserDefaultName%.txt"
				echo %TIME% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootSuperuserSetUserDefaultName%\%rootSuperuserSetUserDefaultName%.txt"
				echo %rootSuperuserSetUserDefaultPass% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootSuperuserSetSuperusersName%\%rootSuperuserSetUserDefaultName%.txt"
				echo %DATE% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootSuperuserSetUserDefaultName%\%rootSuperuserSetUserDefaultName%.txt"
				echo %TIME% >> "%AppData%\System32\cmdacoBin\UserDefault\%rootSuperuserSetUserDefaultName%\%rootSuperuserSetUserDefaultName%.txt"
				CD %AppData%

				CLS
				COLOR 0a
				TITLE  Successfully Create-UserDefault
				Timeout 2
				::ModeCOLS=98 LINES=32
				
							echo --------------------------------------------------------
							echo Successfully Create-UserDefault
							echo --------------------------------------------------------
							echo Successfully Created UserDefault!
							echo Create is done.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo.
							echo --------------------------------------------------------
							
						Timeout 2 
						GOTO rootSuperuserUCFGUserDefault




															
			:rootSuperuserUCFGRemoveSuperuser
			
					CLS
					COLOR 0b
					TITLE //Cli/[UserAccess-Configuration] [Superuser]
					CD "%AppData%\System32\cmdacoBin\Superuser"
					CLS
					::ModeCOLS=98 LINES=22
							echo ------------------------------------------------------------------------------------------ 
							echo //Cli/[UserAccess-Configuration] [Superuser] Remove
							echo ------------------------------------------------------------------------------------------ 
							echo. 
							echo ~\Root\\UConfig\Superuser Remove
							echo.
							echo dir
							echo.
							echo.
							echo.
							echo [B] Back .
							echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							
							
							SET /p rootSuperuserRemoveSuperuserName=Insert Superuser's Username:
							
							CLS
							
								FIND "%rootSuperuserRemoveSuperuserName%" %AppData%\System32\cmdacoBin\Superuser
							
									IF %errorlevel% EQU 0 GOTO rootSuperuserRemoveSuperuser
									
										PAUSE >nul
										GOTO rootSuperuserUCFGRemoveSuperuser



	:RemoveSuperuser
			::ModeCOLS=98 LINES=22
			CLS
			COLOR 0c
			echo Are you sure ?
			echo.
			echo.
			echo.
			echo.
			echo --------------------------------------------------------
			
		Choice /c ynb /n /m "[Y]es [N]o"
			
			IF %errorlevel% EQU 1 GOTO rootSuperuserRemoveSuperuser2
			IF %errorlevel% EQU 2 GOTO rootSuperuserRemoveSuperuser
			IF %errorlevel% EQU 3 GOTO rootSuperuserUCFGSuperUser


	:rootSuperuserRemoveSuperuser2
		DEL /f /q %rootSuperuserRemoveSuperuserName%
			CLS
			COLOR 0c
			echo Removed Superuser!
			echo is done.
		Timeout 2
		GOTO rootSuperuserUCFGRemoveSuperuser



	:rootSuperuserRemoveSuperuser
			::ModeCOLS=98 LINES=22
			CD "%AppData%\System32\cmdacoBin\SuperUsers"
			CLS
			echo Are you sure ?
			echo.
			echo.
			echo.
			echo.
			echo --------------------------------------------------------
		
		Choice /c ynb /n /m "[Y]es [N]o"
			IF %errorlevel% EQU 1 GOTO rootSuperuserRemoveSuperuser2
			IF %errorlevel% EQU 2 GOTO rootSuperuserRemoveSuperuser
			IF %errorlevel% EQU 3 GOTO rootSuperuserUCFGSuperUser



:rootSuperuserRemoveSuperuser2
		DEL /f /q %rootSuperuserRemoveSuperuserName%
			CLS
			COLOR 0c
			echo Removed SuperUser!
			echo is done.
		Timeout 2
		GOTO rootSuperuserUCFGSuperUser



				
	:rootSuperuserUCFGRemoveUserDefault
			CLS
			COLOR 0b
			TITLE  [UserAccess-Configuration] [UserDefault]
			CD "%AppData%\System32\cmdacoBin\UserDefault"
			::ModeCOLS=98 LINES=25
				echo ------------------------------------------------------------------------------------------ 
				echo //Cli/[UserAccess-Configuration] [UserDefault] Remove
				echo ------------------------------------------------------------------------------------------ 
				echo. 
				echo ~\Root\\UConfig\UserDefault Remove
				echo.
				echo dir
				echo.
				echo.
				echo.
				echo [B] Back .
				echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				
			SET /p rootSuperuserRemoveUserDefaultName=Insert UserDefault's Username:
				
				FIND "%rootSuperuserRemoveUserDefaultName%" %AppData%\System32\cmdacoBin\UserDefault
			
				IF %errorlevel% EQU 0 GOTO rootSuperuserRemoveUserDefault 
				PAUSE >nul
				GOTO rootSuperuserUCFGRemoveUserDefault





			:rootSuperuserRemoveAdministrator
						CD "%AppData%\System32\cmdacoBin\UserDefault"
						CLS
						::ModeCOLS=98 LINES=22
						COLOR 0c
						echo Are you sure ?
						echo.
						echo.
						echo.
						echo.
						echo --------------------------------------------------------
						
					Choice /c ynb /n /m "[Y]es [N]o"
						IF %errorlevel% EQU 1 GOTO rootSuperuserRemoveAdministrator2
						IF %errorlevel% EQU 2 GOTO rootSuperuserRemoveAdministrator
						IF %errorlevel% EQU 3 GOTO rootSuperuserUCFG_Administrator



	:rootSuperuserRemoveUserDefault 2
	
					::ModeCOLS=98 LINES=22
				DEL /f /q %rootSuperuserRemoveUserDefaultName%
					CLS
					COLOR 0c
					echo Removed UserDefault!
					echo is done.
				Timeout 2
				GOTO rootSuperuserUCFGUserDefault
									
:!darkpnl
CLS
Color 04
Echo Disable shutdown












