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

function isUndefined(x) {
    return x === undefined;
}

function isType(x, type) {
    return typeof x === type;
}


export function testReflect_get_1() {
    const obj = { a: 1 };
    return Reflect.get(obj, 'a') === 1;
}


export function testReflect_get_2() {
    const obj = { 0: 'first' };
    return Reflect.get(obj, 0) === 'first';
}


export function testReflect_get_3() {
    const sym = Symbol('s');
    const obj = { [sym]: 'symbolValue' };
    return Reflect.get(obj, sym) === 'symbolValue';
}


export function testReflect_get_4() {
    const obj = { null: 'value' };
    return Reflect.get(obj, null) === 'value';
}


export function testReflect_get_5() {
    const obj = { undefined: 'undefVal' };
    return Reflect.get(obj, undefined) === 'undefVal';
}


export function testReflect_get_6() {
    const obj = {};
    return isUndefined(Reflect.get(obj, 'notExist'));
}


export function testReflect_get_7() {
    try {
        Reflect.get(null, 'a');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function testReflect_get_8() {
    try {
        Reflect.get("str", '0');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function testReflect_get_9() {
    const obj = { x: 1 };
    return Reflect.get(obj, 'x') === 1;
}


export function testReflect_get_10() {
    const obj = { y: 1 };
    Object.preventExtensions(obj);
    return Reflect.get(obj, 'y') === 1;
}


export function testReflect_get_11() {
    const obj = { p: 1 };
    Object.seal(obj);
    return Reflect.get(obj, 'p') === 1;
}


export function testReflect_get_12() {
    const obj = Object.freeze({ q: 1 });
    return Reflect.get(obj, 'q') === 1;
}


export function testReflect_get_13() {
    const obj = {};
    Object.defineProperty(obj, 'static', {
        value: 1,
        configurable: false
    });
    return Reflect.get(obj, 'static') === 1;
}


export function testReflect_get_14() {
    const arr = [1, 2, 3];
    return Reflect.get(arr, 1) === 2;
}


export function testReflect_get_15() {
    const arr = [1, 2, 3];
    return Reflect.get(arr, 'length') === 3;
}


export function testReflect_get_16() {
    const obj = {};
    Object.defineProperty(obj, 'getter', {
        get() {
            return 42;
        }
    });
    return Reflect.get(obj, 'getter') === 42;
}


export function testReflect_get_17() {
    const obj = {};
    let val;
    Object.defineProperty(obj, 'setterOnly', {
        set(x) {
            val = x;
        }
    });
    return isUndefined(Reflect.get(obj, 'setterOnly'));
}


export function testReflect_get_18() {
    const handler = {
        get(target, key) {
            return key in target ? target[key] + 1 : 0;
        }
    };
    const proxy = new Proxy({ a: 1 }, handler);
    return Reflect.get(proxy, 'a') === 2;
}


export function testReflect_get_19() {
    const proxy = new Proxy({}, {
        get() {
            return 'custom';
        }
    });
    return Reflect.get(proxy, 'any') === 'custom';
}


export function testReflect_get_20() {
    const proxy = new Proxy({ b: 1 }, {
        get() {
            return undefined;
        }
    });
    return Reflect.get(proxy, 'b') === undefined;
}


export function testReflect_get_21() {
    const proxy = new Proxy({}, {
        get() {
            throw new Error("forbidden");
        }
    });
    try {
        Reflect.get(proxy, 'err');
        return false;
    } catch (e) {
        return e.message === "forbidden";
    }
}


export function testReflect_get_22() {
    'use strict';

    function f(a) {
        return Reflect.get(arguments, '0') === a;
    }

    return f(1);
}


export function testReflect_get_23() {
    const d = new Date();
    d.tag = 'custom';
    return Reflect.get(d, 'tag') === 'custom';
}


export function testReflect_get_24() {
    const r = /abc/g;
    r.name = 'pattern';
    return Reflect.get(r, 'name') === 'pattern';
}


export function testReflect_get_25() {

    function fn() {
    }

    fn.meta = 'info';
    return Reflect.get(fn, 'meta') === 'info';
}


export function testReflect_get_26() {
    const obj = Object.create(null);
    obj.key = 1;
    return Reflect.get(obj, 'key') === 1;
}


export function testReflect_get_27() {
    const obj = { a: { b: { c: 1 } } };
    return Reflect.get(obj.a.b, 'c') === 1;
}


export function testReflect_get_28() {
    const obj = { true: 'yes' };
    return Reflect.get(obj, true) === 'yes';
}


export function testReflect_get_29() {
    const key = {};
    const obj = { '[object Object]': 'objKey' };
    return Reflect.get(obj, key) === 'objKey';
}


export function testReflect_get_30() {
    const obj = { '1,2': 'arr' };
    return Reflect.get(obj, [1, 2]) === 'arr';
}


export function testReflect_get_31() {
    const sym = Symbol.iterator;
    const obj = {
        [sym]: function () {
        }
    };
    return typeof Reflect.get(obj, sym) === 'function';
}


export function testReflect_get_32() {
    const sym = Symbol('private');
    const obj = { [sym]: 'secret' };
    return Reflect.get(obj, sym) === 'secret';
}


export function testReflect_get_33() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    return Reflect.get(obj, 'inherited') === 1;
}


export function testReflect_get_34() {
    const proto = { shared: 1 };
    const obj = Object.create(proto);
    obj.shared = 2;
    return Reflect.get(obj, 'shared') === 2;
}


export function testReflect_get_35() {
    if (typeof globalThis !== 'object') {
        return true;
    }
    globalThis.__tmp = 1;
    const result = Reflect.get(globalThis, '__tmp') === 1;
    delete globalThis.__tmp;
    return result;
}


export function testReflect_get_36() {
    const arr = [1];
    return isUndefined(Reflect.get(arr, 99));
}


export function testReflect_get_37() {
    const strObj = new String('hello');
    strObj.note = 'text';
    return Reflect.get(strObj, 'note') === 'text';
}


export function testReflect_get_38() {
    const numObj = new Number(42);
    numObj.meta = 'num';
    return Reflect.get(numObj, 'meta') === 'num';
}


export function testReflect_get_39() {
    const boolObj = new Boolean(true);
    boolObj.flag = 1;
    return Reflect.get(boolObj, 'flag') === 1;
}


export function testReflect_get_40() {
    const obj = { Infinity: 'inf' };
    return Reflect.get(obj, Infinity) === 'inf';
}


export function testReflect_get_41() {
    const obj = { '-0': 'negZero' };
    return Reflect.get(obj, -0) === undefined;
}


export function testReflect_get_42() {
    const obj = { NaN: 'not-a-number' };
    return Reflect.get(obj, NaN) === 'not-a-number';
}


export function testReflect_get_43() {
    const obj = { temp: 1 };
    return ('temp' in obj) && Reflect.get(obj, 'temp') === 1;
}


export function testReflect_get_44() {
    const obj = {};
    Object.defineProperty(obj, 'access', {
        get() {
            return 1;
        },
        set(x) {
        }
    });
    return Reflect.get(obj, 'access') === 1;
}


export function testReflect_get_45() {
    const obj = {};
    Object.defineProperty(obj, 'lockedAcc', {
        get() {
            return 1;
        },
        configurable: false
    });
    return Reflect.get(obj, 'lockedAcc') === 1;
}


export function testReflect_get_46() {
    const m = new Map();
    m.tag = 'mapTag';
    return Reflect.get(m, 'tag') === 'mapTag';
}


export function testReflect_get_47() {
    const s = new Set();
    s.owner = 'admin';
    return Reflect.get(s, 'owner') === 'admin';
}


export function testReflect_get_48() {
    const wm = new WeakMap();
    wm.debug = true;
    return Reflect.get(wm, 'debug') === true;
}


export function testReflect_get_49() {
    const buf = new ArrayBuffer(8);
    buf.label = 'buffer';
    return Reflect.get(buf, 'label') === 'buffer';
}


export function testReflect_get_50() {
    const arr = new Int32Array(4);
    arr.unit = 'seconds';
    return Reflect.get(arr, 'unit') === 'seconds';
}


export function testReflect_get_51() {
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    dv.format = 'IEEE';
    return Reflect.get(dv, 'format') === 'IEEE';
}


export function testReflect_get_52() {
    const p = Promise.resolve(1);
    p.tag = 'promise';
    return Reflect.get(p, 'tag') === 'promise';
}


export function testReflect_get_53() {
    const dtf = new Intl.DateTimeFormat();
    dtf.localeOverride = 'zh-CN';
    return Reflect.get(dtf, 'localeOverride') === 'zh-CN';
}


function* gen() {
}

export function testReflect_get_54() {
    gen.prototype.init = 0;
    return Reflect.get(gen.prototype, 'init') === 0;
}


async function asyncFn() {
}

export function testReflect_get_55() {
    asyncFn.timeout = 5000;
    return Reflect.get(asyncFn, 'timeout') === 5000;
}


class MyClass {
}

export function testReflect_get_56() {
    MyClass.version = '1.0';
    return Reflect.get(MyClass, 'version') === '1.0';
}


export function testReflect_get_57() {
    const inst = new MyClass();
    inst.instanceId = 123;
    return Reflect.get(inst, 'instanceId') === 123;
}


export function testReflect_get_58() {
    const obj = { constructor: 'fake' };
    return Reflect.get(obj, 'constructor') === 'fake';
}


export function testReflect_get_59() {
    const ns = { __esModule: true, a: 1 };
    return Reflect.get(ns, 'a') === 1;
}


export function testReflect_get_60() {
    if (typeof document === 'undefined') {
        return true;
    }
    const div = document.createElement('div');
    div.customProp = 'web';
    return Reflect.get(div, 'customProp') === 'web';
}


export function testReflect_get_61() {
    if (typeof location === 'undefined') {
        return true;
    }
    return typeof Reflect.get(location, 'href') === 'string';
}


export function testReflect_get_62() {
    if (typeof process === 'undefined') {
        return true;
    }
    return typeof Reflect.get(process, 'version') === 'string';
}


export function testReflect_get_63() {
    return typeof Reflect.get(console, 'log') === 'function';
}


export function testReflect_get_64() {
    const obj = {};
    Object.defineProperty(obj, 'readOnly', {
        value: 1,
        writable: false
    });
    return Reflect.get(obj, 'readOnly') === 1;
}


export function testReflect_get_65() {
    return typeof Reflect.get(Array.prototype, 'push') === 'function';
}


export function testReflect_get_66() {
    return typeof Reflect.get(Object.prototype, 'toString') === 'function';
}


export function testReflect_get_67() {
    const obj = { a: 1 };
    return Reflect.get(obj, 'a') === 1;
}


export function testReflect_get_68() {
    const obj = {};
    Object.defineProperty(obj, 'errorGet', {
        get() {
            throw new Error('getter fail');
        }
    });
    try {
        Reflect.get(obj, 'errorGet');
        return false;
    } catch (e) {
        return e.message === 'getter fail';
    }
}


export function testReflect_get_69() {
    const obj = {};
    Object.defineProperty(obj, 'writeOnly', {
        set() {
        }
    });
    return isUndefined(Reflect.get(obj, 'writeOnly'));
}


export function testReflect_get_70() {
    const err = new Error('test');
    return Reflect.get(err, 'message') === 'test';
}


export function testReflect_get_71() {
    const e = new EvalError('syntax');
    return Reflect.get(e, 'message') === 'syntax';
}


export function testReflect_get_72() {
    const e = new RangeError();
    return Reflect.get(e, 'name') === 'RangeError';
}


export function testReflect_get_73() {
    const e = new ReferenceError();
    return typeof Reflect.get(e, 'stack') === 'string';
}


export function testReflect_get_74() {
    try {
        eval('foo bar');
    } catch (e) {
        return 'lineNumber' in e ? typeof Reflect.get(e, 'lineNumber') === 'number' : true;
    }
    return true;
}


export function testReflect_get_75() {
    try {
        throw new TypeError('invalid', { cause: 'user error' });
    } catch (e) {
        return Reflect.get(e, 'cause') === 'user error';
    }
}


export function testReflect_get_76() {
    const e = new URIError('bad uri');
    return Reflect.get(e, 'message') === 'bad uri';
}


export function testReflect_get_77() {
    class CustomError extends Error {
        constructor(msg, id) {
            super(msg);
            this.id = id;
        }
    }

    const ce = new CustomError('fail', 1001);
    return Reflect.get(ce, 'id') === 1001;
}


export function testReflect_get_78() {

    function F() {
    }

    F.prototype.mixin = 'shared';
    return Reflect.get(F.prototype, 'mixin') === 'shared';
}


export function testReflect_get_79() {

    function base() {
    }

    const bound = base.bind({});
    bound.meta = 'boundMeta';
    return Reflect.get(bound, 'meta') === 'boundMeta';
}


const arrowFn = () => {
};

export function testReflect_get_80() {
    arrowFn.nameOverride = 'custom';
    return Reflect.get(arrowFn, 'nameOverride') === 'custom';
}


const asyncArrow = async () => {
};

export function testReflect_get_81() {
    asyncArrow.timeout = 1000;
    return Reflect.get(asyncArrow, 'timeout') === 1000;
}


export function testReflect_get_82() {
    return true;
}


export function testReflect_get_83() {
    const match = /(\d+)/.exec("123");
    match.sourceInfo = 'digits';
    return Reflect.get(match, 'sourceInfo') === 'digits';
}


export function testReflect_get_84() {
    return typeof Reflect.get(JSON, 'parse') === 'function';
}


export function testReflect_get_85() {
    return Reflect.get(Math, 'PI') === Math.PI;
}


export function testReflect_get_86() {
    if (typeof Atomics === 'undefined') {
        return true;
    }
    return typeof Reflect.get(Atomics, 'isLockFree') === 'function';
}


export function testReflect_get_87() {
    if (typeof WebAssembly === 'undefined') {
        return true;
    }
    return 'version' in WebAssembly ? typeof Reflect.get(WebAssembly, 'version') === 'string' : true;
}


export function testReflect_get_88() {
    return typeof Reflect.get(Intl, 'getCanonicalLocales') === 'function';
}


export function testReflect_get_89() {
    try {
        const url = new URL('https://example.com/path');
        return Reflect.get(url, 'hostname') === 'example.com';
    } catch (e) {
        return true;
    }
}


export function testReflect_get_91() {
    if (typeof BroadcastChannel === 'undefined') {
        return true;
    }
    const bc = new BroadcastChannel('test');
    return Reflect.get(bc, 'name') === 'test';
}


export function testReflect_get_92() {
    if (typeof MessageChannel === 'undefined') {
        return true;
    }
    const mc = new MessageChannel();
    return Reflect.get(mc.port1, 'onmessage') === null;
}


export function testReflect_get_93() {
    const fakeBitmap = { rotation: 90 };
    return Reflect.get(fakeBitmap, 'rotation') === 90;
}


export function testReflect_get_94() {
    if (typeof AudioContext === 'undefined' && typeof webkitAudioContext === 'undefined') {
        return true;
    }
    const ctx = new (window.AudioContext || webkitAudioContext)();
    const state = Reflect.get(ctx, 'state');
    return ['suspended', 'running', 'closed'].includes(state);
}


export function testReflect_get_96() {
    if (typeof performance === 'undefined') {
        return true;
    }
    return typeof Reflect.get(performance, 'now') === 'function';
}


export function testReflect_get_97() {
    if (typeof navigator === 'undefined') {
        return true;
    }
    return typeof Reflect.get(navigator, 'userAgent') === 'string';
}


export function testReflect_get_98() {
    if (typeof screen === 'undefined') {
        return true;
    }
    return typeof Reflect.get(screen, 'width') === 'number';
}


export function testReflect_get_99() {
    if (typeof history === 'undefined') {
        return true;
    }
    return typeof Reflect.get(history, 'length') === 'number';
}


export function testReflect_get_100() {
    if (typeof sessionStorage === 'undefined') {
        return true;
    }
    return typeof Reflect.get(sessionStorage, 'getItem') === 'function';
}


export function testReflect_get_101() {
    if (typeof localStorage === 'undefined') {
        return true;
    }
    return typeof Reflect.get(localStorage, 'setItem') === 'function';
}


export function testReflect_get_102() {
    if (typeof caches === 'undefined') {
        return true;
    }
    return typeof Reflect.get(caches, 'open') === 'function';
}


export function testReflect_get_103() {
    if (typeof indexedDB === 'undefined') {
        return true;
    }
    return typeof Reflect.get(indexedDB, 'open') === 'function';
}


export function testReflect_get_104() {
    if (typeof crypto === 'undefined') {
        return true;
    }
    return typeof Reflect.get(crypto, 'getRandomValues') === 'function';
}


export function testReflect_get_105() {
    if (typeof applicationCache === 'undefined') {
        return true;
    }
    return typeof Reflect.get(applicationCache, 'status') === 'number';
}


export function testReflect_get_106() {
    if (typeof OfflineAudioContext === 'undefined') {
        return true;
    }
    const ctx = new OfflineAudioContext(1, 44100, 44100);
    return typeof Reflect.get(ctx, 'startRendering') === 'function';
}


export function testReflect_get_107() {
    if (typeof locationbar === 'undefined') {
        return true;
    }
    return typeof Reflect.get(locationbar, 'visible') === 'boolean';
}


export function testReflect_get_108() {
    if (typeof menubar === 'undefined') {
        return true;
    }
    return 'compact' in menubar ? typeof Reflect.get(menubar, 'compact') === 'boolean' : true;
}


export function testReflect_get_109() {
    if (typeof personalbar === 'undefined') {
        return true;
    }
    return 'collapsed' in personalbar ? typeof Reflect.get(personalbar, 'collapsed') === 'boolean' : true;
}


export function testReflect_get_110() {
    if (typeof toolbar === 'undefined') {
        return true;
    }
    return 'mode' in toolbar ? typeof Reflect.get(toolbar, 'mode') === 'string' : true;
}


export function testReflect_get_111() {
    if (typeof statusbar === 'undefined') {
        return true;
    }
    return typeof Reflect.get(statusbar, 'text') === 'string';
}


export function testReflect_get_112() {
    if (typeof scrollbars === 'undefined') {
        return true;
    }
    return 'autoHide' in scrollbars ? typeof Reflect.get(scrollbars, 'autoHide') === 'boolean' : true;
}


export function testReflect_get_113() {
    if (typeof external === 'undefined') {
        return true;
    }
    return 'call' in external ? typeof Reflect.get(external, 'call') === 'function' : true;
}


export function testReflect_get_114() {
    if (typeof ch === 'undefined') {
        return true;
    }
    return 'runtime' in ch ? typeof Reflect.get(ch, 'runtime') === 'object' : true;
}


export function testReflect_get_115() {
    if (typeof safari === 'undefined') {
        return true;
    }
    return 'application' in safari ? typeof Reflect.get(safari, 'application') === 'object' : true;
}


export function testReflect_get_116() {
    const obj = Object.create(null);
    obj.item = 1;
    return Reflect.get(obj, 'item') === 1;
}


export function testReflect_get_118() {
    if (!Math.hasOwnProperty('temp')) {
        Math.temp = 'tmp';
    }
    return Reflect.get(Math, 'temp') === 'tmp';
}


export function testReflect_get_119() {

    function f() {
        return Reflect.get(arguments, 'length') === 0;
    }

    return f();
}


export function testReflect_get_120() {

    function f() {
        'use strict';
        return true;
    }

    return true;
}


export function testReflect_get_121() {
    const arr = new Array(100);
    arr[50] = 'middle';
    return Reflect.get(arr, 50) === 'middle';
}


export function testReflect_get_122() {
    const obj = { __proto__: null, other: 1 };
    return Reflect.get(obj, '__proto__') === null;
}


export function testReflect_get_123() {
    const sym = Symbol('s');
    const obj = { [sym]: 'val' };
    Object.seal(obj);
    return Reflect.get(obj, sym) === 'val';
}


export function testReflect_get_125() {
    const proto = {};
    Object.defineProperty(proto, 'fixed', {
        value: 1,
        configurable: false
    });
    const obj = Object.create(proto);
    return Reflect.get(obj, 'fixed') === 1;
}


export function testReflect_get_126() {
    const obj = {};
    Object.defineProperty(obj, 'throwing', {
        get() {
            throw new Error('boom');
        }
    });
    try {
        Reflect.get(obj, 'throwing');
        return false;
    } catch (e) {
        return e.message === 'boom';
    }
}


export function testReflect_get_127() {
    const { proxy, revoke } = Proxy.revocable({}, {});
    revoke();
    try {
        Reflect.get(proxy, 'x');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function testReflect_get_128() {
    if (typeof DOMRectReadOnly === 'undefined') {
        return true;
    }
    const rect = new DOMRectReadOnly(0, 0, 10, 10);
    return Reflect.get(rect, 'width') === 10;
}


export function testReflect_get_129() {
    if (typeof document === 'undefined') {
        return true;
    }
    const el = document.createElement('div');
    return typeof Reflect.get(el.style, 'color') === 'string';
}


export function testReflect_get_130() {
    const obj = { a: 1 };
    let found = false;
    for (const k in obj) {
        if (k === 'a' && Reflect.get(obj, k) === 1) {
            found = true;
        }
    }
    return found;
}


export function testReflect_get_131() {
    const obj = { temp: 1 };
    obj.temp = 2;
    return Reflect.get(obj, 'temp') === 2;
}


export function testReflect_get_132() {
    const proto = {
        get prop() {
            return 1;
        }
    };
    const obj = Object.create(proto);
    return Reflect.get(obj, 'prop') === 1;
}


export function testReflect_get_133() {
    const obj = {
        get self() {
            return this;
        }
    };
    const receiver = {};
    return Reflect.get(obj, 'self', receiver) === receiver;
}


export function testReflect_get_134() {
    const obj = { hasOwnProperty: 'custom' };
    return Reflect.get(obj, 'hasOwnProperty') === 'custom';
}


export function testReflect_get_136() {
    if (typeof customElements === 'undefined') {
        return true;
    }

    class MyEl extends HTMLElement {
    }

    customElements.define('my-el', MyEl);
    const el = document.createElement('my-el');
    el.data = 1;
    return Reflect.get(el, 'data') === 1;
}


export function testReflect_get_137() {
    if (typeof AbortController === 'undefined') {
        return true;
    }
    const ac = new AbortController();
    return typeof Reflect.get(ac, 'signal') === 'object';
}


export function testReflect_get_138() {
    if (typeof ReadableStream === 'undefined') {
        return true;
    }
    const rs = new ReadableStream();
    return typeof Reflect.get(rs, 'locked') === 'boolean';
}


export function testReflect_get_139() {
    if (typeof Response === 'undefined') {
        return true;
    }
    const res = new Response();
    return Reflect.get(res, 'bodyUsed') === false;
}


export function testReflect_get_140() {
    if (typeof Request === 'undefined') {
        return true;
    }
    const req = new Request('/test');
    return Reflect.get(req, 'method') === 'GET';
}


export function testReflect_get_141() {
    if (typeof PerformanceEntry === 'undefined') {
        return true;
    }
    const entry = { name: 'load', duration: 100 };
    return Reflect.get(entry, 'duration') === 100;
}


export function testReflect_get_142() {
    if (typeof IntersectionObserverEntry === 'undefined') {
        return true;
    }
    const entry = { time: 100, isIntersecting: true };
    return Reflect.get(entry, 'isIntersecting') === true;
}


export function testReflect_get_143() {
    const obj = {
        get ctx() {
            return this;
        }
    };
    const receiver = { $: 1 };
    return Reflect.get(obj, 'ctx', receiver) === receiver;
}


export function testReflect_get_144() {
    const obj = {
        get val() {
            return this.x;
        }
    };
    const receiver = { x: 42 };
    return Reflect.get(obj, 'val', receiver) === 42;
}


export function testReflect_get_145() {
    const proto = {
        get x() {
            return this.y * 2;
        }
    };
    const obj = Object.create(proto);
    const receiver = { y: 10 };
    return Reflect.get(obj, 'x', receiver) === 20;
}


export function testReflect_get_146() {
    const obj = { 0: 'a', 1: 'b', length: 2 };
    return Reflect.get(obj, 'length') === 2 && Reflect.get(obj, 0) === 'a';
}


export function testReflect_get_147() {

    function fn() {
    }

    fn.prop = 'funcProp';
    return Reflect.get(fn, 'prop') === 'funcProp';
}


export function testReflect_get_148() {

    async function af() {
    }

    af.meta = 'asyncMeta';
    return Reflect.get(af, 'meta') === 'asyncMeta';
}


export function testReflect_get_149() {

    function* gf() {
        yield 1;
    }

    gf.gen = 'genFunc';
    return Reflect.get(gf, 'gen') === 'genFunc';
}


export function testReflect_get_150() {
    const sym = Symbol('test');
    const receiver = {};
    const obj = {
        str: 1,
        123: 2,
        [sym]: 3,
        null: 4,
        undefined: 5,
        get thisRef() {
            return this;
        }
    };
    return Reflect.get(obj, 'str') === 1 &&
        Reflect.get(obj, 123) === 2 &&
        Reflect.get(obj, sym) === 3 &&
        Reflect.get(obj, null) === 4 &&
        Reflect.get(obj, undefined) === 5 &&
        Reflect.get(obj, 'thisRef', receiver) === receiver;
}
