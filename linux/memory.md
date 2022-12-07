# Memory Related Infos

## Allocations

### tcmalloc

TCMalloc is Google’s customized implementation of C’s malloc() and C++’s operator new used for memory allocation within our C and C++ code. This custom memory allocation framework is an alternative to the one provided by the C standard library (on Linux usually through glibc) and C++ standard library. TCMalloc is designed to be more efficient at scale than other implementations.

Specifically, TCMalloc provides the following benefits:

    Performance scales with highly parallel applications.
    Optimizations brought about with recent C++14 and C++17 standard enhancements, and by diverging slightly from the standard where performance benefits warrant. (These are noted within the TCMalloc Reference.)
    Extensions to allow performance improvements under certain architectures, and additional behavior such as metric gathering.


<https://google.github.io/tcmalloc/overview.html>

<https://github.blog/2013-02-21-tcmalloc-and-mysql/>

Using it in MySQL

<https://www.jamesgolick.com/2012/7/18/innodb-kernel-mutex-contention-and-memory-allocators.html>

### jemalloc

*this is the recommended malloc implementation*

jemalloc is a general purpose malloc(3) implementation that emphasizes fragmentation avoidance and scalable concurrency support. jemalloc first came into use as the FreeBSD libc allocator in 2005, and since then it has found its way into numerous applications that rely on its predictable behavior. In 2010 jemalloc development efforts broadened to include developer support features such as heap profiling and extensive monitoring/tuning hooks. Modern jemalloc releases continue to be integrated back into FreeBSD, and therefore versatility remains critical. Ongoing development efforts trend toward making jemalloc among the best allocators for a broad range of demanding applications, and eliminating/mitigating weaknesses that have practical repercussions for real world applications.

<http://jemalloc.net/>

<https://github.com/jemalloc>

Scalable memory allocation using jemalloc
<https://www.facebook.com/notes/10158791475077200/>
