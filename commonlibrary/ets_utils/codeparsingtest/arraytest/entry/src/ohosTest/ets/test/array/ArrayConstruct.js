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

export function testArrayConstructorJs0018() {
    const sym1 = Symbol('key1');
    const sym2 = Symbol('key2');
    const arr = new Array(sym1, sym2);
    return [arr.length === 2, arr[0] === sym1, arr[1] === sym2];
}

export function testArrayConstructorJs0033() {
    const elements = Array.from({ length: 5000 }, (_, i) => i);
    const arr = new Array(...elements);
    return[arr.length, arr[4999]];
}

export function testArrayConstructorJs0038() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    const arr = new Array(proxy);
    const expected = [proxy];
    return JSON.stringify(arr) === JSON.stringify(expected);
}

export function testArrayConstructorJs0039() {
    function* gen1() { yield 1; yield 2; };
    function* gen2() { yield 'a'; yield 'b'; };
    const arr = new Array(gen1, gen2);
    const expected = [gen1, gen2];
    return [JSON.stringify(arr) === JSON.stringify(expected), JSON.stringify(Array.from(arr[0]())) === JSON.stringify([1,2])];
}

export function testArrayConstructorJs0043() {
    const json1 = { name: 'test', value: 123 };
    const json2 = { items: [1, 2, 3], active: true };
    const arr = new Array(json1, json2);
    const expected = [json1, json2];
    return JSON.stringify(arr) === JSON.stringify(expected);
}

export function testArrayConstructorJs0047() {
    const arr = new Array();
    arr.push(1, arr, 3);
    return [arr.length === 3, arr[0] == 1, arr[1] === arr, arr[2] == 3]
}

export function testArrayConstructorJs0048() {
    const frozen1 = Object.freeze({ a: 1 });
    const frozen2 = Object.freeze([2, 3]);
    const arr = new Array(frozen1, frozen2);
    const expected = [frozen1, frozen2];
    return JSON.stringify(arr) === JSON.stringify(expected);
}

export function testArrayConstructorJs0049() {
    const sealed1 = { x: 10 };
    Object.seal(sealed1);
    const sealed2 = { y: 20 };
    Object.seal(sealed2);
    const arr = new Array(sealed1, sealed2);
    const expected = [sealed1, sealed2];
    return JSON.stringify(arr) === JSON.stringify(expected);
}

export function testArrayConstructorJs0050() {
    const sym = Symbol('test');
    const obj = { key: 'value' };
    const arr = new Array(42, 'text', true, null, undefined, sym, obj);
    const expected = [42, 'text', true, null, undefined, sym, obj];
    return JSON.stringify(arr) === JSON.stringify(expected);
}

export function testArrayConstructorJs0064() {
    const sym1 = Symbol.for('key1');
    const sym2 = Symbol.for('key2');
    const arr = new Array(sym1, sym2);
    return JSON.stringify(arr) === JSON.stringify([sym1, sym2]);
}

export function testArrayConstructorJs0065() {
    const sym1 = Symbol('unique1');
    const sym2 = Symbol('unique1');
    const arr = new Array(sym1, sym2);
    return [JSON.stringify(arr) === JSON.stringify([sym1, sym2]), sym1 === sym2];
}

export function testArrayConstructorJs0137() {
    // Creating array-like object
    const arrayLike = { 0: 'a', 1: 'b', 2: 'c', length: 3 };
    // Converting to array using Array.from due to ArkTS constraints
    const arr = Array.from(arrayLike);
    return arr
}

export function testArrayConstructorJs0141() {
    const arr = new Array(1, 'two', 3, 'four');
    const flatMapped = arr.flatMap(item => {
        if (typeof item === 'number') {
            return [item, item * 2];
        }
        return [item, item.toUpperCase()];
    });
    return flatMapped;
}