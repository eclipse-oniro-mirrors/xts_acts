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
export function SetSpeciesTest001(){
    return Set[Symbol.species];
}

export function SetSpeciesTest002(){
    const setInstance = new Set();
    return setInstance.constructor[Symbol.species];
}

export function SetSpeciesTest003(){
    class MySet extends Set {}
    return MySet[Symbol.species] === MySet;
}

export function SetSpeciesTest004(mySetInstance){
    return mySetInstance.constructor[Symbol.species];
}

export function SetSpeciesTest005(){
    class MySet extends Set {
        static get [Symbol.species]() {
            return Set;
        }
    }
    return MySet[Symbol.species];
}

export function SetSpeciesTest006(){
    class MySet extends Set {
        static get [Symbol.species]() {
            return Set;
        }
    }
    const mySetInstance = new MySet();
    return mySetInstance.constructor[Symbol.species];
}

export function SetSpeciesTest007(){
    const descriptor = Object.getOwnPropertyDescriptor(Set, Symbol.species);
    return [descriptor.get, descriptor.set, descriptor.static]
}

export function SetSpeciesTest008(){
    const descriptor = Object.getOwnPropertyDescriptor(Set, Symbol.species);
    return descriptor.writable;
}

export function SetSpeciesTest009(){
    const descriptor = Object.getOwnPropertyDescriptor(Set, Symbol.species);
    return descriptor.configurable;
}

export function SetSpeciesTest010(){
    class MySet extends Set {
        static get [Symbol.species]() {
            return this;
        }
    }
    return MySet[Symbol.species] === MySet;
}

export function SetSpeciesTest011(){
    class MySet extends Set {}
    class MySetSub extends MySet {}
    return MySetSub[Symbol.species] === MySetSub;
}

export function SetSpeciesTest012(){
    class MySet extends Set {}
    class MySetSub extends MySet {
        static get [Symbol.species]() {
            return Set;
        }
    }
    return MySetSub[Symbol.species] === Set;
}

export function SetSpeciesTest013(){
    const species1 = Set[Symbol.species];
    const species2 = Set[Symbol.species];
    return [species1 == species2, species1 === Set];
}

export function SetSpeciesTest014(){
    class MySet extends Set {}
    const species1 = MySet[Symbol.species];
    const species2 = MySet[Symbol.species];
    return [species1 == species2, species1 === MySet];
}

export function SetSpeciesTest015(){
    class MySet extends Set {
        static get [Symbol.species]() {
            return Set;
        }
    }
    const species1 = MySet[Symbol.species];
    const species2 = MySet[Symbol.species];
    return [species1 == species2, species1 === Set];
}

export function SetSpeciesTest016(){
    const newSet = Set[Symbol.species];
    const setObj = new newSet([1, 2, 3]);
    return [setObj instanceof Set, [...setObj]];
}

export function SetSpeciesTest017(){
    class MySet extends Set {}
    const newMySet = MySet[Symbol.species];
    const setObj = new newMySet([1, 2, 3]);
    return [setObj instanceof MySet, [...setObj]];
}

export function SetSpeciesTest018(){
    class MySet extends Set {
        static get [Symbol.species]() {
            return Set;
        }
    }
    const newSet = MySet[Symbol.species];
    const setObj = new newSet([1, 2, 3]);
    return [setObj instanceof Set, setObj instanceof MySet]
}

export function SetSpeciesTest019(){
    const species = Reflect.get(Set, Symbol.species);
    return species === Set;
}

export function SetSpeciesTest020(){
    class MySet extends Set {}
    const species = Reflect.get(MySet, Symbol.species);
    return species === MySet;
}

export function SetSpeciesTest021(){
    Set[Symbol.species] = Array;
}

export function SetSpeciesTest022(){
    delete Set[Symbol.species];
    return Set.hasOwnProperty(Symbol.species);
}

export function SetSpeciesTest023(){
    delete Set[Symbol.species];
    Object.defineProperty(Set, Symbol.species, {
        get() { return Set; },
        static: true,
        configurable: true
    });
    return Set[Symbol.species] === Set;
}

export function SetSpeciesTest024(){
    class MySet extends Set {
        static get [Symbol.species]() {
            return MySet;
        }
    }
    const mySetInstance = new MySet([1, 2, 3]);
    const SpeciesConstructor = mySetInstance.constructor[Symbol.species];
    const newMySet = new SpeciesConstructor(mySetInstance);
    return newMySet instanceof MySet;
}

export function SetSpeciesTest025(){
    class MySet extends Set {
        static get [Symbol.species]() {
            return Set;
        }
    }
    const mySetInstance = new MySet([1, 2, 3]);
    const SpeciesConstructor = mySetInstance.constructor[Symbol.species];
    const newSet = new SpeciesConstructor(mySetInstance);
    return [newSet instanceof Set, newSet instanceof MySet];
}

export function SetSpeciesTest026(){
    const originalSet = new Set([1, 2, 3, 4]);
    const SpeciesConstructor = Set[Symbol.species];
    const newSet = new SpeciesConstructor(originalSet);
    return [originalSet, newSet];
}

export function SetSpeciesTest027(){
    const emptySet = new Set();
    const SpeciesConstructor = Set[Symbol.species];
    const newEmptySet = new SpeciesConstructor(emptySet);
    return [newEmptySet.size, newEmptySet instanceof Set];
}

