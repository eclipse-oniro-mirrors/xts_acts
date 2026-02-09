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

export function getLooper3Fn1() {
    let list = new Array();
    const config = { start: 2, end: 5 };
    for (let i = config.start; i < config.end; i++) {
        list.push(i);
    }
    return list;
}


export function getLooper3Fn2() {
    let list = new Array();

    function getRange() {
        return [1, 4];
    }

    const [start, end] = getRange();
    for (let i = start; i < end; i++) {
        list.push(i);
    }
    return list;
}

export function getLooper3Fn3() {
    let list = new Array();

    function shouldContinue(num) {
        return num < 3;
    }

    for (let i = 0; shouldContinue(i); i++) {
        list.push(i);
    }
    return list;
}

export function getLooper3Fn4() {
    let list = new Array();
    const arrayLike = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    for (let i = 0; i < arrayLike.length; i++) {
        list.push(arrayLike[i]);
    }
    return list;
}

export function getLooper3Fn5() {
    let list = new Array();
    for (let i = null; i < 3; i++) {
        list.push(i ?? 'null');
    }
    return list;
}

export function getLooper3Fn6() {
    let list = new Array();
    const user = { score: 0 };
    do {
        user.score += 10;
        list.push(user.score);
    } while (user.score < 40);
    return list;
}

export function getLooper3Fn7() {
    let list = new Array();

    function hasItems(collection) {
        return collection.length > 0;
    }

    const items = [1, 2];
    do {
        list.push(items.pop());
    } while (hasItems(items));
    return list
}

export function getLooper3Fn8() {
    let list = new Array();
    let i = 0;
    do {
        list.push(i);
        i++;
    } while (i === NaN);
    return list;
}

export function getLooper3Fn9() {
    let list = new Array();
    let i = 0;
    do {
        list.push(i);
        i++;
        if (i === 3) {
            break;
        }
    } while (i < Infinity);
    return list;
}

export function getLooper3Fn10() {
    let list = new Array();
    const calculator = {
        value: 0,
        isPositive() {
            return this.value > 0;
        }
    };
    do {
        calculator.value += 1;
        list.push(calculator.value);
    } while (!calculator.isPositive());
    return list;
}

export function getLooper3Fn11() {
    let list = new Array();
    let value = null;
    let attempts = 0;
    do {
        value = attempts === 2 ? 'valid' : null;
        attempts++;
        list.push(value ?? 'null');
    } while (value === null && attempts < 4);
    return list;
}

export function getLooper3Fn12() {
    const results = [];
    let i = 0;
    do {
        results.push(i * 2);
        i++;
    } while (i < 4);
    return results;
}


export function getLooper3Fn13() {
    let list = new Array();

    function isBelowThreshold(num) {
        return num < 10;
    }

    let current = 2;
    while (isBelowThreshold(current)) {
        list.push(current);
        current *= 2;
    }
    return list;
}

export function getLooper3Fn14() {
    let list = new Array();
    const product = { stock: 5 };
    while (product.stock > 0) {
        list.push(`Stock left: ${product.stock}`);
        product.stock--;
    }
    return list;
}

export function getLooper3Fn15() {
    let list = new Array();
    const node4 = { val: 4, next: null };
    const node3 = { val: 3, next: node4 };
    const node2 = { val: 2, next: node3 };
    const node1 = { val: 1, next: node2 };
    let current = node1;
    while (current) {
        list.push(current.val);
        current = current.next;
    }
    return list;
}

export function getLooper3Fn16() {
    let list = new Array();
    let a = 0, b = 1;
    while (b < 10) {
        list.push(b);
        [a, b] = [b, a + b];
    }
    return list;
}

export function getLooper3Fn17() {
    let list = new Array();
    let data;
    let tries = 0;
    while (data === undefined && tries < 3) {
        data = tries === 2 ? 'data' : undefined;
        tries++;
        list.push(data ?? 'undefined');
    }
    return list;
}

export function getLooper3Fn18() {
    let list = new Array();

    function isTarget(num) {
        return num === 3;
    }

    let i = 0;
    do {
        i++;
        if (isTarget(i)) {
            break;
        }
        list.push(i);
    } while (i < 5);
    return list;
}


export function getLooper3Fn19() {
    let list = new Array();
    const inventory = new Map([
        ['apples', 5],
        ['bananas', 3],
        ['oranges', 7]
    ]);
    for (let [item, count] of inventory) {
        if (count < 5) {
            break;
        }
        list.push(`${item}: ${count}`);
    }
    return list;
}

