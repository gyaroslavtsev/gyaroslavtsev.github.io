---
layout: post
comments: true
title: "The Binary Sketchman"
author: grigory 
date: 2016-10-07
excerpt: "This post discusses some of my recent work on linear compression for binary data." 
markdown: kramdown
image: /pics/binary-sketchman-final.png
tags: [algorithms, theory, academia, big data, compression, linear sketching]
---

In this post I will talk about some of my recent work with <a href="http://www.cis.upenn.edu/~kannan/">Sampath Kannan</a> and <a href="https://stat.mit.edu/people/elchanan-mossel/">Elchanan Mossel</a> on linear methods for binary data compression. The paper is <a href="http://eccc.hpi-web.de/report/2016/174/">available here</a>, slides from my talk at Penn are <a href="http://grigory.us/files/talks/penn16.pdf">here</a> and another talk at Columbia is <a href="http://www.cs.columbia.edu/theory/f16-theoryread.html#Grigory">coming up on Nov 21</a>.

Given very large data represented in binary format as a string of length $$n$$, i.e. $$x \in \{0,1\}^n$$ 
we are interested in a compression algorithm that can transform $$x$$ into a much shorter binary string $$y \in \{0,1\}^k$$.
Here $$k \ll n$$ so that we can achieve some non-trivial savings in space.
Moreover, if $$x$$ changes in the future we would like to be able to update our compressed version of it (without having to store the original $$x$$). 

Clearly compression introduces some loss making it impossible to recover certain properties of the original data from the compressed string.
However, if we know in advance which property of $$x$$ we are interested in then efficient compression often becomes possible.
We will model the property of interest as a binary function $$f:\{0,1\}^n \rightarrow \{-1,1\}$$ which labels all possible $$x$$'s with two labels.
So our goal will be to be able to: 1) perform this binary classification, i.e. compute $$f(x)$$ using compressed data $$y$$ only, 2) do this even if $$x$$ changes over time &ndash; updates for us will be bit flips in the coordinates of $$x$$ specified by the index of the bit that is getting flipped.

Finally, if $$x$$ is so big that it can't be stored locally and has to be divided into chunks stored across multiple machines then we will be able to compress the chunks locally and then combine them on a central server into a compressed version of the entire data &ndash; one simple round of MapReduce or whatever your favorite distributed framework is.

To make the above discussion less abstract let's consider a machine learning application &ndash; evaluating a linear classifier over binary data.
Let's say we have trained a linear classifier of the form $$sign(\sum_{i = 1}^n w_i x_i - \theta)$$ where sign is the sign function. 
Is it possible to compress $$x$$ in such a way that we can still evaluate our classifier in the scenarios described above?
Turns out we can compress the input down to $$O(\theta/m \log (\theta/m))$$ bits where $$m$$ is a parameter of the linear classifier known as its margin. Moreover, no compression scheme can do better.

# Introducing the Binary Sketchman

<div align="center"><img alt="The Binary Sketchman" src="{{site.url}}/pics/binary-sketchman-final.png"> </div>

<br>

While the setting described above may seem quite challenging it can be handled through a framework of linear sketching.
In the binary case the interpretation of linear sketching is particularly simple as our binary sketchman is just going to compute $$k$$ parities of the bits of $$x$$, say for $$k=3$$: 

$$x_4 \oplus x_2, \quad x_{42}, \quad x_{566} \oplus x_{610} \oplus x_{239} \oplus x_{57}.$$

In a matrix form this corresponds to computing $$Mx$$ where $$M$$ is a $$k \times n$$ binary matrix and the operations are performed over $$\mathbb F_2$$.
Note that now our sketch easily satisfies all the requirement above since as $$x$$ changes we can just update the corresponding parities. In the distributed case we can compute them locally and then add up on a central server.

