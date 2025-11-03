# --------------------------------------------------------------------
# Docker image using the official TPC-DS tool source code
# THE TPC SOFTWARE IS AVAILABLE WITHOUT CHARGE FROM TPC.
# --------------------------------------------------------------------
FROM debian:latest

LABEL maintainer="Stamatis Zampetakis <zabetak@gmail.com>"
LABEL description="Containerized build of the official TPC-DS toolkit (dsdgen, dsqgen). THE TPC SOFTWARE IS AVAILABLE WITHOUT CHARGE FROM TPC."
LABEL version="1.0"
LABEL license_notice="THE TPC SOFTWARE IS AVAILABLE WITHOUT CHARGE FROM TPC."

# Install build dependencies
RUN apt-get update && apt-get install -y build-essential yacc flex

# Copy official toolkit source code
COPY tpc-ds-tools/ /opt/tpcds
WORKDIR /opt/tpcds/tools

# Build the toolkit
RUN cp Makefile.suite Makefile && make LINUX_CFLAGS="-g -Wall -std=gnu89" LDFLAGS="-z muldefs"

# Add to PATH for convenience
ENV PATH="/opt/tpcds/tools:${PATH}"
