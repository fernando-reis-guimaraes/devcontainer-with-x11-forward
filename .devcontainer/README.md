# X11 Forwarding Host Configuration

To use X11 forwarding with this development container, configure your host as follows:

## Linux
1. Ensure an X server is running (most distributions start one by default).
2. Install X11 utilities:
   ```bash
   sudo apt-get update
   sudo apt-get install -y x11-apps
   ```
3. Allow local X connections:
   ```bash
   xhost +local:
   ```
4. Verify your DISPLAY value on the host:
   ```bash
   echo $DISPLAY
   ```
   Typically this is `:0` or `:1`.
5. In the container (it inherits the host's DISPLAY via Docker Compose), check:
   ```bash
   echo $DISPLAY
   ```
   If it's empty or incorrect, set it manually:
   ```bash
   export DISPLAY=<host_display>  # e.g. :1
   ```
6. Test with:
   ```bash
   xeyes &
   ```

## macOS
1. Install XQuartz:
   ```bash
   brew install --cask xquartz
   ```
2. Launch XQuartz (Applications → XQuartz).
3. In XQuartz → Preferences → Security, check “Allow connections from network clients.”
4. Restart XQuartz.
5. In your shell, set DISPLAY:
   ```bash
   export DISPLAY=:0
   ```
6. Allow local connections:
   ```bash
   xhost + 127.0.0.1
   ```
7. Test with:
   ```bash
   xeyes &
   ```

## Windows
1. Install an X server (e.g., VcXsrv or Xming).
2. Launch the X server (disable access control if prompted).
3. Determine the host address:
   - Docker Desktop: use `host.docker.internal`
   - WSL2: run `grep nameserver /etc/resolv.conf | awk '{print $2}'`
4. Set DISPLAY:
   - PowerShell/CMD:
     ```powershell
     set DISPLAY=host.docker.internal:0.0
     ```
   - WSL Bash:
     ```bash
     export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0
     ```
5. Test with:
   ```bash
   xeyes &
   ```
