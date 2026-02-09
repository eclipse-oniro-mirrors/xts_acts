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

export function test_preventExtensions_11() {
    const sObj = new String("text");
    return Reflect.preventExtensions(sObj) === true && !Object.isExtensible(sObj);
}


export function test_preventExtensions_12() {
    const nObj = Object(42);
    return Reflect.preventExtensions(nObj) === true && !Object.isExtensible(nObj);
}


export function test_preventExtensions_13() {
    const bObj = Object(true);
    return Reflect.preventExtensions(bObj) === true && !Object.isExtensible(bObj);
}


export function test_preventExtensions_14() {
    const symObj = Object(Symbol('s'));
    return Reflect.preventExtensions(symObj) === true && !Object.isExtensible(symObj);
}


export function test_preventExtensions_15() {
    class C { constructor() { this.x = 1; } }
    const c = new C();
    return Reflect.preventExtensions(c) === true && !Object.isExtensible(c);
}


export function test_preventExtensions_16() {
    const parent = { x: 1 };
    const child = Object.create(parent);
    return Reflect.preventExtensions(child) === true && !Object.isExtensible(child);
}


export function test_preventExtensions_17() {
    const obj = Object.create(null);
    obj.own = 1;
    return Reflect.preventExtensions(obj) === true && !Object.isExtensible(obj);
}


