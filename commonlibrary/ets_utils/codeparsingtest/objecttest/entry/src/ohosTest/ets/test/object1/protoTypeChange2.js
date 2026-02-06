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

export function protoTypeChange2Test(){
    class C85 extends Promise {}
    const v88 = new C85((resolve, reject) => {});
    const v103 = v88.catch();
    v103.finally(Date);
    C85.__proto__ = Float32Array;
    return true;
}
export function protoTypeChange2Test1(){
    class C85 extends Promise {}
    const v88 = new C85((resolve) => setTimeout(() => resolve('Success!'), 100));
    let result = [];

    console.log('--- Testing C85 instance behavior ---');
    result.push(v88 instanceof Promise);
    result.push(v88 instanceof C85);
    console.log('v88 status:', v88);

    v88.then(value => {
        console.log('Promise resolved with:', value);
    }).catch(err => {
        console.error('Promise rejected with:', err);
    });
    return result;
}

export function protoTypeChange2Test2(){
    class C85 extends Promise {}
    const p = new C85((resolve) => resolve());

    console.log('--- Testing return types of Promise methods ---');

    const thenPromise = p.then();
    const catchPromise = p.catch();
    const finallyPromise = p.finally();

    return [thenPromise instanceof C85, catchPromise instanceof C85, finallyPromise instanceof C85];
}

export function protoTypeChange2Test3(){
    class C85 extends Promise {}
    console.log('--- Testing the broken prototype chain of C85 ---');
    let result = [];
    result.push(C85.from);
    result.push(C85.of);
    result.push(C85.call);
    result.push(C85.apply);
    result.push(C85.bind);

    try {
        const newInstance = new C85(() => {});
    } catch (e) {
        console.error('Error creating new C85 instance:', e.name, e.message);
        result.push(e.name + e.message);
    }
    return result;
}

export function protoTypeChange2Test4(){
    class DataProcessor {
        constructor(length) {
            this.data = new Float32Array(length);
        }

        process() {
            for (let i = 0; i < this.data.length; i++) {
                this.data[i] = Math.random();
            }
            console.log('Data processed:', this.data);
        }

        getArray() {
            return this.data;
        }
    }

    console.log('--- Testing correct composition ---');

    const processor = new DataProcessor(10);
    processor.process();
    return processor.getArray() instanceof Float32Array;
}

export function protoTypeChange2Test5(){
    class C85WithCustomThen extends Promise {
        then(onFulfilled, onRejected) {
            console.log(`--- C85WithCustomThen's then method called ---`);

            const startTime = new Date().getTime();

            return super.then(
                value => {
                    const endTime = new Date().getTime();
                    console.log(`Promise fulfilled after ${endTime - startTime}ms`);
                    return onFulfilled ? onFulfilled(value) : value;
                },
                reason => {
                    const endTime = new Date().getTime();
                    console.log(`Promise rejected after ${endTime - startTime}ms`);
                    return onRejected ? onRejected(reason) : reason;
                }
            );
        }
    }

    console.log('--- Testing custom then method ---');

    const customPromise = new C85WithCustomThen((resolve) => {
        setTimeout(() => resolve('Custom then success!'), 150);
    });

    customPromise
        .then(value => {
            console.log('First then received:', value);
            return value.toUpperCase();
        })
        .then(value => {
            console.log('Second then received:', value);
        });
    return true;
}

export function protoTypeChange2Test6(){
    console.log('--- Testing finally behavior ---');

    Promise.resolve('Success')
        .finally(() => {
            console.log('Finally 1: This runs after resolve.');
            return 'Value from finally';
        })
        .then(value => {
            console.log('Then after finally 1 received:', value);
        });

    Promise.reject(new Error('Failure'))
        .catch(err => {
            console.log('Catch: Handling error:', err.message);
        })
        .finally(() => {
            console.log('Finally 2: This runs after catch.');
        })
        .then(value => {
            console.log('Then after finally 2 received:', value);
        });

    Promise.resolve('Original success')
        .finally(() => {
            console.log('Finally 3: Throwing new error.');
            throw new Error('New error from finally');
        })
        .then(value => {
            console.log('Then after finally 3 received:', value);
        })
        .catch(err => {
            console.log('Catch after finally 3 received:', err.message);
        });
    return true;
}

