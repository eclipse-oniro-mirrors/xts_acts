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

export function ObjectSetProtoTest001() {
    const result = [];
    const obj = {};
    const customProto = { a: 1 };
    Object.setPrototypeOf(obj, customProto);
    result.push(Object.getPrototypeOf(obj) === customProto);
    result.push(obj.a === 1);
    return result;
}

export function ObjectSetProtoTest002() {
    const result = [];
    const obj = {};
    Object.setPrototypeOf(obj, Array.prototype);
    obj.push(2);
    result.push(obj.length === 1);
    result.push(Array.isArray(obj) === true);
    return result;
}

export function ObjectSetProtoTest003() {
    const result = [];
    const obj = { b: 3 };
    Object.setPrototypeOf(obj, null);
    result.push(Object.getPrototypeOf(obj) === null);
    result.push(obj.toString === undefined);
    return result;
}

export function ObjectSetProtoTest004() {
    const result = [];
    const level3 = { c: 3 };
    const level2 = { b: 2 };
    const level1 = { a: 1 };
    Object.setPrototypeOf(level2, level3);
    Object.setPrototypeOf(level1, level2);
    const obj = {};
    Object.setPrototypeOf(obj, level1);
    result.push(obj.a === 1);
    result.push(obj.b === 2);
    result.push(obj.c === 3);
    return result;
}

export function ObjectSetProtoTest005() {
    const result = [];

    class OldClass {
    }

    class NewClass {
        newMethod() {
            return 'new';
        }
    }

    const instance = new OldClass();
    Object.setPrototypeOf(instance, NewClass.prototype);
    result.push(instance.newMethod() === 'new');
    return result;
}

