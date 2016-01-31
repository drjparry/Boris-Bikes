#Boris Bikes challenge - Week 2 Maker's Academy

##What is it

Boris Bikes is a bike tracking program that recreates the Boris Bikes bike hire system in London. It allows users to take and replace bikes in docking stations and report them broken when necessary. It also allows broken bikes to be picked up by vans, taken to a garage to be fixed, and once fixed returned to a docking station. 

This challenge was complete in conjunction with Russell Vaughan, Godfrey Chiu, Reisse Johnson, Yan Yi, and Frazer Watson. 

##Objectives:

Main objectives this week were to practice Pair Programming, Test Driven Developement using RSPEC, and Object Oriented programming best practices such as the Single Responsibilty Principle. 

##Approach

Bike Class: responsible for creating bikes
Docking Station Class: responsible for docking and organising bikes and reporting them broken
Van class: responsible for picking up broken bikes and delivering them to garages to be fixex
Garage class: responsible for fixing bikes

##Installation and use

```
2.2.1 :001 > require './lib/docking_station'
 => true 
2.2.1 :002 > require './lib/van'
 => true 
2.2.1 :003 > docking_station = DockingStation.new
 => #<DockingStation:0x007fc05a8b5a70 @bikes=[], @capacity=20> 
2.2.1 :004 > bike = Bike.new
 => #<Bike:0x007fc05a19a0b0 @working=true> 
2.2.1 :005 > van = Van.new
 => #<Van:0x007fc05a18ac28 @bike_hold=[]> 
2.2.1 :006 > garage = Garage.new
 => #<Garage:0x007fc05a17a4b8 @broken_bikes=[], @fixed_bikes=[]> 
2.2.1 :007 > docking_station.dock(bike)
 => [#<Bike:0x007fc05a19a0b0 @working=true>] 
2.2.1 :008 > docking_station.release_bike
 => #<Bike:0x007fc05a19a0b0 @working=true> 
2.2.1 :009 > docking_station.bikes
 => [] 
2.2.1 :010 > bike.report_broken
 => false 
2.2.1 :011 > bike.working
 => false 
2.2.1 :012 > docking_station.dock(bike)
 => [#<Bike:0x007fc05a19a0b0 @working=false>] 
2.2.1 :013 > docking_station.bikes
 => [#<Bike:0x007fc05a19a0b0 @working=false>] 
2.2.1 :014 > van.collect(docking_station)
 => [#<Bike:0x007fc05a19a0b0 @working=false>] 
2.2.1 :015 > van.deliver(garage)
 => [] 
2.2.1 :016 > garage.fix_bikes
 => [#<Bike:0x007fc05a19a0b0 @working=true>] 
2.2.1 :017 > van.collect(garage)
 => [] 
2.2.1 :018 > van.deliver(docking_station)
 => [] 
2.2.1 :019 >  docking_station.bikes
 => [#<Bike:0x007fc05a19a0b0 @working=true>] 
