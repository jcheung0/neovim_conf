

$NEOVIM_HOME="$HOME\AppData\Local\nvim"

Write-Host "Congratulations Your first script executed" 
echo $NEOVIM_HOME


New-Item -ItemType HardLink -Path "$NEOVIM_HOME\init.lua" -Target "$pwd\init.lua"
New-Item -ItemType Junction -Path "$NEOVIM_HOME\lua" -Target "$pwd\lua"
