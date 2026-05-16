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

export function ArrayFilterTest011(){
    const arr = [1, 2, 3, 4];
    const thisArg = { threshold: 2 };
    const callback = function(elem) {
        return elem > this.threshold;
    };

    const result = arr.filter(callback, thisArg);
    return result;
}
export function ArrayFilterTest012(){
    const arr = [1];
    let thisValue = null;
    const callback = () => {
        'use strict';
        thisValue = this;
        return true;
    };

    arr.filter(callback);
    return thisValue;
}
export function ArrayFilterTest013(result){
    return result.hasOwnProperty(1)
}
export function ArrayFilterTest014(){
    const classArr = {
        0: "a",
        1: "b",
        2: "c",
        3: "d",
        length: 4
    };
    const callback = (elem) => elem <= "b";

    const result = Array.prototype.filter.call(classArr, callback);
    return result;
}
export function ArrayFilterTest019(){
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const sym3 = Symbol('c');
    const arr = [sym1, sym2, sym3];
    const result = arr.filter(sym => sym.description === 'b');
    return [result[0] === sym2, result.length];
}
export function ArrayFilterTest020(){
    const arr = [2, 4, 6];
    const thisArg = 5;
    const callback = function(elem) {
        return elem > this.valueOf();
    };

    const result = arr.filter(callback, thisArg);
    return result;
}
export function ArrayFilterTest024(){
    const arr = [2, 4, 6];
    const thisArg = { threshold: 3 };
    let arrowThis = null;

    const arrowCallback = (elem) => {
        arrowThis = this;
        return elem > 3;
    };

    const result = arr.filter(arrowCallback, thisArg);
    return [result, arrowThis !== thisArg, arrowThis === globalThis || arrowThis === undefined];
}
export function ArrayFilterTest027(arr){
    arr.filter('not-a-function');
}
export function ArrayFilterTest028(){
    const nonArr = { 0: 'a', 1: 'b' };
    const result = Array.prototype.filter.call(nonArr, elem => elem <= 'b');
    return result;
}
export function ArrayFilterTest030(){
    const arr = [
        10,
        '20',
        null,
        undefined,
    ,
        { value: 50 },
        60n
    ];

    const thisArg = {
        threshold: 20,
        getType: (val) => typeof val
    };

    const result = arr.filter(function(elem, idx) {
        if (idx === 4) return false;

        if (elem === null) {
            return false;
        }

        switch (this.getType(elem)) {
            case 'number':
                return elem > this.threshold;
            case 'string':
                return Number(elem) > this.threshold;
            case 'object':
                return elem.value > this.threshold;
            case 'bigint':
                return elem > BigInt(this.threshold);
            default:
                return false;
        }
    }, thisArg);

    return [
        result.toString() === [
            { value: 50 },
            60n
        ].toString(),
        result.length
    ];

}
export function ArrayFilterTest038(){
    const arr = [10, 20, 30, 40];
    const thisArg = { min: 15, max: 35 };
    const callback = function(num) {
        return num > this.min && num < this.max;
    };

    const result = arr.filter(callback, thisArg);
    return result;
}
export function ArrayFilterTest043(){
    function* gen1() { yield 1; }
    function* gen2() { yield 2; }
    const arr = [gen1, gen2, () => {}, gen1];
    const result = arr.filter(item => item.constructor.name === 'GeneratorFunction');

    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(gen1);
    expect(result[1]).assertEqual(gen2);
    expect(result[2]).assertEqual(gen1);
    return [result.length, result[0] === gen1, result[1] === gen2, result[2] === gen1];
}
export function ArrayFilterTest045(){
    const arr = [1, 2, 3, 4, 5];
    const thisArg = { values: [2, 4] };
    const callback = function(num) {
        return this.values.includes(num);
    };

    const result = arr.filter(callback, thisArg);
    return result;
}
export function ArrayFilterTest046(){
    const arr = [1, 2, 3, 4, 5];
    const thisArg = { threshold: 2 };
    const callback = function(num) {
        if (num === 3) {
            this.threshold = 4;
        }
        return num > this.threshold;
    };

    const result = arr.filter(callback, thisArg);
    return result;
}
export function ArrayFilterTest047(arr){
    const result = arr.filter((num, idx) => {
        if (num === 3) {
            delete arr[4];
        }
        return num > 2;
    });
    return result;
}
export function ArrayFilterTest051(){
    const obj1 = Object.freeze({ a: 1 });
    const obj2 = { b: 2 };
    const obj3 = Object.freeze({ c: 3 });
    const arr = [obj1, obj2, obj3];

    const result = arr.filter(obj => Object.isFrozen(obj));
    return result;
}
export function ArrayFilterTest052(){
    const arr = [];
    Object.defineProperty(arr, '0', { value: 1, writable: false });
    arr.push(2);
    Object.defineProperty(arr, '2', { value: 3, writable: false });
    arr.push(4);

    const result = arr.filter(num => num % 2 === 0);
    return result;
}
export function ArrayFilterTest058(){
    const sym = Symbol('test');
    const obj1 = { [sym]: 10 };
    const obj2 = { prop: 20 };
    const obj3 = { [sym]: 30 };
    const arr = [obj1, obj2, obj3];

    const result = arr.filter(obj => sym in obj);

    return [result[0] === obj1, result[1] === obj3];
}
export function ArrayFilterTest059(){
    const obj1 = {};
    Object.defineProperty(obj1, 'prop', { value: 5, configurable: true });

    const obj2 = {};
    Object.defineProperty(obj2, 'prop', { value: 15, configurable: false });

    const arr = [obj1, obj2];

    const result = arr.filter(obj => {
        try {
            delete obj.prop;
            return true;
        } catch {
            return false;
        }
    });

    return [result.length, result[0] === obj1];
}
export function ArrayFilterTest077(){
    const arr = [1, 2, 3, 4, 5];
    const thisArg = [2, 4];
    const callback = function(num) {
        return this.includes(num);
    };

    const result = arr.filter(callback, thisArg);

    return result;
}
export function ArrayFilterTest084(){
    function* generator1() {
        yield 1;
        yield 2;
    }

    function* generator2() {
        yield 3;
    }

    const arr = [generator1, generator2, () => {}];

    const result = arr.filter(item => {
        const gen = item();
        if (typeof gen?.next !== 'function') {
            return false;
        }
        const result = gen.next();
        return result.value > 1;
    });
    return [result.length, result[0] === generator2];
}
export function ArrayFilterTest093(){
    const obj1 = { a: 1, b: 2 };
    const obj2 = { b: 3, c: 4 };
    const obj3 = Object.create({ a: 5 });
    const arr = [obj1, obj2, obj3];

    const result = arr.filter(obj => Object.hasOwn(obj, 'a'));
    return [result.length, result[0] === obj1];
}
export function ArrayFilterTest094(){
    function MyConstructor() {}
    const obj1 = new MyConstructor();
    const obj2 = {};
    const obj3 = Object.create(MyConstructor.prototype);
    const arr = [obj1, obj2, obj3];

    const result = arr.filter(obj => obj instanceof MyConstructor ||
        Object.getPrototypeOf(obj) === MyConstructor.prototype);
    return [result.length, result[0] === obj1, result[0] === obj3];
}
export function ArrayFilterTest101(){
    const prop = 'value';
    const arr = [
        { [prop]: 5 },
        { [prop]: 15 },
        { [prop]: 10 },
        { other: 20 }
    ];

    const result = arr.filter(obj => obj[prop] && obj[prop] > 10);
    return [result.length, result[0] === arr[1]];
}
export function ArrayFilterTest102(){
    const sym1 = Symbol('user');
    const sym2 = Symbol('admin');
    const sym3 = Symbol('user');
    const sym4 = Symbol('guest');
    const arr = [sym1, sym2, sym3, sym4];

    const result = arr.filter(sym => sym.description === 'user');
    return [result.length, result[0] === sym1, result[0] === sym3];
}
export function ArrayFilterTest111(){
    const obj1 = {};
    Object.defineProperty(obj1, 'prop', { value: 10, writable: false });

    const obj2 = { prop: 20 };

    const obj3 = {};
    Object.defineProperty(obj3, 'prop', { value: 30, writable: false });

    const arr = [obj1, obj2, obj3];

    const result = arr.filter(obj => {
        const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
        return desc && !desc.writable;
    });
    return [result.length, result[0] === obj1, result[0] === obj3];
}
export function ArrayFilterTest112(){
    const obj1 = {};
    Object.defineProperty(obj1, 'hidden', { value: 10, enumerable: false });

    const obj2 = { visible: 20 };

    const obj3 = {};
    Object.defineProperty(obj3, 'secret', { value: 30, enumerable: false });

    const arr = [obj1, obj2, obj3];

    const result = arr.filter(obj => {
        const props = Object.getOwnPropertyNames(obj);
        return props.some(prop => !Object.getOwnPropertyDescriptor(obj, prop).enumerable);
    });
    return [result.length, result[0] === obj1, result[0] === obj3];
}
export function ArrayFilterTest113(){
    const sym = Symbol('special');
    const obj1 = { [sym]: 10 };
    const obj2 = { regular: 20 };
    const obj3 = { [sym]: 30, regular: 40 };
    const arr = [obj1, obj2, obj3];

    const result = arr.filter(obj => sym in obj);
    return [result.length, result[0] === obj1, result[0] === obj3];
}
export function ArrayFilterTest115(thisArg, arr){
    const callback = function(item) {
        return this.allowedCategories.includes(item.category);
    };

    const result = arr.filter(callback, thisArg);
    return result;
}