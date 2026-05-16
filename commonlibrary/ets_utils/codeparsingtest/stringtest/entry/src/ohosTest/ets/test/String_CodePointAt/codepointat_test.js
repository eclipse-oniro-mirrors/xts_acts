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

// JS helper for type conversion tests

export function testCodePointAtNoParam() {
  return 'ABC'.codePointAt();
}

export function testCodePointAtUndefined() {
  return 'ABC'.codePointAt(undefined);
}

export function testCodePointAtFloat15() {
  return 'ABC'.codePointAt(1.5);
}

export function testCodePointAtFloat29() {
  return 'ABC'.codePointAt(2.9);
}

export function testCodePointAtFloat01() {
  return 'ABC'.codePointAt(0.1);
}

export function testCodePointAtString1() {
  return 'ABC'.codePointAt('1');
}

export function testCodePointAtString2() {
  return 'ABC'.codePointAt('2');
}

export function testCodePointAtString0() {
  return 'ABC'.codePointAt('0');
}

export function testCodePointAtNull() {
  return 'ABC'.codePointAt(null);
}

export function testCodePointAtFalse() {
  return 'ABC'.codePointAt(false);
}

export function testCodePointAtTrue() {
  return 'ABC'.codePointAt(true);
}

export function testForOfIteration() {
  const str = '\ud83d\udc0e\ud83d\udc71\u2764';
  const results = [];
  for (const char of str) {
    results.push(char.codePointAt(0).toString(16));
  }
  return results;
}

export function testSpreadSyntax() {
  const str = '\ud83d\udc0e\ud83d\udc71\u2764';
  const codePoints = [...str].map(cp => cp.codePointAt(0).toString(16));
  console.log(codePoints + "rq:")
  return codePoints;
}

export function testArrayFrom() {
  const emojis = '😀😁😂';
  const codePoints = Array.from(emojis, char => char.codePointAt(0));
  return codePoints;
}