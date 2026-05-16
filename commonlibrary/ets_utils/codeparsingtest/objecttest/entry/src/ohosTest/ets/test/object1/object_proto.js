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

export function ObjectProtoTest001(){
    const obj = { name: 'test' };
    const proto = obj.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest002(){
    const arr = [1, 2, 3];
    const proto = arr.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest003(){
    function Foo() {}
    const instance = new Foo();
    const proto = instance.__proto__;
    return proto === Foo.prototype;
}
export function ObjectProtoTest004(){
    const obj = Object.create(null);
    const proto = obj.__proto__;
    return proto === undefined;
}
export function ObjectProtoTest005(){
    const numProto = (1).__proto__;

    const strProto = ('hello').__proto__;
    return [numProto === Number.prototype, strProto === String.prototype];
}
export function ObjectProtoTest006(){
    class Bar {}
    const instance = new Bar();
    const proto = instance.__proto__;
    return proto === Bar.prototype;
}
export function ObjectProtoTest007(){
    class Parent {}
    class Child extends Parent {}
    const childInstance = new Child();
    const childProto = childInstance.__proto__;

    const parentProto = Child.prototype.__proto__;
    return [childProto === Child.prototype, parentProto === Parent.prototype];
}
export function ObjectProtoTest008(){
    null.__proto__;
}
export function ObjectProtoTest009(){
    undefined.__proto__;
}
export function ObjectProtoTest010(){
    function testFunc() {}
    const proto = testFunc.__proto__;
    return proto === Function.prototype;
}
export function ObjectProtoTest011(){
    const date = new Date();
    const proto = date.__proto__;
    return proto === Date.prototype;
}
export function ObjectProtoTest012(){
    const reg = /test/;
    const proto = reg.__proto__;
    return proto === RegExp.prototype;
}
export function ObjectProtoTest013(){
    const map = new Map();
    const proto = map.__proto__;
    return proto === Map.prototype;
}
export function ObjectProtoTest014(){
    const set = new Set();
    const proto = set.__proto__;
    return proto === Set.prototype;
}
export function ObjectProtoTest015(){
    const target = {};
    const proxy = new Proxy(target, {});
    const proto = proxy.__proto__;
    return proto === target.__proto__;
}
export function ObjectProtoTest016(){
    const promise = Promise.resolve();
    const proto = promise.__proto__;
    return proto === Promise.prototype;
}
export function ObjectProtoTest017(){
    const bool = new Boolean(true);
    const proto = bool.__proto__;
    return proto === Boolean.prototype;
}
export function ObjectProtoTest018(){
    const sym = Object(Symbol('test'));
    const proto = sym.__proto__;
    return proto === Symbol.prototype;
}
export function ObjectProtoTest019(){
    const err = new Error('test');
    const proto = err.__proto__;
    return proto === Error.prototype;
}
export function ObjectProtoTest020(){
    const err = new TypeError('test');
    const proto = err.__proto__;
    return proto === TypeError.prototype;
}
export function ObjectProtoTest021(){
    const buf = new ArrayBuffer(8);
    const proto = buf.__proto__;
    return proto === ArrayBuffer.prototype;
}
export function ObjectProtoTest022(){
    const arr = new Uint8Array(8);
    const proto = arr.__proto__;
    return proto === Uint8Array.prototype;
}
export function ObjectProtoTest023(){
    const proto = Function.prototype.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest024(){
    const proto = Object.prototype.__proto__;
    return proto === null;
}
export function ObjectProtoTest025(){
    class Parent {}
    class Child extends Parent {}
    const proto = Child.prototype.__proto__;
    return proto === Parent.prototype;
}
export function ObjectProtoTest026(){
    function func() {}
    const boundFunc = func.bind(null);
    const proto = boundFunc.__proto__;
    return proto === Function.prototype;
}
export function ObjectProtoTest027(){
    const arrowFunc = () => {};
    const proto = arrowFunc.__proto__;
    return proto === Function.prototype;
}
export function ObjectProtoTest028(){
    const Foo = class {};
    const instance = new Foo();
    const proto = instance.__proto__;
    return proto === Foo.prototype;
}
export function ObjectProtoTest029(){
    const Foo = class {};
    const instance = new Foo();
    const proto = instance.__proto__;
    return proto === Foo.prototype;
}
export function ObjectProtoTest030(){
    function* genFunc() {}
    const genInstance = genFunc();
    const proto = genInstance.__proto__;
    return typeof proto.next === 'function';
}
export function ObjectProtoTest031(){
    const weakMap = new WeakMap();
    const proto = weakMap.__proto__;
    return proto === WeakMap.prototype;
}
export function ObjectProtoTest032(){
    const weakSet = new WeakSet();
    const proto = weakSet.__proto__;
    return proto === WeakSet.prototype;
}
export function ObjectProtoTest033(){
    const buf = new ArrayBuffer(8);
    const dataView = new DataView(buf);
    const proto = dataView.__proto__;
    return proto === DataView.prototype;
}
export function ObjectProtoTest034(){
    const err = new URIError('test');
    const proto = err.__proto__;
    return proto === URIError.prototype;
}
export function ObjectProtoTest035(){
    const err = new RangeError('test');
    const proto = err.__proto__;
    return proto === RangeError.prototype;
}
export function ObjectProtoTest036(){
    const err = new EvalError('test');
    const proto = err.__proto__;
    return proto === EvalError.prototype;
}
export function ObjectProtoTest037(){
    const err = new ReferenceError('test');
    const proto = err.__proto__;
    return proto === ReferenceError.prototype;
}
export function ObjectProtoTest038(){
    const err = new SyntaxError('test');
    const proto = err.__proto__;
    return proto === SyntaxError.prototype;
}
export function ObjectProtoTest039(){
    const arr = new Float64Array(8);
    const proto = arr.__proto__;
    return proto === Float64Array.prototype;
}
export function ObjectProtoTest040(){
    const arr = new Int32Array(8);
    const proto = arr.__proto__;
    return proto === Int32Array.prototype;
}
export function ObjectProtoTest041(){
    const arr = new Int16Array(8);
    const proto = arr.__proto__;
    return proto === Int16Array.prototype;
}
export function ObjectProtoTest042(){
    const arr = new Int8Array(8);
    const proto = arr.__proto__;
    return proto === Int8Array.prototype;
}
export function ObjectProtoTest043(){
    const arr = new Uint32Array(8);
    const proto = arr.__proto__;
    return proto === Uint32Array.prototype;
}
export function ObjectProtoTest044(){
    const arr = new Uint16Array(8);
    const proto = arr.__proto__;
    return proto === Uint16Array.prototype;
}
export function ObjectProtoTest045(){
    const arr = new Float32Array(8);
    const proto = arr.__proto__;
    return proto === Float32Array.prototype;
}
export function ObjectProtoTest046(){
    const bigInt = Object(BigInt(123));
    const proto = bigInt.__proto__;
    return proto === BigInt.prototype;
}
export function ObjectProtoTest047(){
    const arr = new BigInt64Array(8);
    const proto = arr.__proto__;
    return proto === BigInt64Array.prototype;
}
export function ObjectProtoTest048(){
    const arr = new BigUint64Array(8);
    const proto = arr.__proto__;
    return proto === BigUint64Array.prototype;
}
export function ObjectProtoTest049(){
    const dtf = new Intl.DateTimeFormat();
    const proto = dtf.__proto__;
    return proto === Intl.DateTimeFormat.prototype;
}
export function ObjectProtoTest050(){
    const nf = new Intl.NumberFormat();
    const proto = nf.__proto__;
    return proto === Intl.NumberFormat.prototype;
}
export function ObjectProtoTest051(){
    const collator = new Intl.Collator();
    const proto = collator.__proto__;
    return proto === Intl.Collator.prototype;
}
export function ObjectProtoTest052(){
    const target = {};
    const weakRef = new WeakRef(target);
    const proto = weakRef.__proto__;
    return proto === WeakRef.prototype;
}
export function ObjectProtoTest053(){
    const fr = new FinalizationRegistry(() => {});
    const proto = fr.__proto__;
    return proto === FinalizationRegistry.prototype;
}
export function ObjectProtoTest054(){
    const buf = new ArrayBuffer(8);
    const transferred = ArrayBuffer.transfer(buf, 16);
    const proto = transferred.__proto__;
    return proto === ArrayBuffer.prototype;
}
export function ObjectProtoTest055(){
    const reg = /test/;
    const result = reg.exec('test');
    const proto = result.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest056(){
    const rawStr = String.raw`test`;
    const proto = rawStr.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest057(){
    const num = Object(Number.EPSILON);
    const proto = num.__proto__;
    return proto === Number.prototype;
}
export function ObjectProtoTest058(){
    const proto = Math.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest059(){
    const proto = JSON.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest060(){
    function getArgs() { return arguments; }
    const args = getArgs(1, 2, 3);
    const proto = args.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest061(){
    const err = new DOMException('test');
    const proto = err.__proto__;
    return proto === DOMException.prototype;
}
export function ObjectProtoTest062(){
    const url = new URL('https://example.com');
    const proto = url.__proto__;
    return proto === URL.prototype;
}
export function ObjectProtoTest063(){
    const params = new URLSearchParams('a=1&b=2');
    const proto = params.__proto__;
    return proto === URLSearchParams.prototype;
}
export function ObjectProtoTest064(){
    const encoder = new TextEncoder();
    const proto = encoder.__proto__;
    return proto === TextEncoder.prototype;
}
export function ObjectProtoTest065(){
    const decoder = new TextDecoder();
    const proto = decoder.__proto__;
    return proto === TextDecoder.prototype;
}
export function ObjectProtoTest066(){
    const buf = new ArrayBuffer(8);
    const sliced = buf.slice(2);
    const proto = sliced.__proto__;
    return proto === ArrayBuffer.prototype;
}
export function ObjectProtoTest067(){
    const map = new Map();
    const iterator = map.entries();
    const proto = iterator.__proto__;
    return typeof proto.next === 'function';
}
export function ObjectProtoTest068(){
    const set = new Set();
    const iterator = set.values();
    const proto = iterator.__proto__;
    return typeof proto.next === 'function';
}
export function ObjectProtoTest069(){
    const str = 'test';
    const iterator = str[Symbol.iterator]();
    const proto = iterator.__proto__;
    return typeof proto.next === 'function';
}
export function ObjectProtoTest070(){
    const arr = [1, 2, 3];
    const iterator = arr[Symbol.iterator]();
    const proto = iterator.__proto__;
    return typeof proto.next === 'function';
}
export function ObjectProtoTest071(){
    const locale = new Intl.Locale('en-US');
    const proto = locale.__proto__;
    return proto === Intl.Locale.prototype;
}
export function ObjectProtoTest072(){
    const pluralRules = new Intl.PluralRules();
    const proto = pluralRules.__proto__;
    return proto === Intl.PluralRules.prototype;
}
export function ObjectProtoTest073(){
    const rtf = new Intl.RelativeTimeFormat();
    const proto = rtf.__proto__;
    return proto === Intl.RelativeTimeFormat.prototype;
}
export function ObjectProtoTest074(){
    const lf = new Intl.ListFormat();
    const proto = lf.__proto__;
    return proto === Intl.ListFormat.prototype;
}
export function ObjectProtoTest075(){
    const dtf = new Intl.DateTimeFormat();
    const parts = dtf.formatToParts(new Date());
    const proto = parts.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest076(){
    const view = new Uint8Array();
    const proto = view.__proto__;
    return proto === Uint8Array.prototype;
}
export function ObjectProtoTest077(){
    const iteratorFunc = [][Symbol.iterator];
    const proto = iteratorFunc.__proto__;
    return proto === Function.prototype;
}
export function ObjectProtoTest078(){
    const promise = Promise.all([]);
    const proto = promise.__proto__;
    return proto === Promise.prototype;
}
export function ObjectProtoTest079(){
    const promise = Promise.race([]);
    const proto = promise.__proto__;
    return proto === Promise.prototype;
}
export function ObjectProtoTest080(){
    const err = new Error();
    const proto = err.__proto__;
    return proto === Error.prototype;
}
export function ObjectProtoTest081(){
    const num = Object(Number.isFinite(Infinity) ? 0 : 1);
    const proto = num.__proto__;
    return proto === Number.prototype;
}
export function ObjectProtoTest082(){
    const str = String.fromCharCode(65);
    const proto = str.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest083(){
    const arr = Array.from([1, 2, 3]);
    const proto = arr.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest084(){
    const arr = Array.of(1, 2, 3);
    const proto = arr.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest085(){
    const map = new Map();
    const iterator = map.entries();
    const proto = iterator.__proto__;
    return typeof proto.next === 'function';
}
export function ObjectProtoTest086(){
    const set = new Set();
    const iterator = set.keys();
    const proto = iterator.__proto__;
    return typeof proto.next === 'function';
}
export function ObjectProtoTest087(){
    function* gen() { yield 1; }
    const result = gen().next();
    const proto = result.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest088(){
    const customProto = {};
    const obj = Object.create(customProto);
    const proto = obj.__proto__;
    return proto === customProto;
}
export function ObjectProtoTest089(){
    const obj = Object.freeze({});
    const proto = obj.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest090(){
    const obj = Object.seal({});
    const proto = obj.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest091(){
    const obj = Object.preventExtensions({});
    const proto = obj.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest092(){
    class Foo {}
    const instance = Reflect.construct(Foo, []);
    const proto = instance.__proto__;
    return proto === Foo.prototype;
}
export function ObjectProtoTest093(){
    const target = () => ({ a: 1 });
    const proxy = new Proxy(target, { apply: (t) => t() });
    const result = proxy();
    const proto = result.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest094(){
    const obj = { [Symbol.toStringTag]: 'Test' };
    const proto = obj.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest095(){
    /test/.exec('test');
    const lastMatch = RegExp.lastMatch;
    const proto = lastMatch.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest096(){
    const arr = [1].concat([2]);
    const proto = arr.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest097(){
    const parts = 'a,b,c'.split(',');
    const proto = parts.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest098(){
    const map = new Map().set('key', 'value');
    const value = map.get('key');
    const proto = value.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest099(){
    const set = new Set();
    const iterator = set.values();
    const proto = iterator.__proto__;
    return proto === Set.prototype.values.prototype;
}
export function ObjectProtoTest100(){
    const key = {};
    const value = { prop: 1 };
    const wm = new WeakMap().set(key, value);
    const result = wm.get(key);
    const proto = result.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest101(){
    const nf = new Intl.NumberFormat();
    const parts = nf.formatToParts(123);
    const proto = parts.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest102(){
    function original(a, b) { return a + b; }
    const bound = original.bind(null, 1);
    const proto = bound.__proto__;
    return proto === Function.prototype;
}
export function ObjectProtoTest103(){
    const arr = [1, 2, 3].slice(1);
    const proto = arr.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest104(){
    const str = 'hello'.substring(1);
    const proto = str.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest105(){
    const numStr = (123.45).toFixed(1);
    const proto = numStr.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest106(){
    const dateStr = new Date().toISOString();
    const proto = dateStr.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest107(){
    const result = /a/.exec('b');
    const proto = result.__proto__; // result is null, but check type
    return proto === null;
}
export function ObjectProtoTest108(){
    const map = new Map().set('key', 'value');
    let contextProto;
    map.forEach(function() {
        contextProto = this.__proto__;
    }, {});
    return contextProto === Object.prototype;
}
export function ObjectProtoTest109(){
    const set = new Set([1]);
    const result = set.delete(1);
    const proto = result.__proto__;
    return proto === Boolean.prototype;
}
export function ObjectProtoTest110(){
    const wm = new WeakMap();
    const key = {};
    const result = wm.has(key);
    const proto = result.__proto__;
    return proto === Boolean.prototype;
}
export function ObjectProtoTest111(){
    const sym = Symbol('desc');
    const desc = sym.description;
    const proto = desc.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest112(){
    const err = new Error('test');
    const stack = err.stack;
    const proto = stack.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest113(){
    const buf = new ArrayBuffer(8);
    const length = buf.byteLength;
    const proto = length.__proto__;
    return proto === Number.prototype;
}
export function ObjectProtoTest114(){
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    const value = dv.getUint8(0);
    const proto = value.__proto__;
    return proto === Number.prototype;
}
export function ObjectProtoTest115(){
    function* gen() { try { yield; } catch (e) {} }
    const g = gen();
    g.next();
    const result = g.throw(new Error());
    const proto = result.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest116(){
    const promise = Promise.resolve().catch(() => {});
    const proto = promise.__proto__;
    return proto === Promise.prototype;
}
export function ObjectProtoTest117(){
    const promise = Promise.resolve().finally(() => {});
    const proto = promise.__proto__;
    return proto === Promise.prototype;
}
export function ObjectProtoTest118(){
    const keys = Object.keys({ a: 1 });
    const proto = keys.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest119(){
    const values = Object.values({ a: 1 });
    const proto = values.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest120(){
    const entries = Object.entries({ a: 1 });
    const proto = entries.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest121(){
    const desc = Reflect.getOwnPropertyDescriptor({ a: 1 }, 'a');
    const proto = desc.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest122(){
    const result = Math.abs(-123);
    const proto = result.__proto__;
    return proto === Number.prototype;
}
export function ObjectProtoTest123(){
    const obj = JSON.parse('{"a":1}');
    const proto = obj.__proto__;
    return proto === Object.prototype;
}
export function ObjectProtoTest124(){
    const str = JSON.stringify({ a: 1 });
    const proto = str.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest125(){
    const bigInt = BigInt(123456789);
    const str = bigInt.toString();
    const proto = str.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest126(){
    const arr = [1, [2, [3]]].flat(2);
    const proto = arr.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest127(){
    const filtered = [1, 2, 3].filter(x => x > 1);
    const proto = filtered.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest128(){
    const match = 'test'.match(/t/);
    const proto = match.__proto__;
    return proto === Array.prototype;
}
export function ObjectProtoTest129(){
    const replaced = 'test'.replace('t', 'T');
    const proto = replaced.__proto__;
    return proto === String.prototype;
}
export function ObjectProtoTest130(){
    const result = /t/.test('test');
    const proto = result.__proto__;
    return proto === Boolean.prototype;
}
export function ObjectProtoTest131(){
    const obj = {};
    const customProto = { foo: () => 'bar' };
    obj.__proto__ = customProto;
    return obj.foo();
}
export function ObjectProtoTest132(){
    const obj = {};
    obj.__proto__ = Array.prototype;
    obj.push(1, 2);
    return obj.length;
}
export function ObjectProtoTest133(){
    const obj = { a: 1 };
    obj.__proto__ = null;
    return obj.toString;
}
export function ObjectProtoTest134(){
    class Parent { parentMethod() { return 'parent'; } }
    class Child {}
    const child = new Child();
    child.__proto__ = Parent.prototype;
    return child.parentMethod();
}
export function ObjectProtoTest135(){
    'use strict';
    const obj = {};
    const newProto = { strict: true };
    obj.__proto__ = newProto;
    return obj.strict;
}
export function ObjectProtoTest136(){
    const arr = [1, 2];
    const newProto = { sum: function() { return this.reduce((a, b) => a + b, 0); } };
    arr.__proto__ = newProto;
    return arr.sum();
}
export function ObjectProtoTest137(){
    const level3 = { c: 3 };
    const level2 = { b: 2, __proto__: level3 };
    const level1 = { a: 1, __proto__: level2 };
    const obj = {};
    obj.__proto__ = level1;
    return [obj.a, obj.b, obj.c];
}
export function ObjectProtoTest138(){
    const obj = {};
    obj.__proto__ = Function.prototype;
    return typeof obj.apply;
}
export function ObjectProtoTest139(){
    const num = 123;
    num.__proto__ = String.prototype;
    return num.charAt(0);
}
export function ObjectProtoTest140(){
    const protoWithAccessor = {
        get value() { return this._value || 0; },
        set value(v) { this._value = v; }
    };
    const obj = {};
    obj.__proto__ = protoWithAccessor;
    obj.value = 10;
    return obj.value;
}
export function ObjectProtoTest141(){
    const map = new Map();
    const customMapProto = Object.create(Map.prototype);
    customMapProto.customGet = function(key) {
        return this.get(key) || 'default';
        }
    map.__proto__ = customMapProto;
    return map.customGet('nonexistent');
}
export async function ObjectProtoTest142(){
    const promise = Promise.resolve();
    const customPromiseProto = Object.create(Promise.prototype);
    customPromiseProto.log = function() { return this.then(v => { console.log(v); return v; }); }
    promise.__proto__ = customPromiseProto;
    let logged = false;
    console.log = () => { logged = true; };
    await promise.log();
    return logged;
}
export function ObjectProtoTest143(){
    const err = new Error();
    const customErrorProto = {
        ...Error.prototype,
        getDetails: function() { return this.message + ' details'; }
    };
    err.__proto__ = customErrorProto;
    err.message = 'test';
    return err.getDetails();
}
export function ObjectProtoTest144(){
    const obj = {};
    const proto1 = { a: 1 };
    const proto2 = { b: 2 };
    obj.__proto__ = proto1;
    obj.__proto__ = proto2;
    return [obj.a, obj.b];
}
export function ObjectProtoTest145(){
    class Original {}
    const instance = new Original();
    const newProto = { newMethod: () => 'new' };
    instance.__proto__ = newProto;
    return instance.newMethod();
}
export function ObjectProtoTest146(){
    const uint8 = new Uint8Array([1, 2, 3]);
    const customProto = Object.create(Uint8Array.prototype);
    customProto.sum = function() { return this.reduce((a, b) => a + b, 0); }
    uint8.__proto__ = customProto;
    return uint8.sum();
}
export function ObjectProtoTest147(){
    const target = {};
    const proxy = new Proxy(target, {});
    const proxyProto = { proxyMethod: () => true };
    proxy.__proto__ = proxyProto;
    return proxy.proxyMethod();
}
export function ObjectProtoTest148(){
    const grandparent = { greet: () => 'hello' };
    const parent = { __proto__: grandparent };
    const obj = {};
    obj.__proto__ = parent;
    return obj.greet();
}
export function ObjectProtoTest149(){
    function* gen() { yield 1; }
    const generator = gen();

    // 获取生成器实例的原型（即 Generator.prototype）
    const generatorProto = generator.__proto__;

    // 在原型上添加自定义方法
    generatorProto.logNext = function() {
        const res = this.next();
        console.log(res.value);
        return res;
    };

    let loggedValue;
    console.log = (v) => { loggedValue = v; };
    generator.logNext();
    return loggedValue;
}
export function ObjectProtoTest150(){
    const date = new Date();
    const customDateProto = Object.create(Date.prototype);
     customDateProto.getYearShort = function() { return this.getFullYear() % 100; }
    date.__proto__ = customDateProto;
    return date.getYearShort();
}
export function ObjectProtoTest151(){
    const sym = Symbol('test');
    const protoWithSym = { [sym]: 'symbol value' };
    const obj = {};
    obj.__proto__ = protoWithSym;
    return obj[sym];
}
export function ObjectProtoTest152(){
    const regex = /test/;
    const customRegexProto = Object.create(RegExp.prototype);
    customRegexProto.testOrNull = function(str) { return this.test(str) ? str : null; }
    regex.__proto__ = customRegexProto;
    return [regex.testOrNull('test'), regex.testOrNull('nope')];
}
export function ObjectProtoTest153(){
    const bool = new Boolean(true);
    const customBoolProto = {
        ...Boolean.prototype,
        toYesNo: function() { return this.valueOf() ? 'yes' : 'no'; }
    };
    bool.__proto__ = customBoolProto;
    return bool.toYesNo();
}
export function ObjectProtoTest154(){
    const buffer = new ArrayBuffer(8);
    const customBufferProto = Object.create(ArrayBuffer.prototype);
    customBufferProto.byteSize = function() { return this.byteLength; }
    buffer.__proto__ = customBufferProto;
    return buffer.byteSize();
}
export function ObjectProtoTest155(){
    const obj = { toString: () => 'original' };
    const newProto = { toString: () => 'overridden' };
    obj.__proto__ = newProto;
    return obj.toString();
}
export function ObjectProtoTest156(){
    const sym = Object(Symbol('test'));
    const customSymProto = Object.create(Symbol.prototype);
    customSymProto.getDesc = function() { return this.description; }
    sym.__proto__ = customSymProto;
    return sym.getDesc();
}
export function ObjectProtoTest157(){
    const wm = new WeakMap();
    const key = {};
    const customWMProto = Object.create(WeakMap.prototype);
    customWMProto.setIfNotExists = function(k, v) { if (!this.has(k)) this.set(k, v); return this; }
    wm.__proto__ = customWMProto;
    wm.setIfNotExists(key, 'value');
    expect(wm.get(key)).assertEqual('value');
    wm.setIfNotExists(key, 'new');
    return wm.get(key);
}
export async function ObjectProtoTest158(){
    const protoWithAsync = {
        async fetchData() { return 'data'; }
    };
    const obj = {};
    obj.__proto__ = protoWithAsync;
    const result = await obj.fetchData();
    return result;
}
export function ObjectProtoTest159(){
    const encoder = new TextEncoder();
    const customEncoderProto = {
        ...TextEncoder.prototype,
        encodeUpper: function(str) { return this.encode(str.toUpperCase()); }
    };
    encoder.__proto__ = customEncoderProto;
    const encoded = encoder.encodeUpper('test');
    return new TextEncoder().encode('TEST').toString() === encoded.toString();
}
export function ObjectProtoTest160(){
    const obj = {};
    obj.__proto__ = obj; // Create circular reference
    return obj.toString();
}
export function ObjectProtoTest161(){
    const num = new Number(10);
    const mathProto = {
        square: function() { return this * this; },
        cube: function() { return this * this * this; }
    };
    num.__proto__ = mathProto;
    return [num.square(), num.cube()];
}
export function ObjectProtoTest162(){
    const str = new String('test');
    const formatProto = {
        wrap: function(char) { return char + this + char; },
        toSnakeCase: function() { return this.toLowerCase().replace(/\s+/g, '_'); }
    };
    str.__proto__ = formatProto;
    return str.wrap('*');
}
export function ObjectProtoTest163(){
    const nested = { a: 1, b: { c: 2 } };
    const nestedProto = { getC: function() { return this.c; } };
    nested.b.__proto__ = nestedProto;
    return nested.b.getC();
}
export function ObjectProtoTest164(){
    const user = { age: 25 };
    const validationProto = {
        isAdult: function() { return this.age >= 18; },
        hasValidAge: function() { return this.age >= 0 && this.age <= 120; }
    };
    user.__proto__ = validationProto;
    return [user.isAdult(), user.hasValidAge()];
}
export function ObjectProtoTest165(){
    'use strict';
    const obj = Object.freeze({});
    const newProto = {};
    obj.__proto__ = newProto;
}
export function ObjectProtoTest166(){
    const obj = {};
    const newProto = { sealed: true };
    obj.__proto__ = newProto;

    Object.seal(obj);
    return obj.sealed;
}
export function ObjectProtoTest167(){
    const iterableProto = {
        *[Symbol.iterator]() { yield 1; yield 2; }
    };
    const obj = {};
    obj.__proto__ = iterableProto;
    const arr = [...obj];
    return arr;
}
export function ObjectProtoTest168(){
    const ws = new WeakSet();
    const key = {};
    const customWSProto = Object.create(WeakSet.prototype);
    customWSProto.addIfNotExists = function(k) { if (!this.has(k)) this.add(k); return this; }
    ws.__proto__ = customWSProto;
    ws.addIfNotExists(key);
    return ws.has(key);
}
export function ObjectProtoTest169(){
    const bigInt = Object(BigInt(1234567890123456789));
    const customBigIntProto = Object.create(BigInt.prototype);
    customBigIntProto.toK = function() { return ((this) / 1000n).toString() + 'k'; }
    bigInt.__proto__ = customBigIntProto;
    return bigInt.toK();
}
export function ObjectProtoTest170(){
    const num = new Number(1234);
    const formatProto = {
        withCommas: function() { return this.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); }
    };
    num.__proto__ = formatProto;
    return num.withCommas();
}
export function ObjectProtoTest171(){
    function testFunc() {}
    const funcProto = {
        ...Function.prototype,
        logCall: function() { console.log('called'); return this(); }
    };
    testFunc.__proto__ = funcProto;
    let logged = false;
    console.log = () => { logged = true; };
    testFunc.logCall();
    return logged;
}
export function ObjectProtoTest172(){
    const arr = [1, 2];
    const iterator = arr[Symbol.iterator]();

    const iterProto = iterator.__proto__;

    const customIterProto = Object.create(iterProto);

    customIterProto.nextWithLog = function() {
        const res = this.next();
        console.log(res.value);
        return res;
    };

    iterator.__proto__ = customIterProto;

    let loggedValues = [];
    console.log = (v) => loggedValues.push(v);

    iterator.nextWithLog();
    iterator.nextWithLog();
    return loggedValues;
}
export function ObjectProtoTest173(){
    const protoWithPrivate = {
        _secret: 'hidden',
        getSecret: function() { return this._secret; },
        setSecret: function(v) { this._secret = v; }
    };
    const obj = {};
    obj.__proto__ = protoWithPrivate;
    let result1 = obj.getSecret();
    obj.setSecret('new');
    let result2 = obj.getSecret();
    return [result1, result2];
}
export function ObjectProtoTest174(){
    const err = new TypeError();
    const customTypeErrorProto = {
        ...TypeError.prototype,
        getCode: function() { return 'TYPE_ERROR'; }
    };
    err.__proto__ = customTypeErrorProto;
    return err.getCode();
}
export function ObjectProtoTest175(){
    const fr = new FinalizationRegistry(() => {});
    const customFRProto = Object.create(FinalizationRegistry.prototype);
    customFRProto.registerWithLog = function(target, heldValue) {
            console.log('registered');
            this.register(target, heldValue);
        }
    fr.__proto__ = customFRProto;
    let logged = false;
    console.log = () => { logged = true; };
    fr.registerWithLog({}, 'value');
    return logged;
}
export function ObjectProtoTest176(){
    const target = {};
    const wr = new WeakRef(target);
    const customWRProto = Object.create(WeakRef.prototype);
    customWRProto.derefWithCheck = function() {
            const val = this.deref();
            return val ? val : 'expired';
        }
    wr.__proto__ = customWRProto;
    return wr.derefWithCheck() === target;
}
export function ObjectProtoTest177(){
    const map = new Map();
    map.set('a', 1);
    map.set('b', 2);
    const customMapProto = Object.create(Map.prototype);
    customMapProto.sumValues = function() {
            let sum = 0;
            for (const v of this.values()) sum += v;
            return sum;
        }
    map.__proto__ = customMapProto;
    return map.sumValues();
}
export function ObjectProtoTest178(){
    const collection = { items: [1, 2, 3] };
    const collectionProto = {
        getFirst: function() { return this.items[0]; },
        getLast: function() { return this.items[this.items.length - 1]; }
    };
    collection.__proto__ = collectionProto;
    return [collection.getFirst(), collection.getLast()];
}
export function ObjectProtoTest179(){
    const buf = new ArrayBuffer(8);
    const customBufProto = Object.create(ArrayBuffer.prototype);
    customBufProto.isEmpty = function() { return this.byteLength === 0; },
    customBufProto.doubleSize = function() { return new ArrayBuffer(this.byteLength * 2); }
    buf.__proto__ = customBufProto;
    return [buf.isEmpty(), buf.doubleSize().byteLength];
}
export function ObjectProtoTest180(){
    const match = /(\w+) (\w+)/.exec('John Doe');
    if (!match) {
        expect.fail('No match found');
        return;
    }
    const matchProto = {
        ...Array.prototype,
        getFullName: function() { return this[0]; },
        getFirstName: function() { return this[1]; },
        getLastName: function() { return this[2]; }
    };
    match.__proto__ = matchProto;
    return [match.getFirstName(), match.getLastName()];
}
export function ObjectProtoTest181(){
    const data = JSON.parse('{"name":"test","value":10}');
    const dataProto = {
        getInfo: function() { return `${this.name}: ${this.value}`; }
    };
    data.__proto__ = dataProto;
    return data.getInfo();
}
export function ObjectProtoTest182(){
    const name = 'test';
    const str = new String(`Hello ${name}`);
    const strProto = Object.create(String.prototype);
    strProto.shout = function() { return this.toUpperCase() + '!'; }
    str.__proto__ = strProto;
    return str.shout();
}
export function ObjectProtoTest183(){
    function getArgs() { return arguments; }
    const args = getArgs(1, 2, 3);
    const argsProto = {
        ...Object.prototype,
        sum: function() {
            return Array.from(this).reduce((a, b) => a + b, 0);
        }
    };
    args.__proto__ = argsProto;
    return args.sum();
}
export function ObjectProtoTest184(){
    class AppError extends Error {}
    const err = new AppError('Custom error');
    const customErrorProto = {
        ...AppError.prototype,
        getDetails: function() { return `AppError: ${this.message}`; }
    };
    err.__proto__ = customErrorProto;
    return err.getDetails();
}
export function ObjectProtoTest185(){
    const data = { values: [1, 2, 3] };
    const transformProto = {
        double: function() { return this.values.map(v => v * 2); },
        sum: function() { return this.values.reduce((a, b) => a + b, 0); }
    };
    data.__proto__ = transformProto;
    return [data.double(), data.sum()];
}
export function ObjectProtoTest186(){
    const set = new Set([1, 2, 3]);
    const customSetProto = Object.create(Set.prototype);
    customSetProto.hasEven = function() {
            for (const v of this) if (v % 2 === 0) return true;
            return false;
        },
    customSetProto.sum = function() {
            let sum = 0;
            for (const v of this) sum += v;
            return sum;
        }
    set.__proto__ = customSetProto;
    return [set.hasEven(), set.sum()];
}
export function ObjectProtoTest187(){
    const date = new Date(2024, 0, 15);
    const customDateProto = Object.create(Date.prototype);
    customDateProto.getYYYYMMDD = function() {
            return `${this.getFullYear()}-${String(this.getMonth() + 1).padStart(2, '0')}-${String(this.getDate()).padStart(2, '0')}`;
        }
    date.__proto__ = customDateProto;
    return date.getYYYYMMDD();
}
export function ObjectProtoTest188(){
    const arr = [1, 2, 3, 4];
    const aggregationProto = Object.create(Array.prototype);
    aggregationProto.product = function() { return this.reduce((a, b) => a * b, 1); },
    aggregationProto.average = function() { return this.reduce((a, b) => a + b, 0) / this.length; }
    arr.__proto__ = aggregationProto;
    return [arr.product(), arr.average()];
}
export async function ObjectProtoTest189(){
    const promise = Promise.resolve([1, 2, 3]);
    const customPromiseProto = Object.create(Promise.prototype);
    customPromiseProto.sum = async function() {
            const data = await this;
            return data.reduce((a, b) => a + b, 0);
        }
    promise.__proto__ = customPromiseProto;
    return await promise.sum();
}
export function ObjectProtoTest190(){
    const arr = Array.from([1, 2, 3]);
    const customArrProto = Object.create(Array.prototype);
    customArrProto.multiply = function(factor) { return this.map(x => x * factor); }
    arr.__proto__ = customArrProto;
    return arr.multiply(2);
}
export function ObjectProtoTest191(){
    const proto1 = { a: 1 };
    const proto2 = { b: 2, __proto__: null };
    proto1.__proto__ = proto2;
    const obj = { __proto__: proto1 };
    return [obj.a, obj.b, obj.toString];
}
export function ObjectProtoTest192(){
    'use strict';
    null.__proto__ = {};
}
export function ObjectProtoTest193(){
    'use strict';
    undefined.__proto__ = {};
}
export function ObjectProtoTest194(){
    const protoWithNull = { value: null, isNull: function() { return this.value === null; } };
    const obj = {};
    obj.__proto__ = protoWithNull;
    let result1 = obj.isNull();
    obj.value = 10;
    let result2 = obj.isNull();
    return [result1, result2];
}
export function ObjectProtoTest195(){
    const protoWithUndefined = { doNothing: function() {} }; // Implicitly returns undefined
    const obj = {};
    obj.__proto__ = protoWithUndefined;
    return obj.doNothing();
}
export function ObjectProtoTest196(){
    const bottomProto = { base: 'base', __proto__: null };
    const middleProto = { mid: 'mid', __proto__: bottomProto };
    const topProto = { top: 'top', __proto__: middleProto };
    const obj = { __proto__: topProto };
    return [obj.top, obj.mid, obj.base, obj.toString];
}
export function ObjectProtoTest197(){
    const obj = { prop: undefined };
    const proto = { prop: 'proto', getProp: function() { return this.prop; } };
    obj.__proto__ = proto;
    return obj.getProp();
}
export function ObjectProtoTest198(){
    const nullCheckProto = {
        isNull: function() { return this === null; },
        isUndefined: function() { return this === undefined; }
    };
    const obj = {};
    obj.__proto__ = nullCheckProto;
    return [obj.isNull(), obj.isUndefined()];
}
export function ObjectProtoTest199(){
    const nullWrapper = { value: null };
    const wrapperProto = {
        getValueOrFallback: function(fallback) { return this.value ?? fallback; }
    };
    nullWrapper.__proto__ = wrapperProto;
    return nullWrapper.getValueOrFallback('fallback');
}
export function ObjectProtoTest200(){
    const undefinedWrapper = { value: undefined };
    const wrapperProto = {
        getValueOrFallback: function(fallback) { return this.value ?? fallback; }
    };
    undefinedWrapper.__proto__ = wrapperProto;
    return undefinedWrapper.getValueOrFallback('fallback');
}
export function ObjectProtoTest201(){
    const safeProto = {
        safeGet: function(key) {
            if (this === null || this === undefined) return undefined;
            return this[key];
        }
    };
    const obj = { a: 1 };
    obj.__proto__ = safeProto;
    return [obj.safeGet('a'), obj.safeGet('b')];
}
export function ObjectProtoTest202(){
    const obj = {};
    const proto = { method: () => 'works' };
    obj.__proto__ = proto;
    let result1 = obj.method();
    obj.__proto__ = null;
    let result2 = obj.method;

    return [result1, result2];
}
export function ObjectProtoTest203(){
    const topProto = { a: 1 };
    const middleProto = { __proto__: null };
    topProto.__proto__ = middleProto;
    const obj = { __proto__: topProto };

    return [obj.a, obj.b];
}
export function ObjectProtoTest204(){
    const protoWithUndefined = { undefinedProp: undefined };
    const obj = {};
    obj.__proto__ = protoWithUndefined;

    return [obj.undefinedProp, 'undefinedProp' in obj];
}
export function ObjectProtoTest205(){
    const obj = {}; // No prototype
    const newProto = { method: () => 'added' };
    obj.__proto__ = newProto;

    return obj.method();
}
export function ObjectProtoTest206(){
    const obj = {};
    obj.__proto__ = null; // Valid null assignment
    let result1 = obj.toString;
    obj.__proto__ = 123; // Should be ignored in non-strict mode
    let result2 = obj.__proto__;

    return [result1, result2];
}
export function ObjectProtoTest207(){
    'use strict';
    const obj = {};
    obj.__proto__ = 123; // Primitive value
    return obj.toString();
}
export function ObjectProtoTest208(){
    const validationProto = {
        isNullOrUndefined: function() {
            return this === null || this === undefined;
        },
        safeValue: function(defaultVal) {
            return this.isNullOrUndefined() ? defaultVal : this;
        }
    };

    const obj = {};
    obj.__proto__ = validationProto;
    return [obj.isNullOrUndefined(), obj.safeValue('default') === obj];
}
export function ObjectProtoTest209(){
    const arr = [1, null, 3, undefined, 5];
    const arrayProto = Object.create(Array.prototype);
    arrayProto.countNullish = function() {
            return this.filter(x => x === null || x === undefined).length;
        }
    arr.__proto__ = arrayProto;
    return arr.countNullish();
}
export function ObjectProtoTest210(){
    function testFunc() {}
    const nullProto = Object.create(null);
    nullProto.customMethod = function() { return 'custom'; };
    testFunc.__proto__ = nullProto;
    return [testFunc.customMethod(), testFunc.call];
}
export function ObjectProtoTest211(){
    const proto1 = { a: 1 };
    const proto2 = { b: 2, __proto__: null }; // Using null instead of undefined
    proto1.__proto__ = proto2;
    const obj = { __proto__: proto1 };
    return [obj.a, obj.b, obj.toString];
}
export function ObjectProtoTest212(){
    const obj = { ownProp: 1 };
    obj.__proto__ = null;
    return ['ownProp' in obj, 'toString' in obj, '__proto__' in obj];
}
export function ObjectProtoTest213(){
    const protoWithNullReturn = {
        getNull: function() { return null; },
        checkNull: function() { return this.getNull() === null; }
    };
    const obj = {};
    obj.__proto__ = protoWithNullReturn;
    return [obj.getNull(), obj.checkNull()];
}
export function ObjectProtoTest214(){
    const map = new Map();
    map.set(null, 'null value');
    map.set(undefined, 'undefined value');
    const mapProto = Object.create(Map.prototype);
    mapProto.getNullValue = function() { return this.get(null); },
    mapProto.getUndefinedValue = function() { return this.get(undefined); }
    map.__proto__ = mapProto;
    return [map.getNullValue(), map.getUndefinedValue()];
}
export function ObjectProtoTest215(){
    const obj = { data: null };
    const proto = {
        isDataNull: function() { return this.data === null; },
        clearData: function() { this.data = null; }
    };
    obj.__proto__ = proto;

    let result1 = obj.isDataNull();
    obj.data = 'value';
    let result2 = obj.isDataNull();
    obj.clearData();
    let result3 = obj.isDataNull();
    return [result1, result2, result3];
}
export function ObjectProtoTest216(){
    const err = new Error(null); // Error message can be null
    const errorProto = {
        ...Error.prototype,
        hasNullMessage: function() { return this.message === 'null'; }
    };
    err.__proto__ = errorProto;
    return err.hasNullMessage();
}
export function ObjectProtoTest217(){
    const obj = { a: 1, b: null };
    obj.__proto__ = { c: 2 };

    let result1 = JSON.stringify(obj);

    obj.__proto__ = null;
    let result2 = JSON.stringify(obj);
    return [result1, result2];
}
export function ObjectProtoTest218(){
    const arr = [1, 2, 3];
    const nullProto = Object.create(null);
    nullProto.customPush = function(val) { this[this.length] = val; return this.length; };

    arr.__proto__ = nullProto;
    return [arr.customPush(4), arr[3], arr.push];
}
export function ObjectProtoTest219(){
    const proto = {
        process: function(value) {
            if (value === null || value === undefined) return undefined;
            return value * 2;
        }
    };
    const obj = {};
    obj.__proto__ = proto;
    return [obj.process(null), obj.process(undefined), obj.process(5)];
}
export function ObjectProtoTest220(){
    const grandparent = { g: 'g', __proto__: null };
    const parent = { p: 'p', __proto__: grandparent };
    const child = { c: 'c', __proto__: parent };
    const obj = { __proto__: child };
    return [obj.c, obj.p, obj.g, obj.x, obj.toString];
}
export function ObjectProtoTest221(){
    const obj = { nested: { prop: undefined } };
    const proto = {
        getNested: function() { return this.nested?.prop; },
        isNestedUndefined: function() { return this.getNested() === undefined; }
    };
    obj.__proto__ = proto;
    return [obj.getNested(), obj.isNestedUndefined()];
}
export function ObjectProtoTest222(){
    const proto = {
        getValue: function() { return this.value; },
        getValueOrDefault: function(defaultVal) { return this.getValue() ?? defaultVal; }
    };

    const obj1 = { value: null, __proto__: proto };
    const obj2 = { value: undefined, __proto__: proto };
    const obj3 = { value: 10, __proto__: proto };
    return [obj1.getValueOrDefault(5), obj2.getValueOrDefault(5), obj3.getValueOrDefault(5)];
}
