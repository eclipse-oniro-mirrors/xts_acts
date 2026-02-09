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
export function testSetForOfJs036() {
    const nested1 = { data: { value: 'test1' } };
    const nested2 = { data: { value: 'test2' } };
    const mySet = new Set([nested1, nested2]);
    const result = [];

    for (const v of mySet) {
        result.push(v.data.value);
    }
    return result;
}

export function testSetForOfJs038() {
    const mySet = new Set();

    {
        mySet.add(1);
        mySet.add(2);
    }

    function addToSet() {
        mySet.add(3);
        mySet.add(4);
    }

    addToSet();

    const result = [];
    for (const v of mySet) {
        result.push(v);
    }
    return result;
}

export function testSetForOfJs060() {
    const obj1 = { value: 10 };
    const obj2 = { value: 20 };
    const proxy1 = new Proxy(obj1, {});
    const proxy2 = new Proxy(obj2, {});
    const mySet = new Set([proxy1, proxy2]);
    const result = [];

    for (const v of mySet) {
        result.push(v.value);
    }
    return result;
}

export function testSetForOfJs061() {
    function* generator1() { yield 1; };
    function* generator2() { yield 2; };
    const mySet = new Set([generator1, generator2]);
    const result = [];

    for (const v of mySet) {
        const gen = v();
        result.push(gen.next().value);
    }
    return result;
}

export function testSetForOfJs065() {
    const mySet = new Set([1, '2', true, { value: 4 }]);
    const result = [];

    for (const v of mySet) {
        result.push(typeof v);
    }
    return result;
}

export function testSetForOfJs009() {
    const sym1 = Symbol('one');
    const sym2 = Symbol('two');
    const sym3 = Symbol('one'); // Different symbol with same description
    const set = new Set([sym1, sym2, sym3, sym1]);

    const keys = Array.from(set.keys());
    const values = Array.from(set.values());

    return keys.length == 3 && keys[0] === sym1
    && keys[1] === sym2 && keys[2] === sym3;
}

export function testSetForOfJs024() {
    const frozen1 = Object.freeze({ id: 'f1', value: 10 });
    const frozen2 = Object.freeze({ id: 'f2', value: 20 });
    const set = new Set([frozen1, frozen2]);

    const keys = Array.from(set.keys());
    const values = Array.from(set.values());

    return keys.length == 3 && keys[0].id === 'f1'
        && keys[1].value === 20;
}

export function testSetForOfJs025() {
    function* gen1() { yield 1; }
    function* gen2() { yield 2; }
    const set = new Set([gen1, gen2, gen1]);

    const keys = Array.from(set.keys());
    const values = Array.from(set.values());

    return keys.length == 2 && keys[0] === gen1
        && keys[1] === gen2;
}