export function SetSpeciesTest028(){
    const obj1 = { id: 1 };
    const obj2 = { id: 2 };
    const originalSet = new Set([obj1, obj2]);

    const SpeciesConstructor = Set[Symbol.species];
    const newSet = new SpeciesConstructor(originalSet);
    return [newSet.has(obj1), newSet.has(obj2), newSet.has({ id: 1 })];
}

export function SetSpeciesTest029(){
    class MySet1 extends Set {
        static get [Symbol.species]() {
            return MySet1;
        }
        get first() {
            return this.values().next().value;
        }
    }

    const originalSet = new MySet1([1, 2, 3]);
    const SpeciesConstructor = MySet1[Symbol.species];
    const newSet = new SpeciesConstructor(originalSet);
    return [newSet.first, newSet instanceof MySet1];
}

export function SetSpeciesTest030(){
    class FilteredSet extends Set {
        static get [Symbol.species]() {
            return Set;
        }

        filter(callback) {
            const result = new this.constructor[Symbol.species]();
            for (const value of this) {
                if (callback(value)) {
                    result.add(value);
                }
            }
            return result;
        }
    }

    const filteredSet = new FilteredSet([1, 2, 3, 4, 5]);
    const result = filteredSet.filter(x => x > 3);

    return [result instanceof Set, result instanceof FilteredSet, [...result]];
}

export function SetSpeciesTest032(){
    const original = new Set([true, false, true]);
    const species = Set[Symbol.species];
    const copy = new species(original);

    return [...copy];
}

export function SetSpeciesTest033(){
    const original = new Set(['a', 'b', 'a', 'c']);
    const species = Set[Symbol.species];
    const copy = new species(original);

    return [...copy];
}

export function SetSpeciesTest034(){
    const original = new Set([null, null, 1, null]);
    const species = Set[Symbol.species];
    const copy = new species(original);

    return [...copy];
}

export function SetSpeciesTest035(){
    const original = new Set([undefined, 1, undefined]);
    const species = Set[Symbol.species];
    const copy = new species(original);

    return [...copy];
}

export function SetSpeciesTest036(){
    const original = new Set([NaN, NaN, 1, NaN]);
    const species = Set[Symbol.species];
    return new species(original);
}

export function SetSpeciesTest037(){
    const original = new Set([1, '1', true, 1, false]);
    const species = Set[Symbol.species];
    const copy = new species(original);

    return [...copy];
}

export function SetSpeciesTest038(date1, date2){
    const original = new Set([date1, date2]);
    const species = Set[Symbol.species];
    return new species(original);
}

export function SetSpeciesTest039(regex1, regex2){
    const original = new Set([regex1, regex2]);
    const species = Set[Symbol.species];
    return new species(original);
}

export function SetSpeciesTest040(func1, func2){
    const original = new Set([func1, func2, func1]);
    const species = Set[Symbol.species];
    return new species(original);
}

export function SetSpeciesTest041(){
    class MappedSet extends Set {
        static get [Symbol.species]() {
            return Set;
        }

        map(callback) {
            const result = new this.constructor[Symbol.species]();
            for (const value of this) {
                result.add(callback(value));
            }
            return result;
        }
    }

    const mappedSet = new MappedSet([1, 2, 3]);
    const result = mappedSet.map(x => x * 2);

    return [result instanceof Set, result instanceof MappedSet, [...result]];
}

export function SetSpeciesTest042(){
    class FilterSet extends Set {
        static get [Symbol.species]() {
            return FilterSet;
        }

        filter(callback) {
            return new this.constructor[Symbol.species]([...this].filter(callback));
        }
    }

    const filterSet = new FilterSet([1, 2, 3, 4, 5]);
    const result = filterSet.filter(x => x > 2).filter(x => x < 5);

    return [result instanceof FilterSet, [...result]];
}

export function SetSpeciesTest043(){
    class UnionSet extends Set {
        static get [Symbol.species]() {
            return Set;
        }

        union(otherSet) {
            const result = new this.constructor[Symbol.species](this);
            for (const value of otherSet) {
                result.add(value);
            }
            return result;
        }
    }

    const setA = new UnionSet([1, 2, 3]);
    const setB = new UnionSet([3, 4, 5]);
    const result = setA.union(setB);

    return [result instanceof Set, [...result]];
}

export function SetSpeciesTest044(){
    class IntersectionSet extends Set {
        static get [Symbol.species]() {
            return IntersectionSet;
        }

        intersection(otherSet) {
            const result = new this.constructor[Symbol.species]();
            for (const value of this) {
                if (otherSet.has(value)) {
                    result.add(value);
                }
            }
            return result;
        }
    }

    const setA = new IntersectionSet([1, 2, 3, 4]);
    const setB = new IntersectionSet([3, 4, 5, 6]);
    const result = setA.intersection(setB);

    return [result instanceof IntersectionSet, [...result]];
}

export function SetSpeciesTest045(){
    class ParentSet extends Set {}
    class ChildSet extends ParentSet {
        static get [Symbol.species]() {
            return ParentSet;
        }

        get first() {
            return this.values().next().value;
        }
    }

    const childSet = new ChildSet([1, 2, 3]);
    const species = childSet.constructor[Symbol.species];
    const newSet = new species(childSet);

    return [newSet instanceof ParentSet, newSet instanceof ChildSet];
}

