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

export function getLooper2Fn1() {
    const pairs = [[1, 'a'], [2, 'b'], [3, 'c']];
    const result = [];
    for (let i = 0; i < pairs.length; i++) {
        const [num, str] = pairs[i];
        result.push(`${num}-${str}`);
    }
    return result;
}

export function getLooper2Fn2() {
    const safeIterable = {
        [Symbol.iterator]() {
            let count = 0;
            const maxIter = 5;
            return {
                next: () => {
                    if (count < maxIter) {
                        return { value: count++, done: false };
                    }
                    return { value: undefined, done: true };
                }
            };
        }
    };
    const values = [];
    for (const val of safeIterable) {
        values.push(val);
    }
    return values;
}

export function getLooper2Fn3() {
    const sym1 = Symbol('sym1');
    const sym2 = Symbol('sym2');
    const obj = {
        str: 'test',
        [sym1]: 'symVal1',
        [sym2]: 'symVal2'
    };
    Object.defineProperty(obj, sym1, { enumerable: true });
    const keys = [];
    for (const key in obj) {
        keys.push(key);
    }
    return keys;
}

export const data = [
    { user: { name: 'Alice' } },
    { user: null },
    { profile: { name: 'Bob' } }
];

export function getLooper2Fn4() {
    const map = new Map([['id', 100], ['name', 'Test'], ['active', true]]);
    const entries = [];
    for (const [key, value] of map.entries()) {
        entries.push(`${key}:${value}`);
    }
    return entries;
}

export const events = [
    { id: 1, date: new Date('2024-01-01') },
    { id: 2, date: new Date('2024-02-01') },
    { id: 3, date: new Date('2024-03-01') }
];


export function getLooper2Fn5() {
    let isCleaned = false;
    const resourceIterable = {
        [Symbol.iterator]() {
            let count = 0;
            return {
                next: () => ({ value: count++, done: count > 5 }),
                return: () => {
                    isCleaned = true;
                    return { done: true };
                }
            };
        }
    };
    for (const val of resourceIterable) {
        if (val === 2) {
            break;
        }
    }
    return isCleaned;
}

export function getLooper2Fn6() {
    const transactions = [
        { id: 1, date: new Date('2024-01-15'), amount: 100 },
        { id: 2, date: new Date('2024-02-20'), amount: 200 },
        { id: 3, date: new Date('2024-01-25'), amount: 150 }
    ];
    const grouped = transactions.reduce((acc, tx) => {
        const month = tx.date.getMonth() + 1; // Months are 0-indexed
        if (!acc[month]) {
            acc[month] = [];
        }
        acc[month].push(tx.id);
        return acc;
    }, {});
    return grouped;
}

export function getLooper2Fn7() {
    const arrayLike = {
        0: 'x',
        1: 'y',
        2: 'z',
        length: 3
    };
    const keys = [];
    const values = [];
    for (const key in arrayLike) {
        keys.push(key);
        values.push(arrayLike[key]);
    }
    return values;
}

export function getLooper2Fn8() {
    let list = new Array();
    const node13 = { value: 3, next: null };
    const node12 = { value: 2, next: node13 };

    const node11 = { value: 1, next: node12 };

    let current = node11;
    while (current) {
        list.push(current.value);
        current = current.next;
    }
    return list;
}

export function getLooper2Fn9() {
    let list = new Array();
    const obj = { x: 1, y: 2, z: 3 };
    for (let key in obj) {
        if (key === 'y') {
            break;
        }
        list.push(key);
    }
    return list;
}

export function getLooper2Fn10() {
    let list = new Array();
    const obj = {
        a: 1,
        b: 2,
        c: 3,
        d: 4
    };
    for (let key in obj) {
        if (key === 'b') {
            continue;
        }
        list.push(key);
        list.push(obj[key]);
    }
    return list;
}

export function getLooper2Fn11() {
    let list = new Array();
    const person = { name: 'Alice', age: 30 };
    for (let key in person) {
        list.push(key);
        list.push(person[key]);
    }
    return list;
}

