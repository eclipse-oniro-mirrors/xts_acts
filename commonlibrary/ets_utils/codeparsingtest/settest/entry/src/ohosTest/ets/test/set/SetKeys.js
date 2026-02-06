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
export function testSetKeysJs0014() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const set = new Set([sym1, sym2]);
    const keys = set.keys();
    return[keys.next().value === sym1, keys.next().value === sym2];
}
export function testSetKeysJs0037() {
    const frozenObj = Object.freeze({ id: 1 });
    const set = new Set([frozenObj]);
    const keys = set.keys();
    let firstValue = keys.next().value;
    return [firstValue === frozenObj, firstValue.id == 1];
}

export function testSetKeysJs0043() {
    // Create an object with inherited properties
    const parent = { inherited: 'value' };
    const child = Object.create(parent);
    child.own = 'property';

    const set  = new Set([child]);
    const keys = set.keys();
    const result = keys.next().value;

    return [result === child, result.own === 'property', result.inherited === 'value'];
}

export function testSetKeysJs0044() {
    const obj = {};
    Object.defineProperty(obj, 'nonEnumerable', {
        value: 'secret',
        enumerable: false
    });
    const set = new Set([obj]);
    const keys = set.keys();
    const result = keys.next().value;

    return [result === obj, result.nonEnumerable];
}

export function testSetKeysJs0045() {
    const symProp = Symbol('hidden');
    const obj = {
        visible: 'public',
        [symProp]: 'private'
    };
    const set = new Set([obj]);
    const keys = set.keys();
    const result = keys.next().value;

    return [result === obj, result[symProp]];
}

export function testSetKeysJs0046() {
    const obj = { name: 'circular' };
    obj.self = obj; // Create circular reference

    const set = new Set([obj]);
    const keys = set.keys();
    const result = keys.next().value;

    return [result === obj, result.self === obj];
}

export function testSetKeysJs0055() {
    function* generator1() { yield 1; }
    function* generator2() { yield 2; }
    const set = new Set([generator1(), generator2()]);

    const keys = set.keys();

    return [keys.next().value === generator1(), keys.next().value === generator2()];
}

export function testSetKeysJs0061() {
    const obj61_1 = Object.create(null);
    obj61_1.prop = 'test1';
    const obj61_2 = Object.create(null);
    obj61_2.prop = 'test2';

    const set = new Set([obj61_1, obj61_2]);
    const keys = set.keys();

    return [keys.next().value === obj61_1, keys.next().value === obj61_2];
}

export function testSetValuesJs014() {
    const sym1 = Symbol('symbol1');
    const sym2 = Symbol('symbol2');
    const set = new Set([sym1, sym2]);
    const values = set.values();
    return (values.next().value === sym1 && values.next().value === sym2);
}

export function testSetValuesJs044() {
    const frozenObj = Object.freeze({ id: 1 });
    const set = new Set([frozenObj]);
    const values = set.values();
    const firstVal = values.next().value;
    return firstVal.id;
}

export function testSetValuesJs046() {
    const obj1 = Object.create(null);
    obj1['prop'] = 'value1';
    const obj2 = Object.create(null);
    obj2['prop'] = 'value2';

    const set = new Set([obj1, obj2]);
    const values = set.values();

    const firstVal = values.next().value;
    const secondVal = values.next().value;

    return (firstVal===obj1 && secondVal ===obj2);
}

export function testSetValuesJs052() {
    function* generator1() {
        yield 1;
        yield 2;
    }
    function* generator2() {
        yield 3;
        yield 4;
    }

    const set = new Set([generator1, generator2]);
    const values = set.values();

    const firstVal = values.next().value;
    const secondVal = values.next().value;

    return[firstVal().next().value, secondVal().next().value];
}

export function testSetValuesJs059() {
    const symProp = Symbol('property');
    const obj1 = { [symProp]: 'value1' };
    const obj2 = { [symProp]: 'value2' };
    const set = new Set([obj1, obj2]);
    const values = set.values();

    const firstVal = values.next().value;
    const secondVal = values.next().value;

    return [firstVal[symProp],secondVal[symProp]];
}

export function testSetSizeJs010() {
    const set = new Set([1, 2, 3]);
    set.size = 10;
    return set.size;
}

export function testSetSizeJs019() {
    const sym1 = Symbol('test');
    const sym2 = Symbol('test'); // Same description, different reference
    const sym3 = Symbol('another');

    const set = new Set([sym1, sym2, sym3]);
    return set.size;
}

