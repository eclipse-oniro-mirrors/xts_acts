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
'use strict'

export function ArrayConstructor1Test007() {
    const arr = [1, 2, 3];
    const typedArr = new Float64Array([1, 2, 3]);
    const r1 = arr.map(x => x).fill(-0, 1, 2);
    const r2 = Array.from(typedArr.map(x => x)).fill(-0, 1, 2);
    return [Object.is(r1[1], -0), Object.is(r2[1], -0)]
}

export function ArrayConstructor1Test021() {
    const arr = [0, -0, 1];
    const typedArr = new Float64Array([0, -0, 1]);
    const r1 = arr.map(x => x).reverse();
    const r2 = Array.from(typedArr.map(x => x)).reverse();
    return [r1 , Object.is(r1[1], -0), r2 , Object.is(r2[1], -0)]
}

export function ArrayConstructor1Test026() {
    const arr = Array(100).fill(0).map((_, i) => 100 - i);
    const typedArr = new Int32Array(arr);
    const r1 = arr.filter(x => x % 10 === 0).sort((a, b) => a - b);
    const r2 = Array.from(typedArr.filter(x => x % 10 === 0)).sort((a, b) => a - b);
    return [r1, r2]
}

export function ArrayConstructor1Test030() {
    const arr = [{id:1, val:0}, {id:2, val:0}];
    const r1 = arr.map(x => x).sort((a, b) => a.val - b.val);
    const typedArr = new Int32Array([0, 0]);
    const r2 = Array.from(typedArr.map(x => x)).sort();
    return [r1[0].id === 1, r1[1].id === 2, r2]
}

export function ArrayConstructor1Test032() {
    const arr = Array(5);
    arr[0] = 10; arr[4] = 50;
    const r1 = arr.filter(x => x !== undefined).fill(999);
    const typedArr = new Int32Array([10, 0, 0, 0, 50]);
    const r2 = Array.from(typedArr.filter(x => x !== 0)).fill(999);
    return [r1, r2]
}

export function ArrayConstructor1Test036() {
    const arr = [[1], [2]];
    const r1 = arr.flatMap(x => x).fill(undefined, 1);
    const typedArr = [new Float64Array([1]), new Float64Array([2])];
    const r2 = Array.from(typedArr.flatMap(x => Array.from(x))).fill(NaN, 1);
    return [r1, r2]
}

export function ArrayConstructor1Test044() {
    const obj = { a: 1 };
    const arr = [1, 2];
    const r1 = arr.filter(x => true).fill(obj);
    const typedArr = new Int32Array([1,2]);
    const r2 = Array.from(typedArr.filter(x => true)).fill(999);
    return [r1[0], r1[1], r2]
}

export function ArrayConstructor1Test045() {
    const arr = [{ length: 2, 0: 'x', 1: 'y' }];
    const r1 = arr.flatMap(x => [x[0], x[1]]).reverse();
    const typedSim = [new Int32Array([10, 20])];
    const r2 = Array.from(typedSim.flatMap(x => Array.from(x))).reverse();
    return [r1, r2]
}

export function ArrayConstructor1Test057() {
    let caught = false;
    try {
        [[1], [2]].flatMap(x => { if (x[0] === 2) throw "err"; return x; });
    } catch {
        caught = true;
    }
    try {
        [new Int32Array([1]), new Int32Array([2])].flatMap(x => {
            const v = x[0];
            if (v === 2) throw "err";
            return Array.from(x);
        });
    } catch {
        caught = true;
    }
    return caught
}

export function ArrayConstructor1Test058() {
    const arr = [10, 20, 30];
    const r1 = arr.map(x => x).copyWithin("2", 0, 1);
    const typedArr = new Int32Array([10,20,30]);
    const temp = Array.from(typedArr.map(x => x));
    const r2 = temp.copyWithin("2", 0, 1);
    return [r1, r2]
}

export function ArrayConstructor1Test065() {
    const arr = [0, -0, 1];
    const r = arr.filter(x => true).sort((a, b) => {
        if (Object.is(a, -0) && Object.is(b, 0)) return -1;
        if (Object.is(a, 0) && Object.is(b, -0)) return 1;
        return a - b;
    });
    return [Object.is(r[0], -0), r[1] === 0, r[2] === 1]
}