export function getLooper2Fn12() {
    let list = new Array();
    const parent = { x: 10 };
    const child = Object.create(parent);
    child.y = 20;
    for (let key in child) {
        list.push(key);
    }
    return list;
}

export function getLooper2Fn13() {
    let list = new Array();
    const parent = { x: 10 };
    const child = Object.create(parent);
    child.y = 20;
    for (let key in child) {
        if (child.hasOwnProperty(key)) {
            list.push(key);
        }
    }
    return list;
}

export function getLooper2Fn14() {
    let list = new Array();
    const arr = [1, 2, 3];
    arr.foo = 'bar';
    for (let idx in arr) {
        list.push(idx);
    }
    return list;
}

export function getLooper2Fn16() {
    let list = new Array();
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', {
        value: 2,
        enumerable: false
    });
    for (let key in obj) {
        list.push(key);
    }
    return list;
}

export function getLooper2Fn17() {
    let list = new Array();

    const arr = [3, 1, 2];
    arr[5] = 5;
    for (let idx in arr) {
        list.push(idx + " -> " + arr[idx])
    }
    return list;
}


export function getLooper2Fn18() {
    let list = new Array();
    const obj = { a: 1, b: 2, c: 3 };
    for (let key in obj) {
        if (key === 'b') {
            break;
        }
        list.push(key);
    }
    return list;
}

export function getLooper2Fn19() {
    let list = new Array();
    const obj = {
        a: 1,
        b: 2,
        c: 3,
        d: 4
    };
    for (let key in obj) {
        if (key === 'b') {
            continue;
        }
        list.push(key);
    }
    return list;
}

export function getLooper2Fn20() {
    let list = new Array();
    for (let key in null) {
        list.push(key);
    }
    for (let key in undefined) {
        list.push(key);
    }
    return list;
}

export function getLooper2Fn21() {
    let list = new Array();
    const str = 'hello';
    for (let idx in str) {
        list.push(idx + '->' + str[idx]);
    }
    return list;
}


export function getLooper2Fn22() {
    let list = new Array();
    const arr = [1, 2, 3];
    for (let idx in arr) {
        if (idx === '1') {
            arr.length = 2;
        }
        list.push(arr[idx]);
    }
    return list;
}

export function getLooper2Fn23() {
    let list = new Array();
    const obj = { a: 1, b: 2 };
    list.push('for...in:');
    for (let key in obj) {
        list.push(key);
    }
    list.push('Object.keys:');
    Object.keys(obj).forEach(key => list.push(key));
    return list;
}

export function getLooper2Fn24() {
    let list = new Array();
    const map = new Map();
    map.set('a', 1);
    map.set('b', 2);
    for (let [key, val] of map) {
        list.push(key);
        list.push(val);
    }
    return list;
}

export function getLooper2Fn25() {
    let list = new Array();
    const iterable = {
        [Symbol.iterator]() {
            let count = 0;
            return {
                next() {
                    count++;
                    return count <= 3 ? { value: count, done: false } : { done: true };
                }
            };
        }
    };
    for (let val of iterable) {
        list.push(val);
    }
    return list;
}

export function getLooper2Fn26() {
    let list = new Array();

    function* generator() {
        yield 1;
        yield 2;
        yield 3;
    }

    for (let val of generator()) {
        list.push(val);
    }
    return list
}

export function getLooper2Fn27() {
    let list = new Array();
    const arr = [1, 2, 3];
    arr.foo = 'bar';
    list.push('for...of:');
    for (let val of arr) {
        list.push(val);
    }
    list.push('for...in:');
    for (let idx in arr) {
        list.push(idx);
    }
    return list;
}

export function getLooper2Fn28() {
    let list = new Array();
    const arr = ['a', 'b', 'c'];
    for (let [idx, val] of arr.entries()) {
        list.push(idx + '->' + val);
    }
    return list;
}