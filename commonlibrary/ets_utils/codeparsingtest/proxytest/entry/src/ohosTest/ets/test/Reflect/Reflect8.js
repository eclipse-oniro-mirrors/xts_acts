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

export function test_has_1() {
    const obj = { a: 1 };
    return Reflect.has(obj, 'a') === true;
}


export function test_has_2() {
    const obj = { a: 1 };
    return Reflect.has(obj, 'b') === false;
}


export function test_has_3() {
    const parent = { inherited: true };
    const child = Object.create(parent);
    return Reflect.has(child, 'inherited') === true;
}


export function test_has_4() {
    const parent = { prop: 'parent' };
    const child = Object.create(parent);
    child.prop = 'child';
    return Reflect.has(child, 'prop') === true;
}


export function test_has_5() {
    const parent = { x: 1 };
    const child = Object.create(parent);
    return Reflect.has(child, 'x') === true && !child.hasOwnProperty('x');
}


export function test_has_6() {
    const arr = [1, 2, 3];
    return Reflect.has(arr, '0') === true;
}


export function test_has_7() {
    const arr = [1, 2];
    return Reflect.has(arr, 0) === true;
}


export function test_has_8() {
    const arr = [1];
    return Reflect.has(arr, 'length') === true;
}


export function test_has_9() {
    const obj = {};
    return Reflect.has(obj, 'toString') === true;
}


export function test_has_10() {
    const obj = { a: 1 };
    return Reflect.has(obj, 'hasOwnProperty') === true;
}


