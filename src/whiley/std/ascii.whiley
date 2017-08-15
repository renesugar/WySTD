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

// The ASCII standard (INCITS 4-1986[R2012]) defines a 7bit character
// encoding.
public type char is (int x) where 0 <= x && x <= 127

// Define the ASCII letter
public type letter is (int x) where ('a' <= x && x <= 'z') || ('A' <= x && x <= 'Z')

// Define the ASCII uppercase letter
public type uppercase is (int x) where ('A' <= x && x <= 'Z')

// Define the ASCII lowercase letter
public type lowercase is (int x) where ('a' <= x && x <= 'z')

// Define the ASCII digit
public type digit is (int x) where ('0' <= x && x <= '9')

// Define string as sequence of ASCII characters
public type string is char[]

// === CONTROL CHARACTERS ===

// Null character
public constant NUL is 0

// Start of Header
public constant SOH is 1

// Start of Text
public constant STX is 2

// End of Text
public constant ETX is 3

// End of Transmission
public constant EOT is 4

// Enquiry
public constant ENQ is 5

// Acknowledgment
public constant ACK is 6

// Bell
public constant BEL is 7

// Backspace
public constant BS is 8

// Horizontal Tab
public constant HT is 9

// Line Feed
public constant LF is 10

// Vertical Tab
public constant VT is 11

// Form Feed
public constant FF is 12

// Carriage Return
public constant CR is 13

// Shift Out
public constant SO is 14

// Shift In
public constant SI is 15

// Data Link Escape
public constant DLE is 16

// Device Control 1
public constant DC1 is 17

// Device Control 2
public constant DC2 is 18

// Device Control 3
public constant DC3 is 19

// Device Control 4
public constant DC4 is 20

// Negative Acknowledgement
public constant NAK is 21

// Synchronous Idle
public constant SYN is 22

// End of Transmission Block
public constant ETB is 23

// Cancel
public constant CAN is 24

// End of Medium
public constant EM is 25

// Substitute
public constant SUB is 26

// Escape
public constant ESC is 27

// File Separator
public constant FS is 28

// Group Separator
public constant GS is 29

// Record Separator
public constant RS is 30

// Unit Separator
public constant US is 31

// Delete
public constant DEL is 127

// Convert an ASCII character into a byte.
public function to_byte(char v) -> byte:
    //
    byte mask = 00000001b
    byte r = 0b
    int i = 0
    while i < 8:
        if (v % 2) == 1:
            r = r | mask
        v = v / 2
        mask = mask << 1
        i = i + 1
    return r

// Convert an ASCII string into a list of bytes
public function to_bytes(string s) -> byte[]:
    byte[] r = [0b; |s|]
    int i = 0
    while i < |s| where i >= 0:
        r[i] = to_byte(s[i])
        i = i + 1
    return r

// Convert a list of bytes into an ASCII string
public function from_bytes(byte[] data) -> string:
    string r = [0; |data|]
    int i = 0
    while i < |data| where i >= 0:
        r[i] = integer.toInt(data[i])
        i = i + 1
    return r

public function append(string s1, string s2) -> string:
    string s3 = [0; |s1| + |s2|]
    int i = 0
    while i < |s3|:
       if i < |s1|:
          s3[i] = s1[i]
       else:
          s3[i] = s2[i-|s1|]
       i = i + 1
    return s3

public function is_upper_case(char c) -> bool:
    return 'A' <= c && c <= 'Z'

public function is_lower_case(char c) -> bool:
    return 'a' <= c && c <= 'z'

public function is_letter(char c) -> bool:
    return ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

public function is_digit(char c) -> bool:
    return '0' <= c && c <= '9'

public function is_whitespace(char c) -> bool:
    return c == ' ' || c == '\t' || c == '\n' || c == '\r'

