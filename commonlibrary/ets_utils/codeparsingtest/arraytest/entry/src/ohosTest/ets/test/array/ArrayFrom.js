/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export function testArrayFromJs0008() {
    const arrayLike = { length: 3, 0: 'a',
        1: 'b', 2: 'c' };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0009() {
    const arrayLike = { length: 3, 0: 'a', 2: 'c' };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0013() {
    const multiplier = { value: 2 };
    const arr = Array.from([1, 2, 3], function (num) {
        return num * this.value;
    }, multiplier);
    return arr;
}

export function testArrayFromJs0016() {
    const arrayLike = { length: 0 };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0020() {
    function* range(start, end) {
        for (let i = start; i <= end; i++) {
            yield i;
        }
    }
    const arr = Array.from(range(1, 3));
    return arr;
}

export function testArrayFromJs0022() {
    const arrayLike = { length: 4, 0: 10, 3: 40 };
    const arr = Array.from(arrayLike);
    expect(arr).assertDeepEquals([10, undefined, undefined, 40]);
    return arr;
}

export function testArrayFromJs0025() {
    const obj1 = { id: 1 };
    const obj2 = { id: 2 };
    const arrayLike = {
        length: 2,
        0: obj1,
        1: obj2
    };
    const arr = Array.from(arrayLike);
    return [arr[0] === obj1, arr[1] === obj2];
}

export function testArrayFromJs0026() {
    const obj1 = { value: 10 };
    const obj2 = { value: 20 };
    const arrayLike = {
        length: 2,
        0: obj1,
        1: obj2
    };
    const arr = Array.from(arrayLike, (obj) => {
        obj.value *= 2;
        return obj;
    });
    return [arr[0].value, arr[1].value];
}

export function testArrayFromJs0032() {
    const arrayLike = { length: 3.7, 0: 'a',
        1: 'b', 2: 'c' };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0033() {
    const arrayLike = { length: -2, 0: 'a', 1: 'b' };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0036() {
    const iterable = {
        *[Symbol.iterator]() {
            yield 'x';
            yield 'y';
            yield 'z';
        }
    };
    const arr = Array.from(iterable);
    return arr;
}

export function testArrayFromJs0037() {
    const sym1 = Symbol('sym1');
    const sym2 = Symbol('sym2');
    const set = new Set([sym1, sym2]);
    const arr = Array.from(set);

    if (arr.length !== 2) return false;
    if (arr[0] !== sym1 || arr[1] !== sym2) return false;
    if (typeof arr[0] !== 'symbol' || typeof arr[1] !== 'symbol') return false;

    return true;
}

export function testArrayFromjS0038() {
    const frozenObj = Object.freeze({ id: 1, value: 'frozen' });
    const arrayLike = { length: 1, 0: frozenObj };
    const arr = Array.from(arrayLike);

    if (arr.length !== 1) return false;
    if (arr[0].id !== 1 || arr[0].value !== 'frozen') return false;

    // Verify object remains frozen
    try {
        arr[0].id = 100;
        if (arr[0].id === 100) return false;
    } catch (e) {
        // Expected in strict mode
    }

    return true;
}

export function testArrayFromJs0039() {
    function* numberGenerator(count) {
        for (let i = 1; i <= count; i++) {
            yield i;
        }
    }

    const arr = Array.from(numberGenerator(3));

    if (arr.length !== 3) return false;
    if (arr[0] !== 1 || arr[1] !== 2 || arr[2] !== 3) return false;

    return true;
}

export function testArrayFromJs0040() {
    const obj1 = { name: 'obj1' };
    const obj2 = { name: 'obj2' };
    obj1.ref = obj2;
    obj2.ref = obj1;

    const arrayLike = { length: 2, 0: obj1, 1: obj2 };
    const arr = Array.from(arrayLike);

    if (arr.length !== 2) return false;
    if (arr[0].name !== 'obj1' || arr[1].name !== 'obj2') return false;
    if (arr[0].ref !== arr[1] || arr[1].ref !== arr[0]) return false;

    return true;
}

export function testArrayFromJs0043() {
    const arrayLike = { length: 2, '0': 'a', '1': 'b', '2': 'c' };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0044() {
    const arrayLike = { length: 2, 0: 'a', 1: 'b', [Symbol('key')]: 'c' };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0055() {
      const obj1 = { id: 1, value: 10 };
      const obj2 = { id: 2, value: 20 };
      const arrayLike = { length: 2, 0: obj1, 1: obj2 };
      const arr = Array.from(arrayLike);
      return [arr[0] === obj1, arr[1] === obj2];
}

export function testArrayFromJs0056() {
    const objArr = [
        { id: 1, name: 'item1' },
        { id: 2, name: 'item2' },
        { id: 3, name: 'item3' }
    ];
    const arr = Array.from(objArr, (obj) => obj.name);
    return arr;
}

export function testArrayFromJs0058() {
      const calculator = {
        factor: 3,
        multiply: function (num) {
          return num * this.factor;
        }
      };
      const arr = Array.from([1, 2, 3], function (num) {
        return this.multiply(num);
      }, calculator);
      return arr;
}

export function testArrayFromJs0059() {
    const arrayLike = { length: 1, 0: 5 };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0060() {
    const arrayLike = { length: 1, 0: 5 };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0065() {
    const arrayLike = { length: 3, 0: undefined, 1: 'b', 2: undefined };
    const arr = Array.from(arrayLike);
    return arr;
}

export function testArrayFromJs0070() {
    const arrayLike = { length: 1000 };
    // Populate array-like with sequential numbers
    for (let i = 0; i < 1000; i++) {
        arrayLike[i] = i;
    }
    const arr = Array.from(arrayLike);
    return [arr.length == 1000, arr[999] == 999];
}

export function testArrayFromJs0074() {
    const key1 = 'stringKey';
    const key2 = 123;
    const key3 = Symbol('symbolKey');
    const map = new Map([
        [key1, 'value1'],
        [key2, 'value2'],
        [key3, 'value3']
    ]);
    const arr = Array.from(map);
    return JSON.stringify(arr) === JSON.stringify([[key1, 'value1'], [key2, 'value2'], [key3, 'value3']]);
}

export function testArrayFromJs0078() {
    const transformer = {
        factor: 10,
        transform: function(value) {
        return value * this.factor;
    }
    };
    const arr = Array.from([1, 2, 3], function(num) {
        return this.transform(num);
    }, transformer);
    return arr;
}

export function testArrayFromJs0085() {
    const obj1 = {
        name: 'obj1',
        details: {
            active: true,
            metrics: { count: 10, ratio: 0.5 }
        }
    };
    const obj2 = {
        name: 'obj2',
        details: {
            active: false,
            metrics: { count: 20, ratio: 0.8 }
        }
    };
    const map = new Map([['key1', obj1], ['key2', obj2]]);
    const arr = Array.from(map);
    return JSON.stringify(arr) === JSON.stringify([['key1', obj1], ['key2', obj2]]);
}

export function testArrayFromJs0086() {
    const data = [
        { id: 1, values: ['a', 'b', 'c'] },
        { id: 2, values: ['x', 'y'] }
    ];
    const arr = Array.from(data, (item) => ({
        id: item.id,
        valueCount: item.values.length,
        firstValue: item.values[0]
    }));
    return JSON.stringify(arr) === JSON.stringify([
        { id: 1, valueCount: 3, firstValue: 'a' },
        { id: 2, valueCount: 2, firstValue: 'x' }
    ]);
}