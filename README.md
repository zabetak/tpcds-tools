# Dockerized TPC-DS Tools

This repository provides a containerized build of the
official [TPC-DS](https://www.tpc.org/tpcds) toolkit (`dsdgen`, `dsqgen`).

The tpcd-ds-tools directory contains the TPC-DS tools source code version 4.0.0 downloaded from the
[TPC website](https://www.tpc.org). Some minor modifications have been made outlined in the git history as separate commits. 

## Build
To build the Docker image, run the following command in the root directory of this repository:

```bash
docker build -t tpc-ds-tools .
```

## Usage
Generate the TPC-DS data at scale factor 1 and store it in a Docker volume named `tpcds-data`:
```bash
docker run --rm -v tpcds-data:/tmp tpc-ds-tools dsdgen -SCALE 1 -DIR /tmp
```

Generate the TPC-DS query 44 at scale factor 1 and store it in a Docker volume named `tpcds-queries`:
```bash
docker run --rm -v tpcds-queries:/tmp tpc-ds-tools dsqgen -template query44.tpl -directory ../query_templates -scale 1 -output_dir /tmp
```

## License
The TPC-DS tools are provided under the License Agreement that can be found in the
[EULA.txt](tpc-ds-tools/EULA.txt) file.

**NOTICE**  
THE TPC SOFTWARE IS AVAILABLE WITHOUT CHARGE FROM TPC.  