export function SetSpeciesTest046(){
    const largeSet = new Set();
    for (let i = 0; i < 1000; i++) {
        largeSet.add(i);
    }

    const species = Set[Symbol.species];
    return new species(largeSet);
}

export function SetSpeciesTest047(){
    const obj = { prop: 'value' };
    const original = new Set([obj]);
    const species = Set[Symbol.species];
    const copy = new species(original);

    const copiedObj = [...copy][0];
    copiedObj.prop = 'modified';
    return obj.prop;
}

export function SetSpeciesTest048(){
    const frozen = Object.freeze({ a: 1 });
    const original = new Set([frozen]);
    const species = Set[Symbol.species];
    const copy = new species(original);
    return [copy.has(frozen), [...copy][0].a];
}

export function SetSpeciesTest049(){
    const sealed = Object.seal({ a: 1 });
    const original = new Set([sealed]);
    const species = Set[Symbol.species];
    const copy = new species(original);

    sealed.a = 2;
    return [copy.has(sealed), [...copy][0].a];
}

export function SetSpeciesTest050(){
    const obj = {};
    obj.self = obj;
    const original = new Set([obj]);

    const species = Set[Symbol.species];
    const copy = new species(original);

    return [copy.has(obj), [...copy][0].self === obj];
}

export function SetSpeciesTest051(){
    class BaseSet extends Set {
        multiply(factor) {
            return new this.constructor[Symbol.species](
                [...this].map(x => x * factor)
            );
        }
    }

    class DerivedSet extends BaseSet {
        static get [Symbol.species]() {
            return BaseSet;
        }
    }

    const derived = new DerivedSet([1, 2, 3]);
    const result = derived.multiply(2);

    return [result instanceof BaseSet, result instanceof DerivedSet, [...result]];
}

export async function SetSpeciesTest052(){
    class AsyncSet extends Set {
        static get [Symbol.species]() {
            return Set;
        }

        async process() {
            await new Promise(resolve => setTimeout(resolve, 10));
            return new this.constructor[Symbol.species](this);
        }
    }

    const asyncSet = new AsyncSet([1, 2, 3]);
    const result = await asyncSet.process();

    return [result instanceof Set, [...result]];
}

export function SetSpeciesTest053(){
    class GeneratorSet extends Set {
        static get [Symbol.species]() {
            return GeneratorSet;
        }

        *[Symbol.iterator]() {
            for (const value of super[Symbol.iterator]()) {
                yield value * 2;
            }
        }
    }

    const genSet = new GeneratorSet([1, 2, 3]);
    const species = GeneratorSet[Symbol.species];
    const newSet = new species(genSet);

    return [...newSet];
}

export function SetSpeciesTest054(){
    class ReverseSet extends Set {
        static get [Symbol.species]() {
            return Set;
        }

        *[Symbol.iterator]() {
            const values = [...super[Symbol.iterator]()];
            for (let i = values.length - 1; i >= 0; i--) {
                yield values[i];
            }
        }
    }

    const reverseSet = new ReverseSet([1, 2, 3]);
    const species = ReverseSet[Symbol.species];
    const newSet = new species(reverseSet);

    return [...newSet];
}

export function SetSpeciesTest055(){
    class ModifiedSet extends Set {
        static get [Symbol.species]() {
            return ModifiedSet;
        }

        add(value) {
            super.add(value * 2);
            return this;
        }
    }

    const modifiedSet = new ModifiedSet();
    modifiedSet.add(1).add(2);

    const species = ModifiedSet[Symbol.species];
    const newSet = new species(modifiedSet);

    return [...newSet];
}

export function SetSpeciesTest056(){
    const original = new Set([1, 2, 3]);
    const proxy = new Proxy(original, {
        get(target, prop) {
            if (prop === 'constructor') {
                return Set;
            }

            if (prop === Symbol.species) {
                return Set;
            }

            if (prop === Symbol.iterator) {
                return target[Symbol.iterator].bind(target);
            }
            if (prop === 'values') {
                return target.values.bind(target);
            }

            const value = Reflect.get(target, prop);
            if (typeof value === 'function') {
                return value.bind(target);
            }

            return value;
        },

        has(target, prop) {
            if (prop === Symbol.iterator || prop === 'values' || prop === 'constructor') {
                return true;
            }
            return Reflect.has(target, prop);
        }
    });

    const species = proxy.constructor[Symbol.species];
    const newSet = new species(proxy);

    return [newSet instanceof Set, [...newSet]];
}

export function SetSpeciesTest057(){
    class Level1Set extends Set {}
    class Level2Set extends Level1Set {}
    class Level3Set extends Level2Set {
        static get [Symbol.species]() {
            return Level1Set;
        }
    }

    const level3 = new Level3Set([1, 2, 3]);
    const species = level3.constructor[Symbol.species];
    const newSet = new species(level3);

    return [newSet instanceof Level1Set, newSet instanceof Level2Set, newSet instanceof Level3Set];
}

export function SetSpeciesTest058(){
    class DynamicSet extends Set {
        static get [Symbol.species]() {
            return DynamicSet;
        }
    }

    DynamicSet.prototype.double = function() {
        return new this.constructor[Symbol.species](
            [...this].map(x => x * 2)
        );
    };

    const dynamicSet = new DynamicSet([1, 2, 3]);
    const doubled = dynamicSet.double();

    return [doubled instanceof DynamicSet, [...doubled]];
}

