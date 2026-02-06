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
export function SetClearTest009(){
    const sym1 = Symbol('test');
    const sym2 = Symbol('test');
    const set = new Set([sym1, sym2]);
    set.clear();
    return [set.size, set.has(sym1), set.has(sym2)]
}

export function SetClearTest024(set){
    Object.freeze(set);
}

export function SetClearTest025(set){
    Object.seal(set);
}

export function SetClearTest029(set){
    return [...set];
}

export function SetClearTest036(){
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    const set = new Set([proxy, target]);

    set.clear();
    return [set.size, set.has(proxy), set.has(target)]
}

export function SetClearTest038(set){
    (function(contextSet) {
        contextSet.clear();
    })(set);
}

export function SetClearTest039(){
    const obj1 = {};
    Object.defineProperty(obj1, 'nonEnumerable', {
        value: 'value',
        enumerable: false
    });

    const obj2 = {};
    const set = new Set([obj1, obj2]);

    set.clear();
    return [set.size, set.has(obj1), set.has(obj2)];
}

export function SetClearTest046(set){
    const eventEmitter = {
        listeners: [],
        on: function(event, listener) {
            this.listeners.push(listener);
        },
        emit: function(event) {
            this.listeners.forEach(listener => listener());
        }
    };

    eventEmitter.on('clear', () => set.clear());

    eventEmitter.emit('clear');
}

export function SetClearTest053(set){
    const originalClear = set.clear;

    Set.prototype.customProp = 'test';

    set.clear();
    const num1 = set.size;
    const custom1 = Set.prototype.customProp;

    delete Set.prototype.customProp;
    Set.prototype.clear = originalClear;
    set.add(4);
    Set.prototype.clear.call(set);
    return [num1, custom1, Set.prototype.customProp]
}

export function SetClearTest054(set){
    Set.prototype.clear.call(set);
}

export function SetClearTest055(set){
    const boundClear = set.clear.bind(set);

    boundClear();
}

export function SetClearTest056(set){
    Set.prototype.clear.apply(set);
}

export function SetClearTest058(){
    class MySet extends Set {
        static get [Symbol.species]() {
            return Set;
        }
    }

    const set = new MySet([1, 2, 3]);
    const derivedSet = set.values();

    set.clear();
    return [set.size, Array.from(derivedSet)]
}

export function SetClearTest059(){
    const OriginalSet = Set;
    const ModifiedSet = function(...args) {
        const instance = new OriginalSet(...args);
        instance.modified = true;
        return instance;
    };
    ModifiedSet.prototype = OriginalSet.prototype;

    const set = new ModifiedSet([1, 2, 3]);
    set.clear();
    return [set.size, set.modified]
}

export function SetClearTest060(){
    class SecureSet extends Set {
        #cleared = false;

        clear() {
            super.clear();
            this.#cleared = true;
        }

        wasCleared() {
            return this.#cleared;
        }
    }

    const set = new SecureSet([1, 2, 3]);
    set.clear();
    return [set.size, set.modified]
}

export function SetClearTest066(set1, set2){
    return new Set([...set1, ...set2]);
}

export function SetClearTest071(){
    const set = new Set();
    const count = 1000;

    for (let i = 0; i < count; i++) {
        const largeObj = {};
        for (let j = 0; j < 10; j++) {
            largeObj[`prop${j}`] = `value${i}_${j}`;
        }
        set.add(largeObj);
    }

    const num1 = set.size;
    set.clear();
    return [num1, set.size]
}

export function SetClearTest076(){
    const { proxy, revoke } = Proxy.revocable({}, {});
    const set = new Set([proxy]);

    revoke();
    set.clear();
    return set.size;
}

export function SetClearTest077(){
    const set = new Set([1, 2, 3]);

    const replacer = (key, value) => {
        if (value instanceof Set) {
            set.clear();
            return Array.from(value);
        }
        return value;
    };

    const json = JSON.stringify({ data: set }, replacer);

    return [json, set.size];
}

export function SetClearTest081(){
    const set = new Set();
    set.add({ '__proto__': { polluted: true } });

    set.clear();

    return [set.size, Object.prototype.polluted]
}

export function SetClearTest083(){
    const set = new Set();
    set.add(set);

    set.clear();

    return [set.size, set.has(set)]
}

export function SetClearTest085(){
    return Object.freeze({ id: 1 });
}

export function SetClearTest086(sealedObj){
    Object.seal(sealedObj);
}

export function SetClearTest087(){
    const set = new Set([1, 2, 3]);
    const originalClear = Set.prototype.clear;

    Set.prototype.clear = function() {
        this.modified = true;
        originalClear.call(this);
    };

    set.clear();

    const num1 = set.size;
    const modified1 = set.modified;

    Set.prototype.clear = originalClear;
    set.add(4);
    set.add(5);
    Set.prototype.clear.call(set);
    return [num1, modified1, set.size]
}

export function SetClearTest089(set){
    Object.defineProperty(set, 'size', {
        writable: false
    });
}

export function SetClearTest100(){
    const obj = { id: 1 };
    const arr = [1, 2, 3];
    const date = new Date();
    const regex = /test/i;
    const sym = Symbol('test');
    const func = () => {};
    const nestedSet = new Set([4, 5, 6]);

    const set = new Set([
        'string', 123, -45.67, true, false, null, undefined,
        NaN, Infinity, -Infinity, 0, -0, 123n,
        obj, arr, date, regex, sym, func, nestedSet,
        'café', '😊', 'א', '\u200B',
        new Map(), new WeakMap(), new WeakSet()
    ]);

    const size1 = set.size;

    set.clear();

    const size2 = set.size;
    return [size1, size2, set.has('string'), set.has(123), set.has(NaN), set.has(obj), set.has(arr), set.has(sym), set.has('😊'), nestedSet.size]
}