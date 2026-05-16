/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

// Test helper for String.prototype.charAt() with various parameter types
export function testCharAtWithNull(str) {
  return str.charAt(null);
}

export function testCharAtWithUndefined(str) {
  return str.charAt(undefined);
}

export function testCharAtWithNoParam(str) {
  return str.charAt();
}

export function testCharAtWithStringNumber(str) {
  let result1 = str.charAt("2");
  let result2 = str.charAt("3");
  return { result1, result2 };
}

export function testCharAtWithBoolean(str) {
  let result1 = str.charAt(true);
  let result2 = str.charAt(false);
  return { result1, result2 };
}

export function testCharAtWithNonNumericString(str) {
  return str.charAt("abc");
}

export function testCharAtWithMultipleParams(str) {
  return str.charAt(1, 2, 3);
}

// Supplement test helpers for additional parameter types

// Test charAt with hexadecimal string parameter (0x prefix)
export function testCharAtWithHexString(str) {
  let result1 = str.charAt("0x2");
  let result2 = str.charAt("0x1");
  let result3 = str.charAt("0X0");
  return { result1, result2, result3 };
}

// Test charAt with octal string parameter (0o prefix)
export function testCharAtWithOctalString(str) {
  let result1 = str.charAt("0o2");
  let result2 = str.charAt("0o4");
  let result3 = str.charAt("0O1");
  return { result1, result2, result3 };
}

// Test charAt with binary string parameter (0b prefix)
export function testCharAtWithBinaryString(str) {
  let result1 = str.charAt("0b10"); // binary 10 = decimal 2
  let result2 = str.charAt("0b11"); // binary 11 = decimal 3
  let result3 = str.charAt("0B0");  // binary 0 = decimal 0
  return { result1, result2, result3 };
}

// Test charAt with array parameter (single element)
export function testCharAtWithSingleArray(str) {
  let result1 = str.charAt([2]);
  let result2 = str.charAt([0]);
  let result3 = str.charAt([4]);
  return { result1, result2, result3 };
}

// Test charAt with array parameter (multiple elements)
export function testCharAtWithMultipleArray(str) {
  let result1 = str.charAt([1, 2]); // Array to "1,2" then NaN to 0
  let result2 = str.charAt([3, 4]);
  return { result1, result2 };
}

// Test charAt with empty array parameter
export function testCharAtWithEmptyArray(str) {
  return str.charAt([]);
}

// Test charAt with function parameter
export function testCharAtWithFunction(str) {
  let result1 = str.charAt(function() { return 2; });
  let result2 = str.charAt(() => 3);
  // Function converts to NaN then to 0
  return { result1, result2 };
}

// Test charAt with large BigInt parameter
export function testCharAtWithLargeBigInt(str) {
  return str.charAt(10000000000n);
}

// Test charAt with String object instance (new String())
export function testCharAtWithStringObject() {
  const strObj = new String("Hello");
  let result1 = strObj.charAt(1);
  let result2 = strObj.charAt(0);
  let result3 = strObj.charAt(10);
  return { result1, result2, result3 };
}

// Test String object instance type checking
export function testStringObjectTypeCheck() {
  const strObj = new String("Hello");
  return {
    isStringObject: strObj instanceof String,
    typeofValue: typeof strObj,
    charAtResult: strObj.charAt(2)
  };
}

// Compare charAt with at() method - positive index
export function testCharAtVsAtPositive() {
  const str = "Hello";
  let charAtResult = str.charAt(1);
  let atResult = str.at(1);
  return { charAtResult, atResult };
}

// Compare charAt with at() method - negative index
export function testCharAtVsAtNegative() {
  const str = "Hello";
  let charAtResult = str.charAt(-1);
  let atResult = str.at(-1);
  return { charAtResult, atResult };
}

// Compare charAt with at() method - last character
export function testCharAtVsAtLastChar() {
  const str = "Hello";
  let charAtResult = str.charAt(str.length - 1);
  let atResult = str.at(-1);
  return { charAtResult, atResult };
}

// Test charAt with object parameter (with valueOf method)
export function testCharAtWithObject(str) {
  let result1 = str.charAt({}); // "[object Object]" to NaN to 0
  let result2 = str.charAt({valueOf: () => 2});
  return { result1, result2 };
}

// Test charAt with Number object parameter
export function testCharAtWithNumberObject(str) {
  let result1 = str.charAt(Number(2));
  let result2 = str.charAt(new Number(3));
  return { result1, result2 };
}

// Test charAt with various numeric format strings
export function testCharAtWithFormatStrings(str) {
  let result1 = str.charAt("  2  "); // String with spaces
  let result2 = str.charAt("\t2\n"); // String with tabs and newlines
  return { result1, result2 };
}

// Test charAt chaining operations
export function testCharAtChaining(str) {
  let result1 = str.charAt(0).toUpperCase();
  let result2 = str.charAt(1).repeat(3);
  return { result1, result2 };
}

// Test charAt in expression with other string methods
export function testCharAtInExpression(str) {
  let result1 = str.charAt(0).toUpperCase();
  let result2 = str.charAt(str.length - 1).repeat(3);
  let result3 = str.charAt(0) + str.charAt(6);
  return { result1, result2, result3 };
}

// Test helper for bracket notation comparison
export function testBracketNotation(str, index) {
  return str[index];
}

export function testBracketNotationWithFloat(str) {
  return str[1.5];
}

export function testBracketNotationWithNegative(str) {
  return str[-1];
}

export function testBracketNotationWithStringNumber(str) {
  return str["1"];
}

export function testBracketNotationCompare(str) {
  let charAtResult = str.charAt(1);
  let bracketResult = str[1];
  return { charAtResult, bracketResult };
}

export function testBracketNotationOutOfBounds(str) {
  return str[100];
}
