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
"use strict"

export function SetDeleteTest013(){
    const sym = Symbol('test');
    const set = new Set([sym, 'a', 'b']);
    const result = set.delete(sym);
    return [result, set.size, set.has(sym)]
}

export function SetDeleteTest024(){
    const set = new Set([1, 2, 3]);
    Object.freeze(set);

    let errorThrown = false;
    try {
        set.delete(2);
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    return [errorThrown, set.size, set.has(2)]
}

export function SetDeleteTest025(set){
    Object.seal(set);
}

export function SetDeleteTest029(set){
    return [...set];
}

export function SetDeleteTest040(){
    const set = new Set([
        'string',
        42,
        true,
        null,
        undefined,
        Symbol('symbol'),
        123n
    ]);

    const result = set.delete(42);
    return [result, set.size, set.has(42), set.has('string')]
}

export function SetDeleteTest041(){
    const sym1 = Symbol('test');
    const sym2 = Symbol('test');
    const set = new Set([sym1]);

    const result = set.delete(sym2);

    return [result, set.size, set.has(sym1)]
}

export function SetDeleteTest057(){
    const set = new Set(['a', 'b', 'c']);
    set.delete('b');

    function checkElements(...elements) {
        return elements.includes('b');
    }

    const containsB = checkElements(...set);
    return [containsB, checkElements(...set)]
}

export function SetDeleteTest060(set1, set2){
    return new Set([...set1].filter(x => set2.has(x)));
}

export function SetDeleteTest061(setA, setB){
    return new Set([...setA].filter(x => !setB.has(x)));
}

export function SetDeleteTest065(setX, setY){
    return new Set([...setX, ...setY]);
}

export function SetDeleteTest071(){
    const set = new Set([1, 2, 3]);
    const originalIterator = set[Symbol.iterator];
    set[Symbol.iterator] = function* () {
        for (const item of originalIterator.call(this)) {
            if (item % 2 === 0) {
                yield item;
            }
        }
    };

    const result = set.delete(2);
    const values = Array.from(set);
    return [result, values];
}

export function SetDeleteTest072(){
    const set = new Set(['x', 'y', 'z']);
    set.delete('y');

    function* generateSetItems(s) {
        for (const item of s) {
            yield item;
        }
    }

    const generator = generateSetItems(set);
    const items = [];

    let result = generator.next();
    while (!result.done) {
        items.push(result.value);
        result = generator.next();
    }
    return items;
}

export function SetDeleteTest073(){
    const set = new Set([5, 10, 15, 20]);
    set.delete(10);

    const values = set.values();
    const collected = [];
    let next;

    do {
        next = values.next();
        if (!next.done) {
            collected.push(next.value);
        }
    } while (!next.done);
    return collected;
}

export function SetDeleteTest094(){
    const set = new Set([{ id: 1 }, { id: 2 }, { id: 3 }, { id: 4 }]);
    const toDelete = Array.from(set).find(item => item.id === 2);

    set.delete(toDelete);
    const found = Array.from(set)
        .map(item => ({ ...item, value: item.id * 10 }))
        .find(transformed => transformed.value === 30);
    return found;
}

export function SetDeleteTest100(){
    const obj = { name: 'test' };
    const set = new Set([
        'string',
        42,
        true,
        null,
        obj,
        Symbol('symbol'),
        123n
    ]);

    set.delete(42);
    set.delete(null);

    set.add('new string');
    set.add(99);

    set.delete(obj);

    const arr = Array.from(set);
    const stringValues = arr
        .filter(item => typeof item === 'string')
        .sort();

    const numberValues = arr
        .filter(item => typeof item === 'number')
        .map(num => num * 2);

    return [set.size, stringValues, numberValues, arr.some(item => item === Symbol('symbol'))];
}