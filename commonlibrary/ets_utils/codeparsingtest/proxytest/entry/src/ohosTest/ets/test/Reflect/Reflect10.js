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

export function test_ownKeys_1() {
    const obj = { a: 1, b: 2 };
    const keys = Reflect.ownKeys(obj);
    return Array.isArray(keys) && keys.length === 2 && keys.includes('a') && keys.includes('b');
}


export function test_ownKeys_2() {
    const obj = {};
    const keys = Reflect.ownKeys(obj);
    return Array.isArray(keys) && keys.length === 0;
}


export function test_ownKeys_3() {
    const arr = ['x', 'y'];
    const keys = Reflect.ownKeys(arr);
    return keys.includes('0') && keys.includes('1') && keys.includes('length');
}


export function test_ownKeys_4() {
    const obj = { 2: 'two', 1: 'one', 3: 'three' };
    const keys = Reflect.ownKeys(obj);
    return keys[0] === '1' && keys[1] === '2' && keys[2] === '3';
}


export function test_ownKeys_5() {
    const obj = {};
    obj.b = 1;
    obj.a = 2;
    obj.c = 3;
    const keys = Reflect.ownKeys(obj);
    return keys[0] === 'b' && keys[1] === 'a' && keys[2] === 'c';
}


export function test_ownKeys_6() {
    const sym = Symbol('s');
    const obj = { [sym]: 1 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes(sym);
}


export function test_ownKeys_7() {
    const s1 = Symbol('a'), s2 = Symbol('b');
    const obj = { [s1]: 1, [s2]: 2 };
    const keys = Reflect.ownKeys(obj);
    return keys[keys.length - 2] === s1 && keys[keys.length - 1] === s2;
}


export function test_ownKeys_8() {
    const sym = Symbol.for('shared');
    const obj = { [sym]: 'value' };
    const keys = Reflect.ownKeys(obj);
    return keys.includes(sym);
}


export function test_ownKeys_9() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', {
        value: 1,
        enumerable: false
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('hidden');
}


export function test_ownKeys_10() {
    const obj = Object.create(null);
    obj.x = 1;
    const keys = Reflect.ownKeys(obj);
    return keys.includes('x') && keys.length === 1;
}


