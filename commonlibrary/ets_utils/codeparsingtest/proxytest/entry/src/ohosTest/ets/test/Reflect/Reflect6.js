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

export function test_getOwnPropertyDescriptor_1() {
    const obj = { a: 1 };
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'a');
    return desc !== undefined &&
        desc.value === 1 &&
        desc.writable === true &&
        desc.enumerable === true &&
        desc.configurable === true;
}


export function test_getOwnPropertyDescriptor_2() {
    const obj = { a: 1 };
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'b');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_3() {
    const parent = { b: 2 };
    const child = Object.create(parent);
    child.a = 1;
    const desc = Reflect.getOwnPropertyDescriptor(child, 'b');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_4() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', {
        value: 42,
        enumerable: false,
        writable: true,
        configurable: true
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'hidden');
    return desc !== undefined && desc.value === 42 && desc.enumerable === false;
}


export function test_getOwnPropertyDescriptor_5() {
    const obj = {};
    Object.defineProperty(obj, 'prop', {
        get() {
            return 10;
        },
        enumerable: true,
        configurable: true
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'prop');
    return desc !== undefined &&
        typeof desc.get === 'function' &&
        desc.get() === 10 &&
        desc.set === undefined &&
        desc.enumerable === true &&
        desc.configurable === true;
}


export function test_getOwnPropertyDescriptor_6() {
    let val;
    const obj = {};
    Object.defineProperty(obj, 'prop', {
        set(v) {
            val = v;
        },
        enumerable: false,
        configurable: false
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'prop');
    return desc !== undefined &&
        typeof desc.set === 'function' &&
        desc.get === undefined &&
        desc.enumerable === false &&
        desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_7() {
    const obj = {};
    Object.defineProperty(obj, 'prop', {
        get() {
            return this._val;
        },
        set(v) {
            this._val = v;
        },
        configurable: true
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'prop');
    return desc !== undefined &&
        typeof desc.get === 'function' &&
        typeof desc.set === 'function' &&
        desc.configurable === true &&
        !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_8() {
    const obj = {};
    Object.defineProperty(obj, 'fixed', {
        value: 'no change',
        configurable: false,
        writable: false,
        enumerable: false
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'fixed');
    return desc !== undefined &&
        desc.value === 'no change' &&
        desc.configurable === false &&
        desc.writable === false &&
        desc.enumerable === false;
}


export function test_getOwnPropertyDescriptor_9() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'a', { writable: false });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'a');
    return desc !== undefined && desc.writable === false;
}


export function test_getOwnPropertyDescriptor_10() {
    const arr = [1, 2, 3];
    const desc = Reflect.getOwnPropertyDescriptor(arr, '0');
    return desc !== undefined &&
        desc.value === 1 &&
        desc.writable === true &&
        desc.enumerable === true &&
        desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_11() {
    const arr = [1, 2];
    const desc = Reflect.getOwnPropertyDescriptor(arr, 'length');
    return desc !== undefined &&
        desc.value === 2 &&
        desc.writable === true &&
        desc.enumerable === false &&
        desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_12() {
    const str = new String("ab");
    const desc = Reflect.getOwnPropertyDescriptor(str, '0');
    return desc !== undefined &&
        desc.value === 'a' &&
        desc.writable === false &&
        desc.enumerable === true &&
        desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_13() {
    try {
        Reflect.getOwnPropertyDescriptor("abc", '0');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getOwnPropertyDescriptor_14() {
    try {
        Reflect.getOwnPropertyDescriptor(123, 'toFixed');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getOwnPropertyDescriptor_15() {
    try {
        Reflect.getOwnPropertyDescriptor(true, 'valueOf');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getOwnPropertyDescriptor_16() {
    try {
        Reflect.getOwnPropertyDescriptor(null, 'x');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getOwnPropertyDescriptor_17() {
    try {
        Reflect.getOwnPropertyDescriptor(undefined, 'x');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getOwnPropertyDescriptor_18() {
    const sym = Symbol('test');
    const obj = { [sym]: 42 };
    const desc = Reflect.getOwnPropertyDescriptor(obj, sym);
    return desc !== undefined && desc.value === 42;
}


export function test_getOwnPropertyDescriptor_19() {
    const sym = Symbol('shared');
    const obj = {};
    obj[sym] = 'value';
    const desc = Reflect.getOwnPropertyDescriptor(obj, sym);
    return desc !== undefined && desc.value === 'value';
}


export function test_getOwnPropertyDescriptor_20() {
    const sym = Symbol('invisible');
    const obj = { [sym]: 'secret' };
    const keys = Object.keys(obj);
    const desc = Reflect.getOwnPropertyDescriptor(obj, sym);
    return keys.length === 0 && desc !== undefined && desc.value === 'secret';
}


export function test_getOwnPropertyDescriptor_21() {
    const obj = Object.freeze({ x: 1 });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'x');
    return desc !== undefined &&
        desc.value === 1 &&
        desc.writable === false &&
        desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_22() {
    const obj = Object.seal({ y: 2 });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'y');
    return desc !== undefined &&
        desc.value === 2 &&
        desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_23() {
    const obj = Object.preventExtensions({ z: 3 });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'z');
    return desc !== undefined && desc.value === 3;
}


export function test_getOwnPropertyDescriptor_24() {
    const obj = { '': 'empty key' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, '');
    return desc !== undefined && desc.value === 'empty key';
}


export function test_getOwnPropertyDescriptor_25() {
    const obj = { 'key!@#': true };
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'key!@#');
    return desc !== undefined && desc.value === true;
}


export function test_getOwnPropertyDescriptor_26() {
    const obj = { '123': 'number key' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, '123');
    return desc !== undefined && desc.value === 'number key';
}


export function test_getOwnPropertyDescriptor_27() {
    const obj = { '123': 'str key' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, 123);
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_28() {
    const key = {
        toString() {
            return 'k';
        },
        [Symbol.toPrimitive]() {
            return 'k';
        }
    };
    const obj = { k: 'value' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, key);
    return desc !== undefined && desc.value === 'value';
}


export function test_getOwnPropertyDescriptor_29() {
    const key = {
        valueOf() {
            return 'x';
        }
    };
    const obj = { x: 1 };
    const desc = Reflect.getOwnPropertyDescriptor(obj, key);
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_30() {
    const key = {
        toString() {
            return 'y';
        }
    };
    const obj = { y: 2 };
    const desc = Reflect.getOwnPropertyDescriptor(obj, key);
    return desc !== undefined && desc.value === 2;
}


export function test_getOwnPropertyDescriptor_31() {
    return function(){
        const desc = Reflect.getOwnPropertyDescriptor(arguments, '0');
        return desc !== undefined && desc.value === 1;
    }(1);
}


export function test_getOwnPropertyDescriptor_32() {
    return function(){
        'use strict';
        const desc = Reflect.getOwnPropertyDescriptor(arguments, 'callee');
        return desc === undefined;
    }();
}


export function test_getOwnPropertyDescriptor_33() {
    return function outer(){
        const desc = Reflect.getOwnPropertyDescriptor(arguments, 'callee');
        return desc !== undefined && desc.get !== undefined;
    }();
}


export function test_getOwnPropertyDescriptor_34() {
    const d = new Date();
    d.custom = 'meta';
    const desc = Reflect.getOwnPropertyDescriptor(d, 'custom');
    return desc !== undefined && desc.value === 'meta';
}


export function test_getOwnPropertyDescriptor_35() {
    const r = /abc/;
    const desc = Reflect.getOwnPropertyDescriptor(r, 'source');
    return desc !== undefined && desc.value === 'abc' && !desc.writable && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_36() {

    function named() {
    }

    const desc = Reflect.getOwnPropertyDescriptor(named, 'name');
    return desc !== undefined && desc.value === 'named' && !desc.configurable;
}


export function test_getOwnPropertyDescriptor_37() {
    const fn = function () {
    };
    const desc = Reflect.getOwnPropertyDescriptor(fn, 'name');
    return desc !== undefined && desc.value === '';
}


export function test_getOwnPropertyDescriptor_38() {
    const fn = function (a, b) {
    };
    const desc = Reflect.getOwnPropertyDescriptor(fn, 'length');
    return desc !== undefined && desc.value === 2 && !desc.writable && !desc.configurable;
}


export function test_getOwnPropertyDescriptor_39() {
    let calls = 0;
    const obj = {};
    Object.defineProperty(obj, 'dynamic', {
        get() {
            calls++;
            return calls;
        },
        configurable: true
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'dynamic');
    return desc !== undefined &&
        typeof desc.get === 'function' &&
        desc.get.name === 'get' &&
        calls === 0;
}


export function test_getOwnPropertyDescriptor_40() {
    const obj = { x: 1 };
    delete obj.x;
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'x');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_41() {
    const obj = {};
    Object.defineProperty(obj, 'locked', {
        value: 1,
        configurable: false
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'locked');
    return desc !== undefined && desc.value === 1 && desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_42() {
    const obj = {};
    Object.defineProperty(obj, 'defined', {
        value: 'manual',
        writable: true,
        enumerable: true,
        configurable: true
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'defined');
    return desc !== undefined &&
        desc.value === 'manual' &&
        desc.writable === true &&
        desc.enumerable === true &&
        desc.configurable === true;
}


export function test_getOwnPropertyDescriptor_43() {
    const obj = {};
    Object.defineProperties(obj, {
        p1: { value: 1, enumerable: true },
        p2: { value: 2, enumerable: false }
    });
    const desc1 = Reflect.getOwnPropertyDescriptor(obj, 'p1');
    const desc2 = Reflect.getOwnPropertyDescriptor(obj, 'p2');
    return desc1 !== undefined && desc2 !== undefined &&
        desc1.value === 1 && desc1.enumerable === true &&
        desc2.value === 2 && desc2.enumerable === false;
}


export function test_getOwnPropertyDescriptor_44() {
    class C {
        constructor() {
            this.instanceProp = 'yes';
        }
    }

    const c = new C();
    const desc = Reflect.getOwnPropertyDescriptor(c, 'instanceProp');
    return desc !== undefined && desc.value === 'yes';
}


export function test_getOwnPropertyDescriptor_45() {
    class C {
        method() {
        }
    }

    const c = new C();
    const desc = Reflect.getOwnPropertyDescriptor(C.prototype, 'method');
    return desc !== undefined && typeof desc.value === 'function' && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_46() {
    class C {
        static staticProp = 'static';
    }

    const desc = Reflect.getOwnPropertyDescriptor(C, 'staticProp');
    return desc !== undefined && desc.value === 'static';
}


export function test_getOwnPropertyDescriptor_47() {
    class C {
        get computed() {
            return 'computed';
        }
    }

    const desc = Reflect.getOwnPropertyDescriptor(C.prototype, 'computed');
    return desc !== undefined && typeof desc.get === 'function' && desc.set === undefined;
}


export function test_getOwnPropertyDescriptor_48() {
    class C {
        set data(v) {
            this._data = v;
        }
    }

    const desc = Reflect.getOwnPropertyDescriptor(C.prototype, 'data');
    return desc !== undefined && typeof desc.set === 'function' && desc.get === undefined;
}


export function test_getOwnPropertyDescriptor_49() {
    const m = new Map();
    m.set('k', 'v');
    const desc = Reflect.getOwnPropertyDescriptor(m, 'size');
    return desc !== undefined && desc.value === 1 && !desc.writable && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_50() {
    const s = new Set([1, 2]);
    const desc = Reflect.getOwnPropertyDescriptor(s, 'size');
    return desc !== undefined && desc.value === 2 && !desc.writable && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_51() {
    const wm = new WeakMap();
    const desc = Reflect.getOwnPropertyDescriptor(wm, 'size');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_52() {
    const p = Promise.resolve(1);
    const desc = Reflect.getOwnPropertyDescriptor(p, 'then');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_53() {
    const buf = new ArrayBuffer(8);
    const desc = Reflect.getOwnPropertyDescriptor(buf, 'byteLength');
    return desc !== undefined && desc.value === 8 && !desc.writable;
}


export function test_getOwnPropertyDescriptor_54() {
    const ta = new Int32Array(4);
    const desc = Reflect.getOwnPropertyDescriptor(ta, 'length');
    return desc !== undefined && desc.value === 4 && !desc.writable;
}


export function test_getOwnPropertyDescriptor_55() {
    const target = { proxied: 'value' };
    const handler = {};
    const proxy = new Proxy(target, handler);
    const desc = Reflect.getOwnPropertyDescriptor(proxy, 'proxied');
    return desc !== undefined && desc.value === 'value';
}


export function test_getOwnPropertyDescriptor_56() {
    const target = { real: 1, hidden: 2 };
    const handler = {
        ownKeys() {
            return ['real'];
        }
    };
    const proxy = new Proxy(target, handler);
    const desc = Reflect.getOwnPropertyDescriptor(proxy, 'hidden');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_57() {
    const target = { x: 1 };
    const handler = {
        has() {
            return false;
        }
    };
    const proxy = new Proxy(target, handler);
    const desc = Reflect.getOwnPropertyDescriptor(proxy, 'x');
    return desc !== undefined && desc.value === 1;
}


export function test_getOwnPropertyDescriptor_58() {
    const obj = { [Symbol('s')]: 1 };
    const sym = Object.getOwnPropertySymbols(obj)[0];
    const desc = Reflect.getOwnPropertyDescriptor(obj, sym);
    return desc !== undefined && desc.value === 1;
}


export function test_getOwnPropertyDescriptor_59() {
    const obj = { old: 'data' };
    Object.defineProperty(obj, 'old', {
        get() {
            return 'new';
        },
        configurable: true
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'old');
    return desc !== undefined && typeof desc.get === 'function' && desc.value === undefined;
}


export function test_getOwnPropertyDescriptor_60() {
    const obj = {};
    Object.defineProperty(obj, 'mixed', {
        get() {
            return 'initial';
        },
        configurable: true
    });
    Object.defineProperty(obj, 'mixed', {
        value: 'final',
        configurable: true
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'mixed');
    return desc !== undefined && desc.value === 'final' && desc.get === undefined;
}


export function test_getOwnPropertyDescriptor_61() {
    if (typeof window === 'undefined') {
        return true;
    }
    const desc = Reflect.getOwnPropertyDescriptor(window, 'innerWidth');
    return desc !== undefined && !desc.writable && desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_62() {
    const desc = Reflect.getOwnPropertyDescriptor(globalThis, 'Reflect');
    return desc !== undefined && desc.value === Reflect;
}


export function test_getOwnPropertyDescriptor_63() {
    const desc = Reflect.getOwnPropertyDescriptor(Math, 'PI');
    return desc !== undefined && desc.value === Math.PI && !desc.writable && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_64() {
    const desc = Reflect.getOwnPropertyDescriptor(JSON, 'stringify');
    return desc !== undefined && typeof desc.value === 'function' && !desc.writable;
}


export function test_getOwnPropertyDescriptor_65() {
    const desc = Reflect.getOwnPropertyDescriptor(globalThis, 'Infinity');
    return desc !== undefined && desc.value === Infinity && !desc.writable;
}


export function test_getOwnPropertyDescriptor_66() {
    const desc = Reflect.getOwnPropertyDescriptor(globalThis, 'NaN');
    return desc !== undefined && isNaN(desc.value) && !desc.writable;
}


export function test_getOwnPropertyDescriptor_67() {
    const desc = Reflect.getOwnPropertyDescriptor(globalThis, 'undefined');
    return desc !== undefined && desc.value === undefined && !desc.writable;
}


export function test_getOwnPropertyDescriptor_68() {

    function F() {
    }

    const desc = Reflect.getOwnPropertyDescriptor(F, 'prototype');
    return desc !== undefined && desc.value === F.prototype && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_69() {
    const obj = Object.create(null);
    obj.x = 1;
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'x');
    return desc !== undefined && desc.value === 1;
}


export function test_getOwnPropertyDescriptor_70() {
    const obj = { __proto__: null };
    Object.defineProperty(obj, '__proto__', { value: 'fake', enumerable: true });
    const desc = Reflect.getOwnPropertyDescriptor(obj, '__proto__');
    return desc !== undefined && desc.value === 'fake';
}


export function test_getOwnPropertyDescriptor_71() {
    const s = Symbol();
    const obj = { [s]: 'symbol value' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, s);
    return desc !== undefined && desc.value === 'symbol value';
}


export function test_getOwnPropertyDescriptor_72() {
    const obj = {};
    Object.defineProperty(obj, 'deletable', {
        value: 1,
        configurable: true
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'deletable');
    return desc !== undefined && desc.configurable === true;
}


export function test_getOwnPropertyDescriptor_74() {
    const obj = {};
    Object.defineProperty(obj, 'const', {
        value: 1,
        writable: false
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'const');
    return desc !== undefined && desc.writable === false;
}


export function test_getOwnPropertyDescriptor_75() {
    const obj = {};
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'toLocaleString');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_76() {
    const obj = {};
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'hasOwnProperty');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_77() {
    const desc = Reflect.getOwnPropertyDescriptor(Object.prototype, 'toString');
    return desc !== undefined && !desc.configurable;
}


export function test_getOwnPropertyDescriptor_78() {
    const src = { a: 1 };
    const target = {};
    Object.assign(target, src);
    const desc = Reflect.getOwnPropertyDescriptor(target, 'a');
    return desc !== undefined && desc.value === 1 && desc.writable && desc.enumerable && desc.configurable;
}


export function test_getOwnPropertyDescriptor_79() {
    const proto = {
        get inherited() {
            return 'yes';
        }
    };
    const obj = Object.create(proto);
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'inherited');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_81() {
    const proto = { prop: 'parent' };
    const obj = Object.create(proto);
    Object.defineProperty(obj, 'prop', {
        get() {
            return 'overridden';
        }
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'prop');
    return desc !== undefined && desc.get !== undefined && desc.value === undefined;
}


export function test_getOwnPropertyDescriptor_82() {
    const grand = { g: 1 };
    const parent = Object.create(grand);
    parent.p = 2;
    const child = Object.create(parent);
    child.c = 3;
    const desc = Reflect.getOwnPropertyDescriptor(child, 'p');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_83() {
    const key = 'dynamicKey';
    const obj = { [key]: 'value' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, key);
    return desc !== undefined && desc.value === 'value';
}


export function test_getOwnPropertyDescriptor_84() {
    const key = {
        toString() {
            return 'objKey';
        }
    };
    const obj = { objKey: 'found' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, key);
    return desc !== undefined && desc.value === 'found';
}


export function test_getOwnPropertyDescriptor_85() {
    const obj = { true: 'boolean key' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, true);
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_86() {
    const obj = { false: 'f' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, false);
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_87() {
    const obj = { 0: 'zero' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, 0);
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_88() {
    const obj = { 0: 'zero' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, '0');
    return desc !== undefined && desc.value === 'zero';
}


export function test_getOwnPropertyDescriptor_89() {
    const obj = { '-1': 'negative' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, '-1');
    return desc !== undefined && desc.value === 'negative';
}


export function test_getOwnPropertyDescriptor_90() {
    const obj = { '1.5': 'float' };
    const desc = Reflect.getOwnPropertyDescriptor(obj, '1.5');
    return desc !== undefined && desc.value === 'float';
}


export function test_getOwnPropertyDescriptor_91() {
    const obj = { __proto__: null, x: 1 };
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'x');
    return desc !== undefined && desc.value === 1;
}


export function test_getOwnPropertyDescriptor_92() {
    const parent = { inherit: 1 };
    const child = { own: 2 };
    Object.setPrototypeOf(child, parent);
    const desc = Reflect.getOwnPropertyDescriptor(child, 'inherit');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_93() {
    const obj = {};
    Object.defineProperty(obj, 'locked', {
        value: 1,
        configurable: false
    });
    try {
        Object.defineProperty(obj, 'locked', { value: 2 });
        return false;
    } catch (e) {
        return true;
    }
}


export function test_getOwnPropertyDescriptor_94() {
    const err = new Error('fail');
    err.code = 'E1';
    const desc = Reflect.getOwnPropertyDescriptor(err, 'code');
    return desc !== undefined && desc.value === 'E1';
}


export function test_getOwnPropertyDescriptor_95() {
    const err = new SyntaxError('invalid');
    const desc = Reflect.getOwnPropertyDescriptor(err, 'message');
    return desc !== undefined && desc.value === 'invalid';
}


export function test_getOwnPropertyDescriptor_96() {
    const err = new URIError();
    const desc = Reflect.getOwnPropertyDescriptor(err, 'stack');
    return desc === undefined || (desc !== undefined && !desc.enumerable);
}


export function test_getOwnPropertyDescriptor_97() {
    const b = new Boolean(true);
    b.tag = 'bool';
    const desc = Reflect.getOwnPropertyDescriptor(b, 'tag');
    return desc !== undefined && desc.value === 'bool';
}


export function test_getOwnPropertyDescriptor_98() {
    const n = new Number(42);
    n.meta = 'answer';
    const desc = Reflect.getOwnPropertyDescriptor(n, 'meta');
    return desc !== undefined && desc.value === 'answer';
}


export function test_getOwnPropertyDescriptor_99() {
    const s = new String("text");
    s.flag = true;
    const desc = Reflect.getOwnPropertyDescriptor(s, 'flag');
    return desc !== undefined && desc.value === true;
}


export function test_getOwnPropertyDescriptor_100() {
    const d = new Date(2020, 0, 1);
    const desc = Reflect.getOwnPropertyDescriptor(d, 'getFullYear');
    return desc !== undefined && typeof desc.value === 'function';
}

export function test_getOwnPropertyDescriptor_101() {

    function* gen() {
    }

    const desc = Reflect.getOwnPropertyDescriptor(gen, 'prototype');
    return desc !== undefined && desc.value === gen.prototype && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_102() {

    function* gen() {
    }

    const desc = Reflect.getOwnPropertyDescriptor(gen.prototype, 'constructor');
    return desc !== undefined && desc.value === gen;
}


export function test_getOwnPropertyDescriptor_103() {
    const asyncFn = async function () {
    };
    const desc = Reflect.getOwnPropertyDescriptor(asyncFn, 'prototype');
    return desc !== undefined && typeof desc.value === 'object' && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_104() {
    const asyncFn = async function () {
    };
    const desc = Reflect.getOwnPropertyDescriptor(asyncFn, 'prototype');
    return desc !== undefined && desc.configurable === true;
}


export function test_getOwnPropertyDescriptor_105() {
    const obj = Object.create({}, { x: { value: 1 } });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'x');
    return desc !== undefined && desc.value === 1;
}


export function test_getOwnPropertyDescriptor_106() {
    const obj = Object.create({}, {
        a: { value: 'A', enumerable: true },
        b: { value: 'B', enumerable: false }
    });
    const descA = Reflect.getOwnPropertyDescriptor(obj, 'a');
    const descB = Reflect.getOwnPropertyDescriptor(obj, 'b');
    return descA !== undefined && descB !== undefined &&
        descA.enumerable === true && descB.enumerable === false;
}


export function test_getOwnPropertyDescriptor_108() {
    const arr = [1, , 3];
    const desc = Reflect.getOwnPropertyDescriptor(arr, '1');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_109() {
    const arr = [1, , 3];
    const desc = Reflect.getOwnPropertyDescriptor(arr, '2');
    return desc !== undefined && desc.value === 3;
}


export function test_getOwnPropertyDescriptor_110() {
    const ta = new Uint8Array([1]);
    const desc = Reflect.getOwnPropertyDescriptor(ta, '0');
    return desc !== undefined && desc.configurable === false && desc.enumerable === true;
}


export function test_getOwnPropertyDescriptor_112() {
    if (typeof Atomics === 'undefined') {
        return true;
    }
    const desc = Reflect.getOwnPropertyDescriptor(Atomics, 'add');
    return desc !== undefined && typeof desc.value === 'function' && !desc.writable;
}


export function test_getOwnPropertyDescriptor_113() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const desc = Reflect.getOwnPropertyDescriptor(Intl, 'Collator');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_114() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const desc = Reflect.getOwnPropertyDescriptor(Intl, 'DateTimeFormat');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_115() {
    const target = {};
    const wr = new WeakRef(target);
    const desc = Reflect.getOwnPropertyDescriptor(wr, 'deref');
    return desc !== undefined && typeof desc.value === 'function' && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_116() {
    if (typeof FinalizationRegistry === 'undefined') {
        return true;
    }
    const fr = new FinalizationRegistry(() => {
    });
    const desc = Reflect.getOwnPropertyDescriptor(fr, 'register');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_117() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'apply');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_118() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'construct');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_119() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'defineProperty');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_120() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'deleteProperty');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_121() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'has');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_122() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'ownKeys');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_123() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'isExtensible');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_124() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'preventExtensions');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_125() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'set');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_126() {
    const desc = Reflect.getOwnPropertyDescriptor(Reflect, 'setPrototypeOf');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_127() {
    let called = false;
    const target = { x: 1 };
    const handler = {
        getOwnPropertyDescriptor(t, key) {
            called = true;
            return Reflect.getOwnPropertyDescriptor(t, key);
        }
    };
    const proxy = new Proxy(target, handler);
    Reflect.getOwnPropertyDescriptor(proxy, 'x');
    return called;
}


export function test_getOwnPropertyDescriptor_128() {
    const target = { x: 1 };
    const handler = {
        getOwnPropertyDescriptor() {
            return false;
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.getOwnPropertyDescriptor(proxy, 'x');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getOwnPropertyDescriptor_129() {
    const target = {};
    Object.defineProperty(target, 'conflict', {
        value: 1,
        writable: false
    });
    const handler = {
        getOwnPropertyDescriptor() {
            return { value: 1, writable: true };
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.getOwnPropertyDescriptor(proxy, 'conflict');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getOwnPropertyDescriptor_130() {
    const target = { x: 1 };
    const handler = {
        getOwnPropertyDescriptor(t, key) {
            const desc = Reflect.getOwnPropertyDescriptor(t, key);
            if (desc) {
                desc.value = 999;
            }
            return desc;
        }
    };
    const proxy = new Proxy(target, handler);
    const desc = Reflect.getOwnPropertyDescriptor(proxy, 'x');
    return desc !== undefined && desc.value === 999;
}


export function test_getOwnPropertyDescriptor_131() {
    const priv = Symbol('private');

    class C {
        constructor() {
            this[priv] = 'secret';
        }

        getValue() {
            return this[priv];
        }
    }

    const c = new C();
    const desc = Reflect.getOwnPropertyDescriptor(c, priv);
    return desc !== undefined && desc.value === 'secret';
}


export function test_getOwnPropertyDescriptor_132() {
    const priv = Symbol('ro');
    const obj = {};
    Object.defineProperty(obj, priv, {
        value: 'read-only',
        writable: false,
        configurable: false
    });
    const desc = Reflect.getOwnPropertyDescriptor(obj, priv);
    return desc !== undefined && desc.value === 'read-only' && !desc.writable && !desc.configurable;
}


export function test_getOwnPropertyDescriptor_133() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const arr = iframeWindow.Array.from([1, 2]);
    const desc = Reflect.getOwnPropertyDescriptor(arr, '0');
    return desc !== undefined && desc.value === 1;
}


export function test_getOwnPropertyDescriptor_134() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const arr = new iframeWindow.Array(1, 2, 3);
    const desc = Reflect.getOwnPropertyDescriptor(arr, 'length');
    return desc !== undefined && desc.value === 3;
}


export function test_getOwnPropertyDescriptor_135() {
    const obj = Object.freeze({});
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'none');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_136() {
    const obj = Object.freeze({ x: 1 });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'x');
    return desc !== undefined && desc.writable === false && desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_137() {
    const obj = Object.seal({ y: 2 });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'y');
    return desc !== undefined && desc.configurable === false;
}


export function test_getOwnPropertyDescriptor_138() {
    const obj = Object.preventExtensions({ z: 3 });
    const desc = Reflect.getOwnPropertyDescriptor(obj, 'z');
    return desc !== undefined && desc.value === 3;
}


export function test_getOwnPropertyDescriptor_139() {
    const r = /abc/gim;
    const desc = Reflect.getOwnPropertyDescriptor(r, 'flags');
    return desc !== undefined && desc.value === 'gim' && !desc.writable && !desc.enumerable;
}


export function test_getOwnPropertyDescriptor_140() {
    const r = /test/g;
    const descGlobal = Reflect.getOwnPropertyDescriptor(r, 'global');
    return descGlobal !== undefined && descGlobal.value === true && !descGlobal.writable;
}


export function test_getOwnPropertyDescriptor_141() {
    'use strict';

    function f() {
    }

    const desc = Reflect.getOwnPropertyDescriptor(f, 'arguments');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_142() {

    function f() {
    }

    const desc = Reflect.getOwnPropertyDescriptor(f, 'caller');
    return desc === undefined;
}


export function test_getOwnPropertyDescriptor_143() {
    const e = new TypeError('oops');
    const desc = Reflect.getOwnPropertyDescriptor(e, 'name');
    return desc !== undefined && desc.value === 'TypeError' && desc.writable;
}


export function test_getOwnPropertyDescriptor_144() {
    const e = new Error('custom');
    const desc = Reflect.getOwnPropertyDescriptor(e, 'message');
    return desc !== undefined && desc.value === 'custom';
}


export function test_getOwnPropertyDescriptor_145() {
    const p = Promise.resolve();
    const desc = Reflect.getOwnPropertyDescriptor(p, 'catch');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_146() {
    const p = Promise.resolve();
    const desc = Reflect.getOwnPropertyDescriptor(p, 'finally');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_147() {
    const m = new Map();
    const desc = Reflect.getOwnPropertyDescriptor(m, 'set');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_148() {
    const s = new Set();
    const desc = Reflect.getOwnPropertyDescriptor(s, 'add');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_149() {
    const view = new Int8Array(2);
    const desc = Reflect.getOwnPropertyDescriptor(ArrayBuffer, 'isView');
    return desc !== undefined && typeof desc.value === 'function';
}


export function test_getOwnPropertyDescriptor_150() {
    const builtins = [
        Object, Function, Array, String, Boolean, Number, Date, RegExp,
        Error, Math, JSON, Promise, Set, Map, WeakSet, WeakMap,
        ArrayBuffer, DataView, Symbol, Reflect, Intl
    ];
    return builtins.every(Builtin => {
        const keys = Object.getOwnPropertyNames(Builtin).concat(
            Object.getOwnPropertySymbols(Builtin)
        );
        return keys.length === 0 || keys.some(key =>
        Reflect.getOwnPropertyDescriptor(Builtin, key) !== undefined
        );
    });
}
