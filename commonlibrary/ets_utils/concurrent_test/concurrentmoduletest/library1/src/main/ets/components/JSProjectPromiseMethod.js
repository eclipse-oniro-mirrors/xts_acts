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

export const JSpromiseTest1 = new Promise((resolve) => {
    setTimeout(() => resolve('66'), 100);
});

export const JSpromiseTest2 = new Promise((resolve) => {
    setTimeout(() => resolve(66), 100);
});

export const JSpromiseTest3 = new Promise((resolve) => {
    setTimeout(() => resolve(true), 100);
});

export const JSpromiseTest4 = new Promise((resolve) => {
    setTimeout(() => resolve(66n), 100);
});


export const JSpromiseTest5 = new Promise((resolve) => {
    setTimeout(() => resolve({
        age: 30
    }), 100);
});

export const JSpromiseTest6 = new Promise((resolve) => {
    setTimeout(() => resolve({
        age: 30
    }), 100);
});

export const JSpromiseTest7 = new Promise((resolve) => {
    setTimeout(() => resolve([65, 66, 67]), 100);
});

export const JSpromiseTest8 = new Promise((resolve) => {
    setTimeout(() => resolve(() => 'Hello World!'), 100);
});

export const JSpromiseTest9 = new Promise((resolve) => {
    setTimeout(() => resolve(), 100);
});

export const JSpromiseTest10 = new Promise((resolve) => {
    setTimeout(() => resolve(null), 100);
});

export const JSpromiseTest11 = new Promise((resolve) => {
    setTimeout(() => resolve(undefined), 100);
});

export const JSpromiseTest12 = new Promise((_, reject) => {
    setTimeout(() => reject(new Error('For test')), 100);
});


export class Person {
    name = '';
    surname = '';

    constructor(n, sn) {
        this.name = n;
        this.surname = sn;
    }

    fullName() {
        return this.name + ' ' + this.surname;
    }
};

export const JSpromiseTest13 = new Promise((resolve) => {
    setTimeout(() => resolve(
        new Person('John', 'Smith')
    ), 100);
});


class For14JSpromiseTest {
    name = '';
    age = 0;

    constructor(n, age) {
        this.name = n;
        this.age = age;
    }

    fullName() {
        return this.name;
    }

    getAge() {
        return this.age;
    }
};

export const JSpromiseTest14 = new Promise((resolve) => {
    const p = new For14JSpromiseTest('John', 66);
    setTimeout(() => resolve(
        p.getAge()
    ), 100);
});

export const JSpromiseTest15 = new Promise((resolve) => {
    setTimeout(() => resolve(new Error('For test')), 100);
});

export const JSpromiseTest16 = new Promise((resolve) => {
    setTimeout(() => {resolve(66)}, 100);
});

export function JSpromiseTest17() {
    return new Promise((_, reject) => {
        setTimeout(() => {reject(new Error('For test'))}, 100);
    });
};

export function JSpromiseTest18() {
    return new Promise((_, reject) => {
        const errorMessage = 'For test';
        setTimeout(() => {reject(new Error(errorMessage))}, 100);
    });
};

export function JSpromiseTest19() {
    return new Promise((_, reject) => {
        setTimeout(() => {reject(new Error('For test'))}, 100);
    });
};


export function JSpromiseTest23(inputText) {
    const promise1 = new Promise(resolve => setTimeout(() => resolve(inputText), 100));
    const promise2 = new Promise(resolve => setTimeout(() => resolve(inputText), 100));
    const promise3 = new Promise((_, reject) => setTimeout(() => {reject(new Error('For test'))}, 100));

    return Promise.all([promise1, promise2, promise3])
        .finally(() => {
            console.log('end');
        });
};

export function JSpromiseTest24(num) {
    const promise1 = new Promise(resolve => setTimeout(() => resolve(num * 2), 100));
    const promise2 = new Promise(resolve => setTimeout(() => resolve(num * 3), 100));
    const promise3 = new Promise((resolve, reject) => setTimeout(() => {reject(new Error('For test'))}, 100));

    return Promise.race([promise1, promise2, promise3]);
};

export function JSpromiseTest25(num) {
    const promise1 = new Promise(resolve => setTimeout(() => resolve(num * 2), 100));
    const promise2 = new Promise(resolve => setTimeout(() => resolve(num * 3), 100));
    const promise3 = new Promise((resolve, reject) => setTimeout(() => {reject(new Error('For test'))}, 100));

    return Promise.allSettled([promise1, promise2, promise3]);
};

export function JSpromiseTest26(num) {
    const promise1 = new Promise(resolve => setTimeout(() => resolve(num * 2), 100));
    const promise2 = new Promise(resolve => setTimeout(() => resolve(num * 3), 100));
    const promise3 = new Promise((resolve, reject) => setTimeout(() => {reject(new Error('For test'))}, 100));

    return Promise.any([promise1, promise2, promise3]);
};

export const JSpromiseTest27 = new Promise((resolve) => {
    resolve(1);
})
    .then(value => value + 1)
    .then(value => value + 2)
    .then(value => value + 3)
    .then(value => value + 4)
    .then(value => value + 5);

export const JSpromiseTest28 = new Promise((resolve) => {
    resolve(1);
})
    .then(value => value + 1)
    .then(value => value + 2)
    .then(value => value + 3)
    .catch(error => {
        console.error('First catch:', error);
        return 0;
    })
    .catch(error => {
        console.error('Second catch:', error);
        return -1;
    });

export const JSpromiseTest29 = new Promise((resolve) => {
    resolve(1);
})
    .then(value => value + 1)
    .then(value => value + 2)
    .catch(error => {
        console.log('First catch:', error);
        return 0;
    })
    .catch(error => {
        console.log('Second catch:', error);
        return -1;
    })
    .finally(() => {
        console.log('end');
    });