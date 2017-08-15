package std

type u8 is (int c) where 0 <= c && c <= 255

// Uniquely identifies a UTF code point.  Since a utf8 string does not
// store characters internally, they must be extracted on demand.
type char is (int c) where 0 <= c && <= 1112064

// A UTF-8 string is a sequence of zero or more bytes with additional
// constraints.  For example, the final byte cannot conform to the
// TWO_BYTE_MASK.
public string is (u8[] chars)

// Identifies a UTF-8 code point that occupies one byte.  These
// characters corresponding directly to the ASCII character set.
public constant ONE_BYTE_MASK is 01111111b

// Identifies a UTF-8 code point that occupies two bytes, where the
// following byte conforms to the trailing byte mask.
public constant TWO_BYTE_MASK is 11011111b

// Identifies a UTF-8 code point that occupies three bytes, where the
// following bytes conform to the trailing byte mask.
public constant THREE_BYTE_MASK is 11101111b

// Identifies a UTF-8 code point that occupies four bytes, where the
// following bytes conform to the trailing byte mask.
public constant FOUR_BYTE_MASK is 11110111b

// Identifies an internal byte for a UTF-8 code point.  Unfortunately,
// the mask does not tell us whether we are part of a two-, three- or
// four-byte code point.
public constant TRAILING_BYTE_MASK is 10111111b
