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


function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time));
}

export function getLooper4Fn1() {
    let list = new Array();
    const loopConfig = { start: 1, end: 4, step: 1 };
    for (let i = loopConfig.start; i <= loopConfig.end; i += loopConfig.step) {
        list.push(`Current value: ${i}`);
    }
    return list;
}

export function getLooper4Fn2() {
    let list = new Array();
    const targets = [5, 8, 12];
    const data = [1, 3, 5, 7, 9];
    for (let i = 0;!targets.find(t => t === data[i]) && i < data.length; i++) {
        list.push(`Current value:${data[i]}`);
    }
    return list;
}

export function getLooper4Fn3() {
    let list = new Array();
    const products = [{ inStock: true }, { inStock: false }, { inStock: true }];
    for (let i = 0; i < products.length && products[i].inStock; i++) {
        list.push(`In-stock product index: ${i}`);
    }
    return list;
}

export async function getLooper4Fn4() {
    let list = new Array();
    for (var i = 0; i < 3; i++) {
        setTimeout(() => list.push(`var i: ${i}`), 0);
    }
    for (let j = 0; j < 3; j++) {
        setTimeout(() => list.push(`let j: ${j}`), 0);
    }
    await sleep(500);
    return list;
}

export function getLooper4Fn5() {
    let list = new Array();

    function sum() {
        let total = 0;
        for (let i = 0; i < arguments.length; i++) {
            total += arguments[i];
        }
        return total;
    }

    list.push(`Sum: ${sum(1, 2, 3, 4)}`);
    return list;
}

export function getLooper4Fn6() {
    let list = new Array();
    let step = 1;

    function adjustStep() {
        step = step === 1 ? 2 : 1;
        return step;
    }

    for (let i = 0; i < 10; i += adjustStep()) {
        list.push(`i: ${i}, current step: ${step}`);
    }
    return list;
}

export function getLooper4Fn7() {
    let list = new Array();

    function formatData(num) {
        return num.toFixed(2) + '元';
    }

    const amounts = [10, 25.5, 33.333];
    for (let i = 0; i < amounts.length; i++) {
        const formatted = formatData(amounts[i]);
        list.push(`Formatted amount: ${formatted}`);
    }
    return list;
}

export function getLooper4Fn8() {
    let list = new Array();
    const [start, end] = [2, 5];
    for (let i = start; i <= end; i++) {
        list.push(`i ranges from ${start} to ${end}: ${i}`);
    }
    return list;
}

export function getLooper4Fn9() {
    let list = new Array();
    const node4 = { value: 4, next: null };
    const node3 = { value: 3, next: node4 };
    const node2 = { value: 2, next: node3 };
    const node1 = { value: 1, next: node2 };

    let current = node1;
    let nodeCount = 0;
    do {
        nodeCount++;
        list.push(nodeCount);
        list.push(current.value);
        current = current.next;
    } while (current);
    list.push(nodeCount);
    return list;
}

export async function getLooper4Fn10() {
    let count = 0;
    const maxCount = 3;

    let list = new Array();
    do {
        count++;
        await new Promise(resolve => {
            setTimeout(() => {
                list.push(`Async process ${count}/${maxCount} completed`);
                resolve();
            }, 500);
        });
    } while (count < maxCount);
    return list;
}

export function getLooper4Fn11() {
    let list = new Array();
    const tasks = [
        { completed: true },
        { completed: false },
        { completed: true }
    ];
    let index = 0;
    while (tasks.some(task => !task.completed) && index < tasks.length) {
        if (!tasks[index].completed) {
            list.push(index);
            tasks[index].completed = true;
        }
        index++;

    }
    return list;
}

export function getLooper4Fn12() {
    let list = new Array();
    const arr = [1, 2, 3, 4, 5];
    let left = 0;
    let right = arr.length - 1;
    while (left < right) {
        [arr[left], arr[right]] = [arr[right], arr[left]];
        left++;
        right--;
    }
    list.push(arr);
    return list;
}

export function getLooper4Fn13() {
    let list = new Array();
    let value = 1;
    while (typeof value === 'number') {
        list.push(value);
        value = value === 3 ? 'stop' : value + 1; // 第三次循环后改变类型
    }
    list.push(typeof value);
    return list;
}

export function getLooper4Fn14() {
    let list = new Array();
    const config = { step: 1, maxStep: 3 };
    while (config.hasOwnProperty('step') && config.step <= config.maxStep) {
        list.push(config.step);
        config.step++;
    }
    return list;
}

export function getLooper4Fn15() {
    let list = new Array();
    let actionCount = 0;
    let timeoutId;

    function simulateUserAction() {
        actionCount++;
        list.push(actionCount);

        clearTimeout(timeoutId);
        timeoutId = setTimeout(() => {
            list.push(actionCount + 'after debounce');
        }, 500);
    }

    let count = 0;
    while (count < 3) {
        simulateUserAction();
        count++;
    }
    return list;
}


