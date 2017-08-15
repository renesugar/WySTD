// Copyright (c) 2011, David J. Pearce (djp@ecs.vuw.ac.nz)
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright
//      notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimer in the
//      documentation and/or other materials provided with the distribution.
//    * Neither the name of the <organization> nor the
//      names of its contributors may be used to endorse or promote products
//      derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL DAVID J. PEARCE BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package std

// TO BE DEPRECATED
type uint is (int x) where x >= 0

// =================================================================
// Print functions
// =================================================================

// Print an integer to stdout
public native method print(int value)

// Print an ASCII string to stdout
public native method print(ascii.string value)

// Print an integer to stdout (with newline terminator)
public native method println(int value)

// Print an ASCII string to stdout (with newline terminator)
public native method println(ascii.string value)

// =================================================================
// Stream Reader
// =================================================================

// A generic reader represents an input stream of items (e.g. bytes or
// characters), such as from a file, network socket, or a memory buffer.

public type reader is {

    // Reads at most a given number of bytes from the stream.  This
    // operation may block if the number requested is greater than that
    // available.
    method read(uint) -> byte[],

    // Check whether the end-of-stream has been reached and, hence,
    // that there are no further bytes which can be read.
    method has_more() -> bool,

    // Closes this input stream thereby releasin any resources
    // associated with it.
    method close(),

    // Return the number of bytes which can be safely read without
    // blocking.
    method available() -> uint,

    // Space for additional operations defined by refinements of
    // Reader
    ...
}

// =================================================================
// Stream Writer
// =================================================================

// A generic writer represents an output stream of data items
// (e.g. bytes or characters), such as being written a file, socket or
// console.
public type writer is {

    // Writes a given list of bytes to the output stream.
    method write(byte[]) -> uint,

    // Flush this output stream thereby forcing those items written
    // thus far to the output device.
    method flush(),

    // Closes this output stream thereby releasin any resources
    // associated with it.
    method close(),

    // Space for additional operations defined by refinements of
    // InputStream
    ...
}
