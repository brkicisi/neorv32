# ECE352

## Requirements

### Quartus

Free version (Quartus Lite) can be installed from [here](https://fpgasoftware.intel.com/?edition=lite)

### riscv-gnu-toolchain

This is an open-source RISC V compiler. Download from [here](https://github.com/riscv/riscv-gnu-toolchain)

## Basic setup

Here are the steps for building and running this project as far as I currently
understand it.
These steps are based of [these](setups/quartus/de0-nano-test-setup/README.md)
instructions for the De0-Nano board.

1. Compile an example application
   1. Choose one of the applications in [example](sw/example) (I have been
      trying with [blink_led](sw/example/blink_led)).
   2. Navigate to the example directory and run `make all`
2. Build the project
   1. Open Quartus
   2. Open the TCL console in Quartus (`View/Utility Windows/Tcl console`)
   3. Navigate to the board directory in [setups/quartus/<board>](setups/quartus)
   4. Run `source create_project.tcl`
3. Place and route
   1. Run the full place and route compilation flow on the project
4. Push to the board
   1. Open the programmer and push the project to the board
5. Connect to the serial interface
   1. I am currently trying to do this with PuTTY
   2. Using the De1-SoC board I can see an exposed serial COM port but I have
      not yet recieved a response from this port.
   3. I can see that something is happening because LED0 is blinking. However it
      seems like it gets stuck somewhere since only LED0 is blinking (I expect
      LED0-7) and it stops blinking (after 16 blinks) and stays on after a short while.
      Pressing KEY0 causes a reset.
   4. See [these](setups/quartus/de0-nano-test-setup/README.md) De0 instructions
      for more

## Quartus

If you are installing Quartus you may encounter driver issues due to unsigned
drivers. I had to turn off driver signature enforcement (for Windows 10, see
option 2 of
[this](https://www.technipages.com/enable-disable-device-driver-signing)).

## More Resources

The main readme for the project can be found [here](README.md)

More documentation can be found [here](https://stnolting.github.io/neorv32)

[Readme for software framework](sw/README.md)