export function SetSpeciesTest059(){
    class StaticSet extends Set {
        static get [Symbol.species]() {
            return Set;
        }

        static createFromArray(arr) {
            return new this[Symbol.species](arr);
        }
    }

    const created = StaticSet.createFromArray([1, 2, 3]);

    return [created instanceof Set, created instanceof StaticSet];
}

export function SetSpeciesTest060(){
    class ConstructorSet extends Set {
        constructor(iterable, multiplier = 1) {
            super([...iterable].map(x => x * multiplier));
        }

        static get [Symbol.species]() {
            return ConstructorSet;
        }
    }

    const original = new ConstructorSet([1, 2, 3], 2);
    const species = ConstructorSet[Symbol.species];
    const newSet = new species(original);
    return [...newSet];
}

export function SetSpeciesTest061(){
    class JsonSet extends Set {
        static get [Symbol.species]() {
            return JsonSet;
        }

        toJSON() {
            return [...this];
        }
    }

    const jsonSet = new JsonSet([1, 2, 3]);
    const species = JsonSet[Symbol.species];
    const newSet = new species(jsonSet);
    return newSet.toJSON();
}

export function SetSpeciesTest062(){
    class FromSet extends Set {
        static get [Symbol.species]() {
            return Set;
        }

        static from(iterable) {
            return new this[Symbol.species](iterable);
        }
    }

    const created = FromSet.from([1, 2, 3]);
    return [created instanceof Set, created instanceof FromSet];
}

export function SetSpeciesTest063(){
    class CustomHasSet extends Set {
        static get [Symbol.species]() {
            return CustomHasSet;
        }

        has(value) {
            return super.has(value.toString());
        }
    }

    const customSet = new CustomHasSet(['1', '2', '3']);
    const species = CustomHasSet[Symbol.species];
    return new species(customSet);
}

export function SetSpeciesTest064(){
    class CustomDeleteSet extends Set {
        static get [Symbol.species]() {
            return CustomDeleteSet;
        }

        delete(value) {
            return super.delete(value * 2);
        }
    }

    const customSet = new CustomDeleteSet([2, 4, 6]);
    customSet.delete(1);

    const species = CustomDeleteSet[Symbol.species];
    const newSet = new species(customSet);
    return [...newSet];
}

export function SetSpeciesTest065(){
    class NonSet extends Set {
        static get [Symbol.species]() {
            return Array;
        }
    }

    const nonSet = new NonSet([1, 2, 3]);
    const species = nonSet.constructor[Symbol.species];
    const result = new species(nonSet);
    return [result instanceof Array, [...result[0]]]
}

export function SetSpeciesTest066(){
    class ParamSet extends Set {
        constructor(iterable, prefix = '') {
            super([...iterable].map(x => prefix + x));
        }

        static get [Symbol.species]() {
            return ParamSet;
        }
    }

    const original = new ParamSet([1, 2, 3], 'num:');
    const species = ParamSet[Symbol.species];
    const newSet = new species(original);
    return [...newSet];
}

export function SetSpeciesTest067(){
    class LevelA extends Set {}
    class LevelB extends LevelA {
        static get [Symbol.species]() {
            return LevelA;
        }
    }
    class LevelC extends LevelB {}

    const levelC = new LevelC([1, 2, 3]);
    const species = levelC.constructor[Symbol.species];
    const newSet = new species(levelC);
    return [newSet instanceof LevelA, newSet instanceof LevelB, newSet instanceof LevelC];
}


export function SetSpeciesTest069(){
    const typedArray = new Uint8Array([1, 2, 3, 4]);
    const original = new Set(typedArray);
    const species = Set[Symbol.species];
    const copy = new species(original);
    return [...copy];
}

export async function SetSpeciesTest071(){
    let obj1 = {};
    let obj2 = {};
    const original = new Set([obj1, obj2]);
    const species = Set[Symbol.species];
    const copy = new species(original);

    const boo1 = copy.has(obj1);
    const boo2 = copy.has(obj2);

    obj1 = null;
    obj2 = null;
    await new Promise(resolve => setTimeout(resolve, 10));
    return [boo1, boo2, copy.size];
}

export function SetSpeciesTest072(){
    class ObservableSet extends Set {
        static get [Symbol.species]() {
            return ObservableSet;
        }

        constructor(iterable) {
            super();

            this.observers = [];
            this._isInitializing = true;

            if (iterable) {
                for (const item of iterable) {
                    this.add(item);
                }
            }

            this._isInitializing = false;
        }

        addObserver(observer) {
            this.observers.push(observer);
        }
        add(value) {
            super.add(value);

            if (!this._isInitializing) {
                this.observers.forEach(obs => obs(value));
            }

            return this;
        }
    }

    const logs = [];
    const observable = new ObservableSet([1, 2]);
    observable.addObserver(value => logs.push(value));

    const species = ObservableSet[Symbol.species];
    const newSet = new species(observable);

    newSet.addObserver(value => logs.push(value));

    newSet.add(3);
    return logs;
}

export function SetSpeciesTest073(){
    class ImmutableSet extends Set {
        static get [Symbol.species]() {
            return ImmutableSet;
        }

        add(value) {
            const newSet = new this.constructor[Symbol.species](this);
            newSet._add(value);
            return newSet;
        }

        _add(value) {
            super.add(value);
        }
    }

    const original = new ImmutableSet([1, 2]);
    const updated = original.add(3);
    return [original.size, updated.size, updated instanceof ImmutableSet];
}

