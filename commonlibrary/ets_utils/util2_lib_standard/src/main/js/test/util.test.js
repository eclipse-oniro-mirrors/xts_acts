/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import util from '@ohos.util'
import url from '@ohos.url'
import app from '@system.app'
import process from '@ohos.process'
import file from '@system.file';

class Temperature {
    constructor(value) {
        this._temp = value;
    }
    compareTo(value) {
        return this._temp >= value.getTemp();
    }
    getTemp() {
        return this._temp;
    }
    toString() {
        return this._temp.toString();
    }
}
var tempLower = new Temperature(30);
var tempUpper = new Temperature(40);
var tempLess = new Temperature(20);
var tempMiDF = new Temperature(35);
var tempMidS = new Temperature(39);
var tempMore = new Temperature(45);

var rangeHp = new util.ScopeHelper(tempLower, tempUpper);
var rangeHpFir = new util.ScopeHelper(tempMiDF, tempMidS);
var rangeHpSec = new util.ScopeHelper(tempLess, tempMore);
var rangeHpThi = new util.ScopeHelper(tempLess, tempMiDF);
var rangeHpFif = new util.ScopeHelper(tempMiDF, tempMore);

export default function UtilFunTest() {
describe('TextEncoderTest', function () {
    /**
     * @tc.name: testIsNumberObject001
     * @tc.desc: Check whether the entered value is of the number object type.
     */
    it('testIsNumberObject001', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(new Number(0));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsNumberObject002
     * @tc.desc: Check whether the entered value is of the number object type.
     */
    it('testIsNumberObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(new Number(10));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsNumberObject003
     * @tc.desc: Check whether the entered value is of the number object type.
     */
    it('testIsNumberObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(new Number(200));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsNumberObject004
     * @tc.desc: Check whether the entered value is of the number object type.
     */
    it('testIsNumberObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(0);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsNumberObject005
     * @tc.desc: Check whether the entered value is of the number object type.
     */
    it('testIsNumberObject005', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(100);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsPromise001
     * @tc.desc: Check whether the entered value is of promise type.
     */
    it('testIsPromise001', 0, function() {
        var proc = new util.types();
        var result = proc.isPromise(Promise.resolve(42));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsPromise002
     * @tc.desc: Check whether the entered value is of promise type.
     */
    it('testIsPromise002', 0, function() {
        var proc = new util.types();
        var result = proc.isPromise(Promise.resolve(33));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsPromise003
     * @tc.desc: Check whether the entered value is of promise type.
     */
    it('testIsPromise003', 0, function() {
        var proc = new util.types();
        var result = proc.isPromise(Promise.resolve(44));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsPromise004
     * @tc.desc: Check whether the entered value is of promise type.
     */
    it('testIsPromise004', 0, function() {
        var proc = new util.types();
        var err = Error(33);
        var result = proc.isPromise(Promise.reject(err));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsPromise005
     * @tc.desc: Check whether the entered value is of promise type.
     */
    it('testIsPromise005', 0, function() {
        var proc = new util.types();
        var err = Error(23);
        var result = proc.isPromise(Promise.reject(err));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsProxy001
     * @tc.desc: Check whether the value entered is of proxy type.
     */
    it('testIsProxy001', 0, function() {
        var proc = new util.types();
        const target = {};
        const proxy = new Proxy(target, {});
        var result = proc.isProxy(proxy);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsProxy002
     * @tc.desc: Check whether the value entered is of proxy type.
     */
    it('testIsProxy002', 0, function() {
        var proc = new util.types();
        const target = {};
        const proxy = new Proxy(target, {});
        var result = proc.isProxy(target);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsProxy003
     * @tc.desc: Check whether the value entered is of proxy type.
     */
    it('testIsProxy003', 0, function() {
        var proc = new util.types();
        const handler = {
            get: function(obj, prop) {
                return prop in obj ? obj[prop] : 37;
            }
        };
        const p = new Proxy({}, handler);
        var result = proc.isProxy(p);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsProxy004
     * @tc.desc: Check whether the value entered is of proxy type.
     */
    it('testIsProxy004', 0, function() {
        var proc = new util.types();
        const handler = {
            get: function(obj, prop) {
                return prop in obj ? obj[prop] : 121;
            }
        };
        const p = new Proxy({}, handler);
        var result = proc.isProxy(p);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsProxy005
     * @tc.desc: Check whether the value entered is of proxy type.
     */
    it('testIsProxy005', 0, function() {
        var proc = new util.types();
        const handler = {
            get: function(obj, prop) {
                return prop in obj ? obj[prop] : 121;
            }
        };
        const p = new Proxy({}, handler);
        var result = proc.isProxy(handler);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsRegExp001
     * @tc.desc: Check whether the entered value is of type regexp.
     */
    it('testIsRegExp001', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp('abc'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsRegExp002
     * @tc.desc: Check whether the entered value is of type regexp.
     */
    it('testIsRegExp002', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(/abc/);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsRegExp003
     * @tc.desc: Check whether the entered value is of type regexp.
     */
    it('testIsRegExp003', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp('fgd'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsRegExp004
     * @tc.desc: Check whether the entered value is of type regexp.
     */
    it('testIsRegExp004', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp('123'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsRegExp005
     * @tc.desc: Check whether the entered value is of type regexp.
     */
    it('testIsRegExp005', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp(/ab+c/, 'i'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSet001
     * @tc.desc: Check whether the entered value is of type set.
     */
    it('testIsSet001', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new Set());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSet002
     * @tc.desc: Check whether the entered value is of type set.
     */
    it('testIsSet002', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new Map());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSet003
     * @tc.desc: Check whether the entered value is of type set.
     */
    it('testIsSet003', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSet004
     * @tc.desc: Check whether the entered value is of type set.
     */
    it('testIsSet004', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new Boolean());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSet005
     * @tc.desc: Check whether the entered value is of type set.
     */
    it('testIsSet005', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new WeakSet());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSetIterator001
     * @tc.desc: Check whether the entered value is the iterator type of set.
     */
    it('testIsSetIterator001', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set.keys());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSetIterator002
     * @tc.desc: Check whether the entered value is the iterator type of set.
     */
    it('testIsSetIterator002', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set.values());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSetIterator003
     * @tc.desc: Check whether the entered value is the iterator type of set.
     */
    it('testIsSetIterator003', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set.entries());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSetIterator004
     * @tc.desc: Check whether the entered value is the iterator type of set.
     */
    it('testIsSetIterator004', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set[Symbol.iterator]());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSetIterator005
     * @tc.desc: Check whether the entered value is the iterator type of set.
     */
    it('testIsSetIterator005', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSharedArrayBuffer001
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     */
    it('testIsSharedArrayBuffer001', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new SharedArrayBuffer([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSharedArrayBuffer002
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     */
    it('testIsSharedArrayBuffer002', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSharedArrayBuffer003
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     */
    it('testIsSharedArrayBuffer003', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new Int32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSharedArrayBuffer004
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     */
    it('testIsSharedArrayBuffer004', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new ArrayBuffer([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSharedArrayBuffer005
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     */
    it('testIsSharedArrayBuffer005', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsStringObject001
     * @tc.desc: Check whether the entered value is a string object type.
     */
    it('testIsStringObject001', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject(new String('foo'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsStringObject002
     * @tc.desc: Check whether the entered value is a string object type.
     */
    it('testIsStringObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject(new String('twoo'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsStringObject003
     * @tc.desc: Check whether the entered value is a string object type.
     */
    it('testIsStringObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject(new String('fdfsfd'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsStringObject004
     * @tc.desc: Check whether the entered value is a string object type.
     */
    it('testIsStringObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject('ffds111');
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsStringObject005
     * @tc.desc: Check whether the entered value is a string object type.
     */
    it('testIsStringObject005', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject('foo');
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSymbolObject001
     * @tc.desc: Check whether the entered value is a symbol object type.
     */
    it('testIsSymbolObject001', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('foo');
        var result = proc.isSymbolObject(Object(symbols));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSymbolObject002
     * @tc.desc: Check whether the entered value is a symbol object type.
     */
    it('testIsSymbolObject002', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('s12');
        var result = proc.isSymbolObject(Object(symbols));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSymbolObject003
     * @tc.desc: Check whether the entered value is a symbol object type.
     */
    it('testIsSymbolObject003', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('sads');
        var result = proc.isSymbolObject(Object(symbols));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsSymbolObject004
     * @tc.desc: Check whether the entered value is a symbol object type.
     */
    it('testIsSymbolObject004', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('asdd');
        var result = proc.isSymbolObject(symbols);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsSymbolObject005
     * @tc.desc: Check whether the entered value is a symbol object type.
     */
    it('testIsSymbolObject005', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('foo');
        var result = proc.isSymbolObject(symbols);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsTypedArray001
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     */
    it('testIsTypedArray001', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Float64Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsTypedArray002
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     */
    it('testIsTypedArray002', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Uint8Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsTypedArray003
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     */
    it('testIsTypedArray003', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Uint16Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsTypedArray004
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     */
    it('testIsTypedArray004', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Uint32Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsTypedArray005
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     */
    it('testIsTypedArray005', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new ArrayBuffer());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint8Array001
     * @tc.desc: Check whether the entered value is the uint8array array type.
     */
    it('testIsUint8Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Uint8Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsUint8Array002
     * @tc.desc: Check whether the entered value is the uint8array array type.
     */
    it('testIsUint8Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Uint16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint8Array003
     * @tc.desc: Check whether the entered value is the uint8array array type.
     */
    it('testIsUint8Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Uint32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint8Array004
     * @tc.desc: Check whether the entered value is the uint8array array type.
     */
    it('testIsUint8Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint8Array005
     * @tc.desc: Check whether the entered value is the uint8array array type.
     */
    it('testIsUint8Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint8ClampedArray001
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     */
    it('testIsUint8ClampedArray001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Uint8ClampedArray([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsUint8ClampedArray002
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     */
    it('testIsUint8ClampedArray002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint8ClampedArray003
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     */
    it('testIsUint8ClampedArray003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint8ClampedArray004
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     */
    it('testIsUint8ClampedArray004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Int32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint8ClampedArray005
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     */
    it('testIsUint8ClampedArray005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Uint32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint16Array001
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     */
    it('testIsUint16Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint16Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsUint16Array002
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     */
    it('testIsUint16Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint16Array003
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     */
    it('testIsUint16Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint16Array004
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     */
    it('testIsUint16Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint8ClampedArray([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint16Array005
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     */
    it('testIsUint16Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint32Array001
     * @tc.desc: Check whether the entered value is the uint32array array type.
     */
    it('testIsUint32Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint32Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsUint32Array002
     * @tc.desc: Check whether the entered value is the uint32array array type.
     */
    it('testIsUint32Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint32Array003
     * @tc.desc: Check whether the entered value is the uint32array array type.
     */
    it('testIsUint32Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint32Array004
     * @tc.desc: Check whether the entered value is the uint32array array type.
     */
    it('testIsUint32Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsUint32Array005
     * @tc.desc: Check whether the entered value is the uint32array array type.
     */
    it('testIsUint32Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint8ClampedArray([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsWeakMap001
     * @tc.desc: Check whether the entered value is of type weakmap.
     */
    it('testIsWeakMap001', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new WeakMap());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsWeakMap002
     * @tc.desc: Check whether the entered value is of type weakmap.
     */
    it('testIsWeakMap002', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new Map());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsWeakMap003
     * @tc.desc: Check whether the entered value is of type weakmap.
     */
    it('testIsWeakMap003', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new Set());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsWeakMap004
     * @tc.desc: Check whether the entered value is of type weakmap.
     */
    it('testIsWeakMap004', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsWeakMap005
     * @tc.desc: Check whether the entered value is of type weakmap.
     */
    it('testIsWeakMap005', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new WeakSet());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsWeakSet001
     * @tc.desc: Check whether the entered value is of type weakset.
     */
    it('testIsWeakSet001', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new WeakSet());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.name: testIsWeakSet002
     * @tc.desc: Check whether the entered value is of type weakset.
     */
    it('testIsWeakSet002', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new WeakMap());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsWeakSet003
     * @tc.desc: Check whether the entered value is of type weakset.
     */
    it('testIsWeakSet003', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsWeakSet004
     * @tc.desc: Check whether the entered value is of type weakset.
     */
    it('testIsWeakSet004', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new Set());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testIsWeakSet005
     * @tc.desc: Check whether the entered value is of type weakset.
     */
    it('testIsWeakSet005', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new Map());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.name: testUtilRandomUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilRandomUUID001', 0, async function () {
        var result = util.randomUUID(true);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.name: testUtilRandomUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilRandomUUID002', 0, async function () {
        var result = util.randomUUID(false);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.name: testUtilRandomBinaryUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilRandomBinaryUUID001', 0, async function () {
        var result = util.randomBinaryUUID(true);
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.name: testUtilRandomBinaryUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilRandomBinaryUUID002', 0, async function () {
        var result = util.randomBinaryUUID(false);
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.name: testUtilParseUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilParseUUID001', 0, async function () {
        var result = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.name: testUtilParseUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilParseUUID002', 0, async function () {
        try {
            var result = util.parseUUID('84df796-66cc-4655-9b89-d6218d100f9c');
        } catch(e) {
            expect(e.message).assertEqual('Syntax Error.Invalid 84df796-66cc-4655-9b89-d6218d100f9c string');
        }
    })

    /**
     * @tc.name: testUtilParseUUID003
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilParseUUID003', 0, async function () {
        try {
            var result = util.parseUUID('84Wdf796-66cc-4655-9b89-d6218d100f9c');
        } catch(e) {
            expect(e.message).assertEqual('Syntax Error.Invalid 84Wdf796-66cc-4655-9b89-d6218d100f9c string');
        }
    })

    /**
     * @tc.name: testUtilgenerateRandomUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilgenerateRandomUUID001', 0, async function () {
        var result = util.generateRandomUUID(true);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.name: testUtilgenerateRandomUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilgenerateRandomUUID002', 0, async function () {
        var result = util.generateRandomUUID(false);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.name: testUtilgenerateRandomBinaryUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilgenerateRandomBinaryUUID001', 0, async function () {
        var result = util.generateRandomBinaryUUID(true);
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.name: testUtilgenerateRandomBinaryUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilgenerateRandomBinaryUUID002', 0, async function () {
        var result = util.generateRandomBinaryUUID(false);
        expect(result.length).assertEqual(16);
    })
})

describe('ScopeHelperTest', function () {
    /**
     * @tc.name: test_getLower_001
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_001', 0, function () {
        var result = rangeHp.getLower()
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.name: test_getLower_002
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_002', 0, function () {
        var result = rangeHpFir.getLower()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name: test_getLower_003
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_003', 0, function () {
        var result = rangeHpSec.getLower()
        expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.name: test_getLower_004
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_004', 0, function () {
        var result = rangeHpThi.getLower()
        expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.name: test_getLower_005
     * @tc.desc: Obtains the lower bound of the current range.
     */
    it('test_getLower_005', 0, function () {
        var result = rangeHpFif.getLower()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name: test_getUpper_001
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_001', 0, function () {
        var result = rangeHp.getUpper()
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.name: test_getUpper_002
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_002', 0, function () {
        var result = rangeHpFir.getUpper()
        expect(result.toString()).assertEqual('39')
    })

    /**
     * @tc.name: test_getUpper_003
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_003', 0, function () {
        var result = rangeHpSec.getUpper()
        expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.name: test_getUpper_004
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_004', 0, function () {
        var result = rangeHpThi.getUpper()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name: test_getUpper_005
     * @tc.desc: Obtains the upper bound of the current range.
     */
    it('test_getUpper_005', 0, function () {
        var result = rangeHpFif.getUpper()
        expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.name: test_clamp_001
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_001', 0, function () {
        var result = rangeHp.clamp(tempLess)
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.name: test_clamp_002
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_002', 0, function () {
        var result = rangeHp.clamp(tempMiDF)
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.name: test_clamp_003
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_003', 0, function () {
        var result = rangeHp.clamp(tempMore)
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.name: test_clamp_004
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_004', 0, function () {
        var result = rangeHp.clamp(tempLower)
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.name: test_clamp_005
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_005', 0, function () {
        var result = rangeHp.clamp(tempUpper)
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.name: test_contains_001
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_001', 0, function () {
        var result = rangeHp.contains(tempLess)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_002
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_002', 0, function () {
        var result = rangeHp.contains(tempMiDF)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_contains_003
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_003', 0, function () {
        var result = rangeHp.contains(tempMore)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_004
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_004', 0, function () {
        var result = rangeHp.contains(tempLower)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_contains_005
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_005', 0, function () {
        var result = rangeHp.contains(tempUpper)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_contains_006
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_006', 0, function () {
        var result = rangeHp.contains(rangeHpFir)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_contains_007
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_007', 0, function () {
        var result = rangeHp.contains(rangeHpSec)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_008
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_008', 0, function () {
        var result = rangeHp.contains(rangeHpThi)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_009
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_009', 0, function () {
        var result = rangeHp.contains(rangeHpFif)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: test_contains_010
     * @tc.desc: Checks whether a given range is within the current range.
     */
    it('test_contains_010', 0, function () {
        var result = rangeHp.contains(rangeHp)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: test_expand_001
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_001', 0, function () {
        var result = rangeHp.expand(tempMiDF, tempMidS)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_002
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_002', 0, function () {
        var result = rangeHp.expand(tempLess, tempMore)
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name: test_expand_003
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_003', 0, function () {
        var result = rangeHp.expand(tempLess, tempMiDF)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name: test_expand_004
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_004', 0, function () {
        var result = rangeHp.expand(tempMiDF, tempMore)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name: test_expand_005
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_005', 0, function () {
        var result = rangeHp.expand(tempLower, tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_006
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_006', 0, function () {
        var result = rangeHp.expand(rangeHpFir)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_007
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_007', 0, function () {
        var result = rangeHp.expand(rangeHpSec)
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name: test_expand_008
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_008', 0, function () {
        var result = rangeHp.expand(rangeHpThi)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name: test_expand_009
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_009', 0, function () {
        var result = rangeHp.expand(rangeHpFif)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name: test_expand_010
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_010', 0, function () {
        var result = rangeHp.expand(rangeHp)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_011
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_011', 0, function () {
        var result = rangeHp.expand(tempMiDF)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_012
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_012', 0, function () {
        var result = rangeHp.expand(tempLess)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name: test_expand_013
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_013', 0, function () {
        var result = rangeHp.expand(tempMore)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name: test_expand_014
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_014', 0, function () {
        var result = rangeHp.expand(tempLower)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_expand_015
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     */
    it('test_expand_015', 0, function () {
        var result = rangeHp.expand(tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_intersect_001
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_001', 0, function () {
        var result = rangeHp.intersect(rangeHpFir)
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name: test_intersect_002
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_002', 0, function () {
        var result = rangeHp.intersect(rangeHpSec)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_intersect_003
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_003', 0, function () {
        var result = rangeHp.intersect(rangeHpThi)
        expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.name: test_intersect_004
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_004', 0, function () {
        var result = rangeHp.intersect(rangeHpFif)
        expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.name: test_intersect_005
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_005', 0, function () {
        var result = rangeHp.intersect(rangeHp)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_intersect_006
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_006', 0, function () {
        var result = rangeHp.intersect(tempMiDF, tempMidS)
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name: test_intersect_007
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_007', 0, function () {
        var result = rangeHp.intersect(tempLess, tempMore)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_intersect_008
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_008', 0, function () {
        var result = rangeHp.intersect(tempLess, tempMiDF)
        expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.name: test_intersect_009
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_009', 0, function () {
        var result = rangeHp.intersect(tempMiDF, tempMore)
        expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.name: test_intersect_010
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_010', 0, function () {
        var result = rangeHp.intersect(tempLower, tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_toString_001
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_001', 0, function () {
        var result = rangeHp.toString()
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name: test_toString_002
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_002', 0, function () {
        var result = rangeHpFir.toString()
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name: test_toString_003
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_003', 0, function () {
        var result = rangeHpSec.toString()
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name: test_toString_004
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_004', 0, function () {
        var result = rangeHpThi.toString()
        expect(result.toString()).assertEqual('[20, 35]')
    })

    /**
     * @tc.name: test_toString_005
     * @tc.desc: Obtains a string representation of the current range.
     */
    it('test_toString_005', 0, function () {
        var result = rangeHpFif.toString()
        expect(result.toString()).assertEqual('[35, 45]')
    })

    /**
     * @tc.name: test_constructor_throwError_001
     * @tc.desc: A constructor used to create a Scope instance with the lower and upper bounds specified.
     */
    it('test_constructor_throwError_001', 0, function () {
        try {
            var range = new util.ScopeHelper(1, 2);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 1 must be object");
        }
    })

    /**
     * @tc.name: test_intersect_throwError_001
     * @tc.desc: Returns the intersection of a given range and the current range.
     */
    it('test_intersect_throwError_001', 0, function () {
        try {
            var result = rangeHp.intersect("str")
            expect(result.toString()).assertEqual('[35, 39]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of str must be ScopeHelper or ScopeType");
        }
    })

    /**
     * @tc.name: test_intersect_throwError_002
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
     */
    it('test_intersect_throwError_002', 0, function () {
        try {
            var result = rangeHp.intersect(tempMiDF, 123)
            expect(result.toString()).assertEqual('[35, 39]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be ScopeType");
        }
    })

    /**
     * @tc.name: test_expand_throwError_001
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     */
    it('test_expand_throwError_001', 0, function () {
        try {
            var result = rangeHp.expand(tempMiDF, "123")
            expect(result.toString()).assertEqual('[30, 40]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be ScopeType");
        }
    })

    /**
     * @tc.name: test_expand_throwError_002
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     */
    it('test_expand_throwError_002', 0, function () {
        try {
            var result = rangeHp.expand(123)
            expect(result.toString()).assertEqual('[30, 40]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be ScopeHelper or ScopeType");
        }
    })

    /**
     * @tc.name: test_contains_throwError_001
     * @tc.desc: Checks whether a given value is within the current range.
     */
    it('test_contains_throwError_001', 0, function () {
        try {
            var result = rangeHp.contains("str")
            expect(result).assertEqual(true)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of str must be object or ScopeHelper");
        }
    })

    /**
     * @tc.name: test_clamp_throwError_001
     * @tc.desc: Clamps a given value to the current range.
     */
    it('test_clamp_throwError_001', 0, function () {
        try {
             var result = rangeHp.clamp(123)
             expect(result.toString()).assertEqual('30')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be object");
        }
    })
})

describe('LRUCacheTest', function () {
    /**
     * @tc.name: testLRUCacheUpdateGetCapacity001
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLRUCacheUpdateGetCapacity001', 0, function () {
        var that = new util.LRUCache()
        that.updateCapacity(10)
        var result = that.getCapacity()
        expect(result).assertEqual(10)
    })

    /**
     * @tc.name: testLRUCacheUpdateGetCapacity002
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLRUCacheUpdateGetCapacity002', 0, function () {
        var that = new util.LRUCache()
        that.updateCapacity(2147483646)
        var result = that.getCapacity()
        expect(result).assertEqual(2147483646)
    })

    /**
     * @tc.name: testLRUCacheUpdateGetCapacity003
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLRUCacheUpdateGetCapacity003', 0, function () {
        var that = new util.LRUCache(100)
        that.updateCapacity(20)
        var result = that.getCapacity()
        expect(result).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCacheUpdateGetCapacity004
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLRUCacheUpdateGetCapacity004', 0, function () {
        var that = new util.LRUCache(50)
        that.updateCapacity(2)
        var result = that.getCapacity()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLRUCacheUpdateGetCapacity005
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLRUCacheUpdateGetCapacity005', 0, function () {
        var that = new util.LRUCache(200)
        that.updateCapacity(100)
        var result = that.getCapacity()
        expect(result).assertEqual(100)
    })

    /**
     * @tc.name: testLRUCacheUpdateGetCapacity006
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     */
    it('testLRUCacheUpdateGetCapacity006', 0, function () {
        var that = new util.LRUCache(200)
        try {
            that.updateCapacity('a');
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of a must be number');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of a must be number");
        }
    })

    /**
     * @tc.name: testLRUCacheGet001
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLRUCacheGet001', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        var result = that.get(1)
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLRUCacheGet002
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLRUCacheGet002', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        var result = that.get(5)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheGet003
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLRUCacheGet003', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        var result1 = that.get(20)
        var result2 = that.get('abcd')
        var result3 = that.get(2)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(15)
        expect(result3).assertEqual(10)
    })

    /**
     * @tc.name: testLRUCacheGet004
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLRUCacheGet004', 0, function () {
        var that = new util.LRUCache()
        that.put('1111','bcjdshc')
        that.put(20,'cdjcaxb')
        that.put('abcd',15)
        var result1 = that.get('1111')
        var result2 = that.get(20)
        var result3 = that.get('abcd')
        var result4 = that.get(25)
        expect(result1).assertEqual('bcjdshc')
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheGet005
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLRUCacheGet005', 0, function () {
        var that = new util.LRUCache()
        that.put('1111','bcjdshc')
        that.put(20,'cdjcaxb')
        that.updateCapacity(2)
        that.put('abcd',15)
        var result1 = that.get('1111')
        var result2 = that.get(20)
        var result3 = that.get('abcd')
        var result4 = that.get(25)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheGet006
     * @tc.desc: Obtains the value associated with a specified key.
     */
    it('testLRUCacheGet006', 0, function () {
        var that = new util.LRUCache()
        let un = undefined;
        that.put(20,'cdjcaxb')
        try {
            var result1 = that.get(un);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
        }
    })

    /**
     * @tc.name: testLRUCachePut001
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLRUCachePut001', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        expect(temp).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCachePut002
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLRUCachePut002', 0, function () {
        var that = new util.LRUCache()
        var temp1 = that.put('1111','bcjdshc')
        var temp2 = that.put('1111',13)
        expect(temp2).assertEqual('bcjdshc')
    })

    /**
     * @tc.name: testLRUCachePut003
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLRUCachePut003', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        var temp3 = that.put(2,'adasfdad')
        var temp4 = that.put('abc',10)
        expect(temp1).assertEqual(undefined)
        expect(temp2).assertEqual(undefined)
        expect(temp3).assertEqual(5)
        expect(temp4).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCachePut004
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLRUCachePut004', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        that.updateCapacity(2)
        var temp3 = that.put(2,'adasfdad')
        var temp4 = that.put('1111',10)
        expect(temp).assertEqual(undefined)
        expect(temp1).assertEqual(undefined)
        expect(temp2).assertEqual(undefined)
        expect(temp3).assertEqual(5)
        expect(temp4).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCachePut005
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLRUCachePut005', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        var temp3 = that.put(1,10)
        var temp4 = that.put(2,22)
        var temp5 = that.put(2,30)
        expect(temp).assertEqual(undefined)
        expect(temp1).assertEqual(undefined)
        expect(temp2).assertEqual(undefined)
        expect(temp3).assertEqual(12)
        expect(temp4).assertEqual(5)
        expect(temp5).assertEqual(22)
    })

    /**
     * @tc.name: testLRUCachePut006
     * @tc.desc: Adds a key-value pair to the buffer.
     */
    it('testLRUCachePut006', 0, function () {
        var that = new util.LRUCache()
        let un = undefined;
        try {
            that.put(un,'bcjdshc')
          } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
          }
    })

    /**
     * @tc.name: testLRUCacheGetCreateCount001
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLRUCacheGetCreateCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(3)
        that.get(5)
        that.get(10)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetCreateCount002
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLRUCacheGetCreateCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(6)
        that.get(8)
        that.get(20)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetCreateCount003
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLRUCacheGetCreateCount003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.get('abc')
        that.get('cndk')
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetCreateCount004
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLRUCacheGetCreateCount004', 0, function () {
        var that = new util.LRUCache()
        that.put(5,2)
        that.put(10,10)
        that.put('abcd','abcd')
        that.get(3)
        that.get(20)
        that.get(12)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetCreateCount005
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     */
    it('testLRUCacheGetCreateCount005', 0, function () {
        var that = new util.LRUCache()
        that.put('xsjk','bcjds')
        that.put('ajc',10)
        that.put('abcd',15)
        that.get(2)
        that.get(10)
        that.get(30)
        var result = that.getCreateCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetMissCount001
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLRUCacheGetMissCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(3)
        that.get(5)
        that.get(10)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetMissCount002
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLRUCacheGetMissCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(5,2)
        that.put(1,10)
        that.put('abcd','bcjsc')
        that.get(2)
        that.get(10)
        that.get(15)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetMissCount003
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLRUCacheGetMissCount003', 0, function () {
        var that = new util.LRUCache()
        that.put(10,10)
        that.put(3,20)
        that.put(12,16)
        that.get(1)
        that.get(2)
        that.get(6)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetMissCount004
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLRUCacheGetMissCount004', 0, function () {
        var that = new util.LRUCache()
        that.put('acb','asdc')
        that.put('vfb',1)
        that.put('abcd','abcd')
        that.get(3)
        that.get(5)
        that.get(10)
        var result = that.getMissCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetMissCount005
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLRUCacheGetMissCount005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(3)
        that.get(5)
        that.get(10)
        that.contains(2)
        that.contains(6)
        var result = that.getMissCount()
        expect(result).assertEqual(4)
    })

    /**
     * @tc.name: testLRUCacheGetMissCount006
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     */
    it('testLRUCacheGetMissCount006', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        var result = that.getMissCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetRemovalCount001
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLRUCacheGetRemovalCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put(3,20)
        that.put(5,30)
        var result = that.getRemovalCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetRemovalCount002
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLRUCacheGetRemovalCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(10,2)
        that.put(3,2)
        that.put(15,15)
        that.put(1,20)
        var result = that.getRemovalCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetRemovalCount003
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLRUCacheGetRemovalCount003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc',2)
        that.put('abcd','abcd')
        that.put(3,2)
        var result = that.getRemovalCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetRemovalCount004
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLRUCacheGetRemovalCount004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.updateCapacity(2)
        that.put(3,20)
        that.put(5,30)
        var result = that.getRemovalCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetRemovalCount005
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     */
    it('testLRUCacheGetRemovalCount005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.updateCapacity(3)
        that.put('string',20)
        that.put('abc',30)
        that.put(10,20)
        var result = that.getRemovalCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetMatchCount001
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLRUCacheGetMatchCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        var result = that.getMatchCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetMatchCount002
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLRUCacheGetMatchCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(10,2)
        that.put(2,1)
        that.put('abcd',15)
        that.get(10)
        that.get(2)
        that.get('abcd')
        that.get('string')
        var result = that.getMatchCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetMatchCount003
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLRUCacheGetMatchCount003', 0, function () {
        var that = new util.LRUCache()
        that.put(0,1)
        that.put(30,10)
        that.put('abcd',15)
        that.get(0)
        that.get(30)
        that.get('abcd')
        var result = that.getMatchCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetMatchCount004
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLRUCacheGetMatchCount004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.contains(2)
        that.contains('abcd')
        that.contains(20)
        var result = that.getMatchCount()
        expect(result).assertEqual(5)
    })

    /**
     * @tc.name: testLRUCacheGetMatchCount005
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLRUCacheGetMatchCount005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put('string','string')
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.get('string')
        that.contains(2)
        that.contains('abcd')
        that.contains('string')
        that.contains(10)
        var result = that.getMatchCount()
        expect(result).assertEqual(7)
    })

    /**
     * @tc.name: testLRUCacheGetMatchCount006
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     */
    it('testLRUCacheGetMatchCount006', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.get(5)
        var result = that.getMatchCount()
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheGetPutCount001
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLRUCacheGetPutCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.getPutCount()
        expect(result).assertEqual(1)
    })

    /**
     * @tc.name: testLRUCacheGetPutCount002
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLRUCacheGetPutCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(5,3)
        that.put(2,10)
        var result = that.getPutCount()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLRUCacheGetPutCount003
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLRUCacheGetPutCount003', 0, function () {
        var that = new util.LRUCache()
        that.put('string',2)
        that.put('abcd',1)
        that.put('ab','a')
        var result = that.getPutCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetPutCount004
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLRUCacheGetPutCount004', 0, function () {
        var that = new util.LRUCache()
        that.put('string','string')
        that.put('ac','abc')
        that.put('abcd',15)
        var result = that.getPutCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetPutCount005
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     */
    it('testLRUCacheGetPutCount005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.updateCapacity(2)
        that.put('abcd','abc')
        var result = that.getPutCount()
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheGetCapacity001
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLRUCacheGetCapacity001', 0, function () {
        var that = new util.LRUCache()
        var result = that.getCapacity()
        expect(result).assertEqual(64)
    })

    /**
     * @tc.name: testLRUCacheGetCapacity002
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLRUCacheGetCapacity002', 0, function () {
        var that = new util.LRUCache(2)
        var result = that.getCapacity()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLRUCacheGetCapacity003
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLRUCacheGetCapacity003', 0, function () {
        var that = new util.LRUCache(100)
        var result = that.getCapacity()
        expect(result).assertEqual(100)
    })

    /**
     * @tc.name: testLRUCacheGetCapacity004
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLRUCacheGetCapacity004', 0, function () {
        var that = new util.LRUCache()
        that.updateCapacity(50)
        var result = that.getCapacity()
        expect(result).assertEqual(50)
    })

    /**
     * @tc.name: testLRUCacheGetCapacity005
     * @tc.desc: Obtains the capacity of the current buffer.
     */
    it('testLRUCacheGetCapacity005', 0, function () {
        var that = new util.LRUCache(100)
        that.updateCapacity(10)
        var result = that.getCapacity()
        expect(result).assertEqual(10)
    })

    /**
     * @tc.name: testLRUCacheLength001
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLRUCacheLength001', 0, function () {
        var that = new util.LRUCache()
        var result = that.length
        expect(result).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheLength002
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLRUCacheLength002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.length
        expect(result).assertEqual(1)
    })

    /**
     * @tc.name: testLRUCacheLength003
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLRUCacheLength003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc',2)
        that.put('string','string')
        var result = that.length
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLRUCacheLength004
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLRUCacheLength004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put('abcd',20)
        var result = that.length
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheLength005
     * @tc.desc: Obtains the total number of values in the current buffer.
     */
    it('testLRUCacheLength005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put('abcd',15)
        that.put('abcd',20)
        that.updateCapacity(3);
        that.put(5,33);
        that.put(25,35);
        var result = that.length
        expect(result).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheClear001
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLRUCacheClear001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(1)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheClear002
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLRUCacheClear002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.put(25,35);
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheClear003
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLRUCacheClear003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc',2)
        that.put(2,'abc')
        that.put('ancd','abcd')
        that.put(10,35)
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheClear004
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLRUCacheClear004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.updateCapacity(3);
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(3)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheClear005
     * @tc.desc: Clears key-value pairs from the current buffer.
     */
    it('testLRUCacheClear005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.put('abcd','string');
        that.updateCapacity(2);
        var result1 = that.length
        that.clear()
        var result2 = that.length
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(0)
    })

    /**
     * @tc.name: testLRUCacheIsEmpty001
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLRUCacheIsEmpty001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLRUCacheIsEmpty002
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLRUCacheIsEmpty002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLRUCacheIsEmpty003
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLRUCacheIsEmpty003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLRUCacheIsEmpty004
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLRUCacheIsEmpty004', 0, function () {
        var that = new util.LRUCache()
        that.put('abc',2)
        that.put('string',10)
        that.put('ab','abc')
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLRUCacheIsEmpty005
     * @tc.desc: Checks whether the current buffer is empty.
     */
    it('testLRUCacheIsEmpty005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        that.put(5,33);
        that.clear()
        var result = that.isEmpty()
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testLRUCacheContains001
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLRUCacheContains001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.contains(1)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testLRUCacheContains002
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLRUCacheContains002', 0, function () {
        var that = new util.LRUCache()
        that.put(0,5)
        var result = that.contains(0)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.name: testLRUCacheContains003
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLRUCacheContains003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc','abc')
        var result = that.contains(1)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.name: testLRUCacheContains004
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLRUCacheContains004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put('abcd',20)
        var result1 = that.contains(1)
        var result2 = that.contains(20)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(false)
    })

    /**
     * @tc.name: testLRUCacheContains005
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLRUCacheContains005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put('string','string')
        var result1 = that.contains(1)
        var result2 = that.contains('string')
        var result3 = that.contains(0)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(true)
        expect(result3).assertEqual(false)
    })

    /**
     * @tc.name: testLRUCacheContains006
     * @tc.desc: Checks whether the current buffer contains a specified key.
     */
    it('testLRUCacheContains006', 0, function () {
        var that = new util.LRUCache()
        that.put('abc','abc')
        let un = undefined;
        try {
            that.contains(un)
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
        }
    })

    /**
     * @tc.name: testLRUCacheRemove001
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLRUCacheRemove001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.remove(1)
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: testLRUCacheRemove002
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLRUCacheRemove002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put('abcd',20)
        var result1 = that.remove(1)
        var result2 = that.remove('abcd')
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCacheRemove003
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLRUCacheRemove003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result1 = that.remove(1)
        var result2 = that.remove(5)
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheRemove004
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLRUCacheRemove004', 0, function () {
        var that = new util.LRUCache()
        that.put(0,'abc')
        that.put('abcd',20)
        var result1 = that.remove(1)
        var result2 = that.remove('abcd')
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCacheRemove005
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLRUCacheRemove005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        var result1 = that.remove(1)
        var result2 = that.remove(3)
        var result3 = that.get(3)
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(10)
        expect(result3).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheRemove006
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     */
    it('testLRUCacheRemove006', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        let un = undefined;
        try {
            that.remove(un)
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
        }
    })

    /**
     * @tc.name: testLRUCacheCreateDefault001
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLRUCacheCreateDefault001', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault(1)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheCreateDefault002
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLRUCacheCreateDefault002', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault(0)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheCreateDefault003
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLRUCacheCreateDefault003', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault('string')
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheCreateDefault004
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLRUCacheCreateDefault004', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault(10)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheCreateDefault005
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLRUCacheCreateDefault005', 0, function () {
        var that = new util.LRUCache()
        var result1 = that.createDefault('abc')
        var result2 = that.createDefault('ab')
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.name: testLRUCacheCreateDefault006
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     */
    it('testLRUCacheCreateDefault006', 0, function () {
        var that = new util.LRUCache()
        let un = undefined;
        try {
            that.createDefault(un);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error.The type of undefined must be Object");
        }
    })

    /**
     * @tc.name: testLRUCacheKeys001
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLRUCacheKeys001', 0, function () {
        var that = new util.LRUCache()
        that.put('string','abc')
        var result = that.keys()
        expect(result[0]).assertEqual('string')
    })

    /**
     * @tc.name: testLRUCacheKeys002
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLRUCacheKeys002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        var result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(3)
        expect(result[2]).assertEqual(5)
        expect(result[3]).assertEqual('abc')
    })

    /**
     * @tc.name: testLRUCacheKeys003
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLRUCacheKeys003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(5)
        expect(result[2]).assertEqual('abc')
        expect(result[3]).assertEqual(3)
    })

    /**
     * @tc.name: testLRUCacheKeys004
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLRUCacheKeys004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.contains(1)
        var result = that.keys()
        expect(result[0]).assertEqual(5)
        expect(result[1]).assertEqual('abc')
        expect(result[2]).assertEqual(3)
        expect(result[3]).assertEqual(1)
    })

    /**
     * @tc.name: testLRUCacheKeys005
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     */
    it('testLRUCacheKeys005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        var result = that.keys()
        expect(result[0]).assertEqual(3)
        expect(result[1]).assertEqual(1)
        expect(result[2]).assertEqual('abc')
    })

    /**
     * @tc.name: testLRUCacheValues001
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLRUCacheValues001', 0, function () {
        var that = new util.LRUCache()
        that.put('string','abc')
        var result = that.values()
        expect(result[0]).assertEqual('abc')
    })

    /**
     * @tc.name: testLRUCacheValues002
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLRUCacheValues002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        var result = that.values()
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertEqual(10)
        expect(result[2]).assertEqual(15)
        expect(result[3]).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCacheValues003
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLRUCacheValues003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var result = that.values()
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertEqual(15)
        expect(result[2]).assertEqual(20)
        expect(result[3]).assertEqual(10)
    })

    /**
     * @tc.name: testLRUCacheValues004
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLRUCacheValues004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.contains(1)
        var result = that.values()
        expect(result[0]).assertEqual(15)
        expect(result[1]).assertEqual(20)
        expect(result[2]).assertEqual(10)
        expect(result[3]).assertEqual(2)
    })

    /**
     * @tc.name: testLRUCacheValues005
     * @tc.desc: Obtains a list of all values in the current buffer.
     */
    it('testLRUCacheValues005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        var result = that.values()
        expect(result[0]).assertEqual(10)
        expect(result[1]).assertEqual(2)
        expect(result[2]).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCacheToString001
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLRUCacheToString001', 0, function () {
        var that = new util.LRUCache()
        that.put('1111','bcjdshc')
        that.put(1,2)
        var result = that.toString()
        expect(result).assertEqual('LRUCache[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]')
    })

    /**
     * @tc.name: testLRUCacheToString002
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLRUCacheToString002', 0, function () {
        var that = new util.LRUCache()
        that.put('1111','bcjdshc')
        that.put(1,2)
        that.get(1)
        that.get('1111')
        var result = that.toString()
        expect(result).assertEqual('LRUCache[ maxSize = 64, hits = 2, misses = 0, hitRate = 100% ]')
    })

    /**
     * @tc.name: testLRUCacheToString003
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLRUCacheToString003', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var result = that.toString()
        expect(result).assertEqual('LRUCache[ maxSize = 100, hits = 1, misses = 0, hitRate = 100% ]')
    })

    /**
     * @tc.name: testLRUCacheToString004
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLRUCacheToString004', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.get(2)
        var result = that.toString()
        expect(result).assertEqual('LRUCache[ maxSize = 100, hits = 1, misses = 1, hitRate = 50% ]')
    })

    /**
     * @tc.name: testLRUCacheToString005
     * @tc.desc: Returns a string representation of the object.
     */
    it('testLRUCacheToString005', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.get(2)
        that.get(1)
        that.contains(5)
        var result = that.toString()
        expect(result).assertEqual('LRUCache[ maxSize = 100, hits = 3, misses = 1, hitRate = 75% ]')
    })

    /**
     * @tc.name: testLRUCacheEntries001
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLRUCacheEntries001', 0, function () {
        var that = new util.LRUCache()
        that.put('string','abc')
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual('abc');
    })

    /**
     * @tc.name: testLRUCacheEntries002
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLRUCacheEntries002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(2);
    })

    /**
     * @tc.name: testLRUCacheEntries003
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLRUCacheEntries003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[0]).assertEqual(1);
    })

    /**
     * @tc.name: testLRUCacheEntries004
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLRUCacheEntries004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.contains(1)
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(15)
        expect(arr[3]).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCacheEntries005
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     */
    it('testLRUCacheEntries005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        var i=0;
        var arr={};
        for (let entry of that.entries()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(10)
        expect(arr[3]).assertEqual(2)
        expect(arr[5]).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCache[Symbol.iterator]001
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLRUCache[Symbol.iterator]001', 0, function () {
        var that = new util.LRUCache()
        that.put('string','abc')
        that.put('abc',20)
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual('abc');
    })

    /**
     * @tc.name: testLRUCache[Symbol.iterator]002
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLRUCache[Symbol.iterator]002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(2);
    })

    /**
     * @tc.name: testLRUCache[Symbol.iterator]003
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLRUCache[Symbol.iterator]003', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[0]).assertEqual(1);
    })

    /**
     * @tc.name: testLRUCache[Symbol.iterator]004
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLRUCache[Symbol.iterator]004', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.contains(1)
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(15)
        expect(arr[3]).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCache[Symbol.iterator]005
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     */
    it('testLRUCache[Symbol.iterator]005', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(3,10)
        that.put(5,15)
        that.put('abc',20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        var i=0;
        var arr={};
        for (let entry of that[Symbol.iterator]()) {
            arr[i]=entry[0];
            i++;
            arr[i]=entry[1];
            i++;
        }
        expect(arr[1]).assertEqual(10)
        expect(arr[3]).assertEqual(2)
        expect(arr[5]).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCacheAfterRemoval001
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLRUCacheAfterRemoval001', 0, function () {
        var arr = [];
        class ChildLRUCache extends util.LRUCache
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLRUCache();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLRUCache.getInstance().afterRemoval(false,10,30,null)
        expect(arr[0]).assertEqual(10)
    })

    /**
     * @tc.name: testLRUCacheAfterRemoval002
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLRUCacheAfterRemoval002', 0, function () {
        var arr = [];
        class ChildLRUCache extends util.LRUCache
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLRUCache();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLRUCache.getInstance().afterRemoval(false,'string',10,null)
        expect(arr[0]).assertEqual('string')
    })

    /**
     * @tc.name: testLRUCacheAfterRemoval003
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLRUCacheAfterRemoval003', 0, function () {
        var arr = [];
        class ChildLRUCache extends util.LRUCache
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLRUCache();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLRUCache.getInstance().afterRemoval(false,10,30,12)
        expect(arr[2]).assertEqual(12)
    })

    /**
     * @tc.name: testLRUCacheAfterRemoval004
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLRUCacheAfterRemoval004', 0, function () {
        var arr = [];
        class ChildLRUCache extends util.LRUCache
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLRUCache();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLRUCache.getInstance().afterRemoval(false,'abc',30,'string')
        expect(arr[1]).assertEqual(30)
    })

    /**
     * @tc.name: testLRUCacheAfterRemoval005
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLRUCacheAfterRemoval005', 0, function () {
        var arr = [];
        class ChildLRUCache extends util.LRUCache
        {
            constructor()
            {
                super();
            }
            static getInstance()
            {
                if(this.instance ==  null)
                {
                    this.instance = new ChildLRUCache();
                }
                return this.instance;
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === true)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        ChildLRUCache.getInstance().afterRemoval(true,'abc','ab','string')
        expect(arr[2]).assertEqual('string')
    })

    /**
     * @tc.name: testLRUCacheAfterRemoval006
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLRUCacheAfterRemoval006', 0, function () {
        var arr = [];
        class ChildLRUCache extends util.LRUCache
        {
            constructor(capacity)
            {
                super(capacity);
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === true)
                {
                    arr = [key, value];
                }
            }
        }
        var that = new ChildLRUCache(2);
        that.put(1,2)
        that.put(3,10)
        that.put('abc',20)
        expect(arr[1]).assertEqual(20)
    })

    /**
     * @tc.name: testLRUCacheAfterRemoval007
     * @tc.desc: Executes subsequent operations after a value is deleted.
     */
    it('testLRUCacheAfterRemoval007', 0, function () {
        var arr = [];
        class ChildLRUCache extends util.LRUCache
        {
            constructor(capacity)
            {
                super(capacity);
            }
            afterRemoval(isEvict, key, value, newValue)
            {
                if (isEvict === false)
                {
                    arr = [key, value, newValue];
                }
            }
        }
        var that = new ChildLRUCache(3);
        that.put(1,2)
        that.put(3,10)
        that.put(1,8)
        expect(arr[2]).assertEqual(8)
    })
})

describe('FunctionTest', function () {
    /**
     * @tc.name: testUtilformat001
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilformat001', 0, function () {
        var format = "%i,%s";
        var value1 = 1.5;
        var value2 = "qwer";
        var value3 = 15;
        var result = util.format(format, value1, value2, value3);
        expect(result).assertEqual("1,qwer 15");
    })

    /**
     * @tc.name: testUtilformat002
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilformat002', 0, function () {
        var format = "%O";
        var value = { name: 'jack' ,age: 15 };
        var result = util.format(format, value);
        expect(result).assertEqual("{ name: 'jack',\n  age: 15 }");
    })

    /**
     * @tc.name: testUtilformat003
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilformat003', 0, function () {
        var format = "%o";
        var value = [1, 2, 3];
        var result = util.format(format, value);
        var res = '[ 1, 2, 3, [length]: 3 ]'
        expect(result).assertEqual('[ 1, 2, 3, [length]: 3 ]');
    })

    /**
     * @tc.name: testUtilformat004
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilformat004', 0, function () {
        var format = "%s,%s,%s";
        var value1 = "1.5";
        var value2 = "qwer";
        var result = util.format(format, value1, value2);
        expect(result).assertEqual('1.5,qwer,%s');
    })

    /**
     * @tc.name: testUtilformat005
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilformat005', 0, function () {
        var format = "%d,%d";
        var value1 = 6;
        var value2 = 16;
        var result = util.format(format, value1, value2);
        expect(result).assertEqual('6,16');
    })

    /**
     * @tc.name: testUtilformatThrowError001
     * @tc.desc: Returns the formatted string.
     */
    it('testUtilformatThrowError001', 0, function () {
        try {
            var format = 123;
            var value1 = 1.5;
            var value2 = "qwer";
            var value3 = 15;
            var result = util.format(format, value1, value2, value3);
            expect(result).assertEqual("1,qwer 15");
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be string or array");
        }
    })

    /**
     * @tc.name: testUtilerrnoToString001
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilerrnoToString001', 0, async function () {
        var errnum = 10;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('Unknown system error 10');
    })

    /**
     * @tc.name: testUtilerrnoToString002
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilerrnoToString002', 0, async function () {
        var errnum = 0;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('Unknown system error 0');
    })

    /**
     * @tc.name: testUtilerrnoToString003
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilerrnoToString003', 0, async function () {
        var errnum = -1;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('operation not permitted');
    })

    /**
     * @tc.name: testUtilerrnoToString004
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilerrnoToString004', 0, async function () {
        var errnum = 9;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('Unknown system error 9');
    })

    /**
     * @tc.name: testUtilerrnoToString005
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilerrnoToString005', 0, async function () {
        var errnum = 555;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('Unknown system error 555');
    })

    /**
     * @tc.name: testUtilerrnoToStringThrowError001
     * @tc.desc: Get the string name of the system errno.
     */
    it('testUtilerrnoToStringThrowError001', 0, async function () {
        try {
            var errnum = 'str';
            var result = util.errnoToString(errnum);
            expect(result).assertEqual('Unknown system error 10');
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of str must be number");
        }
    })

    /**
     * @tc.name: testUtilPromisifyThrowError001
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a function that returns promises.
     */
    it('testUtilPromisifyThrowError001', 0, async function () {
        try {
            var fn = 'str';
            (async () => {
                const value = await util.promisify(fn);
                expect(value(null, "Hello")).strictEqual('Hello');
            })();
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of fn must be function");
        }
    })

    /**
     * @tc.name: testUtilRandomUUIDThrowError001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */

    it('testUtilRandomUUIDThrowError001', 0, async function () {
        try {
            var result = util.randomUUID(123);
            expect(result.length).assertEqual(36);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be boolean");
        }
    })

    /**
     * @tc.name: testUtilRandomBinaryUUIDThrowError001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilRandomBinaryUUIDThrowError001', 0, async function () {
        try {
            var result = util.randomBinaryUUID(123);
            expect(result.length).assertEqual(16);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be boolean");
        }
    })

    /**
     * @tc.name: testUtilParseUUIDThrow001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     */
    it('testUtilParseUUIDThrow001', 0, async function () {
        try {
            var result = util.parseUUID(123);
            expect(result.length).assertEqual(16);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Syntax Error.Invalid 123 string");
        }
    })
})

describe('RationalNumberTest', function () {
    /**
     * @tc.name: test_parseRationalNumber_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_parseRationalNumber_001', 0, function () {
        var res = util.RationalNumber.parseRationalNumber(2, 1)
        var result = res.valueOf()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.name: test_parseRationalNumberThrowError_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_parseRationalNumberThrowError_001', 0, function () {
        try {
            var pro = util.RationalNumber.parseRationalNumber('str', 2)
            var result = res.valueOf()
            expect(result).assertEqual(2)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of str must be number");
        }
    })

    /**
     * @tc.name: test_createRationalFromString_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_001', 0, function () {
        var res = util.RationalNumber.createRationalFromString('-1:2')
        var result = res.valueOf()
        expect(result).assertEqual(-0.5)
    })

    /**
     * @tc.name: test_createRationalFromString_002
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_002', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+3/4')
        var result = res.valueOf()
        expect(result).assertEqual(0.75)
    })

    /**
     * @tc.name: test_createRationalFromString_003
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_003', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+3:-4')
        var result = res.valueOf()
        expect(result).assertEqual(-0.75)
    })

    /**
     * @tc.name: test_createRationalFromString_004
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_004', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+2:4')
        var result = res.valueOf()
        expect(result).assertEqual(0.5)
    })

    /**
     * @tc.name: test_createRationalFromString_005
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromString_005', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+2:-4')
        var result = res.valueOf()
        expect(result).assertEqual(-0.5)
    })

    /**
     * @tc.name: test_createRationalFromStringThrowError_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     */
    it('test_createRationalFromStringThrowError_001', 0, function () {
        try {
            var res = util.RationalNumber.createRationalFromString(123)
            var result = res.valueOf()
            expect(result).assertEqual(-0.5)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of 123 must be string");
        }
    })

    /**
     * @tc.name: test_compare_001
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compare_001', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(2, 1)
        var proc = util.RationalNumber.parseRationalNumber(3, 4)
        var res = pro.compare(proc)
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: test_compare_002
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compare_002', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(2, 1)
        var proc = util.RationalNumber.parseRationalNumber(0, 0)
        var res = pro.compare(proc)
        expect(res).assertEqual(-1)
    })

    /**
     * @tc.name: test_compare_003
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compare_003', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(2, 1)
        var proc = util.RationalNumber.parseRationalNumber(8, 3)
        var res = pro.compare(proc)
        expect(res).assertEqual(-1)
    })

    /**
     * @tc.name: test_compare_004
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compare_004', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(2, 1)
        var proc = util.RationalNumber.parseRationalNumber(2, 1)
        var res = pro.compare(proc)
        expect(res).assertEqual(0)
    })

    /**
     * @tc.name: test_compare_005
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compare_005', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(0, 0)
        var proc = util.RationalNumber.parseRationalNumber(2, 1)
        var res = pro.compare(proc)
        expect(res).assertEqual(1)
    })

    /**
     * @tc.name: test_compareThrowError_001
     * @tc.desc: Compares the current RationalNumber object with a given object.
     */
    it('test_compareThrowError_001', 0, function () {
        try {
            var pro = util.RationalNumber.parseRationalNumber(2, 1)
            var proc = 'str'
            var res = pro.compare(proc)
            expect(res).assertEqual(1)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of str must be RationalNumber");
        }
    })

    /**
     * @tc.name: testgetCommonFactor001
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testgetCommonFactor001', 0, function () {
        var res = util.RationalNumber.getCommonFactor(4, 8)
        expect(res).assertEqual(4)
    })

    /**
     * @tc.name: testgetCommonFactor002
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testgetCommonFactor002', 0, function () {
        var res = util.RationalNumber.getCommonFactor(10, 15)
        expect(res).assertEqual(5)
    })

    /**
     * @tc.name: testgetCommonFactor003
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testgetCommonFactor003', 0, function () {
        var res = util.RationalNumber.getCommonFactor(8, 4)
        expect(res).assertEqual(4)
    })

    /**
     * @tc.name: testgetCommonFactor004
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testgetCommonFactor004', 0, function () {
        var res = util.RationalNumber.getCommonFactor(8, 16)
        expect(res).assertEqual(8)
    })

    /**
     * @tc.name: testgetCommonFactor005
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testgetCommonFactor005', 0, function () {
        var res = util.RationalNumber.getCommonFactor(2, 16)
        expect(res).assertEqual(2)
    })

    /**
     * @tc.name: testgetCommonFactorThrowError001
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     */
    it('testgetCommonFactorThrowError001', 0, function () {
        try {
            var res = util.RationalNumber.getCommonFactor('str', 8)
            expect(res).assertEqual(4)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error.The type of str must be number");
        }
    })
})

describe('Base64HelperTest', function () {
    /**
     * @tc.name: test_encodeSync_base64_001
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_001', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([115,49,51]);
        var rarray = new Uint8Array([99,122,69,122]);
        var result = that.encodeSync(array);
        for (var i = 0; i < 4; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeSync_base64_002
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_002', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
        var result = that.encodeSync(array);
        for (var i = 0; i < 20; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeSync_base64_003
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_003', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,
        110,32,78,111,100,101,46,106,115]);
        var rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,
        73,71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
        var result = that.encodeSync(array);
        for (var i = 0; i < 36; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeSync_base64_004
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_004', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([168, 174, 155, 255]);
        var rarray = new Uint8Array([113,75,54,98,47,119,61,61]);
        var result = that.encodeSync(array);
        for (var i = 0; i < 8; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeSync_base64_005
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_005', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
        var result = that.encodeSync(array);
        for (var i = 0; i <8; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_encodeSync_base64_006
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_encodeSync_base64_006', 0, function () {
        try {
            var that = new util.Base64Helper();
            var array = new Uint32Array([66, 97, 115, 101, 54, 52]);
            var result = that.encodeSync(array);
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be Uint8Array")
        }
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_001
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_001', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([115,49,51]);
        var result = that.encodeToStringSync(array)
        expect(result).assertEqual('czEz')
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_002
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_002', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('QmFzZTY0IE5vZGUuanM=')
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_003
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_003', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,
        32,78,111,100,101,46,106,115]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_004
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_004', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([168, 174, 155, 255]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('qK6b/w==')
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_005
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToStringSync_base64_005', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('QmFzZTY0')
    })

    /**
     * @tc.name: test_encodeToStringSync_base64_006
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     */
        it('test_encodeToStringSync_base64_006', 0, function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint32Array([66, 97, 115, 101, 54, 52]);
            var result = that.encodeToStringSync(array);
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be Uint8Array")
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_001
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_001', 0, function () {
        var that = new util.Base64Helper()
        var buff = 'czEz';
        var rarray = new Uint8Array([115,49,51]);
        var result = that.decodeSync(buff);
        for (var i = 0; i < 3; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_002
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_002', 0, function () {
        var that = new util.Base64Helper()
        var buff = 'QmFzZTY0IE5vZGUuanM=';
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var result = that.decodeSync(buff);
        for (var i = 0; i < 14; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_003
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_003', 0, function () {
        var that = new util.Base64Helper()
        var buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
        var rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,
        105,110,32,78,111,100,101,46,106,115]);
        var result = that.decodeSync(buff);
        for (var i = 0; i < 26; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_004
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_004', 0, function () {
        var that = new util.Base64Helper()
        var buff = 'qK6b/w==';
        var rarray = new Uint8Array([168, 174, 155, 255]);
        var result = that.decodeSync(buff);
        for (var i = 0; i < 4; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_005
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_005', 0, function () {
        var that = new util.Base64Helper()
        var buff = 'QmFzZTY0';
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var result = that.decodeSync(buff);
        for (var i = 0; i <6; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_006
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_006', 0, function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint32Array([99,122,69,122]);
            var result = that.decodeSync(array);
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be Uint8Array or string")
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_007
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_007', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var result = that.decodeSync(array);
        for (var i = 0; i < 14; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_008
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_008', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,
        53,110,73,71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
        var rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,
        110,32,78,111,100,101,46,106,115]);
        var result = that.decodeSync(array);
        for (var i = 0; i < 26; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_009
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_009', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([113,75,54,98,47,119,61,61]);
        var rarray = new Uint8Array([168, 174, 155, 255]);
        var result = that.decodeSync(array);
        for (var i = 0; i < 4; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.name: test_decodeSync_base64_010
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_decodeSync_base64_010', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var result = that.decodeSync(array);
        for (var i = 0; i <6; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    //base64 EncodeAsync test
    /**
     * @tc.name: test_encodeAsync_base64_001
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly
         allocated u8 array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_001', 0, async function () {
        var that = await new util.Base64Helper();
        var array = new Uint8Array([115,49,51]);
        var rarray = new Uint8Array([99,122,69,122]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeAsync_base64_002
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly
         allocated u8 array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_002', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeAsync_base64_003
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_003', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,
        78,111,100,101,46,106,115]);
        var rarray = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,
        71,108,117,73,69,53,118,90,71,85,117,97,110,77,61]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeAsync_base64_004
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_004', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([168, 174, 155, 255]);
        var rarray = new Uint8Array([113,75,54,98,47,119,61,61]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeAsync_base64_005
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
        array using the Base64 encoding scheme.
     */
    it('test_encodeAsync_base64_005', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
        that.encode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_encodeSync_base64_throwError_001
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
        array using the Base64 encoding scheme.
     */
        it('test_encodeSync_base64_throwError_001', 0, async function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint32Array([66, 97, 115, 101, 54, 52]);
            that.encode(array)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be Uint8Array")
        }

    })

    /**
     * @tc.name: test_encodeToString_base64_001
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_001', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([115,49,51]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('czEz')
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_002
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_002', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('QmFzZTY0IE5vZGUuanM=')
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_003
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_003', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,71,108,
        117,73,69,53,118,90,71,85,117,97,110,77,61]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_004
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_004', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([168, 174, 155, 255]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('qK6b/w==')
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_005
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
    it('test_encodeToString_base64_005', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('QmFzZTY0')
        })
    })

    /**
     * @tc.name: test_encodeToString_base64_006
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     */
        it('test_encodeToString_base64_006', 0, async function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint32Array([66, 97, 115, 101, 54, 52]);
            that.encodeToString(array)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be Uint8Array")
        }
    })

    /**
     * @tc.name: test_decode_base64_001
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     */
    it('test_decode_base64_001', 0, async function () {
        var that = new util.Base64Helper()
        var buff = 'czEz';
        var array = new Uint8Array([115,49,51]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < array.length; i++) {
                expect(val[i]).assertEqual(array[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_002
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     */
    it('test_decode_base64_002', 0, async function () {
        var that = new util.Base64Helper()
        var buff = 'QmFzZTY0IE5vZGUuanM=';
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < array.length; i++) {
                expect(val[i]).assertEqual(array[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_003
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     */
    it('test_decode_base64_003', 0, async function () {
        var that = new util.Base64Helper()
        var buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
        var array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,78,
        111,100,101,46,106,115]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < array.length; i++) {
                expect(val[i]).assertEqual(array[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_004
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     */
    it('test_decode_base64_004', 0, async function () {
        var that = new util.Base64Helper()
        var buff = 'qK6b/w==';
        var array = new Uint8Array([168, 174, 155, 255]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < array.length; i++) {
                expect(val[i]).assertEqual(array[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_005
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     */
    it('test_decode_base64_005', 0, async function () {
        var that = new util.Base64Helper()
        var buff = 'QmFzZTY0';
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
        that.decode(buff).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_006
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     */
    it('test_decode_base64_006', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([99,122,69,122]);
        var rarray = new Uint8Array([115,49,51]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_007
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     */
    it('test_decode_base64_007', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,53,118,90,71,85,117,97,110,77,61]);
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_008
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     */
    it('test_decode_base64_008', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([81,109,70,122,90,84,89,48,73,69,86,117,89,50,57,107,97,87,53,110,73,71,108,
        117,73,69,53,118,90,71,85,117,97,110,77,61]);
        var rarray = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,32,78,111,
        100,101,46,106,115]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_009
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8 array
         into a newly allocated u8 array.
     */
    it('test_decode_base64_009', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([113,75,54,98,47,119,61,61]);
        var rarray = new Uint8Array([168, 174, 155, 255]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_010
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     */
    it('test_decode_base64_010', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
        var rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
        that.decode(array).then(val=>{
            for (var i = 0; i < rarray.length; i++) {
                expect(val[i]).assertEqual(rarray[i])
            }
        })
    })

    /**
     * @tc.name: test_decode_base64_throwError_001
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     */
    it('test_decode_base64_throwError_001', 0, async function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint16Array([99,122,69,122]);
            that.decode(array)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be Uint8Array or string")
        }
    })
})

describe('DecodeEncodeTest', function () {
    /**
     * @tc.name: testencoding_textdecoder_001
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_001', 0, function () {
        var that = util.TextDecoder.create('utf-8', { ignoreBOM : true })
        var retStr = that.encoding
        expect(retStr).assertEqual('utf-8')
    })

    /**
     * @tc.name: testencoding_textdecoder_002
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_002', 0, function () {
        var that = util.TextDecoder.create('utf-16le')
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16le')
    })

    /**
     * @tc.name: testencoding_textdecoder_003
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_003', 0, function () {
        var that = util.TextDecoder.create('utf-16be')
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name: testencoding_textdecoder_004
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_004', 0, function () {
        var that = util.TextDecoder.create('utf-16be', { ignoreBOM : true })
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name: testencoding_textdecoder_005
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_005', 0, function () {
        var that = util.TextDecoder.create('utf-16be', { ignoreBOM : false })
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.name: testencoding_textdecoder_ThrowError_001
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_ThrowError_001', 0, function () {
        try {
            var that = util.TextDecoder.create(123, { ignoreBOM : false })
            var encodingStr = that.encoding
            expect(encodingStr).assertEqual('utf-16be')
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be string.")
        }
    })

    /**
     * @tc.name: testencoding_textdecoder_ThrowError_002
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_ThrowError_002', 0, function () {
        try {
            var that = util.TextDecoder.create('utf-16be', 'ignoreBOM')
            var encodingStr = that.encoding
            expect(encodingStr).assertEqual('utf-16be')
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be object.")
        }
    })

    /**
     * @tc.name: testencoding_textdecoder_ThrowError_003
     * @tc.desc: The source encoding's name, lowercased.
     */
    it('testencoding_textdecoder_ThrowError_003', 0, function () {
        try {
            var that = util.TextDecoder.create('utf-16be', 123)
            var encodingStr = that.encoding
            expect(encodingStr).assertEqual('utf-16be')
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be object.")
        }
    })

    /**
     * @tc.name: testEncodeInto001
     * @tc.desc: Returns the result of encoder.
     */
    it('testencodeInto001', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('abc')
        expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.name: testEncodeInto002
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncodeInto002', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('\uD800楼楼')
        expect(result[5]).assertEqual(188)
    })

    /**
     * @tc.name: testEncodeInto003
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncodeInto003', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('a\uD800楼楼')
        expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.name: testEncodeInto004
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncodeInto004', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('abc\uD800楼楼')
        expect(result[1]).assertEqual(0x62)
    })

    /**
     * @tc.name: testEncodeInto005
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncodeInto005', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('123\uD800楼楼')
        expect(result[0]).assertEqual(49)
        expect(result[9]).assertEqual(230)
    })

    /**
     * @tc.name: testEncodeInto006
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncodeInto006', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('123¥\uD800楼')
        expect(result[10]).assertEqual(0xbc)
    })

    /**
     * @tc.name: testEncodeInto007
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncodeInto007', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('¥¥')
        expect(result[0]).assertEqual(0xc2)
    })

    /**
     * @tc.name: testEncodeInto008
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncodeInto008', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('$$')
        expect(result[0]).assertEqual(0x24)
    })

    /**
     * @tc.name: testEncodeInto009
     * @tc.desc: Returns the result of encoder for gb18030.
     */
    it('testEncodeInto009', 0, function () {
        let that = new util.TextEncoder('gb18030')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encodeInto('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(185)
        expect(result[4]).assertEqual(254)
        expect(result[7]).assertEqual(236)
        expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.name: testEncodeInto010
     * @tc.desc: Returns the result of encoder for GB18030.
     */
    it('testEncodeInto010', 0, function () {
        let that = new util.TextEncoder('GB18030')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encodeInto('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(185)
        expect(result[4]).assertEqual(254)
        expect(result[7]).assertEqual(236)
        expect(result[8]).assertEqual(218)
    })

    /**
     * @tc.name: testEncodeIntoThrowError001
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncodeIntoThrowError001', 0, function () {
        try {
            var that = new util.TextEncoder()
            var buffer = new ArrayBuffer(20)
            var result = new Uint8Array(buffer)
            result = that.encodeInto(123)
            expect(result[0]).assertEqual(0x61)
        } catch (e) {
                expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be string.")
            }
    })

    /**
     * @tc.name: testEncodeIntoThrowError002
     * @tc.desc: Returns the result of encoder.
     */
    it('testEncodeIntoThrowError002', 0, function () {
        try {
            var that = new util.TextEncoder()
            var buffer = new ArrayBuffer(20)
            var result = new Uint8Array(buffer)
            result = that.encodeInto({ ignoreBOM : true })
            expect(result[0]).assertEqual(0x61)
        } catch (e) {
                expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be string.")
            }
    })

    /**
     * @tc.name: testencodeIntoUint8Array001
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8Array001', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 13)
        var result = new Uint32Array(20)
        result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(7)
        expect(result.written).assertEqual(13)
    })

    /**
     * @tc.name: testencodeIntoUint8Array002
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8Array002', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(6)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeIntoUint8Array('abc\u2603d', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(6)
    })

    /**
     * @tc.name: testencodeIntoUint8Array003
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8Array003', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeIntoUint8Array('abcd', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testencodeIntoUint8Array004
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8Array004', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeIntoUint8Array('12345', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testencodeIntoUint8Array005
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8Array005', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeIntoUint8Array('123 4*!@#', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testencodeIntoUint8Array006
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8Array006', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(4)
        var dest = new Uint8Array(buffer)
        var result = new Object()
        result = that.encodeIntoUint8Array('', dest)
        expect(result.read).assertEqual(0)
        expect(result.written).assertEqual(0)
    })

    /**
     * @tc.name: testencodeIntoUint8Array007
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8Array007', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer)
        var result = new Uint32Array(20)
        result = that.encodeIntoUint8Array('12ab', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.name: testencodeIntoUint8Array008
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8Array008', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 0)
        var result = new Uint32Array(20)
        result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(0)
        expect(result.written).assertEqual(0)
    })

    /**
     * @tc.name: testencodeIntoUint8ArrayThrowError001
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8ArrayThrowError001', 0, function () {
        try {
            var that = new util.TextEncoder()
            var buffer = new ArrayBuffer(20)
            var dest = new Uint8Array(buffer, 0, 13)
            var result = new Uint32Array(20)
            result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
            expect(result.read).assertEqual(7)
            expect(result.written).assertEqual(13)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be string.")
        }
    })

    /**
     * @tc.name: testencodeIntoUint8ArrayThrowError002
     * @tc.desc: encode string, write the result to dest array.
     */
    it('testencodeIntoUint8ArrayThrowError002', 0, function () {
        try {
            var that = new util.TextEncoder()
            var buffer = new ArrayBuffer(20)
            var dest = new Uint8Array(buffer, 0, 13)
            var result = new Uint32Array(20)
            result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
            expect(result.read).assertEqual(7)
            expect(result.written).assertEqual(13)
        } catch (e) {
            expect(e.toString()).assertEqual("BuisnessError: The type of Parameter must be Uint8Array.")
        }
    })
})
}
