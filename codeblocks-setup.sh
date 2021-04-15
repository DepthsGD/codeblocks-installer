#!/usr/bin/env bash

selection=$(mktemp)
trap EXIT "rm \"$selection\""

#intro screen
dialog --backtitle "The Code::Blocks Setup Assistant \n (c) 2019-2021 DepthsDoes. \n Powered by SympleSys Installer for the nCurses engine" --title "Setup Assistant" --msgbox \
"Welcome to the Code::Blocks Setup Assistant. From here you can setup Code::Blocks on your computer. The Setup Assistant will take from 5 to 15 minutes to run, depending on your system's speed and/or Internet connection." 15 30
#pre-requisite tasks
dialog --backtitle "The Code::Blocks Setup Assistant \n (c) 2019-2021 DepthsDoes. \n Powered by SympleSys Installer for the nCurses engine" --title "Before you install..." --yesno \
"Before you install this program, make sure that: \n a: You have read the Readme, named README.1ST \n b: You have at least 256MB RAM, and at least 300 MB hard disk space. \n If you have not fulfilled one or more of the above pre-requisite tasks, select [No] to abort the install and complete the tasks. Then, run Setup again and press [Yes]." 20 30
case $? in
	0)sleep 1s;;
	1)break 1>/dev/null;;
#package selection
dialog --backtitle "The Code::Blocks Setup Assistant \n (c) 2019-2021 DepthsDoes. \n Powered by SympleSys Installer for the nCurses engine" --title "Choose packages for install" --separate-output --checklist "Choose packages to install." 30 90 30 \
1 "CodeBlocks (do not untick unless it's already installed)" on \
2 "Common Files (again, don't untick unless you've already installed Code::Blocks)" on \
3 "Contrib Plugins" on \
4 "Common Files for Contrib Plugins" off \
5 "Debugging Libraries for Contrib Plugins" off \
6 "Debugging Libraries" off \
7 "Development Libraries for SDK" off \
8 "Development Headers for SDK" off \
9 "Shared Libraries for wxContribItems" off \
10 "wxContribItems Debug Symbols" off \
11 "Development Libraries for wxContribItems" off \
12 "Developmnt Headers for wxContribItems" off \
13 "Code::Blocks Shared Libraries" on \
14 "wxBase Runtime Library" on \
15 "wxBase Development Library" on \
16 "wxWidgets GTK+ Media Runtime Library" on \
17 "wxWidgets GTK+ Media Development Library" on \
18 "wxWidgets Media Runtime Library for GTK+ 3" off \
19 "wxWidgets Media Developmeny Library for GTK+ 3" off \
20 "wxWidgets Webview Runtime Library for GTK+ 3" off \
21 "wxWidgets Webview Development Library for GTK+ 3" off \
22 "wxWidgets GTK+ General Runtime Library" on \
23 "wxWidgets GTK+ General Development Library" on \
24 "wxWidgets General Runtime Library for GTK+ 3" off \
25 "wxWidgets General Dev. Library for GTK+ 3" off \
26 "wxSmith Dev. Files" off \
27 "wxSmith Shared Library" off \
28 "wxSmith Dev. Metapackage" off \
29 "wxSVG Dev. Files" on \
30 "wxSVG Toolkit" on \
31 "wxSVG Library for wxWidgets" on \
32 "wxWidgets Common Support Files" on \
33 "wxWidgets 3.0 Documentation" on \
34 "wxWidgets 3.0 Examples" on \
35 "wxWidgets 3.0 Header Files" on \
36 "wxWidgets 3.0 i18n Extension" off \
37 "wxHexEditor" on \
38 "wxGlade Intarface Builder (requires Python)" off \
39 "wxSmith Dev. Libraries" off \
40 "wxSmith Dev. Headers" off \
41 "wxFormBuilder" on \
2>"$selection" || exit 1

read -r -a options <"$selection"

dialog --backtitle "The Code::Blocks Setup Assistant \n (c) 2019-2021 DepthsDoes. \n Powered by SympleSys Installer for the nCurses engine" --title "Ready to Install" --msgbox "Press [OK] to install Code::Blocks on your computer. You will then be switched to Terminal Mode to install the packages. Press ESC to cancel."

#Note: I used reinstall so if any of these packages are installed, they will not give error, rather they will reinstall without deleting user data. ;)
for sel in "${options[@]}"; do
	case "$sel" in
		1)sudo apt reinstall codeblocks
		2)sudo apt reinstall codeblocks-common
		3)sudo apt reinstall codeblocks-contrib
		4)sudo apt reinstall codeblocks-contrib-common
		5)sudo apt reinstall codeblocks-contrib-dbg
		6)sudo apt reinstall codeblocks-dbg
		7)sudo apt reinstall codeblocks-dev
		8)sudo apt reinstall codeblocks-headers
		9)sudo apt reinstall codeblocks-libwxcontrib0
		10)sudo apt reinstall codeblocks-libwxcontrib0-dbgsym
		11)sudo apt reinstall codeblocks-wxcontrib-dev
		12)sudo apt reinstall codeblocks-wxcontrib-headers
		13)sudo apt reinstall libcodeblocks0
		14)sudo apt reinstall libwxbase3.0-0v5
		15)sudo apt reinstall libwxbase3.0-dev
		16)sudo apt reinstall libwxgtk-media3.0-0v5
		17)sudo apt reinstall libwxgtk-media3.0-dev
		18)sudo apt reinstall libwxgtk-media3.0-gtk3-0v5
		19)sudo apt reinstall libwxgtk-media3.0-gtk3-dev
		20)sudo apt reinstall libwxgtk-webview3.0-gtk3-0v5
		21)sudo apt reinstall libwxgtk-webview3.0-gtk3-dev
		22)sudo apt reinstall libwxgtk3.0-0v5
		23)sudo apt reinstall libwxgtk3.0-dev
		24)sudo apt reinstall libwxgtk3.0-gtk3-0v5
		25)sudo apt reinstall libwxgtk3.0-gtk3-dev
		26)sudo apt reinstall libwxsmithlib-dev
		27)sudo apt reinstall libwxsmithlib0
		28)sudo apt reinstall libwxsmithlib0-dev
		29)sudo apt reinstall libwxsvg-dev
		30)sudo apt reinstall libwxsvg-tools
		31)sudo apt reinstall libwxsvg3
		32)sudo apt reinstall wx-common
		33)sudo apt reinstall wx3.0-doc
		34)sudo apt reinstall wx3.0-examples
		35)sudo apt reinstall wx3.0-headers
		36)sudo apt reinstall wx3.0-i18n
		37)sudo apt reinstall wxglade
		38)sudo apt reinstall wxhexeditor
		39)sudo apt reinstall wxsmith-dev
		40)sudo apt reinstall wxsmith-headers
		41)./wxfb_install.sh
	esac
done
dialog --backtitle "The Code::Blocks Setup Assistant \n (c) 2019-2021 DepthsDoes. \n Powered by SympleSys Installer for the nCurses engine" --title "Installation Complete!" --msgbox "Installation is complete. Press [OK] to finalize. Should you need to install another package, run the Setup Assistant again later." 60 50


#clear screen on exit
clear
printf "The Code::Blocks Setup Assistant \n (c) 2019-2021 DepthsDoes. \n Powered by SympleSys Installer for the nCurses engine"
echo "Thank you for installing Code::Blocks. Type reboot to restart your computer and allow changes to take effect, and type codeblocks at the Run prompt post-reboot. Thank you."
exit 0
