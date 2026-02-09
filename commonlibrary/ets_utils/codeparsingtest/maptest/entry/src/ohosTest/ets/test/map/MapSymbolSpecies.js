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



export function MapSymbolSpecies(){
    return Map[Symbol.species];
}

export function MapSymbolSpeciesTest002(){
    const descriptor = Object.getOwnPropertyDescriptor(Map, Symbol.species);
    return descriptor;
}
export function MapSymbolSpeciesTest004(){
    const Species = Map[Symbol.species];
    const iterable = [[1, 'one'], [2, 'two']];
    const map = new Species(iterable);
    return map;
}

export function MapSpecies(par){
    return  new Species(par);
}

export function SymbolSpecies(){
    return  Symbol.species;
}

export function MapSymbolSpeciesTest007(){
    class CustomMap extends Map {}

    class MyMap extends Map {
        static get [Symbol.species]() {
            return CustomMap;
        }
    }
    return [MyMap[Symbol.species],CustomMap];
}

export function MapSymbolSpeciesTest009(){
    return Object.getOwnPropertyDescriptor(Map, Symbol.species);
}

export function MapSymbolSpeciesTest010(){
    const descriptors = Object.getOwnPropertyDescriptors(Map);
    const keys = Object.keys(descriptors);
    const symbolKeys = Object.getOwnPropertySymbols(Map);

    return [keys.includes(Symbol.species.toString()),symbolKeys.includes(Symbol.species)]
}

export function MapSymbolSpeciesTest011(){
    return Object.getOwnPropertyDescriptor(Map, Symbol.species);
}

export function MapSymbolSpeciesTest012() {
    class MyMap extends Map {
        static get [Symbol.species]() {
            return Map;
        }
    }

    const myMap = new MyMap([[1, 'a'], [2, 'b']]);
    const newMap = new (MyMap[Symbol.species])([...myMap]);
    return {MyMap,Map,newMap}
}

export function MapSymbolSpeciesTest013() {
    class MyMap extends Map {
        static get [Symbol.species]() {
            return Map;
        }
    }

    const original = new Map([[1, 'a']]);
    const fromMap = MyMap.from(original);
    return {fromMap,MyMap,Map}
}

export function MapSymbolSpeciesTest014() {
    const emptyMap = new Map();
    const Species = Map[Symbol.species];
    const newMap = new Species(emptyMap);

    return {newMap,Map}
}

export function MapSymbolSpeciesTest015() {
    const Species = Map[Symbol.species];
    const array = [[1, 'one'], [2, 'two']];
    const map = new Species(array);

    return map
}


export function MapSymbolSpeciesTest016() {
    const Species = Map[Symbol.species];
    const invalidIterable = { [Symbol.iterator]: () => ({ next: () => ({ value: 'invalid', done: false }) }) };

    let errorThrown = false;
    try {
        new Species(invalidIterable);
    } catch (e) {
        errorThrown = true;
    }


    return errorThrown;
}

export function MapSymbolSpeciesTest018() {
    class BadMap extends Map {
        static get [Symbol.species]() {
            return 'not a constructor';
        }

        clone() {
            return new (this.constructor[Symbol.species])(this);
        }
    }

    const badMap = new BadMap();
    let errorThrown = false;

    try {
        badMap.clone();
    } catch (e) {
        errorThrown = true;
    }


    return errorThrown;
}

export function MapSymbolSpeciesTest020() {
    const original = new Map([[1, 'a'], [2, 'b']]);
    const keys = Array.from(original.keys()).map(k => [k, k * 2]);
    const Species = Map[Symbol.species];
    const newMap = new Species(keys);
    return newMap;
}


export function MapSymbolSpeciesTest022() {
    const Species = Map[Symbol.species];
    const map = new Species();
    Object.setPrototypeOf(map, null);
    map.set('a', 1);
    return [map instanceof Map,Array.from(map.entries())]
}

export function MapGet(abc){
    return abc;
}

export function MapSymbolSpeciesTest024() {
    const key1 = { id: 1 };
    const key2 = { id: 2 };
    const original = new Map([[key1, 'a'], [key2, 'b']]);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);
    return [newMap.get(key1),newMap.get(key2)]
}

