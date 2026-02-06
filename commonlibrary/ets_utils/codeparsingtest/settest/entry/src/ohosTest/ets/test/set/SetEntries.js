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
export function SetEntriesTest013(){
    const sym1 = Symbol('test');
    const sym2 = Symbol('test');
    const set = new Set([sym1, sym2]);
    const entries = Array.from(set.entries());
    return [entries.length, entries[0][0] === sym1,  entries[1][0] === sym2];
}
export function SetEntriesTest024(){
    const arr = [1, 2, 3];

    function arrayEntries(arr) {
        let index = 0;
        return {
            [Symbol.iterator]() {
                return this;
            },
            next() {
                if (index < arr.length) {
                    const value = arr[index];
                    index++;
                    return { done: false, value: [value, value] };
                }
                return { done: true, value: undefined };
            }
        };
    }

    const iterator = arrayEntries(arr);
    const entries = Array.from(iterator);
    return entries;
}
export function SetEntriesTest025(){
    const set = new Set(['a', 'b', 'c']);
    const entries = [...set.entries()];
    return entries;
}
export function SetEntriesTest026(){
    const set = new Set([1, 2, 3]);
    const doubledValues = Array.from(set.entries(), ([value]) => value * 2);
    return doubledValues;
}
export function SetEntriesTest028(){
    const set = new Set([1, 2, 3]);
    Object.freeze(set);

    const entries = Array.from(set.entries());
    return [entries, Object.isFrozen(set)];
}
export function SetEntriesTest029(){
    const set = new Set([1, 2]);
    const iterator = set.entries();
    let forInCount = 0;
    let forOfCount = 0;

    for (const key in iterator) {
        forInCount++;
    }

    for (const _ of iterator) {
        forOfCount++;
    }
    return [forInCount, forOfCount];
}
export function SetEntriesTest032(){
    const set = new Set([1, 2, 3]);
    const originalIterator = set[Symbol.iterator];
    set[Symbol.iterator] = function* () { yield* [4, 5, 6]; };

    const entries = Array.from(set.entries());

    set[Symbol.iterator] = originalIterator;
    return entries;
}
export function SetEntriesTest054(){
    function* generator1() { yield 1; }
    function* generator2() { yield 2; }
    const set = new Set([generator1, generator2]);
    const entries = Array.from(set.entries());

    expect(entries).assertDeepEquals([[generator1, generator1], [generator2, generator2]]);
    expect(entries.length).assertEqual(2);

    return [entries[0][0] === generator1, entries[0][1] === generator1, entries[1][0] === generator2, entries[1][1] === generator2, entries.length ];
}
export function SetEntriesTest056(){
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    const set = new Set([proxy]);
    const entries = Array.from(set.entries());
    return entries[0][0].a;
}
export function SetEntriesTest073(){
    const set = new Set([Map]);
    const entries = Array.from(set.entries());

    const map = new entries[0][0]();
    map.set('key', 'value');
    return map;
}
export function SetEntriesTest075(obj){
    const set = new Set([WeakMap]);
    const entries = Array.from(set.entries());

    const weakMap = new entries[0][0]();
    weakMap.set(obj, 'value');
    return weakMap;
}
export async function SetEntriesTest078(){
    const set = new Set([Promise]);
    const entries = Array.from(set.entries());

    const promise = new entries[0][0](resolve => resolve('test'));
    const result = await promise;
    return result;
}
export function SetEntriesTest079(){
    const set = new Set([Reflect]);
    const entries = Array.from(set.entries());

    const obj = { a: 1 };
    return entries[0][0].get(obj, 'a');
}
export function SetEntriesTest080(){
    const set = new Set([Proxy]);
    const entries = Array.from(set.entries());

    const target = { a: 1 };
    const proxy = new entries[0][0](target, {});
    return proxy.a;
}

export function SetEntriesTest096(){
    if (typeof URL === 'undefined') {
        return;
    }

    const set = new Set([URL]);
    const entries = Array.from(set.entries());

    const url = new entries[0][0]('https://example.com');
    return url.href;
}
export function SetEntriesTest097(){
    if (typeof URLSearchParams === 'undefined') {
        return;
    }

    const set = new Set([URLSearchParams]);
    const entries = Array.from(set.entries());

    const params = new entries[0][0]('a=1&b=2');
    return params.get('a');
}
export function SetEntriesTest098(){
    if (typeof Headers === 'undefined') {
        return;
    }

    const set = new Set([Headers]);
    const entries = Array.from(set.entries());

    const headers = new entries[0][0]();
    headers.append('Content-Type', 'text/plain');
    return headers.get('Content-Type');
}
export function SetEntriesTest099(){
    if (typeof Request === 'undefined') {
        return;
    }

    const set = new Set([Request]);
    const entries = Array.from(set.entries());

    const request = new entries[0][0]('https://example.com');
    return request.url;
}
export function SetEntriesTest100(){
    if (typeof Response === 'undefined') {
        return undefined;
    }

    const set = new Set([Response]);
    const entries = Array.from(set.entries());

    const response = new entries[0][0]('Hello world');
    return response.status;
}