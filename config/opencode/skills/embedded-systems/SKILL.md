---
name: embedded-systems
description: Use when developing firmware, hardware abstraction layers, or real-time systems for embedded devices.
---

# Embedded Systems

## When to Use This Skill
- Writing firmware for microcontrollers (ARM, RISC-V, AVR)
- Building hardware abstraction layers (HALs) for portability
- Implementing real-time scheduling with FreeRTOS or Zephyr
- Debugging with JTAG/SWD probes

## Workflow
1. Select the target MCU and development board
2. Set up the toolchain: compiler, debugger, and flash tool
3. Write a minimal main loop: init peripherals, then enter the main loop
4. Implement drivers using register-level access or HAL libraries
5. Add real-time tasks with FreeRTOS: create tasks, set priorities, use queues
6. Debug with JTAG: set breakpoints, inspect registers, step through code
7. Profile power consumption and optimize sleep modes
8. Test on hardware, not just simulation

## Rules
- Test on real hardware — simulation misses timing and electrical issues
- Use volatile for all hardware registers and shared interrupt variables
- Keep ISRs short — defer processing to the main loop or a task
- Set stack sizes carefully — stack overflow causes hard faults
- Use static analysis (PC-lint, cppcheck) for safety-critical code
- Document hardware assumptions in comments