export function MapSymbolSpeciesTest025() {
    const original = new Map([[3, 'c'], [1, 'a'], [2, 'b']]);
    const Species = Map[Symbol.species];
    const newMap = new Species(original);

    const originalKeys = Array.from(original.keys());
    const newMapKeys = Array.from(newMap.keys());
    return [newMapKeys,originalKeys]
}

export function MapSymbolSpeciesTest026() {
    const sym1 = Symbol('key1');
    const sym2 = Symbol('key2');
    const original = new Map([[sym1, 'value1'], [sym2, 'value2']]);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);

    return [newMap.get(sym1) === 'value1',newMap.get(sym2) === 'value2'];
}

export function MapSymbolSpeciesTest027() {
    class MyMap extends Map {
        static get [Symbol.species]() {
            return function(this1, iterable) {
                return new Map(iterable);
            };
        }

        clone() {
            return new (this.constructor[Symbol.species] )(this);
        }
    }

    const myMap = new MyMap([[1, 'a']]);
    const cloned = myMap.clone();

    return [cloned instanceof Map,cloned instanceof MyMap];
}

export function MapSymbolSpeciesTest028() {
    class ParentMap extends Map {
        static get [Symbol.species]() {
            return ParentMap;
        }
    }

    class ChildMap extends ParentMap {}

    return ChildMap[Symbol.species] === ParentMap;
}

export function MapSymbolSpeciesTest029() {
    class ParentMap extends Map {
        static get [Symbol.species]() {
            return ParentMap;
        }
    }

    class ChildMap extends ParentMap {
        static get [Symbol.species]() {
            return ChildMap;
        }
    }
    return ChildMap[Symbol.species] === ChildMap;
}

export function MapSymbolSpeciesTest030() {
    const Species = Map[Symbol.species];
    const asyncIterable =
        {
            [Symbol.asyncIterator]: async function* () {
                yield [1, 'one'];
                yield [2, 'two'];
            }
        };

    let errorThrown = false;
    try {
        new Species(asyncIterable);
    } catch (e) {
        errorThrown = true;
    }
    return errorThrown
}

export function MapSymbolSpeciesTest031() {
    const Species = Map[Symbol.species];
    const nonIterable = { key: 'value' };

    let errorThrown = false;
    try {
        new Species(nonIterable );
    } catch (e) {
        errorThrown = true;
    }
    return errorThrown
}

export function MapSymbolSpeciesTest032() {
    const mapLike = {
        [Symbol.iterator]: function* () {
            yield [1, 'a'];
            yield [2, 'b'];
        },
        size: 2
    };

    const Species = Map[Symbol.species];
    const newMap = new Species(mapLike);
    return newMap

}

export function MapSymbolSpeciesTest034() {
    const emptyIterable = [];
    const Species = Map[Symbol.species];
    const newMap = new Species(emptyIterable);
    return newMap
}
export function MapSymbolSpeciesTest035() {
    class ConcatMap extends Map {
        static get [Symbol.species]() {
            return Map;
        }

        concat(other) {
        const entries = [...this.entries(), ...other.entries()];
        return new (this.constructor[Symbol.species])(entries);
    }
    }

    const map1 = new ConcatMap([[1, 'a']]);
    const map2 = new Map([[2, 'b']]);
    const result = map1.concat(map2);
    return [result,ConcatMap]
}

export function MapSymbolSpeciesTest036(){
    class ArrayBackedMap extends Map {
        static get [Symbol.species]() {
            return class ArrayMap {
                entries = [];

                constructor(iterable) {
                this.entries = Array.from(iterable);
            }

            get size() {
                return this.entries.length;
            }
        };
    }

    toArrayMap() {
        return new (this.constructor[Symbol.species])(this);
    }
    }

    const myMap = new ArrayBackedMap([[1, 'a'], [2, 'b']]);
    const arrayMap = myMap.toArrayMap();
    return [arrayMap instanceof ArrayBackedMap,arrayMap.size,arrayMap.entries]
}

export function MapSymbolSpeciesTest037(){
    const original = new Map([[1, 'a']]);
    Object.freeze(original);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);
    return newMap;
}

