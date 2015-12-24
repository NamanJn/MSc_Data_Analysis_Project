#!/bin/bash

cut -f1 sorted27all_eqtl_results_acute.txt | cut -f1 -d_ > NCBI_snps_to_query.txt
