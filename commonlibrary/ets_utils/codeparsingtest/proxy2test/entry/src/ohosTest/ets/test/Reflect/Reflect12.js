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

export function test_set_1() {
    const obj = {};
    return Reflect.set(obj, 'a', 1) === true && obj.a === 1;
}


export function test_set_2() {
    const obj = { a: 1 };
    return Reflect.set(obj, 'a', 2) === true && obj.a === 2;
}


export function test_set_3() {
    const arr = [1];
    return Reflect.set(arr, '0', 9) === true && arr[0] === 9;
}


export function test_set_4() {
    const arr = [1];
    return Reflect.set(arr, 0, 8) === true && arr[0] === 8;
}


export function test_set_5() {
    const arr = [1, 2, 3];
    return Reflect.set(arr, 'length', 1) === true && arr.length === 1;
}


export function test_set_6() {
    const sym = Symbol('s');
    const obj = {};
    return Reflect.set(obj, sym, 1) === true && obj[sym] === 1;
}


export function test_set_7() {
    const s1 = Symbol('a'), s2 = Symbol('b');
    const obj = {};
    return Reflect.set(obj, s1, 1) && Reflect.set(obj, s2, 2) && obj[s1] === 1 && obj[s2] === 2;
}


export function test_set_8() {
    const sym = Symbol.for('shared');
    const obj = {};
    return Reflect.set(obj, sym, 'value') === true && obj[sym] === 'value';
}


export function test_set_9() {
    const obj = Object.preventExtensions({});
    return Reflect.set(obj, 'newProp', 1) === false && obj.newProp === undefined;
}


export function test_set_10() {
    const obj = Object.preventExtensions({ x: 1 });
    return Reflect.set(obj, 'x', 2) === true && obj.x === 2;
}


export function test_set_11() {
    const obj = Object.seal({ y: 2 });
    return Reflect.set(obj, 'y', 3) === true && obj.y === 3;
}


export function test_set_12() {
    const obj = Object.seal({});
    return Reflect.set(obj, 'z', 3) === false && obj.z === undefined;
}


export function test_set_13() {
    const obj = Object.freeze({ a: 1 });
    return Reflect.set(obj, 'a', 2) === false && obj.a === 1;
}


