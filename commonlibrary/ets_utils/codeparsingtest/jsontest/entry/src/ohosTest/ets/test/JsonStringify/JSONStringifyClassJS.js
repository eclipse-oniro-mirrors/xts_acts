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

export function testClassPropertyContainsSymbol() {
  class MyClass {
    constructor() {
      this.symbol = Symbol("test");
    }
  }
  const obj = new MyClass();
  const result = JSON.stringify(obj);
  return { result, expected: '{}' };
}

export function testClassPropertyContainsBigInt() {
  class MyClass {
    constructor() {
      this.bigint = 123n;
    }
  }
  const obj = new MyClass();
  let errorCaught = false;
  try {
    JSON.stringify(obj);
  } catch (e) {
    errorCaught = e instanceof TypeError;
  }
  return { result: errorCaught, expected: true };
}

export function testClassInstanceSelfReference() {
  class MyClass {
    constructor() {
      this.self = null;
    }
  }
  const obj = new MyClass();
  obj.self = obj;
  let errorCaught = false;
  try {
    JSON.stringify(obj);
  } catch (e) {
    errorCaught = e instanceof TypeError;
  }
  return { result: errorCaught, expected: true };
}

export function testClassInstanceMutualReference() {
  class MyClass {
    constructor() {
      this.ref = null;
    }
  }
  const obj1 = new MyClass();
  const obj2 = new MyClass();
  obj1.ref = obj2;
  obj2.ref = obj1;
  let errorCaught = false;
  try {
    JSON.stringify(obj1);
  } catch (e) {
    errorCaught = e instanceof TypeError;
  }
  return { result: errorCaught, expected: true };
}

export function testClassInstanceCircularWithPlainObject() {
  class MyClass {
    constructor() {
      this.ref = null;
    }
  }
  const obj = new MyClass();
  const plain = { classRef: obj };
  obj.ref = plain;
  let errorCaught = false;
  try {
    JSON.stringify(obj);
  } catch (e) {
    errorCaught = e instanceof TypeError;
  }
  return { result: errorCaught, expected: true };
}