export function ObjectSetProtoTest006() {
    const result = [];
    let errorThrown = false;
    try {
        Object.setPrototypeOf(null, {});
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest007() {
    const result = [];
    let errorThrown = false;
    try {
        Object.setPrototypeOf(undefined, {});
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest008() {
    const result = [];
    'use strict';
    const obj = {};
    let errorThrown = false;
    try {
        Object.setPrototypeOf(obj, 123);
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest009() {
    const result = [];
    'use strict';
    const obj = {};
    let errorThrown = false;
    try {
        Object.setPrototypeOf(obj, 'string');
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest010() {
    const result = [];
    'use strict';
    const obj = {};
    let errorThrown = false;
    try {
        Object.setPrototypeOf(obj, true);
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest011() {
    const result = [];
    'use strict';
    const obj = Object.freeze({});
    let errorThrown = false;
    try {
        Object.setPrototypeOf(obj, {});
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest012() {
    const result = [];
    const newProto = { sealed: true };
    const obj = {};
    Object.setPrototypeOf(obj, newProto);
    Object.seal(obj);
    result.push(Object.getPrototypeOf(obj) === newProto);
    result.push(obj.sealed === true);
    return result;
}

export function ObjectSetProtoTest013() {
    const result = [];
    const obj = {};
    let errorThrown = false;
    try {
        Object.setPrototypeOf(obj, obj);
    } catch (e) {
        errorThrown = e instanceof RangeError || e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest014() {
    const result = [];
    const newProto = { nonExtensible: true };
    const obj = Object.create(newProto);
    Object.preventExtensions(obj);
    Object.setPrototypeOf(obj, newProto);
    result.push(Object.getPrototypeOf(obj) === newProto);
    return result;
}

export function ObjectSetProtoTest015() {
    const result = [];
    const arr = [1, 2];
    const customProto = Object.create(Array.prototype);
    customProto.sum = function () {
            return this.reduce((a, b) => a + b, 0);
        }
    Object.setPrototypeOf(arr, customProto);
    result.push(arr.sum() === 3);
    return result;
}

export function ObjectSetProtoTest016() {
    const result = [];
    const obj1 = {};
    const obj2 = {};
    const newProto = { consistent: true };
    Object.setPrototypeOf(obj1, newProto);
    obj2.__proto__ = newProto;
    result.push(Object.getPrototypeOf(obj1) === Object.getPrototypeOf(obj2));
    return result;
}

export function ObjectSetProtoTest017() {
    const result = [];
    const obj = {};
    const proto1 = { x: 1 };
    const proto2 = { x: 2 };
    Object.setPrototypeOf(obj, proto1);
    result.push(Object.getPrototypeOf(obj) === proto1);
    Object.setPrototypeOf(obj, proto2);
    result.push(Object.getPrototypeOf(obj) === proto2);
    return result;
}

export function ObjectSetProtoTest018() {
    const result = [];
    const obj = {};
    obj.__proto__ = { old: true };
    const newProto = { new: true };
    Object.setPrototypeOf(obj, newProto);
    result.push(obj.old === undefined);
    result.push(obj.new === true);
    return result;
}

export function ObjectSetProtoTest019() {
    const result = [];
    const obj = {};
    Object.setPrototypeOf(obj, null);
    Object.setPrototypeOf(obj, Object.prototype);
    result.push(obj.toString() === '[object Object]');
    return result;
}

export function ObjectSetProtoTest020() {
    const result = [];
    const parent = { p: 10 };
    const child = { c: 20 };
    Object.setPrototypeOf(child, parent);
    const grandchild = { g: 30 };
    Object.setPrototypeOf(grandchild, child);
    result.push(Object.getPrototypeOf(grandchild) === child);
    result.push(Object.getPrototypeOf(Object.getPrototypeOf(grandchild)) === parent);
    return result;
}

export function ObjectSetProtoTest021() {
    const result = [];
    const target = {};
    const proxy = new Proxy(target, {});
    const proxyProto = { proxyMethod: () => true };
    Object.setPrototypeOf(proxy, proxyProto);
    result.push(proxy.proxyMethod() === true);
    return result;
}

export function ObjectSetProtoTest022() {
    const result = [];

    function testFunc() {
    }

    const funcProto = { ...Function.prototype, log: () => console.log('func') };
    Object.setPrototypeOf(testFunc, funcProto);
    let logged = false;
    console.log = () => {
        logged = true;
    };
    testFunc.log();
    result.push(logged === true);
    return result;
}

export function ObjectSetProtoTest023() {
    const result = [];
    const arrowFunc = () => {
    };
    const arrowProto = { ...Function.prototype, custom: () => 'arrow' };
    Object.setPrototypeOf(arrowFunc, arrowProto);
    result.push(arrowFunc.custom() === 'arrow');
    return result;
}

export function ObjectSetProtoTest024() {
    const result = [];
    const original = () => {
    };
    const boundFunc = original.bind(null);
    const boundProto = { ...Function.prototype, boundMethod: () => 'bound' };
    Object.setPrototypeOf(boundFunc, boundProto);
    result.push(boundFunc.boundMethod() === 'bound');
    return result;
}

export function ObjectSetProtoTest025() {
    const result = [];

    function* gen() {
        yield 1;
    }

    const genInst = gen();
    const genProto = Object.create(Object.getPrototypeOf(genInst));
    genProto.logNext = function () {
            console.log(this.next().value);
        }
    Object.setPrototypeOf(genInst, genProto);
    let logged = 0;
    console.log = (v) => {
        logged = v;
    };
    genInst.logNext();
    result.push(logged === 1);
    return result;
}

export function ObjectSetProtoTest026() {
    const result = [];
    const promise = Promise.resolve();
    const promiseProto = Object.create(Promise.prototype);
    promiseProto.log = async function () {
            console.log('promise');
        }
    Object.setPrototypeOf(promise, promiseProto);
    let logged = false;
    console.log = () => {
        logged = true;
    };
    return promise.log().then(() => {
        result.push(logged === true); // 异步回调中填充结果
        return result; // 此时 result 已包含值 [true]
    });
}

export function ObjectSetProtoTest027() {
    const result = [];
    const err = new Error('test');
    const errProto = {
        ...Error.prototype, getDetails: function () {
            return this.message + ' details';
        }
    };
    Object.setPrototypeOf(err, errProto);
    result.push(err.getDetails() === 'test details');
    return result;
}

export function ObjectSetProtoTest028() {
    const result = [];
    const map = new Map();
    const mapProto = Object.create(Map.prototype);
    mapProto.customGet = function (key) {
            return this.get(key) || 'default';
    };
    Object.setPrototypeOf(map, mapProto);
    result.push(map.customGet('key') === 'default');
    return result;
}

export function ObjectSetProtoTest029() {
    const result = [];
    const set = new Set();
    const setProto = Object.create(Set.prototype);
    setProto.customAdd = function (val) {
            this.add(val);
            return this.size;
    };
    Object.setPrototypeOf(set, setProto);
    result.push(set.customAdd('val') === 1);
    return result;
}

export function ObjectSetProtoTest030() {
    const result = [];
    const wm = new WeakMap();
    const key = {};
    const wmProto = Object.create(WeakMap.prototype);
    wmProto.safeSet = function (k, v) {
            this.set(k, v);
            return this.has(k);
    };
    Object.setPrototypeOf(wm, wmProto);
    result.push(wm.safeSet(key, 'val') === true);
    return result;
}

export function ObjectSetProtoTest031() {
    const result = [];
    const proto = {
        async fetch() {
            return 'data';
        }
    };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    return (obj.fetch().then(data => {
        result.push(data === 'data');
        return result;
    }));
}

export function ObjectSetProtoTest032() {
    const result = [];
    const sym = Symbol('sym');
    const proto = { [sym]: 'symbolValue' };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    result.push(obj[sym] === 'symbolValue');
    return result;
}

export function ObjectSetProtoTest033() {
    const result = [];
    const buf = new ArrayBuffer(8);
    const bufProto = {
        ...ArrayBuffer.prototype, getSize: function () {
            return this.byteLength;
        }
    };
    Object.setPrototypeOf(buf, bufProto);
    result.push(buf.getSize() === 8);
    return result;
}

export function ObjectSetProtoTest034() {
    const result = [];
    const view = new DataView(new ArrayBuffer(8));
    const viewProto = Object.create(DataView.prototype);
    viewProto.getUint16Safe = function (offset) {
            return this.getUint16(offset);
    };
    Object.setPrototypeOf(view, viewProto);
    view.setUint16(0, 0x1234);
    result.push(view.getUint16Safe(0) === 0x1234);
    return result;
}

export function ObjectSetProtoTest035() {
    const result = [];
    const floatArr = new Float64Array([1.5, 2.5]);
    const floatProto = Object.create(Float64Array.prototype);
    floatProto.avg = function () {
            return this.reduce((a, b) => a + b, 0) / this.length;
    };
    Object.setPrototypeOf(floatArr, floatProto);
    result.push(floatArr.avg() === 2.0);
    return result;
}

export function ObjectSetProtoTest036() {
    const result = [];
    const reg = /test/;
    const regProto = Object.create(RegExp.prototype);
    regProto.testOrNull = function (str) {
            return this.test(str) ? str : null;
    };
    Object.setPrototypeOf(reg, regProto);
    result.push(reg.testOrNull('test') === 'test');
    result.push(reg.testOrNull('nope') === null);
    return result;
}

export function ObjectSetProtoTest037() {
    const result = [];
    const date = new Date(2024, 0, 1);
    const dateProto = Object.create(Date.prototype);
    dateProto.getYearShort = function () {
            return this.getFullYear() % 100;
    };
    Object.setPrototypeOf(date, dateProto);
    result.push(date.getYearShort() === 24);
    return result;
}

export function ObjectSetProtoTest038() {
    const result = [];
    const data = JSON.parse('{"name":"test"}');
    const dataProto = {
        getInfo: function () {
            return this.name;
        }
    };
    Object.setPrototypeOf(data, dataProto);
    result.push(data.getInfo() === 'test');
    return result;
}

export function ObjectSetProtoTest039() {
    const result = [];
    const args = (function () {
        return arguments;
    })(1, 2, 3);
    const argsProto = {
        sum: function () {
            return Array.from(this).reduce((a, b) => a + b, 0);
        }
    };
    Object.setPrototypeOf(args, argsProto);
    result.push(args.sum() === 6);
    return result;
}

export function ObjectSetProtoTest040() {
    const result = [];
    const bigInt = Object(BigInt(123));
    const bigIntProto = {
        ...BigInt.prototype, toHex: function () {
            return this.toString(16);
        }
    };
    Object.setPrototypeOf(bigInt, bigIntProto);
    result.push(bigInt.toHex() === '7b');
    return result;
}

export function ObjectSetProtoTest041() {
    const result = [];
    const sym = Object(Symbol('desc'));
    const symProto = {
        ...Symbol.prototype, getDescription: function () {
            return this.description;
        }
    };
    Object.setPrototypeOf(sym, symProto);
    result.push(sym.getDescription() === 'desc');
    return result;
}

export function ObjectSetProtoTest042() {
    const result = [];
    const bool = new Boolean(true);
    const boolProto = {
        ...Boolean.prototype, toYesNo: function () {
            return this.valueOf() ? 'yes' : 'no';
        }
    };
    Object.setPrototypeOf(bool, boolProto);
    result.push(bool.toYesNo() === 'yes');
    return result;
}

export function ObjectSetProtoTest043() {
    const result = [];
    const num = new Number(100);
    const numProto = {
        ...Number.prototype, toK: function () {
            return ((this) / 1000).toFixed(1) + 'k';
        }
    };
    Object.setPrototypeOf(num, numProto);
    result.push(num.toK() === '0.1k');
    return result;
}

export function ObjectSetProtoTest044() {
    const result = [];
    const str = new String('hello');
    const strProto = Object.create(String.prototype);
    strProto.toTitle = function () {
            return this.charAt(0).toUpperCase() + this.slice(1);
    };
    Object.setPrototypeOf(str, strProto);
    result.push(str.toTitle() === 'Hello');
    return result;
}

export function ObjectSetProtoTest045() {
    const result = [];
    const obj = { prop: 'own' };
    const proto = { prop: 'proto' };
    Object.setPrototypeOf(obj, proto);
    result.push(obj.prop === 'own');
    return result;
}

export function ObjectSetProtoTest046() {
    const result = [];
    const obj = {};
    result.push(obj instanceof Array === false);
    Object.setPrototypeOf(obj, Array.prototype);
    result.push(obj instanceof Array === true);
    return result;
}

export function ObjectSetProtoTest047() {
    const result = [];
    const fr = new FinalizationRegistry(() => {
    });
    const frProto = Object.create(FinalizationRegistry.prototype);
    frProto.registerLog = function (t, v) {
            this.register(t, v);
            console.log('registered');
    };
    Object.setPrototypeOf(fr, frProto);
    let logged = false;
    console.log = () => {
        logged = true;
    };
    fr.registerLog({}, 'val');
    result.push(logged === true);
    return result;
}

export function ObjectSetProtoTest048() {
    const result = [];
    const wr = new WeakRef({});
    const wrProto = Object.create(WeakRef.prototype);
    wrProto.derefLog = function () {
            const val = this.deref();
            console.log(val ? 'exists' : 'expired');
    };
    Object.setPrototypeOf(wr, wrProto);
    let logged = '';
    console.log = (v) => {
        logged = v;
    };
    wr.derefLog();
    result.push(logged === 'exists');
    return result;
}

export function ObjectSetProtoTest049() {
    const result = [];
    const proto = {
        get value() {
            return this._val || 0;
        },
        set value(v) {
            this._val = v;
        }
    };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    obj.value = 5;
    result.push(obj.value === 5);
    return result;
}

export function ObjectSetProtoTest050() {
    const result = [];

    class Parent {
        parentMethod() {
            return 'parent';
        }
    }

    class Child extends Parent {
    }

    const childInst = new Child();
    const newProto = Object.create(Child.prototype);
    newProto.childMethod = () => 'child' ;
    Object.setPrototypeOf(childInst, newProto);
    result.push(childInst.parentMethod() === 'parent');
    result.push(childInst.childMethod() === 'child');
    return result;
}

export function ObjectSetProtoTest051() {
    const result = [];
    'use strict';
    const obj = {};
    let errorThrown = false;
    try {
        Object.setPrototypeOf(obj, 123n)
        ;
    } catch (e) {
        errorThrown = e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest052() {
    const result = [];
    const match = /(\w+)/.exec('test');
    const matchProto = {
        getMatch: function () {
            return this[0];
        }
    };
    Object.setPrototypeOf(match, matchProto);
    result.push(match.getMatch() === 'test');
    return result;
}

export function ObjectSetProtoTest053() {
    const result = [];
    const obj1 = {};
    const proto = { shared: 'val' };
    Object.setPrototypeOf(obj1, proto);
    const obj2 = {};
    Object.setPrototypeOf(obj2, Object.getPrototypeOf(obj1));
    result.push(obj2.shared === 'val');
    return result;
}

export function ObjectSetProtoTest054() {
    const result = [];
    const obj = {};
    const originalProto = Object.getPrototypeOf(obj);
    Object.setPrototypeOf(obj, new String('primitive'));
    result.push(Object.getPrototypeOf(obj) === originalProto);
    return result;
}

export function ObjectSetProtoTest055() {
    const result = [];
    const grandparent = { g: 1 };
    const parent = { p: 2 };
    const child = { c: 3 };
    Object.setPrototypeOf(parent, grandparent);
    Object.setPrototypeOf(child, parent);
    const newGrandparentProto = { newG: 10 };
    Object.setPrototypeOf(grandparent, newGrandparentProto);
    result.push(grandparent.newG === 10);
    result.push(child.g === 1);
    return result;
}

export function ObjectSetProtoTest056() {
    const result = [];
    const iterableProto = {
        * [Symbol.iterator]() {
            yield 1;
            yield 2;
            yield 3;
        }
    };
    const obj = {};
    Object.setPrototypeOf(obj, iterableProto);
    const arr = [...obj];
    result.push(JSON.stringify(arr) === JSON.stringify([1, 2, 3]));
    return result;
}

export function ObjectSetProtoTest057() {
    const result = [];
    const ws = new WeakSet();
    const key = {};
    const wsProto = Object.create(WeakSet.prototype);
    wsProto.addIfAbsent = function (k) {
            if (!this.has(k)) {
                this.add(k);
            }
            return this;
    };
    Object.setPrototypeOf(ws, wsProto);
    ws.addIfAbsent(key);
    result.push(ws.has(key) === true);
    return result;
}

export function ObjectSetProtoTest058() {
    const result = [];
    const bigIntArr = new BigInt64Array([1n, 2n, 3n]);
    const arrProto = Object.create(BigInt64Array.prototype);
    arrProto.sum = function () {
            return this.reduce((a, b) => a + b, 0n);
    };
    Object.setPrototypeOf(bigIntArr, arrProto);
    result.push(bigIntArr.sum() === 6n);
    return result;
}

export function ObjectSetProtoTest059() {
    const result = [];
    const bigUintArr = new BigUint64Array([10n, 20n]);
    const arrProto = Object.create(BigUint64Array.prototype);
    arrProto.double = function () {
            return this.map(v => v * 2n);
    };
    Object.setPrototypeOf(bigUintArr, arrProto);
    const doubled = bigUintArr.double();
    result.push(doubled[0] === 20n && doubled[1] === 40n);
    return result;
}

export function ObjectSetProtoTest060() {
    const result = [];
    const proto1 = {
        base: 10, get derived() {
            return this.base * 2;
        }
    };
    const proto2 = {
        get extended() {
            return this.derived + 5;
        }
    };
    const obj = {};
    Object.setPrototypeOf(obj, proto1);
    result.push(obj.derived === 20);
    Object.setPrototypeOf(obj, proto2);
    Object.setPrototypeOf(proto2, proto1);
    result.push(obj.extended === 25);
    return result;
}
export function ObjectSetProtoTest061() {
    const result = [];
    const err = new RangeError('out of range');
    const errProto = { ...RangeError.prototype, getCode: function() { return 'RANGE_ERR'; } };
    Object.setPrototypeOf(err, errProto);
    result.push(err.getCode() === 'RANGE_ERR');
    result.push(err.message === 'out of range');
    return result;
}

export function ObjectSetProtoTest062() {
    const result = [];
    const err = new SyntaxError('invalid syntax');
    const errProto = { ...SyntaxError.prototype, getDetails: function() { return `Syntax Error: ${this.message}`; } };
    Object.setPrototypeOf(err, errProto);
    result.push(err.getDetails() === 'Syntax Error: invalid syntax');
    return result;
}

export function ObjectSetProtoTest063() {
    const result = [];
    const proto = { prop: 'test' };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    result.push(obj.prop === 'test');
    delete proto.prop;
    result.push(obj.prop === undefined);
    return result;
}

export function ObjectSetProtoTest064() {
    const result = [];
    const proto = Object.defineProperty({}, 'readOnly', { value: 42, writable: true });
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    result.push(obj.readOnly === 42);
    (obj).readOnly = 100;
    result.push(obj.readOnly === 42);
    return result;
}

export function ObjectSetProtoTest065() {
    const result = [];
    function* genFunc() { yield 'gen'; }
    const genProto = { ...Function.prototype, run: function() { return this().next().value; } };
    Object.setPrototypeOf(genFunc, genProto);
    result.push(genFunc.run() === 'gen');
    return result;
}

export function ObjectSetProtoTest066() {
    const result = [];
    const promise = Promise.reject(new Error('fail'));
    const promiseProto = { ...Promise.prototype, catchLog: async function() { return this.catch(err => err.message); } };
    Object.setPrototypeOf(promise, promiseProto);
    return promise.catchLog().then(res => {
        result.push(res === 'fail');
        return result;
    });
}

export function ObjectSetProtoTest067() {
    const result = [];
    const obj = Object.create(null);
    result.push(Object.getPrototypeOf(obj) === null);
    const newProto = { test: 'val' };
    Object.setPrototypeOf(obj, newProto);
    result.push(Object.getPrototypeOf(obj) === newProto);
    result.push(obj.test === 'val');
    return result;
}

export function ObjectSetProtoTest068() {
    const result = [];
    const args = (function() { return arguments; })(10, 20, 30);
    Object.setPrototypeOf(args, Array.prototype);
    result.push(JSON.stringify(args.slice(1)) === JSON.stringify([20, 30]));
    result.push(args.length === 3);
    return result;
}

export function ObjectSetProtoTest069() {
    const result = [];
    const objA = { a: 1 };
    const objB = { b: 2 };
    let errorThrown = false;
    try {
        Object.setPrototypeOf(objA, objB);
        Object.setPrototypeOf(objB, objA);
    } catch (e) {
        errorThrown = e instanceof RangeError || e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest070() {
    const result = [];
    const obj = {};
    const originalProto = Object.getPrototypeOf(obj);
    const tempProto = { temp: 'val' };
    Object.setPrototypeOf(obj, tempProto);
    result.push(obj.temp === 'val');
    Object.setPrototypeOf(obj, originalProto);
    result.push(obj.temp === undefined);
    result.push(obj.toString() === '[object Object]');
    return result;
}

export function ObjectSetProtoTest071() {
    const result = [];
    const intArr = new Int32Array([5, 10, 15]);
    const arrProto = Object.create(Int32Array.prototype);
    arrProto.max = function() { return Math.max(...this); };
    Object.setPrototypeOf(intArr, arrProto);
    result.push(intArr.max() === 15);
    return result;
}

export function ObjectSetProtoTest072() {
    const result = [];
    const proto = {
        get asyncVal() {
            return new Promise(resolve => setTimeout(() => resolve('async data'), 0));
        }
    };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    return (obj.asyncVal).then(res => {
        result.push(res === 'async data');
        return result;
    });
}

export function ObjectSetProtoTest073() {
    const result = [];
    const map = new Map([['key', 'value']]);
    const iterator = map.entries();
    const iterProto = Object.create(iterator);
    iterProto.nextLog = function() { const res = this.next(); console.log(res.value); return res; };
    let errorThrown = false;
    try {
        Object.setPrototypeOf(iterator, iterProto);
    } catch (e) {
        errorThrown = e instanceof RangeError || e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest074() {
    const result = [];
    const set = new Set(['a', 'b']);
    const iterator = set.values();
    const iterProto = Object.create(iterator);
    iterProto.collect = function() { const res = []; let curr; while (!(curr = this.next()).done) res.push(curr.value); return res; };
    let errorThrown = false;
    try {
        Object.setPrototypeOf(iterator, iterProto);
    } catch (e) {
        errorThrown = e instanceof RangeError || e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest075() {
    const result = [];
    const str = 'abc';
    const iterator = str[Symbol.iterator]();
    const iterProto = Object.create(iterator);
    iterProto.join = function() { const res = []; let curr; while (!(curr = this.next()).done) res.push(curr.value); return res.join('-'); };
    let errorThrown = false;
    try {
        Object.setPrototypeOf(iterator, iterProto);
    } catch (e) {
        errorThrown = e instanceof RangeError || e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest076() {
    const result = [];
    const arr = [10, 20, 30];
    const iterator = arr[Symbol.iterator]();
    const iterProto = Object.create(iterator);
    iterProto.sum = function() { let total = 0; let curr; while (!(curr = this.next()).done) total += curr.value; return total; };
    let errorThrown = false;
    try {
        Object.setPrototypeOf(iterator, iterProto);
    } catch (e) {
        errorThrown = e instanceof RangeError || e instanceof TypeError;
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest077() {
    const result = [];
    const protoWithNull = { x: 5, __proto__: null };
    const middleProto = { y: 10 };
    Object.setPrototypeOf(middleProto, protoWithNull);
    const obj = {};
    Object.setPrototypeOf(obj, middleProto);
    result.push(obj.x === 5);
    result.push(obj.y === 10);
    result.push(obj.toString === undefined);
    return result;
}

export function ObjectSetProtoTest078() {
    const result = [];
    const proto = { protoKey: 'protoVal' };
    const obj = { ownKey: 'ownVal' };
    Object.setPrototypeOf(obj, proto);
    const keys = Object.keys(obj);
    result.push(JSON.stringify(keys) === JSON.stringify(['ownKey']));
    result.push('protoKey' in obj === true);
    return result;
}

export function ObjectSetProtoTest079() {
    const result = [];
    const proto = { toJSON: function() { return { protoProp: this.protoVal }; } };
    const obj = { ownProp: 'own', protoVal: 'proto' };
    Object.setPrototypeOf(obj, proto);
    const json = JSON.stringify(obj);
    result.push(json === '{"protoProp":"proto"}');
    return result;
}

export function ObjectSetProtoTest080() {
    const result = [];
    const customProto = { toString: function() { return 'CustomObject'; } };
    const obj = {};
    Object.setPrototypeOf(obj, customProto);
    result.push(obj.toString() === 'CustomObject');
    Object.setPrototypeOf(obj, Object.prototype);
    result.push(obj.toString() === '[object Object]');
    return result;
}

export function ObjectSetProtoTest081() {
    const result = [];
    const proto = { [Symbol.toStringTag]: 'CustomType' };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    result.push(Object.prototype.toString.call(obj) === '[object CustomType]');
    return result;
}

export function ObjectSetProtoTest082() {
    const result = [];
    const uint16Arr = new Uint16Array([32000, 65535]);
    const arrProto = {
        ...Uint16Array.prototype,
        isWithinBounds: function(val) { return val >= 0 && val <= 65535; }
    };
    Object.setPrototypeOf(uint16Arr, arrProto);
    result.push(uint16Arr.isWithinBounds(32000) === true);
    result.push(uint16Arr.isWithinBounds(65536) === false);
    return result;
}

export function ObjectSetProtoTest083() {
    const result = [];
    const proto = { protoProp: 'proto' };
    const obj = { ownProp: 'own' };
    Object.setPrototypeOf(obj, proto);
    const keys = [];
    for (const key in obj) keys.push(key);
    result.push(JSON.stringify(keys) === JSON.stringify(['ownProp', 'protoProp']));
    return result;
}

export function ObjectSetProtoTest084() {
    const result = [];
    const proto = Object.defineProperty({}, 'nonEnum', { value: 'hidden', enumerable: false });
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    result.push(obj.nonEnum === 'hidden');
    result.push(Object.keys(obj).includes('nonEnum') === false);
    return result;
}

export function ObjectSetProtoTest085() {
    const result = [];
    const promise = Promise.allSettled([Promise.resolve(1), Promise.reject(2)]);
    const promiseProto = Object.create(Promise.prototype);
    promiseProto.getSuccessCount = async function() {
            const results = await this;
            return results.filter(r => r.status === 'fulfilled').length;
    };
    Object.setPrototypeOf(promise, promiseProto);
    return promise.getSuccessCount().then(count => {
        result.push(count === 1);
        return result;
    });
}

export function ObjectSetProtoTest086() {
    const result = [];
    const proto = Object.create(Date.prototype);
    proto.getMonthName = function() { return ['Jan', 'Feb'][this.getMonth()]; };
    const obj = new Date(2024, 1);
    Object.setPrototypeOf(obj, proto);
    result.push(obj.getMonthName() === 'Feb');
    return result;
}

export function ObjectSetProtoTest087() {
    const result = [];
    const proto = { prop: 'changeable' };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    Object.freeze(proto);
    try {
        proto.prop = 'fixed';
    } catch (e) {}
    result.push(obj.prop === 'changeable');
    return result;
}

export function ObjectSetProtoTest088() {
    const result = [];
    const wm = new WeakMap();
    const key = {};
    const wmProto = Object.create(WeakMap.prototype);
    wmProto.safeGet = function(k, fallback) { return this.has(k) ? this.get(k) : fallback; }
    Object.setPrototypeOf(wm, wmProto);
    wm.set(key, 'value');
    result.push(wm.safeGet(key, 'fallback') === 'value');
    result.push(wm.safeGet({}, 'fallback') === 'fallback');
    return result;
}

export function ObjectSetProtoTest089() {
    const result = [];
    const proto = {
        async calculate() { return this.value * 2; }
    };
    const obj = { value: 10 };
    Object.setPrototypeOf(obj, proto);
    return obj.calculate().then(res => {
        result.push(res === 20);
        obj.value = 20;
        return obj.calculate();
    }).then(res => {
        result.push(res === 40);
        return result;
    });
}

export function ObjectSetProtoTest090() {
    const result = [];
    const buf = new ArrayBuffer(8);
    const transferred = new ArrayBuffer(16);
    const bufProto = Object.create(ArrayBuffer.prototype);
    bufProto.isTransferred = function() { return this.byteLength === 16; }
    Object.setPrototypeOf(transferred, bufProto);
    result.push(transferred.isTransferred() === true);
    return result;
}

export function ObjectSetProtoTest091() {
    const result = [];
    const proto1 = { a: 1, __proto__: null };
    const proto2 = { b: 2, __proto__: proto1 };
    const proto3 = { c: 3, __proto__: null };
    const obj = {};
    Object.setPrototypeOf(obj, proto2);
    result.push(obj.a === 1);
    result.push(obj.b === 2);
    Object.setPrototypeOf(obj, proto3);
    result.push(obj.c === 3);
    result.push(obj.a === undefined);
    return result;
}

export function ObjectSetProtoTest092() {
    const result = [];
    const obj = {};
    const newProto = { ref: true };
    Object.setPrototypeOf(obj, newProto);
    result.push(Reflect.getPrototypeOf(obj) === newProto);
    return result;
}

export function ObjectSetProtoTest093() {
    const result = [];
    const parentProto = { base: 5, getBase() { return this.base; } };
    const childProto = Object.create(parentProto);
    childProto.getDerived = function () { return parentProto.getBase() * 3; }
    const obj = {};
    Object.setPrototypeOf(obj, childProto);
    result.push(obj.getDerived() === 15);
    return result;
}

export function ObjectSetProtoTest094() {
    const result = [];
    const err = new Error('stack test');
    const errProto = {
        ...Error.prototype,
        getStackLines() { return this.stack?.split('\n').length || 0; }
    };
    Object.setPrototypeOf(err, errProto);
    result.push(err.getStackLines() > 1);
    return result;
}

export function ObjectSetProtoTest095() {
    const result = [];
    const proto = {
        increment() { this.count = (this.count || 0) + 1; return this.count; }
    };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    result.push(obj.increment() === 1);
    result.push(obj.increment() === 2);
    return result;
}

export function ObjectSetProtoTest096() {
    const result = [];
    const bigInt = Object(BigInt(100));
    const bigIntProto = Object.create(BigInt.prototype);
    bigIntProto.add = function(val) {
        return BigInt(this) + val;
    };
    bigIntProto.multiply = function(val) {
        return BigInt(this) * val;
    };
    Object.setPrototypeOf(bigInt, bigIntProto);
    result.push(bigInt.add(50n) === 150n);
    result.push(bigInt.multiply(2n) === 200n);
    return result;
}

export function ObjectSetProtoTest097() {
    const result = [];
    class CustomClass {
        customMethod() { return 'custom'; }
    }

    const arrayProtoExtension = Object.create(Array.prototype);

    Object.setPrototypeOf(CustomClass.prototype, arrayProtoExtension);

    const obj = [];
    Object.setPrototypeOf(obj, CustomClass.prototype);

    result.push(obj.customMethod() === 'custom');

    obj.push(1);
    result.push(obj.length === 1);
    return result;
}

export function ObjectSetProtoTest098() {
    const result = [];
    const proto = { protoProp: 'proto' };
    const obj = { ownProp: 'own' };
    Object.setPrototypeOf(obj, proto);
    const ownNames = Object.getOwnPropertyNames(obj);
    result.push(JSON.stringify(ownNames) === JSON.stringify(['ownProp']));
    return result;
}

export function ObjectSetProtoTest099() {
    const result = [];
    const view = new DataView(new ArrayBuffer(8));
    const viewProto = Object.create(DataView.prototype);
    viewProto.writeUint32LE = function(offset, val) { this.setUint32(offset, val, true); };
    viewProto.readUint32LE = function(offset) { return this.getUint32(offset, true); };
    Object.setPrototypeOf(view, viewProto);
    view.writeUint32LE(0, 0x12345678);
    result.push(view.readUint32LE(0) === 0x12345678);
    return result;
}

export function ObjectSetProtoTest100() {
    const result = [];
    const proto = {
        createClone() {
            const clone = {};
            Object.setPrototypeOf(clone, Object.getPrototypeOf(this));
            return clone;
        }
    };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    const clone = obj.createClone();
    result.push(Object.getPrototypeOf(clone) === proto);
    result.push(typeof clone.createClone === 'function');
    return result;
}

export function ObjectSetProtoTest101() {
    const result = [];
    const targetProto = { proxyProp: 'proxyVal' };
    const proxyProto = new Proxy(targetProto, {
        get(t, prop) { return `proxied: ${t[prop]}`; }
    });
    const obj = {};
    Object.setPrototypeOf(obj, proxyProto);
    result.push(obj.proxyProp === 'proxied: proxyVal');
    return result;
}

export function ObjectSetProtoTest102() {
    const result = [];
    const proto = { protoProp: 'proto' };
    const obj = { ownProp: 'own' };
    Object.setPrototypeOf(obj, proto);
    result.push(obj.hasOwnProperty('ownProp') === true);
    result.push(obj.hasOwnProperty('protoProp') === false);
    return result;
}

export function ObjectSetProtoTest103() {
    const result = [];
    const promise = Promise.race([
        new Promise(resolve => setTimeout(() => resolve('fast'), 10)),
        new Promise(resolve => setTimeout(() => resolve('slow'), 100))
    ]);
    const promiseProto = Object.create(Promise.prototype);
    promiseProto.withTimeout = function(timeout) {
            return Promise.race([this, new Promise((_, reject) => setTimeout(() => reject('timeout'), timeout))]);
    };
    Object.setPrototypeOf(promise, promiseProto);
    return promise.withTimeout(50).then(res => {
        result.push(res === 'fast');
        return result;
    }).catch(err => {
        result.push(false);
        return result;
    });
}

export function ObjectSetProtoTest104() {
    const result = [];
    const proto = {
        getThis() { return this; }
    };
    const obj = { id: 1 };
    Object.setPrototypeOf(obj, proto);
    result.push(obj.getThis() === obj);
    return result;
}

export function ObjectSetProtoTest105() {
    const result = [];
    class ExtendedArray extends Array {
        first() { return this[0]; }
    }
    const proto = Object.create(ExtendedArray.prototype);
    const obj = new ExtendedArray(1, 2, 3);
    Object.setPrototypeOf(obj, proto);
    result.push(obj.first() === 1);
    result.push(obj.length === 3);
    return result;
}

export function ObjectSetProtoTest106() {
    const result = [];
    const proto = { prop: 'old' };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    result.push(obj.prop === 'old');
    proto.prop = 'new';
    result.push(obj.prop === 'new');
    return result;
}

export function ObjectSetProtoTest107() {
    const result = [];
    const proto = {
        throwError() { throw new Error('test error'); }
    };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    let errorThrown = false;
    try {
        obj.throwError();
    } catch (e) {
        errorThrown = e instanceof Error && e.message === 'test error';
    }
    result.push(errorThrown === true);
    return result;
}

export function ObjectSetProtoTest108() {
    const result = [];
    const frozenProto = Object.freeze({ frozen: 'fixed' });
    const proto = { ...frozenProto, dynamic: 'changeable' };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    result.push(obj.frozen === 'fixed');
    result.push(obj.dynamic === 'changeable');
    proto.dynamic = 'updated';
    result.push(obj.dynamic === 'updated');
    return result;
}