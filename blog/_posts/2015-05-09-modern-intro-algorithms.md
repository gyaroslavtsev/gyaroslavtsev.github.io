---
layout: post
comments: true
title: "Modern Algorithms or The Brave New O of the Big N"
author: grigory 
date: 2015-05-09
excerpt: "In this post I offer some suggestions about possible changes in the modern algorithms curriculum." 
markdown: kramdown
image: /pics/oofn.jpg
tags: [algorithms, teaching, theory, academia]
---


<h1>The Role of Algorithms</h1>

Driven by booming enrollments in Computer Science, the first theoretical class that the majors usually take, &ldquo;Introduction to Algorithms&rdquo;, is also experiencing unprecedented growth.
At top schools this is evidenced by the fact that dozens of TAs are now employed to teach this class to several hundreds of students each year. 
There are multiple reasons making &ldquo;Introduction to Algorithms&rdquo; one of the cornerstones of the Computer Science curriculum. One of the key roles that it plays for many students is serving as their first introduction into fully rigorous analysis
of the performance of computer programs.
It teaches the students how to use the rigorous mathematical lens to see abstract structure behind the data that they haven't seen before. 

<div align="center"><img alt="The Brave New O of N" src="{{site.url}}/pics/oofn.jpg"> </div>

Furthermore, it introduces a basic set of tools that can be used to process large amounts of data regardless of any assumptions about the generation process used to create it (worst-case analysis).
Unlike other popular approaches to algorithm design such as machine learning and its newest incarnation called &ldquo;deep learning&rdquo;, the core algorithms curriculum gives solutions which use no training data and behave robustly under
any changes in their input.


<h1>What Should the &ldquo;Introduction to Algorithms&rdquo; Look Like?</h1>
The question asked here is provocative and doesn't have a hard and fast answer for multiple reasons.
First, the answers vary quite a bit depending on who you ask. I will illustrate this point later by comparing the curricula used at some of the top schools.
Hence, I will stress first that all ideas expressed below are a matter of my personal taste.
From this point on all opinions expressed in this post are about how I would teach introduction to algorithms rather than suggesting the reader to do the same.
In fact, I believe that in the U.S. and all over the world we are very lucky to have enough diversity to create curricula which look quite different from each other thus giving students more options.
While the most fundamental basics are roughly the same, the choice of advanced topics is often driven by the instructor's research interests.
For those interested in pursuing a research career this gives an opportunity to get involved in research early on.

Second, unlike more traditional subjects such as maths and physics, the subject itself is rapidly evolving.
My rough estimate from looking at the history would be that once every 10-15 years a significant part of the curriculum has to undergo a shake-up. 
This is another reason why having an instructor who is an active researcher in the area is critical for keeping up with developments in the field.
Stale curricula can even sometimes create <a href="http://nlpers.blogspot.com/2014/10/machine-learning-is-new-algorithms.html">room for doubt</a> in whether algorithms are still relevant or some other class can be used as a replacement.
While there is <a href="http://blog.geomblog.org/2014/10/algorithms-is-new-algorithms.html ">hardly any doubt</a> that rigorous analysis of algorithms will be relevant for many years to come, concerns such as the one above can be seen as a call for action. 

Despite the two fundamental challenges discussed above, I believe that there are some guiding principles that can be used to determine the choice of topics for the introductory classes.
The first one is simplicity and clarity of the underlying ideas.
The second one is them passing the test of time and being implemented and used in a variety of software packages. This process serves as a &ldquo;natural selection&rdquo; for algorithmic ideas.
A 10-15 year period is usually enough for the hype around hot topics to settle down. 
Finally, universality and robustness to the choice of a particular model or architecture also play an important role.
This is probably the hardest principle to use since it involves predicting the future.

<div align="center"><img alt="The Future of Algorithms?" src="{{site.url}}/pics/the-graduate-plastics.jpg"> </div>
<br>

<h1>The Shoulders of Giants</h1>
<h2>Books</h2>
Now let's briefly discuss the existing literature and curricula at the top schools.

<div align="center"><img alt="CLRS" src="{{site.url}}/pics/clrs3.jpeg"> </div>