export function test_set_14() {
    try {
        Reflect.set("hello", 'prop', 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_set_15() {
    try {
        Reflect.set(123, 'prop', 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_set_16() {
    try {
        Reflect.set(true, 'prop', 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_set_17() {
    try {
        Reflect.set(null, 'x', 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_set_18() {
    try {
        Reflect.set(undefined, 'x', 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_set_19() {
    class C {
        constructor() {
            this.init = 1;
        }
    }

    const c = new C();
    return Reflect.set(c, 'dynamic', 2) === true && c.dynamic === 2;
}


export function test_set_20() {
    const parent = { inherited: 1 };
    const child = Object.create(parent);
    return Reflect.set(child, 'inherited', 2) === true && child.inherited === 2 && parent.inherited === 1;
}


export function test_set_21() {
    let accessed = false;
    const obj = {};
    Object.defineProperty(obj, 'getOnly', {
        get() {
            accessed = true;
            return 1;
        }
    });
    Reflect.set(obj, 'getOnly', 2);
    return !accessed;
}


export function test_set_22() {
    const obj = {};
    Object.defineProperty(obj, 'readonly', {
        value: 1,
        writable: false
    });
    return Reflect.set(obj, 'readonly', 2) === false && obj.readonly === 1;
}


export function test_set_23() {
    const obj = {};
    Object.defineProperty(obj, 'fixed', {
        value: 1,
        configurable: false
    });
    return Reflect.set(obj, 'fixed', 2) === false && obj.fixed === 1;
}


export function test_set_24() {
    let setValue;
    const obj = {};
    Object.defineProperty(obj, 'accessor', {
        set(v) {
            setValue = v;
        },
        get() {
            return setValue;
        }
    });
    return Reflect.set(obj, 'accessor', 99) === true && setValue === 99;
}


export function test_set_25() {
    const obj = {};
    Object.defineProperty(obj, 'getterOnly', {
        get() {
            return 1;
        }
    });
    return Reflect.set(obj, 'getterOnly', 2) === false;
}


export function test_set_26() {
    const m = new Map();
    return Reflect.set(m, 'customProp', 1) === true && m.customProp === 1;
}


export function test_set_27() {
    const s = new Set();
    return Reflect.set(s, 'tag', 'set') === true && s.tag === 'set';
}


export function test_set_28() {
    const wm = new WeakMap();
    return Reflect.set(wm, 'meta', 'data') === true && wm.meta === 'data';
}


export function test_set_29() {
    const p = Promise.resolve();
    return Reflect.set(p, 'result', 42) === true && p.result === 42;
}


export function test_set_30() {
    const buf = new ArrayBuffer(8);
    return Reflect.set(buf, 'label', 'buffer') === true && buf.label === 'buffer';
}


export function test_set_31() {
    const ta = new Int32Array(2);
    return Reflect.set(ta, 'note', 'int array') === true && ta.note === 'int array';
}


export function test_set_32() {
    const target = { x: 1 };
    const handler = {};
    const proxy = new Proxy(target, handler);
    return Reflect.set(proxy, 'y', 2) === true && proxy.y === 2;
}


export function test_set_33() {
    let called = false;
    const target = {};
    const handler = {
        set(t, k, v, r) {
            called = true;
            return Reflect.set(t, k, v, r);
        }
    };
    const proxy = new Proxy(target, handler);
    Reflect.set(proxy, 'prop', 1);
    return called;
}


export function test_set_34() {
    const target = {};
    const handler = {
        set() {
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.set(proxy, 'any', 1) === true;
}


export function test_set_35() {
    const target = {};
    const handler = {
        set() {
            return false;
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.set(proxy, 'any', 1) === false;
}


export function test_set_36() {
    const target = Object.freeze({ fixed: 1 });
    const handler = {
        set(t, k, v) {

            return Reflect.set(t, k, v);
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.set(proxy, 'fixed', 2) === false;
}


export function test_set_37() {
    return function(){
        return Reflect.set(arguments, '0', 99) === true && arguments[0] === 99;
    }(1);
}


export function test_set_38() {
    'use strict';
    return function(){
        return Reflect.set(arguments, '0', 88) === true && arguments[0] === 88;
    }(1);
}


export function test_set_39() {
    const d = new Date();
    return Reflect.set(d, 'tag', 'date') === true && d.tag === 'date';
}


export function test_set_40() {
    const r = /abc/;
    return Reflect.set(r, 'flags', 'manual') === true && r.flags === 'manual';
}


export function test_set_41() {
    let capturedThis;
    const parent = {
        set prop(v) {
            capturedThis = this;
        }
    };
    const child = Object.create(parent);
    Reflect.set(child, 'prop', 1, child);
    return capturedThis === child;
}


export function test_set_42() {
    let boundThis;
    const proto = {
        set value(v) {
            boundThis = this;
        }
    };
    const obj = Object.create(proto);
    Reflect.set(obj, 'value', 1);
    return boundThis === obj;
}


export function test_set_43() {
    let boundThis;
    const sharedSetter = {
        set data(v) {
            boundThis = this;
        }
    };
    const obj1 = Object.create(sharedSetter);
    const obj2 = Object.create(sharedSetter);
    Reflect.set(obj1, 'data', 1, obj2);
    return boundThis === obj2;
}


export function test_set_44() {
    let setCalled = false;
    const parent = { _val: 0 };
    Object.defineProperty(parent, 'prop', {
        set(v) {
            setCalled = true;
            this._val = v;
        }
    });
    const child = Object.create(parent);
    Reflect.set(child, 'prop', 1);
    return setCalled && child._val === 1;
}


export function test_set_45() {
    const proto = { _v: null };
    Object.defineProperty(proto, 'prop', {
        set() {
            proto._v = 'proto';
        }
    });

    const obj = Object.create(proto);
    Object.defineProperty(obj, 'prop', {
        set() {
            obj._v = 'own';
        }
    });
    obj._v = null;

    Reflect.set(obj, 'prop', 1);
    return obj._v === 'own' && proto._v === null;
}


export function test_set_46() {
    const obj = Object.freeze({ a: 1, b: 2 });
    return Reflect.set(obj, 'a', 9) === false &&
        Reflect.set(obj, 'c', 3) === false;
}


export function test_set_47() {
    const obj = Object.seal({ x: 1 });
    return Reflect.set(obj, 'x', 2) === true &&
        Reflect.set(obj, 'y', 3) === false;
}


export function test_set_48() {
    const obj = Object.preventExtensions({ z: 3 });
    return Reflect.set(obj, 'z', 4) === true &&
        Reflect.set(obj, 'w', 5) === false;
}


export function test_set_49() {
    const obj = {};
    Object.defineProperty(obj, 'mutable', {
        value: 1,
        writable: true,
        configurable: false
    });
    return Reflect.set(obj, 'mutable', 2) === true && obj.mutable === 2;
}


export function test_set_50() {
    const obj = {};
    Object.defineProperty(obj, 'const', {
        value: 1,
        writable: false,
        configurable: true
    });
    return Reflect.set(obj, 'const', 2) === false;
}


export function test_set_51() {
    const priv = Symbol('private');
    const obj = {};
    Reflect.set(obj, priv, 'secret');
    return obj[priv] === 'secret';
}


export function test_set_52() {
    class C {
        static staticProp = 'static';
    }

    const c = new C();
    return Reflect.set(c, 'staticProp', 'modified') === true && c.staticProp === 'modified';
}


export function test_set_53() {
    class C {
        method() {
        }
    }

    const c = new C();
    return Reflect.set(c, 'method', 'override') === true && c.method === 'override';
}


export function test_set_54() {
    class A {
    }

    class B extends A {
    }

    class C extends B {
    }

    const c = new C();
    return Reflect.set(c, 'dynamic', 1) === true && c.dynamic === 1;
}


export function test_set_55() {
    let success;

    class C {
        constructor() {
            success = Reflect.set(this, 'init', true);
        }
    }

    new C();
    return success === true;
}


export function test_set_56() {
    return Reflect.set(Math, 'CUSTOM', 1) === true && Math.CUSTOM === 1;
}


export function test_set_57() {
    return Reflect.set(JSON, 'version', '1.0') === true && JSON.version === '1.0';
}


export function test_set_58() {
    return Reflect.set(Reflect, 'debug', true) === true && Reflect.debug === true;
}


export function test_set_59() {
    return Reflect.set(globalThis, '__TEST__', 123) === true && globalThis.__TEST__ === 123;
}


export function test_set_60() {
    if (typeof window === 'undefined') {
        return true;
    }
    return Reflect.set(window, '__TEMP__', 'temp') === true && window.__TEMP__ === 'temp';
}


export function test_set_66() {
    const target = {};
    const handler = {
        set(t, k, v, r) {
            return Reflect.set(t, k, v, r);
        }
    };
    const proxy1 = new Proxy({}, handler);
    const proxy2 = new Proxy(proxy1, handler);
    return Reflect.set(proxy2, 'deep', 1) === true && proxy2.deep === 1;
}


export function test_set_67() {
    const target = {};
    const handler = {
        set(t, k, v) {
            return Reflect.set(t, k, v * 2);
        }
    };
    const proxy = new Proxy(target, handler);
    Reflect.set(proxy, 'x', 3);
    return target.x === 6;
}


export function test_set_68() {
    const target = {};
    const handler = {
        set() {
            return false;
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.set(proxy, 'blocked', 1) === false;
}


export function test_set_69() {
    const target = {};
    const handler = {
        set() {
            throw new Error("Denied");
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.set(proxy, 'x', 1);
        return false;
    } catch (e) {
        return e.message === "Denied";
    }
}


export function test_set_70() {
    let receivedReceiver;
    const target = {};
    const handler = {
        set(t, k, v, r) {
            receivedReceiver = r;
            return Reflect.set(t, k, v);
        }
    };
    const proxy = new Proxy(target, handler);
    const receiver = {};
    Reflect.set(proxy, 'prop', 1, receiver);
    return receivedReceiver === receiver;
}


export function test_set_71() {
    const obj = {};
    const fn = function* () {
    };
    return Reflect.set(obj, Symbol.iterator, fn) === true && obj[Symbol.iterator] === fn;
}


export function test_set_72() {
    const obj = {};
    const fn = async function* () {
    };
    return Reflect.set(obj, Symbol.asyncIterator, fn) === true;
}


export function test_set_73() {
    const Fn = function () {
    };
    const handler = {
        hasInstance() {
            return true;
        }
    };
    const fakeInst = new Proxy(Fn, handler);
    return Reflect.set(Function, Symbol.hasInstance, handler) === true;
}


export function test_set_74() {
    const s1 = Symbol('1'), s2 = Symbol('2');
    const obj = {};
    return Reflect.set(obj, s1, 1) && Reflect.set(obj, s2, 2) && obj[s1] === 1 && obj[s2] === 2;
}


export function test_set_75() {
    const sym = Symbol.for('global');
    const obj = {};
    return Reflect.set(obj, sym, 'globalValue') === true && obj[sym] === 'globalValue';
}


export function test_set_76() {
    const obj = { __proto__: null, x: 1 };
    return Reflect.set(obj, 'y', 2) === true && obj.y === 2;
}


export function test_set_77() {
    const obj = Object.create(null);
    return Reflect.set(obj, 'key', 'value') === true && obj.key === 'value';
}


export function test_set_78() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', {
        value: 1,
        writable: true,
        enumerable: false
    });
    return Reflect.set(obj, 'hidden', 2) === true && obj.hidden === 2;
}


export function test_set_79() {
    const obj = {};
    Object.defineProperties(obj, {
        a: { value: 1, writable: true },
        b: { value: 2, writable: false }
    });
    return Reflect.set(obj, 'a', 9) === true && Reflect.set(obj, 'b', 9) === false;
}


export function test_set_80() {
    let called = false;
    const obj = {
        get prop() {
            called = true;
            return 1;
        }
    };
    Reflect.set(obj, 'prop', 2);
    return !called;
}


export function test_set_81() {
    const arr = [1, , 3];
    return Reflect.set(arr, '1', 2) === true && arr[1] === 2;
}


export function test_set_82() {
    const ta = new Uint8Array(2);
    return Reflect.set(ta, '0', 255) === true && ta[0] === 255;
}


export function test_set_83() {
    if (typeof SharedArrayBuffer === 'undefined') {
        return true;
    }
    const sab = new SharedArrayBuffer(8);
    return Reflect.set(sab, 'tag', 'shared') === true && sab.tag === 'shared';
}


export function test_set_84() {
    if (typeof Atomics === 'undefined') {
        return true;
    }
    const ia = new Int32Array(new SharedArrayBuffer(16));
    return Reflect.set(ia, '0', 42) === true && Atomics.load(ia, 0) === 42;
}


export function test_set_85() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const coll = new Intl.Collator();
    return Reflect.set(coll, 'custom', 'value') === true && coll.custom === 'value';
}


export function test_set_86() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const dtf = new Intl.DateTimeFormat();
    return Reflect.set(dtf, 'precision', 'ms') === true && dtf.precision === 'ms';
}


export function test_set_87() {
    if (typeof WeakRef === 'undefined') {
        return true;
    }
    const wr = new WeakRef({});
    return Reflect.set(wr, 'meta', 'info') === true && wr.meta === 'info';
}


export function test_set_88() {
    if (typeof FinalizationRegistry === 'undefined') {
        return true;
    }
    const fr = new FinalizationRegistry(() => {
    });
    return Reflect.set(fr, 'active', true) === true && fr.active === true;
}


export function test_set_89() {
    const p = Promise.resolve(1);
    return Reflect.set(p, 'state', 'fulfilled') === true && p.state === 'fulfilled';
}


export function test_set_90() {
    const iter = new Map().entries();
    return Reflect.set(iter, 'running', true) === true && iter.running === true;
}


export function test_set_91() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const arr = new iframeWindow.Array(1, 2);
    return Reflect.set(arr, 'dynamic', 'value') === true && arr.dynamic === 'value';
}


export function test_set_92() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const obj = iframeWindow.Object.create(null);
    return Reflect.set(obj, 'key', 'cross-realm') === true && obj.key === 'cross-realm';
}


export function test_set_93() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const fn = new iframeWindow.Function();
    return Reflect.set(fn, 'namespace', 'remote') === true && fn.namespace === 'remote';
}


export function test_set_94() {
    if (typeof document === 'undefined') {
        return true;
    }
    const el = document.createElement('input');
    return Reflect.set(el, 'customFlag', true) === true && el.customFlag === true;
}


export function test_set_95() {
    if (typeof document === 'undefined' || !document.body) {
        return true;
    }
    return Reflect.set(document.body, 'analyzed', true) === true && document.body.analyzed === true;
}


export function test_set_96() {
    const obj = JSON.parse('{"x":1}');
    return Reflect.set(obj, 'y', 2) === true && obj.y === 2;
}


export function test_set_97() {
    const target = { a: 1 };
    Object.assign(target, { b: 2 });
    return Reflect.set(target, 'c', 3) === true && target.c === 3;
}


export function test_set_98() {
    const base = { x: 1 };
    const obj = { ...base };
    return Reflect.set(obj, 'y', 2) === true && obj.y === 2;
}


export function test_set_99() {
    const key = 'dynamic';
    const obj = {};
    return Reflect.set(obj, key, 'value') === true && obj.dynamic === 'value';
}


export function test_set_100() {
    let called = false;
    const obj = {
        get prop() {
            called = true;
            return 1;
        }
    };
    Reflect.set(obj, 'prop', 2);
    return !called;
}


export function test_set_101() {
    const obj = {};
    return Reflect.set(obj, 'first', true) === true;
}


export function test_set_102() {
    const obj = { level1: { level2: {} } };
    return Reflect.set(obj.level1.level2, 'deep', 1) === true && obj.level1.level2.deep === 1;
}


export function test_set_103() {
    const arr = [1, 2];
    const len = arr.length;
    return Reflect.set(arr, len, 3) === true && arr[2] === 3;
}


export function test_set_104() {
    const obj = {};
    return Reflect.set(obj, 'key!@#', 'special') === true && obj['key!@#'] === 'special';
}


export function test_set_105() {
    const obj = {};
    return Reflect.set(obj, '姓名', '张三') === true && obj.姓名 === '张三';
}


export function test_set_106() {
    const obj = {};
    return Reflect.set(obj, '', 'empty') === true && obj[''] === 'empty';
}


export function test_set_107() {
    const obj = {};
    return Reflect.set(obj, '-1', 'neg') === true && obj['-1'] === 'neg';
}


export function test_set_108() {
    const obj = {};
    return Reflect.set(obj, '1.5', 'float') === true && obj['1.5'] === 'float';
}


export function test_set_109() {
    const key = {
        toString() {
            return 'objKey';
        }
    };
    const obj = {};
    return Reflect.set(obj, key, 'value') === true && obj.objKey === 'value';
}


export function test_set_110() {
    const key = {
        [Symbol.toPrimitive]() {
            return 'symbolPrim';
        }
    };
    const obj = {};
    return Reflect.set(obj, key, 'primValue') === true && obj.symbolPrim === 'primValue';
}


export function test_set_111() {
    const target = {};
    const proto = {
        set prop(v) {
            this._v = v;
        }
    };
    Object.setPrototypeOf(target, proto);
    try {

        Reflect.set(target, 'prop', 1, "not-object");
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_set_112() {
    const obj = {};
    Object.defineProperty(obj, 'fails', {
        set() {
            throw new Error("Cannot set");
        }
    });
    try {
        Reflect.set(obj, 'fails', 1);
        return false;
    } catch (e) {
        return e.message === "Cannot set";
    }
}


export function test_set_113() {
    const target = {};
    const handler = {
        set() {
            return false;
        }
    };
    const proxy = new Proxy(target, handler);
    return Reflect.set(proxy, 'blocked', 1) === false;
}


export function test_set_114() {
    const obj = Object.preventExtensions({ x: 1 });
    return Reflect.set(obj, 'newProp', 2) === false;
}


export function test_set_115() {
    const obj = Object.seal({ y: 2 });
    return Reflect.set(obj, 'z', 3) === false;
}


export function test_set_116() {
    const obj = Object.freeze({ a: 1 });
    return Reflect.set(obj, 'a', 9) === false;
}


export function test_set_117() {
    const obj = {};
    Object.defineProperty(obj, 'const', { value: 1, writable: false });
    return Reflect.set(obj, 'const', 2) === false;
}


export function test_set_118() {
    const obj = {};
    Object.defineProperty(obj, 'getOnly', {
        get() {
            return 1;
        }
    });
    return Reflect.set(obj, 'getOnly', 2) === false;
}


export function test_set_120() {
    const obj = {};
    return Reflect.set(obj, 'a', 1) &&
    Reflect.set(obj, 'b', 2) &&
    Reflect.set(obj, 'c', 3) &&
        obj.a === 1 && obj.b === 2 && obj.c === 3;
}


export function test_set_121() {
    return Reflect.set(Math, '__M__', 1) === true;
}

export function test_set_122() {
    return Reflect.set(JSON, '__J__', 1) === true;
}

export function test_set_123() {
    return Reflect.set(Reflect, '__R__', 1) === true;
}

export function test_set_124() {
    if (typeof Intl !== 'undefined') {
        return Reflect.set(Intl, '__I__', 1) === true;
    }
    return true;
}

export function test_set_125() {
    return Reflect.set(globalThis, '__G__', 1) === true;
}

export function test_set_126() {
    return Reflect.set(Array, '__A__', 1) === true;
}

export function test_set_127() {
    return Reflect.set(String, '__S__', 1) === true;
}

export function test_set_128() {
    return Reflect.set(Promise, '__P__', 1) === true;
}

export function test_set_129() {
    return Reflect.set(Map, '__MAP__', 1) === true;
}

export function test_set_130() {
    return Reflect.set(Set, '__SET__', 1) === true;
}


export function test_set_141() {
    const o = {};
    for (let i = 0; i < 5; i++) {
        Reflect.set(o, i, i);
    }
    return o[4] === 4;
}

export function test_set_142() {
    const arr = [];
    Reflect.set(arr, 'push', () => 'hacked');
    return typeof arr.push === 'function';
}

export function test_set_143() {
    const obj = { 0: 'zero' };
    Reflect.set(obj, 1, 'one');
    return obj[1] === 'one';
}

export function test_set_144() {
    const sym = Symbol();
    const obj = {};
    Reflect.set(obj, sym, 'symbolic');
    return obj[sym] === 'symbolic';
}

export function test_set_145() {
    const obj = Object.create(null);
    Reflect.set(obj, 'nullProto', true);
    return obj.nullProto === true;
}

export function test_set_146() {
    const p = Promise.resolve();
    Reflect.set(p, 'then', null);
    return p.then === null;
}

export function test_set_147() {
    const m = new Map();
    Reflect.set(m, 'size', 999);
    return m.size == 0;
}

export function test_set_148() {
    const s = new Set();
    Reflect.set(s, 'size', 888);
    return s.size == 0;
}

export function test_set_149() {
    const d = new Date();
    Reflect.set(d, 'getTime', () => 0);
    return d.getTime() === 0;
}

export function test_set_150() {
    const instances = [
        {}, [], function () {
    }, new Date(), /a/,
        new Error(), Promise.resolve(), new Map(), new Set(),
        new ArrayBuffer(8), Object(1), new String("s")
    ];
    return instances.every(inst => {
        try {
            return Reflect.set(inst, 'testFlag', true) === true && inst.testFlag === true;
        } catch {
            return false;
        }
    });
}