export function testSetSizeJs025() {
    const obj1 = Object.create(null);
    obj1['prop'] = 'value1';

    const obj2 = Object.create(null);
    obj2['prop'] = 'value1'; // Same property, different object

    const set = new Set([obj1, obj2]);
    return set.size;
}

export function testSetSizeJs034() {
    const nestedObj = {
        id: 1,
        nested: {
            id: 2,
            nested: {
                id: 3
            }
        }
    };
    const set = new Set([nestedObj]);
    const values = set.values();
    const firstVal = values.next().value;

    return [firstVal.id, firstVal.nested?.id, firstVal.nested?.nested?.id];
}
export function testSetSizeJs036() {
    const sym = Symbol('test');
    const date = new Date();
    const func = () => {};

    const set = new Set([
        'string', 42, true, sym, date, func,
        42, // Duplicate
        true, // Duplicate
        new Date() // New Date instance
    ]);
    return set.size;
}

export function testSetSizeJs038() {
    function* generateValues() {
        yield 1;
        yield 2;
        yield 3;
        yield 2; // Duplicate
        yield 4;
        yield 1; // Duplicate
    }

    const set = new Set(generateValues());
    return set.size;
}

export function testSetSizeJs039() {
    const propSym = Symbol('property');

    const obj1 = { [propSym]: 'value1' };
    const obj2 = { [propSym]: 'value2' };
    const obj3 = { [propSym]: 'value1' }; // Same property value, different object

    const set = new Set([obj1, obj2, obj3]);
    return set.size;
}

export function testSetSizeJs073() {
    const propSym = Symbol('property');
    const obj1 = {
        [propSym]: 'value1',
        id: 1
    };
    const obj2 = {
        [propSym]: 'value2',
        id: 2
    };
    const set = new Set([obj1, obj2]);
    const valuesArray = Array.from(set.values());

    return [valuesArray.length, valuesArray[0][propSym], valuesArray[1][propSym]];
}

export function testSetSizeJs076() {
    function* dataGenerator() {
        yield new Entity(1, 'First');
        yield new Entity(2, 'Second');
        yield new Entity(1, 'First'); // Duplicate by value (not reference)
    }

    const set = new Set(dataGenerator());
    const values = Array.from(set.values());

    return [values.length, values[0].uid, values[1].uid, values[2].uid];
}

export function testSetSizeJs077() {
    const obj1 = {
        value: 'initial',
        details: { timestamp: 100, active: false }
    };
    const obj2 = {
        value: 'initial',
        details: { timestamp: 200, active: false }
    };

    const set = new Set([obj1, obj2]);
    const values = set.values();

    // Modify objects during iteration
    let next = values.next();
    expect(next.value.value).assertEqual('initial');
    next.value.value = 'modified1';

    next = values.next();
    expect(next.value.value).assertEqual('initial');
    next.value.value = 'modified2';

    // Verify modifications persist in the set
    const updatedValues = Array.from(set.values());
    return [updatedValues[0].value, updatedValues[1].value];
}

export function testSetSizeJs082() {
    // Create recursive structure
    const recursive = {
        id: 'root',
        items: []
    };
    recursive.items.push({
        value: 'self-referential',
        details: { timestamp: Date.now(), active: true }
    });
    recursive.items[0].details.active = true;

    // Create another recursive object
    const recursive2 = {
        id: 'root2',
        items: [recursive.items[0]]
    };

    const set = new Set([recursive, recursive2]);
    const values = Array.from(set.values());

    return [values.length, values[0].id, values[1].id];
}

export function testSetSizeJs088() {
    const arr1 = ['a', 'b', 'c'];
    const set1 = new Set(['c', 'd', 'e']);
    const generator = function* () {
        yield 'e';
        yield 'f';
        yield 'g';
    };
    // Create set using spread from multiple sources
    const combinedSet = new Set([...arr1, ...set1, ...generator()]);
    const values = Array.from(combinedSet.values());

    return values;
}

export function testSetSizeJs092() {
    const proto = { base: 'prototype' };
    const obj1 = Object.create(proto);
    obj1.id = 1;

    const obj2 = Object.create(proto);
    obj2.id = 2;

    const set = new Set([obj1, obj2]);
    const values = Array.from(set.values());

    return [values.length, values[0].id, values[1].id, values[0].base];
}