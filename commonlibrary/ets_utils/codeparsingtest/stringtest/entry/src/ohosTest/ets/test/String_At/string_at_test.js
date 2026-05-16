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

// String.prototype.at() test helper functions
// These functions test the at() method which may not be available in TypeScript definitions

export function testAtPositiveIndex() {
  const sentence = "The quick brown fox jumps over the lazy dog.";
  const index = 5;
  return sentence.at(index);
}

export function testAtZeroIndex() {
  const str = "test";
  return str.at(0);
}

export function testAtMiddleIndex() {
  const str = "The quick brown fox jumps over the lazy dog.";
  return str.at(10);
}

export function testAtNegativeIndex() {
  const sentence = "The quick brown fox jumps over the lazy dog.";
  return sentence.at(-4);
}

export function testAtNegativeIndex2() {
  const sentence = "The quick brown fox jumps over the lazy dog.";
  return sentence.at(-2);
}

export function testAtNegativeIndex3() {
  const str = "test";
  return str.at(-1);
}

export function testAtNegativeIndex4() {
  const str = "test";
  return str.at(-4);
}

export function testAtReturnType(str) {
  return typeof str.at(1);
}

export function testAtReturnLength(str) {
  return str.at(1).length;
}

export function testAtInvalidPositive(str) {
  return str.at(100);
}

export function testAtInvalidNegative(str) {
  return str.at(-10);
}

export function testAtOutOfBoundsLength(str) {
  return str.at(5);
}

export function testAtEmptyZero() {
  const emptyStr = "";
  return emptyStr.at(0);
}

export function testAtEmptyNegative() {
  const emptyStr = "";
  return emptyStr.at(-1);
}

export function testAtEmptyPositive() {
  const emptyStr = "";
  return emptyStr.at(1);
}

export function testAtFloatPositive() {
  const str = "hello";
  return str.at(1.5);
}

export function testAtFloatNegative() {
  const str = "hello";
  return str.at(-1.9);
}

export function testAtFloatPositive2() {
  const str = "hello";
  return str.at(2.99);
}

export function testAtStringNumber() {
  const str = "abc";
  return str.at("1");
}

export function testAtStringNegative() {
  const str = "abc";
  return str.at("-2");
}

export function testAtNaN() {
  const str = "test";
  return str.at(NaN);
}

export function testAtInfinity() {
  const str = "test";
  return str.at(Infinity);
}

export function testAtNegInfinity() {
  const str = "test";
  return str.at(-Infinity);
}

export function testAtNull() {
  const str = "hello";
  return str.at(null);
}

export function testAtUndefined() {
  const str = "hello";
  return str.at(undefined);
}

export function testAtNoParameter() {
  const str = "hello";
  return str.at();
}

export function testAtTwoCharFirst() {
  const str = "AB";
  return str.at(0);
}

export function testAtTwoCharLast() {
  const str = "AB";
  return str.at(1);
}

export function testAtTwoCharNegFirst() {
  const str = "AB";
  return str.at(-2);
}

export function testAtTwoCharNegLast() {
  const str = "AB";
  return str.at(-1);
}

export function testAtTwoCharOutOfBounds() {
  const str = "AB";
  return str.at(2);
}

export function testAtSingleCharZero() {
  const str = "x";
  return str.at(0);
}

export function testAtSingleCharNeg() {
  const str = "x";
  return str.at(-1);
}

export function testAtSingleCharOne() {
  const str = "x";
  return str.at(1);
}

export function testAtSingleCharNegTwo() {
  const str = "x";
  return str.at(-2);
}

export function testAtLongStringFirst() {
  const longStr = "a".repeat(1000);
  return longStr.at(0);
}

export function testAtLongStringLast() {
  const longStr = "a".repeat(1000);
  return longStr.at(999);
}

export function testAtLongStringNeg() {
  const longStr = "a".repeat(1000);
  return longStr.at(-1);
}

export function testAtLongStringNeg1000() {
  const longStr = "a".repeat(1000);
  return longStr.at(-1000);
}

export function testAtLongStringMid() {
  const longStr = "a".repeat(1000);
  return longStr.at(500);
}

export function testAtCompareCharAtValid() {
  const str = "test";
  return {
    atResult: str.at(1),
    charAtResult: str.charAt(1)
  };
}

export function testAtCompareCharAtNeg() {
  const str = "test";
  return {
    atResult: str.at(-1),
    charAtResult: str.charAt(-1)
  };
}

export function testAtCompareCharAtOut() {
  const str = "test";
  return {
    atResult: str.at(10),
    charAtResult: str.charAt(10)
  };
}

export function testAtCompareSliceNeg() {
  const str = "Every green bus drives fast.";
  return {
    atResult: str.at(-2),
    sliceResult: str.slice(-2, -1)
  };
}

export function testAtCompareSlicePos() {
  const str = "Every green bus drives fast.";
  return {
    atResult: str.at(5),
    sliceResult: str.slice(5, 6)
  };
}

export function testAtLastCharThreeWays() {
  const str = "Every green bus drives fast.";
  return {
    atResult: str.at(-1),
    lengthWay: str.charAt(str.length - 1),
    sliceWay: str.slice(-1)
  };
}

export function testAtASCII() {
  const str = "Hello, World! 123";
  return str.at(7);
}

export function testAtBMPFirst() {
  const str = "你好世界";
  return str.at(0);
}

export function testAtBMPSecond() {
  const str = "你好世界";
  return str.at(1);
}

export function testAtBMPNeg() {
  const str = "你好世界";
  return str.at(-1);
}

export function testAtBMPThird() {
  const str = "你好世界";
  return str.at(-2);
}

export function testAtEmojiFirst() {
  const str = "😀🎉";
  const result = str.at(0);
  return {
    result: result,
    codePoint: result.charCodeAt(0)
  };
}

export function testAtEmojiSecond() {
  const str = "😀🎉";
  const result = str.at(1);
  return {
    result: result,
    codePoint: result.charCodeAt(0)
  };
}

export function testAtEmojiLength() {
  const str = "😀🎉";
  return str.length;
}

export function testAtEmojiThird() {
  const str = "😀🎉";
  const result = str.at(2);
  return {
    result: result,
    codePoint: result.charCodeAt(0)
  };
}

export function testAtMixedString() {
  const str = "Hi你好";
  return [str.at(0), str.at(1), str.at(2), str.at(3)];
}

export function testAtPracticalLast1() {
  const invoiceRef = "myinvoice01";
  return invoiceRef.at(-1);
}

export function testAtPracticalLast2() {
  const invoiceRef = "myinvoice02";
  return invoiceRef.at(-1);
}

export function testAtPracticalSecondLast() {
  const str = "Every green bus drives fast.";
  return str.at(-2);
}

export function testAtPracticalThirdLast() {
  const str = "Every green bus drives fast.";
  return str.at(-3);
}

export function testAtPracticalCondNeg() {
  const str = "hello";
  const useNegative = true;
  const index = useNegative ? -1 : 0;
  return str.at(index);
}

export function testAtPracticalCondPos() {
  const str = "hello";
  const useNegative = false;
  const index = useNegative ? -1 : 0;
  return str.at(index);
}

export function testAtPracticalLoopForward() {
  const str = "hello";
  return [str.at(0), str.at(1), str.at(2)];
}

export function testAtPracticalLoopBackward() {
  const str = "hello";
  return [str.at(-1), str.at(-2), str.at(-3)];
}
