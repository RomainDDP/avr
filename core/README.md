# AVR Core

Implements using GLISS the AVR simulator.

## Testing

To test it, one has to figure out the `main` and the `main` return address. AVR compile does not link with `_exit`symbol:

	```sh
		./sim/avr-sim -v -exit=62 -v -dump  ../samples/BENCH.elf > log 2>&1
	```

The detailed resulting states are in `log`.

