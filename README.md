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

Available sounds: `fahhhhh` (default), `cat-meow-1`

## Supported Platforms

| Platform | Audio Player |
|----------|-------------|
| macOS | `afplay` (built-in) |
| Linux | `paplay`, `aplay`, `mpv`, or `ffplay` |
| WSL | `powershell.exe` |

## Credits

- "fahhhhh" sound from viral Instagram reels
- Cat meow sound from [Pixabay](https://pixabay.com)

## Uninstall

```bash
rm "$(which faah)" && rm -rf ~/.faah
```
