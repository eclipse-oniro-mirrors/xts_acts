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
export function SetHasTest013(){
    const sym1 = Symbol('test');
    const sym2 = Symbol('test');
    const set = new Set([sym1]);
    const result1 = set.has(sym1);
    const result2 = set.has(sym2);
    return [result1, result2];
}
export function SetHasTest025(){
    const arr = [1, 2, 3];

    const tempSet = new Set(arr);

    const result1 = Set.prototype.has.call(tempSet, 2);
    const result2 = Set.prototype.has.call(tempSet, 4);
    return [result1, result2];
}
export function SetHasTest027(){
    const set = new Set([1, 2, 3]);
    Object.freeze(set);

    const result = set.has(2);
    return [result, Object.isFrozen(set)];
}
export function SetHasTest030(){
    const sym = Symbol('test');
    const obj = { id: 1 };
    const set = new Set([
        'string', 100, true, null, sym, obj, NaN, 0, -0, 123n
    ]);

    const boo1 = set.has('string')
    const boo2 = set.has(100)
    const boo3 = set.has(NaN)
    const boo4 = set.has(-0)
    const boo5 = set.has(sym)
    const boo6 = set.has(obj)

    obj.id = 2;
    const boo7 = set.has(obj)

    set.delete(100);
    const boo8 = set.has(100)

    set.add('new');
    const boo9 = set.has('new')

    const boo10 = set.has('missing')
    const boo11 = set.has(200)
    const boo12 = set.has(Symbol('test'))
    const boo13 = set.has({ id: 2 })
    return [boo1, boo2, boo3, boo4, boo5, boo6, boo7, boo8, boo9, boo10, boo11, boo12, boo13];
}
export function SetHasTest031(){
    const parent = { a: 1 };
    const child = Object.create(parent);
    const set = new Set([child]);

    const result1 = set.has(child);
    const result2 = set.has(parent);

    return [result1, result2];
}
export function SetHasTest042(){
    function funcDecl() {}
    const funcExpr = function() {};
    const arrowFunc = () => {};
    const set = new Set([funcDecl, funcExpr, arrowFunc]);

    return [set.has(funcDecl), set.has(funcExpr), set.has(arrowFunc), set.has(function() {})];
}
export function SetHasTest047(){
    const sym1 = Symbol.for('key');
    const sym2 = Symbol.for('key');
    const sym3 = Symbol('key');
    const set = new Set([sym1]);

    return [set.has(sym1), set.has(sym2), set.has(sym3)];
}
export function SetHasTest052(obj){
    Object.seal(obj);
}
export function SetHasTest053(obj){
    Object.freeze(obj);
}
export function SetHasTest054(obj){
    Object.setPrototypeOf(obj, { newProp: true });
}
export function SetHasTest056(){
    const sym = Symbol('prop');
    const obj1 = { [sym]: 'value' };
    const obj2 = { [sym]: 'value' };
    const set = new Set([obj1]);

    return [set.has(obj1), set.has(obj2)]
}
export function SetHasTest059(){
    function* generator() { yield 1; }
    const gen = generator();
    const set = new Set([gen, generator]);

    return [set.has(gen), set.has(generator), set.has(generator())]
}
export function SetHasTest078(){
    const sym = Symbol('test');
    const set = new Set([sym, 'test']);

    return [set.has(sym), set.has('test'), set.has(Symbol('test'))]
}
export function SetHasTest081(){
    const obj1 = {
        value: 123,
        valueOf() { return this.value; }
    };
    const obj2 = {
        value: 123,
        valueOf() { return this.value; }
    };
    const set = new Set([obj1]);

    return [set.has(obj1), set.has(obj2)];
}
export function SetHasTest082(){
    const obj1 = {
        toString() { return "same"; }
    };
    const obj2 = {
        toString() { return "same"; }
    };
    const set = new Set([obj1]);

    return [set.has(obj1), set.has(obj2)];
}
export function SetHasTest085(){
    const obj = { a: 1 };
    const set = new Set([obj]);

    obj.b = 2;
    obj.c = 3;

    return set.has(obj);
}
export function SetHasTest086(){
    const obj = { a: 1, b: 2 };
    const set = new Set([obj]);

    delete obj.a;

    return set.has(obj);
}
export function SetHasTest089(){
    const obj = Object.create(null);
    obj.prop = 'value';
    const set = new Set([obj]);

    return [set.has(obj), set.has(Object.create(null))];
}
export function SetHasTest090(){
    const target = { a: 1 };
    const handler = {
        get: function(target, prop) {
            return prop in target ? target[prop] : 3;
        }
    };
    const proxy = new Proxy(target, handler);
    const set = new Set([proxy]);

    return [set.has(proxy), set.has(target)];
}
export function SetHasTest094(){
    const set = new Set();
    const testValues = {
        number: 12345,
        string: 'test-string-123',
        boolean: true,
        null: null,
        undefined: undefined,
        symbol: Symbol('large-set-test'),
        object: { large: 'object' },
        array: [1, 2, 3, 4, 5],
        bigint: 9876543210123456789n,
        nan: NaN
    };

    for (let i = 0; i < 10000; i++) {
        set.add(i);
        set.add(`string-${i}`);
        set.add(i % 2 === 0);
        if (i % 100 === 0) {
            set.add(Symbol(`symbol-${i}`));
            set.add({ id: i });
        }
    }

    Object.values(testValues).forEach(value => set.add(value));

    return [set.has(testValues.number),
        set.has(testValues.string),
        set.has(testValues.boolean),
        set.has(testValues.null),
        set.has(testValues.undefined),
        set.has(testValues.symbol),
        set.has(testValues.object),
        set.has(testValues.array),
        set.has(testValues.bigint),
        set.has(testValues.nan)];
}
export function SetHasTest096(){
    const set = new Set();
    const symbols = [];

    for (let i = 0; i < 1000; i++) {
        const sym = Symbol(`symbol-${i}`);
        symbols.push(sym);
        set.add(sym);
    }
    return [set.has(symbols[500]), set.has(Symbol(`symbol-${500}`))];
}
export function SetHasTest098(){
    const largeArray = Array.from({ length: 10000 }, (_, i) => i);
    const set = new Set(largeArray);

    return [set.has(5000), set.has(10000)];
}
export function SetHasTest108(){
    const set = new Set([Symbol.iterator, Symbol.toStringTag, Symbol.asyncIterator]);
    return [set.has(Symbol.iterator), set.has(Symbol.toStringTag), set.has(Symbol.asyncIterator), set.has(Symbol.split)];
}
export function SetHasTest109(){
    const sym1 = Symbol.for('global-key');
    const sym2 = Symbol.for('another-key');
    const set = new Set([sym1]);

    return [set.has(sym1), set.has(Symbol.for('global-key')), set.has(sym2)];
}
export function SetHasTest110(){
    const obj1 = Object.create(null);
    obj1.prop = 'value';
    const obj2 = Object.create(null);
    obj2.prop = 'value';
    const set = new Set([obj1]);

    return [set.has(obj1), set.has(obj2)];
}
export function SetHasTest115(){
    class MyClass {
        static [Symbol.hasInstance](instance) {
            return instance.value === 123;
        }
    }

    const obj1 = new MyClass();
    obj1.value = 123;
    const obj2 = new MyClass();
    obj2.value = 123;
    const set = new Set([obj1]);

    return [set.has(obj1), set.has(obj2)];
}
export function SetHasTest116(){
    const obj1 = {
        [Symbol.toPrimitive]() {
            return 123;
        }
    };
    const obj2 = {
        [Symbol.toPrimitive]() {
            return 123;
        }
    };
    const set = new Set([obj1]);

    return [set.has(obj1), set.has(obj2), set.has(123)];
}
export function SetHasTest120(){
    const { proxy, revoke } = Proxy.revocable({}, {});
    const set = new Set([proxy]);

    const boo1 = set.has(proxy);
    revoke();
    const boo2 = set.has(proxy);

    return [boo1, boo2];
}
export function SetHasTest123(){
    const fakeSet = {
        has: function(value) {
            return [1, 2, 3].includes(value);
        }
    };

    function callSetHas(obj, value) {
        if (obj instanceof Set) {
            return Set.prototype.has.call(obj, value);
        }
        if (typeof obj.has === 'function') {
            return obj.has(value);
        }
        return false;
    }

    const result1 = callSetHas(fakeSet, 2);
    const result2 = callSetHas(fakeSet, 4);

    return [result1, result2];
}
export function SetHasTest124(){
    const set1 = new Set([1, 2, 3]);
    const set2 = new Set([4, 5, 6]);

    const result1 = Set.prototype.has.call(set1, 2);
    const result2 = Set.prototype.has.call(set2, 2);

    return [result1, result2];
}
export function SetHasTest127(){
    const set = new Set([1, 2, 3]);
    const originalHas = Set.prototype.has;

    Set.prototype.has = function(value) {
        return value === 42;
    };
    const boo1 = set.has(2);
    const boo2 = set.has(42);
    Set.prototype.has = originalHas;

    return [boo1, boo2, set.has(2), set.has(42)];
}
export function SetHasTest128(){
    const set = new Set([1, 2, 3]);

    Object.prototype.polluted = true;

    const boo1 = set.has('polluted');
    const boo2 = set.has(2);
    delete Object.prototype.polluted;

    return [boo1, boo2, set.has('polluted'), set.has(2)];
}
export function SetHasTest129(){
    const sym = Symbol('hidden-property');
    const set = new Set([1, 2, 3]);

    set[sym] = 'value';

    return [set.has(sym), set.has(2), set[sym]];
}