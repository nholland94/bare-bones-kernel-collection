Red/System [
  Purpose: "Main kernel entry point"
  Author:  "Nathan Holland"
  License: "GNU General Public License (GNU GPL)"
]

#export [kernel-main]

kernel-main: func [] [
  print-char-at 0 0 #"@"
]
