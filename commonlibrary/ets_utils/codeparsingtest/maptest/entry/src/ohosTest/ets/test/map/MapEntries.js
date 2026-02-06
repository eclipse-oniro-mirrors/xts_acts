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
export function MapentriesTest008(){
    const key1 = Symbol('key1');
    const key2 = Symbol('key2');
    const map = new Map([[key1, 10], [key2, 20]]);
    const entries = Array.from(map.entries());
    let map1 = [[key1, 10], [key2, 20]]
    return { entries,map1}
}

export function MapentriesTest009(){
    const key1 = 100n;
    const key2 = 200n;
    const map = new Map([[key1, 'hundred'], [key2, 'two hundred']]);
    const entries = Array.from(map.entries());
    let map1 = [[key1, 'hundred'], [key2, 'two hundred']] === entries
    return { map1}
}

export function MapentriesTest033(){
    const map = new Map([['a', 1]]);
    const entries = map.entries();
    const result = entries.next();
    let map1 = result.hasOwnProperty('value');
    let map2 = result.hasOwnProperty('done');
    let map3 = result.value;
    let map4 = result.done;
    return { map1,map2,map3,map4}
}

export function MapentriesTest040(){
    const map = new Map();
    for (let i = 0; i < 10000; i++) {
        map.set(i, i);
    }

    const entries = map.entries();
    let count = 0;
    for (let i = 0; i < 10; i++) {
        const entry = entries.next();
        count++;
    }
    let lastEntry;
    while (true) {
        const entry = entries.next();
        if (entry.done) break;
        lastEntry = entry;
        count++;
    }
    let map1 = lastEntry?.value;
    return { map1,count}
}

export function MapentriesTest048(){
    function* generator1() {
        yield 1;
        yield 2;
    }
    function* generator2() {
        yield 'a';
        yield 'b';
    }
    const map = new Map([[1, generator1()], [2, generator2()]]);
    const entries = Array.from(map.entries());
    let map1 = [[1, generator1()], [2, generator2()]];
    let map2 = entries[0][1].next().value;
    return {entries,map1,map2}
}

export function MapentriesTest049(){
    const target1 = { name: 'target1' };
    const target2 = { name: 'target2' };
    const proxy1 = new Proxy(target1, {});
    const proxy2 = new Proxy(target2, {});
    const map = new Map([[1, proxy1], [2, proxy2]]);
    const entries = Array.from(map.entries());
    let map1 = [[1, proxy1], [2, proxy2]];
    let map2 = (entries[0][1]).name;
    return {entries,map1,map2}
}


export function MapentriesTest050(){
    const obj1 = Object.freeze({ prop: 'frozen1' });
    const obj2 = Object.freeze({ prop: 'frozen2' });
    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    let map1 = [[1, obj1], [2, obj2]];
    let map2 = entries[0][1].prop;
    return {entries,map1,map2}
}

export function MapentriesTest051(){
    const obj1 = { prop: 'sealed1' };
    const obj2 = { prop: 'sealed2' };
    Object.seal(obj1);
    Object.seal(obj2);
    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());

    let map1 = [[1, obj1], [2, obj2]];
    let map2 = entries[0][1].prop;
    return {entries,map1,map2}
}

export function MapentriesTest052(){
    const obj1 = {
        _value: 10,
        get value() { return this._value; },
        set value(v) { this._value = v; }
    };
    const obj2 = {
        _value: 20,
        get value() { return this._value; },
        set value(v) { this._value = v; }
    };
    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = entries[0][1].value;
    const map2 = [[1, obj1], [2, obj2]];
    return { entries,map1,map2}
}

export function MapentriesTest053() {
    const sym1 = Symbol('value1');
    const sym2 = Symbol('value2');
    const map = new Map([['s1', sym1], ['s2', sym2]]);
    const entries = Array.from(map.entries());
    const map1 = [['s1', sym1], ['s2', sym2]];
    return {entries,map1}
}

