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

// Type conversion and prototype chain tests for String.prototype.isWellFormed
export function testIsWellFormedOnNumber() {
  const result1 = String.prototype.isWellFormed.call(123);
  const result2 = String.prototype.isWellFormed.call(123.456);
  return { result: [result1, result2], expected: [true, true] };
}

export function testIsWellFormedOnBoolean() {
  const result1 = String.prototype.isWellFormed.call(true);
  const result2 = String.prototype.isWellFormed.call(false);
  return { result: [result1, result2], expected: [true, true] };
}

export function testIsWellFormedOnObject() {
  const result1 = String.prototype.isWellFormed.call({});
  const result2 = String.prototype.isWellFormed.call({toString: () => "test"});
  const result3 = String.prototype.isWellFormed.call({toString: () => "\uD800"});
  return { result: [result1, result2, result3], expected: [true, true, false] };
}

export function testIsWellFormedOnArray() {
  const result1 = String.prototype.isWellFormed.call([1, 2, 3]);
  const result2 = String.prototype.isWellFormed.call(['a', 'b']);
  const result3 = String.prototype.isWellFormed.call(['\uD800']);
  return { result: [result1, result2, result3], expected: [true, true, false] };
}

export function testIsWellFormedCustomObjectToString() {
  const obj = {
    toString() {
      return "hello\uD800world";
    }
  };
  const result = String.prototype.isWellFormed.call(obj);
  return { result, expected: false };
}

export function testIsWellFormedCustomObjectToStringAndValueOf() {
  const obj = {
    toString() {
      return "from to\uD800String";
    },
    valueOf() {
      return "from valueOf";
    }
  };
  const result = String.prototype.isWellFormed.call(obj);
  return { result, expected: false };
}

export function testIsWellFormedDirectCall() {
  const str1 = "test";
  const str2 = "test\uD800";
  const result1 = str1.isWellFormed();
  const result2 = str2.isWellFormed();
  return { result: [result1, result2], expected: [true, false] };
}

export function testIsWellFormedWithCallApply() {
  const str = "test\uD800";
  const result1 = String.prototype.isWellFormed.call(str);
  const result2 = String.prototype.isWellFormed.apply(str);
  return { result: [result1, result2], expected: [false, false] };
}

export function testIsWellFormedWithBind() {
  const str = "test";
  const boundIsWellFormed = String.prototype.isWellFormed.bind(str);
  const result = boundIsWellFormed();
  return { result, expected: true };
}