export function ArrayConstructor1Test067() {
    const n = 10000;
    const arr = new Array(n).fill(0).map((_, i) => i % 100);
    const ta = new Int16Array(arr);
    const r1 = arr.map(x => x).reverse();
    const r2 = Array.from(ta.map(x => x)).reverse();
    return [r1.length === n, r2.length === n, r1[0] === 99, r2[0] === 99]
}

export function ArrayConstructor1Test070() {
    const ta = new Int32Array([1, 2]);
    const temp = Array.from(ta.map(x => x));
    const r = temp.fill(undefined);
    const r2 = [1, 2].fill(0);
    const arr = [1, 2];
    const r3 = arr.fill(undefined);
    return [r, r2, r3[0]]
}

export function ArrayConstructor1Test073() {
    const arr = [10, 2];
    let caught = false;
    try {
        arr.map(x => x).sort((a, b) => a.localeCompare(b));
    } catch {
        caught = true;
    }
    return caught
}

export function ArrayConstructor1Test076() {
    const arr = [10, 20, 30];
    const r = arr.map(x => x).copyWithin(-0, 1, 2);
    return [r, Object.is(-0, -0)]
}

export function ArrayConstructor1Test082() {
    const arr = [10, 20, 30];
    const r = arr.map(x => x).fill(888, true);
    return r
}

export function ArrayConstructor1Test093() {
    let count = 0;
    const obj = {
        get 0() { count++; return [1]; },
        get 1() { count++; return [2]; },
        length: 2
    };
    const r = Array.from(obj).flatMap(x => x).fill(99);
    return [count === 2, r]
}

export function ArrayConstructor1Test096() {
    const sparse = new Array(3);
    sparse[0] = [1];
    sparse[2] = [2];
    const r = sparse.flatMap(x => x ?? []);
    return r.reverse()
}

export function ArrayConstructor1Test097() {
    const arr = [
        { id: 1, rank: 2 },
        { id: 2, rank: 1 },
        { id: 3, rank: 2 }
    ];
    const r = arr.map(x => x).sort((a, b) => a.rank - b.rank);
    return [r[0].id === 2, r[1].id === 1, r[2].id === 3]
}

export function ArrayConstructor1Test106() {
    const obj = { get x() { return 42; } };
    const arr = [1, 2];
    const r = arr.map(x => x).fill(obj.x);
    return r
}

export function ArrayConstructor1Test108() {
    const arr = [{ '0': 10, '1': 20, length: 2, name: 'test' }];
    const r = arr.flatMap(x => [x[0], x[1]]).reverse();
    return r
}

export function ArrayConstructor1Test114() {
    const arr = [1, 2];
    const r = arr.flatMap(x => [x]).fill(undefined, 1);
    return [r[0] === 1, r[1] === undefined]
}

export function ArrayConstructor1Test115() {
    const arr = [10, 20];
    const r = arr.map(x => x).copyWithin(null, 1);
    return r
}

export function ArrayConstructor1Test118() {
    const arr = [1, 2];
    const r = arr.map(x => x).fill(-0);
    return [Object.is(r[0], -0), Object.is(r[1], -0)]
}

export function ArrayConstructor1Test121() {
    const arr = Object.freeze([3, 1, 2]);
    const r = arr.map(x => x).sort((a, b) => a - b);
    return [r, arr]
}

export function ArrayConstructor1Test126() {
    const obj = { '0': 10, length: -5 };
    const arr = [obj];
    const r = arr.flatMap(x => x).reverse();
    return r
}

export function ArrayConstructor1Test129() {
    const obj = { val: 1 };
    const arr = [[obj], [obj]];
    const r = arr.flatMap(x => x).sort((a, b) => a.val - b.val);
    return [r[0], r[1]]
}

export function ArrayConstructor1Test135() {
    const arr = [1];
    const r = arr.flatMap(x => [x]).fill(undefined);
    return [r.hasOwnProperty(0), r[0] === undefined]
}

export function ArrayConstructor1Test138() {
    function* gen() { yield 5; yield 6; }
    const arr = [gen()];
    const r = arr.flatMap(_ => [5, 6]).reverse();
    return r
}

export function ArrayConstructor1Test139() {
    const arr = [1];
    const r = arr.map(x => x).fill(Object(-0));
    return Object.is(r[0], -0)
}