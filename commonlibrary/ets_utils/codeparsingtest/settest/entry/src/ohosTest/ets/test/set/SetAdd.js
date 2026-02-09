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
export function SetAddTest027(){
    const set = new Set();
    const sym1 = Symbol('key');
    const sym2 = Symbol('key');
    set.add(sym1).add(sym2);
    return [set.size, set.has(sym1) && set.has(sym2)]
}

export function SetAddTest063(){
    const set = new Set();
    const sym1 = Symbol.for('shared');
    const sym2 = Symbol.for('shared');
    set.add(sym1).add(sym2);
    return [set.size, set.has(sym1) && set.has(sym2)]
}

export function SetAddTest065(){
    const set = new Set();
    const sym = Symbol('prop');
    const obj1 = { [sym]: 'value' };
    const obj2 = { [sym]: 'value' };
    set.add(obj1).add(obj2);
    return [set.size, set.has(obj1) && set.has(obj2)]
}

export function SetAddTest067(){
    const set = new Set();
    const obj1 = Object.freeze({ prop: 1 });
    const obj2 = Object.freeze({ prop: 1 });
    set.add(obj1).add(obj2);
    return [set.size, set.has(obj1) && set.has(obj2)]
}

export function SetAddTest068(){
    const set = new Set();
    const obj1 = { prop: 1 };
    const obj2 = { prop: 1 };
    Object.seal(obj1);
    Object.seal(obj2);
    set.add(obj1).add(obj2);
    return [set.size, set.has(obj1) && set.has(obj2)]
}

export function SetAddTest069(){
    const set = new Set();
    const obj = { id: 1 };
    const arr1 = [obj];
    const arr2 = [obj];
    const arr3 = [{ id: 1 }];
    set.add(arr1).add(arr2).add(arr3);
    return [set.size, set.has(arr1) && set.has(arr2) && set.has(arr3)]
}

export function SetAddTest078(){
    const set = new Set();
    [1, 2, 3, 4, 5].forEach(num => set.add(num));
    return [set.size, [...set]]
}

export function SetAddTest081(){
    const set = new Set();
    set.add(Symbol.iterator);
    return [set.size, set.has(Symbol.iterator)]
}

export function SetAddTest082(){
    const set = new Set();
    set.add(Symbol.toStringTag);
    return [set.size, set.has(Symbol.toStringTag)]
}

export function SetAddTest090(){
    const iterable = {
        *[Symbol.iterator]() {
            yield 'a';
            yield 'b';
            yield 'c';
        }
    };

    const set = new Set(iterable);
    set.add('d');
    return [set.size, set.has('a') && set.has('d')]
}

export function SetAddTest091(){
    const set = new Set();
    set.add('apple').add('banana');
    return [...set];
}

export function SetAddTest094(){
    const set = new Set();
    const obj = {};
    set.add(obj);

    let found = false;
    for (const item of set) {
        if (Object.is(item, obj)) {
            found = true;
            break;
        }
    }
    return found;
}

export function SetAddTest096(){
    const set = new Set();

    set.add('outer');

    (function() {
        set.add('function');
    })();

    {
        set.add('block');
    }
    return [set.size, set.has('outer') && set.has('function') && set.has('block')]
}

export function SetAddTest097(){
    const set = new Set();
    set.add(1).add('two').add(true);
    return [...set];
}

export function SetAddTest099(originalSet){
    return new Set(JSON.parse(JSON.stringify([...originalSet])));
}

export function SetAddTest100(){
    const set = new Set();

    set.add('string').add(123).add(-45.67).add(true).add(null).add(undefined);

    set.add(NaN).add(Infinity).add(-Infinity).add(0).add(-0);

    const obj = { prop: 'value' };
    const arr = [1, 2, 3];
    const date = new Date();
    const regex = /test/;
    const sym = Symbol('test');
    const bigInt = 12345678901234567890n;

    set.add(obj).add(arr).add(date).add(regex).add(sym).add(bigInt);
    return [set.size, set.has('string') && set.has(NaN) && set.has(obj) && set.has(arr) && set.has(sym) && set.has(bigInt)];
}