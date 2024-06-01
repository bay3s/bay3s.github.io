---
layout: post
title:  "Reinforcement Learning"
date:   02-09-2022
category: reinforcement-learning
sub_category: foundations
---

# Reinforcement Learning
In reinforcement learning, an agent interacts with an environment through actions based on its policy. The policy $\pi$ is a function mapping states $s_t \in \mathcal{S}$ to actions $a_t \in \mathcal{A}$, and may be stochastic or deterministic. For every state, a deterministic policy selects a single action, while a stochastic policy outputs a probability distribution from which an action is sampled. A policy can be expressed as $\pi(s): \mathcal{S} \rightarrow \mathcal{A}$ in the deterministic case, and $\pi(s, a): \mathcal{S} \times \mathcal{A} \rightarrow \left[0, 1\right]$ giving the probability of choosing action an $a \in \mathcal{A}$ in state $s \in \mathcal{S}$ in the stochastic case.
# Optimization Objective
At $=0$, a starting environment state $s_0 \in \mathcal{S}$ is sampled from the initial state distribution $\rho_0$. At each time step $t$, the agent infers an action $a_t \in \mathcal{A}$ to take given $s_t \in \mathcal{S}$ based on its policy $\pi$. The agent's action $a_t$ influences the environment, resulting in a state transition from $s_t$ to $s_{t+1} \in \mathcal{S}$, and the agent receives a scalar reward $r_t \in \mathbb{R}$. A trajectory is a chronological sequence of interactions $\tau = \{s_0, a_0, r_0, s_{1}, ...\}$ starting from the initial state $s_0$. The discounted return of a trajectory is computed as

\begin{equation}
    R(\tau) = \sum_{t=0}^{\infty} \gamma^t \space r_t
\end{equation}

where the discount factor $\gamma \in [0, 1)$ downweights rewards further out in the future so that information at the present time is given more importance. The objective in reinforcement learning is to find a policy $\pi$ that maximizes expected returns over possible trajectories and can be expressed as:

\begin{equation}
    \max_\pi \mathbb{E}_\tau \left[R(\tau) \mid \pi \right]
\end{equation}

# $V$ Function
The value function gives the expected return $V^{\pi}(s): S \to R$ for a given state s defined as:

$$
V^\pi(s) = \mathbb{E}[\sum_{k=0}^{\infty}\gamma^K r_{t+k} | s_t = s, \pi]
$$

From the definition of the expected return, the optimal expected returns is defined as:

$$
V^*(s) = \max_{\pi \in \mathbb{\pi}} V^{\pi}(s)
$$

# $Q$ Function

The Q-value function defines the goodness of a given state-action pair and is defined as:

$$
Q^\pi(s, a) = \mathbb{E}[\sum_{k=0}^{\infty}\gamma^K r_{t+k} | s_t = s, a_t = a, \pi]
$$

Similar to the V-value function, the optimal Q-value function is defined as:

$$
Q^*(s, a) = \max_{\pi \in \mathbb{\pi}} Q^{\pi}(s, a)
$$

The optimal policy can be directly obtained from the optimal Q-value function $Q^*(s, a)$.


**Advantage Function**
The advantage function describes how good an action a is compared to the expected return when following directly policy $\pi$ and is defined as:

$$
A^\pi(s, a) = Q^\pi(s, a) - V^\pi(s)
$$

# Model-based & Model-free Approaches
- _Model-free RL_:
  - A representation of a value function, which predicts how good each state or each state/action pair is in terms of expected future rewards.
  - A direct representation of the policy, which can be either $\pi(s)$ for deterministic policies or $\pi(s, a)$ for stochastic policies.
- _Model-based RL_: 
  - A model of the environment is used in conjunction with a planning algorithm to predict future states and rewards based on potential actions.
- _Hybrid Approaches_: 
  - They use a combination of model-free and model-based approaches to improve performance and efficiency.
