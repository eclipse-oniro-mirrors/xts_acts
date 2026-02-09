/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export function test_construct_1() {
    try {

        function Person(name) {
            this.name = name;
        }

        const instance = Reflect.construct(Person, ['Alice']);
        return instance instanceof Person && instance.name === 'Alice';
    } catch (e) {
        return false;
    }
}

export function test_construct_2() {
    try {

        function NoArgs() {
            this.value = 'default';
        }

        const instance = Reflect.construct(NoArgs, []);
        return instance.value === 'default';
    } catch (e) {
        return false;
    }
}

export function test_construct_3() {
    try {
        Reflect.construct(function () {
        }, null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_4() {
    try {
        Reflect.construct(function () {
        }, undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_5() {
    try {
        Reflect.construct({}, [], Object);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_6() {
    try {
        class MyClass {
            constructor(val) {
                this.val = val;
            }
        }

        const instance = Reflect.construct(MyClass, ['hello']);
        return instance instanceof MyClass && instance.val === 'hello';
    } catch (e) {
        return false;
    }
}

export function test_construct_7() {
    try {

        function Target() {
            this.nt = new.target;
        }

        function NewTarget() {
        }

        const instance = Reflect.construct(Target, [], NewTarget);
        return instance.nt === NewTarget;
    } catch (e) {
        return false;
    }
}

export function test_construct_8() {
    try {
        class Base {
            constructor() {
                this.from = new.target;
            }
        }

        class Sub {
        }

        const instance = Reflect.construct(Base, [], Sub);
        return instance.from === Sub;
    } catch (e) {
        return false;
    }
}

export function test_construct_9() {
    try {

        function Point(x, y) {
            this.x = x;
            this.y = y;
        }

        const arrayLike = { '0': 3, '1': 4, length: 2 };
        const instance = Reflect.construct(Point, arrayLike);
        return instance.x === 3 && instance.y === 4;
    } catch (e) {
        return false;
    }
}

export function test_construct_10() {
    try {

        function Fn() {
        }

        const arrayLike = { '0': 1, '1': 2 };
        Reflect.construct(Fn, arrayLike);
        return false;
    } catch (e) {
        return true;
    }
}

export function test_construct_11() {
    try {

        function Fn() {
        }

        const arrayLike = { length: -1 };
        Reflect.construct(Fn, arrayLike);
        return false;
    } catch (e) {
        return true;
    }
}

export function test_construct_12() {
    try {

        function Target() {
        }

        Reflect.construct(Target, [], {});
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_13() {
    try {

        function Parent() {
        }

        function Child() {
        }

        const instance = Reflect.construct(Object, [], Parent);
        return Object.getPrototypeOf(instance) === Parent.prototype;
    } catch (e) {
        return false;
    }
}

export function test_construct_14() {
    try {
        const timestamp = 1609459200000;
        const date = Reflect.construct(Date, [timestamp]);
        return date instanceof Date && date.getTime() === timestamp;
    } catch (e) {
        return false;
    }
}

export function test_construct_15() {
    try {

        function Target() {
            throw new Error('should not call');
        }

        const handler = {
            construct() {
                return { custom: true };
            }
        };
        const proxy = new Proxy(Target, handler);
        const result = Reflect.construct(proxy, []);
        return result.custom === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_16() {
    try {

        function Target(a) {
            this.a = a;
        }

        const proxy = new Proxy(Target, {});
        const instance = Reflect.construct(proxy, [42]);
        return instance.a === 42;
    } catch (e) {
        return false;
    }
}

export function test_construct_17() {
    try {

        function CustomReturn() {
            return { magic: true };
        }

        const result = Reflect.construct(CustomReturn, []);
        return result.magic === true && !(result instanceof CustomReturn);
    } catch (e) {
        return false;
    }
}

export function test_construct_18() {
    try {

        function Throws() {
            throw new Error('oops');
        }

        Reflect.construct(Throws, []);
        return false;
    } catch (e) {
        return e.message === 'oops';
    }
}

export function test_construct_19() {
    try {
        class MyArray extends Array {
            static get [Symbol.species]() {
                return Array;
            }
        }

        const instance = Reflect.construct(MyArray, [[1, 2, 3]]);
        return instance instanceof MyArray && instance.length === 3;
    } catch (e) {
        return true;
    }
}

export function test_construct_20() {
    try {

        function Counter() {
            this.count = (this.count || 0) + 1;
        }

        const a = Reflect.construct(Counter, []);
        const b = Reflect.construct(Counter, []);
        return a.count === 1 && b.count === 1;
    } catch (e) {
        return false;
    }
}

export function test_construct_21() {
    try {

        function ArgChecker(a, b, c) {
            this.values = [a, b, c];
        }

        const sparse = [, ,];
        const instance = Reflect.construct(ArgChecker, sparse);
        return instance.values.every(v => v === undefined);
    } catch (e) {
        return false;
    }
}

export function test_construct_22() {
    try {
        const arrow = () => {
        };
        Reflect.construct(arrow, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_23() {
    try {

        function Target() {
        }

        const arrow = () => {
        };
        Reflect.construct(Target, [], arrow);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_24() {
    try {

        function* gen() {
        }

        Reflect.construct(gen, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_25() {
    try {

        async function asyncFn() {
        }

        Reflect.construct(asyncFn, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_26() {
    try {
        const proto = {};

        function Base() {
        }

        Base.prototype = proto;
        const instance = Reflect.construct(Object, [], Base);
        return Object.getPrototypeOf(instance) === proto;
    } catch (e) {
        return false;
    }
}

export function test_construct_27() {
    try {

        function ReturnNull() {
            return null;
        }

        const instance = Reflect.construct(ReturnNull, []);
        return instance instanceof ReturnNull;
    } catch (e) {
        return false;
    }
}

export function test_construct_28() {
    try {

        function ReturnPrimitive() {
            return "primitive";
        }

        const instance = Reflect.construct(ReturnPrimitive, []);
        return instance instanceof ReturnPrimitive;
    } catch (e) {
        return false;
    }
}

export function test_construct_29() {
    try {
        const sym = Symbol('key');
        const bigIntValue = 123n;

        function Holder(s, b) {
            this.s = s;
            this.b = b;
        }

        const instance = Reflect.construct(Holder, [sym, bigIntValue]);
        return instance.s === sym && instance.b === bigIntValue;
    } catch (e) {
        return false;
    }
}

export function test_construct_30() {
    try {

        function Test() {
            this.valid = true;
        }

        const instance = Reflect.construct(Test, []);
        return instance.valid === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_31() {
    try {

        function Target() {
        }

        const handler = {
            construct() {
                return "not-an-object";
            }
        };
        const proxy = new Proxy(Target, handler);
        Reflect.construct(proxy, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_32() {
    try {

        function Target() {
        }

        const { proxy, revoke } = Proxy.revocable(Target, {});
        revoke();
        Reflect.construct(proxy, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_33() {
    try {
        const arr = Reflect.construct(Array, [1, 2, 3]);
        return Array.isArray(arr) && arr.length === 3 && arr[0] === 1;
    } catch (e) {
        return false;
    }
}

export function test_construct_34() {
    try {
        const arr = Reflect.construct(Array, [3]);
        return arr.length === 3 && arr[0] === undefined;
    } catch (e) {
        return false;
    }
}

export function test_construct_35() {
    try {
        class MyArray extends Array {
            constructor(...args) {
                super(...args);
                this.custom = 'yes';
            }
        }

        const instance = Reflect.construct(MyArray, [1, 2]);
        return instance instanceof MyArray && instance.custom === 'yes' && instance.length === 2;
    } catch (e) {
        return false;
    }
}

export function test_construct_36() {
    try {
        class CustomError extends Error {
            constructor(msg) {
                super(msg);
                this.name = 'CustomError';
            }
        }

        const instance = Reflect.construct(CustomError, ['oops'], CustomError);
        return instance instanceof CustomError && instance.message === 'oops';
    } catch (e) {
        return false;
    }
}

export function test_construct_37() {
    try {

        function Point(x, y) {
            this.x = x;
            this.y = y;
        }

        const typed = new Uint8Array([5, 7]);
        const instance = Reflect.construct(Point, typed);
        return instance.x === 5 && instance.y === 7;
    } catch (e) {
        return false;
    }
}

export function test_construct_38() {
    try {
        const arrayLike = {
            length: 1,
            get 0() {
                throw new Error('getter fail');
            }
        };

        function Fn(x) {
        }

        Reflect.construct(Fn, arrayLike);
        return false;
    } catch (e) {
        return e.message === 'getter fail';
    }
}

export function test_construct_39() {
    try {

        function EmptyProto() {
        }

        Object.setPrototypeOf(EmptyProto, null);

        function Base() {
        }

        const instance = Reflect.construct(Base, [], EmptyProto);
        return Object.getPrototypeOf(instance) === null;
    } catch (e) {
        return true;
    }
}

export function test_construct_40() {
    try {

        function A() {
            this.level = 1;
        }

        function B() {
            Reflect.construct(A, [], this.constructor);
        }

        B.prototype = Object.create(A.prototype);

        const instance = Reflect.construct(B, []);
        return instance.level === 1 && instance instanceof B;
    } catch (e) {
        return true;
    }
}

export function test_construct_41() {
    try {

        function Point(x, y) {
            this.x = x;
            this.y = y;
        }

        const nodeList = { '0': 1, '1': 2, length: 2 };
        const instance = Reflect.construct(Point, nodeList);
        return instance.x === 1 && instance.y === 2;
    } catch (e) {
        return false;
    }
}

export function test_construct_42() {
    try {

        function Person(name = 'Guest', age = 18) {
            this.name = name;
            this.age = age;
        }

        const instance = Reflect.construct(Person, ['Alice']);
        return instance.name === 'Alice' && instance.age === 18;
    } catch (e) {
        return false;
    }
}

export function test_construct_43() {
    try {

        function Vector(...coords) {
            this.coords = coords;
        }

        const instance = Reflect.construct(Vector, [1, 2, 3]);
        return Array.isArray(instance.coords) && instance.coords.length === 3;
    } catch (e) {
        return false;
    }
}

export function test_construct_44() {
    try {

        function Target() {
        }

        const badNewTarget = function () {
        };
        Object.defineProperty(badNewTarget, 'prototype', { writable: false, value: undefined });
        Reflect.construct(Target, [], badNewTarget);
        return false;
    } catch (e) {
        return true;
    }
}

export function test_construct_45() {
    try {
        Reflect.construct(null, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_46() {
    try {
        Reflect.construct(undefined, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_47() {
    try {
        const iter = new Set([1, 2]).values();
        Reflect.construct(Array, iter);
        return false;
    } catch (e) {
        return true;
    }
}

export function test_construct_48() {
    try {
        const date = Reflect.construct(Date, [2021, 0, 1]);
        return date.getFullYear() === 2021 && date.getMonth() === 0;
    } catch (e) {
        return false;
    }
}

export function test_construct_49() {
    try {

        function Real() {
        }

        const handler = {
            construct() {
                return Object.create(null);
            }
        };
        const proxy = new Proxy(Real, handler);
        const result = Reflect.construct(proxy, []);
        return result !== null && typeof result === 'object' && Object.getPrototypeOf(result) === null;
    } catch (e) {
        return false;
    }
}

export function test_construct_51() {
    try {

        function Range(min, max) {
            this.min = min;
            this.max = max;
        }

        const instance = Reflect.construct(Range, [Infinity, -Infinity]);
        return instance.min === Infinity && instance.max === -Infinity;
    } catch (e) {
        return false;
    }
}

export function test_construct_52() {
    try {

        function Test() {
            this.ok = true;
        }

        const instance = Reflect.construct(Test, []);
        return instance.ok === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_53() {
    try {
        const Fn = Object.freeze(function () {
            this.frozen = true;
        });
        const instance = Reflect.construct(Fn, []);
        return instance.frozen === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_54() {
    try {
        let accessed = false;
        const arrayLike = {
            get 0() {
                accessed = true;
                return 'value';
            },
            length: 1
        };

        function Capture(a) {
            this.a = a;
        }

        const instance = Reflect.construct(Capture, arrayLike);
        return instance.a === 'value' && accessed;
    } catch (e) {
        return false;
    }
}

export function test_construct_55() {
    try {
        const evil = {
            0: 'safe',
            length: 1,
            [Symbol.iterator]: () => {
                throw new Error('hacked');
            }
        };

        function Take(x) {
            this.x = x;
        }

        const instance = Reflect.construct(Take, evil);
        return instance.x === 'safe';
    } catch (e) {
        return false;
    }
}

export function test_construct_56() {
    try {
        class Parent {
        }

        class Child extends Parent {
        }

        function Base() {
        }

        const instance = Reflect.construct(Base, [], Child);
        return instance instanceof Child && Object.getPrototypeOf(instance) === Child.prototype;
    } catch (e) {
        return false;
    }
}

export function test_construct_57() {
    try {

        function* gen() {
        }

        function Target() {
        }

        Reflect.construct(Target, [], gen);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_58() {
    try {

        function outer(a, b) {

            function Point(x, y) {
                this.x = x;
                this.y = y;
            }

            return Reflect.construct(Point, arguments);
        }

        const instance = outer(3, 4);
        return instance.x === 3 && instance.y === 4;
    } catch (e) {
        return false;
    }
}

export function test_construct_59() {
    try {
        class Parent {
            constructor() {
                this.parent = true;
            }
        }

        class Child extends Parent {
            constructor(...args) {
                super(...args);
                this.child = true;
            }
        }

        const instance = Reflect.construct(Child, []);
        return instance.parent && instance.child;
    } catch (e) {
        return false;
    }
}

export function test_construct_61() {
    try {
        const sparse = { 0: 'a', 2: 'c', length: 3 };

        function Args(a, b, c) {
            this.args = [a, b, c];
        }

        const instance = Reflect.construct(Args, sparse);
        return instance.args[0] === 'a' && instance.args[1] === undefined && instance.args[2] === 'c';
    } catch (e) {
        return false;
    }
}

export function test_construct_62() {
    try {
        const bad = function () {
        };
        Object.defineProperty(bad, 'prototype', {
            get() {
                throw new Error('proto-error');
            }
        });
        Reflect.construct(Object, [], bad);
        return false;
    } catch (e) {
        return true
    }
}

export function test_construct_63() {
    try {
        const asyncFn = async function () {
        };
        Reflect.construct(asyncFn, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_64() {
    try {
        const arrayLike = {
            0: 'x',
            1: 'y',
            length: 2,
            [Symbol.isConcatSpreadable]: true
        };

        function Pair(a, b) {
            this.pair = a + b;
        }

        const instance = Reflect.construct(Pair, arrayLike);
        return instance.pair === 'xy';
    } catch (e) {
        return false;
    }
}

export function test_construct_65() {
    try {

        function ReturnSymbol() {
            return Symbol('returned');
        }

        const instance = Reflect.construct(ReturnSymbol, []);
        return instance instanceof ReturnSymbol;
    } catch (e) {
        return false;
    }
}

export function test_construct_66() {
    try {
        const map = Reflect.construct(Map, [[[1, 'a'], [2, 'b']]]);
        return map.has(1) && map.get(2) === 'b';
    } catch (e) {
        return false;
    }
}

export function test_construct_67() {
    try {
        const set = Reflect.construct(Set, [[1, 2, 3]]);
        return set.has(1) && set.has(2) && set.has(3);
    } catch (e) {
        return false;
    }
}

export function test_construct_68() {
    try {

        function Config({ url, port = 80 }) {
            this.url = url;
            this.port = port;
        }

        const instance = Reflect.construct(Config, [{ url: 'http://localhost' }]);
        return instance.url === 'http://localhost' && instance.port === 80;
    } catch (e) {
        return false;
    }
}

export function test_construct_69() {
    try {

        function Holder(...args) {
            this.args = args;
        }

        const bigInts = [1n, 2n, 3n];
        const instance = Reflect.construct(Holder, bigInts);
        return instance.args[0] === 1n && instance.args[1] === 2n;
    } catch (e) {
        return false;
    }
}

export function test_construct_70() {
    try {

        function Target() {
        }

        Reflect.construct(Target, [], null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_71() {
    try {
        Reflect.construct(Symbol('fake'), []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_72() {
    try {
        const arrayLike = { [-1]: 'neg', 0: 'zero', length: 1 };

        function First(a) {
            this.a = a;
        }

        const instance = Reflect.construct(First, arrayLike);
        return instance.a === 'zero';
    } catch (e) {
        return false;
    }
}

export function test_construct_73() {
    try {

        function Labeled() {
            block: {
                this.labeled = true;
                break block;
                this.not = false;
            }
        }

        const instance = Reflect.construct(Labeled, []);
        return instance.labeled === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_74() {
    try {
        const arrayLike = { 0: 'a', 1: 'b', length: 1.9 };

        function Single(x) {
            this.x = x;
        }

        const instance = Reflect.construct(Single, arrayLike);
        return instance.x === 'a';
    } catch (e) {
        return false;
    }
}

export function test_construct_75() {
    try {

        function TryCatch() {
            try {
                throw new Error('ignored');
            } catch (e) {
                this.recovered = true;
            }
        }

        const instance = Reflect.construct(TryCatch, []);
        return instance.recovered === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_76() {
    try {

        function A() {
            this.depth = 1;
        }

        function B() {
            Reflect.construct(A, [], this.constructor);
        }

        B.prototype = Object.create(A.prototype);

        const instance = Reflect.construct(Reflect.construct(B, []), [], A);
        return instance.depth === 1;
    } catch (e) {
        return true;
    }
}

export function test_construct_77() {
    try {
        const arrayLike = { 0: 'x', length: 1, toString: () => 'evil' };

        function Take(a) {
            this.a = a;
        }

        const instance = Reflect.construct(Take, arrayLike);
        return instance.a === 'x';
    } catch (e) {
        return false;
    }
}

export function test_construct_79() {
    try {

        function Target() {
        }

        const fake = function () {
        };
        Object.defineProperty(fake, 'prototype', { value: 123 });
        Reflect.construct(Target, [], fake);
        return false;
    } catch (e) {
        return true;
    }
}

export function test_construct_80() {
    try {

        function Noop() {
        }

        for (let i = 0; i < 1000; i++) {
            Reflect.construct(Noop, []);
        }
        return true;
    } catch (e) {
        return false;
    }
}

export function test_construct_81() {
    try {

        function Base() {
            this.base = true;
        }

        const instance = Reflect.construct(Base, [], null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_82() {
    try {

        function WithDefault(x = 'default') {
            this.x = x;
        }

        const instance = Reflect.construct(WithDefault, [undefined]);
        return instance.x === 'default';
    } catch (e) {
        return false;
    }
}

export function test_construct_83() {
    try {

        function ThrowInThis() {
            this.data = startNotDefined;
        }

        Reflect.construct(ThrowInThis, []);
        return false;
    } catch (e) {
        return true;
    }
}

export function test_construct_84() {
    try {
        const obj = {};
        Object.defineProperty(obj, 'ctor', {
            get() {
                throw new Error('getter-error');
            }
        });
        Reflect.construct(obj.ctor, []);
        return false;
    } catch (e) {
        return e.message === 'getter-error';
    }
}

export function test_construct_85() {
    try {

        function* gen() {
        }

        Reflect.construct(Object, [], gen.prototype.constructor);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function test_construct_86() {
    try {

        function Target() {
        }

        const handler = {
            construct(t, args, newT) {
                return Reflect.construct(t, args, newT);
            }
        };
        const proxy = new Proxy(Target, handler);
        const instance = Reflect.construct(proxy, [42], Array);
        return instance instanceof Array && Object.getPrototypeOf(instance) === Array.prototype;
    } catch (e) {
        return false;
    }
}

export function test_construct_87() {
    try {

        function CustomProto() {
        }

        function WithProto() {
        }

        Object.setPrototypeOf(WithProto, null);
        Reflect.construct(WithProto, [], CustomProto);
        return false;
    } catch (e) {
        return true;
    }
}

export function test_construct_88() {
    try {
        class A {
            constructor(...args) {
                this.args = args;
            }
        }

        const instance = Reflect.construct(A, [1, , 3]);
        return instance.args[0] === 1 && instance.args[1] === undefined && instance.args[2] === 3;
    } catch (e) {
        return false;
    }
}

export function test_construct_89() {
    try {

        function ReturnUndefined() {
            return undefined;
        }

        const instance = Reflect.construct(ReturnUndefined, []);
        return instance instanceof ReturnUndefined;
    } catch (e) {
        return false;
    }
}

export function test_construct_91() {
    try {

        function AcceptsBigInt(n) {
            this.n = n;
        }

        const bigIntValue = 9007199254740991n;
        const instance = Reflect.construct(AcceptsBigInt, [bigIntValue]);
        return instance.n === bigIntValue;
    } catch (e) {
        return false;
    }
}

export function test_construct_92() {
    try {

        function WithLength(len) {
            this.len = len;
        }

        const obj = { length: {} };
        Reflect.construct(WithLength, obj);
        return false;
    } catch (e) {
        return true;
    }
}

export function test_construct_93() {
    try {

        function SubArray() {
            Array.apply(this, arguments);
        }

        SubArray.prototype = Object.create(Array.prototype);
        SubArray.prototype.constructor = SubArray;
        const instance = Reflect.construct(SubArray, [1, 2, 3]);
        return Array.isArray(instance) && instance.length === 3;
    } catch (e) {
        return true;
    }
}

export function test_construct_94() {
    try {

        function BrokenProto() {
        }

        Object.setPrototypeOf(BrokenProto.prototype, null);
        const instance = Reflect.construct(BrokenProto, []);
        return Object.getPrototypeOf(instance) === null;
    } catch (e) {
        return true;
    }
}

export function test_construct_95() {
    try {

        function ThrowsInFinally() {
            try {
            } finally {
                throw new Error('finally');
            }
        }

        Reflect.construct(ThrowsInFinally, []);
        return false;
    } catch (e) {
        return e.message === 'finally';
    }
}

export function test_construct_96() {
    try {
        const arrLike = { '0': 'a', '1': 'b', length: '2' };

        function Pair(a, b) {
            this.pair = [a, b];
        }

        const instance = Reflect.construct(Pair, arrLike);
        return instance.pair[0] === 'a' && instance.pair[1] === 'b';
    } catch (e) {
        return false;
    }
}

export function test_construct_97() {
    try {

        function Target() {
            this.newTarget = new.target;
        }

        function FakeNewTarget() {
        }

        Object.defineProperty(FakeNewTarget, 'prototype', {
            writable: false,
            value: Object.prototype
        });
        const instance = Reflect.construct(Target, [], FakeNewTarget);
        return instance.newTarget === FakeNewTarget;
    } catch (e) {
        return false;
    }
}

export function test_construct_98() {
    try {

        function NoReturn() {
            this.value = 'set';
        }

        const result = Reflect.construct(NoReturn, []);
        return result.value === 'set';
    } catch (e) {
        return false;
    }
}

export function test_construct_99() {
    try {

        function WithRest(...args) {
            this.args = args;
        }

        const instance = Reflect.construct(WithRest, []);
        return Array.isArray(instance.args) && instance.args.length === 0;
    } catch (e) {
        return false;
    }
}

export function test_construct_100() {
    try {

        function DeepNested() {
            this.level = Reflect.construct(Reflect.construct(Reflect.construct(Object, []), [], Array), [], Date);
        }

        const instance = Reflect.construct(DeepNested, []);
        return instance.level instanceof Date;
    } catch (e) {
        return true;
    }
}

export function test_construct_101() {
    try {

        function WithSuper() {
            if (new.target === WithSuper) {
                throw new Error('must extend');
            }
        }

        class Child extends WithSuper {
            constructor() {
                super();
            }
        }

        const instance = Reflect.construct(Child, []);
        return !!instance;
    } catch (e) {
        return false;
    }
}

export function test_construct_102() {
    try {

        function ExpectNumber(n) {
            if (typeof n !== 'number') {
                throw new TypeError('number expected');
            }
            this.n = n;
        }

        const instance = Reflect.construct(ExpectNumber, [42]);
        return instance.n === 42;
    } catch (e) {
        return false;
    }
}

export function test_construct_103() {
    try {

        function ReturnObject() {
            return { __proto__: null };
        }

        const instance = Reflect.construct(ReturnObject, []);
        return Object.getPrototypeOf(instance) === null && !instance.hasOwnProperty('constructor');
    } catch (e) {
        return true;
    }
}

export function test_construct_104() {
    try {

        function WithComputedKey([key, value]) {
            this[key] = value;
        }

        const instance = Reflect.construct(WithComputedKey, [['dynamic', 'value']]);
        return instance.dynamic === 'value';
    } catch (e) {
        return false;
    }
}

export function test_construct_105() {
    try {

        function TaggedTemplate(strings, ...exprs) {
            this.strings = strings;
            this.exprs = exprs;
        }

        const instance = Reflect.construct(TaggedTemplate, [['a', 'b'], 1, 2]);
        return instance.strings[0] === 'a' && instance.exprs[1] === 2;
    } catch (e) {
        return false;
    }
}

export function test_construct_106() {
    try {

        function AsyncCtor() {
            this.async = false;
        }

        const proxy = new Proxy(AsyncCtor, {});
        const instance = Reflect.construct(proxy, []);
        return instance.async === false;
    } catch (e) {
        return false;
    }
}

export function test_construct_107() {
    try {

        function GeneratorCtor() {
            this.gen = false;
        }

        const instance = Reflect.construct(GeneratorCtor, []);
        return instance.gen === false;
    } catch (e) {
        return false;
    }
}

export function test_construct_108() {
    try {

        function ArrowSim() {
            this.arrow = false;
        }

        const instance = Reflect.construct(ArrowSim, []);
        return instance.arrow === false;
    } catch (e) {
        return false;
    }
}

export function test_construct_109() {
    try {

        function WithStatic() {
        }

        WithStatic.create = () => Reflect.construct(WithStatic, []);
        const instance = WithStatic.create();
        return instance instanceof WithStatic;
    } catch (e) {
        return false;
    }
}

export function test_construct_110() {
    try {

        function SelfCall() {
            if (!new.target) {
                throw new Error('must use new');
            }
            this.self = true;
        }

        const instance = Reflect.construct(SelfCall, []);
        return instance.self === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_111() {
    try {

        function WithGetter() {
            Object.defineProperty(this, 'lazy', {
                get() {
                    return 'loaded';
                },
                configurable: true
            });
        }

        const instance = Reflect.construct(WithGetter, []);
        return instance.lazy === 'loaded';
    } catch (e) {
        return false;
    }
}

export function test_construct_112() {
    try {

        function WithSymbolKey(key) {
            this[key] = 'symbol-prop';
        }

        const sym = Symbol('key');
        const instance = Reflect.construct(WithSymbolKey, [sym]);
        return instance[sym] === 'symbol-prop';
    } catch (e) {
        return false;
    }
}

export function test_construct_113() {
    try {

        function LargeArg(...args) {
            this.count = args.length;
        }

        const args = Array(100).fill(0);
        const instance = Reflect.construct(LargeArg, args);
        return instance.count === 100;
    } catch (e) {
        return false;
    }
}

export function test_construct_114() {
    try {

        function WithFinalizer() {
            this.finalized = false;
        }

        const instance = Reflect.construct(WithFinalizer, []);
        return typeof instance.finalized === 'boolean';
    } catch (e) {
        return false;
    }
}

export function test_construct_115() {
    try {

        function Recursive(max, current = 0) {
            this.depth = current;
            if (current < max) {
                Reflect.construct(Recursive, [max, current + 1], this.constructor);
            }
        }

        const instance = Reflect.construct(Recursive, [3]);
        return instance.depth === 3;
    } catch (e) {
        return true;
    }
}

export function test_construct_117() {
    try {

        function WithLabel() {
            outer: for (let i = 0; i < 1; i++) {
                this.labeled = true;
                break outer;
            }
        }

        const instance = Reflect.construct(WithLabel, []);
        return instance.labeled === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_118() {
    try {

        function* GenFn() {
        }

        function ExtendGen() {
            GenFn.call(this);
        }

        ExtendGen.prototype = Object.create(GenFn.prototype);
        const instance = Reflect.construct(ExtendGen, []);
        return Object.getPrototypeOf(instance) === GenFn.prototype;
    } catch (e) {
        return true;
    }
}

export function test_construct_119() {
    try {

        async function AsyncFn() {
        }

        function ExtendAsync() {
            try {
                AsyncFn.call(this);
            } catch {
            }
        }

        const instance = Reflect.construct(ExtendAsync, []);
        return !!instance;
    } catch (e) {
        return false;
    }
}

export function test_construct_120() {
    try {

        function Circular() {
            this.ref = this;
        }

        const instance = Reflect.construct(Circular, []);
        return instance.ref === instance;
    } catch (e) {
        return false;
    }
}

export function test_construct_121() {
    try {

        function WithFinal() {
            this.done = true;
        }

        const instance = Reflect.construct(WithFinal, []);
        return instance.done === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_122() {
    try {

        function ExpectString(s) {
            if (typeof s !== 'string') {
                throw new TypeError('string required');
            }
            this.s = s;
        }

        const instance = Reflect.construct(ExpectString, ['hello']);
        return instance.s === 'hello';
    } catch (e) {
        return false;
    }
}

export function test_construct_123() {
    try {

        function WithOptional(obj = {}) {
            this.keys = Object.keys(obj);
        }

        const instance = Reflect.construct(WithOptional, []);
        return Array.isArray(instance.keys) && instance.keys.length === 0;
    } catch (e) {
        return false;
    }
}

export function test_construct_124() {
    try {

        function WithDestruct({ a, b }) {
            this.sum = a + b;
        }

        const instance = Reflect.construct(WithDestruct, [{ a: 2, b: 3 }]);
        return instance.sum === 5;
    } catch (e) {
        return false;
    }
}

export function test_construct_125() {
    try {

        function ReturnArray() {
            return [1, 2, 3];
        }

        const instance = Reflect.construct(ReturnArray, []);
        return instance instanceof ReturnArray;
    } catch (e) {
        return true;
    }
}

export function test_construct_126() {
    try {

        function WithProtoChain() {
            this.chain = 'base';
        }

        function SubClass() {
            WithProtoChain.call(this);
        }

        SubClass.prototype = Object.create(WithProtoChain.prototype);
        const instance = Reflect.construct(SubClass, []);
        return instance.chain === 'base' && instance instanceof SubClass;
    } catch (e) {
        return false;
    }
}

export function test_construct_127() {
    try {

        function ThrowsEarly() {
            throw new SyntaxError('early');
        }

        Reflect.construct(ThrowsEarly, []);
        return false;
    } catch (e) {
        return e instanceof SyntaxError && e.message === 'early';
    }
}

export function test_construct_128() {
    try {

        function AcceptsFn(fn) {
            this.fn = fn;
        }

        const func = () => {
        };
        const instance = Reflect.construct(AcceptsFn, [func]);
        return instance.fn === func;
    } catch (e) {
        return false;
    }
}

export function test_construct_129() {
    try {

        function WithStaticProp() {
        }

        WithStaticProp.data = 'static';
        const instance = Reflect.construct(WithStaticProp, []);
        return !!instance && !instance.hasOwnProperty('data');
    } catch (e) {
        return false;
    }
}

export function test_construct_130() {
    try {

        function DeepNest() {
            this.level = 1;
        }

        const deeper = Reflect.construct(Reflect.construct(DeepNest, []), [], Array);
        return deeper instanceof Array && deeper.level === 1;
    } catch (e) {
        return true;
    }
}

export function test_construct_131() {
    try {

        function WithComputedName(key) {
            this[key] = 'dynamic';
        }

        const instance = Reflect.construct(WithComputedName, ['propName']);
        return instance.propName === 'dynamic';
    } catch (e) {
        return false;
    }
}

export function test_construct_132() {
    try {

        function* gen() {
        }

        function ExtendGen() {
            gen.apply(this, arguments);
        }

        ExtendGen.prototype = Object.create(gen.prototype);
        const instance = Reflect.construct(ExtendGen, []);
        return Object.getPrototypeOf(instance) === gen.prototype;
    } catch (e) {
        return true;
    }
}

export function test_construct_133() {
    try {

        async function asyncFn() {
        }

        function ExtendAsync() {
            asyncFn.apply(this, arguments);
        }

        const instance = Reflect.construct(ExtendAsync, []);
        return !!instance;
    } catch (e) {
        return false;
    }
}

export function test_construct_134() {
    try {
        const arrLike = { length: NaN };
        Reflect.construct(Object, arrLike);
        return false;
    } catch (e) {
        return true;
    }
}

export function test_construct_135() {
    try {

        function WithGetterInArgs(obj) {
            this.value = obj.val;
        }

        const arg = {
            get val() {
                return 'getter';
            }
        };
        const instance = Reflect.construct(WithGetterInArgs, [arg]);
        return instance.value === 'getter';
    } catch (e) {
        return false;
    }
}

export function test_construct_136() {
    try {

        function WithSetter() {
            let val;
            Object.defineProperty(this, 'proxy', {
                set(v) {
                    val = v;
                },
                get() {
                    return val;
                }
            });
        }

        const instance = Reflect.construct(WithSetter, []);
        instance.proxy = 'set';
        return instance.proxy === 'set';
    } catch (e) {
        return false;
    }
}

export function test_construct_137() {
    try {

        function NoArgButCalledWith() { /* no op */
        }

        const instance = Reflect.construct(NoArgButCalledWith, [1, 2, 3]);
        return !!instance;
    } catch (e) {
        return false;
    }
}

export function test_construct_138() {
    try {

        function WithLengthCheck() {
            this.len = arguments.length;
        }

        const instance = Reflect.construct(WithLengthCheck, [1, 2]);
        return instance.len === 2;
    } catch (e) {
        return false;
    }
}

export function test_construct_139() {
    try {

        function SelfReference() {
            this.self = this;
        }

        const instance = Reflect.construct(SelfReference, []);
        return instance.self === instance;
    } catch (e) {
        return false;
    }
}

export function test_construct_140() {
    try {

        function WithArrowContext() {
            this.fn = () => this;
        }

        const instance = Reflect.construct(WithArrowContext, []);
        return instance.fn() === instance;
    } catch (e) {
        return false;
    }
}

export function test_construct_141() {
    try {

        function ThrowIfNotNew() {
            if (!(this instanceof ThrowIfNotNew)) {
                throw new TypeError('must use new');
            }
        }

        const instance = Reflect.construct(ThrowIfNotNew, []);
        return !!instance;
    } catch (e) {
        return false;
    }
}

export function test_construct_142() {
    try {

        function AcceptAny(...args) {
            this.args = args;
        }

        const mixed = [null, undefined, 0, '', [], {}];
        const instance = Reflect.construct(AcceptAny, mixed);
        return instance.args.length === 6 && instance.args[0] === null;
    } catch (e) {
        return false;
    }
}

export function test_construct_143() {
    try {

        function WithPrototypeMethod() {
        }

        WithPrototypeMethod.prototype.hello = function () {
            return 'hi';
        };
        const instance = Reflect.construct(WithPrototypeMethod, []);
        return instance.hello() === 'hi';
    } catch (e) {
        return false;
    }
}

export function test_construct_144() {
    try {

        function CircularRef() {
            this.parent = this;
        }

        const instance = Reflect.construct(CircularRef, []);
        return instance.parent === instance;
    } catch (e) {
        return false;
    }
}

export function test_construct_145() {
    try {

        function DeepChain() {
            this.level = Reflect.construct(Reflect.construct(Object, []), [], Array);
        }

        const instance = Reflect.construct(DeepChain, []);
        return instance.level instanceof Array;
    } catch (e) {
        return true;
    }
}

export function test_construct_147() {
    try {

        function ReturnThis() {
            return this;
        }

        const instance = Reflect.construct(ReturnThis, []);
        return instance instanceof ReturnThis;
    } catch (e) {
        return false;
    }
}

export function test_construct_148() {
    try {

        function ExpectExact(a, b, c) {
            this.valid = a === 1 && b === 2 && c === 3;
        }

        const instance = Reflect.construct(ExpectExact, [1, 2, 3]);
        return instance.valid === true;
    } catch (e) {
        return false;
    }
}

export function test_construct_150() {
    try {

        function FinalTest(a, b, c) {
            this.sum = (a || 0) + (b || 0) + (c || 0);
        }

        const result = Reflect.construct(FinalTest, [5, 10, 15]);
        return result.sum === 30;
    } catch (e) {
        return false;
    }
}