export function MapentriesTest056(){
    const key1 = Object.create(null);
    key1.id = 1;
    const key2 = Object.create(null);
    key2.id = 2;
    const map = new Map([[key1, 'key1'], [key2, 'key2']]);
    const entries = Array.from(map.entries());
    const map1 = entries[0][0].id;
    return { entries,map1,key1,key2}
}


export function MapentriesTest070(){
    const sym1 = Symbol('description');
    const sym2 = Symbol('description');
    const map = new Map([[sym1, 10], [sym2, 20]]);
    const entries = Array.from(map.entries());
    const map1 = entries[0][0] === sym1;
    const map2 = entries[1][0] === sym2;

    return { entries, map1, map2 };
}
export function MapentriesTest079(){
    const largeInt1 = 9007199254740991n;
    const largeInt2 = 9007199254740992n;
    const map = new Map([['max', largeInt1], ['beyond', largeInt2]]);
    const entries = Array.from(map.entries());
    const map1 = [['max', largeInt1], ['beyond', largeInt2]] === entries;
    return { entries, map1 };
}

export function MapentriesTest080(){
    const key1 = 123;
    const key2 = 'string key';
    const key3 = true;
    const key4 = Symbol('symbol key');
    const map = new Map([
        [key1, 'number'],
        [key2, 'string'],
        [key3, 'boolean'],
        [key4, 'symbol']
    ]);
    const entries = Array.from(map.entries());
    const map1 = entries === [[key1, 'number'], [key2, 'string'], [key3, 'boolean'], [key4, 'symbol']]
    return { entries, map1 };
}

export function MapentriesTest081(){
    const symProp = Symbol('property');
    const obj1 = { [symProp]: 'value1' };
    const obj2 = { [symProp]: 'value2' };
    const map = new Map([[obj1, 1], [obj2, 2]]);
    const entries = Array.from(map.entries());
    const map1 = [[obj1, 1], [obj2, 2]] === entries;
    const map2 = entries[0][0][symProp] === 'value'
    return { map2, map1 };
}

export function MapentriesTest082(){
    const jsonData = '{"a":1,"b":2,"c":3}';
    const obj = JSON.parse(jsonData);
    const map = new Map(Object.entries(obj));
    const entries = Array.from(map.entries());
    const map1 = [['a', 1], ['b', 2], ['c', 3]] === entries;
    return {  map1 };
}

export function MapentriesTest085(){
    const iterable1 = [1, 2, 3];
    const iterable2 = new Set(['a', 'b']);
    const map = new Map([['array', iterable1], ['set', iterable2]]);
    const entries = Array.from(map.entries());
    const map1 = [['array', iterable1], ['set', iterable2]] === entries;
    return {  map1 };
}

export function MapentriesTest086(){
    const obj1 = Object.defineProperty({}, 'prop', {
        value: 'read-only',
        writable: false
    });

    const obj2 = Object.defineProperty({}, 'count', {
        value: 100,
        writable: false
    });

    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, obj1], [2, obj2]] === entries;
    return {  map1 };
}

export function MapentriesTest087(){
    const obj1 = {
        _value: 5,
        get value() { return this._value; },
        set value(v) { this._value = v; }
    };

    const obj2 = {
        _name: 'test',
        get name() { return this._name; },
        set name(n) { this._name = n; }
    };

    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, obj1], [2, obj2]] === entries;
    const map2 = entries[1][1].name === 'test';
    return {  map1,map2 };
}

export function MapentriesTest088(){
    const proto = { baseProp: 'base' };
    const obj1 = Object.create(proto);
    obj1.prop1 = 'value1';

    const obj2 = Object.create(proto);
    obj2.prop2 = 'value2';

    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, obj1], [2, obj2]] === entries;
    const map2 = entries[0][1].prop1 === 'value1';
    return {  map1,map2 };
}

