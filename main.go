package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	"github.com/skratchdot/open-golang/open"
)

func main() {

	// no command line arguments: we'll read from stdin
	if len(os.Args) == 1 {
		scanner := bufio.NewScanner(bufio.NewReader(os.Stdin))
		for scanner.Scan() {
			line := strings.TrimSpace(scanner.Text())
			if len(line) == 0 {
				continue
			}
			err := open.Start(line)
			if err != nil {
				fmt.Fprintln(os.Stderr, "error:", err)
				os.Exit(1)
			}
		}
	}

	for _, arg := range os.Args[1:] {
		open.Start(arg)
	}
}
