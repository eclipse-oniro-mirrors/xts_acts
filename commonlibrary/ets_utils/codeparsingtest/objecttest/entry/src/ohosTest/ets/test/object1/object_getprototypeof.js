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

export function ObjectGetPrototypeOfTest001(){
    const obj = { name: 'test' };
    const proto = Object.getPrototypeOf(obj);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest002(){
    const arr = [1, 2, 3];
    const proto = Object.getPrototypeOf(arr);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest003(){
    function Foo() {}
    const instance = new Foo();
    const proto = Object.getPrototypeOf(instance);
    return proto === Foo.prototype;
}
export function ObjectGetPrototypeOfTest004(){
    const obj = Object.create(null);
    const proto = Object.getPrototypeOf(obj);
    return proto === null;
}
export function ObjectGetPrototypeOfTest005(){
    const numProto = Object.getPrototypeOf(1);

    const strProto = Object.getPrototypeOf('hello');
    return [numProto === Number.prototype, strProto === String.prototype];
}
export function ObjectGetPrototypeOfTest006(){
    class Bar {}
    const instance = new Bar();
    const proto = Object.getPrototypeOf(instance);
    return proto === Bar.prototype;
}
export function ObjectGetPrototypeOfTest007(){
    class Parent {}
    class Child extends Parent {}
    const childInstance = new Child();
    const childProto = Object.getPrototypeOf(childInstance);

    const parentProto = Object.getPrototypeOf(Child.prototype);
    return [childProto === Child.prototype, parentProto === Parent.prototype];
}
export function ObjectGetPrototypeOfTest008(){
    Object.getPrototypeOf(null);
}
export function ObjectGetPrototypeOfTest009(){
    Object.getPrototypeOf(undefined);
}
export function ObjectGetPrototypeOfTest010(){
    function testFunc() {}
    const proto = Object.getPrototypeOf(testFunc);
    return proto === Function.prototype;
}
export function ObjectGetPrototypeOfTest011(){
    const date = new Date();
    const proto = Object.getPrototypeOf(date);
    return proto === Date.prototype;
}
export function ObjectGetPrototypeOfTest012(){
    const reg = /test/;
    const proto = Object.getPrototypeOf(reg);
    return proto === RegExp.prototype;
}
export function ObjectGetPrototypeOfTest013(){
    const map = new Map();
    const proto = Object.getPrototypeOf(map);
    return proto === Map.prototype;
}
export function ObjectGetPrototypeOfTest014(){
    const set = new Set();
    const proto = Object.getPrototypeOf(set);
    return proto === Set.prototype;
}
export function ObjectGetPrototypeOfTest015(){
    const target = {};
    const proxy = new Proxy(target, {});
    const proto = Object.getPrototypeOf(proxy);
    return proto === Object.getPrototypeOf(target);
}
export function ObjectGetPrototypeOfTest016(){
    const promise = Promise.resolve();
    const proto = Object.getPrototypeOf(promise);
    return proto === Promise.prototype;
}
export function ObjectGetPrototypeOfTest017(){
    const bool = new Boolean(true);
    const proto = Object.getPrototypeOf(bool);
    return proto === Boolean.prototype;
}
export function ObjectGetPrototypeOfTest018(){
    const sym = Object(Symbol('test'));
    const proto = Object.getPrototypeOf(sym);
    return proto === Symbol.prototype;
}
export function ObjectGetPrototypeOfTest019(){
    const err = new Error('test');
    const proto = Object.getPrototypeOf(err);
    return proto === Error.prototype;
}
export function ObjectGetPrototypeOfTest020(){
    const err = new TypeError('test');
    const proto = Object.getPrototypeOf(err);
    return proto === TypeError.prototype;
}
export function ObjectGetPrototypeOfTest021(){
    const buf = new ArrayBuffer(8);
    const proto = Object.getPrototypeOf(buf);
    return proto === ArrayBuffer.prototype;
}
export function ObjectGetPrototypeOfTest022(){
    const arr = new Uint8Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === Uint8Array.prototype;
}
export function ObjectGetPrototypeOfTest023(){
    const proto = Object.getPrototypeOf(Function.prototype);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest024(){
    const proto = Object.getPrototypeOf(Object.prototype);
    return proto === null;
}
export function ObjectGetPrototypeOfTest025(){
    class Parent {}
    class Child extends Parent {}
    const proto = Object.getPrototypeOf(Child.prototype);
    return proto === Parent.prototype;
}
export function ObjectGetPrototypeOfTest026(){
    function func() {}
    const boundFunc = func.bind(null);
    const proto = Object.getPrototypeOf(boundFunc);
    return proto === Function.prototype;
}
export function ObjectGetPrototypeOfTest027(){
    const arrowFunc = () => {};
    const proto = Object.getPrototypeOf(arrowFunc);
    return proto === Function.prototype;
}
export function ObjectGetPrototypeOfTest028(){
    const Foo = class {};
    const instance = new Foo();
    const proto = Object.getPrototypeOf(instance);
    return proto === Foo.prototype;
}
export function ObjectGetPrototypeOfTest029(){
    const Foo = class {};
    const instance = new Foo();
    const proto = Object.getPrototypeOf(instance);
    return proto === Foo.prototype;
}
export function ObjectGetPrototypeOfTest030(){
    function* genFunc() {}
    const genInstance = genFunc();
    const proto = Object.getPrototypeOf(genInstance);
    return typeof proto.next === 'function';
}
export function ObjectGetPrototypeOfTest031(){
    const weakMap = new WeakMap();
    const proto = Object.getPrototypeOf(weakMap);
    return proto === WeakMap.prototype;
}
export function ObjectGetPrototypeOfTest032(){
    const weakSet = new WeakSet();
    const proto = Object.getPrototypeOf(weakSet);
    return proto === WeakSet.prototype;
}
export function ObjectGetPrototypeOfTest033(){
    const buf = new ArrayBuffer(8);
    const dataView = new DataView(buf);
    const proto = Object.getPrototypeOf(dataView);
    return proto === DataView.prototype;
}
export function ObjectGetPrototypeOfTest034(){
    const err = new URIError('test');
    const proto = Object.getPrototypeOf(err);
    return proto === URIError.prototype;
}
export function ObjectGetPrototypeOfTest035(){
    const err = new RangeError('test');
    const proto = Object.getPrototypeOf(err);
    return proto === RangeError.prototype;
}
export function ObjectGetPrototypeOfTest036(){
    const err = new EvalError('test');
    const proto = Object.getPrototypeOf(err);
    return proto === EvalError.prototype;
}
export function ObjectGetPrototypeOfTest037(){
    const err = new ReferenceError('test');
    const proto = Object.getPrototypeOf(err);
    return proto === ReferenceError.prototype;
}
export function ObjectGetPrototypeOfTest038(){
    const err = new SyntaxError('test');
    const proto = Object.getPrototypeOf(err);
    return proto === SyntaxError.prototype;
}
export function ObjectGetPrototypeOfTest039(){
    const arr = new Float64Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === Float64Array.prototype;
}
export function ObjectGetPrototypeOfTest040(){
    const arr = new Int32Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === Int32Array.prototype;
}
export function ObjectGetPrototypeOfTest041(){
    const arr = new Int16Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === Int16Array.prototype;
}
export function ObjectGetPrototypeOfTest042(){
    const arr = new Int8Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === Int8Array.prototype;
}
export function ObjectGetPrototypeOfTest043(){
    const arr = new Uint32Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === Uint32Array.prototype;
}
export function ObjectGetPrototypeOfTest044(){
    const arr = new Uint16Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === Uint16Array.prototype;
}
export function ObjectGetPrototypeOfTest045(){
    const arr = new Float32Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === Float32Array.prototype;
}
export function ObjectGetPrototypeOfTest046(){
    const bigInt = Object(BigInt(123));
    const proto = Object.getPrototypeOf(bigInt);
    return proto === BigInt.prototype;
}
export function ObjectGetPrototypeOfTest047(){
    const arr = new BigInt64Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === BigInt64Array.prototype;
}
export function ObjectGetPrototypeOfTest048(){
    const arr = new BigUint64Array(8);
    const proto = Object.getPrototypeOf(arr);
    return proto === BigUint64Array.prototype;
}
export function ObjectGetPrototypeOfTest049(){
    const dtf = new Intl.DateTimeFormat();
    const proto = Object.getPrototypeOf(dtf);
    return proto === Intl.DateTimeFormat.prototype;
}
export function ObjectGetPrototypeOfTest050(){
    const nf = new Intl.NumberFormat();
    const proto = Object.getPrototypeOf(nf);
    return proto === Intl.NumberFormat.prototype;
}
export function ObjectGetPrototypeOfTest051(){
    const collator = new Intl.Collator();
    const proto = Object.getPrototypeOf(collator);
    return proto === Intl.Collator.prototype;
}
export function ObjectGetPrototypeOfTest052(){
    const target = {};
    const weakRef = new WeakRef(target);
    const proto = Object.getPrototypeOf(weakRef);
    return proto === WeakRef.prototype;
}
export function ObjectGetPrototypeOfTest053(){
    const fr = new FinalizationRegistry(() => {});
    const proto = Object.getPrototypeOf(fr);
    return proto === FinalizationRegistry.prototype;
}
export function ObjectGetPrototypeOfTest054(){
    const buf = new ArrayBuffer(8);
    const transferred = ArrayBuffer.transfer(buf, 16);
    const proto = Object.getPrototypeOf(transferred);
    return proto === ArrayBuffer.prototype;
}
export function ObjectGetPrototypeOfTest055(){
    const reg = /test/;
    const result = reg.exec('test');
    const proto = Object.getPrototypeOf(result);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest056(){
    const rawStr = String.raw`test`;
    const proto = Object.getPrototypeOf(rawStr);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest057(){
    const num = Object(Number.EPSILON);
    const proto = Object.getPrototypeOf(num);
    return proto === Number.prototype;
}
export function ObjectGetPrototypeOfTest058(){
    const proto = Object.getPrototypeOf(Math);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest059(){
    const proto = Object.getPrototypeOf(JSON);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest060(){
    function getArgs() { return arguments; }
    const args = getArgs(1, 2, 3);
    const proto = Object.getPrototypeOf(args);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest061(){
    const err = new DOMException('test');
    const proto = Object.getPrototypeOf(err);
    return proto === DOMException.prototype;
}
export function ObjectGetPrototypeOfTest062(){
    const url = new URL('https://example.com');
    const proto = Object.getPrototypeOf(url);
    return proto === URL.prototype;
}
export function ObjectGetPrototypeOfTest063(){
    const params = new URLSearchParams('a=1&b=2');
    const proto = Object.getPrototypeOf(params);
    return proto === URLSearchParams.prototype;
}
export function ObjectGetPrototypeOfTest064(){
    const encoder = new TextEncoder();
    const proto = Object.getPrototypeOf(encoder);
    return proto === TextEncoder.prototype;
}
export function ObjectGetPrototypeOfTest065(){
    const decoder = new TextDecoder();
    const proto = Object.getPrototypeOf(decoder);
    return proto === TextDecoder.prototype;
}
export function ObjectGetPrototypeOfTest066(){
    const buf = new ArrayBuffer(8);
    const sliced = buf.slice(2);
    const proto = Object.getPrototypeOf(sliced);
    return proto === ArrayBuffer.prototype;
}
export function ObjectGetPrototypeOfTest067(){
    const map = new Map();
    const iterator = map.entries();
    const proto = Object.getPrototypeOf(iterator);
    return typeof proto.next === 'function';
}
export function ObjectGetPrototypeOfTest068(){
    const set = new Set();
    const iterator = set.values();
    const proto = Object.getPrototypeOf(iterator);
    return typeof proto.next === 'function';
}
export function ObjectGetPrototypeOfTest069(){
    const str = 'test';
    const iterator = str[Symbol.iterator]();
    const proto = Object.getPrototypeOf(iterator);
    return typeof proto.next === 'function';
}
export function ObjectGetPrototypeOfTest070(){
    const arr = [1, 2, 3];
    const iterator = arr[Symbol.iterator]();
    const proto = Object.getPrototypeOf(iterator);
    return typeof proto.next === 'function';
}
export function ObjectGetPrototypeOfTest071(){
    const locale = new Intl.Locale('en-US');
    const proto = Object.getPrototypeOf(locale);
    return proto === Intl.Locale.prototype;
}
export function ObjectGetPrototypeOfTest072(){
    const pluralRules = new Intl.PluralRules();
    const proto = Object.getPrototypeOf(pluralRules);
    return proto === Intl.PluralRules.prototype;
}
export function ObjectGetPrototypeOfTest073(){
    const rtf = new Intl.RelativeTimeFormat();
    const proto = Object.getPrototypeOf(rtf);
    return proto === Intl.RelativeTimeFormat.prototype;
}
export function ObjectGetPrototypeOfTest074(){
    const lf = new Intl.ListFormat();
    const proto = Object.getPrototypeOf(lf);
    return proto === Intl.ListFormat.prototype;
}
export function ObjectGetPrototypeOfTest075(){
    const dtf = new Intl.DateTimeFormat();
    const parts = dtf.formatToParts(new Date());
    const proto = Object.getPrototypeOf(parts);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest076(){
    const view = new Uint8Array();
    const proto = Object.getPrototypeOf(view);
    return proto === Uint8Array.prototype;
}
export function ObjectGetPrototypeOfTest077(){
    const iteratorFunc = [][Symbol.iterator];
    const proto = Object.getPrototypeOf(iteratorFunc);
    return proto === Function.prototype;
}
export function ObjectGetPrototypeOfTest078(){
    const promise = Promise.all([]);
    const proto = Object.getPrototypeOf(promise);
    return proto === Promise.prototype;
}
export function ObjectGetPrototypeOfTest079(){
    const promise = Promise.race([]);
    const proto = Object.getPrototypeOf(promise);
    return proto === Promise.prototype;
}
export function ObjectGetPrototypeOfTest080(){
    const err = new Error();
    const proto = Object.getPrototypeOf(err);
    return proto === Error.prototype;
}
export function ObjectGetPrototypeOfTest081(){
    const num = Object(Number.isFinite(Infinity) ? 0 : 1);
    const proto = Object.getPrototypeOf(num);
    return proto === Number.prototype;
}
export function ObjectGetPrototypeOfTest082(){
    const str = String.fromCharCode(65);
    const proto = Object.getPrototypeOf(str);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest083(){
    const arr = Array.from([1, 2, 3]);
    const proto = Object.getPrototypeOf(arr);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest084(){
    const arr = Array.of(1, 2, 3);
    const proto = Object.getPrototypeOf(arr);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest085(){
    const map = new Map();
    const iterator = map.entries();
    const proto = Object.getPrototypeOf(iterator);
    return typeof proto.next === 'function';
}
export function ObjectGetPrototypeOfTest086(){
    const set = new Set();
    const iterator = set.keys();
    const proto = Object.getPrototypeOf(iterator);
    return typeof proto.next === 'function';
}
export function ObjectGetPrototypeOfTest087(){
    function* gen() { yield 1; }
    const result = gen().next();
    const proto = Object.getPrototypeOf(result);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest088(){
    const customProto = {};
    const obj = Object.create(customProto);
    const proto = Object.getPrototypeOf(obj);
    return proto === customProto;
}
export function ObjectGetPrototypeOfTest089(){
    const obj = Object.freeze({});
    const proto = Object.getPrototypeOf(obj);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest090(){
    const obj = Object.seal({});
    const proto = Object.getPrototypeOf(obj);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest091(){
    const obj = Object.preventExtensions({});
    const proto = Object.getPrototypeOf(obj);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest092(){
    class Foo {}
    const instance = Reflect.construct(Foo, []);
    const proto = Object.getPrototypeOf(instance);
    return proto === Foo.prototype;
}
export function ObjectGetPrototypeOfTest093(){
    const target = () => ({ a: 1 });
    const proxy = new Proxy(target, { apply: (t) => t() });
    const result = proxy();
    const proto = Object.getPrototypeOf(result);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest094(){
    const obj = { [Symbol.toStringTag]: 'Test' };
    const proto = Object.getPrototypeOf(obj);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest095(){
    /test/.exec('test');
    const lastMatch = RegExp.lastMatch;
    const proto = Object.getPrototypeOf(lastMatch);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest096(){
    const arr = [1].concat([2]);
    const proto = Object.getPrototypeOf(arr);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest097(){
    const parts = 'a,b,c'.split(',');
    const proto = Object.getPrototypeOf(parts);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest098(){
    const map = new Map().set('key', 'value');
    const value = map.get('key');
    const proto = Object.getPrototypeOf(value);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest099(){
    const set = new Set();
    const iterator = set.values();
    const proto = Object.getPrototypeOf(iterator);
    return proto === Set.prototype.values.prototype;
}
export function ObjectGetPrototypeOfTest100(){
    const key = {};
    const value = { prop: 1 };
    const wm = new WeakMap().set(key, value);
    const result = wm.get(key);
    const proto = Object.getPrototypeOf(result);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest101(){
    const nf = new Intl.NumberFormat();
    const parts = nf.formatToParts(123);
    const proto = Object.getPrototypeOf(parts);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest102(){
    function original(a, b) { return a + b; }
    const bound = original.bind(null, 1);
    const proto = Object.getPrototypeOf(bound);
    return proto === Function.prototype;
}
export function ObjectGetPrototypeOfTest103(){
    const arr = [1, 2, 3].slice(1);
    const proto = Object.getPrototypeOf(arr);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest104(){
    const str = 'hello'.substring(1);
    const proto = Object.getPrototypeOf(str);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest105(){
    const numStr = (123.45).toFixed(1);
    const proto = Object.getPrototypeOf(numStr);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest106(){
    const dateStr = new Date().toISOString();
    const proto = Object.getPrototypeOf(dateStr);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest107(){
    const result = /a/.exec('b');
    const proto = Object.getPrototypeOf(result); // result is null, but check type
    return proto === null;
}
export function ObjectGetPrototypeOfTest108(){
    const map = new Map().set('key', 'value');
    let contextProto;
    map.forEach(function() {
        contextProto = Object.getPrototypeOf(this);
    }, {});
    return contextProto === Object.prototype;
}
export function ObjectGetPrototypeOfTest109(){
    const set = new Set([1]);
    const result = set.delete(1);
    const proto = Object.getPrototypeOf(result);
    return proto === Boolean.prototype;
}
export function ObjectGetPrototypeOfTest110(){
    const wm = new WeakMap();
    const key = {};
    const result = wm.has(key);
    const proto = Object.getPrototypeOf(result);
    return proto === Boolean.prototype;
}
export function ObjectGetPrototypeOfTest111(){
    const sym = Symbol('desc');
    const desc = sym.description;
    const proto = Object.getPrototypeOf(desc);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest112(){
    const err = new Error('test');
    const stack = err.stack;
    const proto = Object.getPrototypeOf(stack);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest113(){
    const buf = new ArrayBuffer(8);
    const length = buf.byteLength;
    const proto = Object.getPrototypeOf(length);
    return proto === Number.prototype;
}
export function ObjectGetPrototypeOfTest114(){
    const buf = new ArrayBuffer(8);
    const dv = new DataView(buf);
    const value = dv.getUint8(0);
    const proto = Object.getPrototypeOf(value);
    return proto === Number.prototype;
}
export function ObjectGetPrototypeOfTest115(){
    function* gen() { try { yield; } catch (e) {} }
    const g = gen();
    g.next();
    const result = g.throw(new Error());
    const proto = Object.getPrototypeOf(result);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest116(){
    const promise = Promise.resolve().catch(() => {});
    const proto = Object.getPrototypeOf(promise);
    return proto === Promise.prototype;
}
export function ObjectGetPrototypeOfTest117(){
    const promise = Promise.resolve().finally(() => {});
    const proto = Object.getPrototypeOf(promise);
    return proto === Promise.prototype;
}
export function ObjectGetPrototypeOfTest118(){
    const keys = Object.keys({ a: 1 });
    const proto = Object.getPrototypeOf(keys);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest119(){
    const values = Object.values({ a: 1 });
    const proto = Object.getPrototypeOf(values);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest120(){
    const entries = Object.entries({ a: 1 });
    const proto = Object.getPrototypeOf(entries);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest121(){
    const desc = Reflect.getOwnPropertyDescriptor({ a: 1 }, 'a');
    const proto = Object.getPrototypeOf(desc);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest122(){
    const result = Math.abs(-123);
    const proto = Object.getPrototypeOf(result);
    return proto === Number.prototype;
}
export function ObjectGetPrototypeOfTest123(){
    const obj = JSON.parse('{"a":1}');
    const proto = Object.getPrototypeOf(obj);
    return proto === Object.prototype;
}
export function ObjectGetPrototypeOfTest124(){
    const str = JSON.stringify({ a: 1 });
    const proto = Object.getPrototypeOf(str);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest125(){
    const bigInt = BigInt(123456789);
    const str = bigInt.toString();
    const proto = Object.getPrototypeOf(str);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest126(){
    const arr = [1, [2, [3]]].flat(2);
    const proto = Object.getPrototypeOf(arr);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest127(){
    const filtered = [1, 2, 3].filter(x => x > 1);
    const proto = Object.getPrototypeOf(filtered);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest128(){
    const match = 'test'.match(/t/);
    const proto = Object.getPrototypeOf(match);
    return proto === Array.prototype;
}
export function ObjectGetPrototypeOfTest129(){
    const replaced = 'test'.replace('t', 'T');
    const proto = Object.getPrototypeOf(replaced);
    return proto === String.prototype;
}
export function ObjectGetPrototypeOfTest130(){
    const result = /t/.test('test');
    const proto = Object.getPrototypeOf(result);
    return proto === Boolean.prototype;
}
