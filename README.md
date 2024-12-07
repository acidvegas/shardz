<h1 align="center">Shardz</h1>
<p align="center">
    <img src="./.screens/shardz.jpg">
</p>

Shardz is a lightweight C utility that shards *(splits)* the output of any process for distributed processing. It allows you to easily distribute workloads across multiple processes or machines by splitting input streams into evenly distributed chunks.

## Use Cases
- Distributing large datasets across multiple workers
- Parallel processing of log files
- Load balancing input streams
- Splitting any line-based input for distributed processing

## Building & Installation

### Quick Build
```bash
gcc -o shardz shardz.c
```

### Using Make
```bash
# Build only
make

# Build and install system-wide (requires root/sudo)
sudo make install

# To uninstall
sudo make uninstall
```

## Usage
```bash
some_command | shardz INDEX/TOTAL
```

Where:
- `INDEX` is the shard number (starting from 1)
- `TOTAL` is the total number of shards

### Examples
- Machine number 1 would run:
```bash
curl https://example.com/large_file.txt | shardz 1/3
```

- Machine number 2 would run:
```bash
curl https://example.com/large_file.txt | shardz 2/3
```

- Machine number 3 would run:
```bash
curl https://example.com/large_file.txt | shardz 3/3
```

## How It Works

Shardz uses a modulo operation to determine which lines should be processed by each shard. For example, with `3` total shards:
- Shard 1 processes lines 1, 4, 7, 10, ...
- Shard 2 processes lines 2, 5, 8, 11, ...
- Shard 3 processes lines 3, 6, 9, 12, ...

This ensures an even distribution of the workload across all shards.

---

###### Mirrors: [acid.vegas](https://git.acid.vegas/shardz) • [SuperNETs](https://git.supernets.org/acidvegas/shardz) • [GitHub](https://github.com/acidvegas/shardz) • [GitLab](https://gitlab.com/acidvegas/shardz) • [Codeberg](https://codeberg.org/acidvegas/shardz)