export function SetSpeciesTest074(){
    class CachedSet extends Set {
        static cache = new Map();

        static get [Symbol.species]() {
            return CachedSet;
        }

        static create(iterable) {
            const key = JSON.stringify([...iterable].sort());
            if (!CachedSet.cache.has(key)) {
                CachedSet.cache.set(key, new CachedSet(iterable));
            }
            return CachedSet.cache.get(key);
        }
    }

    const set1 = CachedSet.create([1, 2, 3]);
    const set2 = CachedSet.create([3, 2, 1]);

    expect(set1).assertEqual(set2);

    const species = CachedSet[Symbol.species];
    const newSet = new species(set1);
    return [newSet instanceof CachedSet, [...newSet]];
}

export async function SetSpeciesTest075(){
    class ExpiringSet extends Set {
        static get [Symbol.species]() {
            return ExpiringSet;
        }

        constructor(iterable, ttl = 1000) {
            super(iterable);
            this.ttl = ttl;
            this.expiration = Date.now() + ttl;
        }

        isExpired() {
            return Date.now() > this.expiration;
        }
    }

    const expiringSet = new ExpiringSet([1, 2, 3], 10);
    const species = ExpiringSet[Symbol.species];
    const newSet = new species(expiringSet);

    const boo1 = newSet.isExpired();
    await new Promise(resolve => setTimeout(resolve, 15));
    const boo2 = newSet.isExpired();
    return [boo1, boo2];
}

export function SetSpeciesTest076(){
    class EncryptedSet extends Set {
        static get [Symbol.species]() {
            return EncryptedSet;
        }

        constructor(iterable, key = 1) {
            super([...iterable].map(x => x ^ key));
            this.key = key;
        }

        decrypt() {
            return new Set([...this].map(x => x ^ this.key));
        }
    }

    const encryptedSet = new EncryptedSet([1, 2, 3], 5);
    const species = EncryptedSet[Symbol.species];
    const newSet = new species(encryptedSet);
    return [...newSet.decrypt()];
}

export function SetSpeciesTest077(){
    class CompressedSet extends Set {
        static get [Symbol.species]() {
            return CompressedSet;
        }

        constructor(iterable) {
            const arr = [...iterable].sort((a, b) => a - b);
            const compressed = [];

            for (let i = 0; i < arr.length; i++) {
                if (i === 0 || arr[i] !== arr[i-1] + 1) {
                    compressed.push(arr[i]);
                } else if (i === arr.length - 1 || arr[i+1] !== arr[i] + 1) {
                    compressed.push(`-${arr[i]}`);
                }
            }

            super(compressed);
        }

        decompress() {
            const result = [];
            let start;

            for (const item of this) {
                if (typeof item === 'string' && item.startsWith('-')) {
                    const end = parseInt(item.slice(1));
                    for (let i = start + 1; i <= end; i++) {
                        result.push(i);
                    }
                } else {
                    start = item;
                    result.push(item);
                }
            }

            return new Set(result);
        }
    }

    const original = new Set([1, 2, 3, 5, 6, 7, 9]);
    const compressedSet = new CompressedSet(original);
    const species = CompressedSet[Symbol.species];
    const newSet = new species(compressedSet);
    return [...newSet.decompress()];
}

export function SetSpeciesTest078(){
    class SortedSet extends Set {
        static get [Symbol.species]() {
            return SortedSet;
        }

        *[Symbol.iterator]() {
            yield* [...super[Symbol.iterator]()].sort((a, b) => a - b);
        }
    }

    const sortedSet = new SortedSet([3, 1, 4, 2]);
    const species = SortedSet[Symbol.species];
    const newSet = new species(sortedSet);
    return [...newSet];
}

export function SetSpeciesTest079(){
    class FilteredViewSet extends Set {
        constructor(iterable, filter) {
            super(iterable);
            if (iterable instanceof FilteredViewSet && filter === undefined) {
                this.filter = iterable.filter;
            } else {
                this.filter = filter || (() => true);
            }
        }

        static get [Symbol.species]() {
            return FilteredViewSet;
        }

        *[Symbol.iterator]() {
            for (const value of super[Symbol.iterator]()) {
                if (this.filter(value)) {
                    yield value;
                }
            }
        }
    }

    const filteredSet = new FilteredViewSet([1, 2, 3, 4, 5], x => x % 2 === 0);
    const species = FilteredViewSet[Symbol.species];
    const newSet = new species(filteredSet);
    return [...newSet];
}

export function SetSpeciesTest080(){
    class TransformedSet extends Set {
        constructor(iterable, transform) {
            if (iterable instanceof TransformedSet && transform === undefined) {
                transform = iterable.transform;
            }
            super([...iterable].map(transform));
            this.transform = transform;
        }

        static get [Symbol.species]() {
            return TransformedSet;
        }

        reverseTransform() {
            return new Set([...this].map(x => x / 2));
        }
    }

    const transformedSet = new TransformedSet([1, 2, 3], x => x * 2);
    const species = TransformedSet[Symbol.species];
    const newSet = new species(transformedSet);

    return [...newSet.reverseTransform()];
}

