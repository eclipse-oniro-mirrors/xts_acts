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

export function testArrayOfJs0018() {
    const func1 = (a, b)=> a + b;
    const func2 = (s) => s.toUpperCase();
    const arr = Array.of(func1, func2);
    return [arr.length == 2, arr[0](2, 3) == 5, arr[1]('test') == 'TEST'];
}

export function testArrayOfJs0020() {
    const sym1 = Symbol('key1');
    const sym2 = Symbol('key2');
    const arr = Array.of(sym1, sym2);
    return [arr.length == 2, arr[0] === sym1, arr[1] === sym2];
}

export function testArrayOfJs0021() {
    const mixedArr = Array.of(1, 'test', true);
    return [mixedArr.length == 3, mixedArr[0] == 1, mixedArr[1] == 'test', mixedArr[2] == true];
}

export function testArrayOfJs0023() {
    const params = Array.from({ length: 100 }, (_, i) => i);
    const arr = Array.of(...params);
    return [arr.length == 100, arr[99] == 99];
}

export function testArrayOfJs0031() {
    class MyArray extends Array {
        isMyArray() {
        return true;
    }
    }
    const arr = MyArray.of(1, 2, 3);
    return [arr instanceof MyArray == true, arr.isMyArray(), arr.length];
}

export function testArrayOfJs0032() {
    const customConstructor = {
        new(length) {
        return { length };
    },
    of(...elements) {
        const obj = this.new(elements.length);
        elements.forEach((elem, idx) => {
            obj[idx] = elem;
        });
        return obj;
    }
    };
    const result = customConstructor.of(1, 2, 3);
    return [result.length, (result)[0]];
}

export function testArrayOfJs0033() {
    const nonConstructor = { name: 'test' };
    const arr = Array.of.call(nonConstructor, 1, 2, 3);
    return [arr instanceof Array, arr.length];
}

export function testArrayOfJs0034() {
    const arr = Array.of.call(undefined, 1, 2, 3);
    return [arr instanceof Array, arr.length];
}

export function testArrayOfJs0035() {
    const arr = Array.of.call(null, 1, 2, 3);
    return [arr instanceof Array, arr.length];
}

export function testArrayOfJs0036() {
    const arr = Array.of.call(true, 1, 2, 3);
    return [arr instanceof Array, arr.length];
}

export function testArrayOfJs0037() {
    const arr = Array.of.call(123, 1, 2, 3);
    return [arr instanceof Array, arr.length];
}

export function testArrayOfJs0038() {
    const arr = Array.of.call('test', 1, 2, 3);
    return [arr instanceof Array, arr.length];
}

export function testArrayOfJs0039() {
    const arr = Array.of(1, 2, 3);
    return Object.getPrototypeOf(arr) === Array.prototype;
}

export function testArrayOfJs0045() {
    const str = 'test';
    const arr = Array.of(...str);
    return arr;
}

export function testArrayOfJs0056() {
    const circle1 = { radius: 2, getArea() { return Math.PI * 4; } };
    const circle2 = { radius: 3, getArea() { return Math.PI * 9; } };
    const arr = Array.of(circle1, circle2);
    return [arr.length, arr[0].getArea(), arr[1].getArea()];
}

export function testArrayOfJs0072() {
    const sym1 = Symbol('key');
    const sym2 = Symbol('key');
    const arr = Array.of(sym1, sym2);
    return [arr.length == 2 , arr[0] === sym1, arr[1] === sym2, arr[0] === arr[1]];
}

export function testArrayOfJs0098() {
    const sym = Symbol('test');
    const arr = Array.of(sym, 'symbol-test');
    return [arr.length, typeof arr[0], typeof arr[1], arr[0] === sym, arr[1] == 'symbol-test'];
}

