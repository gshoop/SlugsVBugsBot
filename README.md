# __State Machine Implementation for Robot Behavior for Slugs Vs. Bugs II challenge__

- Collaboration with Luis Carvajal and Yinhe Wang

## __Background__

This challenge was provided in the course _ECE 118 - Mechatronics Design_ at the University of California, Santa Cruz during the Fall quarter of 2021 (_11/2021 - 12/2021_). Student teams of 3 were challenged with the task of designing an autonomous robot within 4 weeks that completes a series of tasks.

### __The challenge__

The robot was challenged to be capable of navigating a 8' x 8' field that is outlined with black tape completely autonomously and search the field for 1 of 3 randomly placed 10" tall three-sided vat towers with three holes placed on each side of the tower at 8" high. These towers are illuminated from the top with a 2 kHz IR transmitter.

The next task is for the robot to traverse the three sides of the tower and search for the correct side of the tower which is indicated by a 25 kHz track wire lined along the inside of the correct side. The robot must detect this side and deposit a ping pong ball into the correct one of three holes on that side which is indicated by black tape directly underneath the hole.

## __The Design__