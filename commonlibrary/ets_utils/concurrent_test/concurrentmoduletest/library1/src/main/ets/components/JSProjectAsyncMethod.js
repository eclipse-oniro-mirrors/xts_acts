/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export async function sleep(time) {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve(1);
        }, time);
    });
};

export async function JSasyncTest1() {
    const num = 66;
    return num;
};

export let JSasyncTest2 = async () => {
    const num = 66;
    return num;
};

export const JSasyncTest3 = async function () {
    const num = 66;
    return num;
};

export async function JSasyncTest4() {
    throw new Error('For test');
};

export async function JSasyncTest5() {
    throw new Error('For test');
};

export async function JSasyncTest6(param) {
    throw new Error('For test');
};

export async function JSasyncTest7() {
    const num = '66';
    return num;
};

export async function JSasyncTest8(name) {
    const num = '66';
    return num;
};

export async function JSasyncTest9(name) {
    const num = 66;
    return num;
};

export async function JSasyncTest10(name) {
    const num = true;
    return num;
};

export async function JSasyncTest11(name) {
    const num = 66n;
    return num;
};


export async function JSasyncTest12(name) {
    return {
        age: 30
    };
};

export async function JSasyncTest13(name) {
    return {
        age: 30
    };
};

export async function JSasyncTest14(name) {
    const arr = [65, 66, 67];
    return arr;
};

export async function JSasyncTest15(name) {
    return () => 'Hello World!';
};

export async function JSasyncTest16(name) {
    throw new Error('For test');
    return;
};

export async function JSasyncTest17(name) {
    throw new Error('For test');
    return null;
};

export async function JSasyncTest18(name) {
    throw new Error('For test');
    return undefined;
};

export async function JSasyncTest19(name) {
    return new Error('For test');
};


class Person {
    name = '';

    constructor(n) {
        this.name = n;
    };
};

export async function JSasyncTest20(name) {
    let p = new Person('John');
    return p;
};

export async function JSasyncTest21() {
    throw new Error('For test');
};

async function for22JSasyncTest() {
    return 66;
};

export async function JSasyncTest22() {
    const result = for22JSasyncTest();
    return result;
};

async function for23JSasyncTest() {
    return 66;
};

export async function JSasyncTest23() {
    const result = await for23JSasyncTest();
    return result;
};

export async function JSasyncTest24() {
    let num = 0;
    setTimeout(() => {
        num = 66;
    }, 1000);
    while (num !== 66) {
        await sleep(300);
    }
    return num;
};

export async function JSasyncTest25() {
    let num = 0;
    await new Promise((resolve, reject) => {
        num = 66;
        resolve();
    });
    return num;
};


class For26JSasyncTest {
    name = '';
    age = 0;

    constructor(n, age) {
        this.name = n;
        this.age = age;
    }

    fullName() {
        return this.name;
    };

    getAge() {
        return this.age;
    };
}
;
export async function JSasyncTest26() {
    let p = new For26JSasyncTest('John', 66);
    let result = p.getAge();
    return result;
};