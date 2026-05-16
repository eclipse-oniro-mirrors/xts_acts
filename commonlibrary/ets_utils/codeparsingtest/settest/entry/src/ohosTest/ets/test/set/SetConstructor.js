/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
export function SetConstructorTest002(){
    Set();
}
export function SetConstructorTest003(set, str){
    return [...set].join(str)
}
export function SetConstructorTest007(set){
    return [...set].includes(undefined)
}

export function SetConstructorTest0071(set){
    return [...set].includes(null)
}

export function setConstructorTest008(){
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    return [obj1, obj2];
}

export function SetConstructorTest011(){
    const s = new Set([123]);
    return s.size;
}

export function SetConstructorTest0111(){
    const s = new Set([123]);
    return [...s];
}

export function SetConstructorTest012(){
    const s = new Set([true]);
    expect(s.size).assertEqual(1);
    return [...s];
}

export function SetConstructorTest013(){
    const s = new Set([false]);
    expect(s.size).assertEqual(1);
    return [...s];
}

export function SetConstructorTest014(){
    const s = new Set([NaN, NaN, NaN]);
    expect(s.size).assertEqual(1);
    return [...s];
}

export function SetConstructorTest020(){
    function testArgs() {
        return new Set(arguments);
    }
    const s = testArgs(1, 2, 2, 3);
    return s.size;
}

export function SetConstructorTest021(){
    const typedArray = new Uint8Array([1, 2, 2, 3]);
    const s = new Set(typedArray);
    return [...s];
}

export function SetConstructorTest023(){
    function* generator() {
        yield 1;
        yield 2;
        yield 2;
        yield 3;
    }
    const s = new Set(generator());
    return [...s];
}

export function SetConstructorTest024(){
    const sym1 = Symbol('test');
    const sym2 = Symbol('test');
    const s = new Set([sym1, sym1, sym2]);
    return s.size;
}

export function SetConstructorTest025(){
    const s = new Set([1n, 2n, 2n, 3n]);
    return [...s];
}

export function SetConstructorTest031(){
    function* emptyGenerator() {
        return;
    }
    const s = new Set(emptyGenerator());
    return s.size;
}

export function SetConstructorTest032(){
    const arr = [1, 2];
    const iterator = {
        [Symbol.iterator]() {
            let index = 0;
            return {
                next() {
                    if (index < arr.length) {
                        if (index === 0) arr.push(3);
                        return { value: arr[index++], done: false };
                    }
                    return { done: true };
                }
            };
        }
    };
    const s = new Set(iterator);
    return [...s];
}

export function SetConstructorTest033(){
    const obj = {
        [Symbol.iterator]: () => ({
            next: () => ({ value: 'test', done: false }),
            return: () => ({ done: true })
        })
    };
    const s = new Set([obj]);
    return s.size;
}

export function SetConstructorTest034(){
    new Set({ [Symbol.iterator]: 'not a function' });
}

export function SetConstructorTest036(){
    const largeArray = Array.from({ length: 10000 }, (_, i) => i % 1000);
    const s = new Set(largeArray);
    return s;
}

export function SetConstructorTest039(){
    const obj1 = { toString: () => 'same' };
    const obj2 = { toString: () => 'same' };
    const s = new Set([obj1, obj2]);
    return s;
}

export function SetConstructorTest040(){
    const setLike = {
        0: 'a',
        1: 'b',
        2: 'a',
        length: 3,
        [Symbol.iterator]: Array.prototype[Symbol.iterator]
    };
    const s = new Set(setLike);
    return [...s];
}

export function SetConstructorTest041(){
    const faultyIterable = {
        [Symbol.iterator]: () => ({
            next: () => {
                throw new Error('Iteration failed');
            }
        })
    };
    new Set(faultyIterable);
}

export function SetConstructorTest042(){
    const s = new Set([1, 'string', true, null, undefined, { key: 'value' }, 1, true]);
    return s.size;
}

export function SetConstructorTest044(){
    function func() {}
    const func2 = func;
    const func3 = function() {};
    const s = new Set([func, func2, func3]);
    return s.size;
}

export function SetConstructorTest045(){
    const map = new Map();
    map.set('key1', 'value1');
    map.set('key2', 'value2');
    map.set('key1', 'value3');
    const s = new Set(map.entries());
    return s.size;
}

export function SetConstructorTest046(){
    const map = new Map();
    map.set('key1', 'value1');
    map.set('key2', 'value2');
    map.set('key1', 'value3');
    const s = new Set(map.keys());
    return [...s];
}

export function SetConstructorTest047(){
    const map = new Map();
    map.set('key1', 'value1');
    map.set('key2', 'value2');
    map.set('key3', 'value1');
    const s = new Set(map.values());
    return [...s];
}

export function SetConstructorTest048(){
    const s1 = new Set(['a', 'b', 'c', 'b']);
    const s2 = new Set(s1.keys());
    return [...s2];
}

export function SetConstructorTest049(){
    const s1 = new Set(['a', 'b', 'c', 'b']);
    const s2 = new Set(s1.values());
    return [...s2];
}

export function SetConstructorTest055(){
    const target = {};
    const proxy1 = new Proxy(target, {});
    const proxy2 = new Proxy(target, {});
    const s = new Set([proxy1, proxy2, proxy1]);
    return s;
}

export function SetConstructorTest056(){
    const obj1 = Object.freeze({ a: 1 });
    const obj2 = Object.freeze({ a: 1 });
    const s = new Set([obj1, obj2]);
    return s;
}