export function getLooper4Fn16() {
    let list = new Array();
    const str = 'javascript programming';
    const targetChar = 'p';
    let index = 0;
    let count = 0;
    while (index < str.length) {
        if (str[index] === targetChar) {
            count++;
        }
        index++;
    }
    list.push(`Character '${targetChar}' appears ${count} times in '${str}'`);
    return list;
}

export function getLooper4Fn17() {
    let list = new Array();
    const config = { mode: 'dev', port: 3000, env: 'local' };
    for (let key in config) {
        list.push(key);
        list.push(config[key]);
        if (key === 'port') {
            list.push('end');
        }
    }
    return list;
}

export function getLooper4Fn19() {
    let list = new Array();
    const parent = { inherited: 'value' };
    const child = Object.create(parent);
    child.own = 'ownValue';

    for (let key in child) {
        if (!child.hasOwnProperty(key)) {
            list.push(key);
            continue;
        }
        list.push(key);
        list.push(child[key]);
    }
    return list;
}


export function getLooper4Fn20() {
    let list = new Array();
    const products = [
        { name: 'phone', price: 5000, inStock: true },
        { name: 'laptop', price: 8000, inStock: false },
        { name: 'tablet', price: 3000, inStock: true }
    ];

    for (let product of products) {
        if (product.price > 6000 || !product.inStock) {
            list.push(product.name);
            continue;
        }
        list.push(product.name);
        list.push(product.price);
    }
    return list;
}

export function getLooper4Fn21() {
    let list = new Array();
    const person = {
        name: 'Bob',
        age: 25,
        greet() {
            return `Hello ${this.name}`;
        }
    };

    for (let key in person) {
        if (typeof person[key] === 'function') {
            list.push(`Skipping method: ${key}`);
            continue;
        }
        list.push(key);
        list.push(person[key])
    }
    return list;
}

export function getLooper4Fn22() {
    let list = new Array();
    const sparseArr = [1, , 3, , 5];
    list.push(sparseArr.length);

    for (let idx in sparseArr) {
        list.push(idx);
        list.push(sparseArr[idx]);
    }
    return list;
}

export function getLooper4Fn23() {
    let list = new Array();
    const parent = { x: 10 };
    const child = Object.create(parent);
    child.y = 20;

    list.push('start');
    for (let key in child) {
        list.push(key);
    }

    list.push('traversal:');
    Object.keys(child).forEach(key => {
        list.push(key);
    });
    return list;
}

export function getLooper4Fn24() {
    let list = new Array();

    class Car {
        constructor(brand, year) {
            this.brand = brand;
            this.year = year;
        }

        start() {
            clist.push('Car started');
        }
    }

    const myCar = new Car('Toyota', 2023);
    for (let key in myCar) {
        list.push(key);
        list.push(myCar[key]);
    }
    return list;
}

export function getLooper4Fn25() {
    let list = new Array();
    const sym = Symbol('secret');
    const obj = {
        public: 'value',
        [sym]: 'secretValue' // Symbol属性
    };

    for (let key in obj) {
        list.push(key);
        list.push(obj[key]);
    }
    list.push('Symbol:');
    Object.getOwnPropertySymbols(obj).forEach(s => {
        list.push(s.description);
        list.push(obj[s]);
    });
    return list;
}

export function getLooper4Fn26() {
    let list = new Array();
    const obj = {
        a: 1,
        b: 2,
        c: 3,
        d: 4
    };

    for (let key in obj) {
        list.push(key);
        if (key === 'b') {
            delete obj.c;
            list.push('traversal');
        }
    }

    list.push(Object.keys(obj));
    return list;
}

export function getLooper4Fn27() {
    let list = new Array();
    const date = new Date('2024-01-01');

    for (let key in date) {
        if (typeof date[key] !== 'function') {
            list.push(key);
            list.push(date[key]);
        }
    }
    return list;
}

export function getLooper4Fn28() {
    let list = new Array();
    const regex = /abc/gmi;
    for (let key in regex) {
        if (typeof regex[key] !== 'function') {
            list.push(key);
            list.push(regex[key]);
        }
    }
    return list;
}

export function getLooper4Fn29() {
    let list = new Array();
    const noProtoObj = Object.create(null);
    noProtoObj.a = 1;
    noProtoObj.b = 2;
    for (let key in noProtoObj) {
        list.push(key);
        list.push(noProtoObj[key]);
    }
    list.push('end:', noProtoObj.__proto__);
    return list;
}

export function getLooper4Fn30() {
    let list = new Array();
    const userMap = new Map([
        ['id', 1],
        ['name', 'Alice'],
        ['age', 30]
    ]);

    for (let [key, value] of userMap) {
        list.push(key);
        list.push(value);
    }
    return list;
}

export function getLooper4Fn31() {
    let list = new Array();
    const nums = [1, 2, 3, 4];

    list.push(nums);
    for (let [index, num] of nums.entries()) {
        nums[index] = num * 2;
    }
    return list;
}

export function getLooper4Fn32() {
    let list = new Array();
    const colors = ['red', 'green', 'blue', 'yellow'];
    for (let [index, color] of colors.entries()) {
        list.push(index);
        list.push(color);
    }
    return list;
}