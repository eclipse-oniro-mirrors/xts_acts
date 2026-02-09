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

export function test_getPrototypeOf_1() {
    const obj = {};
    const proto = Reflect.getPrototypeOf(obj);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_2() {

    function C() {
    }

    const c = new C();
    const proto = Reflect.getPrototypeOf(c);
    return proto === C.prototype;
}


export function test_getPrototypeOf_3() {
    const obj = Object.create(null);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === null;
}


export function test_getPrototypeOf_4() {
    const parent = { x: 1 };
    const child = Object.create(parent);
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent;
}


export function test_getPrototypeOf_5() {
    const arr = [1, 2];
    const proto = Reflect.getPrototypeOf(arr);
    return proto === Array.prototype;
}


export function test_getPrototypeOf_6() {

    function fn() {
    }

    const proto = Reflect.getPrototypeOf(fn);
    return proto === Function.prototype;
}


export function test_getPrototypeOf_7() {
    try {
        Reflect.getPrototypeOf("hello");
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getPrototypeOf_8() {
    try {
        Reflect.getPrototypeOf(123);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getPrototypeOf_9() {
    try {
        Reflect.getPrototypeOf(true);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getPrototypeOf_10() {
    try {
        Reflect.getPrototypeOf(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getPrototypeOf_11() {
    try {
        Reflect.getPrototypeOf(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getPrototypeOf_12() {
    const d = new Date();
    const proto = Reflect.getPrototypeOf(d);
    return proto === Date.prototype;
}


export function test_getPrototypeOf_13() {
    const r = /abc/;
    const proto = Reflect.getPrototypeOf(r);
    return proto === RegExp.prototype;
}


export function test_getPrototypeOf_14() {
    const e = new Error();
    const proto = Reflect.getPrototypeOf(e);
    return proto === Error.prototype;
}


export function test_getPrototypeOf_15() {
    const p = Promise.resolve();
    const proto = Reflect.getPrototypeOf(p);
    return proto === Promise.prototype;
}


export function test_getPrototypeOf_16() {
    const m = new Map();
    const proto = Reflect.getPrototypeOf(m);
    return proto === Map.prototype;
}


export function test_getPrototypeOf_17() {
    const s = new Set();
    const proto = Reflect.getPrototypeOf(s);
    return proto === Set.prototype;
}


export function test_getPrototypeOf_18() {
    const buf = new ArrayBuffer(8);
    const proto = Reflect.getPrototypeOf(buf);
    return proto === ArrayBuffer.prototype;
}


export function test_getPrototypeOf_19() {
    const ta = new Int32Array(2);
    const proto = Reflect.getPrototypeOf(ta);
    return proto === Int32Array.prototype;
}


export function test_getPrototypeOf_20() {
    const symObj = Object(Symbol('s'));
    const proto = Reflect.getPrototypeOf(symObj);
    return proto === Symbol.prototype;
}


export function test_getPrototypeOf_21() {
    const bObj = Object(true);
    const proto = Reflect.getPrototypeOf(bObj);
    return proto === Boolean.prototype;
}


export function test_getPrototypeOf_22() {
    const nObj = Object(42);
    const proto = Reflect.getPrototypeOf(nObj);
    return proto === Number.prototype;
}


export function test_getPrototypeOf_23() {
    const sObj = Object("text");
    const proto = Reflect.getPrototypeOf(sObj);
    return proto === String.prototype;
}


export function test_getPrototypeOf_24() {
    class C {
    }

    const c = new C();
    const proto = Reflect.getPrototypeOf(c);
    return proto === C.prototype;
}


export function test_getPrototypeOf_25() {
    class C {
        static method() {
        }
    }

    const c = new C();
    const proto = Reflect.getPrototypeOf(c);
    return proto === C.prototype;
}


export function test_getPrototypeOf_26() {
    class Parent {
    }

    class Child extends Parent {
    }

    const child = new Child();
    const proto = Reflect.getPrototypeOf(child);
    return proto === Child.prototype;
}


export function test_getPrototypeOf_27() {
    class A {
    }

    class B extends A {
    }

    class C extends B {
    }

    const c = new C();
    const proto1 = Reflect.getPrototypeOf(c);
    const proto2 = Reflect.getPrototypeOf(proto1);
    return proto1 === C.prototype && proto2 === B.prototype;
}


export function test_getPrototypeOf_28() {
    const obj = {};
    const newProto = { x: 1 };
    Object.setPrototypeOf(obj, newProto);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === newProto;
}


export function test_getPrototypeOf_29() {
    const obj = {};
    const p1 = {};
    const p2 = {};
    Object.setPrototypeOf(obj, p1);
    Object.setPrototypeOf(obj, p2);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === p2;
}


export function test_getPrototypeOf_30() {
    const proto = Reflect.getPrototypeOf(Object.prototype);
    return proto === null;
}


export function test_getPrototypeOf_31() {
    const proto = Reflect.getPrototypeOf(Function.prototype);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_32() {
    const proto = Reflect.getPrototypeOf(Array.prototype);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_33() {
    const protos = [
        Reflect.getPrototypeOf(Array.prototype),
        Reflect.getPrototypeOf(Date.prototype),
        Reflect.getPrototypeOf(Function.prototype),
        Reflect.getPrototypeOf(String.prototype)
    ];
    return protos.every(p => p === Object.prototype || p === null);
}


export function test_getPrototypeOf_34() {
    const target = {};
    const handler = {};
    const proxy = new Proxy(target, handler);
    const protoTarget = Reflect.getPrototypeOf(target);
    const protoProxy = Reflect.getPrototypeOf(proxy);
    return protoTarget === protoProxy;
}


export function test_getPrototypeOf_35() {
    let called = false;
    const target = {};
    const handler = {
        getPrototypeOf() {
            called = true;
            return Reflect.getPrototypeOf(target);
        }
    };
    const proxy = new Proxy(target, handler);
    Reflect.getPrototypeOf(proxy);
    return called;
}


export function test_getPrototypeOf_36() {
    const target = {};
    const fakeProto = {};
    const handler = {
        getPrototypeOf() {
            return fakeProto;
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.getPrototypeOf(proxy);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_getPrototypeOf_37() {
    const target = { x: 1 };
    const handler = {
        getPrototypeOf(t) {
            return Reflect.getPrototypeOf(t);
        }
    };
    const proxy = new Proxy(target, handler);
    const proto = Reflect.getPrototypeOf(proxy);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_38() {
    return function(){
        const proto = Reflect.getPrototypeOf(arguments);
        return proto === Object.prototype;
    }();
}


export function test_getPrototypeOf_39() {
    'use strict';
    return function(){
        const proto = Reflect.getPrototypeOf(arguments);
        return proto === Object.prototype;
    }();
}


export function test_getPrototypeOf_40() {

    function* gen() {
    }

    const g = gen();
    const proto = Reflect.getPrototypeOf(g);
    return proto === gen.prototype.constructor.prototype;
}


export function test_getPrototypeOf_41() {
    const asyncFn = async function () {
    };
    const af = asyncFn();
    const proto = Reflect.getPrototypeOf(af);
    return proto !== undefined && proto === Object.getPrototypeOf(Promise.resolve());
}


export function test_getPrototypeOf_42() {
    const wm = new WeakMap();
    const proto = Reflect.getPrototypeOf(wm);
    return proto === WeakMap.prototype;
}


export function test_getPrototypeOf_43() {
    const ws = new WeakSet();
    const proto = Reflect.getPrototypeOf(ws);
    return proto === WeakSet.prototype;
}


export function test_getPrototypeOf_44() {
    const proto = Reflect.getPrototypeOf(globalThis);
    return proto === Object.prototype || proto === null;
}


export function test_getPrototypeOf_45() {
    if (typeof window === 'undefined') {
        return true;
    }
    const proto = Reflect.getPrototypeOf(window);
    return proto !== undefined && typeof proto === 'object';
}


export function test_getPrototypeOf_46() {
    const proto = Reflect.getPrototypeOf(Math);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_47() {
    const proto = Reflect.getPrototypeOf(JSON);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_48() {
    const proto = Reflect.getPrototypeOf(Reflect);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_49() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const proto = Reflect.getPrototypeOf(Intl);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_50() {
    const arr = [1];
    const iter = arr[Symbol.iterator]();
    const proto = Reflect.getPrototypeOf(iter);
    return proto !== undefined;
}


export function test_getPrototypeOf_51() {
    if (typeof document === 'undefined') {
        return true;
    }
    const nodes = document.childNodes || document.querySelectorAll('*');
    if (!nodes[Symbol.iterator]) {
        return true;
    }
    const proto = Reflect.getPrototypeOf(nodes);
    return proto !== undefined;
}


export function test_getPrototypeOf_52() {
    if (typeof document === 'undefined') {
        return true;
    }
    const coll = document.images;
    if (!coll) {
        return true;
    }
    const proto = Reflect.getPrototypeOf(coll);
    return proto !== undefined;
}


export function test_getPrototypeOf_53() {

    function C() {
    }

    C.prototype = { custom: true };
    const c = new C();
    const proto = Reflect.getPrototypeOf(c);
    return proto === C.prototype;
}


export function test_getPrototypeOf_54() {

    function C() {
    }

    const oldProto = C.prototype;
    C.prototype = null;
    const c = new C();
    const proto = Reflect.getPrototypeOf(c);
    return proto === oldProto;
}


export function test_getPrototypeOf_55() {
    const obj = {};
    Object.setPrototypeOf(obj, null);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === null;
}


export function test_getPrototypeOf_57() {
    const obj = Object.freeze({ x: 1 });
    const proto = Reflect.getPrototypeOf(obj);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_58() {
    const obj = Object.seal({ y: 2 });
    const proto = Reflect.getPrototypeOf(obj);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_59() {
    const obj = Object.preventExtensions({ z: 3 });
    const proto = Reflect.getPrototypeOf(obj);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_60() {
    const parent = { x: 1 };
    const obj = Object.create(parent);
    let accessed = false;
    Object.defineProperty(obj, 'check', {
        get() {
            accessed = (Reflect.getPrototypeOf(this) === parent);
            return accessed;
        }
    });
    return obj.check;
}


export function test_getPrototypeOf_61() {
    const parent = { x: 1 };
    const child = Object.create(parent);
    const proto = Reflect.getPrototypeOf(child);
    return proto !== null && 'x' in child;
}


export function test_getPrototypeOf_62() {
    const parent = { inherited: 1 };
    const child = Object.create(parent);
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent && !child.hasOwnProperty('inherited');
}


export function test_getPrototypeOf_63() {
    const parent = { a: 1 };
    const child = Object.create(parent);
    const keys = [];
    for (let k in child) {
        keys.push(k);
    }
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent && keys.includes('a');
}


export function test_getPrototypeOf_64() {
    const p1 = { a: 1 };
    const p2 = { b: 2 };
    const obj = Object.create(p1);
    Object.setPrototypeOf(obj, p2);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === p2 && 'b' in obj && !('a' in obj);
}


export function test_getPrototypeOf_65() {
    const obj = Object.create(null);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === null;
}


export function test_getPrototypeOf_66() {
    const parent = { x: 1 };
    const child = { __proto__: parent };
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent;
}


export function test_getPrototypeOf_67() {
    const obj = { __proto__: null };
    const proto = Reflect.getPrototypeOf(obj);
    return proto === null;
}


export function test_getPrototypeOf_68() {
    const obj = { __proto__: 1 };
    const proto = Reflect.getPrototypeOf(obj);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_69() {
    const num = new Number(1);
    const proto = Reflect.getPrototypeOf(num);
    return proto === Number.prototype;
}


export function test_getPrototypeOf_70() {
    const r = new RegExp('abc');
    const proto = Reflect.getPrototypeOf(r);
    return proto === RegExp.prototype;
}


export function test_getPrototypeOf_71() {
    const d = new Date();
    const proto = Reflect.getPrototypeOf(d);
    return proto === Date.prototype;
}


export function test_getPrototypeOf_72() {
    const p = new Promise(() => {
    });
    const proto = Reflect.getPrototypeOf(p);
    return proto === Promise.prototype;
}


export function test_getPrototypeOf_73() {
    const m = new Map();
    const proto = Reflect.getPrototypeOf(m);
    return proto === Map.prototype;
}


export function test_getPrototypeOf_74() {
    const s = new Set();
    const proto = Reflect.getPrototypeOf(s);
    return proto === Set.prototype;
}


export function test_getPrototypeOf_75() {
    const wm = new WeakMap();
    const proto = Reflect.getPrototypeOf(wm);
    return proto === WeakMap.prototype;
}


export function test_getPrototypeOf_76() {
    const buf = new ArrayBuffer(8);
    const proto = Reflect.getPrototypeOf(buf);
    return proto === ArrayBuffer.prototype;
}


export function test_getPrototypeOf_77() {
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    const proto = Reflect.getPrototypeOf(dv);
    return proto === DataView.prototype;
}


export function test_getPrototypeOf_78() {
    if (typeof SharedArrayBuffer === 'undefined') {
        return true;
    }
    const sab = new SharedArrayBuffer(8);
    const proto = Reflect.getPrototypeOf(sab);
    return proto === SharedArrayBuffer.prototype;
}


export function test_getPrototypeOf_79() {
    const proto = Reflect.getPrototypeOf(Atomics);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_80() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const instance = new Intl.Collator();
    const proto = Reflect.getPrototypeOf(instance);
    return proto === Intl.Collator.prototype;
}


export function test_getPrototypeOf_81() {
    if (typeof Intl === 'undefined') {
        return true;
    }
    const dtf = new Intl.DateTimeFormat();
    const proto = Reflect.getPrototypeOf(dtf);
    return proto === Intl.DateTimeFormat.prototype;
}


export function test_getPrototypeOf_82() {
    if (typeof WeakRef === 'undefined') {
        return true;
    }
    const wr = new WeakRef({});
    const proto = Reflect.getPrototypeOf(wr);
    return proto === WeakRef.prototype;
}


export function test_getPrototypeOf_83() {
    if (typeof FinalizationRegistry === 'undefined') {
        return true;
    }
    const fr = new FinalizationRegistry(() => {
    });
    const proto = Reflect.getPrototypeOf(fr);
    return proto === FinalizationRegistry.prototype;
}


export function test_getPrototypeOf_84() {

    function C() {
        this.x = 1;
    }

    const instance = Reflect.construct(C, []);
    const proto = Reflect.getPrototypeOf(instance);
    return proto === C.prototype;
}


export function test_getPrototypeOf_85() {
    class Parent {
        constructor() {
            this.parent = true;
        }
    }

    class Child extends Parent {
        constructor() {
            super();
        }
    }

    const child = new Child();
    const proto = Reflect.getPrototypeOf(child);
    return proto === Child.prototype;
}


export function test_getPrototypeOf_86() {
    const a = {}, b = {}, c = {};
    const obj = {};
    Object.setPrototypeOf(obj, a);
    Object.setPrototypeOf(obj, b);
    Object.setPrototypeOf(obj, c);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === c;
}


export function test_getPrototypeOf_87() {
    const parentArr = [1, 2];
    const obj = Object.create(parentArr);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === parentArr;
}


export function test_getPrototypeOf_88() {

    function F() {
    }

    const obj = Object.create(F);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === F;
}


export function test_getPrototypeOf_89() {
    const parent = new Boolean(true);
    const obj = Object.create(parent);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === parent;
}


export function test_getPrototypeOf_90() {
    const parent = new Number(42);
    const obj = Object.create(parent);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === parent;
}


export function test_getPrototypeOf_91() {
    const parent = new String("parent");
    const obj = Object.create(parent);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === parent;
}


export function test_getPrototypeOf_92() {
    const sym = Symbol('test');
    const parent = Object(sym);
    const obj = Object.create(parent);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === parent;
}


export function test_getPrototypeOf_93() {
    const args = (function () {
        return arguments;
    })();
    const obj = Object.create(args);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === args;
}


export function test_getPrototypeOf_94() {

    function* gen() {
        yield 1;
    }

    const g = gen();
    const obj = Object.create(g);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === g;
}


export function test_getPrototypeOf_95() {
    const p = (async () => {
    })();
    const obj = Object.create(p);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === p;
}


export function test_getPrototypeOf_96() {
    const err = new Error();
    const obj = Object.create(err);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === err;
}


export function test_getPrototypeOf_97() {
    const m = new Map([['a', 1]]);
    const iter = m[Symbol.iterator]();
    const obj = Object.create(iter);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === iter;
}


export function test_getPrototypeOf_98() {
    const s = new Set([1]);
    const iter = s[Symbol.iterator]();
    const obj = Object.create(iter);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === iter;
}


export function test_getPrototypeOf_99() {
    const arr = [1];
    const iter = arr[Symbol.iterator]();
    const obj = Object.create(iter);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === iter;
}


export function test_getPrototypeOf_100() {
    const str = "hi";
    const iter = str[Symbol.iterator]();
    const obj = Object.create(iter);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === iter;
}

export function test_getPrototypeOf_101() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const obj = iframeWindow.Object.create(iframeWindow.Object.prototype);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === iframeWindow.Object.prototype;
}


export function test_getPrototypeOf_102() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];
    const arr = new iframeWindow.Array(1, 2);
    const proto = Reflect.getPrototypeOf(arr);
    return proto === iframeWindow.Array.prototype;
}


export function test_getPrototypeOf_103() {
    if (typeof window === 'undefined' || !window.frames || !window.frames[0]) {
        return true;
    }
    const iframeWindow = window.frames[0];

    function fn() {
    }

    const bound = fn.bind({});
    const proto = Reflect.getPrototypeOf(bound);
    return proto === iframeWindow.Function.prototype || proto === Function.prototype;
}


export function test_getPrototypeOf_104() {
    const obj = {};
    const parent = {};
    const result = Object.setPrototypeOf(obj, parent);
    return result === obj && Reflect.getPrototypeOf(obj) === parent;
}


export function test_getPrototypeOf_105() {
    const obj = Object.create(null);
    try {
        obj.toString();
        return false;
    } catch (e) {
        return true;
    }
}


export function test_getPrototypeOf_106() {
    const obj = Object.create(null);
    obj.x = 1;
    const proto = Reflect.getPrototypeOf(obj);
    return proto === null && typeof obj.toString === 'undefined';
}


export function test_getPrototypeOf_107() {
    const parent = {
        toString() {
            return "custom";
        }
    };
    const obj = Object.create(parent);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === parent && obj.toString() === "custom";
}


export function test_getPrototypeOf_108() {
    const target = {};
    const handler = {
        getPrototypeOf(t) {
            return Reflect.getPrototypeOf(t);
        }
    };
    const proxy1 = new Proxy(target, handler);
    const proxy2 = new Proxy(proxy1, handler);
    const proto = Reflect.getPrototypeOf(proxy2);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_109() {
    const target = {};
    const handler = {
        getPrototypeOf(t) {
            return Object.prototype;
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        const proto = Reflect.getPrototypeOf(proxy);
        return proto === Object.prototype;
    } catch (e) {
        return false;
    }
}


export function test_getPrototypeOf_110() {
    const target = {};
    const fakeProto = {};
    const handler = {
        getPrototypeOf() {
            return fakeProto;
        }
    };
    const proxy = new Proxy(target, handler);
    try {
        Reflect.getPrototypeOf(proxy);
        return false;
    } catch (e) {
        return true;
    }
}


export function test_getPrototypeOf_111() {

    function C() {
        this.value = 1;
    }

    const instance = Reflect.construct(C, []);
    const proto = Reflect.getPrototypeOf(instance);
    return proto === C.prototype;
}


export function test_getPrototypeOf_112() {

    function C() {
        return { x: 1 };
    }

    const instance = new C();
    const proto = Reflect.getPrototypeOf(instance);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_113() {
    const fn = () => {
    };
    const proto = Reflect.getPrototypeOf(fn);
    return proto === Function.prototype;
}


export function test_getPrototypeOf_114() {
    const fn = () => {
    };
    try {
        new fn();
        return false;
    } catch (e) {
        const proto = Reflect.getPrototypeOf(fn);
        return proto === Function.prototype;
    }
}


export function test_getPrototypeOf_115() {
    const symObj = Object(Symbol('s'));
    const proto = Reflect.getPrototypeOf(symObj);
    return proto === Symbol.prototype;
}


export function test_getPrototypeOf_116() {
    const obj = {};
    Object.defineProperties(obj, {
        a: { value: 1 },
        b: { value: 2 }
    });
    const proto = Reflect.getPrototypeOf(obj);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_117() {
    const obj = Object.create(Object.prototype);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_118() {
    const obj = JSON.parse('{"x":1}');
    const proto = Reflect.getPrototypeOf(obj);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_119() {
    const parent = { x: 1 };
    const child = Object.create(parent);
    Object.assign(child, { y: 2 });
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent;
}


export function test_getPrototypeOf_120() {
    const parent = { x: 1 };
    const base = Object.create(parent);
    const merged = { ...base };
    const proto = Reflect.getPrototypeOf(merged);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_124() {
    if (typeof WeakRef === 'undefined') {
        return true;
    }
    const target = {};
    const wr = new WeakRef(target);
    const proto = Reflect.getPrototypeOf(target);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_125() {
    if (typeof FinalizationRegistry === 'undefined') {
        return true;
    }
    const reg = new FinalizationRegistry(() => {
    });
    const obj = {};
    reg.register(obj, 'meta');
    const proto = Reflect.getPrototypeOf(obj);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_126() {
    const obj = {};
    const p = Promise.resolve(obj);
    const proto = Reflect.getPrototypeOf(p);
    return proto === Promise.prototype;
}


export function test_getPrototypeOf_127() {
    const p = Promise.reject(new Error());
    const proto = Reflect.getPrototypeOf(p);
    return proto === Promise.prototype;
}


export function test_getPrototypeOf_128() {
    const p = (async () => {
    })();
    const proto = Reflect.getPrototypeOf(p);
    return proto === Object.getPrototypeOf(Promise.resolve());
}


export function test_getPrototypeOf_129() {

    function* gen() {
        yield 1;
    }

    const g = gen();
    const proto = Reflect.getPrototypeOf(g);
    return proto !== undefined && proto.constructor.name === 'Generator';
}


export function test_getPrototypeOf_130() {
    if (typeof document === 'undefined') {
        return true;
    }
    const el = document.createElement('div');
    const proto = Reflect.getPrototypeOf(el);
    return proto !== undefined && proto.constructor.name === 'HTMLDivElement';
}


export function test_getPrototypeOf_131() {
    if (typeof document === 'undefined') {
        return true;
    }
    const el = document.createElement('span');
    const proto = Reflect.getPrototypeOf(el);
    return proto.isPrototypeOf(el);
}


export function test_getPrototypeOf_132() {
    if (typeof document === 'undefined') {
        return true;
    }
    const list = document.childNodes || document.querySelectorAll('*');
    const proto = Reflect.getPrototypeOf(list);
    return proto !== undefined;
}


export function test_getPrototypeOf_133() {
    if (typeof document === 'undefined') {
        return true;
    }
    const coll = document.forms || document.images;
    if (!coll) {
        return true;
    }
    const proto = Reflect.getPrototypeOf(coll);
    return proto !== undefined;
}


export function test_getPrototypeOf_134() {

    const mod = { __esModule: true, default: 1 };
    const proto = Reflect.getPrototypeOf(mod);
    return proto === Object.prototype || proto === null;
}


export function test_getPrototypeOf_135() {
    const m = { a: 1, __esModule: true };
    const proto = Reflect.getPrototypeOf(m);
    return proto === Object.prototype || proto === null;
}


export function test_getPrototypeOf_136() {
    const parent = { x: 1 };
    Object.freeze(parent);
    const child = Object.create(parent);
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent;
}


export function test_getPrototypeOf_137() {
    const parent = { y: 2 };
    Object.seal(parent);
    const child = Object.create(parent);
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent;
}


export function test_getPrototypeOf_138() {
    const parent = { z: 3 };
    Object.preventExtensions(parent);
    const child = Object.create(parent);
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent;
}


export function test_getPrototypeOf_139() {
    const parent = { x: 1 };
    const child = Object.create(parent);
    const names = Object.getOwnPropertyNames(parent);
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent && names.includes('x');
}


export function test_getPrototypeOf_140() {
    const parent = {};
    Object.defineProperty(parent, 'hidden', {
        value: 1,
        enumerable: false
    });
    const child = Object.create(parent);
    const keys = Object.keys(child);
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent && !keys.includes('hidden');
}


export function test_getPrototypeOf_141() {
    const parent = {};
    Object.defineProperty(parent, 'hidden', {
        value: 1,
        enumerable: false
    });
    const child = Object.create(parent);
    const proto = Reflect.getPrototypeOf(child);
    return proto === parent && 'hidden' in child;
}


export function test_getPrototypeOf_142() {
    const target = {};
    const handler = {};
    const proxy = new Proxy(target, handler);
    const obj = Object.create(proxy);
    const proto = Reflect.getPrototypeOf(obj);
    return proto === proxy;
}


export function test_getPrototypeOf_143() {
    const target = {};
    const handler = {};
    const proxy = new Proxy(target, handler);
    const newProto = {};
    Object.setPrototypeOf(proxy, newProto);
    const proto = Reflect.getPrototypeOf(proxy);
    return proto === newProto;
}


export function test_getPrototypeOf_144() {
    class C {
    }

    const c = new C();
    const proto = Reflect.getPrototypeOf(c);
    return proto === C.prototype && c instanceof C;
}


export function test_getPrototypeOf_145() {
    const target = {};
    const handler = {
        getPrototypeOf() {
            return Array.prototype;
        }
    };
    const proxy1 = new Proxy(target, handler);
    const proxy2 = new Proxy(proxy1, {});
    try {
        Reflect.getPrototypeOf(proxy2);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_getPrototypeOf_146() {
    const a = {};
    const b = Object.create(a);
    const c = Object.create(b);
    const proto = Reflect.getPrototypeOf(c);
    return proto === b;
}


export function test_getPrototypeOf_147() {
    let obj = {};
    for (let i = 0; i < 100; i++) {
        obj = Object.create(obj);
    }
    const proto = Reflect.getPrototypeOf(obj);
    return proto !== null;
}


export function test_getPrototypeOf_148() {
    const proto = Reflect.getPrototypeOf(globalThis);
    return proto === Object.prototype || proto === null;
}


export function test_getPrototypeOf_149() {
    const proto = Reflect.getPrototypeOf(Math);
    return proto === Object.prototype;
}


export function test_getPrototypeOf_150() {
    const instances = [
        new Object(),
        new Array(),
        new Date(),
        /regex/,
        new Error(),
        Promise.resolve(),
        new Map(),
        new Set(),
        new ArrayBuffer(8),
        new Int8Array(),
        Object(Symbol('s')),
        new Boolean(true),
        new Number(1),
        new String("s")
    ];
    return instances.every(inst =>
    Reflect.getPrototypeOf(inst) !== undefined
    );
}