export function MapSymbolSpeciesTest038(){
    const original = new Map([[1, 'a']]);
    Object.seal(original);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);
    return newMap;
}
export function MapSymbolSpeciesTest039(){
    const Species = Map[Symbol.species];
    const newMap = new Species(undefined);
    return newMap
}

export function MapSymbolSpeciesTest040(){
    const Species = Map[Symbol.species];
    const newMap = new Species(null);
    return newMap
}

export function MapSymbolSpeciesTest041(){
    class JsonMap extends Map {
        static get [Symbol.species]() {
            return Map;
        }

        toJSON() {
            return Object.fromEntries(this);
        }

        fromJSON(json) {
        return new (this.constructor[Symbol.species])(Object.entries(json));
    }
    }

    const jsonMap = new JsonMap([[1, 'a'], [2, 'b']]);
    const json = jsonMap.toJSON();
    const newMap = jsonMap.fromJSON(json);
    return [newMap instanceof Map,newMap instanceof JsonMap]
}

export function MapSymbolSpeciesTest045(){
    const keyObj = { id: 1 };
    const keySym = Symbol('test');
    const original = new Map([
        [1, 'number'],
        ['string', 2],
        [true, 'boolean'],
        [keyObj, 'object'],
        [keySym, 'symbol']
    ]);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);

    return [newMap.get(1),newMap.get('string'),newMap.get(true),newMap.get(keyObj),newMap.get(keySym)]
}

export function MapSymbolSpeciesTest050(){
    const obj1 = { a: 1 };
    const obj2 = { b: 2 };
    const original = new Map([[1, obj1], [2, obj2]]);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);

    return [newMap.get(1) === obj1,newMap.get(2).b]
}

export function MapSymbolSpeciesTest051(){
    let speciesFound = false;

    for (const prop in Map) {
        if (prop === Symbol.species.toString()) {
            speciesFound = true;
        }
    }
    return speciesFound;
}

export function MapSymbolSpeciesTest052(){
    const symbols = Object.getOwnPropertySymbols(Map);
    const hasSpecies = symbols.includes(Symbol.species);
    return hasSpecies;
}

export function MapSymbolSpeciesTest053(){
    const descriptor = Object.getOwnPropertyDescriptor(Map, Symbol.species);

    return descriptor

}

export function MapSymbolSpeciesTest055(){
    const originalSpecies = Map[Symbol.species];

    return Map[Symbol.species] === originalSpecies;
}

export function MapSymbolSpeciesTest056(){
    class MyMap extends Map {
        isMyMap = true;
    }

    const myMap = new MyMap([[1, 'a']]);
    const Species = MyMap[Symbol.species];
    const newMap = new Species(myMap);
    return [newMap instanceof Map,newMap instanceof MyMap,newMap.isMyMap]
}

export function MapSymbolSpeciesTest057(){
    class BaseMap extends Map {}
    class SubMap extends BaseMap {}

    class TestMap extends BaseMap {
        static get [Symbol.species]() {
            return SubMap;
        }

        clone() {
            return new (this.constructor[Symbol.species])(this);
        }
    }

    const testMap = new TestMap([[1, 'a']]);
    const cloned = testMap.clone();
    return [cloned instanceof SubMap,cloned instanceof TestMap,cloned.get(1)]
}

export function MapSymbolSpeciesTest058(){
    class Level1 extends Map {
        static get [Symbol.species]() {
            return Level1;
        }
    }

    class Level2 extends Level1 {}

    class Level3 extends Level2 {
        static get [Symbol.species]() {
            return Level3;
        }
    }

    class Level4 extends Level3 {}

    return [Level1[Symbol.species] === Level1,Level2[Symbol.species]=== Level1,Level3[Symbol.species]=== Level3,Level4[Symbol.species]=== Level4]
}

export function MapSymbolSpeciesTest059(){
    const Species = Map[Symbol.species];
    const map1 = new Species([[1, 'a']]);
    const map2 = new (Species)([[2, 'b']]);
}

export function MapSymbolSpeciesTest060(){
    const Species = Map[Symbol.species];
    let errorThrown = false;

    try {
        Species([[1, 'a']]);
    } catch (e) {
        errorThrown = true;
    }
    return errorThrown;
}

