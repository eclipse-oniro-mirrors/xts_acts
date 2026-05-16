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

export function ArrayEveryTest016(){
    const classArr = {
        0: 12,
        1: 15,
        2: 18,
        length: 3
    };
    const callback = (num) => num > 10;

    const result = Array.prototype.every.call(classArr, callback);
    return result;
}
export function ArrayEveryTest018(){
    const arr = [12, 15, 18];
    const thisArg = { threshold: 10 };
    const callback = function(num) {
        return num > this.threshold;
    };
    const result = arr.every(callback, thisArg);
    return result;
}
export function ArrayEveryTest019(){
    const arr = [12];
    let thisValue = null;
    const callback = () => {
        'use strict';
        thisValue = this;
        return true;
    };

    arr.every(callback);
    return thisValue;
}
export function ArrayEveryTest024(){
    const arr = [12, 15, 5];
    let callCount = 0;

    const callback = (num, idx, array) => {
        callCount++;
        if (idx === 0) {
            delete array[2];
        }
        return num > 10;
    };
    const result = arr.every(callback);
    return [result, callCount, arr[2]];
}
export function ArrayEveryTest025(){
    const sym1 = Symbol('valid');
    const sym2 = Symbol('valid');
    const sym3 = Symbol('valid');
    const arr = [sym1, sym2, sym3];
    const callback = (sym) => sym.description === 'valid'; // All symbols are valid

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest027(arr){
    arr.every('not-a-function');
}
export function ArrayEveryTest028(){
    const nonArr = { 0: 12, 1: 15 };
    const callback = (num) => num > 10;

    const result = Array.prototype.every.call(nonArr, callback);
    return result;
}
export function ArrayEveryTest030(){
    const arr = [
        12,
        '15',
        true,
        { value: 18 },
        Symbol('valid'),
        21n
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
                return elem.description === 'valid';
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
            arr[3].value = 5;
        }
        return callback.call(thisArg, elem);
    };

    const result = arr.every(modifiedCallback);
    return [result, callCount];
}
export function ArrayEveryTest041(){
    function* gen1() { yield 1; }
    function* gen2() { yield 2; }
    const arr = [gen1, gen2];
    const callback = (item) => typeof item === 'function' && item.constructor.name === 'GeneratorFunction';

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest042(){
    async function async1() { return 1; }
    async function async2() { return 2; }
    const arr = [async1, async2];
    const callback = (item) => typeof item === 'function' && item.constructor.name === 'AsyncFunction';

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest043(){
    const isProxySymbol = Symbol('isProxy');
    const handler = {
        get(target, prop, receiver) {
            if (prop === isProxySymbol) {
                return true;
            }
            return Reflect.get(target, prop, receiver);
        }
    };

    const obj1 = {};
    const obj2 = {};

    const p1 = new Proxy(obj1, handler);
    const p2 = new Proxy(obj2, handler);

    const arr = [p1, p2];

    const callback = (item) => item && item[isProxySymbol];

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest071(){
    const obj1 = Object.create(null);
    obj1.value = 1;

    const obj2 = Object.create(null);
    obj2.value = 2;

    const arr = [obj1, obj2];
    const callback = (item) => item.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest072(){
    const obj1 = Object.freeze({ value: 1 });
    const obj2 = Object.freeze({ value: 2 });
    const arr = [obj1, obj2];
    const callback = (item) => item.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest073(){
    const obj1 = { value: 1 };
    Object.seal(obj1);

    const obj2 = { value: 2 };
    Object.seal(obj2);

    const arr = [obj1, obj2];
    const callback = (item) => item.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest074(){
    const obj1 = {};
    Object.defineProperty(obj1, 'value', {
        value: 1,
        configurable: false
    });

    const obj2 = {};
    Object.defineProperty(obj2, 'value', {
        value: 2,
        configurable: false
    });

    const arr = [obj1, obj2];
    const callback = (item) => item.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest076(){
    const obj1 = {
        _value: 1,
        set value(v) { this._value = v; },
        get value() { return this._value; }
    };

    const obj2 = {
        _value: 2,
        set value(v) { this._value = v; },
        get value() { return this._value; }
    };

    const arr = [obj1, obj2];
    const callback = (item) => item.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest077(){
    const obj1 = {};
    Object.defineProperty(obj1, 'value', {
        value: 1,
        writable: false
    });

    const obj2 = {};
    Object.defineProperty(obj2, 'value', {
        value: 2,
        writable: false
    });

    const arr = [obj1, obj2];
    const callback = (item) => item.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest078(){
    const obj1 = {};
    Object.defineProperty(obj1, 'value', {
        value: 1,
        enumerable: false
    });

    const obj2 = {};
    Object.defineProperty(obj2, 'value', {
        value: 2,
        enumerable: false
    });

    const arr = [obj1, obj2];
    const callback = (item) => item.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest079(){
    const proto = { value: 1 };
    const obj1 = Object.create(proto);
    const obj2 = Object.create(proto);

    const arr = [obj1, obj2];
    const callback = (item) => item.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest080(){
    const sym = Symbol('value');
    const obj1 = { [sym]: 1 };
    const obj2 = { [sym]: 2 };

    const arr = [obj1, obj2];
    const callback = (item) => item[sym] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest081(){
    const largeKey = Number.MAX_SAFE_INTEGER;
    const obj1 = { [largeKey]: 1 };
    const obj2 = { [largeKey]: 2 };

    const arr = [obj1, obj2];
    const callback = (item) => item[largeKey] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest082(){
    const obj1 = { '-1': 1 };
    const obj2 = { '-1': 2 };

    const arr = [obj1, obj2];
    const callback = (item) => item['-1'] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest083(){
    const obj1 = { '123': 1 };
    const obj2 = { '123': 2 };

    const arr = [obj1, obj2];
    const callback = (item) => item['123'] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest084(){
    const obj1 = { '': 1 };
    const obj2 = { '': 2 };

    const arr = [obj1, obj2];
    const callback = (item) => item[''] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest085(){
    const obj1 = { '   ': 1 };
    const obj2 = { '   ': 2 };

    const arr = [obj1, obj2];
    const callback = (item) => item['   '] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest086(){
    const obj1 = { '!@#$%': 1 };
    const obj2 = { '!@#$%': 2 };

    const arr = [obj1, obj2];
    const callback = (item) => item['!@#$%'] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest088(){
    const obj1 = { '😊': 1 };
    const obj2 = { '😊': 2 };

    const arr = [obj1, obj2];
    const callback = (item) => item['😊'] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest089(){
    const sym = Symbol('value');
    const obj1 = { nested: { [sym]: 1 } };
    const obj2 = { nested: { [sym]: 2 } };

    const arr = [obj1, obj2];
    const callback = (item) => item.nested[sym] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest093(){
    const obj1 = { gen: function* () { yield 1; } };
    const obj2 = { gen: function* () { yield 2; } };

    const arr = [obj1, obj2];
    const callback = (item) => typeof item.gen === 'function';

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest106(){
    const isProxySymbol = Symbol('isProxy');

    const handler = {
        get(target, prop, receiver) {
            if (prop === isProxySymbol) {
                return true;
            }
            return Reflect.get(target, prop, receiver);
        }
    };

    const target1 = { value: 1 };
    const target2 = { value: 2 };

    const obj1 = { proxy: new Proxy(target1, handler) };
    const obj2 = { proxy: new Proxy(target2, handler) };

    const arr = [obj1, obj2];

    const callback = (item) => {
        return item.proxy && item.proxy[isProxySymbol];
    };

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest121(){
    const obj1 = { valueObj: Object.create(null) };
    obj1.valueObj.value = 1;

    const obj2 = { valueObj: Object.create(null) };
    obj2.valueObj.value = 2;

    const arr = [obj1, obj2];
    const callback = (item) => item.valueObj.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest122(){
    const obj1 = { valueObj: Object.freeze({ value: 1 }) };
    const obj2 = { valueObj: Object.freeze({ value: 2 }) };

    const arr = [obj1, obj2];
    const callback = (item) => item.valueObj.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest123(){
    const obj1 = { valueObj: { value: 1 } };
    Object.seal(obj1.valueObj);

    const obj2 = { valueObj: { value: 2 } };
    Object.seal(obj2.valueObj);

    const arr = [obj1, obj2];
    const callback = (item) => item.valueObj.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest124(){
    const obj1 = { valueObj: {} };
    Object.defineProperty(obj1.valueObj, 'value', {
        value: 1,
        configurable: false
    });

    const obj2 = { valueObj: {} };
    Object.defineProperty(obj2.valueObj, 'value', {
        value: 2,
        configurable: false
    });

    const arr = [obj1, obj2];
    const callback = (item) => item.valueObj.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest126(){
    const obj1 = { valueObj: {} };
    Object.defineProperty(obj1.valueObj, 'value', {
        value: 1,
        writable: false
    });

    const obj2 = { valueObj: {} };
    Object.defineProperty(obj2.valueObj, 'value', {
        value: 2,
        writable: false
    });

    const arr = [obj1, obj2];
    const callback = (item) => item.valueObj.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest127(){
    const obj1 = { valueObj: {} };
    Object.defineProperty(obj1.valueObj, 'value', {
        value: 1,
        enumerable: false
    });

    const obj2 = { valueObj: {} };
    Object.defineProperty(obj2.valueObj, 'value', {
        value: 2,
        enumerable: false
    });

    const arr = [obj1, obj2];
    const callback = (item) => item.valueObj.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest128(){
    const proto = { value: 1 };
    const obj1 = { valueObj: Object.create(proto) };
    const obj2 = { valueObj: Object.create(proto) };

    const arr = [obj1, obj2];
    const callback = (item) => item.valueObj.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest129(){
    const sym = Symbol('value');
    const obj1 = { valueObj: { [sym]: 1 } };
    const obj2 = { valueObj: { [sym]: 2 } };

    const arr = [obj1, obj2];
    const callback = (item) => item.valueObj[sym] > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest130(){
    const obj1 = {
        level1: {
            level2: {}
        }
    };

    Object.defineProperty(obj1.level1.level2, 'value', {
        value: 1,
        writable: false,
        enumerable: false,
        configurable: false
    });

    const obj2 = {
        level1: {
            level2: {}
        }
    };

    Object.defineProperty(obj2.level1.level2, 'value', {
        value: 2,
        writable: false,
        enumerable: false,
        configurable: false
    });

    const arr = [obj1, obj2];
    const callback = (item) => item.level1.level2.value > 0;

    const result = arr.every(callback);
    return result;
}
export function ArrayEveryTest139(){
    function testArgs() {
        return Array.prototype.every.call(arguments, item => item > 0);
    }

    const result = testArgs(1, 2, 3, 4);
    return result;
}
export function ArrayEveryTest143(){
    const arrayLike = {
        0: 1,
        2: 3,
        length: 3
    };

    const callback = (item) => item > 0;
    const result = Array.prototype.every.call(arrayLike, callback);
    return result;
}
export function ArrayEveryTest144(){
    const arrayLike = {
        0: 1,
        1: undefined,
        2: 3,
        length: 3
    };

    const callback = (item) => item != null;
    const result = Array.prototype.every.call(arrayLike, callback);
    return result;
}
export function ArrayEveryTest149(){
    function* generator() {
        yield 1;
        yield 2;
        yield 3;
    }

    const arr = Array.from(generator());
    const callback = (item) => item > 0;

    const result = arr.every(callback);
    return result;
}
export async function ArrayEveryTest150(){
    async function* asyncGenerator() {
        yield 1;
        yield 2;
        yield 3;
    }

    const arr = [];
    for await (const value of asyncGenerator()) {
        arr.push(value);
    }

    const callback = (item) => item > 0;
    const result = arr.every(callback);
    return result;
}