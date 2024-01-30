# DESCRIPTION

This is a simple model designed for SPI communication protocol. It includes 1 master and 4 slaves, each slave is selected by external input `select` given by the user. Only 1 slave can be chosen at the same time, so if the user chooses 2 or more slaves, the communication between master and slaves will be disabled.
