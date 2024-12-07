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
Let's say you have a very large list of domains and you want to do recon on each domain. Using a single machine, this could take a very long time. However, you can split the workload across multiple machines:

- Machine number 1 would run:
```bash
curl https://example.com/datasets/large_domain_list.txt | shardz 1/3 | httpx -title -ip -tech-detect -json -o shard-1.json
```

- Machine number 2 would run:
```bash
curl https://example.com/datasets/large_domain_list.txt | shardz 2/3 | httpx -title -ip -tech-detect -json -o shard-2.json
```

- Machine number 3 would run:
```bash
curl https://example.com/datasets/large_domain_list.txt | shardz 3/3 | httpx -title -ip -tech-detect -json -o shard-3.json
```

## How It Works

Shardz uses a modulo operation to determine which lines should be processed by each shard. For example, with `3` total shards:
- Shard 1 processes lines 1, 4, 7, 10, ...
- Shard 2 processes lines 2, 5, 8, 11, ...
- Shard 3 processes lines 3, 6, 9, 12, ...

This ensures an even distribution of the workload across all shards.

## Simplicity

For what its worth, the same functionality of this tool can be done with a bash function in your `.bashrc`:
```bash
shardz() {
	awk -v n="$1" -v t="$2" 'NR % t == n'
}
```

```bash
cat domains.txt | shardz 1/3 | httpx -title -ip -tech-detect -json -o shard-1.json
cat domains.txt | shardz 2/3 | httpx -title -ip -tech-detect -json -o shard-2.json
cat domains.txt | shardz 3/3 | httpx -title -ip -tech-detect -json -o shard-3.json
```

This was just a fun little project to brush up on my C, and to explore the requirements to having a package added to Linux package manager repositories.

---

###### Mirrors: [acid.vegas](https://git.acid.vegas/shardz) • [SuperNETs](https://git.supernets.org/acidvegas/shardz) • [GitHub](https://github.com/acidvegas/shardz) • [GitLab](https://gitlab.com/acidvegas/shardz) • [Codeberg](https://codeberg.org/acidvegas/shardz)
