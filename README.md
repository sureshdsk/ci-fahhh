# faah

A CLI wrapper that plays a sound when your command fails.

Wrap any command with `faah` — if it exits with a non-zero code, you'll hear it. Perfect for long-running CI workflows where you walk away and want to know when things go wrong.

## Install

```bash
curl -fsSL get.sureshdsk.dev/faah | bash
```

## Usage

```bash
faah [options] <command> [args...]
```

### Examples

```bash
# monitor GitHub Actions — hear the faah when your CI fails
faah gh run watch
faah gh pr checks --watch

# tests
faah pytest
faah npm test
faah cargo test

# builds
faah docker build -t myapp .
faah make build
faah cargo build --release
faah npm run build

# deployments
faah kubectl rollout status deployment/myapp
faah terraform apply
faah ansible-playbook deploy.yml

# long-running scripts
faah ./migrate.sh
faah pip install -r requirements.txt
```

### Choose a sound

```bash
# use a different failure sound
faah --sound cat-meow-1 pytest

# or set a default via environment variable
export FAAH_SOUND=cat-meow-1
faah pytest
```

### Play sound on success

```bash
# meow on success, faah on failure
faah --success-sound cat-meow-1 pytest

# different sounds for both
faah --sound fahhhhh --success-sound cat-meow-1 make deploy

# set defaults via environment variables
export FAAH_SOUND=fahhhhh
export FAAH_SUCCESS_SOUND=cat-meow-1
faah pytest
```

Built-in sounds: `fahhhhh` (default), `cat-meow-1`

### Use your own sound

Pass a file path instead of a name — supports `.mp3`, `.wav`, and `.ogg` files.

```bash
# via flag
faah --sound /path/to/airhorn.mp3 pytest
faah --success-sound ~/sounds/yay.wav make deploy

# via environment variable (add to ~/.bashrc or ~/.zshrc)
export FAAH_SOUND=/path/to/airhorn.mp3
export FAAH_SUCCESS_SOUND=~/sounds/yay.wav
```

## Supported Platforms

| Platform | Audio Player |
|----------|-------------|
| macOS | `afplay` (built-in) |
| Linux | `paplay`, `aplay`, `mpv`, or `ffplay` |
| WSL | `powershell.exe` |

## Credits

- "fahhhhh" sound from viral Instagram reels
- Cat meow sound from [Pixabay](https://pixabay.com)

## Update

Re-run the install script to get the latest version:

```bash
curl -fsSL get.sureshdsk.dev/faah | bash
```

## Uninstall

```bash
# remove faah and built-in sounds
rm "$(which faah)" ~/.faah/fahhhhh.mp3 ~/.faah/cat-meow-1.mp3

# remove ~/.faah only if empty (preserves your custom sounds)
rmdir ~/.faah 2>/dev/null
```