export function test_preventExtensions_18() {
    try {
        Reflect.preventExtensions("hello");
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_preventExtensions_19() {
    try {
        Reflect.preventExtensions(123);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_preventExtensions_20() {
    try {
        Reflect.preventExtensions(true);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_preventExtensions_21() {
    try {
        Reflect.preventExtensions(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_preventExtensions_22() {
    try {
        Reflect.preventExtensions(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_preventExtensions_23() {
    const obj = {};
    Object.preventExtensions(obj);
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_24() {
    const obj = { sealed: true };
    Object.seal(obj);
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_25() {
    const obj = { frozen: true };
    Object.freeze(obj);
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_26() {
    const obj = {};
    Reflect.preventExtensions(obj);
    try {
        obj.newProp = 1;
        return false;
    } catch (e) {
        return !Object.isExtensible(obj);
    }
}


export function test_preventExtensions_27() {
    'use strict';
    const obj = {};
    Reflect.preventExtensions(obj);
    try {
        obj.newProp = 1;
        return false;
    } catch (e) {
        return true;
    }
}


export function test_preventExtensions_28() {
    const target = { x: 1 };
    const handler = {};
    const proxy = new Proxy(target, handler);
    return Reflect.preventExtensions(proxy) === true && !Object.isExtensible(proxy);
}


export function test_preventExtensions_29() {
    let called = false;
    const target = {};
    const handler = {
        preventExtensions(t) {
            called = true;
            return Reflect.preventExtensions(t);
        }
    };
    const proxy = new Proxy(target, handler);
    Reflect.preventExtensions(proxy);
    return called;
}


export function test_preventExtensions_31() {
    const target = {};
    const handler = {
        preventExtensions() { return false; }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.preventExtensions(proxy);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_preventExtensions_32() {
    const target = {};
    const handler = {
        preventExtensions() { return true; }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.preventExtensions(proxy);
        return Object.isExtensible(target); 
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_preventExtensions_33() {
    return function () {
        return Reflect.preventExtensions(arguments) === true && !Object.isExtensible(arguments);
    }(1);
}


export function test_preventExtensions_34() {
    'use strict';
    return function () {
        return Reflect.preventExtensions(arguments) === true && !Object.isExtensible(arguments);
    }();
}


export function test_preventExtensions_35() {
    function* gen() {}
    const g = gen();
    return Reflect.preventExtensions(g) === true && !Object.isExtensible(g);
}


export function test_preventExtensions_36() {
    const p = (async () => {})();
    return Reflect.preventExtensions(p) === true && !Object.isExtensible(p);
}


export function test_preventExtensions_37() {
    const wm = new WeakMap();
    return Reflect.preventExtensions(wm) === true && !Object.isExtensible(wm);
}


export function test_preventExtensions_38() {
    const ws = new WeakSet();
    return Reflect.preventExtensions(ws) === true && !Object.isExtensible(ws);
}


export function test_preventExtensions_39() {
    return Reflect.preventExtensions(globalThis) === true && !Object.isExtensible(globalThis);
}


export function test_preventExtensions_40() {
    if (typeof window === 'undefined') return true;
    return Reflect.preventExtensions(window) === true && !Object.isExtensible(window);
}


export function test_preventExtensions_41() {
    return Reflect.preventExtensions(Math) === true && !Object.isExtensible(Math);
}


export function test_preventExtensions_42() {
    return Reflect.preventExtensions(JSON) === true && !Object.isExtensible(JSON);
}


export function test_preventExtensions_43() {
    return Reflect.preventExtensions(Reflect) === true && !Object.isExtensible(Reflect);
}


export function test_preventExtensions_44() {
    if (typeof Intl === 'undefined') return true;
    return Reflect.preventExtensions(Intl) === true && !Object.isExtensible(Intl);
}


export function test_preventExtensions_45() {
    const obj = { [Symbol.iterator]: function* () {} };
    return Reflect.preventExtensions(obj) === true && !Object.isExtensible(obj);
}


export function test_preventExtensions_46() {
    if (typeof document === 'undefined') return true;
    const nodes = document.querySelectorAll('*');
    return Reflect.preventExtensions(nodes) === true && !Object.isExtensible(nodes);
}


export function test_preventExtensions_47() {
    if (typeof document === 'undefined') return true;
    const coll = document.forms || document.images;
    if (!coll) return true;
    return Reflect.preventExtensions(coll) === true && !Object.isExtensible(coll);
}


export function test_preventExtensions_48() {
    if (typeof document === 'undefined') return true;
    const el = document.createElement('div');
    return Reflect.preventExtensions(el) === true && !Object.isExtensible(el);
}


export function test_preventExtensions_49() {
    if (typeof EventTarget === 'undefined') return true;
    const et = new EventTarget();
    return Reflect.preventExtensions(et) === true && !Object.isExtensible(et);
}


export function test_preventExtensions_50() {
    const obj = {};
    Object.defineProperty(obj, 'prop', { value: 1 });
    return Reflect.preventExtensions(obj) === true && !Object.isExtensible(obj);
}

export function test_preventExtensions_51() {
    const obj = {};
    Object.defineProperties(obj, {
        a: { value: 1 },
        b: { value: 2 }
    });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_52() {
    const obj = {};
    Object.defineProperty(obj, 'getOnly', { get() { return 1; } });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_53() {
    const obj = {};
    Object.defineProperty(obj, 'setOnly', { set() {} });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_54() {
    const obj = {};
    Object.defineProperty(obj, 'accessor', {
        get() { return 1; },
        set(v) { this._v = v; }
    });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_55() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', {
        value: 1,
        enumerable: false
    });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_56() {
    const obj = {};
    Object.defineProperty(obj, 'fixed', {
        value: 1,
        configurable: false
    });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_57() {
    const obj = {};
    Object.defineProperty(obj, 'const', {
        value: 1,
        writable: false
    });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_58() {
    const obj = Object.freeze({ x: 1 });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_59() {
    const obj = Object.seal({ y: 2 });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_60() {
    const obj = {};
    Object.preventExtensions(obj);
    return Reflect.preventExtensions(obj) === true;
}

export function test_preventExtensions_61() {
    class C {}
    return Reflect.preventExtensions(C) === true;
}


export function test_preventExtensions_62() {
    class C {}
    return Reflect.preventExtensions(C.prototype) === true;
}


export function test_preventExtensions_63() {
    class C { static prop = 1; }
    return Reflect.preventExtensions(C) === true;
}


export function test_preventExtensions_64() {
    const priv = Symbol('private');
    const obj = { [priv]: 'secret' };
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_65() {
    class A {}
    class B extends A {}
    class C extends B {}
    const c = new C();
    return Reflect.preventExtensions(c) === true;
}

export function test_preventExtensions_66() {
    return Reflect.preventExtensions(ArrayBuffer) === true;
}


export function test_preventExtensions_67() {
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    return Reflect.preventExtensions(dv) === true;
}


export function test_preventExtensions_68() {
    if (typeof Atomics === 'undefined') return true;
    return Reflect.preventExtensions(Atomics) === true;
}


export function test_preventExtensions_69() {
    if (typeof Intl === 'undefined') return true;
    const instance = new Intl.Collator();
    return Reflect.preventExtensions(instance) === true;
}


export function test_preventExtensions_70() {
    if (typeof Intl === 'undefined') return true;
    const dtf = new Intl.DateTimeFormat();
    return Reflect.preventExtensions(dtf) === true;
}


export function test_preventExtensions_71() {
    if (typeof WeakRef === 'undefined') return true;
    const wr = new WeakRef({});
    return Reflect.preventExtensions(wr) === true;
}


export function test_preventExtensions_72() {
    if (typeof FinalizationRegistry === 'undefined') return true;
    const fr = new FinalizationRegistry(() => {});
    return Reflect.preventExtensions(fr) === true;
}


export function test_preventExtensions_73() {
    const p = Promise.resolve(1);
    return Reflect.preventExtensions(p) === true;
}


export function test_preventExtensions_74() {
    const m = new Map([['a',1]]);
    const s = new Set([1]);
    return Reflect.preventExtensions(m) && Reflect.preventExtensions(s);
}


export function test_preventExtensions_75() {
    if (typeof SharedArrayBuffer === 'undefined') return true;
    const sab = new SharedArrayBuffer(8);
    return Reflect.preventExtensions(sab) === true;
}

export function test_preventExtensions_76() {
    const target = {};
    const handler = { preventExtensions(t) { return Reflect.preventExtensions(t); } };
    const proxy1 = new Proxy(target, handler);
    const proxy2 = new Proxy(proxy1, handler);
    return Reflect.preventExtensions(proxy2) === true;
}


export function test_preventExtensions_77() {
    const target = {};
    const handler = {
        preventExtensions(t) {
            Reflect.preventExtensions(t);
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.preventExtensions(proxy) === true;
}


export function test_preventExtensions_78() {
    const target = {};
    const handler = { preventExtensions() { return false; } };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.preventExtensions(proxy);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_preventExtensions_79() {
    const target = {};
    const handler = {
        preventExtensions() { return true; } 
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.preventExtensions(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_preventExtensions_80() {
    const target = {};
    const handler = {
        preventExtensions() { throw new Error("custom"); }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.preventExtensions(proxy);
        return false;
    } catch (e) {
        return e.message === "custom";
    }
}

export function test_preventExtensions_81() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) return true;
    const iframeWindow = window.frames[0];
    const arr = new iframeWindow.Array(1, 2);
    return Reflect.preventExtensions(arr) === true;
}


export function test_preventExtensions_82() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) return true;
    const iframeWindow = window.frames[0];
    const obj = iframeWindow.Object.create(null);
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_83() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) return true;
    const iframeWindow = window.frames[0];
    const fn = new iframeWindow.Function();
    return Reflect.preventExtensions(fn) === true;
}


export function test_preventExtensions_84() {
    if (typeof document === 'undefined') return true;
    const el = document.createElement('input');
    return Reflect.preventExtensions(el) === true;
}


export function test_preventExtensions_85() {
    if (typeof document === 'undefined' || !document.body) return true;
    return Reflect.preventExtensions(document.body) === true;
}

export function test_preventExtensions_86() {
    const obj = JSON.parse('{"x":1}');
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_87() {
    const target = { a: 1 };
    Object.assign(target, { b: 2 });
    return Reflect.preventExtensions(target) === true;
}


export function test_preventExtensions_88() {
    const obj = { ...{ x: 1 }, y: 2 };
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_89() {
    const key = 'dynamic';
    const obj = { [key]: 1 };
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_90() {
    let called = false;
    const obj = { get prop() { called = true; return 1; } };
    const result = Reflect.preventExtensions(obj);
    return result === true && !called;
}


export function test_preventExtensions_91() {
    const arr = [1,,3];
    return Reflect.preventExtensions(arr) === true;
}


export function test_preventExtensions_92() {
    const ta = new Uint8Array([1,2]);
    return Reflect.preventExtensions(ta) === true;
}


export function test_preventExtensions_93() {
    if (typeof SharedArrayBuffer === 'undefined') return true;
    const sab = new SharedArrayBuffer(8);
    return Reflect.preventExtensions(sab) === true;
}


export function test_preventExtensions_94() {
    const e = new Error('fail');
    return Reflect.preventExtensions(e) === true;
}


export function test_preventExtensions_95() {
    const e = new SyntaxError('invalid');
    return Reflect.preventExtensions(e) === true;
}


export function test_preventExtensions_96() {
    const e = new URIError();
    return Reflect.preventExtensions(e) === true;
}


export function test_preventExtensions_97() {
    const e = new RangeError('range');
    return Reflect.preventExtensions(e) === true;
}


export function test_preventExtensions_98() {
    try { throw new ReferenceError(); } catch (e) {
        return Reflect.preventExtensions(e) === true;
    }
}


export function test_preventExtensions_99() {
    const e = new EvalError();
    return Reflect.preventExtensions(e) === true;
}


export function test_preventExtensions_100() {
    const e = new TypeError('type');
    return Reflect.preventExtensions(e) === true;
}

export function test_preventExtensions_101() {
    const p = Promise.reject(new Error());
    return Reflect.preventExtensions(p) === true;
}


export function test_preventExtensions_102() {
    const p = Promise.all([1,2]);
    return Reflect.preventExtensions(p) === true;
}


export function test_preventExtensions_103() {
    const p = Promise.race([Promise.resolve(1)]);
    return Reflect.preventExtensions(p) === true;
}


export function test_preventExtensions_104() {
    return Reflect.preventExtensions(Map.prototype) === true;
}


export function test_preventExtensions_105() {
    return Reflect.preventExtensions(Set.prototype) === true;
}


export function test_preventExtensions_106() {
    return Reflect.preventExtensions(WeakMap.prototype) === true;
}


export function test_preventExtensions_107() {
    return Reflect.preventExtensions(ArrayBuffer.prototype) === true;
}


export function test_preventExtensions_108() {
    return Reflect.preventExtensions(DataView.prototype) === true;
}


export function test_preventExtensions_109() {
    return Reflect.preventExtensions(Symbol.prototype) === true;
}


export function test_preventExtensions_110() {
    return Reflect.preventExtensions(Function.prototype) === true;
}


export function test_preventExtensions_111() {
    return Reflect.preventExtensions(Object.prototype) === true;
}


export function test_preventExtensions_112() {
    return Reflect.preventExtensions(Array.prototype) === true;
}


export function test_preventExtensions_113() {
    return Reflect.preventExtensions(String.prototype) === true;
}


export function test_preventExtensions_114() {
    return Reflect.preventExtensions(Number.prototype) === true;
}


export function test_preventExtensions_115() {
    return Reflect.preventExtensions(Boolean.prototype) === true;
}


export function test_preventExtensions_116() {
    return Reflect.preventExtensions(Date.prototype) === true;
}


export function test_preventExtensions_117() {
    return Reflect.preventExtensions(RegExp.prototype) === true;
}


export function test_preventExtensions_118() {
    return Reflect.preventExtensions(Error.prototype) === true;
}


export function test_preventExtensions_119() {
    return Reflect.preventExtensions(Promise.prototype) === true;
}


export function test_preventExtensions_120() {
    return Reflect.preventExtensions(Reflect.apply) === true;
}


export function test_preventExtensions_121() {
    return Reflect.preventExtensions(globalThis.Array) === true;
}


export function test_preventExtensions_122() {
    return Reflect.preventExtensions(Math.random) === true;
}


export function test_preventExtensions_123() {
    return Reflect.preventExtensions(JSON.stringify) === true;
}


export function test_preventExtensions_124() {
    if (typeof Intl === 'undefined') return true;
    return Reflect.preventExtensions(Intl.Collator) === true;
}


export function test_preventExtensions_125() {
    const ctors = [Object, Array, Function, String, Number, Boolean, Date, RegExp, Error, Promise, Map, Set];
    return ctors.every(C => Reflect.preventExtensions(C) === true);
}


export function test_preventExtensions_126() {
    const protos = [
        Object.prototype, Array.prototype, Function.prototype,
        String.prototype, Number.prototype, Boolean.prototype,
        Date.prototype, RegExp.prototype, Error.prototype,
        Map.prototype, Set.prototype, Promise.prototype
    ];
    return protos.every(p => Reflect.preventExtensions(p) === true);
}


export function test_preventExtensions_128() {
    const errors = [
        new Error(), new TypeError(), new SyntaxError(),
        new ReferenceError(), new RangeError(), new EvalError(), new URIError()
    ];
    return errors.every(e => Reflect.preventExtensions(e) === true);
}


export function test_preventExtensions_129() {
    const p = Promise.resolve(1).then(x => x+1);
    return Reflect.preventExtensions(p) === true;
}


export function test_preventExtensions_130() {
    const iter = new Map().entries();
    return Reflect.preventExtensions(iter) === true;
}


export function test_preventExtensions_131() {
    const iter = new Set().values();
    return Reflect.preventExtensions(iter) === true;
}


export function test_preventExtensions_132() {
    const iter = [][Symbol.iterator]();
    return Reflect.preventExtensions(iter) === true;
}


export function test_preventExtensions_133() {
    const iter = ""[Symbol.iterator]();
    return Reflect.preventExtensions(iter) === true;
}


export function test_preventExtensions_134() {
    function* gen() {}
    const iter = gen();
    return Reflect.preventExtensions(iter) === true;
}


export function test_preventExtensions_135() {
    const obj = {};
    obj[Symbol.asyncIterator] = async function* () {};
    const iter = obj[Symbol.asyncIterator]();
    return Reflect.preventExtensions(iter) === true;
}


export function test_preventExtensions_136() {
    return function () {
        const success = Reflect.preventExtensions(arguments);
        return success === true;
    }(1);
}


export function test_preventExtensions_137() {
    'use strict';
    return function () {
        return Reflect.preventExtensions(arguments) === true;
    }();
}


export function test_preventExtensions_138() {
    const obj = { __proto__: null, x: 1 };
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_139() {
    const obj = Object.create({}, { a: { value: 1 } });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_140() {
    const a = {};
    const b = Object.create(a);
    const c = Object.create(b);
    return Reflect.preventExtensions(c) === true;
}


export function test_preventExtensions_141() {
    const obj = Object.seal({ x: 1 });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_142() {
    const obj = Object.freeze({ y: 2 });
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_143() {
    const sym = Symbol('meta');
    const obj = { [sym]: 1 };
    return Reflect.preventExtensions(obj) === true;
}


export function test_preventExtensions_144() {
    if (typeof WeakRef === 'undefined') return true;
    const wr = new WeakRef({});
    return Reflect.preventExtensions(wr) === true;
}


export function test_preventExtensions_145() {
    if (typeof FinalizationRegistry === 'undefined') return true;
    const fr = new FinalizationRegistry(() => {});
    return Reflect.preventExtensions(fr) === true;
}


export function test_preventExtensions_146() {
    const instances = [
        {}, [], function(){}, new Date(), /a/,
        new Error(), Promise.resolve(), new Map(), new Set(),
        new ArrayBuffer(8), new Int8Array(), Object(1), new String("s")
    ];
    return instances.every(inst => Reflect.preventExtensions(inst) === true);
}


export function test_preventExtensions_147() {
    const wrappers = [
        Object("s"), Object(1), Object(true), Object(Symbol())
    ];
    return wrappers.every(w => Reflect.preventExtensions(w) === true);
}


export function test_preventExtensions_149() {
    return Reflect.preventExtensions(globalThis) === true;
}


export function test_preventExtensions_150() {
    const instances = [
        { a: 1 }, [1,2], function(){},
        new Date(), /regex/, new Error(),
        new Map(), new Set(), new ArrayBuffer(8),
        new Int8Array(), Object(42), new String("s")
    ];
    return instances.every(inst =>
    Reflect.preventExtensions(inst) === true &&
        !Object.isExtensible(inst)
    );
}
