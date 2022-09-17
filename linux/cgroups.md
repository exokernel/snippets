* systemd-cgls # display tree of cgroups running on system.  User cgroup slices fall out of scope if you run from within /sys/fs/cgroup.

  * apt install cgroup-tools # provides cg*, lssubsys, and lscgroup

  * lssubsys # found in cgroup-tools, show subsystems for user/process control
    * cpuset # assign process to a set of cpu cores
    * cpu{,cpuacct deprecated} # control, monitor cpu usage
    * blkio # limit r/w speeds
    * memory # limit system memory
    * devices # control device access
    * freezer # suspend running processes, useful for moving procs between cgroups
    * net_cls,net_prio # add classid tags to network packets - usable by tc and netfilter
    * perf_event # monitor cgroups with perf
    * hugetlb # allow and control usage of huge virtual memory pages
    * pids # control number of processes that can run in a cgroup
    * rdma # remote direct memory access, mainly for parallel computing clusters
  * systemctl show <service> # list properties for service
  * systemctl set-property <service> <property> <value># or else edit systemd unit file.  creates /etc/systemd/system.control/ directory if not present. 
  * /etc/security/limits.conf # for setting limits for users and groups
  * systemctl edit --full user@.service # change Delegate line to let users control more resources
  * numactl # to view memory nodes that can be assigned in AllowedMemoryNodes property
