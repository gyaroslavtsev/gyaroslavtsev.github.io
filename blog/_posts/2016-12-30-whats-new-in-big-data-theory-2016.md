---
layout: post
comments: true
title: "What's New in the Big Data Theory 2016"
author: grigory 
date: 2016-12-30
excerpt: "Collection of interesting papers on algorithms for big data from 2016." 
markdown: kramdown
image: /pics/o2016.png
tags: [algorithms, theory, academia, big data, research]
---

<div align="center"><img alt="Happy 2017!" src="{{site.url}}/pics/o2016.png"> </div>

<br>

This post will give an overview of papers on theory of algorithms for big data that caught my attention in 2016.
The basic rule that I used when making the list was whether I can see these results being included into some of the advanced graduate classes on algorithms in the future.
Also, while I obviously can't include my own results here, among my own 2016 papers my two personal favorites are <a href="http://grigory.us/files/soda16.pdf">tight bounds on space complexity of computing approximate matchings in dynamic streams</a> (with S. Assadi, S. Khanna and Y. Li) and the <a href="http://eccc.hpi-web.de/report/2016/174/">$$\mathbb F_2$$-sketching paper</a> (with S. Kannan and E. Mossel and some special credit to Swagato Sanyal who subsequently improved the dependence on error in one of our main theorems). 

It's been a great year with several open problems resolved, old algorithms improved and new lines of research started.
All papers discussed below are presented in no particular order and their selection is clearly somewhat biased towards my own research interests.

<h2>Maximum Weighted Matching in Semi-Streaming</h2>
Sweeping both the best paper and the best student paper awards at the upcoming 28th ACM Symposium on Discrete Algorithms is a paper on semi-streaming algorithms for maximum weighted matching by graduate students Ami Paz and Gregory Schwartzman.
In semi-streaming we are given one pass over edges of an $$n$$-vertex and only $$\tilde O(n)$$ bits of space.
It is easy to get a 2-approximation to the maximum matching by just maintaining the maxim**al** matching of the graph.
However, for weighted graphs maximal matching no longer guarantees a 2-approximation.

A long line of work has previously given constant factor approximations for this problem and finally we have a $$2+\epsilon$$-approixmation. 
It is achieved via a careful implementation of the primal-dual algorithm for matchings in the semi-streaming setting.
It may seem somewhat surprising that primal-dual hasn't been applied to this problem before since in the area of approximation algorithms it is a pretty standard way of reducing weighted problems to their unweighted versions, but the exact details of how to implement primal-dual in the streaming setting are quite delicate. I couldn't find a version of this paper online so the best bet might be to wait for the SODA proceedings.

Now the big open question is whether one can beat the 2-approximation which is open even in the unweighted case.

<h2>Shuffles and Circuits</h2>
Best paper award at the 28th ACM Symposium on Parallelism in Algorithms and Architectures went to ''<a href="http://theory.stanford.edu/~sergei/papers/spaa16-mrshuffle.pdf">Shuffles and Circuits</a>'', a paper by Roughgarden, Vassilvitskii and Wang.
This paper emphasizes the difference between rounds of MapReduce and depth of a circuit.
Because some of the machines can choose to stay silent between the rounds a round of MapReduce can be more complex than a layer of a circuit as the machines sending input to the next round might depend on the original input data. 
The paper shows that nevertheless the standard circuit complexity ''degree bound'' can be applied to MapReduce computation.
I.e. any Boolean function whose polynomial representation has degree $$d$$ requires $$\Omega(\log_s d)$$ rounds of MapReduce using machines with space $$s$$.
This implies an $$\Omega(\log_s n)$$ lower bound on the number of rounds for computing connectivity of a graph.
The authors also make explicit a connection between the MapReduce model and $$NC^1$$ (see definition <a href="https://en.wikipedia.org/wiki/NC_(complexity) ">here</a>) which implies that improving lower bounds beyond $$\log_s n$$  for polynomially many machines would imply separating $$P$$ from $$NC^1$$.


<h2>Beating Counting Sketches for Insertion-Only Streams</h2>
Both <a href="http://www.cs.princeton.edu/courses/archive/spring04/cos598B/bib/CharikarCF.pdf ">CountSketch</a> and <a href="https://en.wikipedia.org/wiki/Count%E2%80%93min_sketch">Count-Min Sketch</a>, which are textbook approximate data structures for storing very large dynamically changing numerical tables in small space, have been improved this year under the assumption that data in the table is only incremented.
These improvements are for the most common application of such sketches to ``heavy hitters''-- the task of recovering largest entries from the table approximately. 
For CountSketch see <a href="http://researcher.watson.ibm.com/researcher/files/us-dpwoodru/bciw16.pdf">the paper</a> by Braverman, Chestnut, Ivkin, Woodruff from STOC'16 and for CountMin Sketch <a href="https://arxiv.org/abs/1603.00213">the paper</a> by Bhattacharyya, Dey and Woodruff from PODS'16.



<h2>Optimality of the Johnson-Lindenstrauss Transform</h2>
Two papers by <a href="https://arxiv.org/pdf/1609.02094v1.pdf ">Green Larsen and Nelson</a> and by <a href="http://www.cs.tau.ac.il/~nogaa/PDFS/compression3.pdf">Alon and Klartag</a> have resolved the question of proving optimality of the Johnson-Lindenstrauss transform.
Based on doing a projection on random low-dimensional subspace JL-transform is the main theoretical tool for dimensionality reduction of high-dimensional vectors.
As these papers show no low-dimensional embedding and furthermore no data structure can achieve better bit complexity than $$\Theta(n \log n/\epsilon^2)$$ for $$(1 \pm \epsilon)$$-approximating all pairwise distances between $$n$$ vectors in Euclidean space (for a certain regime of parameters).
This matches the Johnson and Lindenstrauss upper bound and improves an old lower bound of $$\Omega\left(\frac{n \log n}{  \epsilon^2 \log 1/\epsilon}\right)$$ due to Alon.
Even though Alon's argument is significantly simpler getting an optimal lower bound is a very nice achievement.



