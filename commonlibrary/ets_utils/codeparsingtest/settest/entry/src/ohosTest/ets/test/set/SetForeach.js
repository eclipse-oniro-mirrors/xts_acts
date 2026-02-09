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
export function SetForEachTest001(){
    const set = new Set(['a', 'b', 'c']);
    const callbackLogs = [];

    const callback = (value, key, currentSet) => {
        callbackLogs.push({ value, key, currentSet });
    };

    set.forEach(callback);
    return [callbackLogs.length, callbackLogs.every(log => log.value === log.key), callbackLogs.every(log => log.currentSet === set), callbackLogs.map(log => log.value)]
}
export function SetForEachTest002(){
    const set = new Set([1, 2]);
    const returnVal = set.forEach(() => {});

    return returnVal === undefined;
}
export function SetForEachTest011(set){
    const thisArg = { multiplier: 2 };
    const results = [];

    const callback = function(value) {
        results.push(value * this.multiplier);
    };

    set.forEach(callback, thisArg);
    return results;
}
export function SetForEachTest012(){
    const set = new Set([1]);
    let thisValue = undefined;

    const callback = () => {
        'use strict';
        thisValue = this;
    };

    set.forEach(callback);
    return thisValue;
}
export function SetForEachTest018(){
    const sym1 = Symbol('test');
    const sym2 = Symbol('test');
    const set = new Set([sym1, sym2]);
    const visited = [];

    set.forEach(value => {
        visited.push(value);
    });
    return [visited.length, visited[0] === sym1, visited[1] === sym2];
}
export function SetForEachTest020(){
    const set = new Set([10]);
    const thisArg = 5;
    let thisValue = null;

    const callback = function() {
        thisValue = this;
    };

    set.forEach(callback, thisArg);
    return [thisValue instanceof Number, thisValue.valueOf()];
}
export function SetForEachTest022(set){
    return [...set];
}
export function SetForEachTest023(){
    const arr = [1, 2, 3];
    const visited = [];
    arr.forEach(value => {
        visited.push(value);
    });
    return visited;
}
export function SetForEachTest025(){
    const set = new Set([10]);
    const thisArg = { x: 5 };
    let arrowThis = null;
    const arrowCallback = () => {
        arrowThis = this;
    };

    set.forEach(arrowCallback, thisArg);
    return [arrowThis === arrowThis, arrowThis === globalThis || arrowThis === undefined];
}
export function SetForEachTest028(set){
    Object.freeze(set);
}
export function SetForEachTest0281(set){
    return Object.isFrozen(set);
}
export function SetForEachTest029(set){
    let errorThrown = false;

    try {
        set.forEach('not-a-function');
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    return errorThrown;
}
export function SetForEachTest030(){
    const sym = Symbol('test');
    const obj = { count: 0 };
    const set = new Set([
        'string', 100, true, null, sym, obj
    ]);

    const thisArg = { sum: 0 };
    const visited = [];
    const callback = function(value, key) {
        visited.push({ value, key });
        if (typeof value === 'number') {
            this.sum += value;
        }
        if (value === obj) {
            value.count = visited.length;
        }
        if (value === 'string') {
            set.add('new-element');
        }
    };

    set.forEach(callback, thisArg);
    return [visited.length, thisArg.sum, obj.count, visited.some(item => item.value === 'new-element')];
}
export function SetForEachTest040(set){
    let thisValue = null;

    const callback = function() {
        thisValue = this;
    };

    set.forEach(callback, null);
    return thisValue;
}
export function SetForEachTest045(set){
    const originalIterator = set[Symbol.iterator];
    let iteratorCalled = false;

    set[Symbol.iterator] = function* () {
        iteratorCalled = true;
        yield* originalIterator.call(this);
    };
    return iteratorCalled;
}
export function SetForEachTest046(set){
    const target = { multiplier: 3 };
    const thisArg = new Proxy(target, {
        get: (obj, prop) => obj[prop] * 2
    });
    const results = [];

    const callback = function(value) {
        results.push(value * this.multiplier);
    };

    set.forEach(callback, thisArg);
    return results;
}
export function SetForEachTest048(){
    class MySet extends Set {
        constructor(values) {
            super(values);
            this.extraProp = 'test';
        }
    }

    const set = new MySet([1, 2]);
    const visited = [];
    let receivedSet = null;

    set.forEach((value, _, currentSet) => {
        visited.push(value);
        receivedSet = currentSet;
    });

    return [visited, receivedSet == set, receivedSet.extraProp]
}
export function SetForEachTest049(){
    const set = new Set([1, 2]);
    let callCount = 0;

    const callback = function(value) {
        callCount++;
        if (callCount === 1) {
            callback.modified = true;
        }
    };

    set.forEach(callback);

    return [callCount, callback.modified];
}
export function SetForEachTest050(){
    const set = new Set([1]);
    const thisArg = 'test string';
    let thisValue = null;

    const callback = function() {
        thisValue = this;
    };

    set.forEach(callback, thisArg);
    return [thisValue instanceof String, thisValue.valueOf()];
}
export function SetForEachTest056(){
    const set = new Set([10, 20]);
    const results = [];
    const thisArg = { multiplier: 2 };

    const originalCallback = function(value) {
        results.push(value * this.multiplier);
    };
    const boundCallback = originalCallback.bind({ multiplier: 3 });

    set.forEach(boundCallback, thisArg);
    return results;
}
export function SetForEachTest058(set){
    try {
        set.size = 100;
    } catch (e) {
    }
}
export function SetForEachTest060(){
    const set = new Set([1]);
    const thisArg = true;
    let thisValue = null;

    const callback = function() {
        thisValue = this;
    };

    set.forEach(callback, thisArg);
    return [thisValue instanceof Boolean, thisValue.valueOf() === thisArg]
}
export function SetForEachTest061(){
    const set = new Set([Symbol.asyncIterator, Symbol.iterator]);
    const visited = [];

    set.forEach(value => visited.push(value));

    return [visited.length, visited[0] === Symbol.asyncIterator, visited[1] === Symbol.iterator];
}
export function SetForEachTest064(){
    const { proxy, revoke } = Proxy.revocable({}, {});
    const set = new Set([1, proxy]);
    revoke();

    const visited = [];
    let errorThrown = false;

    try {
        set.forEach(value => visited.push(value));
    } catch (e) {
        errorThrown = true;
    }
    return errorThrown;
}
export function SetForEachTest065(){
    const largeThisArg = {};
    for (let i = 0; i < 10000; i++) {
        largeThisArg[`prop${i}`] = i;
    }

    const set = new Set([5]);
    let result = 0;

    const callback = function(value) {
        result = value * this.prop5;
    };

    set.forEach(callback, largeThisArg);
    return result;
}
export function SetForEachTest067(){
    const set = new Set([1, 2]);
    const results = [];

    function* valueGenerator(value) {
        yield value * 2;
    }

    set.forEach(value => {
        const generator = valueGenerator(value);
        results.push(generator.next().value);
    });
    return results;
}
export function SetForEachTest068(){
    const originalAdd = Set.prototype.add;
    Set.prototype.add = function(value) {
        return originalAdd.call(this, value * 2);
    };

    const set = new Set();
    set.add(1);
    set.add(2);

    const visited = [];
    set.forEach(value => visited.push(value));

    Set.prototype.add = originalAdd;
    return visited;
}
export function SetForEachTest070(){
    const set = new Set([5]);
    const thisArg = Object.create(null);
    thisArg.factor = 3;

    let result = 0;
    const callback = function(value) {
        result = value * this.factor;
    };

    set.forEach(callback, thisArg);
    return result;
}
export function SetForEachTest072(set, callback){
    Reflect.apply(set.forEach, set, [callback]);
}
export function SetForEachTest075(){
    const set = new Set([1, 2]);
    const instances = [];

    class MyClass {
        constructor(value) {
            this.value = value;
            instances.push(this);
        }
    }

    set.forEach(value => new MyClass(value));
    return [instances.length, instances[0].value, instances[1].value]
}

export function SetForEachTest077(set){
    Object.preventExtensions(set);
}
export function SetForEachTest0771(set){
    return Object.isExtensible(set);
}
export function SetForEachTest078(){
    const originalHas = Set.prototype.has;
    const set = new Set([1, 2, 3]);
    const visited = [];

    const callback = value => {
        visited.push(value);
        if (value === 2) {
            Set.prototype.has = () => false;
        }
    };
    set.forEach(callback);
    Set.prototype.has = originalHas;

    return visited;
}
export function SetForEachTest080(){
    const set = new Set([1]);
    const thisArg = Symbol('test');
    let thisValue = null;

    const callback = function() {
        thisValue = this;
    };

    set.forEach(callback, thisArg);

    return thisValue === thisArg;
}
export function SetForEachTest082(){
    const workerScope = {
        self: {},
        postMessage: () => {}
    };

    const testInWorker = function() {
        const set = new Set([1, 2]);
        const results = [];
        set.forEach(value => results.push(value));
        return results;
    }.bind(workerScope);

    const result = testInWorker();
    return result;
}
export function SetForEachTest083(){
    const set = new Set([1, 2]);
    const results = [];
    let multiplier = 1;

    const callback = value => {
        results.push(value * multiplier);
        multiplier++;
    };

    set.forEach(callback);
    return results;
}
export function SetForEachTest085(){
    const set = new Set([1, 2]);
    const results = [];

    const targetFunction = value => {
        results.push(value);
    };
    const callbackProxy = new Proxy(targetFunction, {
        apply: (target, thisArg, args) => {
            return target.apply(thisArg, [args[0] * 2]);
        }
    });

    set.forEach(callbackProxy);
    return results;
}
export function SetForEachTest087(){
    const set = new Set([1, 2]);
    const originalForEach = set.forEach;

    set.forEach = function(callback) {
        callback(99);
    };

    const visited = [];
    set.forEach(value => visited.push(value));

    set.forEach = originalForEach;
    return visited;
}
export function SetForEachTest088(set){
    let argsLog = null;
    const callback = function() {
        argsLog = Array.from(arguments);
    };

    set.forEach(callback);
    return argsLog;
}
export function SetForEachTest090(set){
    const thisArg = 3n;
    let result = 0n;

    const callback = function(value) {
        result = value * this;
    };

    set.forEach(callback, thisArg);
    return result;
}
export function SetForEachTest095(set){
    const results = [];

    const addValues = function(base, multiplier) {
        results.push(base + (this.value * multiplier));
    };

    const boundFunc = addValues.bind({ value: 5 }, 100);

    set.forEach(boundFunc);
    return results;
}
export function SetForEachTest097(set){
    const originalAdd = set.add;

    set.add = function(value) {
        return originalAdd.call(this, value * value);
    };

    set.add(2);
    set.add(3);

    const visited = [];
    set.forEach(value => visited.push(value));

    set.add = originalAdd;
    return visited;
}
export function SetForEachTest098(){
    const set = new Set([1]);
    const thisArg = { value: 10 };
    let result = 0;

    const outerFunc = function() {
        const innerFunc = () => {
            result = this.value;
        };
        innerFunc();
    };

    set.forEach(outerFunc, thisArg);
    return result;
}
export function SetForEachTest099(){
    function* generator1() { yield 1; }
    function* generator2() { yield 2; }

    const genObj1 = generator1();
    const genObj2 = generator2();
    const set = new Set([genObj1, genObj2]);
    const visited = [];

    set.forEach(gen => {
        visited.push(gen.next().value);
    });

    return visited;
}
export function SetForEachTest100(){
    const sym = Symbol('final');
    const obj = { prop: 'initial' };
    const nestedSet = new Set([1, 2]);
    const date = new Date('2024-12-31');

    const set = new Set([
        'string', 42, true, null, undefined, NaN,
        0, -0, sym, obj, nestedSet, date,
        () => 'func', /regex/g, 123n
    ]);

    const thisArg = {
        sum: 0,
        count: 0,
        modified: false
    };

    const visited = [];
    const callback = function(value, key, currentSet) {
        visited.push({
            type: typeof value,
            isPrimitive: !(value instanceof Object) || value instanceof Date
        });

        this.count++;
        if (typeof value === 'number' && !Number.isNaN(value)) {
            this.sum += value;
        }

        if (value === obj) {
            value.prop = 'modified';
            this.modified = true;
        }

        if (value === 'string') {
            currentSet.add('new-final-element');
        }

        if (value === true) {
            currentSet.delete(null);
        }
    };

    set.forEach(callback, thisArg);

    return [visited.length, thisArg.count, thisArg.sum, thisArg.modified, obj.prop, visited.some(item => item.type === 'symbol'), set.has(null)];
}
export function SetForEachTest102(){
    const set = new Set([10, 20]);
    const context1 = { factor: 2 };
    const context2 = { factor: 3 };
    const results = [];

    const callback = function(value) {
        results.push(value * this.factor);
    };

    set.forEach(function(value) {
        callback.call(this === context1 ? context2 : context1, value);
    }, context1);
    return results;
}
export function SetForEachTest104(){
    const set = new Set([1, 2, 3, 4]);
    const originalDelete = set.delete;
    let deleteCount = 0;

    set.delete = function(value) {
        deleteCount++;
        return originalDelete.call(this, value) && value % 2 === 0;
    };

    set.forEach(value => {
        if (value % 2 === 0) {
            set.delete(value);
        }
    });

    set.delete = originalDelete;
    return [deleteCount, Array.from(set)];
}
export function SetForEachTest110(){
    const thisArg = Object.freeze({ factor: 4 });
    const set = new Set([3, 5]);
    const results = [];

    const callback = function(value) {
        results.push(value * this.factor);
    };

    set.forEach(callback, thisArg);
    return results;
}
export function SetForEachTest114(){
    const sym = Symbol('test');
    const obj1 = { [sym]: 'value1' };
    const obj2 = { [sym]: 'value2' };
    const set = new Set([obj1, obj2]);
    const values = [];

    set.forEach(obj => {
        values.push(obj[sym]);
    });
    return values;
}
export function SetForEachTest118(){
    function* gen1() { yield 1; yield 2; }
    function* gen2() { yield 3; yield 4; }

    const set = new Set([gen1, gen2]);
    const results = [];

    set.forEach(gen => {
        results.push(Array.from(gen()));
    });
    return results;
}
export function SetForEachTest119(){
    const target1 = { value: 10 };
    const target2 = { value: 20 };
    const proxy1 = new Proxy(target1, {
        get: (obj, prop) => prop === 'value' ? obj[prop] * 2 : obj[prop]
    });
    const proxy2 = new Proxy(target2, {
        get: (obj, prop) => prop === 'value' ? obj[prop] * 2 : obj[prop]
    });

    const set = new Set([proxy1, proxy2]);
    const values = [];

    set.forEach(proxy => {
        values.push(proxy.value);
    });
    return values;
}
export function SetForEachTest120(){
    const obj1 = {
        *[Symbol.iterator]() {
            yield 1;
            yield 2;
        }
    };
    const obj2 = {
        *[Symbol.iterator]() {
            yield 3;
            yield 4;
        }
    };

    const set = new Set([obj1, obj2]);
    const results = [];

    set.forEach(obj => {
        results.push(Array.from(obj));
    });
    return results;
}
export function SetForEachTest122(){
    const controller1 = new AbortController();
    const controller2 = new AbortController();
    const set = new Set([controller1, controller2]);
    const signals = [];

    set.forEach(controller => {
        signals.push(controller.signal);
        controller.abort();
    });
    return [signals.length, signals[0].aborted, signals[1].aborted];
}


async function SetForEachTest1251(){
    if (typeof ReadableStream === 'undefined') {
        return;
    }

    const stream1 = new ReadableStream({
        start(controller) {
            controller.enqueue('a');
            controller.close();
        }
    });

    const stream2 = new ReadableStream({
        start(controller) {
            controller.enqueue('b');
            controller.close();
        }
    });

    const set = new Set([stream1, stream2]);
    const results = [];

    for await (const stream of set) {
        const reader = stream.getReader();
        const { value } = await reader.read();
        results.push(value);
    }
    return results;
}
export async function SetForEachTest125(){
    return SetForEachTest1251();
}
export function SetForEachTest126(){
    const url1 = new URL('https://example.com/path1');
    const url2 = new URL('https://example.com/path2');
    const set = new Set([url1, url2]);
    const paths = [];

    set.forEach(url => {
        paths.push(url.pathname);
    });

    return paths;
}
export function SetForEachTest128(){
    if (typeof FinalizationRegistry === 'undefined') {
        return;
    }

    let registry1Called = false;
    let registry2Called = false;

    const registry1 = new FinalizationRegistry(() => {
        registry1Called = true;
    });

    const registry2 = new FinalizationRegistry(() => {
        registry2Called = true;
    });

    const set = new Set([registry1, registry2]);
    const objects = [{}, {}];

    set.forEach((registry, index) => {
        registry.register(objects[index], 'value');
    });

    objects.length = 0;


    return [registry1Called, registry2Called];
}
export function SetForEachTest129(set, entries){
    set.forEach(map => {
        entries.push(...map.entries());
    });
}