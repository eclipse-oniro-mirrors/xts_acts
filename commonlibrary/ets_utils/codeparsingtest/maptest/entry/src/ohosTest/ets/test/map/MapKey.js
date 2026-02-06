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
export function MapKeysTest001(){
    const map = new Map();
    const keys = [...map.keys()];
    let keys1 = keys.length;
    return {keys1,keys};
}

export function MapKeysTest002(){
    const map = new Map([['a', 1]]);
    const keys = [...map.keys()];
    let keys1 = keys.length;
    return {keys1,keys};
}

export function MapKeysTest003(){
    const map = new Map([['b', 2], ['a', 1], ['c', 3]]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest004(){
    const map = new Map([[123, 'x']]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest005(){
    const map = new Map([[3, 30], [1, 10], [2, 20]]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest006(){
    const map = new Map([[true, 't']]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest007(){
    const map = new Map([[false, 'f']]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest008(){
    const map = new Map([[true, 1], [1, true]]);
    const keys = [...map.keys()];
    const keys1 = keys.length;
    return { keys,keys1 };
}

export function MapKeysTest009(){
    const map = new Map([[null, 'n']]);
    const keys = [...map.keys()];
    const keys1 = keys[0];
    return keys1;
}

export function MapKeysTest010(){
    const map = new Map([[undefined, 'u']]);
    const keys = [...map.keys()];
    const keys1 = keys[0];
    return keys1;
}

export function MapKeysTest011(){
    const map = new Map([[null, 1], [undefined, 2]]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest012(){
    const s = Symbol('test');
    const map = new Map([[s, 1]]);
    const keys = [...map.keys()];
    const keys1 = keys[0];
    return {keys1,s};
}

export function MapKeysTest013(){
    const s1 = Symbol(1);
    const s2 = Symbol(2);
    const map = new Map([[s2, 2], [s1, 1]]);
    const keys = [...map.keys()];
    const keys1 = [s2,s1]
    return {keys,keys1};
}

export function MapKeysTest014(){
    const b = 42n;
    const map = new Map([[b, 'big']]);
    const keys = [...map.keys()];
    const keys1 = keys[0];
    return keys1;
}

export function MapKeysTest015(){
    const b1 = 42n;
    const b2 = 42n;
    const map = new Map([[b1, 1], [b2, 2]]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest016(){
    const obj = {};
    const map = new Map([[obj, 'o']]);
    const keys = [...map.keys()];
    const keys1 = keys[0];
    return { keys1,obj };
}

export function MapKeysTest017(){
    const o1 = {};
    const o2 = {};
    const map = new Map([[o1, 1], [o2, 2]]);
    const keys = [...map.keys()];
    const test017 = [o1,o2]
    return { keys,test017 };
}

export function MapKeysTest018(){
    const arr = [1, 2];
    const map = new Map([[arr, 'a']]);
    const keys = [...map.keys()];
    const keys1 = keys[0];
    return { keys1,arr };
}

export function MapKeysTest019(){
    const a1 = [1, 2];
    const a2 = [1, 2];
    const map = new Map([[a1, 1], [a2, 2]]);
    const keys = [...map.keys()];
    const keys1 = keys[0];
    const keys2 = keys[1];
    return { keys,keys1,keys2 };
}

export function MapKeysTest020(){
    const fn = () => {};
    const map = new Map([[fn, 'f']]);
    const keys = [...map.keys()];
    const keys1 = keys[0];
    return { keys1,fn };
}

export function MapKeysTest021(){
    const map = new Map();
    const iterator = map.keys();
    const keys = iterator.next;
    const keys1 = iterator[Symbol.iterator];
    return { keys,keys1 };
}

export function MapKeysTest025(){
    const iterator = new Map([[1, 10], [2, 20], [3, 30]]).keys();
    const values = [iterator.next().value, iterator.next().value, iterator.next().value];
    return values;
}

export function MapKeysTest029(){
    const map = new Map([[1, 'a']]);
    const iterator = map.keys();
    map.set(2, 'b'); // 迭代开始后新增键
    const keys = [...iterator];
    return keys;
}

export function MapKeysTest030(){
    const map = new Map([[1, 'a'], [2, 'b']]);
    const iterator = map.keys();
    iterator.next(); // 迭代第一个键
    map.delete(1); // 删除已迭代的键
    const keys = [...iterator];
    return keys;
}

export function MapKeysTest031(){
    const map = new Map([[1, 'a'], [2, 'b']]);
    const iterator = map.keys();
    map.delete(2); // 删除已迭代的键
    const keys = [...iterator];
    return keys;
}
export function MapKeysTest032(){
    const iterator = new Map([[1, 'a']]).keys();
    [...iterator]
    return [...iterator]
}

export function MapKeysTest033(){
    const map = new Map([[NaN, 'a']]);
    const keys = [...map.keys()];
    const keys1 = keys[0];
    return keys1;
}

export function MapKeysTest034(){
    const map = new Map([[0, 'a'], [-0, 'b']]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest035(){
    const date = new Date(2024, 0, 1);
    const map = new Map([[date, 'a']]);
    const keys = [...map.keys()];
    return { keys, date };
}

export function MapKeysTest036(){
    const regex = /test/;
    const map = new Map([[regex, 'a']]);
    const keys = [...map.keys()];
    return { keys, regex };
}

export function MapKeysTest037(){
    const map = new Map();
    map.set(map, 'self');
    const keys = [...map.keys()];
    return { keys, map };
}
export function MapKeysTest038(){
    const set = new Set([1, 2]);
    const map = new Map([[set, 'a']]);
    const keys = [...map.keys()];
    return { keys, set };
}

export function MapKeysTest039(){
    "use strict";
    const map = new Map([['strict', 'mode']]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest040(){
    const map = new Map([[1, 'a'], [2, 'b'], [3, 'c']]);
    const [k1, k2, k3] = map.keys();
    return { k1,k2,k3 };
}

export function MapKeysTest041(){
    const map = new Map([['x', 10], ['y', 20]]);
    const keys = [...map.keys()];
    return keys;
}

export function MapKeysTest042(){
    const nestedArr = [[1], [2]];
    const map = new Map([[nestedArr, 'value']]);
    const keys = [...map.keys()];
    return { keys,nestedArr };
}

export function MapKeysTest044(){
    const numObj = new Number(5);
    const map = new Map([[numObj, 'obj'], [5, 'prim']]);
    const keys = [...map.keys()];
    return { keys,numObj };
}

export function MapKeysTest046(){
    const strObj = new String('test');
    const map = new Map([[strObj, 'obj'], ['test', 'prim']]);
    const keys = [...map.keys()];
    return { keys,strObj };
}

export function MapKeysTest051(){
    const arrayLike = { 0: 'a', 1: 'b', length: 2 };
    const map = new Map([[arrayLike, 'value']]);
    const keys = [...map.keys()];
    return { keys,arrayLike };
}


export function MapKeysTest052(){
    const weakMap = new WeakMap();
    const map = new Map([[weakMap, 'value']]);
    const keys = [...map.keys()];
    return { keys,weakMap };
}

export function MapKeysTest054(){
    const s1 = Symbol.for('shared');
    const s2 = Symbol.for('shared'); // 与s1共享同一Symbol
    const map = new Map([[s1, 'value']]);
    const keys = [...map.keys()];
    return { keys,s2 };
}

export function MapKeysTest056(){
    const map = new Map([[1, 'a']]);
    const iterator = map.keys();
    const keys1 = iterator[Symbol.iterator]()
    return { keys1,iterator };
}

export function MapKeysTest061(){
    function* generator() { yield 1; }
    const map = new Map([[generator, 'value']]);
    const keys = [...map.keys()];
    return { keys,generator };
}

export function MapKeysTest066(){
    const arr = ['a', 'b'];
    const arrLike = { 0: 'a', 1: 'b', length: 2 };
    const map = new Map([[arr, 1], [arrLike, 2]]);
    const keys = [...map.keys()];
    const keys1 = [arr, arrLike];
    return { keys,keys1 };
}

export function MapKeysTest068(){
    const numObj = new Number(5);
    const bigInt = 5n;
    const map = new Map([[numObj, 1], [bigInt, 2]]);
    const keys = [...map.keys()];
    return { keys,numObj };
}

export function MapKeysTest069(){
    const target = {};
    const proxy = new Proxy(target, {});
    const map = new Map([[proxy, 'value']]);
    const keys = [...map.keys()];
    return { keys,proxy };
}

export function MapKeysTest070(){
    const mapKeys = [...new Map().keys()];
    const emptyArr = [];
    return { mapKeys,emptyArr };
}

export function MapKeysTest071(){
    const obj = {};
    obj.self = obj; // 循环引用
    const map = new Map([[obj, 'value']]);
    const keys = [...map.keys()];
    return { keys,obj };
}

export function MapKeysTest074(){
    const s = Symbol(123);
    const map = new Map([[s, 1], [123, 2]]);
    const keys = [...map.keys()];
    return { keys,s };
}

export function MapKeysTest075(){
    const fn = () => {};
    const map = new Map([[fn, 1], ['function', 2]]);
    const keys = [...map.keys()];
    return { keys,fn };
}

export function MapKeysTest087(){
    const dateStr = '2024-01-01';
    const dateObj = new Date(dateStr);
    const map = new Map([[dateStr, 1], [dateObj, 2]]);
    const keys = [...map.keys()];
    const keys1 = [dateStr, dateObj];
    return { keys,keys1 };
}

export function MapKeysTest089(){
    const regex = /test/;
    const str = '/test/';
    const map = new Map([[regex, 1], [str, 2]]);
    const keys = [...map.keys()];
    const keys1 = [regex, str];
    return { keys,keys1 };
}

export function MapKeysTest090(){
    const obj = { prop: 'old' };
    const map = new Map([[obj, 'value']]);
    obj.prop = 'new'; // 修改对象属性
    const keys = [...map.keys()];
    return { keys,obj };
}

export function MapKeysTest095(){
    const error = new Error('test');
    const errorStr = 'test';
    const map = new Map([[error, 1], [errorStr, 2]]);
    const keys = [...map.keys()];
    const keys1 = [error, errorStr]
    return { keys,keys1 };
}

export function MapKeysTest096(){
    const b = 42n;
    const str = '42n';
    const map = new Map([[b, 1], [str, 2]]);
    const keys = [...map.keys()];
    const keys1 = [42n, '42n'];
    return { keys,keys1 };
}

export function MapKeysTest099(){
    const sym = Symbol.iterator;
    const map = new Map([[sym, 'value']]);
    const keys = Array.from(map.keys());
    return { keys,sym };
}

export function MapKeysTest0100(){
    const obj = {};
    const sym = Symbol('test');
    const arr = [];
    const map = new Map([
        [null, 1],
        [obj, 2],
        [3, 3],
        [sym, 4],
        [arr, 5],
        ['str', 6],
        [true, 7],
        [42n, 8]
    ]);
    const expectedKeys = [null, obj, 3, sym, arr, 'str', true, 42n];
    const keys = [...map.keys()];
    return { keys,expectedKeys };
}