export function SetConstructorTest057(){
    const obj1 = { a: 1 };
    Object.seal(obj1);
    const obj2 = { a: 1 };
    Object.seal(obj2);
    const s = new Set([obj1, obj2]);
    return s;
}



export function SetConstructorTest059(){
    const wm = new WeakMap();
    const obj = {};
    wm.set(obj, 'value');
    const s = new Set([wm]);
    return s.size;
}

export function SetConstructorTest060(){
    const ws = new WeakSet();
    const obj = {};
    ws.add(obj);
    const s = new Set([ws]);
    return s.size;
}

export function SetConstructorTest061(){
    const sym = Symbol('test');
    const s = new Set([sym, 'test', sym, Symbol('test')]);
    return s;
}

export function SetConstructorTest064(){
    const badIterable = {
        [Symbol.iterator]: () => 'not an object'
    };
    new Set(badIterable);
}

export function SetConstructorTest065(){
    const badIterable = {
        [Symbol.iterator]: () => ({
            next: () => 'not an object'
        })
    };
    new Set(badIterable);
}

export function SetConstructorTest066(){
    const emptyIterable = {
        [Symbol.iterator]: () => ({
            next: () => ({ done: true })
        })
    };
    const s = new Set(emptyIterable);
    return s.size;
}

export function SetConstructorTest067(){
    const asyncIterable = {
        [Symbol.asyncIterator]: async function* () {
            yield 1;
            yield 2;
        }
    };
    const s = new Set([asyncIterable]);
    return s.size;
}

export function SetConstructorTest068(){
    const iterable = Object.create(null);
    iterable[Symbol.iterator] = function* () {
        yield 1;
        yield 2;
        yield 1;
    };
    const s = new Set(iterable);
    return [...s];
}

export function SetConstructorTest074(){
    const obj = {
        get a() { return 1; },
        get b() { return 2; },
        [Symbol.iterator]: function* () {
            yield this.a;
            yield this.b;
            yield this.a;
        }
    };
    const s = new Set(obj);
    return [...s];
}

export function SetConstructorTest076(){
    let count = 0;
    const dynamicIterable = {
        [Symbol.iterator]: function* () {
            while (count < 3) {
                yield count++;
            }
        }
    };
    const s = new Set(dynamicIterable);
    return [...s];
}

export function SetConstructorTest077(){
    const repeatIterable = {
        [Symbol.iterator]: function* () {
            yield 'value';
            yield 'value';
            yield 'value';
        }
    };
    return new Set(repeatIterable);
}

export function SetConstructorTest078(){
    const rangeIterable = {
        [Symbol.iterator]: function* () {
            yield 1;
            yield 2;
            yield 3;
        }
    };
    const s = new Set(rangeIterable);
    return [...s];
}

export function SetConstructorTest080(){
    function getValue() { return 'test'; }
    const funcIterable = {
        [Symbol.iterator]: function* () {
            yield getValue();
            yield getValue();
            yield 'another';
        }
    };
    const s = new Set(funcIterable);
    return [...s];
}

export function SetConstructorTest081(){
    const condition = true;
    const conditionalIterable = {
        [Symbol.iterator]: function* () {
            yield 1;
            if (condition) yield 2;
            yield 3;
            if (!condition) yield 4;
        }
    };
    const s = new Set(conditionalIterable);
    return [...s];
}

export function SetConstructorTest082(){
    const nestedIterable = [1, [2, 3], 4];
    const flatIterable = {
        [Symbol.iterator]: function* () {
            for (const item of nestedIterable) {
                if (Array.isArray(item)) {
                    yield* item;
                } else {
                    yield item;
                }
            }
        }
    };
    const s = new Set(flatIterable);
    return [...s];
}

export function SetConstructorTest084(){
    const faultyIterable = {
        [Symbol.iterator]: function* () {
            yield 1;
            yield 2;
            throw new Error('Unexpected error');
            yield 3;
        }
    };
    new Set(faultyIterable);
}

export function SetConstructorTest085(){
    let returnCalled = false;
    const iterableWithReturn = {
        [Symbol.iterator]: () => ({
            next: () => ({ value: 1, done: false }),
            return: () => {
                returnCalled = true;
                return { done: true };
            }
        })
    };
    return new Set([iterableWithReturn]);
}

export function SetConstructorTest0851(){
    let returnCalled = false;
    const iterableWithReturn = {
        [Symbol.iterator]: () => ({
            next: () => ({ value: 1, done: false }),
            return: () => {
                returnCalled = true;
                return { done: true };
            }
        })
    };
    const s = new Set([iterableWithReturn]);
    return returnCalled;
}

export function SetConstructorTest086(){
    const iterableWithThrow = {
        [Symbol.iterator]: () => ({
            next: () => ({ value: 1, done: false }),
            throw: () => {
                throw new Error('Iterator throw');
            }
        })
    };
    return new Set([iterableWithThrow]);
}

export function SetConstructorTest087(){
    const obj1 = { valueOf: () => 10 };
    const obj2 = { valueOf: () => 10 };
    return new Set([obj1, obj2, 10]);
}

export function SetConstructorTest088(){
    const obj1 = {
        [Symbol.toPrimitive]: () => 'test'
    };
    const obj2 = {
        [Symbol.toPrimitive]: () => 'test'
    };
    return new Set([obj1, obj2, 'test']);
}

export function SetConstructorTest091(){
    const sym1 = Symbol.for('key');
    const sym2 = Symbol.for('key');
    const sym3 = Symbol('key');
    return new Set([sym1, sym2, sym3]);
}

export function SetConstructorTest092(){
    return new Set([Symbol.iterator, Symbol.iterator, Symbol.asyncIterator]);
}