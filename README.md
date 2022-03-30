# GoLaunch

Allows cross-platform launching using default registered app of supplied arguments. Arguments can be specified from 1) command line or 2) stdin.

## Examples

### Basic

```bash
golaunch test.pdf
```

### From stdin

```bash
ls *.go | golaunch
```

### Use ripgrep and fzf to find and select multiple files matching a string

```bash
rg -l -i SELECT -g *.sql | fzf -m | golaunch
```
