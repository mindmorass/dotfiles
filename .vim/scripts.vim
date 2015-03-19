if did_filetype()
    finish
endif
if getline(1) =~# '^#!.*/bin/env\s\+bash\>'
    setfiletype sh
else
    setfiletype sh
endif

setfiletype sh
