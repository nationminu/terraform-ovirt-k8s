#!/usr/bin/env bash

terraform "$@" -parallelism=2
