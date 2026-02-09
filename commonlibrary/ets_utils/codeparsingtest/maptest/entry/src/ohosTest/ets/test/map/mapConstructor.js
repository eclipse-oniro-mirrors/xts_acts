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
// 'use strict'
export function MapConstructorObject(){
    return {};
}

export function MapConstructorSymbol(str){
    return Symbol(str);
}
export function MapConstructorPrototype(){
    return Map.prototype;
}

export function MapConstructorTest004(){
    const set = new Set([['a', 1], ['b', 2]]);      // Error in MapConstructorTest004, nextItem is not Object
    const map = new Map(set);
    return map;
}



export function MapConstructorTest005(){
    const iterable = {
        *[Symbol.iterator]() {
            yield ['x', 10];
            yield ['y', 20];
        }
    };
    const map = new Map(iterable);
    return map;
}

export function MapConstructorTest006() {
    let errorThrown = false;
    try {
        // @ts-ignore
        const map = new Map();
    } catch (e) {
        errorThrown = true;
    }
    return errorThrown;
}

export function MapConstructorTest009(){
    let errorThrown = false;
    try {
        // @ts-ignore
        const map = new Map(123);
    } catch (e) {
        errorThrown = true;
    }
    return errorThrown;
}

export function MapConstructorTest010(){
    // let map = new Map('abc');  // 不能这么赋值
    return map;
}

export function MapConstructorTest020(){
    const arrayLike = {
        0: ['a', 1],
        1: ['b', 2],
        length: 2
    };
    // @ts-ignore
    const map = new Map(arrayLike);     // object is not iterable (cannot read property Symbol(Symbol.iterator))
    return map;
}

export function MapConstructorTest021(){
    function* generator() {
        yield ['a', 1];
        yield ['b', 2];
        yield ['c', 3];
    }
    const map = new Map(generator());
    return map
}

export function MapConstructorTest028() {
    const entries = [];
    for (let i = 0; i < 1000; i++) {
        entries.push([`key${i}`, i]);
    }
    const map = new Map(entries);
    return map;
}

export function MapConstructorTest029() {
    const iterable = {
        *[Symbol.iterator]() {
            yield { 0: 'a', 1: 1, length: 2 };
            yield { 0: 'b', 1: 2, length: 2 };
        }
    };
    const map = new Map(iterable);
    return map;
}

export function MapConstructorTest030() {
    const iterable = [
        ['valid', 1],
        'invalid',
        [2],
        { 0: 'x' },
        null,
        undefined
    ];
    const map = new Map(iterable);      // Iterator value invalid is not an entry object
    return map;
}

export function MapConstructorTest031() {
    const keyMap = new Map();
    const map = new Map([[keyMap, 'value']]);
    return map.get(keyMap);
}

export function MapConstructorTest032() {
    const keySet = new Set();
    const map = new Map([[keySet, 'value']]);
    return {map,keySet};
}

export function MapConstructorTest034() {
    const descriptor = Object.getOwnPropertyDescriptor(Map.prototype, 'size');
    let g = descriptor.get
    let s = descriptor.set
    return {g,s};
}

export function MapConstructorTest035() {
    return new Map([
        ['a', 1],
        [2, 'b'],
        [true, false]
    ]);
}

export function MapConstructorTest036() {
    return new Map([['1', 'string'], [1, 'number']])
}

export function MapConstructorTest041() {
    const arr = [['a', 1]];
    const iterable = {
        [Symbol.iterator]() {
            let index = 0;
            return {
                next() {
                    if (index === 0) {
                        arr.push(['b', 2]);
                    }
                    const value = arr[index];
                    index++;
                    return { value, done: index > arr.length };
                }
            };
        }
    };
    return new Map(iterable);
}

export function MapConstructorTest043() {
    return  new Map([[123, 'number'], [123n, 'bigint']]);
}
export function MapConstructorTest048() {
    const sparseArray = [['a', 1], , ['b', 2]];
    return  new Map(sparseArray);       //  Iterator value undefined is not an entry object
}

export function MapConstructorTest049() {
    const keyWeakMap = new WeakMap();
    const map = new Map([[keyWeakMap, 'value']]);
    return {map,keyWeakMap}
}

export function MapConstructorTest054() {
    const iterable = {
        [Symbol.iterator]() {
            let count = 0;
            return {
                next() {
                    count++;
                    if (count === 2) {
                        throw new Error('Iteration error');
                    }
                    return { value: [`key${count}`, count], done: count > 3 };
                }
            };
        }
    };

    let errorThrown = false;
    let map;
    try {
        map = new Map(iterable);
    } catch (e) {
        errorThrown = true;
    }
    return {map,errorThrown}
}

export function MapConstructorTest059() {
    function* gen() { yield 1; }
    const generator = gen();
    const map = new Map([[generator, 'generator value']])
    return {map,generator};
}

export function MapConstructorTest061() {
    function getArgs() {
        return arguments;
    }
    const args = getArgs(1, 2, 3);
    return args;
}


export function MapConstructorTest064() {
    const iterable = {
        *[Symbol.iterator]() {
            yield 'string';
            yield 123;
            yield true;
        }
    };
    return new Map(iterable)    // Iterator value string is not an entry object
}

export function MapConstructorTest083() {
    const map = new Map([[Reflect, 'reflect object']])
    return {map,Reflect}
}

export function MapConstructorTest084() {
    const map = new Map([[Intl, 'intl object']]);
    return {map,Intl}
}

export function MapConstructorTest091() {
    const map = new Map([[URL, 'url constructor']]);
    return {map,URL}
}

export function MapConstructorTest092() {
    const map = new Map([[URLSearchParams, 'url search params constructor']]);
    return {map,URLSearchParams}
}

export function MapConstructorTest094() {
    const map = new Map([[performance, 'performance object']]);
    return {map,performance}
}

export function MapConstructorTest095() {
    const map = new Map([[location, 'location object']]);   // Error in MapConstructorTest095, location is not defined
    return {map,location}
}

export function MapConstructorTest096() {
    const map = new Map([[history, 'history object']]);     // ReferenceError: history is not defined
    return {map,history}
}

export function MapConstructorTest097() {
    const map = new Map([[document, 'document object']]);   // ReferenceError: document is not defined
    return {map,document}
}

export function MapConstructorTest098() {
    const map = new Map([[window, 'window object']]);       // ReferenceError: window is not defined
    return {map,window}
}

export function MapConstructorTest099() {
    const map = new Map([[global, 'global object']]);
    return {map,global}
}

export function MapConstructorTest100() {
    const map = new Map([[process, 'process object']]);
    return {map,process}
}

export function MapConstructorTest101() {
    return Object.freeze(MapConstructorObject());
}

export function MapConstructorTest102(obj) {
    Object.seal(obj);
}

export function MapConstructorTest103() {
    return Object.freeze({ prop: 'value' });
}
