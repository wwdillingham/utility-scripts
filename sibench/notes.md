# Overview:
- sibench is a tool for benchmarking Ceph clusters and other storage systems.

# Links:
- https://sibench.io/
- https://github.com/SoftIron/sibench

# Usage

## Testing Environment Setup

### Setup of RBD testing pool
```
ceph osd pool create sibench.rbd.pool 128
ceph auth add client.sibench-rbd mon 'profile rbd' osd 'profile rbd pool=sibench.rbd.pool' mgr 'profile rbd pool=sibench.rbd.pool'
ceph auth get client.sibench-rbd
```

# Usage Examples:

### RBD Run using the single local client:

```sibench rbd run --ceph-pool sibench.rbd.pool --ceph-user sibench-rbd --ceph-key AQ4j__redacted__ZlbXQ== 10.0.24.1```

### RBD Run using multiple simultaneous clients: 

```sibench rbd run --ceph-pool sibench.rbd.pool --ceph-user sibench-rbd --ceph-key AQ4j__redacted__ZlbXQ== --servers 10.0.24.1,10.0.24.2,10.0.24.3 10.0.24.1```

### RADOS Run using the RADOS bench but reusing RBD pool and CephX key:

```sibench rados run --ceph-pool sibench.rbd.pool --ceph-user sibench-rbd --ceph-key AQ4j__redacted__ZlbXQ== --servers 10.0.24.1,10.0.24.2,10.0.24.3 10.0.24.1```

### CephFS run

```sibench cephfs run --ceph-user admin --ceph-key Akl__redacted__Fgjh4== 10.0.24.1```

### Default behavior
- CephFS Kernel mounts to /tmp/sibench/<IP_ADDR> and performs tests in this directory.
- Files are not removed.
- 1,000 1M files are created.

