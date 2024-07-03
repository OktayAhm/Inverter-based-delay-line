# Inverter-based-delay-line

## Overview
This repository contains the design, simulation, and optimization of a high-precision tunable delay line with a 7-bit resolution. The project involves creating standard and low-power versions of the delay line, aiming to reduce power consumption and improve linearity.

## Project Goals
* Design a tunable delay line with a resolution of 7 bits.
* Achieve unit delay between 10 and 20 ps.
* Minimize nonlinearity: Ensure changing the digital control code by 1 LSB consistently changes the delay by the same amount (∆tu).
* Reduce power consumption.
* Equalize delays for rising and falling edges.

## Contents
* Schematics: Includes designs for inverters, multiplexers, AND gates, complete delay lines and testbenches.
* Simulation Scripts: Verilog-A and MATLAB scripts for testing and analysis.
* Plots: DNL, INL, and power consumption plots for both standard and low-power designs.
* Reports: Detailed project report and presentation slides.

## Design Components
### Inverters
* Designed to create unit delays.
* Two inverters used to achieve each unit delay.
### Multiplexers (MUX)
* Used to select different delay paths based on control bits.
* Optimized for minimal propagation delay.
## AND Gates
* Integrated into the low-power design to enable/disable inverters, thereby saving power.
* Ensures only necessary inverters are active, reducing overall power consumption.
  
## Simulations
### Pre-Layout Simulations
* Conducted initial simulations to verify the functionality and performance of the design.
* Generated DNL and INL plots to assess linearity.
### Post-Layout Simulations
* Performed detailed simulations including parasitic extractions.
* Verified the layout design against schematic specifications.
* Analyzed power consumption and linearity in the final design.
  
## Power Optimization
* Implemented AND gates to selectively disable inactive inverters, significantly reducing power usage.
* Achieved consistent power consumption improvements across various configurations.
  
## Results
### Standard Design
* Demonstrated precise delay control with acceptable linearity.
* Higher power consumption due to all inverters being active.
### Low Power Design
* Improved power efficiency by enabling only necessary inverters.
* Achieved better or comparable linearity compared to the standard design.
