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
export function MapforeachTest008(){
    const map = new Map([['a', 10]]);
    const context = { multiplier: 2, result: 0 };
    map.forEach((value) => {
        context.result = value * context.multiplier;
    }, context);
    let map1 = context.result;
    return { map1 }
}
export function MapforeachTest009(){
    const map = new Map([[true, true]]);
    let callbackThis = null;
    map.forEach(() => {
        callbackThis = undefined;
    });
    return { callbackThis }
}

export function MapforeachTest018(){
    const key1 = Symbol('key1');
    const key2 = Symbol('key2');
    const map = new Map([[key1, 1], [key2, 2]]);
    const keys = [];
    map.forEach((_, key) => {
        keys.push(key);
    });
    return { keys, key1, key2 }
}

export function MapforeachTest022(){
    const map = new Map([[1, 5]]);
    const thisArg = 'context';
    let callbackThis = null;
    map.forEach(() => {
        callbackThis = thisArg;
    }, thisArg);
    return { callbackThis, thisArg }
}

export function MapforeachTest023(){
    const map = new Map([[1, 5]]);
    const thisArg = 123;
    let callbackThis = null;
    map.forEach(() => {
        callbackThis = thisArg;
    }, thisArg);
    return { callbackThis, thisArg }
}

export function MapforeachTest025(){
    const map = new Map([[1, 5]]);
    const thisArg = null;
    let callbackThis = null;
    map.forEach(() => {
        callbackThis = thisArg;
    }, thisArg);
    let map1 = typeof callbackThis;
    return { map1, callbackThis }
}

export function MapforeachTest026(){
    const map = new Map([[1, 5]]);
    const thisArg = undefined;
    let callbackThis = null;
    map.forEach(() => {
        callbackThis = thisArg;
    }, thisArg);
    return { callbackThis }
}

export function MapforeachTest040(){
    const map = new Map([[1, 'a'], [2, 'b']]);
    const gen = function*() {};
    let count = 0;
    map.forEach(() => {
        count++;
        gen().next();
    });
    return { count }
}

export function MapforeachTest043(){
    const arr = [['x', 'foo'], ['y', 'bar']];
    const map = new Map(arr);
    const result = [];
    map.forEach((value) => {
        result.push(value);
    });
    return { result }
}

export function MapforeachTest045(){
    const map = new Map([['key', 'val']]);
    let logCalled = false;
    const tempLog = () => { logCalled = true; };

    let threwError = false;
    try {
        map.forEach((v, k) => tempLog());
    } catch (e) {
        threwError = true;
    }

    return { threwError }
}

export function MapforeachTest052(){
    const map = new Map([[1, 5]]);
    const context = { value: 10 };
    let nestedResult;
    map.forEach(() => {
        const nested = () => {
            return context.value;
        };
        nestedResult = nested();
    }, context);
    let map1 = nestedResult;
    return { map1 }
}

export function MapforeachTest057(){
    const sym1 = Symbol('val1');
    const sym2 = Symbol('val2');
    const map = new Map([[1, sym1], [2, sym2]]);
    const values = [];
    map.forEach((value) => {
        values.push(value);
    });
    return { values, sym2, sym1 }
}

export function MapforeachTest058(){
    const map = new Map([['a', 1], ['b', 'str'], ['c', true], ['d', {}]]);
    const types = [];
    map.forEach((value) => {
        types.push(typeof value);
    });
    return { types }
}

export function MapforeachTest059(){
    const obj = {};
    obj.self = obj;
    const map = new Map([['circular', obj]]);
    let value = null;
    map.forEach((v) => {
        value = v;
    });
    let value1 = value?.self;
    return { value, obj, value1 }
}

export function MapforeachTest064(){
    const map = new Map([[1, 10], [2, 20]]);
    const thisArg = { sum: 0 };
    map.forEach((value) => {
        thisArg.sum += value;
    }, thisArg);
    return { thisArg }
}

export function MapforeachTest067(){
    const map = new Map([['a', { prop: 10 }], ['b', {}]]);
    const results = [];
    map.forEach((value) => {
        results.push(value.prop ?? 0);
    });
    return { results }
}

export function MapforeachTest069(){
    const key1 = 10n;
    const key2 = 20n;
    const map = new Map([[key1, 'big1'], [key2, 'big2']]);
    const keys = [];
    map.forEach((_, key) => {
        keys.push(key);
    });
    let map1 = keys == [key1,key2];
    return { map1 }
}

export function MapforeachTest073(){
    const map = new Map([[1, { x: 10, y: 20 }], [2, { x: 30, y: 40 }]]);
    const xs = [];
    map.forEach((value) => {
        xs.push(value.x);
    });
    return { xs }
}

export function MapforeachTest077(){
    const obj = {};
    obj.self = obj;
    const map = new Map([['circular', obj]]);
    let value = null;
    map.forEach((v) => {
        value = v;
    });
    let value1 = value?.self;
    return { value, obj, value1 }
}

export function MapforeachTest78(){
    const map = new Map([[1, 10], [2, 20]]);
    const mappedEntries = Array.from(map.entries()).map((entry) => [entry[0], entry[1] * 2]);
    const mappedMap = new Map(mappedEntries);
    const results = [];
    mappedMap.forEach((value) => {
        results.push(value);
    });
    return { results }
}

export function MapforeachTest79(){
    const map = new Map([[1, 10], [2, 20], [3, 30]]);
    const sum = Array.from(map.entries()).reduce((acc, entry) => acc + entry[1], 0);
    let forEachSum = 0;
    map.forEach((v) => {
        forEachSum += v;
    });
    return { forEachSum, sum }
}

export function MapforeachTest91(){
    const wm1 = new WeakMap();
    const wm2 = new WeakMap();
    const obj1 = {};
    const obj2 = {};
    wm1.set(obj1, 10);
    wm2.set(obj2, 'test');

    const map = new Map([[1, wm1], [2, wm2]]);
    const results = [];
    map.forEach((value) => {
        results.push(value);
    });
    let map1 = results[0].get(obj1);
    let map2 = results[1].get(obj2);
    return { results, map1, map2, wm1, wm2 }
}

export function MapforeachTest106(){
    const map = new Map([[1, 10], [2, 20]]);
    const context = { multiplier: 3, results: []  };

    function callback(value) {
        context.results.push(value * context.multiplier);
    }
    map.forEach(callback);
    let map1 = context.results;
    return { map1 }
}

export function MapforeachTest101(){
    const key1 = { id: 1 };
    const key2 = { id: 2 };
    const value1 = { data: 'value1' };
    const value2 = { data: 'value2' };
    const map = new Map([[key1, value1], [key2, value2]]);
    const results = [];
    map.forEach((value, key) => {
        results.push([key, value]);
    });
    let map1 = [[key1, value1], [key2, value2]] === results;
    return { map1 }
}

export function MapforeachTest107(){
    const map = new Map([[1, 5], [2, 10]]);
    const results = [];

    function* generateValues(value) {
        yield value;
        yield value * 2;
    }
    map.forEach((value) => {
        for (const val of generateValues(value)) {
            results.push(val);
        }
    });
    return { results }
}

export function MapforeachTest110(){
    const obj1 = Object.freeze({ prop: 'frozen1' });
    const obj2 = Object.freeze({ prop: 'frozen2' });
    const map = new Map([[1, obj1], [2, obj2]]);
    const results = [];
    map.forEach((value) => {
        results.push(value);
    });
    const map1 = results[0].prop;
    const map2 = results[1].prop;
    return { results, obj1, obj2, map1, map2 }
}
