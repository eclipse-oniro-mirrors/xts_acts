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

export function getLooper5Fn1() {
    let list = new Array();
    const loopParams = [1, 10, 2];
    const [start, end, step] = loopParams;
    for (let i = start; i <= end; i += step) {
        list.push(step);
        list.push(i);
    }
    return list;
}

export function getLooper5Fn2() {
    let list = new Array();
    const cart = {
        items: [1, 2, 3],
        hasItems() {
            return this.items.length > 0;
        }
    };
    for (let i = 0; cart.hasItems() && i < cart.items.length; i++) {
        list.push(cart.items[i]);
        cart.items.pop();
    }
    return list;
}

export function getLooper5Fn3() {
    let list = new Array();
    const rows = 5;
    for (let i = 0; i < rows; i++) {
        let row = [];
        for (let j = 0; j <= i; j++) {
            row[j] = j === 0 || j === i ? 1 : row[j - 1] + (i > 1 ? row[j - 1] : 0);
        }
        list.push(row.join(' '));
    }
    return list;
}


export function getLooper5Fn4() {
    let list = new Array();

    function getBase() {
        return 2;
    }

    function multiplyBy2(num) {
        return num * 2;
    }

    function add3(num) {
        return num + 3;
    }

    for (let i = add3(multiplyBy2(getBase())); i <= 10; i++) {
        list.push(i);
    }
    return list;
}

export function getLooper5Fn5() {
    let list = new Array();
    const userScores = { Alice: 85, Bob: 90, Charlie: 78 };
    const scores = Object.values(userScores);
    for (let i = 0; i < scores.length && scores[i] >= 80; i++) {
        list.push(scores[i]);
    }
    return list;
}

export function getLooper5Fn6() {
    let list = new Array();
    const user = { name: 'Alice' };
    for (let i = 1; i <= 3; i++) {
        user[`hobby${i}`] = i === 1 ? 'reading' : i === 2 ? 'coding' : 'running';
    }
    list.push(user.name);
    return list;
}

export function getLooper5Fn7() {
    let list = new Array();
    const str = 'hello world';
    let reversed = '';
    for (let i = str.length - 1; i >= 0; i--) {
        reversed += str[i];
    }
    list.push(reversed);
    return list;
}

export function getLooper5Fn8() {
    let list = new Array();
    const source = { a: 1, b: { c: 2 }, d: [3, 4] };
    const target = {};
    for (let key in source) {
        if (typeof source[key] === 'object' && source[key] !== null) {
            target[key] = Array.isArray(source[key]) ? [...source[key]] : { ...source[key] };
        } else {
            target[key] = source[key];
        }
    }
    source.b.c = 99;
    list.push(target.b.c);
    return list;
}

export function getLooper5Fn8_1() {
    let list = new Array();
    const matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    const transposed = [];
    for (let i = 0; i < matrix[0].length; i++) {
        const row = [];
        for (let j = 0; j < matrix.length; j++) {
            row.push(matrix[j][i]);
        }
        transposed.push(row);
    }
    list.push(transposed);
    return list;
}

export function getLooper5Fn9() {
    let list = new Array();
    const products = [
        { category: 'electronics', name: 'phone' },
        { category: 'clothes', name: 'shirt' },
        { category: 'electronics', name: 'laptop' }
    ];
    for (let i = 0; i < products.length; i++) {
        const product = products[i];
        list.push(product.category);
        list.push(i + 1);
        list.push(product.name);
    }
    return list;
}

export function getLooper5Fn10() {
    let list = new Array();
    let password;
    do {
        password = password === '12345' ? '123456' : password === undefined ? '123' : '12345';
        list.push(password);
        if (password.length < 6) {
            list.push('Error');
        }
    } while (password.length < 6);
    list.push('successfully');
    return list;
}

export function getLooper5Fn11() {
    let a = 0, b = 1, count = 0;
    const fibonacci = [];
    do {
        fibonacci.push(a);
        [a, b] = [b, a + b];
        count++;
    } while (count < 10);
    return fibonacci;
}

export function getLooper5Fn12() {
    const node5 = { value: 5, next: null };
    const node4 = { value: 4, next: node5 };
    const node3 = { value: 3, next: node4 };
    const node2 = { value: 2, next: node3 };
    const node1 = { value: 1, next: node2 };

    let current = node1;
    const evenNodes = [];
    do {
        if (current.value % 2 === 0) {
            evenNodes.push(current.value);
        }
        current = current.next;
    } while (current);
    return evenNodes;
}

export function getLooper5Fn13() {
    let list = new Array();
    const elements = [
        { id: 'el1', style: { color: 'red' } },
        { id: 'el2', style: { color: 'blue' } },
        { id: 'el3', style: { color: 'red' } }
    ];

    let index = 0;
    do {
        const el = elements[index];
        if (el.style.color === 'red') {
            el.style.color = 'green';
            list.push(el.id);
        }
        index++;
    } while (index < elements.length);
    list.push(elements.toString());
    return list;
}