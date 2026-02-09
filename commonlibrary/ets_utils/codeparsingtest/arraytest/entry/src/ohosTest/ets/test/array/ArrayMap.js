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

export function ArrayMapTest011(){
    const arr = [1, 2, 3];
    const thisArg = { multiplier: 10 };
    const callback = function(elem) {
        return elem * this.multiplier;
    };

    const result = arr.map(callback, thisArg);
    return result;
}
export function ArrayMapTest012(){
    const arr = [1];
    let thisValue = null;
    const callback = () => {
        'use strict';
        thisValue = this;
        return 0;
    };

    arr.map(callback);
    return thisValue;
}
export function ArrayMapTest013(result){
    return result.hasOwnProperty(1);
}
export function ArrayMapTest014(){
    const classArr = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    const callback = (elem) => elem.toUpperCase();

    const result = Array.prototype.map.call(classArr, callback);

    return result;
}
export function ArrayMapTest019(){
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const arr = [sym1, sym2];
    const result = arr.map(sym => sym.description);

    return result;
}
export function ArrayMapTest020(){
    const arr = [2];
    const thisArg = 5;
    const callback = function(elem) {
        return elem * this.valueOf();
    };

    const result = arr.map(callback, thisArg);

    return result;
}
export function ArrayMapTest024(){
    const arr = [2];
    const thisArg = { multiplier: 3 };
    let arrowThis = null;

    const arrowCallback = (elem) => {
        arrowThis = this;
        return elem * 2;
    };

    const result = arr.map(arrowCallback, thisArg);

    return [result, arrowThis !== thisArg, arrowThis === globalThis || arrowThis === undefined];
}
export function ArrayMapTest027(arr){
    arr.map('not-a-function');
}
export function ArrayMapTest028(){
    const nonArr = { 0: 'a', 1: 'b' };
    const result = Array.prototype.map.call(nonArr, elem => elem.toUpperCase());

    return result;
}
export function ArrayMapTest030(){
    const arr = [
        10,
        '20',
        null,
        undefined,
    ,
        { value: 50 },
        Symbol('test'),
        60n
    ];

    const thisArg = {
        multiplier: 2,
        getType: (val) => typeof val
    };

    const result = arr.map(function(elem, idx) {
        if (idx === 4) return;

        if (elem === null) {
            return null;
        }

        switch (this.getType(elem)) {
            case 'number':
                return elem * this.multiplier;
            case 'string':
                return Number(elem) * this.multiplier;
            case 'object':
                return elem.value * this.multiplier;
            case 'symbol':
                return elem.description;
            case 'bigint':
                return elem * BigInt(this.multiplier);
            default:
                return null;
        }
    }, thisArg);

    return result;
}
export function ArrayMapTest036(){
    const obj1 = Object.freeze({ prop: 1 });
    const obj2 = Object.freeze({ prop: 2 });
    const arr = [obj1, obj2];
    const result = arr.map(obj => obj.prop * 2);

    return result;
}
export function ArrayMapTest037(){
    const arr = [1, 2, 3];
    function* generator(num) {
        yield num * 2;
    }
    const result = arr.map(num => generator(num).next().value);
    return result;
}
export function ArrayMapTest038(){
    const arr = [
        { get value() { return 10; } },
        { get value() { return 20; } }
    ];
    const result = arr.map(obj => obj.value);
    return result;
}
export function ArrayMapTest039(){
    const arr = [1, 2];
    const result = arr.map(function(num) {
        Object.prototype.double = function() { return this * 2; };
        return num.double();
    });

    delete Object.prototype.double;
    return result;
}
export function ArrayMapTest046(){
    const arr = [0, '', false, 1, 'value', true];
    const result = arr.map(item => {
        let value = null;
        value ||= item;
        return value;
    });
    return result;
}
export function ArrayMapTest047(){
    const target = { value: 10 };
    const proxy = new Proxy(target, {
        get: (obj, prop) => prop === 'value' ? obj[prop] * 2 : obj[prop]
    });
    const arr = [proxy, { value: 20 }];
    const result = arr.map(item => item.value);

    return result;
}
export function ArrayMapTest058(){
    const arr = [[1, 2], [3, 4], [5, 6]];
    const result = arr.map(([first, ...rest]) => rest.length);

    return result;
}
export function ArrayMapTest061(){
    const modules = {
        'module1': { version: '1.0' },
        'module2': { version: '2.0' }
    };

    const arr = ['module1', 'module2'];
    const result = arr.map(moduleName => modules[moduleName]?.version);

    return result;
}
export function ArrayMapTest065(){
    const arr = [
        Promise.resolve(1),
        Promise.reject(new Error('Failed')),
        Promise.resolve(3)
    ];
    const result = arr.map(p => p.catch(e => 'error'));
    return result;
}
export function ArrayMapTest067(obj){
    return obj.hasOwnProperty('a');
}
export function ArrayMapTest068(arr, prop){
    return arr.map(obj => obj[prop] || 0);
}
export function ArrayMapTest070(){
    const multiplier = {
        value: 2,
        multiply: function(num) { return num * this.value; }
    };

    const arr = [1, 2, 3];
    const result = arr.map(multiplier.multiply.bind(multiplier));
    return result;
}
export function ArrayMapTest072(){
    const add = (x) => x + 1;
    const multiply = (x) => x * 2;
    const compose = (f, g) => (x) => f(g(x));

    const arr = [1, 2, 3];
    const result = arr.map(compose(add, multiply));
    return result;
}
export function ArrayMapTest074(){
    const memo = new Map();
    const expensiveCalculation = (num) => {
        if (!memo.has(num)) {
            memo.set(num, num * 2);
        }
        return memo.get(num);
    };

    const arr = [1, 2, 1, 3, 2];
    const result = arr.map(expensiveCalculation);
    return [memo, result];
}
export function ArrayMapTest075(){
    function* generator1() { yield 1; yield 2; }
    function* generator2() { yield 3; yield 4; }

    const arr = [generator1, generator2];
    const result = arr.map(gen => Array.from(gen()).reduce((a, b) => a + b, 0));
    return result;
}
export function ArrayMapTest077(){
    const arr1 = [1, 2];
    const arr2 = [3, 4];
    const arr = [arr1[Symbol.iterator](), arr2[Symbol.iterator]()];
    const result = arr.map(iterator => iterator.next().value);
    return result;
}
export function ArrayMapTest079(){
    async function* asyncGenerator(num) {
        yield num * 2;
    }

    const arr = [asyncGenerator(1), asyncGenerator(2)];
    const promises = arr.map(async iterator => {
        const result = await iterator.next();
        return result.value;
    });
    return promises;
}
export function ArrayMapTest098(){
    const modules = {
        'math': { add: (a, b) => a + b },
        'string': { upper: (s) => s.toUpperCase() }
    };

    const importModule = async (name) => modules[name];

    const arr = ['math', 'string'];
    const promises = arr.map(async moduleName => {
        const module = await importModule(moduleName);
        return moduleName === 'math' ? module.add(2, 3) : module.upper('test');
    });
    return promises;
}
export function ArrayMapTest101(){
    const arr = [
        { match: (url) => url === '/api' && { status: 200 } },
        { match: (url) => url === '/api' && { status: 404 } }
    ];
    const result = arr.map(cache => cache.match('/api')?.status || 500);

    return result;
}
export function ArrayMapTest102(){
    if (!Array.prototype.groupBy) {
        Array.prototype.groupBy = function(callback) {
            return this.reduce((groups, item) => {
                const key = callback(item);
                (groups[key] || (groups[key] = [])).push(item);
                return groups;
            }, {});
        };
    }

    const arr = [[1, 2, 3], [4, 5], [6]];
    const result = arr.map(subArr => subArr.groupBy(num => num % 2 === 0 ? 'even' : 'odd'));

    return result;
}
export function ArrayMapTest108(){
    const arr = [0, 1, '', 'hello', null, undefined];
    const result = arr.map(item => {
        let value = 'default';
        item ||= value;
        return item;
    });
    return result;
}
export async function ArrayMapTest110(){
    const mockImports = {
        './utils.js': { format: (s) => s.toUpperCase() },
        './helpers.js': { multiply: (a, b) => a * b }
    };

    const importModule = async (path) => mockImports[path];

    const arr = ['./utils.js', './helpers.js'];
    const promises = arr.map(async (path) => {
        const module = await importModule(path);
        return path.includes('utils') ? module.format('test') : module.multiply(3, 4);
    });

    const result = await Promise.all(promises);
    return result;
}
export function ArrayMapTest112(){
    const arr = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12]
    ];
    const result = arr.map(subArr => subArr.findLast(num => num % 3 === 0));
    return result;
}
export async function ArrayMapTest113(){
    const arr = [
        { postTask: (cb) => cb() },
        { postTask: (cb) => cb() }
    ];
    const results = [];

    const promises = arr.map((scheduler, i) => {
        return new Promise(resolve => {
            scheduler.postTask(() => {
                results.push(i);
                resolve(i);
            });
        });
    });

    await Promise.all(promises);
    return results;
}
export function ArrayMapTest114(){
    if (!String.prototype.at) {
        return;
    }

    const arr = ['hello', 'world', 'test'];
    const result = arr.map(str => str.at(-1));
    return result;
}
export function ArrayMapTest115(){
    const arr = [
        { instance: { exports: { add: (a, b) => a + b } } },
        { instance: { exports: { multiply: (a, b) => a * b } } }
    ];
    const result = arr.map(wasm => {
        if (wasm.instance.exports.add) {
            return wasm.instance.exports.add(2, 3);
        }
        return wasm.instance.exports.multiply(2, 3);
    });
    return result;
}
export function ArrayMapTest116(){
    if (!Array.prototype.findLastIndex) {
        return;
    }

    const arr = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12]
    ];
    const result = arr.map(subArr => subArr.findLastIndex(num => num % 3 === 0));

    return result;
}
export function ArrayMapTest117(){
    const arr = [
        { id: 'fetch1', result: 'success', downloaded: 1024, total: 1024 },
        { id: 'fetch2', result: 'failure', downloaded: 512, total: 1024 }
    ];
    const result = arr.map(fetch => Math.round((fetch.downloaded / fetch.total) * 100));

    return result;
}
export function ArrayMapTest118(){
    const arr = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ];
    const result = arr.map(subArr => subArr.with(1, 0));

    return result;
}
export async function ArrayMapTest119(){
    const arr = [
        { add: (item) => Promise.resolve(item.id) },
        { add: (item) => Promise.resolve(item.id) }
    ];
    const items = [
        { id: 'article1', url: '/article1' },
        { id: 'article2', url: '/article2' }
    ];

    const promises = arr.map((index, i) => index.add(items[i]));
    const result = await Promise.all(promises);

    return result;
}
export function ArrayMapTest122(){
    const arr = [[1, 2, 3], [4, 5], [6]];
    function groupByToMap(array, callback) {
        const map = new Map();
        for (const item of array) {
            const key = callback(item);
            if (!map.has(key)) {
                map.set(key, []);
            }
            map.get(key).push(item);
        }
        return map;
    }
    const result = arr.map(subArr => {
        const map = groupByToMap(subArr, num => num % 2 === 0 ? 'even' : 'odd');
        return { odd: map.get('odd')?.length || 0, even: map.get('even')?.length || 0 };
    });

    return result;
}
export function ArrayMapTest124(){
    const Temporal = globalThis.Temporal || {
        PlainDate: {
            from: (str) => {
            const [y, m, d] = str.split('-').map(Number);
            return { year: y, month: m, day: d, add: (o) => ({
            year: y + (o.years || 0),
            month: m + (o.months || 0),
            day: d + (o.days || 0)
        }) };
    }
    }
    };

    const arr = [
        Temporal.PlainDate.from('2023-01-01'),
        Temporal.PlainDate.from('2023-06-15')
    ];
    const result = arr.map(date => {
        const nextYear = date.add({ years: 1 });
        return nextYear.year;
    });

    return result;
}