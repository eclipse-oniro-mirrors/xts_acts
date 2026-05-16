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

export function NewMap() {
    return new Map();
}

export function NewObject() {
    return {};
}

export function MapClearTest011() {
    const sym1 = Symbol('sym1');
    const sym2 = Symbol('sym2');
    const map = new Map();
    map.set(sym1, 'symbol1');
    map.set(sym2, 'symbol2');
    return map;
}

export function MapClearTest037() {
    const map = new Map([['a', 1]]);

    function clearMap(m) {
        m.clear();
    }
    clearMap(map);
    return map.size;
}

export function MapClearTest039() {
    const map = new Map([['a', 1]]);
    Object.freeze(map);
    let errorThrown = false;

    try {
        map.clear();
    } catch (e) {
        errorThrown = true;
    }
    return errorThrown
}

export function MapClearTest040() {
    const map = new Map([['a', 1]]);
    Object.seal(map);
    let errorThrown = false;

    try {
        map.clear();
    } catch (e) {
        errorThrown = true;
    }
    return errorThrown
}

export function MapClearTest042() {
    let obj = {};
    const map = new Map();
    map.set(obj, 'value');
    map.clear();
    obj = null; // Help GC
    // We can't directly test GC, but we can verify the map is empty
    return map;
}

export function MapClearTest043() {
    const map = new Map([[1, 'a'], [2, 'b'], [3, 'c']]);
    const entries = [];

    for (const entry of map) {
        entries.push(entry);
        if (entry[0] === 2) {
            map.clear();
        }
    }
    return entries.length;
}

export function MapClearTest050() {
    const map = new Map();
    map.set(Symbol.asyncIterator, 'async iterator');
    map.set(Symbol.hasInstance, 'has instance');
    map.clear();
    return map.size;
}

export function MapClearTest052() {
    const map = new Map([[1, 'a'], [2, 'b']]);
    map.clear();
    return [...map].length;
}

export async function MapClearTest055() {
    const map = new Map([['key', 'value']]);

    await new Promise(resolve => {
        map.clear();
        resolve();
    });
    return map.size;
}

export function MapClearTest059() {
    const value = { prop: 'test' };
    const map = new Map([['key', value]]);
    map.clear();
    return value.prop
}

export function MapClearTest060() {
    const key = { prop: 'test' };
    const map = new Map([[key, 'value']]);
    map.clear();
    return key.prop
}

export function MapClearTest065() {
    if (typeof Buffer !== 'undefined') {
        const buffer = Buffer.from('test');
        const map = new Map([[buffer, 'buffer value']]);
        map.clear();
        return map.size === 0;
    } else {
        // Skip if not in Node.js environment
        return true;
    }
}

export function MapClearTest066() {
    if (typeof Buffer !== 'undefined') {
        const buffer = Buffer.from('test');
        const map = new Map([['key', buffer]]);
        map.clear();
        return map.size === 0;
    } else {
        // Skip if not in Node.js environment
        return true;
    }
}

export function MapClearTest069() {
    const weakMap = new WeakMap();
    const obj = {};
    weakMap.set(obj, 'weak value');
    const map = new Map([['weak', weakMap]]);
    map.clear();
    return map.size;
}

export function MapClearTest071() {
    function* generator() {
        yield 1;
        yield 2;
    }
    const map = new Map([['gen', generator]]);
    map.clear();
    return map.size;
}

export function MapClearTest072() {
    async function asyncFunc() {
        return 'test';
    }
    const map = new Map([['async', asyncFunc]]);
    map.clear();
    return map.size;
}

export function MapClearTest077() {
    const map = new Map([[1, 'a']]);
    map.clear();

    function isEmpty(m) {
        return m.size === 0 && !m.keys().next().value;
    }
    return isEmpty(map);
}

export function MapClearTest078() {
    const map = new Map([[1, 'a'], [2, 'b']]);
    map.clear();
    let iterationCount = 0;

    for (const [key, value] of map) {
        iterationCount++;
    }
    return iterationCount
}

export function MapClearTest082() {
    const obj = {};
    const map = new Map();
    map.set(obj, 'value');
    obj.map = map; // Create circular reference
    map.clear();
    return map.size;
}

export function MapClearTest083() {
    if (typeof document !== 'undefined') {
        const element = document.createElement('div');
        const map = new Map([[element, 'dom element']]);
        map.clear();
        return map.size===0;
    } else {
        // Skip if not in browser environment
        return true
    }
}

export function MapClearTest084() {
    if (typeof document !== 'undefined') {
        const element = document.createElement('div');
        const map = new Map([['element', element]]);
        map.clear();
        return map.size===0;
    } else {
        // Skip if not in browser environment
        return true
    }
}

export function MapClearTest087() {
    const map = new Map([[1, 'a']]);
    map.clear();
    return Object.getPrototypeOf(map) === Map.prototype;
}

export function MapClearTest090() {
    const map = new Map([[1, 'a']]);
    map.clear();
    return Object.prototype.toString.call(map);
}

export function MapClearTest100() {
    const map = new Map([[Reflect, 'reflect']]);
    map.clear();
    return map.size;
}