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

export function ArraySomeTest016(){
    const classArr = {
        0: 2,
        1: 5,
        2: 12,
        3: 8,
        length: 4
    };
    const callback = (num) => num > 10;

    const result = Array.prototype.some.call(classArr, callback);

    return result;
}
export function ArraySomeTest017(){
    const arr = [5, 15, 8];
    const thisArg = { threshold: 10 };
    const callback = function(num) {
        return num > this.threshold;
    };
    const result = arr.some(callback, thisArg);
    return result;
}
export function ArraySomeTest018(){
    const arr = [15];
    let thisValue = null;
    const callback = () => {
        'use strict';
        thisValue = this;
        return true;
    };

    arr.some(callback);
    return thisValue;
}
export function ArraySomeTest024(){
    const arr = [2, 15, 8];
    let callCount = 0;

    const callback = (num, idx, array) => {
        callCount++;
        if (idx === 0) {
            delete array[1];
        }
        return num > 10;
    };
    const result = arr.some(callback);
    return [result, callCount, arr[1]];
}
export function ArraySomeTest025(){
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const sym3 = Symbol('c');
    const arr = [sym1, sym2, sym3];
    const callback = (sym) => sym === sym2;

    const result = arr.some(callback);
    return result;
}
export function ArraySomeTest027(arr){
    arr.some('not-a-function');
}
export function ArraySomeTest028(){
    const nonArr = { 0: 15, 1: 2 };
    const callback = (num) => num > 10;

    const result = Array.prototype.some.call(nonArr, callback);
    return result;
}
export function ArraySomeTest030(){
    const arr = [
        5,
        '15',
        true,
        { value: 20 },
        Symbol('test'),
        25n
    ];

    const thisArg = {
        numThreshold: 10,
        strThreshold: '10',
        boolThreshold: true
    };

    const callback = function(elem) {
        switch (typeof elem) {
            case 'number':
                return elem > this.numThreshold;
            case 'string':
                return Number(elem) > Number(this.strThreshold);
            case 'boolean':
                return elem === this.boolThreshold;
            case 'object':
                return elem.value > this.numThreshold;
            case 'symbol':
                return elem.description === 'test';
            case 'bigint':
                return elem > BigInt(this.numThreshold);
            default:
                return false;
        }
    };

    let callCount = 0;
    const modifiedCallback = function(elem, idx) {
        callCount++;
        if (idx === 0) {
            arr.push(30);
        }
        return callback.call(thisArg, elem);
    };

    const result = arr.some(modifiedCallback);
    return [result, callCount];
}
export function ArraySomeTest048(){
    const sym = Symbol('test');
    const arr = [1, sym, 'text'];
    const callback = (item) => typeof item === 'symbol';
    const result = arr.some(callback);
    return result;
}
export function ArraySomeTest059(){
    const arrayLike = {
        0: 5,
        1: 15,
        2: 8,
        length: 3
    };
    const callback = (num) => num > 10;
    const result = Array.prototype.some.call(arrayLike, callback);
    return result;
}
export function ArraySomeTest060(){
    const str = 'hello';
    const callback = (char) => char === 'l';
    const result = Array.prototype.some.call(str, callback);
    return result;
}
export function ArraySomeTest061(){
    function testArgs() {
        return Array.prototype.some.call(arguments, num => num > 10);
    }
    const result = testArgs(5, 15, 8);
    return result;
}
export function ArraySomeTest063(){
    const arr = [5, 15, 8];
    const thisArg = { threshold: 10 };
    const callback = function(num) {
        return num > this.threshold;
    };
    const result = arr.some(callback, thisArg);
    return result;
}
export function ArraySomeTest065(){
    const arr = [5, 15, 8];
    const thisArg = { threshold: 10 };
    const callback = function(num) {
        'use strict';
        return num > this.threshold;
    };
    const result = arr.some(callback, thisArg);
    return result;
}
export function ArraySomeTest066(){
    const arr = [5, 15, 8];
    let thisValue = null;
    const callback = function() {
        'use strict';
        thisValue = this;
        return false;
    };
    arr.some(callback);
    return thisValue;
}
export function ArraySomeTest067(){
    const arr = [5, 15, 8];
    let thisValue = null;
    const callback = function() {
        thisValue = this;
        return false;
    };
    arr.some(callback);
    return thisValue;
}
export function ArraySomeTest068(){
    const arr = [5, 15, 8];
    let thisValue = null;
    const callback = function() {
        thisValue = this;
        return false;
    };
    arr.some(callback, null);
    return thisValue;
}
export function ArraySomeTest069(){
    const arr = [5, 15, 8];
    let thisValue = null;
    const callback = function() {
        'use strict';
        thisValue = this;
        return false;
    };
    arr.some(callback, null);
    return thisValue;
}
export function ArraySomeTest076(arr){
    arr.some('not a function');
}
export function ArraySomeTest077(arr){
    arr.some(null);
}
export function ArraySomeTest078(arr){
    arr.some(undefined);
}
export function ArraySomeTest079(arr){
    arr.some(123);
}
export function ArraySomeTest080(arr){
    arr.some({ });
}
export function ArraySomeTest081(){
    const arr = [5, 15, 8];
    const thisArg = new Proxy({ threshold: 10 }, {
        get: (target, prop) => target[prop]
    });
    const callback = function(num) {
        return num > this.threshold;
    };
    const result = arr.some(callback, thisArg);
    return result;
}
export function ArraySomeTest082(){
    const target = [5, 15, 8];
    const proxy = new Proxy(target, {
        get: (target, prop) => {
            if (prop === 'length') return target.length;
            return target[prop];
        }
    });
    const callback = (num) => num > 10;
    const result = Array.prototype.some.call(proxy, callback);
    return result;
}
export function ArraySomeTest083(){
    const arr = Object.freeze([5, 15, 8]);
    const callback = (num) => num > 10;
    const result = arr.some(callback);
    return result;
}
export function ArraySomeTest084(){
    const arr = Object.seal([5, 15, 8]);
    const callback = (num) => num > 10;
    const result = arr.some(callback);
    return result;
}
export function ArraySomeTest085(){
    const arr = [5, 15, 8];
    Object.defineProperty(arr, '1', { writable: false });

    const callback = (num) => num > 10;
    const result = arr.some(callback);
    return result;
}
export function ArraySomeTest086(){
    const arr = [];
    let value = 15;

    Object.defineProperty(arr, '0', {
        get: () => value,
        enumerable: true,
        configurable: true
    });
    arr.length = 1;

    const callback = (num) => num > 10;
    const result = arr.some(callback);
    return result;
}
export function ArraySomeTest088(){
    const arr = [5, 15, 8];
    function* genCallback(num) {
        yield num > 10;
    }
    const callback = (num) => genCallback(num).next().value;
    const result = arr.some(callback);
    return result;
}
export function ArraySomeTest091(){
    const typedArr = new Uint32Array(100000);
    typedArr.fill(5);
    typedArr[50000] = 15;

    const result = Array.prototype.some.call(typedArr, num => num > 10);
    return result;
}
export function ArraySomeTest092(){
    const str = 'a'.repeat(100000) + 'B' + 'a'.repeat(100000);
    const result = Array.prototype.some.call(str, char => char === 'B');
    return result;
}
export function ArraySomeTest096(){
    const sym1 = Symbol('test1');
    const sym2 = Symbol('test2');
    const targetSym = Symbol.for('target');

    const arr = [sym1, sym2, targetSym];
    const result = arr.some(sym => sym === Symbol.for('target'));
    return result;
}
export function ArraySomeTest101(){
    const arr = [
        [1, [2, [3]]],
        [4, [5, [6, [7, [15]]]]],
        [8, [9]]
    ];

    const result = arr.some(outer =>
        outer.some(middle =>
        middle.some(inner => inner > 10)
        )
    );
    return result;
}
export function ArraySomeTest119(){
    const registry = new FinalizationRegistry(() => {});
    const arr = [1, registry, 3];

    const result = arr.some(item => item instanceof FinalizationRegistry);
    return result;
}
export function ArraySomeTest122(){
    const isProxySymbol = Symbol('isProxy');

    const handler = {
        get(target, prop, receiver) {
            if (prop === isProxySymbol) {
                return true;
            }
            return Reflect.get(target, prop, receiver);
        }
    };

    const target = {};
    const proxy = new Proxy(target, handler);

    const arr = [1, proxy, 3];

    const result = arr.some(item => item && item[isProxySymbol]);
    return result;
}