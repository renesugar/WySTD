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

// Define the 8bit ASCII character
public type char is (int x) where 0 <= x && x <= 255

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

// Convert an ASCII character into a byte.
public function toByte(char v) -> byte:
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
public function toBytes(string s) -> byte[]:
    byte[] r = [0b; |s|]
    int i = 0
    while i < |s| where i >= 0:
        r[i] = toByte(s[i])
        i = i + 1
    return r

// Convert a list of bytes into an ASCII string
public function fromBytes(byte[] data) -> string:
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

public function isUpperCase(char c) -> bool:
    return 'A' <= c && c <= 'Z'

public function isLowerCase(char c) -> bool:
    return 'a' <= c && c <= 'z'

public function isLetter(char c) -> bool:
    return ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z')

public function isDigit(char c) -> bool:
    return '0' <= c && c <= '9'

public function isWhiteSpace(char c) -> bool:
    return c == ' ' || c == '\t' || c == '\n' || c == '\r'
/*
constant digits is [
    '0','1','2','3','4','5','6','7','8','9',
    'a','b','c','d','e','f','g','h'
]

// Convert an integer into a hex string
public function toHexString(int item) -> string:
    string r = ""
    int count = 0
    int i = item
    while i > 0:
        int v = i / 16
        int w = i % 16
        count = count + 1
        i = v
    //
    i = count
    while item > 0:
        i = i - 1    
        int v = item / 16
        int w = item % 16
        r[i] = digits[w]
        item = v
    //
    return r
*/

// parse a string representation of an integer value
public function parseInt(ascii.string input) -> int|null:
    //
    // first, check for negative number
    int start = 0
    bool negative

    if input[0] == '-':
        negative = true
        start = start + 1
    else:
        negative = false
    // now, parse remaining digits
    int r = 0
    int i = start
    while i < |input|:
        char c = input[i]
        r = r * 10
        if !ascii.isDigit(c):
            return null
        r = r + ((int) c - '0')
        i = i + 1
    // done
    if negative:
        return -r
    else:
        return r
