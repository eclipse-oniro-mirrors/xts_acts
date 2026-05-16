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
export function MapValuesTest012(){
    const symKey = Symbol('test');
    const map = new Map([[symKey, 'symbol value']]);
    const values = Array.from(map.values());
    return { values }
}

export function MapValuesTest046(){
    // 显式指定生成器返回类型为 Generator<number, void, unknown>
    function* generator() {
        yield 1;
        yield 2;
    }
    const map = new Map([[1, generator]]);
    const values = Array.from(map.values());
    const gen = values[0]();
    return { gen };
}

export function MapValuesTest049(){
    const frozen = Object.freeze({ a: 1 });
    const map = new Map([[1, frozen]]);
    const values = Array.from(map.values());
    return { values,frozen }
}

export function MapValuesTest050(){
    const sealed = { a: 1 };
    Object.seal(sealed);
    const map = new Map([[1, sealed]]);
    const values = Array.from(map.values());
    return { values,sealed }
}

export function MapValuesTest051(){
    const map = new Map([[1, {}]]);
    const values = Array.from(map.values());
    const values1 = {};
    return { values,values1 }
}

export function MapValuesTest054(){
    const map = new Map([
        [1, 'string'],
        [2, 42],
        [3, true],
        [4, null],
        [5, undefined]
    ]);
    const values = Array.from(map.values());
    return { values }
}

export function MapValuesTest057(){
    const map = new Map([[1, 'a'], [2, 'b']]);
    const iterator = map.values();
    const iterator1 = iterator[Symbol.iterator];
    const iter = iterator[Symbol.iterator]();
    return { iterator1, iter}
}

export function MapValuesTest058(){
    const map = new Map();
    const iterator = map.values();
    const interator1 = Object.prototype.toString.call(iterator);
    const interator2 = iterator[Symbol.toStringTag];
    return { interator1, interator2}
}

export function MapValuesTest059(){
    const sym = Symbol('value');
    const map = new Map([[1, sym]]);
    const values = Array.from(map.values());
    const values1 = Symbol.keyFor(values[0]) === "value";
    const values2 = values[0] === sym;
    return { values, values1,values2}
}

export function MapValuesTest060(){
    const sym = Symbol.for('global');
    const map = new Map([[1, sym]]);
    const values = Array.from(map.values());
    const values1 = values[0] === sym;
    return { values1}
}

export function MapValuesTest063(){
    const map = new Map([[1, 'a'], [2, 'b']]);
    const iterator = map.values();
    const result = iterator.return?.({ value: 'done', done: true });
    const result1 = iterator.next().value;
    const result2 = iterator.next().done;
    const result3 = result === { value: 'done', done: true };

    return { iterator,result1,result2,result3}
}

export function MapValuesTest069(){
    const map = new Map([
        [{ id: 1 }, 'first'],
        [{ id: 1 }, 'second']
    ]);
    const values = Array.from(map.values());
    return { values}
}

export function MapValuesTest071(){
    const entries = [['a', 1], ['b', 2], ['c', 3]];
    const map = new Map(entries);
    const values = Array.from(map.values());
    return { values}
}

export function MapValuesTest075(){
    const map = new Map();
    Object.prototype.testProp = 'inherited';
    const values = Array.from(map.values());
    const values1 = delete Object.prototype.testProp;
    return { values,values1}
}

export function MapValuesTest076(){
    const map = new Map([[1, 'a'], [2, 'b']]);
    Object.freeze(map); // 冻结Map实例
    const values = Array.from(map.values());
    return { values}
}

export function MapValuesTest077(){
    const map = new Map([[1, 'a'], [2, 'b']]);
    Object.seal(map); // 密封Map实例
    const values = Array.from(map.values());
    return { values}
}

export function MapValuesTest078(){
    const originalValues = Map.prototype.values;
    Map.prototype.values = function() {
        return [ 'modified' ][Symbol.iterator]();
    };
    const map = new Map([[1, 'a']]);
    const values = Array.from(map.values());
    Map.prototype.values = originalValues;
    return { values}
}

export function MapValuesTest079(){
    class MyMap extends Map {
    }
    const map = new MyMap([[1, 'a'], [2, 'b']]);
    const values = Array.from(map.values());
    return {values}
}

export function MapValuesTest088(){
    const map = new Map();
    map.set(1, map); // Map包含自身作为值
    const values = Array.from(map.values());
    return {values,map}
}

export function MapValuesTest090(){
    const map1 = new Map();
    const map2 = new Map();

    map1.set(1, map2);
    map2.set(2, map1);

    const values1 = Array.from(map1.values());
    const values2 = Array.from(map2.values());
    return {values1,values2,map1,map2}
}

export function MapValuesTest092(){
    const map = new Map([[1, { a: 1 }], [2, { b: 2 }]]);
    const values = Array.from(map.values());
    const json = JSON.stringify(values);
    return {json}
}

export function MapValuesTest096() {
    class CustomMap extends Map {
        customMethod() {
            return 'test';
        }
    }
    const map = new CustomMap([[1, 'a']]);
    const values = Array.from(map.values());
    return { values };
}

export function MapValuesTest097(){
    const map = new Map([[1, 'a']]);
    Object.defineProperty(map, 'customProp', {
        value: 'test',
        enumerable: false
    });
    const values = Array.from(map.values());
    const values1 = map.customProp;
    return {values,values1}
}

export function MapValuesTest103(){
    const map = new Map([
        [1, 'number'],
        ['key', 'string'],
        [true, 'boolean'],
        [{}, 'object'],
        [Symbol(), 'symbol']
    ]);
    const values = Array.from(map.values());
    return {values}
}

export function MapValuesTest104(){
    const map = new Map([
        [1, new Set([1, 2, 3])],
        [2, new Map([['a', 1]])],
        [3, new Promise(resolve => resolve('test'))]
    ]);
    const values = Array.from(map.values());
    return {values}
}

export function MapValuesTest107(){
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get: (obj, prop) => obj[prop] * 2
    });
    const map = new Map([[1, proxy]]);
    const values = Array.from(map.values());
    return {values}
}

export function MapValuesTest109(){
    const sym1 = Symbol('val1');
    const sym2 = Symbol('val2');
    const map = new Map([[1, sym1], [2, sym2]]);
    const values = Array.from(map.values());
    const values1 = Symbol.keyFor(values[0]) === 'val1';
    const values2 = values[0] === sym1
    const values3 = values[1] === sym2
    return {values1,values2,values3}
}

export function MapValuesTest110(){
    const complexMap = new Map([
        [1, 'string'],
        [2, 123],
        [3, true],
        [4, null],
        [5, undefined],
        [6, { obj: 'value' }],
        [7, [1, 2, 3]],
        [8, () => 'function'],
        [9, Symbol('symbol')],
        [10, 42n],
        [11, new Date(2023, 0, 1)],
        [12, /regex/],
        [13, NaN],
        [14, Infinity]
    ]);

    const values = Array.from(complexMap.values());
    return {values}
}