03.06.2014

Yves Hwang
http://macyves.wordpress.com

selenium-2step
==============

2 step way to get selenium grid, selenium node and a headless firefox going. init.d script included.

A simple selenium template for 1 min setup for to get Selenium grid and a node going, with all inclusive init.d scripts.

The Vagrant file will install Selenium, Firefox and Xvfb. Firefox will run headless by default.

Steps
=====
1. Vagrant up selenium

2. Point your tests to http://localhost:4444/wd/hub and enjoy.