export function SetSpeciesTest081(){
    class EventedSet extends Set {
        static get [Symbol.species]() {
            return EventedSet;
        }

        constructor(iterable) {
            super();
            this.listeners = new Map();

            if (iterable) {
                for (const item of iterable) {
                    this.add(item);
                }
            }
        }

        on(event, callback) {
            if (!this.listeners.has(event)) {
                this.listeners.set(event, []);
            }
            this.listeners.get(event).push(callback);
        }

        add(value) {
            super.add(value);
            if (this.listeners.has('add')) {
                this.listeners.get('add').forEach(cb => cb(value));
            }
            return this;
        }
    }

    const events = [];
    const eventedSet = new EventedSet([1, 2]);
    eventedSet.on('add', value => events.push(value));

    const species = EventedSet[Symbol.species];
    const newSet = new species(eventedSet);

    newSet.add(3);
    eventedSet.add(3);
    return events;
}

export function SetSpeciesTest082(){
    class TransactionalSet extends Set {
        static get [Symbol.species]() {
            return TransactionalSet;
        }

        constructor(iterable) {
            super();
            this.transactionLog = [];

            if (iterable) {
                for (const item of iterable) {
                    this.add(item);
                }
            }
        }

        add(value) {
            super.add(value);
            this.transactionLog.push({ type: 'add', value });
            return this;
        }

        getLog() {
            return [...this.transactionLog];
        }
    }

    const txSet = new TransactionalSet([1, 2]);
    txSet.add(3);

    const species = TransactionalSet[Symbol.species];
    const newSet = new species(txSet);

    newSet.add(4);
    return newSet.getLog();
}

export function SetSpeciesTest083(){
    class VersionedSet extends Set {
        static get [Symbol.species]() {
            return VersionedSet;
        }

        constructor(iterable) {
            super(iterable);
            this.version = 1;
        }

        add(value) {
            super.add(value);
            this.version++;
            return this;
        }
    }

    const versionedSet = new VersionedSet([1, 2]);
    versionedSet.add(3);

    const species = VersionedSet[Symbol.species];
    const newSet = new species(versionedSet);

    const num1 = newSet.version;
    newSet.add(4);
    const num2 = newSet.version;
    return [num1, num2];
}

export function SetSpeciesTest084(){
    class ValidatingSet extends Set {
        static get [Symbol.species]() {
            return ValidatingSet;
        }

        constructor(iterable, validator) {
            let valFn = validator;

            if (iterable instanceof ValidatingSet) {
                valFn = iterable.validator;
            }

            if (typeof valFn !== 'function') {
                valFn = () => true;
            }

            const items = iterable ? [...iterable] : [];
            const validItems = items.filter(valFn);

            super(validItems);

            this.validator = valFn;
        }

        add(value) {
            if (typeof this.validator === 'function' && this.validator(value)) {
                super.add(value);
            }
            return this;
        }
    }

    const validator = x => typeof x === 'number' && x > 0;
    const validatingSet = new ValidatingSet([1, -2, 3, '4'], validator);
    const species = ValidatingSet[Symbol.species];
    const newSet = new species(validatingSet);

    newSet.add(5);
    newSet.add(-6);
    return [...newSet];
}

export function SetSpeciesTest085(){
    class MappedPropertySet extends Set {
        static get [Symbol.species]() {
            return MappedPropertySet;
        }

        get ids() {
            return new this.constructor[Symbol.species](
                [...this].map(item => item.id)
            );
        }
    }

    const items = [{ id: 1 }, { id: 2 }, { id: 3 }];
    const mappedSet = new MappedPropertySet(items);
    const ids = mappedSet.ids;

    return [ids instanceof MappedPropertySet, [...ids]];
}

export function SetSpeciesTest086(){
    class CompositeSet extends Set {
        static get [Symbol.species]() {
            return CompositeSet;
        }

        constructor(sets) {
            super();
            this.sets = sets;
            sets.forEach(set => {
                set.forEach(item => super.add(item));
            });
        }

        refresh() {
            this.clear();
            this.sets.forEach(set => {
                set.forEach(item => super.add(item));
            });
            return new this.constructor[Symbol.species](this.sets);
        }
    }

    const setA = new Set([1, 2]);
    const setB = new Set([3, 4]);
    const compositeSet = new CompositeSet([setA, setB]);

    setA.add(5);
    const refreshed = compositeSet.refresh();

    return [...refreshed];
}

export function SetSpeciesTest087(){
    class ObservableCollection extends Set {
        static get [Symbol.species]() {
            return ObservableCollection;
        }

        constructor(iterable) {
            super();
            this.subscribers = [];

            if (iterable instanceof ObservableCollection) {
                this.subscribers = [...iterable.subscribers];
            }

            if (iterable) {
                for (const item of iterable) {
                    this.add(item);
                }
            }
        }

        subscribe(callback) {
            this.subscribers.push(callback);
            return () => {
                this.subscribers = this.subscribers.filter(cb => cb !== callback);
            };
        }

        add(value) {
            super.add(value);
            this.subscribers.forEach(cb => cb('add', value));
            return this;
        }
    }

    const log = [];
    const observable = new ObservableCollection([1, 2]);
    const unsubscribe = observable.subscribe((action, value) => {
        log.push({ action, value });
    });

    const species = ObservableCollection[Symbol.species];
    const newCollection = new species(observable);

    newCollection.add(3);
    unsubscribe();
    newCollection.add(4);
    return log;
}