<h2>Fast Algorithm for Edit Distance if It's Small</h2>

<a href="https://en.wikipedia.org/wiki/Edit_distance ">Edit distance</a> is one of the cornerstone metrics of text similairity in computer science. It can be computed in quadratic time using standard dynamic programming which is optimal assuming SETH due to the <a href="https://arxiv.org/abs/1412.0348 ">result of Backurs and Indyk</a>.
Edit distance also has a number of applications including comparing DNAs in computational biology.
In these applications it is usually reasonable to assume that edit distance is only interesting if it is not too large.
Unfortunately, this doesn't help speed up the standard dynamic program.
A series of papers, including two papers from this year by <a href="http://iuuk.mff.cuni.cz/~koucky/papers/editDistance.pdf ">Chakraborty, Goldenberg and Koucky</a> (STOC'16) and 
<a href="http://homes.soic.indiana.edu/qzhangcs/papers/focs16-ED.pdf ">Belazzogui and Zhang</a> lead to the following result: sketches of size $$poly(K \log n)$$ bits suffice for computing edit distance $$\le K$$. Such sketches can be applied not just in centralized but also in distributed and streaming settings making it possible to compress input strings down to size that (up to logarithmic factors) only depends on $$K$$.

<h2>Tight Bounds for Set Cover in Streaming</h2>
Set Cover is a surprisingly powerful abstraction for a lot of applications that involve providing coverage for some set of terminals. 
Given a collection of sets $$S_1, \dots, S_m \subseteq [n]$$ the goal is to find the smallest cardinality subcollection of these sets such that their union is $$[n]$$, i.e. all of the underlying elements are covered.
In approximation algorithms a celebrated greedy algorithm gives an $$O(\log n)$$-approximation for this problem. 
In streaming there has been a lot of interest lately in approximating classic combinatorial optimization problems in small space with Set Cover being one of the main examples.
For an overview from last year check Piotr Indyk's <a href="https://www.youtube.com/embed/_4mM1UGI9Dg?list=PLqxsGMRlY6u659-OgCvs3xTLYZztJpEcW ">talk</a> from the <a href="http://grigory.us/mpc-workshop-dimacs.html ">DIMACS Workshop on Big Data and Sublinear Algorithms</a>. 

As <a href="http://www.seas.upenn.edu/~sassadi/stuff/papers/tbfsscotscp-conf.pdf ">this STOC'16 paper</a> by Assadi, Khanna and Li shows savings in space for streaming Set Cover can only be proportional to the loss in approximation.  In particular, if we are interested in computing Set Cover which is within a multiplicative factor $$\alpha$$ of the optimum then:
1) for computing the cover itself space $$\tilde \Theta(mn/\alpha)$$ is necessary and sufficient,
2) for just esimating the size space $$\tilde \Theta(mn/\alpha^2)$$ is necessary and sufficient.

<h2>Polynomial Lower Bound for Monotonicity Testing</h2>
Finally a polynomial lower bound has been shown for adaptive algorithms for testing monotonicity of Boolean functions $$f \colon \{0,1\}^n \rightarrow \{0,1\}$$.
The lower bound implies that any algorithm that can tell whether $$f$$ is monotone or differs from monotone on a constant fraction of inputs has to query at least $$\tilde \Omega(n^{1/4})$$ values of $$f$$. 
This result is due to <a href="https://arxiv.org/abs/1511.05053 ">Belovs and Blais</a> (STOC'16) and is in contrast with the upper bound of $$\tilde O(\sqrt{n})$$ by Khot, Minzer and Safra from last year's FOCS.
Probably the biggest result in property testing this year.

<h2>Linear Hashing is Awesome</h2>
While ''<a href="http://ieee-focs.org/FOCS-2016-Papers/3933a345.pdf ">Linear Hashing is Awesome</a>'' by Mathias B&#xe6;k Tejs Knudsen doesn't fall into the traditional ''sublinear algorithms for big data'' category this paper still has some sublinear flavor because of its focus on very fast query times.
Linear hashing is a classic hashing scheme 
$$h(x) = ((ax + b) \mod p) \mod m$$ 
where $$a,b$$ are random. It is very often used in practice and discussed extensively in CLRS.
This paper proves that linear hashing <strike>is awesome</strike> results in expected length of the longest chain of only $$O(n^{1/3})$$ compared to the previous simple bound of $$O(\sqrt{n})$$.

Finally, this paper also decisively wins my ''Best Paper Title 2016'' award. 

<h2>Looking forward to more cool results in 2017!</h2>
There has been a lot of great results in 2016 and it's hard to mention all of them in one post and I certainly might have missed some exciting papers. Here is a quick shout out to some other papers that were close to making the above list:
<ul>
<li><a href="https://arxiv.org/abs/1507.04299 ">Tight Bounds for Data-Dependent LSH</a> by Andoni and Razenshteyn from SoCG'16.</li>
<li><a href="http://arxiv.org/abs/1603.05346 ">Optimal Quantile Estimation in Streams</a> by Karnin, Lang and Liberty from FOCS'16.
</li>
</ul>

Happy 2017!



