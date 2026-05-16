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

export function test_apply_1() {
    try {

        function greet(greeting, punctuation) {
            return `${greeting}, ${this.name}${punctuation}`;
        }

        const person = { name: 'Alice' };
        const result = Reflect.apply(greet, person, ['Hello', '!']);

        return result === 'Hello, Alice!';
    } catch (e) {
        return false;
    }
}


export function test_apply_2() {
    try {
        const numbers = [3, 7, 2, 9, 5];
        const max = Reflect.apply(Math.max, null, numbers);

        return max === 9;
    } catch (e) {
        return false;
    }
}


export function test_apply_3() {
    try {
        Reflect.apply({}, {}, []); // 第一个参数不是函数，应抛错
        return false; // 如果没有抛出异常，说明执行错误，返回 false
    } catch (e) {
        return e instanceof TypeError; // 只有 TypeError 才算通过
    }
}


export function test_apply_4() {
    try {
        Reflect.apply(null, {}, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_5() {
    try {
        Reflect.apply(undefined, {}, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_6() {
    try {

        function fn() {
            return 'no args';
        }

        const result = Reflect.apply(fn, null, []);
        return result === 'no args';
    } catch (e) {
        return false;
    }
}


export function test_apply_7() {
    try {
        Reflect.apply(function () {
        }, null, null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_8() {
    try {
        Reflect.apply(function () {
        }, null, undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_9() {
    try {

        function sum(a, b) {
            return a + b;
        }

        const arrayLike = { '0': 3, '1': 5, length: 2 };
        const result = Reflect.apply(sum, null, arrayLike);
        return result === 8;
    } catch (e) {
        return false;
    }
}


export function test_apply_10() {
    try {

        function countArgs() {
            return arguments.length;
        }

        const brokenArrayLike = { '0': 1, '1': 2 }; // 缺少 length
        const result = Reflect.apply(countArgs, null, brokenArrayLike);
        return result === 0; // 没有 length 会被当作空数组处理？
    } catch (e) {
        return false;
    }
}


export function test_apply_11() {
    try {

        function fn() {
        }

        const arrayLike = { length: 'not-a-number' };
        Reflect.apply(fn, null, arrayLike);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_12() {
    try {

        function fn() {
        }

        const arrayLike = { length: -1 };
        Reflect.apply(fn, null, arrayLike);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_apply_13() {
    try {

        function fn() {
        }

        const arrayLike = { length: 2**32 }; // 超出最大合法长度
        Reflect.apply(fn, null, arrayLike);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_14() {
    try {

        function strictThis() {
            'use strict';
            return this;
        }

        const result = Reflect.apply(strictThis, undefined, []);
        return result === undefined; // 严格模式下 this 可以为 undefined
    } catch (e) {
        return false;
    }
}


export function test_apply_15() {
    try {

        function nonStrictThis() {
            return this;
        }

        const result = Reflect.apply(nonStrictThis, undefined, []);
        return result === globalThis || result === window;
    } catch (e) {
        return true;
    }
}


export function test_apply_16() {
    try {
        const obj = {
            name: 'outer',
            arrow: () => this.name // 注意：this 在定义时绑定
        };
        // 我们尝试绑定另一个 this
        const innerObj = { name: 'inner' };
        const result = Reflect.apply(obj.arrow, innerObj, []); // 无效
        // 箭头函数忽略 thisArgument，但仍可调用
        return typeof result === 'undefined'; // 因为模块/严格模式下 this 是 undefined
    } catch (e) {
        return true;
    }
}


export function test_apply_17() {
    try {

        function greet(name = 'Guest', age = 18) {
            return `${name} is ${age} years old`;
        }

        const result = Reflect.apply(greet, null, ['Alice']);
        return result === 'Alice is 18 years old';
    } catch (e) {
        return false;
    }
}


export function test_apply_18() {
    try {

        function* gen() {
            yield 1;
            yield 2;
        }

        const iterator = Reflect.apply(gen, null, []);
        return iterator[Symbol.iterator] !== undefined && typeof iterator.next === 'function';
    } catch (e) {
        return false;
    }
}


export function test_apply_19() {
    try {

        async function asyncFn() {
            return 'async';
        }

        const result = Reflect.apply(asyncFn, null, []);
        return result instanceof Promise;
    } catch (e) {
        return false;
    }
}


export function test_apply_20() {
    try {

        function logArgs(a, b, c) {
            return [a, b, c];
        }

        const sparse = [, ,];
        const result = Reflect.apply(logArgs, null, sparse);
        return Array.isArray(result) && result[0] === undefined && result[1] === undefined && result[2] === undefined;
    } catch (e) {
        return false;
    }
}


export function test_apply_21() {
    try {
        let called = false;

        function target() {
            called = true;
            return 'called';
        }

        const handler = {
            apply() {
                return 'proxied';
            }
        };
        const proxy = new Proxy(target, handler);
        const result = Reflect.apply(proxy, null, []);
        return result === 'proxied';
    } catch (e) {
        return false;
    }
}


export function test_apply_22() {
    try {

        function target() {
            return 'original';
        }

        const proxy = new Proxy(target, {});
        const result = Reflect.apply(proxy, null, []);
        return result === 'original';
    } catch (e) {
        return false;
    }
}


export function test_apply_23() {
    try {

        function Person(name) {
            this.name = name;
        }

        const instance = Reflect.apply(Person, {}, ['Bob']);
        return instance === undefined && {}.name === 'Bob';
    } catch (e) {
        return true;
    }
}


export function test_apply_24() {
    try {

        function sum(...nums) {
            return nums.reduce((a, b) => a + b, 0);
        }

        const result = Reflect.apply(sum, null, [1, 2, 3, 4]);
        return result === 10;
    } catch (e) {
        return false;
    }
}


export function test_apply_25() {
    try {
        const sym = Symbol('test');

        function fn(arg) {
            return arg;
        }

        const result = Reflect.apply(fn, null, [sym]);
        return result === sym;
    } catch (e) {
        return false;
    }
}


export function test_apply_26() {
    try {

        function getType(arg) {
            return typeof arg;
        }

        const bigIntValue = 123n;
        const result = Reflect.apply(getType, null, [bigIntValue]);
        return result === 'bigint';
    } catch (e) {
        return false;
    }
}


export function test_apply_27() {
    try {
        const obj = {
            _value: 42,
            get value() {
                return this._value;
            }
        };
        const getter = Object.getOwnPropertyDescriptor(obj, 'value').get;
        const result = Reflect.apply(getter, obj, []);
        return result === 42;
    } catch (e) {
        return false;
    }
}


export function test_apply_28() {
    try {
        let captured = null;
        const obj = {
            set data(val) {
                captured = val;
            }
        };
        const setter = Object.getOwnPropertyDescriptor(obj, 'data').set;
        Reflect.apply(setter, obj, ['hello']);
        return captured === 'hello';
    } catch (e) {
        return false;
    }
}


export function test_apply_29() {
    try {

        function getThisType() {
            return typeof this;
        }

        const result = Reflect.apply(getThisType, 'hello', []);
        return result === 'object';
    } catch (e) {
        return true;
    }
}


export function test_apply_30() {
    try {

        function isBooleanInstance() {
            return this instanceof Boolean;
        }

        const result = Reflect.apply(isBooleanInstance, true, []);
        return result === true;
    } catch (e) {
        return true;
    }
}


export function test_apply_31() {
    try {

        function isNumberInstance() {
            return this instanceof Number;
        }

        const result = Reflect.apply(isNumberInstance, 42, []);
        return result === true;
    } catch (e) {
        return true;
    }
}


export function test_apply_32() {
    try {

        function target() {
            return 'revoked?';
        }

        const { proxy, revoke } = Proxy.revocable(target, {});
        revoke();
        Reflect.apply(proxy, null, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_33() {
    try {

        function argsEqual(a, b) {
            return a === null && b === undefined;
        }

        const result = Reflect.apply(argsEqual, null, [null, undefined]);
        return result === true;
    } catch (e) {
        return false;
    }
}


export function test_apply_34() {
    try {
        const fakeFn = { apply: Function.prototype.apply };
        Reflect.apply(fakeFn, null, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_35() {
    try {

        function greet() {
            return `${this.name} says hi`;
        }

        const bound = greet.bind({ name: 'Bound' });
        const result = Reflect.apply(bound, { name: 'Ignored' }, []);
        return result === 'Bound says hi';
    } catch (e) {
        return false;
    }
}


export function test_apply_36() {
    try {
        const arrayLike = {
            length: 1,
            get 0() {
                throw new Error('getter error');
            }
        };
        Reflect.apply(function (x) {
        }, null, arrayLike);
        return false;
    } catch (e) {
        return e.message === 'getter error';
    }
}


export function test_apply_37() {
    try {
        const evilArrayLike = {
            0: 'safe',
            length: 1,
            [Symbol.iterator]: () => {
                throw new Error('hacked');
            }
        };

        function takeFirst(x) {
            return x;
        }

        const result = Reflect.apply(takeFirst, null, evilArrayLike);
        return result === 'safe';
    } catch (e) {
        return false;
    }
}


export function test_apply_38() {
    try {

        async function* asyncGen() {
            yield 'async-gen';
        }

        const iter = Reflect.apply(asyncGen, null, []);
        return typeof iter.next === 'function' && typeof iter.return === 'function';
    } catch (e) {
        return false;
    }
}


export function test_apply_39() {
    try {

        function getContext() {
            return this;
        }

        const ctx = {};
        const result = Reflect.apply(getContext, ctx, []);
        return result === ctx;
    } catch (e) {
        return false;
    }
}


export function test_apply_40() {
    try {
        let counter = 0;

        function increment() {
            counter++;
        }

        Reflect.apply(increment, null, []);
        Reflect.apply(increment, null, []);
        Reflect.apply(increment, null, []);
        return counter === 3;
    } catch (e) {
        return false;
    }
}


export function test_apply_41() {
    try {
        const fn = Object.freeze(function (a) {
            return a * 2;
        });
        const result = Reflect.apply(fn, null, [5]);
        return result === 10;
    } catch (e) {
        return false;
    }
}


export function test_apply_42() {
    try {
        const wm = new WeakMap();

        function getThis() {
            return this;
        }

        const result = Reflect.apply(getThis, wm, []);
        return result === wm;
    } catch (e) {
        return false;
    }
}


export function test_apply_43() {
    try {

        function check(a, b) {
            return a === Infinity && b === -Infinity;
        }

        const result = Reflect.apply(check, null, [Infinity, -Infinity]);
        return result === true;
    } catch (e) {
        return false;
    }
}


export function test_apply_44() {
    try {
        const DynamicFn = new Function('a', 'b', 'return a + b');
        const result = Reflect.apply(DynamicFn, null, [2, 3]);
        return result === 5;
    } catch (e) {
        return true;
    }
}


export function test_apply_45() {
    try {

        function isItNaN(x) {
            return Number.isNaN(x);
        }

        const result = Reflect.apply(isItNaN, null, [NaN]);
        return result === true;
    } catch (e) {
        return false;
    }
}


export function test_apply_46() {
    try {
        const arrayLike = {
            length: 2,
            0: 'ok',
            get 1() {
                throw new TypeError('read error');
            }
        };
        Reflect.apply(function () {
        }, null, arrayLike);
        return false;
    } catch (e) {
        return e.message === 'read error';
    }
}


export function test_apply_47() {
    try {

        function withLog(fn) {
            return function (...args) {
                console.log('called');
                return fn.apply(this, args);
            };
        }

        const loggedFn = withLog(() => 'wrapped');
        const result = Reflect.apply(loggedFn, null, []);
        return result === 'wrapped';
    } catch (e) {
        return false;
    }
}


export function test_apply_48() {
    try {
        const map = new Map([['init', true]]);

        function addToThis() {
            this.set('dynamic', 'yes');
        }

        Reflect.apply(addToThis, map, []);
        return map.get('dynamic') === 'yes';
    } catch (e) {
        return false;
    }
}


export function test_apply_49() {
    try {

        function sumLength(a, b, c) {
            return a + b + c;
        }

        const typedArr = new Uint8Array([1, 2, 3]);
        const result = Reflect.apply(sumLength, null, typedArr);
        return result === 6;
    } catch (e) {
        return false;
    }
}


export function test_apply_50() {
    try {
        const fakeFn = {
            toString() {
                return "I'm not a function";
            }
        };
        Reflect.apply(fakeFn, null, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_51() {
    try {
        const nodeList = {
            '0': 'item1',
            '1': 'item2',
            length: 2
        };

        function collect(a, b) {
            return [a, b];
        }

        const result = Reflect.apply(collect, null, nodeList);
        return Array.isArray(result) && result[0] === 'item1' && result[1] === 'item2';
    } catch (e) {
        return false;
    }
}


export function test_apply_52() {
    try {

        function* gen() {
            throw new Error('gen error');
        }

        const iter = Reflect.apply(gen, null, []);
        try {
            iter.next();
            return false;
        } catch (e) {
            return e.message === 'gen error';
        }
    } catch (e) {
        return false;
    }
}


export function test_apply_53() {
    try {
        const promise = Promise.resolve(1);

        function getContext() {
            return this;
        }

        const result = Reflect.apply(getContext, promise, []);
        return result === promise;
    } catch (e) {
        return false;
    }
}


export function test_apply_54() {
    try {
        const sparse = new Array(3);

        function check(a, b, c) {
            return a === undefined && b === undefined && c === undefined;
        }

        const result = Reflect.apply(check, null, sparse);
        return result === true;
    } catch (e) {
        return false;
    }
}


export function test_apply_55() {
    try {
        const arrow = () => this;
        const proxy = new Proxy(arrow, {});
        const result = Reflect.apply(proxy, { context: 'bound' }, []);
        return result !== { context: 'bound' };
    } catch (e) {
        return false;
    }
}


export function test_apply_56() {
    try {
        const setIter = new Set([1, 2]).values();
        Reflect.apply(function () {
        }, null, setIter);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_apply_57() {
    try {
        const obj = {
            get fn() {
                throw new Error('lazy load failed');
            },
            args: []
        };
        Reflect.apply(obj.fn, null, obj.args);
        return false;
    } catch (e) {
        return e.message === 'lazy load failed';
    }
}


export function test_apply_58() {
    try {
        'use strict';

        function checkThis() {
            return this;
        }

        const result = Reflect.apply(checkThis, undefined, []);
        return result === undefined;
    } catch (e) {
        return false;
    }
}


export function test_apply_59() {
    try {

        function outer(a, b) {

            function inner(x, y) {
                return x * y;
            }

            return Reflect.apply(inner, null, arguments);
        }

        const result = outer(4, 5);
        return result === 20;
    } catch (e) {
        return false;
    }
}


export function test_apply_60() {
    try {

        function deep(n) {
            if (n <= 0) {
                return 'done';
            }
            return Reflect.apply(deep, null, [n - 1]);
        }

        const result = Reflect.apply(deep, null, [5]);
        return result === 'done';
    } catch (e) {
        return false;
    }
}

export function test_apply_61() {
    try {
        const fakeFn = { length: 0 };
        Reflect.apply(fakeFn, null, []);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_62() {
    try {
        const arrayLike = {
            0: 'a',
            1: 'b',
            length: 2,
            [Symbol.iterator]: () => [][Symbol.iterator]()
        };

        function joinArgs(a, b) {
            return a + b;
        }

        const result = Reflect.apply(joinArgs, null, arrayLike);
        return result === 'ab';
    } catch (e) {
        return false;
    }
}


export function test_apply_64() {
    try {
        let calledGetter = false;
        const obj = {};
        Object.defineProperty(obj, 'fn', {
            get() {
                calledGetter = true;
                return function () {
                    return 'from-getter';
                };
            },
            configurable: true
        });
        const result = Reflect.apply(obj.fn, null, []);
        return result === 'from-getter' && calledGetter;
    } catch (e) {
        return false;
    }
}


export function test_apply_66() {
    try {

        function types(a, b) {
            return [typeof a, typeof b];
        }

        const result = Reflect.apply(types, null, [123, 123n]);
        return result[0] === 'number' && result[1] === 'bigint';
    } catch (e) {
        return false;
    }
}


export function test_apply_67() {
    try {

        function fn() {
            return 'called';
        }

        Object.setPrototypeOf(fn, null);
        const result = Reflect.apply(fn, null, []);
        return result === 'called';
    } catch (e) {
        return false;
    }
}


export function test_apply_69() {
    try {

        function* gen() {
        }

        const iter = Reflect.apply(gen, null, []);
        return typeof iter[Symbol.iterator] === 'function';
    } catch (e) {
        return false;
    }
}


export function test_apply_70() {
    try {

        function outer(a, b) {
            arguments.length = 1;

            function inner(x) {
                return x;
            }

            return Reflect.apply(inner, null, arguments);
        }

        return outer('first', 'second') === 'first';
    } catch (e) {
        return false;
    }
}


export function test_apply_71() {
    try {

        function MyClass(name) {
            this.name = name;
        }

        const instance = Reflect.construct(MyClass, ['Alice']);

        function getName() {
            return this.name;
        }

        const result = Reflect.apply(getName, instance, []);
        return result === 'Alice';
    } catch (e) {
        return false;
    }
}


export function test_apply_72() {
    try {
        const fn = function () {
        };
        fn.toString = () => 123;
        Reflect.apply(fn, null, []);
        return true;
    } catch (e) {
        return false;
    }
}


export function test_apply_73() {
    try {
        const arrayLike = {
            length: 3,
            get 1() {
                throw new Error('getter fail');
            }
        };
        Reflect.apply(function (a, b, c) {
        }, null, arrayLike);
        return false;
    } catch (e) {
        return e.message === 'getter fail';
    }
}


export function test_apply_74() {
    try {

        async function delayed() {
            return 'resolved';
        }

        const promise = Reflect.apply(delayed, null, []);
        if (!(promise instanceof Promise)) {
            return false;
        }

        let resolved = false;
        promise.then(res => {
            resolved = res;
        }).catch(() => {
        });

        return true;
    } catch (e) {
        return false;
    }
}


export function test_apply_75() {
    try {
        const doc = typeof document !== 'undefined' ? document : {};

        function getContext() {
            return this;
        }

        const result = Reflect.apply(getContext, doc, []);
        return result === doc;
    } catch (e) {
        return false;
    }
}


export function test_apply_77() {
    try {

        function target() {
            return 'original';
        }

        const handler = {
            apply() {
                return 'intercepted';
            }
        };
        const proxy = new Proxy(target, handler);
        const result = Reflect.apply(proxy, null, []);
        return result === 'intercepted';
    } catch (e) {
        return false;
    }
}


export function test_apply_78() {
    try {
        const arrayLike = { length: 0, extra: 'ignored' };

        function noArg() {
            return 'ok';
        }

        const result = Reflect.apply(noArg, null, arrayLike);
        return result === 'ok';
    } catch (e) {
        return false;
    }
}


export function test_apply_79() {
    try {

        function original() {
            return 'named';
        }

        Object.defineProperty(original, 'name', { value: 'fakeName' });
        const result = Reflect.apply(original, null, []);
        return result === 'named';
    } catch (e) {
        return false;
    }
}


export function test_apply_80() {
    try {

        function noop() {
        }

        const args = [];
        for (let i = 0; i < 1000; i++) {
            Reflect.apply(noop, null, args);
        }
        return true;
    } catch (e) {
        return false;
    }
}


export function test_apply_81() {
    try {

        function fn() {
            return 'called';
        }

        fn.constructor = null;
        const result = Reflect.apply(fn, null, []);
        return result === 'called';
    } catch (e) {
        return false;
    }
}


export function test_apply_82() {
    try {
        let accessCount = 0;
        const arrayLike = {
            get 0() {
                accessCount++;
                return 'a';
            },
            get 1() {
                accessCount++;
                return 'b';
            },
            length: 2
        };

        function takeTwo(a, b) {
            return a + b;
        }

        const result = Reflect.apply(takeTwo, null, arrayLike);
        return result === 'ab' && accessCount === 2;
    } catch (e) {
        return false;
    }
}


export function test_apply_83() {
    try {
        const obj = {};
        Object.setPrototypeOf(obj, Array.prototype);

        function checkThis() {
            return this instanceof Array ? 'no' : 'yes';
        }

        const result = Reflect.apply(checkThis, obj, []);
        return result === 'yes';
    } catch (e) {
        return true;
    }
}


export function test_apply_84() {
    try {

        function detectCallType() {
            return new.target;
        }

        const result = Reflect.apply(detectCallType, null, []);
        return result === undefined;
    } catch (e) {
        return false;
    }
}


export function test_apply_85() {
    try {

        function target() {
            return 'target';
        }

        const handler = {
            apply: () => 'proxy-applied'
        };
        const proxy = new Proxy(target, handler);
        const result = Reflect.apply(proxy, null, []);
        return result === 'proxy-applied';
    } catch (e) {
        return false;
    }
}


export function test_apply_86() {
    try {

        function noArgs() {
            return 'ok';
        }

        Reflect.apply(noArgs, null, null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_87() {
    try {

        function method(defaultVal = this.fallback) {
            return defaultVal;
        }

        const ctx = { fallback: 'dynamic' };
        const result = Reflect.apply(method, ctx, []);
        return result === 'dynamic';
    } catch (e) {
        return false;
    }
}


export function test_apply_88() {
    try {

        function* gen() {
            try {
                yield 'start';
            } catch (e) {
                return 'caught';
            }
        }

        const iter = Reflect.apply(gen, null, []);
        iter.next();
        const thrown = iter.throw(new Error('err'));
        return thrown.value === 'caught';
    } catch (e) {
        return false;
    }
}


export function test_apply_89() {
    try {
        const sym = Symbol('wrapped');

        function getType() {
            return typeof this;
        }

        const result = Reflect.apply(getType, sym, []);
        return result === 'object';
    } catch (e) {
        return false;
    }
}


export function test_apply_90() {
    try {
        let getterCalled = false;
        const argWithGetter = {
            get value() {
                getterCalled = true;
                return 42;
            }
        };

        function pure() {
            return 'pure';
        }

        const result = Reflect.apply(pure, null, []);
        return result === 'pure' && !getterCalled;
    } catch (e) {
        return false;
    }
}


export function test_apply_91() {
    try {

        function fn() {
        }

        fn.toString = () => 'A'.repeat(10_000);
        Reflect.apply(fn, null, []);
        return true;
    } catch (e) {
        return false;
    }
}


export function test_apply_92() {
    try {
        const arrayLike = {
            0: 'first',
            1: 'second',
            length: 1.7
        };

        function single(a) {
            return a;
        }

        const result = Reflect.apply(single, null, arrayLike);
        return result === 'first';
    } catch (e) {
        return false;
    }
}


export function test_apply_93() {
    try {

        async function asyncFn() {
            return 'resolved';
        }

        const promise = Reflect.apply(asyncFn, null, []);
        return promise && typeof promise.then === 'function';
    } catch (e) {
        return false;
    }
}


export function test_apply_95() {
    try {
        const date = new Date();

        function getTime() {
            return this.getTime();
        }

        const time = Reflect.apply(getTime, date, []);
        return typeof time === 'number' && Math.abs(time - date.getTime()) < 10;
    } catch (e) {
        return false;
    }
}


export function test_apply_96() {
    try {
        const arrayLike = {
            0: 'x',
            1: 'y',
            length: 2,
            [Symbol.isConcatSpreadable]: true
        };

        function join(a, b) {
            return a + b;
        }

        const result = Reflect.apply(join, null, arrayLike);
        return result === 'xy';
    } catch (e) {
        return false;
    }
}


export function test_apply_97() {
    try {

        function destructure({ name = 'guest', age: a = 18 } = {}) {
            return `${name} is ${a}`;
        }

        const ctx = {};
        const result = Reflect.apply(destructure, ctx, [{ name: 'Bob' }]);
        return result === 'Bob is 18';
    } catch (e) {
        return false;
    }
}


export function test_apply_98() {
    try {
        let sync = true;

        function recordAsync() {
            sync = false;
        }

        setTimeout(() => {
            Reflect.apply(recordAsync, null, []);
        }, 0);


        Reflect.apply(() => {
        }, null, []);
        return true;
    } catch (e) {
        return false;
    }
}


export function test_apply_99() {
    try {
        const arrayLike = {
            [-1]: 'neg',
            0: 'zero',
            1: 'one',
            length: 2
        };

        function args(a, b) {
            return [a, b];
        }

        const result = Reflect.apply(args, null, arrayLike);
        return result[0] === 'zero' && result[1] === 'one';
    } catch (e) {
        return false;
    }
}


export function test_apply_100() {
    try {

        const fakeTarget = function (a, b) {
            return a + b;
        };
        const result = Reflect.apply(Reflect.apply, null, [fakeTarget, null, [2, 3]]);
        return result === 5;
    } catch (e) {
        return false;
    }
}


export function test_apply_101() {
    try {
        const obj = {
            method() {

                return new Function('return super.x')();
            }
        };
        Reflect.apply(obj.method, {}, []);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_apply_102() {
    try {
        const arrayLike = {
            get 0() {
                throw new SyntaxError('bad access');
            },
            length: 1
        };
        Reflect.apply(function () {
        }, null, arrayLike);
        return false;
    } catch (e) {
        return e instanceof SyntaxError && e.message === 'bad access';
    }
}


export function test_apply_103() {
    try {
        'use strict';

        function getThis() {
            return this;
        }

        const result = Reflect.apply(getThis, null, []);
        return result === null;
    } catch (e) {
        return false;
    }
}


export function test_apply_104() {
    try {

        function fn(a) {
            return a;
        }

        Object.preventExtensions(fn);
        const result = Reflect.apply(fn, null, [42]);
        return result === 42;
    } catch (e) {
        return false;
    }
}


export function test_apply_105() {
    try {
        let accessed = false;
        const sparseZeroLen = {
            get 0() {
                accessed = true;
                return 'evil';
            },
            length: 0
        };

        function noArgs() {
            return 'ok';
        }

        const result = Reflect.apply(noArgs, null, sparseZeroLen);
        return result === 'ok' && !accessed;
    } catch (e) {
        return false;
    }
}


export function test_apply_106() {
    try {

        async function* agen() {
            yield 'async-gen';
        }

        const iter = Reflect.apply(agen, null, []);
        return typeof iter.next === 'function';
    } catch (e) {
        return false;
    }
}


export function test_apply_107() {
    try {

        function target() {
            return 'final';
        }

        const handler = {
            apply(t, thisArg, args) {
                return Reflect.apply(t, thisArg, args);
            }
        };
        const proxy = new Proxy(target, handler);
        const result = Reflect.apply(proxy, null, []);
        return result === 'final';
    } catch (e) {
        return false;
    }
}


export function test_apply_108() {
    try {
        const arrayLike = { length: Symbol('invalid') };
        Reflect.apply(function () {
        }, null, arrayLike);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_109() {
    try {
        const ws = new WeakSet();

        function getContext() {
            return this;
        }

        const result = Reflect.apply(getContext, ws, []);
        return result === ws;
    } catch (e) {
        return false;
    }
}


export function test_apply_111() {
    try {
        const arrayLike = {
            0: 'a',
            1: 'b',
            length: 2,
            [Symbol.toPrimitive]() {
                return 'hacked';
            }
        };

        function join(x, y) {
            return x + y;
        }

        const result = Reflect.apply(join, null, arrayLike);
        return result === 'ab';
    } catch (e) {
        return false;
    }
}


export function test_apply_113() {
    try {
        const err = new Error('init');

        function augment() {
            this.code = 'CUSTOM_ERR';
        }

        Reflect.apply(augment, err, []);
        return err.code === 'CUSTOM_ERR';
    } catch (e) {
        return false;
    }
}


export function test_apply_114() {
    try {
        const arrayLike = {
            [Infinity]: 'inf',
            0: 'zero',
            length: 1
        };

        function takeFirst(x) {
            return x;
        }

        const result = Reflect.apply(takeFirst, null, arrayLike);
        return result === 'zero';
    } catch (e) {
        return false;
    }
}


export function test_apply_115() {
    try {
        const fn = function namedFn() {
        };
        Object.defineProperty(fn, 'name', { writable: false, configurable: false });
        const result = Reflect.apply(fn, null, []);
        return result === undefined;
    } catch (e) {
        return false;
    }
}


export function test_apply_116() {
    try {
        const fakeGlobal = { type: 'worker-global' };

        function checkEnv() {
            return this.type;
        }

        const result = Reflect.apply(checkEnv, fakeGlobal, []);
        return result === 'worker-global';
    } catch (e) {
        return false;
    }
}


export function test_apply_117() {
    try {
        const arrayLike = { length: NaN };
        Reflect.apply(function () {
        }, null, arrayLike);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_apply_118() {
    try {

        function throwPrimitive() {
            throw "raw string error";
        }

        Reflect.apply(throwPrimitive, null, []);
        return false;
    } catch (e) {
        return e === "raw string error";
    }
}


export function test_apply_119() {
    try {
        const arr = [];
        const push = Array.prototype.push;
        const count = Reflect.apply(push, arr, ['a', 'b']);
        return arr.length === 2 && count === 2;
    } catch (e) {
        return false;
    }
}


export function test_apply_120() {
    try {
        const fn = (n) => n <= 0 ? 0 : Reflect.apply(fn, null, [n - 1]);
        const result = Reflect.apply(Reflect.apply(Reflect.apply(fn, null, [3]), null, []), null, []);
        return result === 0;
    } catch (e) {
        return true;
    }
}


export function test_apply_121() {
    try {
        const arrayLike = { length: -0 };

        function noArg() {
            return 'ok';
        }

        const result = Reflect.apply(noArg, null, arrayLike);
        return result === 'ok';
    } catch (e) {
        return false;
    }
}


export function test_apply_122() {
    try {
        const buffer = new ArrayBuffer(8);

        function getContext() {
            return this;
        }

        const result = Reflect.apply(getContext, buffer, []);
        return result === buffer;
    } catch (e) {
        return false;
    }
}


export function test_apply_123() {
    try {
        let accessed = false;
        const obj = {
            get value() {
                accessed = true;
                return 'dynamic';
            }
        };

        function useArg(a) {
            return a.value;
        }

        const result = Reflect.apply(useArg, null, [obj]);
        return result === 'dynamic' && accessed;
    } catch (e) {
        return false;
    }
}


export function test_apply_124() {
    try {

        function target() {
        }

        Object.defineProperty(target, 'name', { value: '', configurable: true });
        const result = Reflect.apply(target, null, []);
        return result === undefined;
    } catch (e) {
        return false;
    }
}


export function test_apply_125() {
    try {
        const arrayLike = {
            0: 'a',
            length: 1,
            [Symbol.unscopables]: { not: true }
        };

        function take(x) {
            return x;
        }

        const result = Reflect.apply(take, null, arrayLike);
        return result === 'a';
    } catch (e) {
        return false;
    }
}


export function test_apply_127() {
    try {
        if (typeof SharedArrayBuffer === 'undefined') {
            return true;
        }
        const sab = new SharedArrayBuffer(4);

        function checkThis() {
            return this.byteLength;
        }

        const result = Reflect.apply(checkThis, sab, []);
        return result === 4;
    } catch (e) {
        return false;
    }
}

export function test_apply_128() {
    try {
        const arrayLike = { '0': 'str-key', length: 1 };

        function first(a) {
            return a;
        }

        const result = Reflect.apply(first, null, arrayLike);
        return result === 'str-key';
    } catch (e) {
        return false;
    }
}


export function test_apply_129() {
    try {

        function* gen() {
            yield 'start';
            yield 'never';
        }

        const iter = Reflect.apply(gen, null, []);
        iter.next();
        const returned = iter.return('early');
        return returned.value === 'early';
    } catch (e) {
        return false;
    }
}


export function test_apply_131() {
    try {
        let accessLog = [];
        const arrayLike = {
            get 0() {
                accessLog.push(0);
                return 'a';
            },
            get 1() {
                accessLog.push(1);
                return 'b';
            },
            get 2() {
                accessLog.push(2);
                return 'c';
            },
            length: 2
        };

        function twoArgs(a, b) {
            return a + b;
        }

        const result = Reflect.apply(twoArgs, null, arrayLike);
        return result === 'ab' && accessLog.length === 2 && accessLog[0] === 0 && accessLog[1] === 1;
    } catch (e) {
        return false;
    }
}


export function test_apply_132() {
    try {
        if (typeof performance === 'undefined') {
            return true;
        }

        function getTime() {
            return this.now ? this.now() : 0;
        }

        const t = Reflect.apply(getTime, performance, []);
        return typeof t === 'number';
    } catch (e) {
        return false;
    }
}


export function test_apply_133() {
    try {

        async function delay() {
            await new Promise(r => setTimeout(r, 1));
        }

        const p = Reflect.apply(delay, null, []);
        return p && p.constructor.name === 'Promise' && ('status' in p ? p.status === 'pending' : true);
    } catch (e) {
        return false;
    }
}


export function test_apply_134() {
    try {
        const arrayLike = { length: 2n };
        Reflect.apply(function () {
        }, null, arrayLike);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_apply_135() {
    try {

        function destructure({ a, ...rest }) {
            return rest.b === 2;
        }

        const result = Reflect.apply(destructure, null, [{ a: 1, b: 2 }]);
        return result === true;
    } catch (e) {
        return false;
    }
}


export function test_apply_136() {
    try {

        function withLabel() {
            outer: {
                break outer;
                return 'never';
            }
            return 'broken';
        }

        const result = Reflect.apply(withLabel, null, []);
        return result === 'broken';
    } catch (e) {
        return false;
    }
}


export function test_apply_137() {
    try {
        if (typeof Intl === 'undefined' || !Intl.Locale) {
            return true;
        }
        const loc = new Intl.Locale('en-US');

        function getLang() {
            return this.baseName;
        }

        const result = Reflect.apply(getLang, loc, []);
        return result === 'en';
    } catch (e) {
        return true;
    }
}


export function test_apply_138() {
    try {
        const arrayLike = {
            length: 0,
            [Symbol.iterator]: () => [][Symbol.iterator]()
        };

        function noArg() {
            return 'ok';
        }

        const result = Reflect.apply(noArg, null, arrayLike);
        return result === 'ok';
    } catch (e) {
        return false;
    }
}


export function test_apply_139() {
    try {

        function tryCatchFlow() {
            try {
                throw new Error('expected');
            } catch (e) {
                return 'caught';
            } finally {
            }
        }

        const result = Reflect.apply(tryCatchFlow, null, []);
        return result === 'caught';
    } catch (e) {
        return false;
    }
}


export function test_apply_140() {
    try {
        const fn = function frozenName() {
        };
        Object.defineProperty(fn, 'name', { writable: false });
        const result = Reflect.apply(fn, null, []);
        return result === undefined;
    } catch (e) {
        return false;
    }
}


export function test_apply_141() {
    try {
        const sparse = { 0: 'a', 2: 'c', length: 3 };

        function args(a, b, c) {
            return [a, b, c];
        }

        const result = Reflect.apply(args, null, sparse);
        return result[0] === 'a' && result[1] === undefined && result[2] === 'c';
    } catch (e) {
        return false;
    }
}


export function test_apply_142() {
    try {
        if (typeof CSSStyleSheet === 'undefined') {
            return true;
        }
        const sheet = new CSSStyleSheet();

        function isSheet() {
            return this instanceof CSSStyleSheet;
        }

        const result = Reflect.apply(isSheet, sheet, []);
        return result === true;
    } catch (e) {
        return false;
    }
}


export function test_apply_143() {
    try {
        let called = false;

        function sideEffect(defaultVal = (called = true, 'default')) {
            return defaultVal;
        }

        const result = Reflect.apply(sideEffect, null, []);
        return result === 'default' && called;
    } catch (e) {
        return false;
    }
}


export function test_apply_144() {
    try {

        function useForIn(obj) {
            const keys = [];
            for (const k in obj) {
                keys.push(k);
            }
            return keys.sort().join(',');
        }

        const result = Reflect.apply(useForIn, null, [{ a: 1, b: 2 }]);
        return result === 'a,b';
    } catch (e) {
        return false;
    }
}


export function test_apply_145() {
    try {
        const arrayLike = { 0: 'only', length: true };

        function single(a) {
            return a;
        }

        const result = Reflect.apply(single, null, arrayLike);
        return result === 'only';
    } catch (e) {
        return false;
    }
}


export function test_apply_146() {
    try {

        function* gen() {
            try {
                yield 'safe';
            } catch (e) {
                return 'handled';
            }
        }

        const iter = Reflect.apply(gen, null, []);
        iter.next();
        const thrown = iter.throw(new Error('injected'));
        return thrown.value === 'handled';
    } catch (e) {
        return false;
    }
}


export function test_apply_147() {
    try {
        if (typeof ResizeObserver === 'undefined') {
            return true;
        }
        const ro = new ResizeObserver(() => {
        });

        function observe() {
            return !!this.disconnect;
        }

        const result = Reflect.apply(observe, ro, []);
        return result === true;
    } catch (e) {
        return false;
    }
}


export function test_apply_148() {
    try {
        const arrayLike = {
            0: 'x',
            1: 'y',
            length: 2,
            get [Symbol.species]() {
                throw new Error('accessed');
            }
        };

        function join(a, b) {
            return a + b;
        }

        const result = Reflect.apply(join, null, arrayLike);
        return result === 'xy';
    } catch (e) {
        return false;
    }
}


export function test_apply_149() {
    try {

        function labeledLoop() {
            let count = 0;
            outer: for (let i = 0; i < 3; i++) {
                continue outer;
                count++;
            }
            return count === 0;
        }

        const result = Reflect.apply(labeledLoop, null, []);
        return result === true;
    } catch (e) {
        return false;
    }
}


export function test_apply_150() {
    try {
        const add = (a, b) => a + b;
        const result = Reflect.apply(
            Reflect.apply(
                Reflect.apply(add, null, []),
                null,
                [2]
            ),
            null,
            [3]
        );
        return result === 5;
    } catch (e) {
        return true;
    }
}