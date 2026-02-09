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

export function testArrayForEachJs0004() {
    const arr = [1, 2];
    const result = arr.forEach((x) => {
        x + 1;
    });
    return result === undefined;
}

export function testArrayForEachJs0010() {
    const arr = [10];
    let isUndefined = false;
    arr.forEach(function () {
        if (this === undefined) {
        isUndefined = true;
    }
    });
    return isUndefined == true;
}

export function testArrayForEachJs0021() {
    const arr = Array.from({ length: 50 }, (_, i) => i);
    let sum = 0;
    arr.forEach((n) => {
        sum += n;
    });
    return sum == 1225;
}

export function testArrayForEachJs0023() {
    class MyArray extends Array {}
    MyArray.prototype[0] = 100;
    const arr = new MyArray(1, 2, 3);
    const values = [];
    arr.forEach((n) => {
        values.push(n);
    });
    return values;
}

export function testArrayForEachJs0027() {
    const arr = [1, 2, 3];
    delete arr[1];
    const values = [];
    arr.forEach((v) => values.push(v));
    return values;
}

export function testArrayForEachJs0042() {
    const arr = Object.freeze([1, 2, 3]);
    const out = [];
    arr.forEach((v) => out.push(v));
    return out;
}

export function testArrayForEachJs0043() {
    const arr = [1, 2];
    arr.custom = 99;
    const values = [];
    arr.forEach((v) => values.push(v));
    return values;
}

export function testArrayForEachJs0046() {
    const s1 = Symbol("a");
    const arr = [s1];
    const result = [];
    arr.forEach((sym) => result.push(sym.toString()));
    return result;
}

export function testArrayForEachJs0056() {
    const base = [1, 2, 3];
    Object.prototype[99] = 100;
    const collected = [];
    base.forEach((v) => collected.push(v));

    delete Object.prototype[99];
    return collected;
}

export function testArrayForEachJs0063() {
    const arr = [1, 2, 3];
    const collected = [];
    arr.forEach((v, idx, a) => {
        if (idx === 1) {
            delete a[2];
        }
        collected.push(v);
    });
    return collected;
}

export function testArrayForEachJs0064() {
    const arr = Object.freeze([1, 2, 3]);
    const collected = [];
    arr.forEach((v) => collected.push(v));
    return collected;
}

export function testArrayForEachJs0066() {
    const arr = [1, 2];
    (arr).extra = 99;
    const collected = [];
    arr.forEach((v) => collected.push(v));
    return collected;
}

export function testArrayForEachJs0076() {
    const arr = [1];
    Object.freeze(arr);
    let count = 0;
    arr.forEach(() => count++);
    return count;
}

export function testArrayForEachJs0082() {
    const context = { total: 0 };
    [1, 2, 3].forEach(function (v) {
        this.total += v;
    }, context);
    return context.total;
}

export function testArrayForEachJs0086() {
    const src = [{ x: 1 }, { x: 2 }];
    const dst = [];
    src.forEach(obj => dst.push({ ...obj }));
    return dst[0] === src[0];
}

export function testArrayForEachJs0087() {
    const likeArray = { 0: "a", 1: "b", length: 2 };
    let result = "";
    Array.prototype.forEach.call(likeArray, (v) => result += v);
    return result;
}

export function testArrayForEachJs0091() {
    [1, 2].forEach(null);
}

export function testArrayForEachJs0092() {
    const arr = [1, 2, 3];
    const visited = [];
    arr.forEach((v, i, a) => {
        if (i === 0) delete a[1];
        visited.push(v);
    });
    return visited;
}

export function testArrayForEachJs0098() {
    const arr = [1, 2];
    const result = arr.forEach(v => v);
    return result === undefined;
}

export function testArrayForEachJs0099() {
    const arr = Object.freeze([1, 2]);
    let sum = 0;
    arr.forEach(v => sum += v);
    return sum;
}

export function testArrayForEachJs0101() {
    const arr = Array.from({ length: 100 }, (_, i) => i);
    let sum = 0;
    arr.forEach(v => sum += v);
    return sum;
}

export function testArrayForEachJs0105() {
    const arr = [1, 2];
    (arr)[Symbol.toStringTag] = "CustomArray";
    let sum = 0;
    arr.forEach(v => sum += v);
    return sum;
}

export function testArrayForEachJs0106() {
    let result = false;
    const arr = [1];
    (Array.prototype)[1] = 99;
    let visited = [];
    arr.forEach(v => visited.push(v));
    if(visited[0] ==1 && visited.length == 1) result = true;
    delete (Array.prototype)[1];
    return result;
}

export function testArrayForEachJs0115() {
    const obj = { 0: "x", length: 3 };
    let result = "";
    Array.prototype.forEach.call(obj, (v) => result += v ?? "_");
    return result;
}

export function testArrayForEachJs0122() {
    const arr = [1];
    Array.prototype.push.call(arr, 2);
    let sum = 0;
    arr.forEach(v => sum += v);
    return sum;
}

export function testArrayForEachJs0130() {
    const arr = [1, 2, 3];
    const visited = [];
    arr.forEach((v, i, a) => {
        if (i === 0) delete a[1];
        visited.push(v);
    });
    return visited;
}

export function testArrayForEachJs0133() {
    const obj = { 0: "a", 1: "b", length: 2 };
    const collected = [];
    Array.prototype.forEach.call(obj, (v) => collected.push(v));
    return collected;
}

export function testArrayForEachJs0137() {
    const obj = { 0: 10, 1: 20, length: 2 };
    let sum = 0;
    Array.prototype.forEach.call(obj, (v) => sum += v);
    return sum;
}

export function testArrayForEachJs0138() {
    let result = false;
    Array.prototype[0] = 99;
    const arr = new Array(1);
    const visited = [];
    arr.forEach(v => visited.push(v));
    if(visited[0] == 99) result = true;
    delete (Array.prototype)[0];
    return result;
}

export function testArrayForEachJs0140() {
    const sym1 = Symbol("a"), sym2 = Symbol("b");
    const arr = [sym1, sym2];
    const collected = [];
    arr.forEach(v => collected.push(v));
    return [collected[0] === sym1, collected[1] === sym2];
}

export function testArrayForEachJs0141() {
    const arr = [];
    Object.defineProperty(arr, "0", { get: () => 10, configurable: true, enumerable: true });
    const result = [];
    arr.forEach(v => result.push(v));
    return result;
}

export function testArrayForEachJs0142() {
    let external = 0;
    const arr = [];
    Object.defineProperty(arr, "0", { set: (v) => { external = v; }, enumerable: true });
    arr.forEach(v => v);
    return external;
}

export function testArrayForEachJs0143() {
    class Accumulator { total = 0; add(v) { this.total += v; } }
    const acc = new Accumulator();
    const arr = [1, 2];
    arr.forEach(function(v) { this.add(v); }, acc);
    return acc.total;
}

export function testArrayForEachJs0149() {
    const obj = { 0: "x", length: 3 };
    const visited = [];
    Array.prototype.forEach.call(obj, (v) => visited.push(v ?? "_"));
    return visited;
}