Probably the most canonical textbook on algorithms is the MIT book known as <a href="http://www.amazon.com/gp/product/0262033844/ref=s9_simh_gw_p14_d3_i2?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=desktop-1&pf_rd_r=0MCC9YB55GWMGAKXT26S&pf_rd_t=36701&pf_rd_p=2079475242&pf_rd_i=desktop">CLRS</a> (first published in 1990, the most recent third edition came out in 2009).
I've got my first edition in high school back in 2003.
At the time this book was quite a breakthrough compared to the previous generation of textbooks such as <a href="http://www.amazon.com/Data-Structures-Algorithms-Alfred-Aho/dp/0201000237 ">Aho-Hopcroft-Ullman</a>'s and <a href="http://www.amazon.com/gp/product/032157351X/ref=pd_lpo_sbs_dp_ss_3?pf_rd_p=1944687702&pf_rd_s=lpo-top-stripe-1&pf_rd_t=201&pf_rd_i=0201000237&pf_rd_m=ATVPDKIKX0DER&pf_rd_r=0W96SX509C0HBREXWSN3 ">Sedgewick</a>'s. 
I was heavily influenced by CLRS, subsequently using it to teach introductory classes for high school students in mid-late 00's.

The fact that almost all algorithms from CLRS can be implemented as is using general purpose programming languages (C++, Java, Python) also made it very popular in the programming community including the competitive part of it.
E.g. in the Russian summer camps for high school students CLRS formed the core of the B/C-level classes while A/B-level classes cover topics roughly similar to Erik Demaine's <a href="http://courses.csail.mit.edu/6.854/current/ ">Advanced Algorithms</a> and <a href="https://courses.csail.mit.edu/6.851/spring14/ ">Advanced Data Structures</a>. 
I don't have the data but will be very surprised if CLRS didn't sell more copies than any other algorithms textbook ever published.
A recent testament to the popularity of CLRS is the fact that its first author <a href="http://www.quora.com/Thomas-Cormen-1">Thomas Cormen</a> is about as popular on <a href="http://quora.com/">Quora</a> as the <a href="http://www.quora.com/Barack-Obama">President of the United States</a> (this fact probably tells more about the kind of people who are active on Quora though).

Over years multiple alternatives have emerged, among which I would like to mention two: the Berkeley-UCSD &ldquo;<a href="http://www.amazon.com/Algorithms-Sanjoy-Dasgupta/dp/0073523402/ref=sr_1_1?ie=UTF8&qid=1431203159&sr=8-1&keywords=papadimitriou+vazirani">Algorithms</a>&rdquo; by Dasgupta, Papadimitriou and Vazirani and the Cornell's &ldquo;<a href="http://www.amazon.com/Algorithm-Design-Jon-Kleinberg/dp/0321295358/ref=sr_1_1?ie=UTF8&qid=1431203094&sr=8-1&keywords=kleinberg+tardos ">Algorithm Design</a>&rdquo; by Kleinberg and Tardos.
Both books were published in 2005-06 and to the best of my knowledge second editions aren't available yet.
One of the main differences between these newer books and CLRS is their concise style and focus on high-level ideas rather than low-level details. 
However, all the books discussed above are starting to show their age.
A litmus test is the fact that they either don't mention <a href="http://en.wikipedia.org/wiki/Chernoff_bound">Chernoff bounds</a> at all or mention them as an exercise or in one of the last chapters where they are barely used. I would expect a modern algorithms textbook to introduce concentration bounds early on and then use them heavily throughout the course.

Recently among textbooks I haven't seen any strong newcomers, which might be partly due to the fact that books are somewhat passe these days (the only notable exception off the top of my head is a recent book &ldquo;<a href="http://www.cs.cornell.edu/jeh/book11April2014.pdf ">Foundations of Data Science</a>&rdquo; by Hopcroft and Kannan which is very interesting but has a somewhat different goal so I don't see how an introductory algorithms class can be based solely on it).

<h2>Courses</h2>
In search for a modern algorithms curriculum let's now turn to the classes taught recently at some of the schools in the U.S. whose class pages are publicly available.
At some schools different instructors teach the class in different years, so here I just picked one at random to save space.
Certain topics appear consistently in all of these classes (sorting/median, hashing, dynamic programming, greedy algorithms, cuts and flows, BFS/DFS, union-find, MST, FFT, shortest paths, etc.) so I will focus on the differences which make these classes unique.