export function MapentriesTest090(){
    const obj1 = Object.defineProperties({}, {
        enumProp: { value: 'enumerable', enumerable: true },
        nonEnumProp: { value: 'non-enumerable', enumerable: false }
    });

    const obj2 = { enumProp: 'another enumerable' };
    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, obj1], [2, obj2]] === entries;
    const map2 = entries[0][1].enumProp === 'enumerable';
    return {  map1,map2 };
}

export function MapentriesTest091(){
    class ClassA {
        constructor( value) {}
    }

    class ClassB {
        constructor( name) {}
    }

    const map = new Map([
        ['A', ClassA],
        ['B', ClassB]
    ]);

    const entries = Array.from(map.entries());
    const map1 = [['A', ClassA], ['B', ClassB]] === entries;
    const map2 = new entries[0][1](10).value === 10;
    return {  map1,map2 };
}

export function MapentriesTest092(){
    const symMethod = Symbol('method');
    const obj1 = {
        [symMethod]: () => 'result1'
    };

    const obj2 = {
        [symMethod]: () => 'result2'
    };
    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, obj1], [2, obj2]]=== entries;
    const map2 = entries[0][1][symMethod]() === 'result1';

    return { map1,map2 };
}

export function MapentriesTest093(){
    const obj1 = {
        id: 1,
        toJSON: () => ({ id: 1, type: 'obj1' })
    };
    const obj2 = {
        id: 2,
        toJSON: () => ({ id: 2, type: 'obj2' })
    };
    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, obj1], [2, obj2]]=== entries;
    return { map1 };
}

export function MapentriesTest094(){
    const obj1 = {
        [Symbol.toStringTag]: 'CustomObject1',
        value: 'test1'
    };

    const obj2 = {
        [Symbol.toStringTag]: 'CustomObject2',
        value: 'test2'
    };

    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, obj1], [2, obj2]]=== entries;
    return { map1 };
}

export function MapentriesTest095(){
    function* gen1() {
        yield 1;
        yield 2;
    }
    function* gen2() {
        yield 'a';
        yield 'b';
    }
    const map = new Map([['numGen', gen1], ['strGen', gen2]]);
    const entries = Array.from(map.entries());
    const map1 = [['numGen', gen1], ['strGen', gen2]]=== entries;
    return { map1 };
}


export function MapentriesTest097(){
    const parent = { inherited: 'from parent' };
    const child1 = Object.create(parent);
    child1.own = 'child1 own';

    const child2 = Object.create(parent);
    child2.own = 'child2 own';
    const map = new Map([[1, child1], [2, child2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, child1], [2, child2]] === entries;
    const map2 = entries[0][1].own === 'child1 own';
    return { map2, map1 };
}

export function MapentriesTest098(){
    const prop1 = 'dynamic' + 'Prop1';
    const prop2 = 'dynamic' + 'Prop2';
    const obj1 = { [prop1]: 'value1' };
    const obj2 = { [prop2]: 'value2' };
    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, obj1], [2, obj2]] === entries;
    const map2 = entries[0][1][prop1] === 'value1';
    return { map2, map1 };
}
export function MapentriesTest099(){
    const symKey1 = Symbol('key1');
    const symKey2 = Symbol('key2');
    const symVal1 = Symbol('val1');
    const symVal2 = Symbol('val2');

    const obj1 = { [symKey1]: symVal1 };
    const obj2 = { [symKey2]: symVal2 };
    const map = new Map([[1, obj1], [2, obj2]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, obj1], [2, obj2]] === entries;
    const map2 = entries[0][1][symKey1] === symKey1;
    return { map2, map1 };
}


export function MapentriesTest100(){
    const nested = {
        level1: {
            level2: {
                level3: {
                    level4: {
                        value: 'deep'
                    }
                }
            }
        }
    };

    const map = new Map([[1, nested]]);
    const entries = Array.from(map.entries());
    const map1 = [[1, nested]]=== entries;
    const map2 = entries[0][1].level1.level2.level3.level4.value === 'deep'
    return { map2, map1 };
}

