# MATLAB Fall 2015 – Research Plan (Template)
(text between brackets to be removed)

> * Group Name: traffic
> * Group participants names: Sebastian Honegger, Filip Meier
> * Project Title: Sihlstrasse

## General Introduction

The city of Zurich planing to change one specific part of the sihlstrasse in a pedestrian area. The idea is to make this area more comfortable for the visitors of the city center and it should be also an upgrade for the restaurants and shops around this area.
The changement will have a big impact for the traffic because there will be one track less than before.
Our goal will be to analize the impact for the traffic in this area and the neigbourhood streets. We want to simulate the highest volume of traffic for this new street situation with one track less.

The question is that we want to know if this changement increase the traffic jam for this area and what is the impact for the neigbourhoodstreets.
(States your motivation clearly: why is it important / interesting to solve this problem?)
(Add real-world examples, if any)
(Put the problem into a historical context, from what does it originate? Are there already some proposed solutions?)

## The Model

We want to simulate the traffic for this area with the four steps of the classical urban transportaion planning system.

The four steps are:
- Trip generation determines the frequency of origins or destinations of trips in each zone by trip purpose, as a function of land uses and household demographics, and other socio-economic factors.
- Trip distribution matches origins with destinations, often using a gravity model function, equivalent to an entropy maximizing model. Older models include the fratar model.
- Mode choice computes the proportion of trips between each origin and destination that use a particular transportation mode. (This modal model may be of the logit form, developed by Nobel Prize winner Daniel McFadden.)
- Route assignment allocates trips between an origin and destination by a particular mode to a route. Often (for highway route assignment) Wardrop's principle of user equilibrium is applied (equivalent to a Nash equilibrium), wherein each driver (or group) chooses the shortest (travel time) path, subject to every other driver doing the same.The difficulty is that travel times are a function of demand, while demand is a function of travel time, the so-called bi-level problem. Another approach is to use the Stackelberg competition model, where users ("followers") respond to the actions of a "leader", in this case for example a traffic manager. This leader anticipates on the response of the followers.



## Fundamental Questions

First of all the goal is for us to understand the classical urban transportation planning system, and that we get a good simulation of the traffic.
The question which we want to have answered are:
- Is the street still large enough for highest number of cars per hour?
- What is the impact to the neigbourhood streets? Traffic jam etc.?

## Expected Results

(What are the answers to the above questions that you expect to find before starting your research?)


## References 

- https://en.wikipedia.org/wiki/Transportation_forecasting
- https://github.com/GkonosCharalampos/Zurich-Traffic-Group



## Research Methods

(Cellular Automata, Agent-Based Model, Continuous Modeling...) (If you are not sure here: 1. Consult your colleagues, 2. ask the teachers, 3. remember that you can change it afterwards)


## Other

(mention datasets you are going to use)
