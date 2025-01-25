![Comfy Launcher app icon](/assets/PublicIco.png)
# Comfy Launcher (MLX)
## _A One-Click launcher for ComfyUI MacOS Environments_

### Requirements

- A complete and functioning ComfyUI installation accessible via the standard MacOS 'Terminal' app. See [ComfyUI](https://github.com/comfyanonymous/ComfyUI) for instructions on Apple Sillicon installation.
- A conda environment and ComfyUI working folder with names that match the command script’s targets (see instructions below).
- Administrative or superuser priveleges if/when first using as bundled .app.

### Features

- Single click laucnh of your ComfyUI.
- Starts sessions with MPS Fallback flag to streamline working with quantized models on Metal.
- Quick exit with the keyword 'bye'.
- Can be packaged as a .app bundle. (see Comfy_Launcher.dmg as sample)

Comfy Launcher is a shell script capable of being launched by double-clicking (from any folder), single-clicking (while kept on the dock) or bundling into a MacOS application. The script can be easilly costumized as it uses a combination applescript and Bourne shell commands.

### Install
- To set up the launcher, you may choose to either rename your existing ComfyUI environment and working folder to 'comfyui' and 'ComfyUI' respectivley. (see Conda documentation for renaming environments on your specific version)
- You may also choose to create a new ComfyUI install with the luancher's default convention.
- Or, you may simply edit the **main.command** file's 'comfyui' and 'ComfyUI' entries to match your existing ComfyUI install at "conda activate **comfyui**" and "cd ~/**ComfyUI**".

#### main.command

```sh
#!/bin/sh
# main.command
# Comfy Launcher for Mac MLX hardware by Tristan John.
# By default, his script assumes your working conda environment is labeled 'comfyui'
# and your working folder is labeled 'ComfyUI'.
# You can make changes here to match your unique installation.

osascript -e 'tell app "Terminal" to do script "
sleep 2s &&
cd &&
conda deactivate &&
conda activate comfyui &&
cd ~/ComfyUI &&
PYTORCH_ENABLE_MPS_FALLBACK=1 python main.py &
sleep 3s &&
open http://127.0.0.1:8188 &&
srvpid=$! &&
funtion bye() {
    kill -15 $srvpid
    conda deactivate
    cd
    clear
    echo \"ComfyUI Session Terminated\"
    }"'
```
### Launching
Simply double click the main.command script to launch ComfyUI. 
MacOS may **warn** the first time the script is used.
The script may also be renamed, kept in the dock, or even bundled into an executible app for **ultimate** convienience.
### Exiting
Simply enter ‘bye’ in the accompanying Terminal to end the ComfyUI session. —The interrupt ‘^C’ will not stop a ComfyUI server when launched by Comfy Launcher.
## License
>Apache 2.0

