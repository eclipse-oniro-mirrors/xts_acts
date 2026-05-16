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

// Performance and stress tests for String.prototype.isWellFormed
export function testIsWellFormedLargeString10KB() {
  const largeStr = "a".repeat(10240);
  const result = largeStr.isWellFormed();
  return { result, expected: true };
}

export function testIsWellFormedLargeString100KB() {
  const largeStr = "a".repeat(102400);
  const result = largeStr.isWellFormed();
  return { result, expected: true };
}

export function testIsWellFormedLargeStringWithSurrogate() {
  const largeStr = "a".repeat(10240) + "\uD800";
  const result = largeStr.isWellFormed();
  return { result, expected: false };
}

export function testIsWellFormedRepeatedCalls100() {
  const str = "test string";
  let results = [];
  for (let i = 0; i < 100; i++) {
    results.push(str.isWellFormed());
  }
  return { result: results.every(r => r === true), expected: true };
}

export function testIsWellFormedRepeatedCalls1000() {
  const str = "test\uD800string";
  let results = [];
  for (let i = 0; i < 1000; i++) {
    results.push(str.isWellFormed());
  }
  return { result: results.every(r => r === false), expected: true };
}

export function testIsWellFormedLargeUnicodeString() {
  const unicodeStr = "你好世界こんにちは안녕하세요".repeat(1000);
  const result = unicodeStr.isWellFormed();
  return { result, expected: true };
}

export function testIsWellFormedLargeEmojiString() {
  const emojiStr = "😀🎉🎊🎁".repeat(1000);
  const result = emojiStr.isWellFormed();
  return { result, expected: true };
}

export function testIsWellFormedConcurrentSameString() {
  const str = "test\uD800string";
  let results = [];
  for (let i = 0; i < 100; i++) {
    results.push(str.isWellFormed());
  }
  return { result: results.every(r => r === false), expected: true };
}