export function SetSpeciesTest088(){
    class PaginatedSet extends Set {
        static get [Symbol.species]() {
            return PaginatedSet;
        }

        constructor(iterable, pageSize = 2) {
            super(iterable);
            this.pageSize = pageSize;
            this.items = [...iterable];
        }

        getPage(pageNumber) {
            const start = (pageNumber - 1) * this.pageSize;
            const end = start + this.pageSize;
            return new this.constructor[Symbol.species](
                this.items.slice(start, end)
            );
        }
    }

    const paginatedSet = new PaginatedSet([1, 2, 3, 4, 5], 2);
    const page2 = paginatedSet.getPage(2);

    return [page2 instanceof PaginatedSet, [...page2]];
}

export function SetSpeciesTest089(){
    class QueryableSet extends Set {
        static get [Symbol.species]() {
            return QueryableSet;
        }

        where(predicate) {
            return new this.constructor[Symbol.species](
                [...this].filter(predicate)
            );
        }
    }

    const queryableSet = new QueryableSet([1, 2, 3, 4, 5]);
    const evenNumbers = queryableSet.where(x => x % 2 === 0);

    return [evenNumbers instanceof QueryableSet, [...evenNumbers]];
}

export function SetSpeciesTest090(){
    class GroupedSet extends Set {
        static get [Symbol.species]() {
            return GroupedSet;
        }

        groupBy(keySelector) {
            const groups = new Map();

            for (const item of this) {
                const key = keySelector(item);
                if (!groups.has(key)) {
                    groups.set(key, new this.constructor[Symbol.species]());
                }
                groups.get(key).add(item);
            }

            return groups;
        }
    }

    const data = [1, 2, 3, 4, 5, 6];
    const groupedSet = new GroupedSet(data);
    const groups = groupedSet.groupBy(x => x % 2);
    return [groups.get(0) instanceof GroupedSet, groups.get(1) instanceof GroupedSet, [...groups.get(0)]];
}

export function SetSpeciesTest091(){
    class NestedSet extends Set {
        static get [Symbol.species]() {
            return NestedSet;
        }

        flatten() {
            const result = new this.constructor[Symbol.species]();

            const flattenHelper = (item) => {
                if (item instanceof Set) {
                    for (const subItem of item) {
                        flattenHelper(subItem);
                    }
                } else {
                    result.add(item);
                }
            };

            for (const item of this) {
                flattenHelper(item);
            }

            return result;
        }
    }

    const nestedData = [1, new Set([2, new Set([3])]), 4];
    const nestedSet = new NestedSet(nestedData);
    const flattened = nestedSet.flatten();
    return [flattened instanceof NestedSet, [...flattened]];
}

export function SetSpeciesTest092(){
    class IndexedSet extends Set {
        static get [Symbol.species]() {
            return IndexedSet;
        }

        constructor(iterable, keyField) {
            if (iterable instanceof IndexedSet) {
                super(iterable);
                this.keyField = keyField || iterable.keyField;
                this.index = new Map(iterable.index);
            } else {
                super(iterable);
                this.keyField = keyField;
                this.index = new Map();

                for (const item of iterable) {
                    this.index.set(item[keyField], item);
                }
            }
        }

        findByKey(key) {
            return this.index.get(key);
        }
    }

    const data = [{ id: 1, name: 'A' }, { id: 2, name: 'B' }];
    const indexedSet = new IndexedSet(data, 'id');
    const species = IndexedSet[Symbol.species];
    const newSet = new species(indexedSet);
    return newSet.findByKey(2);
}

export function SetSpeciesTest093(){
    class OrderedSet extends Set {
        static get [Symbol.species]() {
            return OrderedSet;
        }

        constructor(iterable, comparator) {
            super(iterable);
            this.comparator = comparator;
            this.items = [...iterable];
        }

        sorted() {
            return new this.constructor[Symbol.species](
                [...this.items].sort(this.comparator)
            );
        }
    }

    const data = [3, 1, 4, 2];
    const orderedSet = new OrderedSet(data, (a, b) => a - b);
    const sortedSet = orderedSet.sorted();

    return [sortedSet instanceof OrderedSet, [...sortedSet]];
}

export function SetSpeciesTest094(){
    class LinkedSet extends Set {
        static get [Symbol.species]() {
            return LinkedSet;
        }

        constructor(iterable) {
            super(iterable);
            this.links = new Map();
        }

        link(item, target) {
            this.links.set(item, target);
            return this;
        }

        getLinked(item) {
            return this.links.get(item);
        }
    }

    const linkedSet = new LinkedSet(['a', 'b', 'c']);
    linkedSet.link('a', 'b').link('b', 'c');

    const species = LinkedSet[Symbol.species];
    const newSet = new species(linkedSet);

    return [linkedSet.getLinked('a'), linkedSet.getLinked('b'), newSet.getLinked('a'), newSet.getLinked('b')];
}

