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

```sibench rbd run --ceph-pool sibench.rbd.pool --ceph-user sibench-rbd --ceph-key AQCLaP9jwNrWChAAsTAXRioKXyEwOYhbtfdd2Q== 10.0.24.1```

### RBD Run using multiple simultaneous clients: 

```sibench rbd run --ceph-pool sibench.rbd.pool --ceph-user sibench-rbd --ceph-key AQCLaP9jwNrWChAAsTAXRioKXyEwOYhbtfdd2Q== --servers 10.0.24.1,10.0.24.2,10.0.24.3 10.0.24.1```

### RADOS Run using the RADOS bench but reusing RBD pool and CephX key:

```sibench rados run --ceph-pool sibench.rbd.pool --ceph-user sibench-rbd --ceph-key AQCLaP9jwNrWChAAsTAXRioKXyEwOYhbtfdd2Q== --servers 10.0.24.1,10.0.24.2,10.0.24.3 10.0.24.1```