export function protoTypeChange2Test7(){
    class C85 extends Promise {}
    const originalPromise = new C85((resolve) => setTimeout(() => resolve('Proxied success'), 100));

    const promiseProxy = new Proxy(originalPromise, {
        get(target, prop, receiver) {
            console.log(`Proxy GET trap: accessing property '${prop}'`);

            if (['then', 'catch', 'finally'].includes(prop)) {
                const originalMethod = Reflect.get(target, prop, receiver);
                return function(...args) {
                    console.log(`Proxy: calling '${prop}' method`);
                    return originalMethod.apply(target, args);
                };
            }

            return Reflect.get(target, prop, receiver);
        }
    });

    console.log('--- Testing Proxy with Promise instance ---');

    promiseProxy.then(value => {
        console.log('Then received value:', value);
    });
    return true;
}

export function protoTypeChange2Test8(){
    class C85 extends Promise {
        constructor(executor) {
            super((resolve, reject) => {
                try {
                    executor(resolve, reject);
                } catch (err) {
                    console.log('C85 constructor caught executor error:', err.message);
                    reject(err);
                }
            });
            this.customProp = 'I am a custom property';
        }
    }

    const originalC85Proto = C85.__proto__;
    C85.__proto__ = Float32Array;

    console.log('--- Testing C85 custom constructor & prototype change ---');

    C85.__proto__ = originalC85Proto;
    try {
        const p1 = new C85(() => {
            throw new Error('Sync error in executor');
        });
        p1.catch(err => {
            console.log('p1 catch received:', err.message);
        });
    } catch (e) {
        console.error('Error creating p1:', e.message);
    }

    C85.__proto__ = Float32Array;
    try {
        const p2 = new C85((resolve) => resolve('Hello'));
    } catch (e) {
        console.error('Error creating p2 (after proto change):', e.name, e.message);
    }
    return true;
}

export function protoTypeChange2Test9(){
    class C85 extends Promise {}
    C85.__proto__ = Float32Array;

    console.log('--- Testing misused Float32Array static methods on C85 ---');

    try {
        const arr1 = C85.from([1, 2, 3]);
        console.log('C85.from([1,2,3]) result:', arr1);
        console.log('Is arr1 a Float32Array?', arr1 instanceof Float32Array);
        console.log('Is arr1 a C85?', arr1 instanceof C85);
    } catch (e) {
        console.error('Error with C85.from:', e.message);
    }

    try {
        const fakePromise = { then: () => {}, catch: () => {} };
        const arr2 = C85.from(fakePromise);
        console.log('C85.from(fakePromise) result:', arr2);
    } catch (e) {
        console.error('Error with C85.from(fakePromise):', e.message);
    }

    try {
        const arr3 = C85.of(10, 20, 30);
        console.log('C85.of(10,20,30) result:', arr3);
    } catch (e) {
        console.error('Error with C85.of:', e.message);
    }
    return true;
}

export function protoTypeChange2Test10(){
    class C85 extends Promise {}
    const v88 = new C85((resolve) => {
        setTimeout(() => resolve('Promise resolved'), 100);
    });
    C85.__proto__ = Function.prototype;

    setTimeout(() => {
        console.log('--- Modifying C85 proto after Promise resolved ---');
        C85.__proto__ = Float32Array;

        try {
            v88.then((value) => {
                console.log('v88.then received:', value);
                console.log('v88 instanceof C85 after proto change:', v88 instanceof C85);
            }).catch((err) => {
                console.error('v88.catch received:', err);
            });
        } catch (e) {
            console.log('Error v88.then():', e.name, e.message);
        }

        try {
            const newV88 = new C85(() => {});
        } catch (e) {
            console.error('New C85 instance failed after proto change:', e.message);
        }
    }, 150);
    return true;
}

export function protoTypeChange2Test11(){
    class C85 extends Promise {}
    C85.__proto__ = Float32Array;

    console.log('--- Misusing Float32Array static methods as Promise ---');
    let returnResult = [];

    try {
        const fakePromiseArr = [
            new Promise(resolve => resolve(1)),
            new Promise(resolve => resolve(2))
        ];

        const result = C85.from(fakePromiseArr);
        returnResult.push(typeof result);
        returnResult.push(result instanceof Promise);
        returnResult.push(result);

        result.then((values) => {
            console.log('result.then received:', values);
        });
    } catch (e) {
        console.log('Error calling result.then():', e.name, e.message);
        returnResult.push(e.name + e.message);
    }
    return returnResult;
}

