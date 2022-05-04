# discover-nodejs-memory-limit

Repository demonstrating that Node.js has a GC race condition, and that setting `--max-old-space-size` to a lower figure to force GC at an earlier point doesn't help.

## Method

We write a program that allocates memory as quickly as it can, while only maintaining references to the most recently allocated 150MB, and then run the program within a Docker container with a hard limit of 250MB. This approximates the environment of a Node.js server that's working through memory heavy requests as quickly as it can.

## Observed Results

1. The program crashes because it exceeds the container's hard limit (`250MB`), and we can be sure of this because it doesn't crash at all if no memory limit is imposed.
   - It instead starts consuming vast amounts of swap memory but continues running.
2. The program crashes at a different point each time it's run, showing that it's a race condition.
3. Explicitly setting `--max-old-space-size` to a lower figure (`200MB`) so that GC is forced to be taken more seriously at an earlier point doesn't prevent the server from crashing, or produce noticeably better results.