<ul>
<li> At MIT the &ldquo;Design and Analysis of Algorithms&rdquo; class is taught by Erik Demaine. 
Here is the <a href="http://stellar.mit.edu/S/course/6/sp15/6.046J/materials.html ">most recent page</a>.
Erik is one of the best living experts on data structures. No surprise his class is a little heavy on cool data structures, including Van Emde Boas trees, Skip Lists and Range Trees which aren't usually present in a typical algorithms curriculum.
</li>
<li>
At CMU the &ldquo;Algorithms&rdquo; class was recently taught by Anupam Gupta and Danny Sleator, <a href="https://www.cs.cmu.edu/~15451/schedule.html">page here</a>.
This is a very interesting class where the instructors made a great effort including some modern topics such as linear programming, zero-sum games, streaming algorithms for big data, online algorithms, machine learning, gradient descent together with some advanced data structures (splay trees and segment trees). 
</li>
<li>At Berkeley the class was recently taught by David Wagner, <a href="http://www-inst.eecs.berkeley.edu/~cs170/fa14/ ">page here</a>.
The class is based on the DPV book and also serves as an introduction into Theoretical Computer Science (primarily because it discusses in detail NP-completeness, which is either not present in other classes or only mentioned briefly).
The non-standard topics include an intro to machine learning, streaming algorithms (CountMin sketch) and PageRank.
</li>
<li>
At Cornell the class was recently taught by Eva Tardos and David Steurer, <a href="http://www.cs.cornell.edu/courses/CS4820/2015sp/lectures/ ">page here</a>.
Not surprisingly, the class is heavily KT-based.
Among unusual topics there is a lot of NP-hardness and computability (Turing machines, Church-Turing, undecidability, etc.) + a large module on approximation algorithms.
Modern topics include Nash equilibria, best expert algorithm (multiplicative weights) and stable matching.
Overall, this class has a strong bias towards foundations and approximation algorithms + an AGT/learning spin to it.
</li>
<li> At Stanford the class is taught this semester by Virginia Williams, <a href="http://web.stanford.edu/class/cs161/syllabus.html">page here</a>.
This is a traditional CLRS-based class. Since Stanford is on a quarter system this class is shorter than others. For more advanced algorithms courses at Stanford see <a href="http://web.stanford.edu/class/cs168/index.html">CS168</a>, <a href="http://theory.stanford.edu/~tim/cs261/cs261.html ">CS261</a>, <a href="http://theory.stanford.edu/~virgi/cs267/">CS267</a> and <a href="http://theory.stanford.edu/~virgi/cs367/index.html ">CS367</a>. In particular, CS168, "<a href="http://web.stanford.edu/class/cs168/index.html">The Modern Algorithmic Toolbox</a>" is a great example of an advanced modernized algorithms class. According to private channels a modernized version of the algorithms curriculum is currently under construction at Stanford.  
</li>
<li>At Harvard the Data Structures and Algorithms class is taught by Jelani Nelson, <a href="http://sites.fas.harvard.edu/~cs124/cs124/syllabus.html ">page here</a>.
This is also a fairly traditional CLRS/KT-based class with a touch of linear programming and approximation algorithms.
</li>
<li>At UIUC the class is taught by Jeff Erickson whose <a href="http://web.engr.illinois.edu/~jeffe/teaching/algorithms/ ">lecture notes</a> basically form a book. 
Non-standard topics include matroids, heavy emphasis of randomized algorithms and amortized data structures, 
</li>
</ul>

