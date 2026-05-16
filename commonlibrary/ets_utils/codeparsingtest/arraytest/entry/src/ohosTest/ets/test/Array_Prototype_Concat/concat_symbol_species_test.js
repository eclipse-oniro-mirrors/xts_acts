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
export function testSymbolSpecies() {
  class MyArray extends Array {
    static get [Symbol.species]() {
      return Array;
    }
  }
  const myArr = new MyArray(1, 2, 3);
  const result = myArr.concat([4, 5]);
  return {
    result: result instanceof Array && !(result instanceof MyArray),
    expected: true
  };
}

export function testSymbolSpeciesCustom() {
  class MyArray extends Array {
    static get [Symbol.species]() {
      return MyArray;
    }
  }
  const myArr = new MyArray(1, 2, 3);
  const result = myArr.concat([4, 5]);
  return {
    result: result instanceof MyArray,
    expected: true
  };
}

export function testSymbolSpeciesNull() {
  class MyArray extends Array {
    static get [Symbol.species]() {
      return null;
    }
  }
  const myArr = new MyArray(1, 2, 3);
  const result = myArr.concat([4, 5]);
  return {
    result: result instanceof MyArray,
    expected: true
  };
}

export function testSymbolSpeciesUndefined() {
  class MyArray extends Array {
    static get [Symbol.species]() {
      return undefined;
    }
  }
  const myArr = new MyArray(1, 2, 3);
  const result = myArr.concat([4, 5]);
  return {
    result: result instanceof MyArray,
    expected: true
  };
}

export function testSymbolSpeciesInheritance() {
  class MyArray1 extends Array {
    static get [Symbol.species]() {
      return Array;
    }
  }
  class MyArray2 extends MyArray1 {
  }
  const myArr = new MyArray2(1, 2, 3);
  const result = myArr.concat([4, 5]);
  return {
    result: result instanceof Array && !(result instanceof MyArray1),
    expected: true
  };
}