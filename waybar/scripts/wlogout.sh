#!/bin/bash

# Fixed values for 1920x1080 (27% of 1080 = 291px margin)
w_margin=291

# --- Execute wlogout ---
wlogout -b 5 -T "$w_margin" -B "$w_margin"

