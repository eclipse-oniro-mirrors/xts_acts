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

export const items = [
    { type: 'book', name: 'JS Guide' },
    { type: 'electronics', name: 'Laptop' },
    { type: 'book', name: 'TS Handbook' },
    { type: 'electronics', name: 'Phone' }
];

export function testFn() {
    const context = { multiplier: 5 };
    const nums = [2, 4, 6];
    const result = [];

    nums.forEach(function (val) {
        result.push(val * this.multiplier);
    }, context);
    return result
}


export const arrayLike = { 0: 'foo', 1: 'bar', length: 2 };


export function testFn2() {
    const iterableObj = {
        data: ['x', 'y', 'z'],
        [Symbol.iterator]() {
            let index = 0;
            return {
                next: () => {
                    if (index < this.data.length) {
                        return { value: this.data[index++], done: false };
                    }
                    return { value: undefined, done: true };
                },
                thisArg: this
            };
        }
    };

    const values = [];
    for (const val of iterableObj) {
        values.push(val);
    }
    return values;

}

export function testFn3() {
    const node3 = { value: 3, next: null };
    const node2 = { value: 2, next: node3 };
    const node1 = { value: 1, next: node2 };

    let currentNode = node1;
    const values = [];
    while (currentNode) {
        values.push(currentNode.value);
        currentNode = currentNode.next;
    }
    return values;
}

export const users = [
    { id: 1, name: 'Alice' },
    { id: 2, name: 'Bob' },
    { id: 3, name: 'Bob' }
];


export const mockNodeList = {
    0: { tagName: 'DIV' },
    1: { tagName: 'SPAN' },
    2: { tagName: 'P' },
    length: 3,
};

export function testFn4() {
    let isReturnCalled = false;
    const iterable = {
        [Symbol.iterator]() {
            let index = 0;
            return {
                next: () => ({ value: index++, done: index > 3 }),
                return: () => {
                    isReturnCalled = true;
                    return { done: true };
                }
            };
        }
    };

    for (const val of iterable) {
        if (val === 1) {
            break;
        }
    }
    return isReturnCalled;
}

const arr1 = [1, 2, 3];

export const mapped = arr1.map(val => {
    if (val % 2 === 0) {
        return val * 2;
    }
});

export const products = [
    { name: 'Laptop', price: 999 },
    { name: 'Mouse', price: 25 },
    { name: 'Keyboard', price: 50 },
    { name: 'Monitor', price: 300 }
];

export function testFn5() {
    const arr = [10, 20];
    Object.defineProperty(arr, 'hiddenProp', {
        value: 'secret',
        enumerable: false
    });
    const keys = [];
    for (const key in arr) {
        keys.push(key);
    }
    return keys;
}

export const users2 = [
    { name: 'Alice', age: 25 },
    { name: 'Bob', age: 30 }
];

export const largeArr = Array.from({ length: 1000 }, (_, i) => i);


export const users3 = [
    { name: 'Alice', details: { age: 25 } },
    { name: 'Bob', details: { age: 30 } }
];

export const agedUsers3 = users3.map(user => ({
    ...user,
    details: { ...user.details, age: user.details.age + 5 }
}));


const threeDArr = [
    [1, [2, 3]],
    [4, [5, 6, [7]]]
];

export const totalSum = threeDArr.reduce((acc, curr) => {
    if (Array.isArray(curr)) {
        return acc + curr.reduce((innerAcc, innerCurr) => {
            return innerAcc + (Array.isArray(innerCurr) ? innerCurr[0] : innerCurr);
        }, 0);
    }
    return acc + curr;
}, 0);


export function testFn6() {
    Array.prototype.customMethod = function () {
    };
    Object.defineProperty(Array.prototype, 'customProp', {
        value: 'protoVal',
        enumerable: true
    });

    const arr = [1, 2];
    const keys = [];
    for (const key in arr) {
        keys.push(key);
    }
    delete Array.prototype.customMethod;
    delete Array.prototype.customProp;
    return keys;
}

export function testFn7() {
    const limitedIterable = {
        data: [1, 2, 3, 4, 5],
        limit: 3,
        [Symbol.iterator]() {
            let index = 0;
            const { data, limit } = this;
            return {
                next: () => {
                    if (index < data.length && index < limit) {
                        return { value: data[index++], done: false };
                    }
                    return { value: undefined, done: true };
                }
            };
        }
    };

    const values = [];
    for (const val of limitedIterable) {
        values.push(val);
    }
    return values;
}


const products1 = [
    { name: 'Shirt', price: 25, inStock: true },
    { name: 'Pants', price: 40, inStock: false },
    { name: 'Socks', price: 10, inStock: true },
    { name: 'Shoes', price: 50, inStock: true }
];

export const affordableInStock1 = products1.filter(prod => prod.price < 30 && prod.inStock);

export function testFn8() {
     const obj = {
        firstName: 'John',
        lastName: 'Doe',
        get fullName() {
            return `${this.firstName} ${this.lastName}`;
        }
    };
    const props = [];
    for (const key of obj) {
        props.push(key);
    }
    return props;
}

export const data1 = [
    { id: 1, details: { city: 'Beijing' } },
    { id: 2, details: { city: 'Shanghai' } },
    { id: 3, details: { city: 'Guangzhou' } }
];

export const users5 = [
    { name: 'Alice', age: 25 },
    { name: 'Bob' },
    { name: 'Charlie', age: null },
    { name: 'Dave', age: 30 }
];

export function testFn9() {
    const objects = [
        { a: 1, b: 2 },
        { b: 3, c: 4 },
        { c: 5, d: 6 }
    ];
    const merged = objects.reduce((acc, curr) => ({ ...acc, ...curr }), {});
    return merged;
}