Unfortunately the power of a deterministic sketchman who just uses a fixed set of parities is quite limited and no such sketchman can compress even a simple linear classifier down to less than $$n$$ bits.
In fact, even for the OR function $$f = x_1 \vee x_2 \vee \dots \vee x_n$$ no deterministic sketch can have less than $$n$$ bits.
So our binary sketchman will &ldquo;<a href="http://www.cs.cmu.edu/~haeupler/15859F14/">unleash the power of randomization</a>&rdquo; in his quest for a perfect sketch.
According to <a href="http://www.cs.cmu.edu/~haeupler/">Bernhard Haeupler</a> this can be quite dramatic and looks kind of like this:
<div align="center"><img width="300px" alt="The power of randomness unleashed" src="http://www.cs.cmu.edu/~haeupler/15859F14/images/posternoinf.jpg"> </div>

<br>
So our sketchman will instead pick the matrix $$M$$ randomly while the rest is the same as before.
Now the OR function is easy to handle: pick a parity over a random subset of $$\{1, \dots, n\}$$ where each coordinate is included with probability $$1/2$$.
If $$OR(x) = 1$$ then this parity catches a non-zero coordinate of $$x$$ with probability $$1/2$$ and thus evaluates to $$1$$ with probability at least $$1/4$$.
If $$OR(x) = 0$$ then the parity never evaluates to $$1$$ so we can distinguish the two cases with probability $$1 - \delta$$ using $$O(\log 1/\delta)$$ such parities.
This illustrates a more general idea &ndash; if $$f$$ is a constant function on all but $$m$$ different inputs then a sketch of size $$O(\log m + \log 1/\delta)$$ suffices.


Now for linear thresholds the high-level ideas behind this sketching process are as follows:
1) observe that any linear threshold function takes the same value on all but $$n^{O(\theta/m)}$$ inputs,
2) apply the same argument as above to obtain a sketch of size $$O(\theta/m \log n + \log 1/\delta)$$.
The only thing missing in the above argument is that we still have dependence on $$n$$.
This can be avoided if we first hash the domain reducing its size down to $$n' = poly(\theta/m)$$ which replaces $$n$$ in the above calculations giving us $$O(\theta/m \log \theta/m + \log 1/\delta)$$.
While this compression method is quite simple the remarkable fact is that it can't be improved.
Even for the simplest threshold function that corresponds to a threshold for the Hamming weight of $$x$$, i.e. $$sign(\sum_{i = 1}^n x_i - k)$$, any compression mechanism would require $$\Omega(k \log k)$$ bits as follows from <a href="http://link.springer.com/chapter/10.1007/978-3-642-32512-0_44">this work</a> by Dasgupta, Kumar and Sivakumar.
Note that it isn't assumed that the protocol is based on linear sketching &ndash; it can be an arbitrary scheme.

# The Power of Randomized Binary Sketchman

Linear sketching by itself is not a new idea and has been studied extensively in the last two decades.
See surveys by <a href="http://researcher.watson.ibm.com/researcher/view.php?person=us-dpwoodru">Woodruff</a> and <a href="http://people.cs.umass.edu/~mcgregor/">McGregor</a> on how it can be applied to problems in <a href="http://researcher.ibm.com/files/us-dpwoodru/wNow3.pdf ">numerical linear algebra</a> and <a href="http://link.springer.com/referenceworkentry/10.1007/978-3-642-27848-8_796-1">graph compression</a>.
However, this work focuses on linear sketching over large finite fields (used to represent real values with bounded precision).
Nevertheless some striking results are known about linear sketching that are applicable in our context as well.
In particular, if $$x$$ is updated through a very long (triply exponential in $$n$$) stream of adversarial updates then linear sketches over finite fields are optimal for any function $$f$$ as shown by Li, Nguyen and Woodruff <a href="https://pdfs.semanticscholar.org/bf89/98d76741f3ee7b4ba1f82524353e7083c3b5.pdf ">here</a> in STOC'14.

As our paper shows the same result holds for much shorter random streams of length $$\tilde O(n)$$ in a simple model where each update flips uniformly at random chosen coordinate of $$x$$.
In other words binary sketching is optimal if in the end of the stream the input $$x$$ is uniformly distributed.
The proof of this fact is quite technical and relies on a notion of <i>approximate Fourier dimension</i> for Boolean functions that we use to characterize binary sketching under the uniform distribution &ndash; check the paper for details if you are interested.
Whether the same result holds for short (length $$\tilde O(n)$$, say) adversarial streams is the main open question left open.