export function test_ownKeys_11() {
    try {
        Reflect.ownKeys("hello");
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_ownKeys_12() {
    try {
        Reflect.ownKeys(123);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_ownKeys_13() {
    try {
        Reflect.ownKeys(true);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_ownKeys_14() {
    try {
        Reflect.ownKeys(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_ownKeys_15() {
    try {
        Reflect.ownKeys(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_ownKeys_16() {
    class C {
        constructor() {
            this.instanceProp = 'yes';
        }
    }

    const c = new C();
    const keys = Reflect.ownKeys(c);
    return keys.includes('instanceProp');
}


export function test_ownKeys_17() {
    class C {
        method() {
        }
    }

    const c = new C();
    const keys = Reflect.ownKeys(c);
    return !keys.includes('method');
}


export function test_ownKeys_18() {
    class C {
        static staticProp = 'static';
    }

    const c = new C();
    const keys = Reflect.ownKeys(c);
    return !keys.includes('staticProp');
}


export function test_ownKeys_19() {
    const obj = {};
    Object.defineProperty(obj, 'prop', {
        get() {
            return 1;
        }
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('prop');
}


export function test_ownKeys_20() {
    const obj = {};
    Object.defineProperty(obj, 'prop', {
        set(v) {
        }
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('prop');
}


export function test_ownKeys_21() {
    const obj = {};
    Object.defineProperty(obj, 'gs', {
        get() {
        }, set() {
        }
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('gs');
}


export function test_ownKeys_22() {
    const m = new Map([['a', 1]]);
    const keys = Reflect.ownKeys(m);
    return keys.length == 0;
}


export function test_ownKeys_23() {
    const s = new Set([1]);
    const keys = Reflect.ownKeys(s);
    return keys.length == 0;
}


export function test_ownKeys_24() {
    const wm = new WeakMap();
    wm.set({}, 'value');
    const keys = Reflect.ownKeys(wm);
    return keys.length == 0;
}


export function test_ownKeys_25() {
    const p = Promise.resolve(1);
    const keys = Reflect.ownKeys(p);
    return keys.includes('then') || keys.some(k => typeof k === 'symbol');
}


export function test_ownKeys_26() {
    const buf = new ArrayBuffer(8);
    const keys = Reflect.ownKeys(buf);
    return keys.includes('byteLength');
}


export function test_ownKeys_27() {
    const ta = new Int32Array(2);
    const keys = Reflect.ownKeys(ta);
    return keys.includes('0') && keys.includes('length');
}


export function test_ownKeys_28() {
    const target = { x: 1 };
    const handler = {};
    const proxy = new Proxy(target, handler);
    const keys = Reflect.ownKeys(proxy);
    return keys.includes('x');
}


export function test_ownKeys_29() {
    let called = false;
    const target = { x: 1 };
    const handler = {
        ownKeys() {
            called = true;
            return Reflect.ownKeys(target);
        }
    };
    const proxy = new Proxy(target, handler);
    Reflect.ownKeys(proxy);
    return called;
}


export function test_ownKeys_30() {
    const target = {};
    const handler = {
        ownKeys() {
            return ['extra'];
        }
    };
    const proxy = new Proxy(target, handler);
    const keys = Reflect.ownKeys(proxy);
    return keys.includes('extra');
}


export function test_ownKeys_31() {
    const target = { x: 1 };
    const handler = {
        ownKeys() {
            return [];
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.ownKeys(proxy);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_ownKeys_33() {
    const target = { x: 1 };
    const handler = {
        ownKeys() {
            return ['x', 'x'];
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.ownKeys(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_ownKeys_34() {
    return function(){
        const keys = Reflect.ownKeys(arguments);
        return keys.includes('0') && keys.includes('callee');
    }(1);
}


export function test_ownKeys_35() {
    'use strict';
    return function(){
        const keys = Reflect.ownKeys(arguments);
        return keys.includes('callee');
    }();
}


export function test_ownKeys_36() {
    const d = new Date();
    d.custom = 'meta';
    const keys = Reflect.ownKeys(d);
    return keys.includes('custom');
}


export function test_ownKeys_37() {
    const r = /abc/g;
    const keys = Reflect.ownKeys(r);
    return keys.includes('source') && keys.includes('flags');
}


export function test_ownKeys_38() {

    function fn() {
    }

    fn.prop = 'value';
    const keys = Reflect.ownKeys(fn);
    return keys.includes('prop');
}


export function test_ownKeys_39() {
    const sObj = new String("text");
    const keys = Reflect.ownKeys(sObj);
    return keys.includes('0') && keys.includes('length');
}


export function test_ownKeys_40() {
    const nObj = Object(42);
    nObj.meta = 1;
    const keys = Reflect.ownKeys(nObj);
    return keys.includes('meta');
}


export function test_ownKeys_51() {
    const obj = { 3: 'three', 1: 'one', 2: 'two' };
    const keys = Reflect.ownKeys(obj);
    return keys[0] === '1' && keys[1] === '2' && keys[2] === '3';
}


export function test_ownKeys_52() {
    const obj = { 1: 'num1', a: 'str', 0: 'zero' };
    const keys = Reflect.ownKeys(obj);
    return keys[0] === '0' && keys[1] === '1' && keys[2] === 'a';
}


export function test_ownKeys_53() {
    const obj = { '-1': 'neg', 0: 'zero' };
    const keys = Reflect.ownKeys(obj);
    return keys[0] === '0' && keys[1] === '-1';
}


export function test_ownKeys_54() {
    const obj = { '1.5': 'float', 1: 'int' };
    const keys = Reflect.ownKeys(obj);
    return keys[0] === '1' && keys[1] === '1.5';
}


export function test_ownKeys_55() {
    const obj = { '': 'empty', a: 1 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes('');
}


export function test_ownKeys_56() {
    const obj = { 'key!@#': 1, normal: 2 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes('key!@#');
}


export function test_ownKeys_57() {
    const obj = { 姓名: '张三', 年龄: 25 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes('姓名') && keys.includes('年龄');
}


export function test_ownKeys_58() {
    const key = 'dynamic';
    const obj = { [key]: 1 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes('dynamic');
}


export function test_ownKeys_59() {
    const k1 = 'a', k2 = 'b';
    const obj = { [k1]: 1, [k2]: 2 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes('a') && keys.includes('b');
}


export function test_ownKeys_60() {
    const sym = Symbol('computed');
    const obj = { [sym]: 1 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes(sym);
}


export function test_ownKeys_61() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', {
        value: 1,
        enumerable: false
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('hidden');
}


export function test_ownKeys_62() {
    const obj = {};
    Object.defineProperties(obj, {
        p1: { value: 1 },
        p2: { value: 2 }
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('p1') && keys.includes('p2');
}


export function test_ownKeys_63() {
    const obj = {};
    Object.defineProperty(obj, 'getOnly', {
        get() {
            return 1;
        },
        enumerable: false
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('getOnly');
}


export function test_ownKeys_64() {
    const obj = {};
    Object.defineProperty(obj, 'setOnly', {
        set() {
        },
        enumerable: false
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('setOnly');
}


export function test_ownKeys_65() {
    const obj = {};
    Object.defineProperty(obj, 'accessor', {
        get() {
            return 1;
        },
        set() {
        },
        enumerable: false
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('accessor');
}


export function test_ownKeys_66() {
    const obj = {};
    Object.defineProperty(obj, 'fixed', {
        value: 1,
        configurable: false
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('fixed');
}


export function test_ownKeys_67() {
    const obj = {};
    Object.defineProperty(obj, 'const', {
        value: 1,
        writable: false
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('const');
}


export function test_ownKeys_68() {
    const obj = Object.freeze({ x: 1 });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('x');
}


export function test_ownKeys_69() {
    const obj = Object.seal({ y: 2 });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('y');
}


export function test_ownKeys_70() {
    const obj = Object.preventExtensions({ z: 3 });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('z');
}


export function test_ownKeys_71() {
    const target = {};
    const handler = {
        ownKeys() {
            return ['extra'];
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.ownKeys(proxy);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_ownKeys_73() {
    const target = { x: 1 };
    const handler = {
        ownKeys() {
            return ['x', 'x'];
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.ownKeys(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_ownKeys_74() {
    const target = { x: 1 };
    const handler = {
        ownKeys(t) {
            return Reflect.ownKeys(t);
        }
    };
    const proxy1 = new Proxy(target, handler);
    const proxy2 = new Proxy(proxy1, handler);
    const keys = Reflect.ownKeys(proxy2);
    return keys.includes('x');
}


export function test_ownKeys_75() {
    const target = { x: 1 };
    const handler = {
        ownKeys() {
            return ['modified'];
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.ownKeys(proxy);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_ownKeys_76() {
    const s1 = Symbol('first'), s2 = Symbol('second');
    const obj = { [s2]: 2, [s1]: 1 };
    const keys = Reflect.ownKeys(obj);
    const syms = keys.filter(k => typeof k === 'symbol');
    return syms[0] === s2 && syms[1] === s1;
}


export function test_ownKeys_77() {
    const sym = Symbol.for('global');
    const obj = { [sym]: 'global' };
    const keys = Reflect.ownKeys(obj);
    return keys.includes(sym);
}


export function test_ownKeys_78() {
    const sym = Symbol.for('test');
    const obj = { [sym]: 1 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes(sym) && Symbol.keyFor(sym) === 'test';
}


export function test_ownKeys_79() {
    const obj = {};
    obj[Symbol.iterator] = function* () {
    };
    const keys = Reflect.ownKeys(obj);
    return keys.includes(Symbol.iterator);
}


export function test_ownKeys_80() {
    const obj = {};
    obj[Symbol.asyncIterator] = async function* () {
    };
    obj[Symbol.toStringTag] = 'MyClass';
    const keys = Reflect.ownKeys(obj);
    return keys.includes(Symbol.asyncIterator) && keys.includes(Symbol.toStringTag);
}


export function test_ownKeys_81() {
    const parent = { inherited: 1 };
    const child = Object.create(parent);
    child.own = 2;
    const keys = Reflect.ownKeys(child);
    return keys.includes('own') && !keys.includes('inherited');
}


export function test_ownKeys_82() {
    const proto = { x: 1 };
    const obj = Object.create(proto, {
        a: { value: 1 },
        b: { value: 2 }
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('a') && keys.includes('b');
}


export function test_ownKeys_83() {
    const parent = { x: 1 };
    const obj = { __proto__: parent, y: 2 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes('y') && !keys.includes('x');
}


export function test_ownKeys_84() {
    const obj = { __proto__: null, z: 3 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes('z');
}


export function test_ownKeys_85() {
    const priv = Symbol('private');
    const obj = { [priv]: 'secret' };
    const keys = Reflect.ownKeys(obj);
    return keys.includes(priv);
}


export function test_ownKeys_86() {
    return Reflect.ownKeys(ArrayBuffer).includes('isView');
}


export function test_ownKeys_87() {
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    const keys = Reflect.ownKeys(dv);
    return keys.length == 0;
}


export function test_ownKeys_88() {
    if (typeof Atomics === 'undefined') {
        return true;
    }
    const keys = Reflect.ownKeys(Atomics);
    return keys.includes('add') || keys.includes('store');
}


export function test_ownKeys_89() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const instance = new Intl.Collator();
    const keys = Reflect.ownKeys(instance);
    return keys.length > 0;
}


export function test_ownKeys_90() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const dtf = new Intl.DateTimeFormat();
    const keys = Reflect.ownKeys(dtf);
    return keys.length > 0;
}


export function test_ownKeys_91() {
    if (typeof WeakRef === 'undefined') {
        return true;
    }
    const wr = new WeakRef({});
    const keys = Reflect.ownKeys(wr);
    return keys.length == 0;
}


export function test_ownKeys_92() {
    if (typeof FinalizationRegistry === 'undefined') {
        return true;
    }
    const fr = new FinalizationRegistry(() => {
    });
    const keys = Reflect.ownKeys(fr);
    return keys.length == 0;
}


export function test_ownKeys_93() {
    const p = Promise.resolve(1);
    const keys = Reflect.ownKeys(p);
    return keys.length == 0;
}


export function test_ownKeys_94() {
    const m = new Map([['a', 1]]);
    const keys = Reflect.ownKeys(m);
    return keys.length == 0;
}


export function test_ownKeys_95() {
    const s = new Set([1]);
    const keys = Reflect.ownKeys(s);
    return keys.length == 0;
}


export function test_ownKeys_96() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const arr = new iframeWindow.Array(1, 2);
    const keys = Reflect.ownKeys(arr);
    return keys.includes('0') && keys.includes('length');
}


export function test_ownKeys_97() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const obj = iframeWindow.Object.create(null);
    obj.x = 1;
    const keys = Reflect.ownKeys(obj);
    return keys.includes('x');
}


export function test_ownKeys_98() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const fn = new iframeWindow.Function('return 1');
    const keys = Reflect.ownKeys(fn);
    return keys.length >= 0;
}


export function test_ownKeys_99() {
    if (typeof document === 'undefined') {
        return true;
    }
    const el = document.createElement('div');
    el.dataset.test = 'value';
    const keys = Reflect.ownKeys(el);
    return keys.includes('dataset') || keys.includes('innerHTML');
}


export function test_ownKeys_100() {
    if (typeof EventTarget === 'undefined') {
        return true;
    }
    const et = new EventTarget();
    const keys = Reflect.ownKeys(et);
    return keys.length > 0;
}


export function test_ownKeys_101() {
    const obj = JSON.parse('{"x":1,"y":2}');
    const keys = Reflect.ownKeys(obj);
    return keys.includes('x') && keys.includes('y');
}


export function test_ownKeys_102() {
    const target = { a: 1 };
    const source = { b: 2 };
    Object.assign(target, source);
    const keys = Reflect.ownKeys(target);
    return keys.includes('b');
}


export function test_ownKeys_103() {
    const base = { x: 1 };
    const obj = { ...base, y: 2 };
    const keys = Reflect.ownKeys(obj);
    return keys.includes('x') && keys.includes('y');
}


export function test_ownKeys_104() {
    let called = false;
    const obj = {
        get prop() {
            called = true;
            return 1;
        }
    };
    const keys = Reflect.ownKeys(obj);
    return keys.includes('prop') && !called;
}


export function test_ownKeys_105() {
    const obj = {};
    Object.defineProperty(obj, 'setProp', {
        set() {
        }
    });
    const keys = Reflect.ownKeys(obj);
    return keys.includes('setProp');
}


export function test_ownKeys_106() {
    const arr = [1, , 3];
    const keys = Reflect.ownKeys(arr);
    return keys.includes('0') && !keys.includes('1') && keys.includes('2');
}


export function test_ownKeys_107() {
    const ta = new Uint8Array([1, 2]);
    const keys = Reflect.ownKeys(ta);
    return keys.includes('0') && keys.includes('1');
}


export function test_ownKeys_109() {
    const e = new Error('fail');
    e.code = 'E1';
    const keys = Reflect.ownKeys(e);
    return keys.includes('message') && keys.includes('code');
}


export function test_ownKeys_110() {
    const e = new SyntaxError('invalid');
    const keys = Reflect.ownKeys(e);
    return keys.includes('message');
}


export function test_ownKeys_111() {
    const ctors = [Object, Array, Function, Date, RegExp, Error, Promise, Map, Set];
    return ctors.every(C => Reflect.ownKeys(C).length > 0);
}


export function test_ownKeys_112() {
    const protos = [
        Object.prototype, Array.prototype, Function.prototype,
        String.prototype, Number.prototype, Boolean.prototype,
        Date.prototype, RegExp.prototype, Error.prototype
    ];
    return protos.every(p => Reflect.ownKeys(p).length > 0);
}


export function test_ownKeys_113() {
    const keys = Reflect.ownKeys(Math);
    return ['abs', 'sin', 'cos', 'random', 'PI'].every(k => keys.includes(k));
}


export function test_ownKeys_114() {
    const keys = Reflect.ownKeys(JSON);
    return keys.includes('parse') && keys.includes('stringify');
}


export function test_ownKeys_115() {
    const keys = Reflect.ownKeys(Reflect);
    return ['apply', 'construct', 'get', 'set', 'has'].every(k => keys.includes(k));
}


export function test_ownKeys_116() {
    const keys = Reflect.ownKeys(globalThis);
    return ['Array', 'String', 'Promise', 'Symbol'].every(k => keys.includes(k));
}


export function test_ownKeys_117() {
    if (typeof window === 'undefined') {
        return true;
    }
    const keys = Reflect.ownKeys(window);
    return ['document', 'navigator', 'location'].every(k => keys.includes(k));
}


export function test_ownKeys_118() {
    if (typeof document === 'undefined') {
        return true;
    }
    const keys = Reflect.ownKeys(document);
    return ['body', 'head', 'title'].every(k => keys.includes(k));
}


export function test_ownKeys_119() {
    if (typeof document === 'undefined') {
        return true;
    }
    const nodes = document.querySelectorAll('*');
    const keys = Reflect.ownKeys(nodes);
    return keys.includes('length') || /^\d+$/.test(keys[0] || '');
}


export function test_ownKeys_120() {
    if (typeof document === 'undefined') {
        return true;
    }
    const coll = document.images;
    if (!coll) {
        return true;
    }
    const keys = Reflect.ownKeys(coll);
    return keys.includes('length') || keys.includes('item');
}


export function test_ownKeys_121() {
    if (typeof EventTarget === 'undefined') {
        return true;
    }
    const et = new EventTarget();
    const keys = Reflect.ownKeys(et);
    return keys.length >= 0;
}


export function test_ownKeys_124() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const keys = Reflect.ownKeys(Intl.Collator.prototype);
    return keys.length > 0;
}


export function test_ownKeys_125() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const dtf = new Intl.DateTimeFormat();
    const keys = Reflect.ownKeys(dtf);
    return keys.length > 0;
}


export function test_ownKeys_126() {
    const obj = {};
    obj[Symbol.asyncIterator] = async function* () {
    };
    const keys = Reflect.ownKeys(obj);
    return keys.includes(Symbol.asyncIterator);
}


export function test_ownKeys_128() {
    const C = class {
        static get [Symbol.species]() {
            return this;
        }
    };
    const keys = Reflect.ownKeys(C);
    return keys.includes(Symbol.species);
}


export function test_ownKeys_129() {
    const arr = [1, 2, 3];
    const keys = Reflect.ownKeys(arr[Symbol.unscopables] || {});
    return Array.isArray(keys) || keys.length >= 0;
}


export function test_ownKeys_130() {
    const r = /abc/;
    r[Symbol.match] = false;
    const keys = Reflect.ownKeys(r);
    return keys.includes(Symbol.match);
}


export function test_ownKeys_131() {

    function* gen() {
    }

    const keys = Reflect.ownKeys(gen);
    return keys.includes('prototype');
}


export function test_ownKeys_132() {
    const asyncFn = async function () {
    };
    const keys = Reflect.ownKeys(asyncFn);
    return keys.includes('length');
}


export function test_ownKeys_133() {
    const arrow = () => {
    };
    const keys = Reflect.ownKeys(arrow);
    return keys.includes('length') && keys.includes('name');
}


export function test_ownKeys_134() {
    const fn = function(){
    }.bind({});
    const keys = Reflect.ownKeys(fn);
    return keys.includes('length') && keys.includes('name');
}


export function test_ownKeys_135() {
    return function(){
        const keys = Reflect.ownKeys(arguments);
        return keys.includes('callee');
    }(1);
}


export function test_ownKeys_136() {
    'use strict';
    return function(){
        const keys = Reflect.ownKeys(arguments);
        return !keys.includes('callee');
    }();
}


export function test_ownKeys_137() {
    const errors = [
        new Error(), new TypeError(), new ReferenceError(),
        new SyntaxError(), new RangeError(), new EvalError(),
        new URIError()
    ];
    return errors.every(e => Reflect.ownKeys(e).includes('message'));
}


export function test_ownKeys_138() {
    const p = Promise.all([1, 2]);
    const keys = Reflect.ownKeys(p);
    return keys.length == 0;
}


export function test_ownKeys_139() {
    const p = Promise.race([Promise.resolve(1)]);
    const keys = Reflect.ownKeys(p);
    return keys.length == 0;
}


export function test_ownKeys_140() {
    const m = new Map([['a', 1]]);
    const iter = m[Symbol.iterator]();
    const keys = Reflect.ownKeys(iter);
    return keys.length == 0;
}


export function test_ownKeys_141() {
    const iter = [1][Symbol.iterator]();
    const keys = Reflect.ownKeys(iter);
    return keys.length == 0;
}


export function test_ownKeys_142() {
    const iter = "hi"[Symbol.iterator]();
    const keys = Reflect.ownKeys(iter);
    return keys.length == 0;
}


export function test_ownKeys_143() {
    const iter = (new Int8Array([1]))[Symbol.iterator]();
    const keys = Reflect.ownKeys(iter);
    return keys.length == 0;
}


export function test_ownKeys_144() {
    const iter = (new Set([1]))[Symbol.iterator]();
    const keys = Reflect.ownKeys(iter);
    return keys.length == 0;
}


export function test_ownKeys_145() {
    const wm = new WeakMap();
    try {
        wm.set('not-object', 1);
        return false;
    } catch (e) {
        const keys = Reflect.ownKeys(wm);
        return keys.length >= 0;
    }
}


export function test_ownKeys_146() {
    if (typeof FinalizationRegistry === 'undefined') {
        return true;
    }
    const fr = new FinalizationRegistry(() => {
    });
    const obj = {};
    fr.register(obj, 'meta');
    const keys = Reflect.ownKeys(fr);
    return keys.length == 0;
}


export function test_ownKeys_147() {
    const objs = [
        {}, [], function () {
    }, new Date(), /a/,
        new Error(), Promise.resolve(), new Map(), new Set(),
        Object(1), Object(true), Object("s"), Object(Symbol())
    ];
    return objs.every(o => Reflect.ownKeys(o).length >= 0);
}


export function test_ownKeys_148() {
    const fns = [Object, Array, Function, String, Number, Boolean, Date, RegExp, Error];
    return fns.every(fn => Reflect.ownKeys(fn).length > 0);
}


export function test_ownKeys_149() {
    const keys = Reflect.ownKeys(globalThis);
    return Array.isArray(keys) && keys.length > 0;
}


export function test_ownKeys_150() {
    const instances = [
        { a: 1 }, [1, 2], function () {
    },
        new Date(), /regex/, new Error(),
        new Map(), new Set(), new ArrayBuffer(8),
        new Int8Array(), Object(42), new String("s")
    ];
    return instances.every(inst =>
    Array.isArray(Reflect.ownKeys(inst))
    );
}
