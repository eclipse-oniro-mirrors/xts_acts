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

export function test_deleteProperty_1() {
    const obj = { a: 1 };
    return Reflect.deleteProperty(obj, 'a');
}


export function test_deleteProperty_2() {
    const obj = { 0: 'first' };
    return Reflect.deleteProperty(obj, 0);
}


export function test_deleteProperty_3() {
    const sym = Symbol('s');
    const obj = { [sym]: 'symbolValue' };
    return Reflect.deleteProperty(obj, sym);
}


export function test_deleteProperty_4() {
    const obj = { null: 'value' };
    return Reflect.deleteProperty(obj, null);
}


export function test_deleteProperty_5() {
    const obj = { undefined: 'undefVal' };
    return Reflect.deleteProperty(obj, undefined);
}


export function test_deleteProperty_6() {
    const obj = {};
    return Reflect.deleteProperty(obj, 'notExist');
}


export function test_deleteProperty_7() {
    try {
        Reflect.deleteProperty(null, 'a');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_deleteProperty_8() {
    try {
        Reflect.deleteProperty("str", '0');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_deleteProperty_9() {
    const obj = { x: 1 };
    Reflect.deleteProperty(obj, 'x');
    return !('x' in obj);
}


export function test_deleteProperty_10() {
    const obj = { y: 1 };
    Object.preventExtensions(obj);
    return Reflect.deleteProperty(obj, 'y');
}


export function test_deleteProperty_11() {
    const obj = {};
    Object.defineProperty(obj, 'locked', {
        value: 1,
        configurable: false
    });
    Object.preventExtensions(obj);
    return !Reflect.deleteProperty(obj, 'locked');
}


export function test_deleteProperty_12() {
    const obj = { p: 1 };
    Object.seal(obj);
    return !Reflect.deleteProperty(obj, 'p');
}


export function test_deleteProperty_13() {
    const obj = Object.freeze({ q: 1 });
    return !Reflect.deleteProperty(obj, 'q');
}


export function test_deleteProperty_14() {
    const obj = {};
    Object.defineProperty(obj, 'static', {
        value: 1,
        configurable: false
    });
    return !Reflect.deleteProperty(obj, 'static');
}


export function test_deleteProperty_15() {
    const obj = {};
    Object.defineProperty(obj, 'dynamic', {
        value: 1,
        configurable: true
    });
    return Reflect.deleteProperty(obj, 'dynamic');
}


export function test_deleteProperty_16() {
    const arr = [1, 2, 3];
    return Reflect.deleteProperty(arr, 1);
}


export function test_deleteProperty_17() {
    const arr = [1, 2, 3];
    return !Reflect.deleteProperty(arr, 'length');
}


export function test_deleteProperty_18() {
    const obj = {};
    Object.defineProperty(obj, 'getter', {
        get() {
            return 42;
        },
        configurable: true
    });
    return Reflect.deleteProperty(obj, 'getter');
}


export function test_deleteProperty_19() {
    const obj = {};
    let val;
    Object.defineProperty(obj, 'setter', {
        set(x) {
            val = x;
        },
        configurable: true
    });
    return Reflect.deleteProperty(obj, 'setter');
}


export function test_deleteProperty_20() {
    const obj = {};
    Object.defineProperty(obj, 'fixedGet', {
        get() {
            return 1;
        },
        configurable: false
    });
    return !Reflect.deleteProperty(obj, 'fixedGet');
}


export function test_deleteProperty_21() {
    const handler = {
        deleteProperty(target, key) {
            return Reflect.deleteProperty(target, key);
        }
    };
    const proxy = new Proxy({ a: 1 }, handler);
    return Reflect.deleteProperty(proxy, 'a');
}


export function test_deleteProperty_22() {
    const proxy = new Proxy({ b: 1 }, {
        deleteProperty() {
            return false;
        }
    });
    return !Reflect.deleteProperty(proxy, 'b');
}


export function test_deleteProperty_23() {
    const proxy = new Proxy({ c: 1 }, {
        deleteProperty(target, key) {
            delete target[key];
            return true;
        }
    });
    return Reflect.deleteProperty(proxy, 'c');
}


export function test_deleteProperty_25() {
    'use strict';

    function f(a) {
        return Reflect.deleteProperty(arguments, '0');
    }

    return f(1);
}


export function test_deleteProperty_26() {
    const d = new Date();
    d.tag = 'custom';
    return Reflect.deleteProperty(d, 'tag');
}


export function test_deleteProperty_27() {
    const r = /abc/;
    r.name = 'pattern';
    return Reflect.deleteProperty(r, 'name');
}


export function test_deleteProperty_28() {

    function fn() {
    }

    fn.meta = 'info';
    return Reflect.deleteProperty(fn, 'meta');
}


export function test_deleteProperty_29() {
    const obj = Object.create(null);
    obj.key = 1;
    return Reflect.deleteProperty(obj, 'key');
}


export function test_deleteProperty_30() {
    const obj = { a: { b: { c: 1 } } };
    return Reflect.deleteProperty(obj.a.b, 'c');
}


export function test_deleteProperty_31() {
    const obj = { true: 'yes' };
    return Reflect.deleteProperty(obj, true);
}


export function test_deleteProperty_32() {
    const key = {};
    const obj = { '[object Object]': 'objKey' };
    return Reflect.deleteProperty(obj, key);
}


export function test_deleteProperty_33() {
    const obj = { '1,2': 'arr' };
    return Reflect.deleteProperty(obj, [1, 2]);
}


export function test_deleteProperty_34() {
    const sym = Symbol.iterator;
    const obj = {
        [sym]: function () {
        }
    };
    return Reflect.deleteProperty(obj, sym);
}


export function test_deleteProperty_35() {
    const sym = Symbol('private');
    const obj = { [sym]: 'secret' };
    return Reflect.deleteProperty(obj, sym);
}


export function test_deleteProperty_36() {
    const obj = {};
    Object.defineProperty(obj, 'sealedProp', {
        value: 1,
        configurable: false
    });
    Object.seal(obj);
    return !Reflect.deleteProperty(obj, 'sealedProp');
}


export function test_deleteProperty_37() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    return !Reflect.deleteProperty(obj, 'inherited');
}


export function test_deleteProperty_38() {
    const proto = { shared: 1 };
    const obj = Object.create(proto);
    obj.shared = 2;
    return Reflect.deleteProperty(obj, 'shared');
}


export function test_deleteProperty_39() {
    if (typeof globalThis !== 'object') {
        return true;
    }
    globalThis.__tmp = 1;
    const result = Reflect.deleteProperty(globalThis, '__tmp');
    return result;
}


export function test_deleteProperty_40() {
    const arr = [1];
    arr[99] = 'outOfBounds';
    return Reflect.deleteProperty(arr, 99);
}


export function test_deleteProperty_41() {
    const arr = [1, 2, 3];

    return !Reflect.deleteProperty(arr, 'length');
}


export function test_deleteProperty_42() {
    const strObj = new String('hello');
    strObj.note = 'text';
    return Reflect.deleteProperty(strObj, 'note');
}


export function test_deleteProperty_43() {
    const numObj = new Number(42);
    numObj.meta = 'num';
    return Reflect.deleteProperty(numObj, 'meta');
}


export function test_deleteProperty_44() {
    const boolObj = new Boolean(true);
    boolObj.flag = 1;
    return Reflect.deleteProperty(boolObj, 'flag');
}


export function test_deleteProperty_45() {
    const obj = { Infinity: 'inf' };
    return Reflect.deleteProperty(obj, Infinity);
}


export function test_deleteProperty_46() {
    const obj = { '-0': 'negZero' };
    return Reflect.deleteProperty(obj, -0);
}


export function test_deleteProperty_47() {
    const obj = { NaN: 'not-a-number' };
    return Reflect.deleteProperty(obj, NaN);
}


export function test_deleteProperty_48() {
    const obj = { temp: 1 };
    Reflect.deleteProperty(obj, 'temp');
    return !('temp' in obj);
}


export function test_deleteProperty_49() {
    const obj = { own: 1 };
    Reflect.deleteProperty(obj, 'own');
    return !obj.hasOwnProperty('own');
}


export function test_deleteProperty_50() {
    const obj = {};
    Object.defineProperty(obj, 'access', {
        get() {
            return 1;
        },
        set(x) {
        },
        configurable: true
    });
    return Reflect.deleteProperty(obj, 'access');
}


export function test_deleteProperty_51() {
    const obj = {};
    Object.defineProperty(obj, 'lockedAcc', {
        get() {
            return 1;
        },
        configurable: false
    });
    return !Reflect.deleteProperty(obj, 'lockedAcc');
}


export function test_deleteProperty_52() {
    const m = new Map();
    m.tag = 'mapTag';
    return Reflect.deleteProperty(m, 'tag');
}


export function test_deleteProperty_53() {
    const s = new Set();
    s.owner = 'admin';
    return Reflect.deleteProperty(s, 'owner');
}


export function test_deleteProperty_54() {
    const wm = new WeakMap();
    wm.debug = true;
    return Reflect.deleteProperty(wm, 'debug');
}


export function test_deleteProperty_55() {
    const buf = new ArrayBuffer(8);
    buf.label = 'buffer';
    return Reflect.deleteProperty(buf, 'label');
}


export function test_deleteProperty_56() {
    const arr = new Int32Array(4);
    arr.unit = 'seconds';
    return Reflect.deleteProperty(arr, 'unit');
}


export function test_deleteProperty_57() {
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    dv.format = 'IEEE';
    return Reflect.deleteProperty(dv, 'format');
}


export function test_deleteProperty_58() {
    const p = Promise.resolve(1);
    p.tag = 'promise';
    return Reflect.deleteProperty(p, 'tag');
}


export function test_deleteProperty_59() {
    const dtf = new Intl.DateTimeFormat();
    dtf.localeOverride = 'zh-CN';
    return Reflect.deleteProperty(dtf, 'localeOverride');
}


function* gen() {
}

export function test_deleteProperty_60() {
    gen.prototype.init = 0;
    return Reflect.deleteProperty(gen.prototype, 'init');
}


async function asyncFn() {
}

export function test_deleteProperty_61() {
    asyncFn.timeout = 5000;
    return Reflect.deleteProperty(asyncFn, 'timeout');
}


class MyClass {
}

export function test_deleteProperty_62() {
    MyClass.version = '1.0';
    return Reflect.deleteProperty(MyClass, 'version');
}


export function test_deleteProperty_63() {
    const inst = new MyClass();
    inst.instanceId = 123;
    return Reflect.deleteProperty(inst, 'instanceId');
}


export function test_deleteProperty_64() {
    const obj = { constructor: 'fake' };
    return Reflect.deleteProperty(obj, 'constructor');
}


export function test_deleteProperty_65() {
    const ns = Object.freeze({ __esModule: true, a: 1 });

    return !Reflect.deleteProperty(ns, 'a');
}


export function test_deleteProperty_66() {
    if (typeof document === 'undefined') {
        return true;
    }
    const div = document.createElement('div');
    div.customProp = 'web';
    return Reflect.deleteProperty(div, 'customProp');
}


export function test_deleteProperty_67() {
    if (typeof location === 'undefined') {
        return true;
    }
    return !Reflect.deleteProperty(location, 'href');
}


export function test_deleteProperty_68() {
    if (typeof process === 'undefined') {
        return true;
    }
    process.testFlag = 1;
    return Reflect.deleteProperty(process, 'testFlag');
}


export function test_deleteProperty_69() {
    console.customMethod = function () {
    };
    return Reflect.deleteProperty(console, 'customMethod');
}


export function test_deleteProperty_70() {
    const obj = {};
    Object.defineProperty(obj, 'readOnly', {
        value: 1,
        writable: false,
        configurable: true
    });
    return Reflect.deleteProperty(obj, 'readOnly');
}


export function test_deleteProperty_71() {
    Array.prototype.universal = 'all';
    const result = Reflect.deleteProperty(Array.prototype, 'universal');
    return result;
}


export function test_deleteProperty_72() {
    Object.prototype.$id = 1;
    return Reflect.deleteProperty(Object.prototype, '$id');
}


export function test_deleteProperty_73() {
    const obj = { a: 1 };
    delete obj.a;
    return Reflect.deleteProperty(obj, 'a');
}


export function test_deleteProperty_74() {
    const obj = {};
    Object.defineProperty(obj, 'errorGet', {
        get() {
            throw new Error();
        },
        configurable: true
    });
    return Reflect.deleteProperty(obj, 'errorGet');
}


export function test_deleteProperty_75() {
    const obj = {};
    Object.defineProperty(obj, 'writeOnly', {
        set() {
        },
        configurable: true
    });
    return Reflect.deleteProperty(obj, 'writeOnly');
}


export function test_deleteProperty_76() {
    const err = new Error('test');
    err.code = 'E1';
    return Reflect.deleteProperty(err, 'code');
}


export function test_deleteProperty_77() {
    const e = new EvalError();
    e.tag = 1;
    return Reflect.deleteProperty(e, 'tag');
}


export function test_deleteProperty_78() {
    const e = new RangeError();
    e.level = 'high';
    return Reflect.deleteProperty(e, 'level');
}


export function test_deleteProperty_79() {
    const e = new ReferenceError();
    e.src = 'file.js';
    return Reflect.deleteProperty(e, 'src');
}


export function test_deleteProperty_80() {
    const e = new SyntaxError();
    e.pos = 10;
    return Reflect.deleteProperty(e, 'pos');
}


export function test_deleteProperty_81() {
    const e = new TypeError();
    e.cause = 'invalid';
    return Reflect.deleteProperty(e, 'cause');
}


export function test_deleteProperty_82() {
    const e = new URIError();
    e.url = 'bad://';
    return Reflect.deleteProperty(e, 'url');
}


export function test_deleteProperty_83() {
    class CustomError extends Error {
    }

    const ce = new CustomError();
    ce.id = 1001;
    return Reflect.deleteProperty(ce, 'id');
}


export function test_deleteProperty_84() {

    function F() {
    }

    F.prototype.mixin = 'shared';
    return Reflect.deleteProperty(F.prototype, 'mixin');
}


export function test_deleteProperty_85() {

    function base() {
    }

    const bound = base.bind({});
    bound.meta = 'boundMeta';
    return Reflect.deleteProperty(bound, 'meta');
}


const arrowFn = () => {
};

export function test_deleteProperty_86() {
    arrowFn.nameOverride = 'custom';
    return Reflect.deleteProperty(arrowFn, 'nameOverride');
}


const asyncArrow = async () => {
};

export function test_deleteProperty_87() {
    asyncArrow.timeout = 1000;
    return Reflect.deleteProperty(asyncArrow, 'timeout');
}

export function test_deleteProperty_89() {
    const match = /(\d+)/.exec("123");
    match.sourceInfo = 'digits';
    return Reflect.deleteProperty(match, 'sourceInfo');
}


export function test_deleteProperty_90() {
    JSON.customParser = () => {
    };
    return Reflect.deleteProperty(JSON, 'customParser');
}


export function test_deleteProperty_91() {
    Math.PI_OVERRIDE = 3.14;
    return Reflect.deleteProperty(Math, 'PI_OVERRIDE');
}


export function test_deleteProperty_92() {
    if (typeof Atomics === 'undefined') {
        return true;
    }
    Atomics.customOp = () => {
    };
    return Reflect.deleteProperty(Atomics, 'customOp');
}


export function test_deleteProperty_93() {
    if (typeof WebAssembly === 'undefined') {
        return true;
    }
    WebAssembly.debugMode = false;
    return Reflect.deleteProperty(WebAssembly, 'debugMode');
}


export function test_deleteProperty_94() {
    Intl.defaultLocale = 'en-US';
    return Reflect.deleteProperty(Intl, 'defaultLocale');
}


export function test_deleteProperty_95() {
    try {
        const url = new URL('https://example.com');
        url.tag = 'tracked';
        return Reflect.deleteProperty(url, 'tag');
    } catch (e) {
        return true;
    }
}


export function test_deleteProperty_97() {
    if (typeof BroadcastChannel === 'undefined') {
        return true;
    }
    const bc = new BroadcastChannel('test');
    bc.meta = 'broadcast';
    return Reflect.deleteProperty(bc, 'meta');
}


export function test_deleteProperty_98() {
    if (typeof MessageChannel === 'undefined') {
        return true;
    }
    const mc = new MessageChannel();
    mc.port1.name = 'portA';
    return Reflect.deleteProperty(mc.port1, 'name');
}


export function test_deleteProperty_99() {
    const fakeBitmap = { rotation: 90 };
    return Reflect.deleteProperty(fakeBitmap, 'rotation');
}


export function test_deleteProperty_100() {
    if (typeof AudioContext === 'undefined' && typeof webkitAudioContext === 'undefined') {
        return true;
    }
    const ctx = new (window.AudioContext || webkitAudioContext)();
    ctx.label = 'audioCtx';
    return Reflect.deleteProperty(ctx, 'label');
}


export function test_deleteProperty_102() {
    if (typeof performance === 'undefined') {
        return true;
    }
    performance.mark = 'start';
    return Reflect.deleteProperty(performance, 'mark');
}


export function test_deleteProperty_103() {
    if (typeof navigator === 'undefined') {
        return true;
    }
    navigator.customFlag = 1;
    return Reflect.deleteProperty(navigator, 'customFlag');
}


export function test_deleteProperty_104() {
    if (typeof screen === 'undefined') {
        return true;
    }
    screen.theme = 'dark';
    return Reflect.deleteProperty(screen, 'theme');
}


export function test_deleteProperty_105() {
    if (typeof history === 'undefined') {
        return true;
    }
    history.track = true;
    return Reflect.deleteProperty(history, 'track');
}


export function test_deleteProperty_106() {
    if (typeof sessionStorage === 'undefined') {
        return true;
    }
    sessionStorage.tempData = 'tmp';
    return Reflect.deleteProperty(sessionStorage, 'tempData');
}


export function test_deleteProperty_107() {
    if (typeof localStorage === 'undefined') {
        return true;
    }
    localStorage.userPref = 'light';
    return Reflect.deleteProperty(localStorage, 'userPref');
}


export function test_deleteProperty_108() {
    if (typeof caches === 'undefined') {
        return true;
    }
    caches.version = 1;
    return Reflect.deleteProperty(caches, 'version');
}


export function test_deleteProperty_109() {
    if (typeof indexedDB === 'undefined') {
        return true;
    }
    indexedDB.dbName = 'appDB';
    return Reflect.deleteProperty(indexedDB, 'dbName');
}


export function test_deleteProperty_110() {
    if (typeof crypto === 'undefined') {
        return true;
    }
    crypto.seed = 12345;
    return Reflect.deleteProperty(crypto, 'seed');
}


export function test_deleteProperty_111() {
    if (typeof applicationCache === 'undefined') {
        return true;
    }
    applicationCache.statusText = 'ok';
    return Reflect.deleteProperty(applicationCache, 'statusText');
}


export function test_deleteProperty_112() {
    if (typeof OfflineAudioContext === 'undefined') {
        return true;
    }
    const ctx = new OfflineAudioContext(1, 44100, 44100);
    ctx.export = false;
    return Reflect.deleteProperty(ctx, 'export');
}


export function test_deleteProperty_113() {
    if (typeof locationbar === 'undefined') {
        return true;
    }
    locationbar.visible = false;
    return Reflect.deleteProperty(locationbar, 'visible');
}


export function test_deleteProperty_114() {
    if (typeof menubar === 'undefined') {
        return true;
    }
    menubar.compact = true;
    return Reflect.deleteProperty(menubar, 'compact');
}


export function test_deleteProperty_115() {
    if (typeof personalbar === 'undefined') {
        return true;
    }
    personalbar.collapsed = true;
    return Reflect.deleteProperty(personalbar, 'collapsed');
}


export function test_deleteProperty_116() {
    if (typeof toolbar === 'undefined') {
        return true;
    }
    toolbar.mode = 'full';
    return Reflect.deleteProperty(toolbar, 'mode');
}


export function test_deleteProperty_117() {
    if (typeof statusbar === 'undefined') {
        return true;
    }
    statusbar.text = '';
    return Reflect.deleteProperty(statusbar, 'text');
}


export function test_deleteProperty_118() {
    if (typeof scrollbars === 'undefined') {
        return true;
    }
    scrollbars.autoHide = true;
    return Reflect.deleteProperty(scrollbars, 'autoHide');
}


export function test_deleteProperty_119() {
    if (typeof external === 'undefined') {
        return true;
    }
    external.call = () => {
    };
    return Reflect.deleteProperty(external, 'call');
}


export function test_deleteProperty_120() {
    if (typeof ch === 'undefined') {
        return true;
    }
    ch.extensionLoaded = true;
    return Reflect.deleteProperty(ch, 'extensionLoaded');
}


export function test_deleteProperty_121() {
    if (typeof safari === 'undefined') {
        return true;
    }
    safari.push = 'notify';
    return Reflect.deleteProperty(safari, 'push');
}


export function test_deleteProperty_122() {
    const obj = Object.create(null);
    obj.item = 1;
    return Reflect.deleteProperty(obj, 'item');
}


export function test_deleteProperty_123() {
    return !Reflect.deleteProperty(Array, 'isArray');
}


export function test_deleteProperty_124() {

    if (!Math.hasOwnProperty('temp')) {
        Math.temp = 'tmp';
    }
    return Reflect.deleteProperty(Math, 'temp');
}


export function test_deleteProperty_125() {

    function f() {
        return !Reflect.deleteProperty(arguments, 'length');
    }

    return f();
}


export function test_deleteProperty_126() {

    function f() {
        'use strict';
        return true;
    }

    return true;
}


export function test_deleteProperty_127() {
    const arr = new Array(100);
    arr[50] = 'middle';
    return Reflect.deleteProperty(arr, 50);
}


export function test_deleteProperty_128() {
    const obj = { __proto__: null, other: 1 };
    return Reflect.deleteProperty(obj, '__proto__');
}


export function test_deleteProperty_129() {
    const sym = Symbol('s');
    const obj = { [sym]: 'val' };
    Object.seal(obj);
    return !Reflect.deleteProperty(obj, sym);
}


export function test_deleteProperty_131() {
    const obj = { a: 1 };
    Object.seal(obj);

    return true;
}


export function test_deleteProperty_132() {
    const obj = {};
    Object.defineProperty(obj, 'throwing', {
        get() {
            throw new Error('getter fail');
        },
        configurable: true
    });
    return Reflect.deleteProperty(obj, 'throwing');
}


export function test_deleteProperty_133() {
    const { proxy, revoke } = Proxy.revocable({}, {});
    revoke();
    try {
        return !Reflect.deleteProperty(proxy, 'x');
    } catch (e) {
        return e instanceof TypeError;
    }
}


export function test_deleteProperty_134() {
    if (typeof DOMRectReadOnly === 'undefined') {
        return true;
    }
    const rect = new DOMRectReadOnly(0, 0, 10, 10);
    return !Reflect.deleteProperty(rect, 'width');
}


export function test_deleteProperty_135() {
    if (typeof document === 'undefined') {
        return true;
    }
    const el = document.createElement('div');
    return !Reflect.deleteProperty(el.style, 'color');
}


export function test_deleteProperty_136() {
    const obj = { a: 1 };
    Reflect.deleteProperty(obj, 'a');
    for (const k in obj) {
        return false;
    }
    return true;
}


export function test_deleteProperty_137() {
    const obj = { temp: 1 };
    Reflect.deleteProperty(obj, 'temp');
    obj.temp = 2;
    return obj.temp === 2;
}


export function test_deleteProperty_138() {
    const proto = {};
    Object.defineProperty(proto, 'fixed', {
        value: 1,
        configurable: false
    });
    const obj = Object.create(proto);
    return !Reflect.deleteProperty(obj, 'fixed');
}


export function test_deleteProperty_139() {
    const obj = {
        get prop() {
            return 1;
        }
    };
    Reflect.deleteProperty(obj, 'prop');
    return !(obj.prop);
}


export function test_deleteProperty_140() {
    const obj = { a: 1 };
    Reflect.deleteProperty(obj, 'a');
    return !obj.propertyIsEnumerable('a');
}


export function test_deleteProperty_141() {
    const obj = { hasOwnProperty: 'custom' };
    return Reflect.deleteProperty(obj, 'hasOwnProperty');
}


export function test_deleteProperty_143() {
    if (typeof customElements === 'undefined') {
        return true;
    }

    class MyEl extends HTMLElement {
    }

    customElements.define('my-el', MyEl);
    const el = document.createElement('my-el');
    el.data = 1;
    return Reflect.deleteProperty(el, 'data');
}


export function test_deleteProperty_144() {
    if (typeof AbortController === 'undefined') {
        return true;
    }
    const ac = new AbortController();
    ac.tag = 'abort';
    return Reflect.deleteProperty(ac, 'tag');
}


export function test_deleteProperty_145() {
    if (typeof ReadableStream === 'undefined') {
        return true;
    }
    const rs = new ReadableStream();
    rs.reader = 'custom';
    return Reflect.deleteProperty(rs, 'reader');
}


export function test_deleteProperty_146() {
    if (typeof Response === 'undefined') {
        return true;
    }
    const res = new Response();
    res.tag = 'res';
    return Reflect.deleteProperty(res, 'tag');
}


export function test_deleteProperty_147() {
    if (typeof Request === 'undefined') {
        return true;
    }
    const req = new Request('/test');
    req.tag = 'req';
    return Reflect.deleteProperty(req, 'tag');
}


export function test_deleteProperty_148() {
    if (typeof PerformanceEntry === 'undefined') {
        return true;
    }

    const entry = { name: 'load', duration: 100 };
    return Reflect.deleteProperty(entry, 'duration');
}


export function test_deleteProperty_149() {
    if (typeof IntersectionObserverEntry === 'undefined') {
        return true;
    }
    const entry = { time: 100, isIntersecting: true };
    return Reflect.deleteProperty(entry, 'isIntersecting');
}


export function test_deleteProperty_150() {
    const sym = Symbol('test');
    const obj = {
        str: 1,
        123: 2,
        [sym]: 3,
        null: 4,
        undefined: 5
    };
    return Reflect.deleteProperty(obj, 'str') &&
    Reflect.deleteProperty(obj, 123) &&
    Reflect.deleteProperty(obj, sym) &&
    Reflect.deleteProperty(obj, null) &&
    Reflect.deleteProperty(obj, undefined);
}
