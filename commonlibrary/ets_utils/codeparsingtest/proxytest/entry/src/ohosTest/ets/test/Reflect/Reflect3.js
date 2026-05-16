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

function isTrue(result) {
    return result === true;
}

function isFalse(result) {
    return result === false;
}


export function test_defineProperty_1() {
    const obj = {};
    return Reflect.defineProperty(obj, 'a', { value: 1 });
}


export function test_defineProperty_2() {
    const obj = {};
    return Reflect.defineProperty(obj, 1, { value: 'one' });
}


export function test_defineProperty_3() {
    const obj = {};
    const sym = Symbol('test');
    return Reflect.defineProperty(obj, sym, { value: 'symbolValue' });
}


export function test_defineProperty_4() {
    const obj = {};
    return Reflect.defineProperty(obj, null, { value: 'nullKey' });
}


export function test_defineProperty_5() {
    const obj = {};
    return Reflect.defineProperty(obj, undefined, { value: 'undef' });
}


export function test_defineProperty_6() {
    try {
        Reflect.defineProperty(null, 'a', { value: 1 });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_defineProperty_7() {
    try {
        Reflect.defineProperty("str", 'a', { value: 1 });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_defineProperty_8() {
    const obj = { x: 1 };
    return Reflect.defineProperty(obj, 'y', {
        value: 2,
        writable: true,
        enumerable: true,
        configurable: true
    });
}


export function test_defineProperty_9() {
    const obj = {};
    Object.preventExtensions(obj);
    return !Reflect.defineProperty(obj, 'newProp', { value: 'fail' });
}


export function test_defineProperty_10() {
    const obj = { existing: 1 };
    Object.preventExtensions(obj);
    return Reflect.defineProperty(obj, 'existing', { value: 2 });
}


export function test_defineProperty_11() {
    const obj = { p: 1 };
    Object.seal(obj);
    return Reflect.defineProperty(obj, 'p', { value: 2 });
}


export function test_defineProperty_12() {
    const obj = { q: 1 };
    Object.seal(obj);
    return !Reflect.defineProperty(obj, 'q', { configurable: true });
}


export function test_defineProperty_13() {
    const obj = Object.freeze({ r: 1 });
    return !Reflect.defineProperty(obj, 'r', { writable: true });
}


export function test_defineProperty_14() {
    const obj = Object.freeze({ s: 1 });
    return !Reflect.defineProperty(obj, 's', { value: 2 });
}


export function test_defineProperty_15() {
    const obj = {};
    return Reflect.defineProperty(obj, 'getter', {
        get() {
            return 42;
        },
        enumerable: true,
        configurable: true
    });
}


export function test_defineProperty_16() {
    const obj = {};
    let val;
    return Reflect.defineProperty(obj, 'setter', {
        set(x) {
            val = x;
        },
        enumerable: true,
        configurable: true
    });
}


export function test_defineProperty_19() {
    const obj = {};
    return Reflect.defineProperty(obj, 'emptyDesc', {});
}


export function test_defineProperty_20() {
    const obj = {};
    Reflect.defineProperty(obj, 'hidden', {
        value: 'noEnum',
        enumerable: false
    });
    return !Object.keys(obj).includes('hidden');
}


export function test_defineProperty_21() {
    const obj = {};
    Reflect.defineProperty(obj, 'locked', {
        value: 1,
        configurable: false
    });
    return !Reflect.defineProperty(obj, 'locked', { value: 2 });
}


export function test_defineProperty_22() {
    const obj = {};
    Reflect.defineProperty(obj, 'flex', {
        value: 1,
        configurable: true
    });
    return Reflect.defineProperty(obj, 'flex', { value: 2 });
}


export function test_defineProperty_23() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    return Reflect.defineProperty(obj, 'inherited', { value: 2 });
}


export function test_defineProperty_24() {
    const proto = {};
    return Reflect.defineProperty(proto, 'protoProp', { value: 'p' });
}


export function test_defineProperty_25() {
    const handler = {
        defineProperty(target, key, descriptor) {
            return Reflect.defineProperty(target, key, descriptor);
        }
    };
    const proxy = new Proxy({}, handler);
    return Reflect.defineProperty(proxy, 'viaProxy', { value: 1 });
}


export function test_defineProperty_26() {
    const handler = {
        defineProperty() {
            return false;
        }
    };
    const proxy = new Proxy({}, handler);
    return !Reflect.defineProperty(proxy, 'blocked', { value: 1 });
}


export function test_defineProperty_27() {
    const target = Object.seal({});
    const proxy = new Proxy(target, {});
    return !Reflect.defineProperty(proxy, 'newKey', { value: 1 });
}


export function test_defineProperty_28() {
    const obj = {};
    return Reflect.defineProperty(obj, true, { value: 'bool' });
}


export function test_defineProperty_29() {
    const obj = {};
    const key = {};
    return Reflect.defineProperty(obj, key, { value: 'objKey' });
}


export function test_defineProperty_30() {
    const obj = {};
    return Reflect.defineProperty(obj, [1, 2], { value: 'arr' });
}


export function test_defineProperty_31() {
    const obj = {};
    return Reflect.defineProperty(obj, Symbol.iterator, {
        value: function () {
        }
    });
}


export function test_defineProperty_32() {
    const sym = Symbol();
    const obj = {};
    return Reflect.defineProperty(obj, sym, { value: 'private' });
}


export function test_defineProperty_33() {
    const sym = Symbol();
    const obj = {};
    Reflect.defineProperty(obj, sym, { value: 1, configurable: true });
    return Reflect.defineProperty(obj, sym, { value: 2 });
}


export function test_defineProperty_34() {
    const sym = Symbol();
    const obj = {};
    Reflect.defineProperty(obj, sym, { value: 1, configurable: false });
    return !Reflect.defineProperty(obj, sym, { value: 2 });
}


export function test_defineProperty_35() {
    const sym = Symbol();
    const obj = { a: 1 };
    Object.seal(obj);
    return Reflect.defineProperty(obj, sym, { value: 'sealedSym' });
}


export function test_defineProperty_36() {
    const sym = Symbol();
    const obj = Object.freeze({});
    return !Reflect.defineProperty(obj, sym, { value: 'fail' });
}


export function test_defineProperty_37() {
    const sym = Symbol();
    const obj = {};
    Reflect.defineProperty(obj, sym, { value: 'symVal', enumerable: true });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.includes(sym) && obj[symbols[0]] === 'symVal';
}


export function test_defineProperty_38() {
    const sym = Symbol();
    const obj = {};
    return Reflect.defineProperty(obj, sym, {
        get() {
            return 'dynamic';
        },
        enumerable: true,
        configurable: true
    });
}


export function test_defineProperty_39() {
    const sym = Symbol();
    const obj = {};
    return Reflect.defineProperty(obj, 'strKey', { value: 1 }) &&
    Reflect.defineProperty(obj, sym, { value: 2 });
}


export function test_defineProperty_40() {
    const obj = {};
    Reflect.defineProperty(obj, 'lockWrite', { value: 1, writable: false });
    return !Reflect.defineProperty(obj, 'lockWrite', { writable: true });
}


export function test_defineProperty_41() {
    const obj = {};
    Reflect.defineProperty(obj, 'enumTest', { value: 1, enumerable: false });
    return !Object.keys(obj).includes('enumTest');
}


export function test_defineProperty_42() {
    const obj = {};
    Reflect.defineProperty(obj, 'noDelete', { value: 1, configurable: false });
    return !Reflect.defineProperty(obj, 'noDelete', { configurable: true });
}


export function test_defineProperty_43() {
    const arr = [1, 2, 3];
    return Reflect.defineProperty(arr, 1, { value: 99 });
}


export function test_defineProperty_44() {
    const arr = [1, 2, 3];
    return Reflect.defineProperty(arr, 'length', { value: 1 });
}


export function test_defineProperty_45() {
    const arr = [1];
    return Reflect.defineProperty(arr, 'length', { value: 5 });
}


export function test_defineProperty_46() {
    'use strict';

    function f(a) {
        return Reflect.defineProperty(arguments, '0', { value: 999 });
    }

    return f(1);
}


export function test_defineProperty_47() {
    const d = new Date();
    return Reflect.defineProperty(d, 'tag', { value: 'custom' });
}


export function test_defineProperty_48() {
    const r = /abc/;
    return Reflect.defineProperty(r, 'name', { value: 'pattern' });
}


export function test_defineProperty_49() {

    function fn() {
    }

    return Reflect.defineProperty(fn, 'meta', { value: 'info' });
}


export function test_defineProperty_50() {
    const obj = {};
    const proxy = new Proxy(obj, {
        defineProperty(target, key, desc) {
            return Reflect.defineProperty(target, key, desc);
        }
    });
    return Reflect.defineProperty(proxy, 'viaHandler', { value: 1 });
}


export function test_defineProperty_51() {
    const proxy = new Proxy({}, {
        defineProperty() {
            return false;
        }
    });
    return !Reflect.defineProperty(proxy, 'blocked', { value: 1 });
}


export function test_defineProperty_52() {
    const proxy = new Proxy({}, {
        defineProperty() {
            throw new Error();
        }
    });
    try {
        Reflect.defineProperty(proxy, 'err', { value: 1 });
        return false;
    } catch (e) {
        return true;
    }
}

export function test_defineProperty_52_1() {
    const proxy = new Proxy({}, {
        defineProperty() {
            throw new TypeError();
        }
    });
    return !Reflect.defineProperty(proxy, 'err', { value: 1 });
}


export function test_defineProperty_53() {
    const target = Object.seal({});
    const proxy = new Proxy(target, {});
    return !Reflect.defineProperty(proxy, 'newProp', { value: 1 });
}


export function test_defineProperty_54() {
    const target = {};
    Object.preventExtensions(target);
    const proxy = new Proxy(target, {});
    return !Reflect.defineProperty(proxy, 'x', { value: 1 });
}


export function test_defineProperty_55() {
    class Foo {
    }

    const inst = Reflect.construct(Foo, []);
    return Reflect.defineProperty(inst, 'dyn', { value: 'constructed' });
}


export function test_defineProperty_56() {
    const strObj = new String('hello');
    return Reflect.defineProperty(strObj, 'note', { value: 'text' });
}


export function test_defineProperty_57() {
    const numObj = new Number(42);
    return Reflect.defineProperty(numObj, 'meta', { value: 'numberMeta' });
}


export function test_defineProperty_58() {
    const boolObj = new Boolean(true);
    return Reflect.defineProperty(boolObj, 'flag', { value: 1 });
}


export function test_defineProperty_59() {
    const obj = Object.create(null);
    return Reflect.defineProperty(obj, 'key', { value: 1 });
}


export function test_defineProperty_60() {
    const obj = { a: { b: { c: 1 } } };
    return Reflect.defineProperty(obj.a.b, 'd', { value: 2 });
}


export function test_defineProperty_61() {
    const obj = {};
    return Reflect.defineProperty(obj, 'extra', { value: 1, extra: true });
}


export function test_defineProperty_62() {
    const obj = {};
    try {
        Reflect.defineProperty(obj, 'nullDesc', null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_defineProperty_63() {
    const obj = {};
    try {
        Reflect.defineProperty(obj, 'undefDesc', undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_defineProperty_64() {
    const obj = {};
    return Reflect.defineProperty(obj, Infinity, { value: 'inf' });
}


export function test_defineProperty_65() {
    const obj = {};
    Reflect.defineProperty(obj, -0, { value: 'negZero' });
    return 0 in obj && obj[-0] === 'negZero';
}


export function test_defineProperty_66() {
    const obj = {};
    Reflect.defineProperty(obj, NaN, { value: 'not-a-number-key' });
    return Object.getOwnPropertyNames(obj).includes('NaN');
}


export function test_defineProperty_67() {
    if (typeof globalThis !== 'object') {
        return true;
    }
    return Reflect.defineProperty(globalThis, '__testGlobal', { value: 1 });
}


export function test_defineProperty_68() {
    const obj = { temp: 1 };
    delete obj.temp;
    return Reflect.defineProperty(obj, 'temp', { value: 2 });
}


export function test_defineProperty_69() {
    const obj = {};
    Reflect.defineProperty(obj, 'step', { value: 1 });
    Object.seal(obj);
    return !Reflect.defineProperty(obj, 'step', { value: 2 });
}


export function test_defineProperty_70() {
    const obj = { x: 1 };
    Object.freeze(obj);
    return !Reflect.defineProperty(obj, 'x', { value: 2 });
}


export function test_defineProperty_71() {
    return Reflect.defineProperty(Array.prototype, 'universal', { value: 'allArrays' });
}


export function test_defineProperty_72() {
    return Reflect.defineProperty(Object.prototype, '$id', { value: () => Math.random() });
}


export function test_defineProperty_74() {
    const obj = {};
    return Reflect.defineProperty(obj, 'errorGetter', {
        get() {
            throw new Error("getter fail");
        },
        configurable: true
    });
}


export function test_defineProperty_75() {
    const obj = {};
    let logged = false;
    return Reflect.defineProperty(obj, 'logSet', {
        set(val) {
            logged = true;
        },
        configurable: true
    }) && (!logged);
}


export function test_defineProperty_76() {
    const p = Promise.resolve(1);
    return Reflect.defineProperty(p, 'tag', { value: 'promiseTag' });
}


export function test_defineProperty_77() {
    const m = new Map();
    return Reflect.defineProperty(m, 'meta', { value: 'mapMeta' });
}


export function test_defineProperty_78() {
    const s = new Set();
    return Reflect.defineProperty(s, 'owner', { value: 'admin' });
}


export function test_defineProperty_79() {
    const wm = new WeakMap();
    return Reflect.defineProperty(wm, 'debug', { value: true });
}


export function test_defineProperty_80() {
    const buf = new ArrayBuffer(8);
    return Reflect.defineProperty(buf, 'label', { value: 'bufferLabel' });
}


export function test_defineProperty_81() {
    const arr = new Int32Array(4);
    return Reflect.defineProperty(arr, 'unit', { value: 'seconds' });
}


export function test_defineProperty_82() {
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    return Reflect.defineProperty(dv, 'format', { value: 'IEEE-754' });
}


export function test_defineProperty_83() {
    const dtf = new Intl.DateTimeFormat();
    return Reflect.defineProperty(dtf, 'localeOverride', { value: 'zh-CN' });
}


function* gen() {
}

export function test_defineProperty_84() {
    return Reflect.defineProperty(gen.prototype, 'init', { value: 0 });
}


async function asyncFn() {
}

export function test_defineProperty_85() {
    return Reflect.defineProperty(asyncFn, 'timeout', { value: 5000 });
}


class MyClass {
}

export function test_defineProperty_86() {
    return Reflect.defineProperty(MyClass, 'version', { value: '1.0' });
}


export function test_defineProperty_87() {
    const inst = new MyClass();
    return Reflect.defineProperty(inst, 'instanceId', { value: 123 });
}


export function test_defineProperty_88() {
    const obj = {};
    return Reflect.defineProperty(obj, 'constructor', { value: 'customCtor' });
}


export function test_defineProperty_89() {
    const ns = Object.freeze({ __esModule: true, a: 1 });
    return !Reflect.defineProperty(ns, 'b', { value: 2 });
}


export function test_defineProperty_90() {
    if (typeof document === 'undefined') {
        return true;
    }
    const div = document.createElement('div');
    return Reflect.defineProperty(div, 'customProp', { value: 'web' });
}


export function test_defineProperty_91() {
    if (typeof location === 'undefined') {
        return true;
    }
    return !Reflect.defineProperty(location, 'fake', { value: 1 });
}


export function test_defineProperty_92() {
    if (typeof process === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(process, 'testFlag', { value: 1 });
}


export function test_defineProperty_93() {
    return Reflect.defineProperty(console, 'customMethod', {
        value() { /* noop */
        },
        configurable: true
    });
}


export function test_defineProperty_94() {
    const obj = {};
    return Reflect.defineProperty(obj, 'readOnly', {
        get() {
            return 'fixed';
        }
    });
}


export function test_defineProperty_95() {
    const obj = {};
    return Reflect.defineProperty(obj, 'writeOnly', {
        set(val) {
            this._val = val;
        }
    });
}


export function test_defineProperty_97() {
    const obj = {};
    Reflect.defineProperty(obj, 'locked', { value: 1, configurable: false });
    Object.preventExtensions(obj);
    return !Reflect.defineProperty(obj, 'other', { value: 2 });
}


export function test_defineProperty_98() {
    'use strict';
    const obj = {};
    return Reflect.defineProperty(obj, 'strictProp', { value: 1 });
}


export function test_defineProperty_99() {
    const obj = {};
    return Reflect.defineProperty(obj, '__proto__', { value: 'notProto' });
}


export function test_defineProperty_100() {
    const obj = {};
    Reflect.defineProperty(obj, 'mixed', {
        get() {
            return 1;
        }
    });
    return !Reflect.defineProperty(obj, 'mixed', { value: 2 });
}


export function test_defineProperty_101() {
    const obj = {};
    Reflect.defineProperty(obj, 'flex', {
        get() {
            return 1;
        }, configurable: true
    });
    return Reflect.defineProperty(obj, 'flex', { value: 2 });
}


export function test_defineProperty_102() {
    const err = new Error('test');
    return Reflect.defineProperty(err, 'code', { value: 'E_TEST' });
}


export function test_defineProperty_103() {
    return Reflect.defineProperty(new EvalError(), 'tag', { value: 1 });
}


export function test_defineProperty_104() {
    return Reflect.defineProperty(new RangeError(), 'level', { value: 'high' });
}


export function test_defineProperty_105() {
    return Reflect.defineProperty(new ReferenceError(), 'src', { value: 'script.js' });
}


export function test_defineProperty_106() {
    return Reflect.defineProperty(new SyntaxError(), 'pos', { value: 10 });
}


export function test_defineProperty_107() {
    return Reflect.defineProperty(new TypeError(), 'cause', { value: 'invalid' });
}


export function test_defineProperty_108() {
    return Reflect.defineProperty(new URIError(), 'url', { value: 'bad://' });
}


export function test_defineProperty_109() {
    class CustomError extends Error {
    }

    const ce = new CustomError();
    return Reflect.defineProperty(ce, 'id', { value: 1001 });
}


export function test_defineProperty_110() {

    function F() {
    }

    return Reflect.defineProperty(F.prototype, 'mixin', { value: 'shared' });
}


export function test_defineProperty_111() {

    function base() {
    }

    const bound = base.bind({});
    return Reflect.defineProperty(bound, 'meta', { value: 'boundMeta' });
}


const arrowFn = () => {
};

export function test_defineProperty_112() {
    return Reflect.defineProperty(arrowFn, 'nameOverride', { value: 'customName' });
}


const asyncArrow = async () => {
};

export function test_defineProperty_113() {
    return Reflect.defineProperty(asyncArrow, 'timeout', { value: 1000 });
}


export function test_defineProperty_114() {
    return true;
}


export function test_defineProperty_115() {
    const match = /(\d+)/.exec("123");
    return Reflect.defineProperty(match, 'sourceInfo', { value: 'digits' });
}


export function test_defineProperty_116() {
    return Reflect.defineProperty(JSON, 'customParser', {
        value: () => {
        }
    });
}


export function test_defineProperty_117() {
    return Reflect.defineProperty(Math, 'PI_OVERRIDE', { value: 3.14 });
}


export function test_defineProperty_118() {
    if (typeof Atomics === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(Atomics, 'customOp', {
        value: () => {
        }
    });
}


export function test_defineProperty_119() {
    if (typeof WebAssembly === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(WebAssembly, 'debugMode', { value: false });
}


export function test_defineProperty_120() {
    return Reflect.defineProperty(Intl, 'defaultLocale', { value: 'en-US' });
}


export function test_defineProperty_121() {
    try {
        const url = new URL('https://example.com');
        return Reflect.defineProperty(url, 'tag', { value: 'tracked' });
    } catch (e) {
        return true;
    }
}


export function test_defineProperty_123() {
    if (typeof BroadcastChannel === 'undefined') {
        return true;
    }
    const bc = new BroadcastChannel('test');
    return Reflect.defineProperty(bc, 'meta', { value: 'broadcast' });
}


export function test_defineProperty_124() {
    if (typeof MessageChannel === 'undefined') {
        return true;
    }
    const mc = new MessageChannel();
    return Reflect.defineProperty(mc.port1, 'name', { value: 'portA' });
}


export function test_defineProperty_125() {
    if (typeof createImageBitmap === 'undefined') {
        return true;
    }

    const fakeBitmap = {};
    return Reflect.defineProperty(fakeBitmap, 'rotation', { value: 90 });
}


export function test_defineProperty_126() {
    if (typeof AudioContext === 'undefined' && typeof webkitAudioContext === 'undefined') {
        return true;
    }
    const ctx = new (window.AudioContext || webkitAudioContext)();
    return Reflect.defineProperty(ctx, 'label', { value: 'audioCtx' });
}


export function test_defineProperty_128() {
    if (typeof performance === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(performance, 'mark', { value: 'start' });
}


export function test_defineProperty_129() {
    if (typeof navigator === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(navigator, 'customFlag', { value: 1 });
}


export function test_defineProperty_130() {
    if (typeof screen === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(screen, 'theme', { value: 'dark' });
}


export function test_defineProperty_131() {
    if (typeof history === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(history, 'track', { value: true });
}


export function test_defineProperty_132() {
    if (typeof sessionStorage === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(sessionStorage, 'tempData', { value: 'tmp' });
}


export function test_defineProperty_133() {
    if (typeof localStorage === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(localStorage, 'userPref', { value: 'light' });
}


export function test_defineProperty_134() {
    if (typeof caches === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(caches, 'version', { value: 1 });
}


export function test_defineProperty_135() {
    if (typeof indexedDB === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(indexedDB, 'dbName', { value: 'appDB' });
}


export function test_defineProperty_136() {
    if (typeof crypto === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(crypto, 'seed', { value: 12345 });
}


export function test_defineProperty_137() {
    if (typeof applicationCache === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(applicationCache, 'statusText', { value: 'ok' });
}


export function test_defineProperty_138() {
    if (typeof OfflineAudioContext === 'undefined') {
        return true;
    }
    const ctx = new OfflineAudioContext(1, 44100, 44100);
    return Reflect.defineProperty(ctx, 'export', { value: false });
}


export function test_defineProperty_139() {
    if (typeof locationbar === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(locationbar, 'visible', { value: false });
}


export function test_defineProperty_140() {
    if (typeof menubar === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(menubar, 'compact', { value: true });
}


export function test_defineProperty_141() {
    if (typeof personalbar === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(personalbar, 'collapsed', { value: true });
}


export function test_defineProperty_142() {
    if (typeof toolbar === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(toolbar, 'mode', { value: 'full' });
}


export function test_defineProperty_143() {
    if (typeof statusbar === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(statusbar, 'text', { value: '' });
}


export function test_defineProperty_144() {
    if (typeof scrollbars === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(scrollbars, 'autoHide', { value: true });
}


export function test_defineProperty_145() {
    if (typeof external === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(external, 'call', {
        value: () => {
        }
    });
}


export function test_defineProperty_146() {
    if (typeof ch === 'undefined') {
        return true;
    }
    return Reflect.defineProperty(ch, 'extensionLoaded', { value: true });
}


export function test_defineProperty_147() {
    if (typeof sa=== 'undefined') {
        return true;
    }
    return Reflect.defineProperty(sa, 'push', { value: 'notify' });
}

export function test_defineProperty_148() {
    const obj = Object.create(null);
    return Reflect.defineProperty(obj, 'independent', { value: 'noProto' });
}


export function test_defineProperty_149() {
    const map = new Map();
    Object.preventExtensions(map);
    return !Reflect.defineProperty(map, 'newProp', { value: 'fail' });
}


export function test_defineProperty_150() {
    const obj = {};
    Reflect.defineProperty(obj, 'constant', {
        value: 'final',
        writable: false,
        configurable: false
    });

    return !Reflect.defineProperty(obj, 'constant', { value: 'hacked' });
}