export function MapSymbolSpeciesTest061(){
    class ValueMap extends Map {
        static get [Symbol.species]() {
            return Map;
        }

        getValuesAsMap() {
            const entries = Array.from(this.values()).map((v, i) => [i, v]);
            return new (this.constructor[Symbol.species])(entries);
        }
    }

    const valueMap = new ValueMap([['a', 1], ['b', 2]]);
    const valuesMap = valueMap.getValuesAsMap();
    return valuesMap;
}

export function MapSymbolSpeciesTest065(){
    const obj = { value: 'test' };
    const original = new Map([[1, obj]]);
    const Species = Map[Symbol.species];
    const newMap = new Species(original);

    obj.value = 'modified';
    return newMap
}

export function MapSymbolSpeciesTest066(){
    const key1 = { id: 1 };
    const key2 = { id: 2 };
    const original = new Map([[key1, 'a'], [key2, 'b']]);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);

    // Change the original keys
    (key1).id = 100;
    (key2).id = 200;
    return [newMap.get(key1) === 'a',newMap.get(key2) === 'b',key1.id === 100];
}

export function MapSymbolSpeciesTest067(){
    class Level1Map extends Map {
        static get [Symbol.species]() {
            return Level1Map;
        }
    }

    class Level2Map extends Level1Map {
        static get [Symbol.species]() {
            return Level2Map;
        }

        createNested() {
            return new (this.constructor[Symbol.species])([[1, 'a']]);
        }
    }

    const level2 = new Level2Map();
    const nested = level2.createNested();
    return [nested instanceof Level2Map,nested instanceof Level1Map,nested instanceof Map]
}

export function MapSymbolSpeciesTest069(){
    class ThisMap extends Map {
        static get [Symbol.species]() {
            return this;
        }

        clone() {
            return new (this.constructor[Symbol.species])(this);
        }
    }

    const thisMap = new ThisMap([[1, 'a']]);
    const clone = thisMap.clone();
    return [clone instanceof ThisMap,clone.get(1)]
}

export function MapSymbolSpeciesTest070(){
    let callCount = 0;

    class CountMap extends Map {
        static get [Symbol.species]() {
            callCount++;
            return Map;
        }

        clone() {
            return new (this.constructor[Symbol.species])(this);
        }
    }

    const countMap = new CountMap([[1, 'a']]);
    return callCount;
}

export function MapSymbolSpeciesTest073(){
    const recursiveMap = new Map();
    recursiveMap.set('self', recursiveMap);
    recursiveMap.set('value', 42);

    const Species = Map[Symbol.species];
    const newMap = new Species(recursiveMap);
    return newMap
}

export function MapSymbolSpeciesTest074(){
    const entryLike1 = { 0: 1, 1: 'a', length: 2 };
    const entryLike2 = { 0: 2, 1: 'b', length: 2 };
    const iterable = [entryLike1, entryLike2];

    const Species = Map[Symbol.species];
    const newMap = new Species(iterable);
    return newMap;
}

export function MapSymbolSpeciesTest075(){
    const invalidEntries = [[1], [2, 'b', 'extra'], []];
    const Species = Map[Symbol.species];
    const newMap = new Species(invalidEntries);
    return newMap
}

export function MapSymbolSpeciesTest081(){
    const promise1 = Promise.resolve('resolved');
    const promise2 = new Promise(() => {});
    const original = new Map([[1, promise1], [2, promise2]]);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);
    return [newMap.get(1) === promise1 ,newMap.get(1) === promise2];
}

export function MapSymbolSpeciesTest082(){
    function* generator1() {
        yield 1;
        yield 2;
    }

    function* generator2() {
        yield 'a';
        yield 'b';
    }

    const original = new Map([[1, generator1], [2, generator2]]);
    const Species = Map[Symbol.species];
    const newMap = new Species(original);
    return [Array.from(newMap.get(1)()),Array.from(newMap.get(2)())]
}

export function MapSymbolSpeciesTest085(){
    // Simulating different global contexts
    class FrameMap extends Map {
        static get [Symbol.species]() {
            return FrameMap;
        }
    }

    const frameMap = new FrameMap([[1, 'iframe value']]);
    const Species = FrameMap[Symbol.species];
    const newMap = new Species(frameMap);
    return [newMap instanceof FrameMap,newMap.get(1)]
}

