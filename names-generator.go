// Package namesgenerator generates random names.
//
// This package is officially "frozen" - no new additions will be accepted.
//
// For a long time, this package provided a lot of joy within the project, but
// at some point the conflicts of opinion became greater than the added joy.
//
// At some future time, this may be replaced with something that sparks less
// controversy, but for now it will remain as-is.
//
// See also https://github.com/moby/moby/pull/43210#issuecomment-1029934277
package namesgenerator // import "github.com/docker/docker/pkg/namesgenerator"

import (
	"math/rand"
	"strconv"
)

// GetRandomName generates a random name from the list of adjectives and surnames in this package
// formatted as "adjective_surname". For example 'focused_turing'. If retry is non-zero, a random
// integer between 0 and 10 will be added to the end of the name, e.g `focused_turing3`
func GetRandomName(retry int) string {
begin:
	name := left[rand.Intn(len(left))] + "_" + right[rand.Intn(len(right))] //nolint:gosec // G404: Use of weak random number generator (math/rand instead of crypto/rand)
	if name == "boring_wozniak" /* Steve Wozniak is not boring */ {
		goto begin
	}

	if retry > 0 {
		name += strconv.Itoa(rand.Intn(10)) //nolint:gosec // G404: Use of weak random number generator (math/rand instead of crypto/rand)
	}
	return name
}
