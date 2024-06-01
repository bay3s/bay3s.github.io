---
layout: post
title:  "Markov Processes"
date:   03-09-2022
category: reinforcement-learning
sub_category: foundations
---

# Markov Property
The Markov property is used to formalise the sequential decision-making problem in reinforcement learning as a Markovian process. This means that the next state depends only on the current state and the actions available within it. A discrete-time stochastic control process is Markovian if and only if:

$$
P(\omega_{t+1} | \omega_t, a_t) = P(\omega_{t+1} | \omega_t, a_t, ... \omega_0, a_0)
$$

and,

$$
P(r_{t} | \omega_t, a_t) = P(r_t | \omega_t, a_t, ... \omega_0, a_0)
$$

# Formalization
A Markov decision process (MDP) can be represented as a 5-tuple $(S, A, T, R, \gamma)$ where: 

- S is the state space
- A is the action space
- $T: S \times A \times S \rightarrow [0, 1]$ is the transition function, a set of conditional transition probabilities between states
- $R: S \times A \times S \rightarrow R$ is the reward function, where R is a continuous set of possible rewards in a range $R_{max} \in \mathcal{R}^+$

# Observability
The system is fully observable in an MDP, which means that the observation is the same as the state of the environment $w_t = s_t$. In contrast, in partially observable environments, the agent cannot directly observe the true state of the environment. Instead, it receives observations that provide fractional information about the state. 

This distinction determines the complexity of the decision-making process, as full observability simplifies the agent's task of identifying the current state, while partial observability requires the agent to maintain a belief or estimate of the state based on its actions and observations.