export function MapSymbolSpeciesTest086(){
    const original = new Map([[1, 'a'], [2, 'b']]);
    const proxyMap = new Proxy(original, {
        get(target, prop) {
            return target[prop];
        }
    });

    const Species = Map[Symbol.species];
    const newMap = new Species(proxyMap);
    return newMap
}

export function MapSymbolSpeciesTest089(){
    const customPrototype = Object.create(Map.prototype);
    customPrototype.customMethod = function() {
        return this.size;
    };

    const original = new Map([[1, 'a']]);
    Object.setPrototypeOf(original, customPrototype);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);
    return newMap;
}

export function MapSymbolSpeciesTest090(){
    const mapInstance = new Map([[1, 'a']]);
    const createdMap = Object.create(Map.prototype);
    Map.apply(createdMap, [mapInstance]);

    const Species = Map[Symbol.species];
    const newMap = new Species(createdMap);
    return newMap;
}

export function MapSymbolSpeciesTest091(){
    class IteratorMap extends Map {
        *[Symbol.iterator]() {
            // Yield entries in reverse order
            const entries = Array.from(super[Symbol.iterator]());
            for (let i = entries.length - 1; i >= 0; i--) {
                yield entries[i];
            }
        }
    }

    const iterMap = new IteratorMap([[1, 'a'], [2, 'b'], [3, 'c']]);
    const Species = Map[Symbol.species];
    const newMap = new Species(iterMap);
    return Array.from(newMap.entries());
}

export function MapSymbolSpeciesTest092(){
    class EntryMap extends Map {
        entries() {
            const entries = super.entries();
            return {
                *[Symbol.iterator]() {
                    for (const [k, v] of entries) {
                        yield [k, v.toUpperCase()];
                    }
                }
            };
        }
    }

    const entryMap = new EntryMap([[1, 'a'], [2, 'b']]);
    const Species = Map[Symbol.species];
    const newMap = new Species(entryMap);
    return newMap;
}

export function MapSymbolSpeciesTest093(){
    class AsyncMap extends Map {
        static get [Symbol.species]() {
            return Map;
        }

        async processAsync() {
            const entries = await Promise.all(
                Array.from(this).map(async ([k, v]) => [k, await Promise.resolve(v)])
            );
            return new (this.constructor[Symbol.species])(entries);
        }
    }

    const asyncMap = new AsyncMap([[1, 'a'], [2, 'b']]);
    const processed = asyncMap.processAsync();
    return processed;
}

export function MapSymbolSpeciesTest094(){
    const set = new Set([1, 2, 3]);
    const array = [4, 5, 6];
    const original = new Map([['set', set], ['array', array]]);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);
    return [newMap.get('set')===set , newMap.get('array')===array];
}

export function MapSymbolSpeciesTest098(){
    const original = new Map([[1, 'a'], [2, 'b']]);
    Object.freeze(original);

    const Species = Map[Symbol.species];
    const newMap = new Species(original);
    return newMap;
}

export function MapSymbolSpeciesTest099(){
    const mapModule = (() => {
        class ModuleMap extends Map {
            static get [Symbol.species]() {
                return Map;
            }

            static create(entries) {
            return new ModuleMap(entries);
        }

        duplicate() {
            return new (this.constructor[Symbol.species])(this);
        }
    }

    return { ModuleMap };
    })();

    const moduleMap = mapModule.ModuleMap.create([[1, 'a']]);
    const duplicate = moduleMap.duplicate();
    return [duplicate instanceof Map,duplicate instanceof mapModule.ModuleMap,duplicate.get(1)]
}

export function MapSymbolSpeciesTest100(){
    class MapFactory {
        static createMap(entries) {
        return new Map(entries);
    }
    }

    class FactoryMap extends Map  {
        static get [Symbol.species]() {
            return MapFactory.createMap;
        }

        createDerived() {
            return new (Map[Symbol.species])(this);
        }
    }

    const factoryMap = new FactoryMap ([[1, 'a'], [2, 'b']]);
    const derived = factoryMap.createDerived();
    return [derived instanceof Map,derived instanceof FactoryMap,derived.get(1)]
}