export function protoTypeChange2Test12(){
    class C85 extends Promise {}
    console.log('--- Testing Promise executor return value ---');

    const p = new C85((resolve, reject) => {
        console.log('Executor function is running.');
        return 'This return value is ignored';
    });

    p.then(() => {
        console.log('Promise has been resolved.');
    });

    console.log('Is the returned value from new C85 the same as p?', p === 'This return value is ignored');
    return true;
}

export function protoTypeChange2Test13(){
    class C85 extends Promise {}
    const C85Proxy = new Proxy(C85, {
        construct(target, args, newTarget) {
            console.log(`--- Proxy: Creating a new instance of ${target.name} ---`);
            console.log('Constructor arguments:', args);

            const instance = Reflect.construct(target, args, newTarget);

            console.log('Instance created:', instance);
            console.log('--- Proxy: Instance creation finished ---');

            return instance;
        }
    });

    console.log('--- Testing Proxy for C85 constructor ---');

    const proxiedPromise = new C85Proxy((resolve) => {
        setTimeout(() => resolve('Created via proxy'), 50);
    });

    proxiedPromise.then(value => {
        console.log('Proxied promise resolved with:', value);
    });
    return true;
}

export function protoTypeChange2Test14(){
    class C85 extends Promise {}
    const originalPrototype = C85.prototype;
    const originalProto = C85.__proto__;
    let result = [];
    result.push(typeof C85 === 'function');
    result.push(typeof C85.call === 'function');
    result.push(typeof C85.prototype === 'object');
    result.push(C85.prototype.constructor === C85);
    console.log('--- In normal state ---');

    C85.__proto__ = Float32Array;

    console.log('--- After prototype chain is broken ---');
    result.push(typeof C85 === 'function');
    result.push(typeof C85.call);

    try {
        new C85(() => {});
    } catch (e) {
        console.error('new C85() fails because:', e.name, e.message);
    }

    result.push(C85.prototype === originalPrototype);
    return result;
}

export function protoTypeChange2Test15(){
    class C85 extends Promise {}
    class MyPromise extends Promise {
        static get [Symbol.species]() {
            return Promise;
        }
    }

    console.log('--- Testing Promise Species ---');

    const myPromise = new MyPromise((resolve) => resolve('Hello Species'));

    const thenPromise = myPromise.then();
    let result = [];
    result.push(myPromise instanceof MyPromise);
    result.push(thenPromise instanceof MyPromise);
    result.push(thenPromise instanceof Promise);

    const c85Promise = new C85((resolve) => resolve());
    const c85ThenPromise = c85Promise.then();
    result.push(c85ThenPromise instanceof C85);
    return result;
}

export function protoTypeChange2Test16(){
    class C85 extends Promise {
        get [Symbol.toStringTag]() {
            return 'C85Promise';
        }
    }
    let result = [];
    console.log('--- Testing custom Symbol.toStringTag ---');

    const v88 = new C85(() => {});

    result.push(Object.prototype.toString.call(v88).toString());

    const nativePromise = new Promise(() => {});
    result.push(Object.prototype.toString.call(nativePromise).toString());
    return result;
}

export function protoTypeChange2Test17(){
    class C85 extends Promise {}

    console.log('--- Testing "repairing" the broken prototype ---');
    let result = [];
    C85.__proto__ = Float32Array;
    result.push(typeof C85.call);
    try {
        new C85(() => {});
    } catch (e) {
        console.error('Before repair, new C85() fails:', e.message);
    }

    C85.__proto__ = Function.prototype;
    result.push(typeof C85.call);

    try {
        const repairedPromise = new C85((resolve) => resolve('Repaired!'));
        result.push(repairedPromise instanceof C85);
        repairedPromise.then(value => {
            console.log('Repaired promise resolved with:', value);
        });
    } catch (e) {
        result.push(e.message);
    }
    return result;
}
