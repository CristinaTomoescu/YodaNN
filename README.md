# YodaNN

# Inspiration
The embedded systems evolved, and their purposes multiplied in the last couple of years. We expect our smartphones to run ML algorithms and the ASIC/FPGA entered fast the cloud processing industry. Image processing plays a role in automation and IoT. This feature can be used in medicine, security faster communication.

The inspiration was the article YodaNN: An Architecture for Ultralow Power Binary-Weight CNN Acceleration; researchers present a new architecture for embedded systems to support the performance needs in AI in the next couple of years.

# What it does
Our project consists of a simulation of an FPGA board (Nexys A7) attached to an ARMv8 processor, similar to ones in smartphones or SBCs.The processor sends the pixels to the pre-decoder. This module determines in which SCM the data should be read/written. The operations execute in parallel with the main memory for optimization.

# How I built it
As a platform, we used Vivado Webpack because it has many testing tools and a visual interface to create RTL designs. We developed the modules in Verilog. We followed the instructions and the diagrams from the article. link

# Challenges I ran into
First of all, the debugging was quite challenging because of the size of the diagram. Also, the instructions were a little unclear, but we managed to create the non-shifting version.

# Accomplishments that I'm proud of
We managed to simulate a simplified version of the image memory module from the new architecture. Also, we demonstrated that the system is faster than the standard SDRAM.

# What I learned
This weekend we learned a lot of things about embedded systems, memory, computer architecture, etc. Also, we improved our Verilog and circuit design skills.

# What's next for YodaNN
In the following period, we will improve the research on the subject and obtain an IP authorization. Also, we could collaborate with academic research teams / R&D centers from companies to build the module.