export function getLooper3Fn20() {
    let list = new Array();
    const data = [1, 2, '3', 4];
    for (let i = 0; i < data.length; i++) {
        try {
            if (typeof data[i] !== 'number') {
                throw new Error('Not a number');
            }
            list.push(data[i] * 2);
        } catch (e) {
            list.push(e.message);
            break;
        }
    }
    return list;
}

export function getLooper3Fn21() {
    let list = new Array();
    const config = {
        debug: true,
        env: 'development',
        secret: 'xyz',
        port: 3000
    };
    for (let key in config) {
        if (key === 'secret') {
            continue;
        }
        list.push(`${key}: ${config[key]}`);
    }
    return list;
}

export function getLooper3Fn22() {
    let list = new Array();

    function shouldSkip(num) {
        return num > 2 && num < 5;
    }

    for (let i = 0; i < 7; i++) {
        if (shouldSkip(i)) {
            continue;
        }
        list.push(i);
    }
    return list;
}

export function getLooper3Fn23() {
    let list = new Array();
    const products = [
        { name: 'Laptop', inStock: true },
        { name: 'Phone', inStock: false },
        { name: 'Tablet', inStock: true },
        { name: 'Headphones', inStock: false }
    ];
    for (let i = 0; i < products.length; i++) {
        if (!products[i].inStock) {
            continue;
        }
        list.push(products[i].name);
    }
    return list;
}

export function getLooper3Fn24() {
    let list = new Array();
    const fruits = ['apple', 'banana', 'cherry', 'date'];
    for (let [index, fruit] of fruits.entries()) {
        if (index % 2 === 0) {
            continue;
        }
        list.push(`${index}: ${fruit}`);
    }
    return list;
}

export function getLooper3Fn25() {
    let list = new Array();
    const sparseArr = [1, , 3, , 5];
    for (let idx in sparseArr) {
        list.push(idx, sparseArr[idx]);
    }
    return list;
}

export function getLooper3Fn26() {
    let list = new Array();
    const obj = { a: 1, b: 2, c: 3 };
    list.push('for...in:');
    for (let key in obj) {
        list.push(key);
    }
    list.push('getOwnPropertyNames:');
    Object.getOwnPropertyNames(obj).forEach(key => console.log(key));
    return list;
}

export function getLooper3Fn27() {
    let list = new Array();
    const date = new Date();
    for (let key in date) {
        if (typeof date[key] === 'function') {
            continue;
        }
        list.push(key);
        list.push(date[key]);
    }
    return list;
}

export function getLooper3Fn28() {
    let list = new Array();

    class Person {
        constructor(name, age) {
            this.name = name;
            this.age = age;
        }

        greet() {
            return `Hello ${this.name}`;
        }
    }

    const person = new Person('Bob', 25);
    for (let key in person) {
        list.push(key + '->' + person[key]);
    }
    return list;
}

export function getLooper3Fn29() {
    let list = new Array();
    const obj = { prop: 'value' };
    Object.prototype.customMethod = function () {
    };
    for (let key in obj) {
        list.push(key);
    }
    delete Object.prototype.customMethod;
    return list;
}

export function getLooper3Fn30() {
    let list = new Array();
    const sym = Symbol('test');
    const obj = { a: 1, [sym]: 2 };
    for (let key in obj) {
        list.push(key);
    }
    return list;
}

export function getLooper3Fn31() {
    let list = new Array();
    const obj = { a: 1, b: 2, c: 3 };
    for (let key in obj) {
        if (key === 'b') {
            delete obj.c;
        }
        list.push(key + '->' + obj[key]);
    }
    return list;
}

export function getLooper3Fn32() {
    let list = new Array();
    const regex = /abc/g;
    for (let key in regex) {
        list.push(key + '->' + regex[key]);
    }
    return list;
}

export function getLooper3Fn33() {
    let list = new Array();
    const obj = Object.create(null);
    obj.a = 1;
    obj.b = 2;
    for (let key in obj) {
        list.push(key);
    }
    return list;
}

export function getLooper3Fn34() {
    let list = new Array();
    const str = 'test';
    const iterator = str[Symbol.iterator]();
    for (let char of iterator) {
        list.push(char);
    }
    return list;
}