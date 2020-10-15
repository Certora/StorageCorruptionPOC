# Requirements

* Node

# Setup

Install `ganache-cli`, `solc`, and `web3` via npm, i.e., `npm install ganache-cli web3 solc --save`

# Reproducing

In another terminal window, begin the ganache test client: `./node_modules/.bin/ganache-cli`

Then, in this directory, simply run `node index.js`.

You should see something like the following output

    helogale:MemoryCorruptionPOC jrw$ node index.js
	Done compiling
    Deployed corruptible contract
    115792089237316195423570985008687907853269984665640564039457584007913129639680

index.js deploys the vulnerable contract and then calls `corruptStorage`. The last line of output shows the actual value stored in the `bytesField`. It is equal to `2^256-1 & 0xfff....ff00` which is value stored in `f.bigValue` (i.e., the maximum uint) with the lowest byte cleared.
