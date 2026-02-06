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

export function test_isExtensible_1() {
    const obj = {};
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_2() {
    const parent = { x: 1 };
    const child = Object.create(parent);
    return Reflect.isExtensible(child) === true;
}


export function test_isExtensible_3() {
    const arr = [1, 2];
    return Reflect.isExtensible(arr) === true;
}


export function test_isExtensible_4() {
    function fn() {}
    return Reflect.isExtensible(fn) === true;
}


export function test_isExtensible_5() {
    const d = new Date();
    return Reflect.isExtensible(d) === true;
}


export function test_isExtensible_6() {
    const r = /abc/;
    return Reflect.isExtensible(r) === true;
}


export function test_isExtensible_7() {
    const p = Promise.resolve();
    return Reflect.isExtensible(p) === true;
}


export function test_isExtensible_8() {
    const m = new Map();
    return Reflect.isExtensible(m) === true;
}


export function test_isExtensible_9() {
    const s = new Set();
    return Reflect.isExtensible(s) === true;
}


export function test_isExtensible_10() {
    const buf = new ArrayBuffer(8);
    return Reflect.isExtensible(buf) === true;
}


export function test_isExtensible_11() {
    const ta = new Int32Array(2);
    return Reflect.isExtensible(ta) === true;
}


export function test_isExtensible_12() {
    const sObj = new String("text");
    return Reflect.isExtensible(sObj) === true;
}


export function test_isExtensible_13() {
    const nObj = new Number(42);
    return Reflect.isExtensible(nObj) === true;
}


export function test_isExtensible_14() {
    const bObj = new Boolean(true);
    return Reflect.isExtensible(bObj) === true;
}


export function test_isExtensible_15() {
    const symObj = Object(Symbol('s'));
    return Reflect.isExtensible(symObj) === true;
}


export function test_isExtensible_16() {
    class C {}
    const c = new C();
    return Reflect.isExtensible(c) === true;
}


export function test_isExtensible_17() {
    const obj = { x: 1 };
    Object.preventExtensions(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_18() {
    const obj = { y: 2 };
    Object.seal(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_19() {
    const obj = { z: 3 };
    Object.freeze(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_20() {
    const obj = {};
    Object.preventExtensions(obj);
    try {
        obj.newProp = 1;
        return false;
    } catch (e) {
        return Reflect.isExtensible(obj) === false;
    }
}


export function test_isExtensible_21() {
    try {
        Reflect.isExtensible("hello");
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_isExtensible_22() {
    try {
        Reflect.isExtensible(123);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_isExtensible_23() {
    try {
        Reflect.isExtensible(true);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_isExtensible_24() {
    try {
        Reflect.isExtensible(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_isExtensible_25() {
    try {
        Reflect.isExtensible(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_isExtensible_26() {
    const obj = Object.create(null);
    obj.x = 1;
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_27() {
    const obj = {};
    Object.preventExtensions(obj);
    
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_28() {
    const obj = { a: 1 };
    Object.seal(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_29() {
    const obj = { b: 2 };
    Object.freeze(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_30() {
    const parent = { x: 1 };
    const child = Object.seal({ y: 2 });
    return Reflect.isExtensible(parent) === true && Reflect.isExtensible(child) === false;
}


export function test_isExtensible_31() {
    const proto = { method() {} };
    const obj = Object.freeze({ own: 1 });
    return Reflect.isExtensible(proto) === true;
}


export function test_isExtensible_32() {
    const target = { x: 1 };
    const handler = {};
    const proxy = new Proxy(target, handler);
    return Reflect.isExtensible(proxy) === Reflect.isExtensible(target);
}


export function test_isExtensible_33() {
    let called = false;
    const target = {};
    const handler = {
        isExtensible(t) {
            called = true;
            return Reflect.isExtensible(t);
        }
    };
    const proxy = new Proxy(target, handler);
    Reflect.isExtensible(proxy);
    return called;
}


export function test_isExtensible_34() {
    const target = {};
    Object.preventExtensions(target);
    const handler = {
        isExtensible() { return true; }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.isExtensible(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError; 
    }
}


export function test_isExtensible_35() {
    const target = {};
    Object.preventExtensions(target);
    const handler = {
        isExtensible() { return false; }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.isExtensible(proxy) === false;
}


export function test_isExtensible_36() {
    const target = {};
    Object.preventExtensions(target);
    const handler = {
        isExtensible() { return true; }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.isExtensible(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_isExtensible_37() {
    const target = {};
    const handler = {
        isExtensible() { return false; }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.isExtensible(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_isExtensible_38() {
    return function () {
        return Reflect.isExtensible(arguments) === true;
    }(1);
}


export function test_isExtensible_39() {
    'use strict';
    return function () {
        return Reflect.isExtensible(arguments) === true;
    }();
}


export function test_isExtensible_40() {
    function* gen() {}
    const g = gen();
    return Reflect.isExtensible(g) === true;
}


export function test_isExtensible_41() {
    const p = (async () => {})();
    return Reflect.isExtensible(p) === true;
}


export function test_isExtensible_42() {
    const wm = new WeakMap();
    return Reflect.isExtensible(wm) === true;
}


export function test_isExtensible_43() {
    const ws = new WeakSet();
    return Reflect.isExtensible(ws) === true;
}


export function test_isExtensible_44() {
    return Reflect.isExtensible(globalThis) === true;
}


export function test_isExtensible_45() {
    if (typeof window === 'undefined') return true;
    return Reflect.isExtensible(window) === true;
}


export function test_isExtensible_46() {
    return Reflect.isExtensible(Math) === true; 
}


export function test_isExtensible_47() {
    return Reflect.isExtensible(JSON) === true;
}


export function test_isExtensible_48() {
    return Reflect.isExtensible(Reflect) === true;
}


export function test_isExtensible_49() {
    if (typeof Intl === 'undefined') return true;
    return Reflect.isExtensible(Intl) === true;
}


export function test_isExtensible_50() {
    const arr = [1];
    const iter = arr[Symbol.iterator]();
    return Reflect.isExtensible(iter) === true;
}

export function test_isExtensible_51() {
    if (typeof document === 'undefined') return true;
    const nodes = document.childNodes || document.querySelectorAll('*');
    return Reflect.isExtensible(nodes) === true;
}


export function test_isExtensible_52() {
    if (typeof document === 'undefined') return true;
    const coll = document.forms || document.images;
    if (!coll) return true;
    return Reflect.isExtensible(coll) === true;
}


export function test_isExtensible_53() {
    const obj = {};
    Object.preventExtensions(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_54() {
    const obj = {};
    Object.preventExtensions(obj);
    Object.preventExtensions(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_55() {
    const obj = { x: 1 };
    Object.seal(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_56() {
    const obj = { y: 2 };
    Object.freeze(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_57() {
    const obj = {};
    Object.preventExtensions(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_58() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_59() {
    const parent = { x: 1 };
    const child = Object.create(parent);
    Object.preventExtensions(child);
    return Reflect.isExtensible(child) === false && Reflect.isExtensible(parent) === true;
}


export function test_isExtensible_61() {
    const parent = { x: 1 };
    const obj = { __proto__: parent };
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_62() {
    const obj = { __proto__: null, own: 1 };
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_63() {
    const m = new Map([['a', 1]]);
    return Reflect.isExtensible(m) === true;
}


export function test_isExtensible_64() {
    const s = new Set([1, 2]);
    return Reflect.isExtensible(s) === true;
}


export function test_isExtensible_65() {
    const wm = new WeakMap();
    wm.set({}, 'value');
    return Reflect.isExtensible(wm) === true;
}


export function test_isExtensible_66() {
    const p = Promise.resolve(1);
    return Reflect.isExtensible(p) === true;
}


export function test_isExtensible_67() {
    const buf = new ArrayBuffer(8);
    return Reflect.isExtensible(buf) === true;
}


export function test_isExtensible_68() {
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    return Reflect.isExtensible(dv) === true;
}


export function test_isExtensible_69() {
    if (typeof SharedArrayBuffer === 'undefined') return true;
    const sab = new SharedArrayBuffer(8);
    return Reflect.isExtensible(sab) === true;
}


export function test_isExtensible_70() {
    return Reflect.isExtensible(Atomics) === true;
}


export function test_isExtensible_71() {
    if (typeof Intl === 'undefined') return true;
    const instance = new Intl.Collator();
    return Reflect.isExtensible(instance) === true;
}


export function test_isExtensible_72() {
    if (typeof Intl === 'undefined') return true;
    const dtf = new Intl.DateTimeFormat();
    return Reflect.isExtensible(dtf) === true;
}


export function test_isExtensible_73() {
    if (typeof WeakRef === 'undefined') return true;
    const wr = new WeakRef({});
    return Reflect.isExtensible(wr) === true;
}


export function test_isExtensible_74() {
    if (typeof FinalizationRegistry === 'undefined') return true;
    const fr = new FinalizationRegistry(() => {});
    return Reflect.isExtensible(fr) === true;
}


export function test_isExtensible_75() {
    function C() { this.value = 1; }
    const instance = Reflect.construct(C, []);
    return Reflect.isExtensible(instance) === true;
}


export function test_isExtensible_76() {
    class Parent {}
    class Child extends Parent { constructor() { super(); this.childProp = 1; } }
    const child = new Child();
    return Reflect.isExtensible(child) === true;
}


export function test_isExtensible_77() {
    const fn = () => {};
    return Reflect.isExtensible(fn) === true;
}


export function test_isExtensible_78() {
    const asyncFn = async function () {};
    return Reflect.isExtensible(asyncFn) === true;
}


export function test_isExtensible_79() {
    function* gen() {}
    return Reflect.isExtensible(gen) === true;
}


export function test_isExtensible_80() {
    function F() {}
    return Reflect.isExtensible(F.prototype) === true;
}


export function test_isExtensible_81() {
    return Reflect.isExtensible(Array.prototype) === true;
}


export function test_isExtensible_82() {
    return Reflect.isExtensible(Object.prototype) === true;
}


export function test_isExtensible_83() {
    return Reflect.isExtensible(Function.prototype) === true;
}


export function test_isExtensible_84() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1 });
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_85() {
    const obj = {};
    Object.defineProperties(obj, {
        a: { value: 1 },
        b: { value: 2 }
    });
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_86() {
    const arr = [1,,3];
    return Reflect.isExtensible(arr) === true;
}


export function test_isExtensible_87() {
    const ta = new Int8Array(2);
    return Reflect.isExtensible(ta) === true;
}


export function test_isExtensible_88() {
    if (typeof document === 'undefined') return true;
    const el = document.createElement('div');
    return Reflect.isExtensible(el) === true;
}


export function test_isExtensible_89() {
    if (typeof EventTarget === 'undefined') return true;
    const et = new EventTarget();
    return Reflect.isExtensible(et) === true;
}


export function test_isExtensible_90() {
    const obj = {};
    Object.defineProperty(obj, 'getter', {
        get() { return 1; }
    });
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_91() {
    const obj = {};
    Object.defineProperty(obj, 'setter', {
        set(v) { this._v = v; }
    });
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_92() {
    const obj = {};
    Object.defineProperty(obj, 'accessor', {
        get() { return this._v; },
        set(v) { this._v = v; }
    });
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_93() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', {
        value: 1,
        enumerable: false
    });
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_94() {
    const sym = Symbol('s');
    const obj = { [sym]: 1 };
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_95() {
    const s1 = Symbol(), s2 = Symbol();
    const obj = { [s1]: 1, [s2]: 2 };
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_96() {
    const parent = { x: 1 };
    const child = Object.create(parent);
    return Reflect.isExtensible(child) === true;
}


export function test_isExtensible_97() {
    const obj = Object.create(null);
    obj.x = 1;
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_98() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) return true;
    const iframeWindow = window.frames[0];
    const arr = new iframeWindow.Array(1, 2);
    return Reflect.isExtensible(arr) === true;
}


export function test_isExtensible_99() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) return true;
    const iframeWindow = window.frames[0];
    const obj = iframeWindow.Object.create(null);
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_100() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) return true;
    const iframeWindow = window.frames[0];
    const fn = new iframeWindow.Function();
    return Reflect.isExtensible(fn) === true;
}

export function test_isExtensible_101() {
    const obj = JSON.parse('{"x":1}');
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_102() {
    const target = { a: 1 };
    const source = { b: 2 };
    Object.assign(target, source);
    return Reflect.isExtensible(target) === true;
}


export function test_isExtensible_103() {
    const a = { x: 1 };
    const b = { ...a };
    return Reflect.isExtensible(b) === true;
}


export function test_isExtensible_104() {
    const key = 'dynamic';
    const obj = { [key]: 1 };
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_105() {
    let calls = 0;
    const obj = {
        get prop() { calls++; return calls; }
    };
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_106() {
    const target = {};
    const handler = { isExtensible(t) { return Reflect.isExtensible(t); } };
    const proxy1 = new Proxy(target, handler);
    const proxy2 = new Proxy(proxy1, handler);
    return Reflect.isExtensible(proxy2) === true;
}


export function test_isExtensible_107() {
    const target = {};
    const handler = { isExtensible(t) { return Reflect.isExtensible(t); } };
    const proxy = new Proxy(target, handler);
    return Reflect.isExtensible(proxy) === true;
}


export function test_isExtensible_108() {
    const obj = { sealed: true };
    Object.seal(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_109() {
    const obj = { frozen: true };
    Object.freeze(obj);
    return Reflect.isExtensible(obj) === false;
}


export function test_isExtensible_110() {
    const sym = Symbol('meta');
    const obj = { [sym]: 'value' };
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_111() {
    const obj = Object.create({}, {
        a: { value: 1 },
        b: { value: 2 }
    });
    return Reflect.isExtensible(obj) === true;
}


export function test_isExtensible_112() {
    const obj = Object.freeze({ own: 1 });
    return Reflect.isExtensible(Object.prototype) === true;
}


export function test_isExtensible_113() {
    const obj = Object.seal({ y: 2 });
    return Reflect.isExtensible(Object) === true;
}


export function test_isExtensible_114() {
    const obj = {};
    Object.preventExtensions(obj);
    try {
        obj.newProp = 'fail';
        return false;
    } catch (e) {
        return Reflect.isExtensible(obj) === false;
    }
}


export function test_isExtensible_115() {
    const wrapper = new String("text");
    return Reflect.isExtensible(wrapper) === true;
}


export function test_isExtensible_116() {
    const e = new Error('fail');
    return Reflect.isExtensible(e) === true;
}


export function test_isExtensible_117() {
    const e = new SyntaxError('invalid');
    return Reflect.isExtensible(e) === true;
}


export function test_isExtensible_118() {
    const e = new URIError();
    return Reflect.isExtensible(e) === true;
}


export function test_isExtensible_119() {
    const e = new TypeError('type');
    return Reflect.isExtensible(e) === true;
}


export function test_isExtensible_120() {
    const e = new RangeError('range');
    return Reflect.isExtensible(e) === true;
}


export function test_isExtensible_121() {
    try { throw new ReferenceError(); } catch (e) {
        return Reflect.isExtensible(e) === true;
    }
}


export function test_isExtensible_122() {
    const e = new EvalError();
    return Reflect.isExtensible(e) === true;
}


export function test_isExtensible_123() {
    const p = Promise.reject(new Error());
    return Reflect.isExtensible(p) === true;
}


export function test_isExtensible_124() {
    const p = Promise.all([Promise.resolve(1)]);
    return Reflect.isExtensible(p) === true;
}


export function test_isExtensible_125() {
    const p = Promise.race([Promise.resolve(1)]);
    return Reflect.isExtensible(p) === true;
}


export function test_isExtensible_126() {
    return Reflect.isExtensible(Map.prototype) === true;
}


export function test_isExtensible_127() {
    return Reflect.isExtensible(Set.prototype) === true;
}


export function test_isExtensible_128() {
    return Reflect.isExtensible(WeakMap.prototype) === true;
}


export function test_isExtensible_129() {
    return Reflect.isExtensible(ArrayBuffer.prototype) === true;
}


export function test_isExtensible_130() {
    return Reflect.isExtensible(DataView.prototype) === true;
}


export function test_isExtensible_131() {
    return Reflect.isExtensible(Symbol.prototype) === true;
}


export function test_isExtensible_132() {
    return Reflect.isExtensible(Function.prototype) === true;
}


export function test_isExtensible_133() {
    return Reflect.isExtensible(Object.prototype) === true;
}


export function test_isExtensible_134() {
    return Reflect.isExtensible(Array.prototype) === true;
}


export function test_isExtensible_135() {
    return Reflect.isExtensible(String.prototype) === true;
}


export function test_isExtensible_136() {
    return Reflect.isExtensible(Number.prototype) === true;
}


export function test_isExtensible_137() {
    return Reflect.isExtensible(Boolean.prototype) === true;
}


export function test_isExtensible_138() {
    return Reflect.isExtensible(Date.prototype) === true;
}


export function test_isExtensible_139() {
    return Reflect.isExtensible(RegExp.prototype) === true;
}


export function test_isExtensible_140() {
    return Reflect.isExtensible(Error.prototype) === true;
}


export function test_isExtensible_141() {
    return Reflect.isExtensible(Promise.prototype) === true;
}


export function test_isExtensible_142() {
    return Reflect.isExtensible(Reflect.apply) === true &&
        Reflect.isExtensible(Reflect.construct) === true;
}


export function test_isExtensible_143() {
    return Reflect.isExtensible(Array) &&
    Reflect.isExtensible(String) &&
    Reflect.isExtensible(Promise);
}


export function test_isExtensible_144() {
    return Reflect.isExtensible(Math.random) === true;
}


export function test_isExtensible_145() {
    return Reflect.isExtensible(JSON.stringify) === true;
}


export function test_isExtensible_146() {
    if (typeof Intl === 'undefined') return true;
    return Reflect.isExtensible(Intl.Collator) === true;
}


export function test_isExtensible_147() {
    const protos = [
        Object.prototype, Array.prototype, Function.prototype,
        String.prototype, Number.prototype, Boolean.prototype,
        Date.prototype, RegExp.prototype, Error.prototype,
        Map.prototype, Set.prototype
    ];
    return protos.every(p => Reflect.isExtensible(p));
}


export function test_isExtensible_148() {
    const ctors = [Object, Array, Function, String, Number, Boolean, Date, RegExp, Error, Promise, Map, Set];
    return ctors.every(C => Reflect.isExtensible(C));
}


export function test_isExtensible_149() {
    return Reflect.isExtensible(globalThis.Array) &&
    Reflect.isExtensible(globalThis.Math) &&
    Reflect.isExtensible(globalThis.JSON);
}


export function test_isExtensible_150() {
    const instances = [
        {}, [], function(){}, new Date(), /a/,
        new Error(), Promise.resolve(), new Map(), new Set(),
        new ArrayBuffer(8), new Int8Array(), Object(1), Object(true),
        Object("s"), Object(Symbol('s')), new WeakMap(), new WeakSet()
    ];
    return instances.every(inst => typeof Reflect.isExtensible(inst) === 'boolean');
}
