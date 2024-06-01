---
layout: post
title:  "Dynamic Programming"
date:   22-09-2022
categories: reinforcement-learning
sub_category: dynamic-programming
---

<p>Dynamic programming refers to a collection of algorithms that can be used to compute optimal policies given a perfect model of the environment as a Markov decision process. Dynamic programming is the foundation for understanding reinforcement learning. RL methods can be seen as attempting to achieve the same results as dynamic programming but with an imperfect model fo the environment and less computation.</p>
<p>The key ideas in dynamic programming and reinforcement learning are the use of value functions to organize and structure the search for good policies. We can obtain optimal policies in a known Markov decision process using dynamic programming once we have found the optimal state value function $V^*$ and state-action value function $Q^*$ that satisfy the Bellman optimality equations:</p>

$$
\begin{aligned}
    v_*(s) & =\max _a \mathbb{E}\left[R_{t+1}+\gamma v_*\left(S_{t+1}\right) \mid S_t=s, A_t=a\right] \\
    & =\max _a \sum_{s^{\prime}, r} p\left(s^{\prime}, r \mid s, a\right)\left[r+\gamma v_*\left(s^{\prime}\right)\right] \\
    q_*(s, a) & =\mathbb{E}\left[R_{t+1}+\gamma \max _{a^{\prime}} q_*\left(S_{t+1}, a^{\prime}\right) \mid S_t=s, A_t=a\right] \\
    & =\sum_{s^{\prime}, r} p\left(s^{\prime}, r \mid s, a\right)\left[r+\gamma \max _{a^{\prime}} q_*\left(s^{\prime}, a^{\prime}\right)\right]
\end{aligned}
$$

Dynamic programming algorithms are obtained by turning Bellman equations into assignments, that is, into update rules for imrpoving approximations of the desired value functions.