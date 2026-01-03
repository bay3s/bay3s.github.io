---
layout: post
title: "REINFORCE algorithms"
author: "Sid Chaubal"
categories: notes
tags: [rl, applied-math]
---
#### REINFORCE Algorithms
*Objective Function*
- For gradient learning algorithms, it is necessary to have a performance measure to optimise.
- A very natural one for any immediate-feedback reinforcement learning problem is the expected value of the scalar reinforcement signal that is observed during the interaction loop.
- Expected values are used to account for randomness in,
	- the environment's inputs to the agent
	- the network's choice of output corresponding to any particular input
	- the environment's choice of reinforcement values for any particular input / output pair
- The expected value of reinforcement signal cannot be agnostic of time unless the inputs to the agent and its outputs are stationary distributions, independent across time.

*Algorithm*
- Consider a network facing an associative immediate-reinforcement learning task.
- Weights are adjusted in this network following receipt of the reinforcement value *r* at each trial.
- Suppose that the learning algorithm for this network is such that at the end of each trial, every parameter $w_{ij}$ in the network is incremented by an amount given by,
$$\Delta w_{ij} = a_{ij}(r - b_{ij})e_{ij}$$
- where,
	- $a_{ij}$ is a learning rate factor
	- $b_{ij}$ is a reinforcement baseline
	- $e_{ij} = \partial \text{ln} g_i / \partial w_{ij}$ is called the characteristic eligibility of $w_{ij}$
- The characteristic eligibility is a *locally computed * “credit assignment” term further outlined in the next section, it uses only what unit $i$ knows
	- its input $x_i$,
	- its sampled output $y_i$,
	- its parameters $w_i$
- REINFORCE multiplies the character eligibility by $r-b$ (if reward is above baseline, increase the probability of the sampled behaviour else decrease it).
- Any learning algorithm of this form is called a REINFORCE algorithm.