export function SetSpeciesTest095(){
    class TaggedSet extends Set {
        static get [Symbol.species]() {
            return TaggedSet;
        }

        constructor(iterable) {
            super(iterable);
            this.tags = new Map();
        }

        addTag(item, tag) {
            if (!this.tags.has(item)) {
                this.tags.set(item, new Set());
            }
            this.tags.get(item).add(tag);
            return this;
        }

        getByTag(tag) {
            const result = new this.constructor[Symbol.species]();
            for (const [item, itemTags] of this.tags) {
                if (itemTags.has(tag)) {
                    result.add(item);
                }
            }
            return result;
        }
    }

    const taggedSet = new TaggedSet([1, 2, 3, 4]);
    taggedSet.addTag(1, 'odd').addTag(3, 'odd').addTag(2, 'even').addTag(4, 'even');

    const species = TaggedSet[Symbol.species];
    const newSet = new species(taggedSet);
    const odds = newSet.getByTag('odd');

    return [odds instanceof TaggedSet, [...odds]];
}

export function SetSpeciesTest096(){
    class WeightedSet extends Set {
        static get [Symbol.species]() {
            return WeightedSet;
        }

        constructor(iterable) {
            if (iterable instanceof WeightedSet) {
                super(iterable);
                this.weights = new Map(iterable.weights);
            } else {
                super(iterable.map(item => item.value));
                this.weights = new Map();
                for (const item of iterable) {
                    this.weights.set(item.value, item.weight);
                }
            }
        }

        getWeight(value) {
            return this.weights.get(value) || 0;
        }

        totalWeight() {
            return [...this].reduce((sum, value) => sum + this.getWeight(value), 0);
        }
    }

    const data = [
        { value: 'a', weight: 2 },
        { value: 'b', weight: 3 },
        { value: 'c', weight: 5 }
    ];

    const weightedSet = new WeightedSet(data);
    const species = WeightedSet[Symbol.species];
    const newSet = new species(weightedSet);

    return [newSet.totalWeight(), newSet.getWeight('b')];
}

export function SetSpeciesTest097(){
    class TimeStampedSet extends Set {
        static get [Symbol.species]() {
            return TimeStampedSet;
        }

        constructor(iterable) {
            if (iterable instanceof TimeStampedSet) {
                super(iterable);
                this.timestamps = new Map(iterable.timestamps);
            } else {
                super(iterable.map(item => item.value));
                this.timestamps = new Map();
                for (const item of iterable) {
                    this.timestamps.set(item.value, item.timestamp);
                }
            }
        }

        getNewest() {
            let newestValue = null;
            let newestTime = -Infinity;

            for (const [value, time] of this.timestamps) {
                if (time > newestTime) {
                    newestTime = time;
                    newestValue = value;
                }
            }

            return newestValue;
        }
    }

    const data = [
        { value: 'a', timestamp: 100 },
        { value: 'b', timestamp: 300 },
        { value: 'c', timestamp: 200 }
    ];

    const timeSet = new TimeStampedSet(data);
    const species = TimeStampedSet[Symbol.species];
    const newSet = new species(timeSet);
    return newSet.getNewest();
}

export function SetSpeciesTest098(){
    class PrioritySet extends Set {
        static get [Symbol.species]() {
            return PrioritySet;
        }

        constructor(iterable) {
            if (iterable instanceof PrioritySet) {
                super(iterable);
                this.priorities = new Map(iterable.priorities);
            } else {
                super(iterable.map(item => item.value));
                this.priorities = new Map();
                for (const item of iterable) {
                    this.priorities.set(item.value, item.priority);
                }
            }
        }

        getHighestPriority() {
            let highestValue = null;
            let highestPriority = -Infinity;

            for (const [value, priority] of this.priorities) {
                if (priority > highestPriority) {
                    highestPriority = priority;
                    highestValue = value;
                }
            }

            return highestValue;
        }
    }

    const data = [
        { value: 'task1', priority: 2 },
        { value: 'task2', priority: 5 },
        { value: 'task3', priority: 3 }
    ];

    const prioritySet = new PrioritySet(data);
    const species = PrioritySet[Symbol.species];
    const newSet = new species(prioritySet);
    return newSet.getHighestPriority();
}

export function SetSpeciesTest099(){
    class ValidatedSet extends Set {
        static get [Symbol.species]() {
            return ValidatedSet;
        }

        constructor(iterable, validator) {
            super(iterable);
            this.validator = validator;
            this.transactionQueue = [];
        }

        queueAdd(value) {
            this.transactionQueue.push({ type: 'add', value });
            return this;
        }

        commit() {
            for (const transaction of this.transactionQueue) {
                if (transaction.type === 'add' && this.validator(transaction.value)) {
                    super.add(transaction.value);
                }
            }
            this.transactionQueue = [];
            return new this.constructor[Symbol.species](this, this.validator);
        }
    }

    const validator = x => x > 0;
    const validatedSet = new ValidatedSet([1, 2], validator);
    validatedSet.queueAdd(3).queueAdd(-1).queueAdd(4);

    const committed = validatedSet.commit();

    return [committed instanceof ValidatedSet, [...committed]];
}

export function SetSpeciesTest100(){
    class TransformSet extends Set {
        static get [Symbol.species]() {
            return TransformSet;
        }

        constructor(iterable, transform = x => x) {
            super([...iterable].map(transform));
            this.transform = transform;
            this.originalData = new Set(iterable);
        }

        applyTransform(newTransform) {
            return new this.constructor[Symbol.species](this.originalData, newTransform);
        }
    }

    const originalData = [1, 2, 3];
    const transformSet = new TransformSet(originalData, x => x * 2);
    const squaredSet = transformSet.applyTransform(x => x * x);

    return [squaredSet instanceof TransformSet, [...squaredSet]];
}