<h1>The Brave New O of the Big N</h1>
Finally, I would like to suggest some ideas for a modern algorithms curriculum.
As I mentioned in the motivational discussion above I believe that there are three fundamental guidelines: simplicity, implementability / test of time and potential for the future.
None of the proposed topics is particularly new and all of them have been tested in advanced graduate level classes at different schools with accessible expositions available.
Petabytes of data are getting crunched daily using these techniques and most of them have been implemented in a variety of software packages.
<ul>
<li><b>Randomized and approximation algorithms.</b> Concentration bounds and tail inequalities early on. Examples of simple randomized and approximation algorithms that are actually used in practice, e.g PageRank,  Set Cover, etc. There is a lot of mileage in these basic algorithms. </li>
<li><b>Linear programming.</b> LP basics/duality + approximation algorithms.
Since this topic has already made it into a large number of courses discussed above, I won't discuss it in much detail.
Considering LP-solvers as a solution that is available for a wide class of problems is an implicit goal achieved here. </li>


<li><b>Basics of machine learning and learning theory.</b> Core learning ideas: perceptron, boosting, VC-dimension, multiplicative weights. In order to strengthen connections with machine learning one can emphasize clustering problems in other parts of the course (SVD, k-means, single-linkage clustering, nearest neighbor, etc.) </li>

<li><b>Linear sketching.</b> This is probably the most recent topic (see these <a href="http://users.dcc.uchile.cl/~pbarcelo/mcg.pdf ">two</a> <a href="http://researcher.watson.ibm.com/researcher/files/us-dpwoodru/wNow.pdf ">surveys</a> by Andrew McGregor and David Woodruff), but I strongly believe that by now the field is mature enough to be covered in the intro class. 

A good example of a linear sketch is the  <a href="http://en.wikipedia.org/wiki/Count%E2%80%93min_sketch ">CountMin</a> data structure. 
It is a stronger version of the <a href="http://en.wikipedia.org/wiki/Bloom_filter">Bloom filter</a> which is one of the most widely used data structures.
The basic philosophy here is surprisingly powerful: CountMin allows to maintain an approximate version of the most basic data structure, an array, using space which is independent of the array's size.
Taking this further, linear sketching is a very powerful tool for designing algorithms for massive data regardless of the computational model. Whether it is streaming, MapReduce or take your pick, linear sketches are often the best solution known and/or proved to be optimal. They can also be implemented using basic linear algebraic primitives (see next bullet).
</li>
<li><b>Algorithms based on linear algebraic primitives.</b>
I think that avoiding combinatorial magic is the key to making algorithms robust to the choice of the computational model and also more parallel (see next bullet).
Whenever, there is a solution which only uses basic linear algebra, it might be a good idea to prefer it over a combinatorial algorithm even if the latter is a little bit faster and/or easier to implement from scratch.
Regardless of the computational model one can expect linear algebraic primitives to be already implemented there (e.g. MatLab).
A good example here is the All-Pairs-Shortest-Paths problem (see Uri Zwick's <a href=" http://www.diku.dk/PATH05/Uri1.pdf">slides</a> for details).
Other examples are PageRank, applications of SVD and linear sketching algorithms described above.
</li>


<li><b>Parallel algorithms and data structures.</b> When faced with multiple algorithmic alternatives it might be a good idea to pick one that is parallelizable.
E.g. among the Prim's, Kruskal's and Boruvka's algorithm for MST Boruvka's is the winner here because it is the only one that is not sequential. This fact is used in a variety of parallel MST algorithms.
Linear sketching is again going to be handy here. 
Algorithms based on sorting and hash tables are good since these primitives are often very efficiently implemented in parallel systems (e.g. Hadoop, DHT).

</li>
<li><b>Data structures and NP-completeness => Advanced classes.</b> In order to make some room for the suggestions described above I would suggest to reduce discussion of these topics to the bare minimum that is necessary in order to cover the core algorithmic ideas.
I believe that each of them by itself deserves to be covered in a separate class. With hundreds of students enrolled these topics start to feel too specialized for an introductory algorithms class.
NP-completeness can be combined with other topics in computational complexity and automata theory to make it a semester long course.
Data structures seem to go naturally with advanced algorithms as another course. To spice things up one can even add <a href="http://www.amazon.com/Purely-Functional-Structures-Chris-Okasaki/dp/0521663504 ">purely functional data structures</a>. 
This may sound a little controversial but there seems to be a general tendency towards moving away from data structues among the books and curricula discussed above.
As for NP-completeness, I think it depends on whether a separate class on the theory of computing is offered which for any good school I really believe should be the case.
</li>
</ul>