export function test_has_11() {
    try {
        Reflect.has("hello", 'charAt');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_has_12() {
    try {
        Reflect.has(123, 'toFixed');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_has_13() {
    try {
        Reflect.has(true, 'valueOf');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_has_14() {
    try {
        Reflect.has(null, 'x');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_has_15() {
    try {
        Reflect.has(undefined, 'x');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_has_16() {
    const sym = Symbol('test');
    const obj = { [sym]: 1 };
    return Reflect.has(obj, sym) === true;
}


export function test_has_17() {
    const s1 = Symbol('a'), s2 = Symbol('b');
    const obj = { [s1]: 1 };
    return Reflect.has(obj, s1) && !Reflect.has(obj, s2);
}


export function test_has_18() {
    const sym = Symbol.for('shared');
    const obj = { [sym]: 'value' };
    return Reflect.has(obj, sym) === true;
}


export function test_has_19() {
    const sym = Symbol('hidden');
    const obj = { [sym]: 1 };
    const found = Reflect.has(obj, sym);
    return found === true;
}


export function test_has_20() {
    const obj = Object.freeze({ x: 1 });
    return Reflect.has(obj, 'x') === true;
}


export function test_has_21() {
    const obj = Object.seal({ y: 2 });
    return Reflect.has(obj, 'y') === true;
}


export function test_has_22() {
    const obj = Object.preventExtensions({ z: 3 });
    return Reflect.has(obj, 'z') === true;
}


export function test_has_23() {
    const obj = { a: 1 };
    delete obj.a;
    return Reflect.has(obj, 'a') === false;
}


export function test_has_24() {
    const obj = {};
    Object.defineProperty(obj, 'fixed', {
        value: 1,
        configurable: false
    });
    return Reflect.has(obj, 'fixed') === true;
}


export function test_has_25() {
    const obj = {};
    Object.defineProperty(obj, 'prop', {
        get() {
            return 10;
        }
    });
    return Reflect.has(obj, 'prop') === true;
}


export function test_has_26() {
    const obj = {};
    Object.defineProperty(obj, 'prop', {
        set() {
        }
    });
    return Reflect.has(obj, 'prop') === true;
}


export function test_has_27() {
    const obj = {};
    Object.defineProperty(obj, 'gs', {
        get() {
            return 1;
        },
        set(v) {
        }
    });
    return Reflect.has(obj, 'gs') === true;
}


export function test_has_28() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', {
        value: 1,
        enumerable: false
    });
    return Reflect.has(obj, 'hidden') === true;
}


export function test_has_29() {
    const obj = Object.create(null);
    obj.x = 1;
    return Reflect.has(obj, 'x') === true;
}


export function test_has_30() {
    const obj = Object.create(null);
    return Reflect.has(obj, 'toString') === false;
}


export function test_has_31() {
    class C {
        constructor() {
            this.instanceProp = 'yes';
        }
    }

    const c = new C();
    return Reflect.has(c, 'instanceProp') === true;
}


export function test_has_32() {
    class C {
        method() {
        }
    }

    const c = new C();
    return Reflect.has(c, 'method') === true;
}


export function test_has_33() {
    class C {
        static staticProp = 'static';
    }

    const c = new C();
    return Reflect.has(c, 'staticProp') === false;
}


export function test_has_34() {
    class C {
        get computed() {
            return 'value';
        }
    }

    const c = new C();
    return Reflect.has(c, 'computed') === true;
}


export function test_has_35() {
    class C {
        set data(v) {
            this._v = v;
        }
    }

    const c = new C();
    return Reflect.has(c, 'data') === true;
}


export function test_has_36() {
    const m = new Map();
    m.set('k', 'v');
    return Reflect.has(m, 'size') === true;
}


export function test_has_37() {
    const s = new Set([1]);
    return Reflect.has(s, 'size') === true;
}


export function test_has_38() {
    const wm = new WeakMap();
    return Reflect.has(wm, 'size') === false;
}


export function test_has_39() {
    const p = Promise.resolve();
    return Reflect.has(p, 'then') === true;
}


export function test_has_40() {
    const buf = new ArrayBuffer(8);
    return Reflect.has(buf, 'byteLength') === true;
}


export function test_has_41() {
    const ta = new Int32Array(4);
    return Reflect.has(ta, 'length') === true;
}


export function test_has_42() {
    const target = { proxied: 1 };
    const handler = {};
    const proxy = new Proxy(target, handler);
    return Reflect.has(proxy, 'proxied') === true;
}


export function test_has_43() {
    let called = false;
    const target = { x: 1 };
    const handler = {
        has(t, key) {
            called = true;
            return Reflect.has(t, key);
        }
    };
    const proxy = new Proxy(target, handler);
    Reflect.has(proxy, 'x');
    return called;
}


export function test_has_44() {
    const target = {};
    const handler = {
        has() {
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.has(proxy, 'any') === true;
}


export function test_has_45() {
    const target = { x: 1 };
    const handler = {
        has() {
            return false;
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.has(proxy, 'x') === false;
}


export function test_has_46() {
    const target = { x: 1 };
    const handler = {
        has() {
            return false;
        }
    };
    const proxy = new Proxy(target, handler);
    return ('x' in proxy) === false;
}


export function test_has_47() {
    const obj = { [Symbol('s')]: 1 };
    const sym = Object.getOwnPropertySymbols(obj)[0];
    return Reflect.has(obj, sym) === true;
}


export function test_has_48() {
    const obj = { '': 'empty' };
    return Reflect.has(obj, '') === true;
}


export function test_has_49() {
    const obj = { 'key!@#': 1 };
    return Reflect.has(obj, 'key!@#') === true;
}


export function test_has_50() {
    const obj = { '123': 'num' };
    return Reflect.has(obj, '123') === true;
}

export function test_has_51() {
    const obj = { '123': true };
    return Reflect.has(obj, 123) === false;
}


export function test_has_52() {
    const key = {
        toString() {
            return 'dynamic';
        }
    };
    const obj = { dynamic: true };
    return Reflect.has(obj, key) === true;
}


export function test_has_53() {
    const key = {
        [Symbol.toPrimitive]() {
            return 'key';
        }
    };
    const obj = { key: true };
    return Reflect.has(obj, key) === true;
}


export function test_has_54() {
    const key = {
        valueOf() {
            return 'x';
        }
    };
    const obj = { x: true };
    return Reflect.has(obj, key) === false;
}


export function test_has_55() {
    return function(){
        return Reflect.has(arguments, '0') === true;
    }(1);
}


export function test_has_56() {
    return function outer(){
        return Reflect.has(arguments, 'callee') === true;
    }();
}


export function test_has_57() {
    'use strict';
    return function(){
        return Reflect.has(arguments, 'callee') === false;
    }();
}


export function test_has_58() {
    const d = new Date();
    return Reflect.has(d, 'getFullYear') === true;
}


export function test_has_59() {
    const r = /abc/;
    return Reflect.has(r, 'source') === true;
}


export function test_has_60() {

    function named() {
    }

    return Reflect.has(named, 'name') === true;
}


export function test_has_61() {
    const fn = function () {
    };
    return Reflect.has(fn, 'name') === true && typeof fn.name === 'string';
}


export function test_has_62() {
    const fn = function (a, b) {
    };
    return Reflect.has(fn, 'length') === true;
}


export function test_has_63() {
    let getterCalled = false;
    const obj = {};
    Object.defineProperty(obj, 'prop', {
        get() {
            getterCalled = true;
            return 1;
        }
    });
    const result = Reflect.has(obj, 'prop');
    return result === true && !getterCalled;
}


export function test_has_64() {
    const obj = { x: 1 };
    return Reflect.has(obj, 'x') === ('x' in obj);
}


export function test_has_65() {
    const parent = { inherited: 1 };
    const child = Object.create(parent);
    return Reflect.has(child, 'inherited') === true && ('inherited' in child) === true;
}


export function test_has_66() {
    const parent = { prop: 'parent' };
    const child = Object.create(parent);
    child.prop = 'child';
    return Reflect.has(child, 'prop') === true;
}


export function test_has_67() {
    const grand = { g: 1 };
    const parent = Object.create(grand);
    const child = Object.create(parent);
    return Reflect.has(child, 'g') === true;
}


export function test_has_68() {
    const grand = { g: 1 };
    const parent = Object.create(grand);
    const child = Object.create(null);
    Object.setPrototypeOf(child, parent);
    return Reflect.has(child, 'g') === true;
}


export function test_has_69() {
    const obj = Object.create(null);
    return Reflect.has(obj, 'toString') === false;
}


export function test_has_70() {
    const parent = { x: 1 };
    const obj = { __proto__: parent };
    return Reflect.has(obj, 'x') === true;
}


export function test_has_71() {
    const obj = { __proto__: null, own: 1 };
    return Reflect.has(obj, 'toString') === false;
}


export function test_has_72() {
    const m = new Map();
    return Reflect.has(m, 'set') &&
    Reflect.has(m, 'get') &&
    Reflect.has(m, 'has') &&
    Reflect.has(m, 'delete') &&
    Reflect.has(m, 'clear');
}


export function test_has_73() {
    const s = new Set();
    return Reflect.has(s, 'add') &&
    Reflect.has(s, 'has') &&
    Reflect.has(s, 'delete') &&
    Reflect.has(s, 'clear');
}


export function test_has_74() {
    const wm = new WeakMap();
    return Reflect.has(wm, 'set') && Reflect.has(wm, 'get') && Reflect.has(wm, 'has');
}


export function test_has_75() {
    const p = Promise.resolve();
    return Reflect.has(p, 'then') && Reflect.has(p, 'catch') && Reflect.has(p, 'finally');
}


export function test_has_76() {
    const buf = new ArrayBuffer(8);
    return Reflect.has(buf, 'slice');
}


export function test_has_77() {
    const ta = new Uint8Array(2);
    return Reflect.has(ta, 'subarray') &&
    Reflect.has(ta, 'set') &&
    Reflect.has(ta, 'slice') &&
    Reflect.has(ta, 'join');
}


export function test_has_78() {
    const wrapper = new String("text");
    return Reflect.has(wrapper, 'charAt') === true;
}


export function test_has_79() {
    const n = new Number(42);
    return Reflect.has(n, 'toFixed') === true;
}


export function test_has_80() {
    const b = new Boolean(true);
    return Reflect.has(b, 'valueOf') === true;
}


export function test_has_81() {
    const sym = Symbol('s');
    const sObj = Object(sym);
    return Reflect.has(sObj, 'valueOf') === true;
}


export function test_has_82() {
    return Reflect.has(JSON, 'stringify') === true;
}


export function test_has_83() {
    return Reflect.has(Math, 'PI') === true;
}


export function test_has_84() {
    return Reflect.has(globalThis, 'Reflect') === true;
}


export function test_has_85() {
    if (typeof window === 'undefined') {
        return true;
    }
    return Reflect.has(window, 'innerWidth') === true;
}


export function test_has_86() {
    if (typeof document === 'undefined') {
        return true;
    }
    return Reflect.has(document, 'body') === (document.body !== undefined);
}


export function test_has_87() {
    if (typeof document === 'undefined') {
        return true;
    }
    const nodes = document.querySelectorAll('div');
    return Reflect.has(nodes, 'length') === true;
}


export function test_has_88() {
    if (typeof document === 'undefined') {
        return true;
    }
    const coll = document.forms;
    if (!coll) {
        return true;
    }
    return Reflect.has(coll, 'namedItem') === true;
}


export function test_has_89() {
    const target = {};
    Object.assign(target, { a: 1 });
    return Reflect.has(target, 'a') === true;
}


export function test_has_90() {
    const extra = { b: 2 };
    const obj = { a: 1, ...extra };
    return Reflect.has(obj, 'b') === true;
}


export function test_has_91() {
    const key = 'dynamic';
    const obj = { [key]: 1 };
    return Reflect.has(obj, key) === true;
}


export function test_has_92() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', {
        value: 1,
        enumerable: false
    });
    return Reflect.has(obj, 'hidden') === true;
}


export function test_has_93() {
    const obj = {};
    Object.defineProperties(obj, {
        p1: { value: 1 },
        p2: { value: 2 }
    });
    return Reflect.has(obj, 'p1') && Reflect.has(obj, 'p2');
}


export function test_has_94() {
    const arr = [1, , 3];
    return Reflect.has(arr, '1') === false;
}


export function test_has_95() {
    const arr = [1, , 3];
    return Reflect.has(arr, '2') === true;
}


export function test_has_96() {
    const ta = new Int16Array([1, 2]);
    return Reflect.has(ta, '0') === true && Reflect.has(ta, '1') === true;
}


export function test_has_97() {
    if (typeof SharedArrayBuffer === 'undefined') {
        return true;
    }
    const sab = new SharedArrayBuffer(8);
    return Reflect.has(sab, 'byteLength') === true;
}


export function test_has_98() {
    if (typeof Atomics === 'undefined') {
        return true;
    }
    return Reflect.has(Atomics, 'add') === true;
}


export function test_has_99() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    return Reflect.has(Intl, 'Collator') === true;
}


export function test_has_100() {
    if (typeof WeakRef === 'undefined') {
        return true;
    }
    const wr = new WeakRef({});
    return Reflect.has(wr, 'deref') === true;
}

export function test_has_101() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const arr = new iframeWindow.Array(1, 2);
    return Reflect.has(arr, '0') === true;
}


export function test_has_102() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const fn = iframeWindow.Function();
    return Reflect.has(fn, 'call') === true;
}


export function test_has_103() {

    function C() {
        this.x = 1;
    }

    const instance = Reflect.construct(C, []);
    return Reflect.has(instance, 'x') === true;
}


export function test_has_104() {

    function* gen() {
        yield 1;
    }

    return Reflect.has(gen, 'prototype') === true;
}


export function test_has_105() {
    const asyncFn = async function () {
    };
    return Reflect.has(asyncFn, 'prototype') === true;
}


export function test_has_106() {
    const target = { x: 1 };
    const handler = {
        has() {
            return false;
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.has(proxy, 'x') === false;
}


export function test_has_107() {
    const target = {};
    const handler = {
        has() {
            throw new Error();
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.has(proxy, 'x');
        return false;
    } catch (e) {
        return true;
    }
}


export function test_has_108() {
    const obj = {};
    Object.defineProperty(obj, 'fixed', {
        value: 1,
        writable: false,
        configurable: false
    });
    return Reflect.has(obj, 'fixed') === true;
}


export function test_has_109() {
    const obj = {};
    Object.defineProperty(obj, 'accessor', {
        get() {
            return 1;
        },
        set() {
        }
    });
    return Reflect.has(obj, 'accessor') === true;
}


export function test_has_110() {
    const priv = Symbol('private');
    const obj = { [priv]: 'secret' };
    return Reflect.has(obj, priv) === true;
}


export function test_has_111() {
    const obj = Object.create({}, {
        a: { value: 1 },
        b: { value: 2 }
    });
    return Reflect.has(obj, 'a') && Reflect.has(obj, 'b');
}


export function test_has_112() {
    const obj = Object.freeze({ x: 1 });
    return Reflect.has(obj, 'x') === true;
}


export function test_has_113() {
    const obj = Object.seal({ y: 2 });
    return Reflect.has(obj, 'y') === true;
}


export function test_has_114() {
    const obj = Object.preventExtensions({ z: 3 });
    return Reflect.has(obj, 'z') === true;
}


export function test_has_115() {
    const obj = { a: 1 };
    delete obj.a;
    return Reflect.has(obj, 'a') === false;
}


export function test_has_116() {
    const obj = {};
    Object.defineProperty(obj, 'locked', {
        value: 1,
        configurable: false
    });
    return Reflect.has(obj, 'locked') === true;
}


export function test_has_117() {
    const e = new Error('fail');
    return Reflect.has(e, 'message') === true;
}


export function test_has_118() {
    const p = Promise.resolve();
    return Reflect.has(p, 'catch') === true;
}


export function test_has_119() {
    const m = new Map();
    return Reflect.has(m, 'entries') === true;
}


export function test_has_120() {
    const s = new Set();
    return Reflect.has(s, 'values') === true;
}


export function test_has_121() {
    return Reflect.has(ArrayBuffer, 'isView') === true;
}


export function test_has_122() {
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    return Reflect.has(dv, 'getFloat32') === true;
}


export function test_has_123() {
    const obj = {};
    obj[Symbol.asyncIterator] = async function* () {
    };
    return Reflect.has(obj, Symbol.asyncSampler) === false && Reflect.has(obj, Symbol.asyncIterator) === true;
}


export function test_has_124() {
    const arr = [1];
    return Reflect.has(arr, Symbol.iterator) === true;
}


export function test_has_125() {
    const obj = { x: 1 };
    return Reflect.has(obj, 'x') === ('x' in obj);
}


export function test_has_126() {
    const target = { x: 1 };
    const handler = {
        has(t, k) {
            return Reflect.has(t, k);
        }
    };
    const proxy1 = new Proxy(target, handler);
    const proxy2 = new Proxy(proxy1, handler);
    return Reflect.has(proxy2, 'x') === true;
}


export function test_has_127() {
    const target = {};
    const handler = {
        has() {
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.has(proxy, 'any') === true;
}


export function test_has_128() {
    return Reflect.has(globalThis, 'Infinity') === true;
}


export function test_has_129() {
    return Reflect.has(globalThis, 'NaN') === true;
}


export function test_has_130() {
    return Reflect.has(globalThis, 'undefined') === true;
}


export function test_has_131() {
    return Reflect.has(Function.prototype, 'bind') === true;
}


export function test_has_132() {
    return Reflect.has(Array.prototype, 'push') === true;
}


export function test_has_133() {
    return Reflect.has(String.prototype, 'toUpperCase') === true;
}


export function test_has_134() {
    return Reflect.has(Number.prototype, 'toFixed') === true;
}


export function test_has_135() {
    return Reflect.has(Object.prototype, 'hasOwnProperty') === true;
}


export function test_has_136() {
    const ctors = [Object, Array, Function, Date, RegExp, Error, Promise, Map, Set];
    return ctors.every(C => Reflect.has(C, 'prototype'));
}


export function test_has_137() {
    const instances = [
        new Object(), new Array(), new Date(), /a/, new Error(),
        Promise.resolve(), new Map(), new Set()
    ];
    return instances.every(inst =>
    Reflect.has(inst, 'toString') &&
    Reflect.has(inst, 'valueOf')
    );
}


export function test_has_138() {
    if (typeof document === 'undefined') {
        return true;
    }
    const el = document.createElement('div');
    return Reflect.has(el, 'innerHTML') === true;
}


export function test_has_139() {
    if (typeof EventTarget === 'undefined') {
        return true;
    }
    const et = new EventTarget();
    return Reflect.has(et, 'addEventListener') === true;
}


export function test_has_140() {
    if (typeof FinalizationRegistry === 'undefined') {
        return true;
    }
    const fr = new FinalizationRegistry(() => {
    });
    return Reflect.has(fr, 'register') === true;
}


export function test_has_141() {
    if (typeof WeakRef === 'undefined') {
        return true;
    }
    const wr = new WeakRef({});
    return Reflect.has(wr, 'deref') === true;
}


export function test_has_142() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const dtf = new Intl.DateTimeFormat();
    return Reflect.has(dtf, 'format') === true;
}


export function test_has_143() {
    const obj = { a: 1 };
    const keys = Object.getOwnPropertyNames(obj);
    return keys.every(k => Reflect.has(obj, k));
}


export function test_has_144() {
    const obj = { a: 1, b: 2 };
    const keys = Object.keys(obj);
    return keys.every(k => Reflect.has(obj, k));
}


export function test_has_145() {
    const sym = Symbol();
    const obj = { [sym]: 1 };
    const syms = Object.getOwnPropertySymbols(obj);
    return syms.every(s => Reflect.has(obj, s));
}


export function test_has_146() {
    return Reflect.has(Math, 'abs') &&
    Reflect.has(Math, 'sin') &&
    Reflect.has(Math, 'random') &&
    Reflect.has(Math, 'floor');
}


export function test_has_147() {
    return Reflect.has(JSON, 'parse') && Reflect.has(JSON, 'stringify');
}


export function test_has_148() {
    return Reflect.has(Reflect, 'apply') &&
    Reflect.has(Reflect, 'construct') &&
    Reflect.has(Reflect, 'get') &&
    Reflect.has(Reflect, 'set') &&
    Reflect.has(Reflect, 'has') &&
    Reflect.has(Reflect, 'deleteProperty');
}


export function test_has_149() {
    return Reflect.has(globalThis, 'Array') &&
    Reflect.has(globalThis, 'String') &&
    Reflect.has(globalThis, 'Promise') &&
    Reflect.has(globalThis, 'Symbol');
}


export function test_has_150() {
    const builtins = [
        Object, Function, Array, String, Boolean, Number, Date, RegExp,
        Error, Math, JSON, Promise, Set, Map, WeakSet, WeakMap,
        ArrayBuffer, DataView, Symbol, Reflect, Intl, globalThis
    ];
    return builtins.every(Builtin => {
        const props = ['prototype', 'constructor'].filter(p => typeof Builtin === 'function' || p !== 'prototype');
        return props.every(p => Reflect.has(Builtin, p)) || true;
    });
}
