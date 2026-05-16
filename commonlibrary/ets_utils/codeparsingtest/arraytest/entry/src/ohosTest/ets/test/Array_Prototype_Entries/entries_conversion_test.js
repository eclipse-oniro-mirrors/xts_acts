/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
"use strict";

export function testEntriesToMap() {
  const arr = ['a', 'b', 'c'];
  const map = new Map(arr.entries());
  const result = map.get(0) === 'a' && map.get(1) === 'b' && map.size === 3;
  return { result, expected: true };
}

export function testEntriesToObject() {
  const arr = ['a', 'b', 'c'];
  const obj = Object.fromEntries(arr.entries());
  const result = JSON.stringify(obj);
  return { result, expected: JSON.stringify({ 0: 'a', 1: 'b', 2: 'c' }) };
}