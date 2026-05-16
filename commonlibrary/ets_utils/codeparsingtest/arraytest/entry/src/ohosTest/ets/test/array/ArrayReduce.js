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

export function ArrayReduceTest006(){
    const arr = ['a', 'b', 'a', 'c', 'a'];
    const initialValue = {};
    const callback = (acc, curr) => {
        acc[curr] = (acc[curr] || 0) + 1;
        return acc;
    };
    const result = arr.reduce(callback, initialValue);
    return result;
}
export function ArrayReduceTest014(){
    const classArr = {
        0: 1,
        1: 2,
        2: 3,
        length: 3
    };
    const initialValue = 0;
    const callback = (acc, curr) => acc + curr;

    const result = Array.prototype.reduce.call(classArr, callback, initialValue);
    return result;
}
export function ArrayReduceTest018(){
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const arr = [sym1, sym2, sym1, sym1, sym2];
    const initialValue = new Map();
    const callback = (acc, curr) => {
        acc.set(curr, (acc.get(curr) || 0) + 1);
        return acc;
    };
    const result = arr.reduce(callback, initialValue);

    return [result.get(sym1), result.get(sym2)];
}
export function ArrayReduceTest020(arr, callback){
    arr.reduce(callback);
}
export function ArrayReduceTest026(){
    const arr = [
        { id: 1, value: 10 },
        { id: 2, value: 20 }
    ];
    const initialValue = { sum: 0, items: [] };
    const callback = (acc, curr) => {
        return {
            sum: acc.sum + curr.value,
            items: [...acc.items, curr.id]
        };
    };
    const result = arr.reduce(callback, initialValue);

    return [result, initialValue];
}
export function ArrayReduceTest027(arr){
    arr.reduce('not-a-function');
}
export function ArrayReduceTest028(){
    const nonArr = { 0: 'a', 1: 'b' };
    const initialValue = 'initial';
    const callback = (acc, curr) => acc + curr;

    const result = Array.prototype.reduce.call(nonArr, callback, initialValue);
    return result;
}
export async function ArrayReduceTest030(){
    const asyncTasks = [
        (prev) => Promise.resolve(prev + 10),
        (prev) => Promise.resolve(prev + 20),
        (prev) => Promise.resolve(prev + 30)
    ];

    const asyncReducer = async (tasks, initialValue) => {
        return tasks.reduce(async (accPromise, task) => {
            const acc = await accPromise;
            return task(acc);
        }, initialValue);
    };

    const result = await asyncReducer(asyncTasks, 0);

    const mixedArr = [1, 'a', true, { value: 5 }];
    const mixedResult = mixedArr.reduce((acc, curr) => {
        acc.types.push(typeof curr);
        acc.values.push(curr);
        return acc;
    }, { types: [], values: [] });

    return [result, mixedResult.types, mixedResult.values]
}
export async function ArrayReduceTest037(){
    const fakeArray = {
        0: 'a',
        1: 'b',
        length: '2'
    };

    const callback = (acc, curr) => acc + curr;
    const result = Array.prototype.reduce.call(fakeArray, callback, '');

    return result
}
export function ArrayReduceTest038(){
    const arr = [1, 2];
    Object.defineProperty(arr, '2', {
        get: () => 3,
        enumerable: true
    });
    arr.length = 3;

    const callback = (acc, curr) => acc + curr;
    const result = arr.reduce(callback);
    return result
}
export function ArrayReduceTest044(){
    function* generator() {
        yield 1;
        yield 2;
        yield 3;
    }

    const arr = Array.from(generator());
    const result = arr.reduce((acc, curr) => acc + curr, 0);
    return result
}
export function ArrayReduceTest045(){
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return prop === 'length' ? target.length : target[prop] * 2;
        }
    });

    const result = Array.prototype.reduce.call(proxy, (acc, curr) => acc + curr, 0);
    return result
}
export function ArrayReduceTest046(){
    const arr = [1, 2, 3];
    Object.defineProperty(arr, '1', { writable: false });

    const result = arr.reduce((acc, curr) => acc + curr);
    return result
}
export function ArrayReduceTest047(){
    const arr = Object.freeze([1, 2, 3]);
    const result = arr.reduce((acc, curr) => acc + curr);
    return result
}
export function ArrayReduceTest048(){
    const arr = [1, 2, 3, 4];
    const callback = (acc, curr, idx, array) => {
        if (curr === 2) {
            delete array[3];
        }
        return acc + curr;
    };
    const result = arr.reduce(callback);
    return result
}
export function ArrayReduceTest058(){
    const arr = [Object.create(null), Object.create(null)];
    arr[0].value = 10;
    arr[1].value = 20;

    const result = arr.reduce((acc, curr) => acc + curr.value, 0);
    return result
}
export function ArrayReduceTest060(){
    const fakeArray = {
        0: 'a',
        1: 'b',
        length: -2
    };

    const callback = (acc, curr) => acc + curr;
    const result = Array.prototype.reduce.call(fakeArray, callback, '');
    return result
}
export function ArrayReduceTest062(){
    const arr = ['apple', 'banana', 'cherry'];
    const callback = (acc, curr) => {
        curr.split('').forEach(char => {
            acc[char] = (acc[char] || 0) + 1;
        });
        return acc;
    };
    const result = arr.reduce(callback, {});
    return result
}
export function ArrayReduceTest066(){
    const iterable = {
        *[Symbol.iterator]() {
            yield 1;
            yield 2;
            yield 3;
        }
    };
    const arr = [iterable, iterable];

    const callback = (acc, curr) => {
        for (const value of curr) {
            acc += value;
        }
        return acc;
    };
    const result = arr.reduce(callback, 0);
    return result
}
export function ArrayReduceTest068(){
    let value = 0;
    const obj = {
        length: 3,
        get 0() { return value++; },
        get 1() { return value++; },
        get 2() { return value++; }
    };

    const result = Array.prototype.reduce.call(obj, (acc, curr) => acc + curr, 0);
    return result
}
export function ArrayReduceTest070(){
    const arr = [];
    Object.defineProperty(arr, '0', { value: 10, enumerable: true });
    Object.defineProperty(arr, '1', { value: 20, enumerable: true });
    Object.defineProperty(arr, 'length', { value: 2 });

    const result = arr.reduce((acc, curr) => acc + curr, 0);
    return result
}
export function ArrayReduceTest071(){
    const obj = { length: 3 };
    Object.defineProperty(obj, '0', { value: 1, enumerable: true });
    Object.defineProperty(obj, '1', { value: 2, enumerable: false });
    Object.defineProperty(obj, '2', { value: 3, enumerable: true });

    const result = Array.prototype.reduce.call(obj, (acc, curr) => acc + curr, 0);
    return result
}
export function ArrayReduceTest073(){
    const data = [
        { id: 1, parent: null, name: 'Root' },
        { id: 2, parent: 1, name: 'Child 1' },
        { id: 3, parent: 1, name: 'Child 2' }
    ];

    const callback = (acc, curr) => {
        if (curr.parent === null) {
            acc = { ...curr, children: [] };
        } else if (curr.parent === acc.id) {
            acc.children.push(curr);
        }
        return acc;
    };
    const result = data.reduce(callback, {});
    return result
}
export function ArrayReduceTest076(){
    const sym = Symbol('key');
    const obj = {
        0: 1,
        1: 2,
        [sym]: 3,
        length: 2
    };

    const result = Array.prototype.reduce.call(obj, (acc, curr) => acc + curr, 0);
    return result
}
export function ArrayReduceTest081(){
    const parent = { 2: 3 };
    const child = Object.create(parent);
    child[0] = 1;
    child[1] = 2;
    child.length = 3;

    const result = Array.prototype.reduce.call(child, (acc, curr) => acc + curr, 0);
    return result
}
export function ArrayReduceTest089(){
    const obj = {
        0: 1,
        1: 2,
        length: 5
    };

    const callback = (acc, curr) => acc + (curr || 0);
    const result = Array.prototype.reduce.call(obj, callback, 0);
    return result
}
export function ArrayReduceTest094(){
    const obj = {
        length: 3,
        get 0() { return 1; },
        get 1() { throw new Error('Getter failed'); },
        get 2() { return 3; }
    };

    let errorThrown = false;
    try {
        Array.prototype.reduce.call(obj, (acc, curr) => acc + curr, 0);
    } catch (e) {
        errorThrown = e.message === 'Getter failed';
    }
    return errorThrown;
}
export async function ArrayReduceTest095(){
    const syncIterable = {
        *[Symbol.iterator]() {
            yield 10;
            yield 20;
        }
    };

    const asyncIterable = {
        async *[Symbol.asyncIterator]() {
            yield 30;
            yield 40;
        }
    };

    const arr = [syncIterable, asyncIterable];

    const callback = async (acc, iterable) => {
        if (Symbol.asyncIterator in iterable) {
            for await (const value of iterable) {
                acc += value;
            }
        } else {
            for (const value of iterable) {
                acc += value;
            }
        }
        return acc;
    };

    const result = await arr.reduce(callback, 0);
    return result;
}
export function ArrayReduceTest097(){
    const { proxy, revoke } = Proxy.revocable({}, {});
    revoke();

    const arr = [1, proxy, 3];
    let errorThrown = false;

    try {
        arr.reduce((acc, curr) => acc + (curr ?? 0), 0);
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    return errorThrown;
}
export function ArrayReduceTest104(){
    let counter = 1;
    const obj = {
        length: 3,
        get 0() { return counter++; },
        get 1() { return counter++; },
        get 2() { return counter++; }
    };

    const result = Array.prototype.reduce.call(obj, (acc, curr) => acc + curr, 0);
    return [result, counter];
}
export function ArrayReduceTest108(){
    const createProxy = (value) => new Proxy({ value }, {
        get(target, prop) {
            return prop === 'value' ? target.value * 2 : target[prop];
        }
    });

    const arr = [createProxy(10), createProxy(20), createProxy(30)];
    const result = arr.reduce((acc, curr) => acc + curr.value, 0);
    return result;
}
export function ArrayReduceTest110(){
    const sym1 = Symbol('10');
    const sym2 = Symbol('20');
    const sym3 = Symbol('30');

    const valueMap = new Map([
        [sym1, 10],
        [sym2, 20],
        [sym3, 30]
    ]);

    const arr = [10, sym1, 20, sym2, 30, sym3];
    const callback = (acc, curr) => {
        return acc + (typeof curr === 'symbol' ? valueMap.get(curr) : curr);
    };
    const result = arr.reduce(callback, 0);
    return result;
}
export function ArrayReduceTest112(){
    const symProp = Symbol('value');
    const arr = [
        { [symProp]: 10 },
        { [symProp]: 20 },
        { [symProp]: 30 }
    ];

    const result = arr.reduce((acc, curr) => acc + curr[symProp], 0);
    return result;
}
export async function ArrayReduceTest113(){
    const promises = [
        Promise.resolve(10),
        Promise.reject(new Error('Failed')),
        Promise.resolve(30)
    ];

    const callback = async (accPromise, curr) => {
        const acc = await accPromise;
        try {
            const value = await curr;
            return acc + value;
        } catch (e) {
            return acc + 0;
        }
    };

    const result = await promises.reduce(callback, Promise.resolve(0));
    return result;
}
export function ArrayReduceTest115(){
    const createObj = (initial) => {
        let value = initial;
        return {
            get value() { return value; },
            set value(newVal) { value = newVal; }
        };
    };

    const arr = [createObj(10), createObj(20), createObj(30)];
    const result = arr.reduce((acc, curr) => {
        curr.value *= 2;
        return acc + curr.value;
    }, 0);
    return result;
}
export function ArrayReduceTest119(){
    const obj1 = { a: 10 };
    Object.defineProperty(obj1, 'b', { value: 20, enumerable: false });

    const obj2 = { a: 30 };
    Object.defineProperty(obj2, 'b', { value: 40, enumerable: false });

    const arr = [obj1, obj2];
    const result = arr.reduce((acc, curr) => {
        for (const prop in curr) {
            acc += curr[prop];
        }
        return acc;
    }, 0);
    return result;
}
export function ArrayReduceTest122(){
    const key1 = {};
    const key2 = [];
    const key3 = Symbol('key');

    const map1 = new Map([[key1, 10], [key2, 20]]);
    const map2 = new Map([[key2, 30], [key3, 40]]);

    const arr = [map1, map2];
    const result = arr.reduce((acc, map) => {
        map.forEach((value, key) => {
            acc.set(key, (acc.get(key) || 0) + value);
        });
        return acc;
    }, new Map());
    return [result.get(key1), result.get(key2), result.get(key3)];
}
export function ArrayReduceTest123(){
    const obj1 = {
        value: 10,
        [Symbol.toStringTag]: 'CustomType1'
    };

    const obj2 = {
        value: 20,
        [Symbol.toStringTag]: 'CustomType2'
    };

    const arr = [obj1, obj2];
    const result = arr.reduce((acc, curr) => {
        acc.push({
            type: Object.prototype.toString.call(curr),
            value: curr.value
        });
        return acc;
    }, []);
    return [result[0].type, result[1].type, result[0].value + result[1].value];
}
export function ArrayReduceTest124(){
    const proto1 = { baseValue: 10 };
    const obj1 = Object.create(proto1);
    obj1.value = 20;

    const proto2 = { baseValue: 30 };
    const obj2 = Object.create(proto2);
    obj2.value = 40;

    const arr = [obj1, obj2];
    const result = arr.reduce((acc, curr) => {
        return acc + curr.value + curr.baseValue;
    }, 0);
    return result;
}
export async function ArrayReduceTest125(){
    function* syncGen() {
        yield 10;
        yield 20;
    }

    async function* asyncGen() {
        yield 30;
        yield 40;
    }

    const arr = [syncGen(), asyncGen()];

    const callback = async (acc, generator) => {
        if (generator[Symbol.asyncIterator]) {
            for await (const value of generator) {
                acc += value;
            }
        } else {
            for (const value of generator) {
                acc += value;
            }
        }
        return acc;
    };

    const result = await arr.reduce(callback, 0);
    return result.toString() == '[object Promise]3040';
}
export function ArrayReduceTest126(){
    const obj1 = {};
    Object.defineProperty(obj1, 'value', {
        value: 10,
        configurable: true
    });

    const obj2 = {};
    Object.defineProperty(obj2, 'value', {
        value: 20,
        configurable: false
    });

    const arr = [obj1, obj2];
    const result = arr.reduce((acc, curr) => {
        if (Object.getOwnPropertyDescriptor(curr, 'value').configurable) {
            delete curr.value;
            return acc + 0;
        }
        return acc + curr.value;
    }, 0);
    return result;
}
export async function ArrayReduceTest130(){
    const sym = Symbol('special');
    const objWithGetter = {
        _value: 10,
        get value() { return this._value * 2; }
    };

    const asyncFunc = () => Promise.resolve(50);
    const map = new Map([[sym, 100]]);

    const arr = [
        10,
        '20',
        true,
        null,
        undefined,
        [30, 40],
        { value: 50 },
        objWithGetter,
        sym,
        60n,
        asyncFunc,
        map,
        new Set([70, 80]),
        /regex/,
        () => 90,
        Promise.resolve(100)
    ];

    const callback = async (acc, curr) => {
        if (typeof curr === 'number' && !isNaN(curr)) {
            (await acc).sum += curr;
        } else if (typeof curr === 'string') {
            (await acc).sum += Number(curr) || 0;
        } else if (typeof curr === 'boolean') {
            (await acc).sum += curr ? 1 : 0;
        } else if (Array.isArray(curr)) {
            (await acc).sum += curr.reduce((a, b) => a + b, 0);
        } else if (curr instanceof Promise) {
            (await acc).sum += await curr;
        } else if (curr && typeof curr === 'object') {
            if (curr instanceof Map) {
                const resolvedAcc = await acc;
                curr.forEach((v) => {
                    resolvedAcc.sum += v;
                });
            } else if (curr instanceof Set) {
                (await acc).sum += Array.from(curr).reduce((a, b) => a + b, 0);
            } else if ('value' in curr) {
                (await acc).sum += curr.value;
            }
        } else if (typeof curr === 'symbol') {
            (await acc).sum += map.get(curr) || 0;
        } else if (typeof curr === 'bigint') {
            (await acc).sum += Number(curr);
        } else if (typeof curr === 'function') {
            const result = curr();
            (await acc).sum += result instanceof Promise ? await result : result;
        }

        (await acc).processedCount++;
        return acc;
    };

    const result = await arr.reduce(callback, { sum: 0, processedCount: 0 });

    return [result.processedCount, result.sum];
}