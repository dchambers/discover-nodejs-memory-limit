KB = 1024
MB = KB * KB

const buffers = []
let allocatedMemory = 0

while (true) {
    buffers.push(Buffer.alloc(10 * MB, 'x'))
    console.log(`${++allocatedMemory * 10}MB`)

    // allow Node.js to clean up old buffers once we've allocated 150MB of buffers
    if (buffers.length >= 15) {
        buffers.shift()
    }
}
