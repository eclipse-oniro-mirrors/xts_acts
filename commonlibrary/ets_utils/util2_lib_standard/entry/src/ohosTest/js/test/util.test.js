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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import util from '@ohos.util'

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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_001
     * @tc.name: testIsNumberObject001
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject001', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(new Number(0));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_002
     * @tc.name: testIsNumberObject002
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(new Number(10));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_003
     * @tc.name: testIsNumberObject003
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(new Number(200));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_004
     * @tc.name: testIsNumberObject004
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(0);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_NUMBER_OBJECT_005
     * @tc.name: testIsNumberObject005
     * @tc.desc: Check whether the entered value is of the number object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsNumberObject005', 0, function() {
        var proc = new util.types();
        var result = proc.isNumberObject(100);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_001
     * @tc.name: testIsPromise001
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise001', 0, function() {
        var proc = new util.types();
        var result = proc.isPromise(Promise.resolve(42));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_002
     * @tc.name: testIsPromise002
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise002', 0, function() {
        var proc = new util.types();
        var result = proc.isPromise(Promise.resolve(33));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_003
     * @tc.name: testIsPromise003
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise003', 0, function() {
        var proc = new util.types();
        var result = proc.isPromise(Promise.resolve(44));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_004
     * @tc.name: testIsPromise004
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise004', 0, function() {
        var proc = new util.types();
        var err = Error(33);
        var result = proc.isPromise(Promise.reject(err));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROMISE_005
     * @tc.name: testIsPromise005
     * @tc.desc: Check whether the entered value is of promise type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsPromise005', 0, function() {
        var proc = new util.types();
        var err = Error(23);
        var result = proc.isPromise(Promise.reject(err));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_001
     * @tc.name: testIsProxy001
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsProxy001', 0, function() {
        var proc = new util.types();
        const target = {};
        const proxy = new Proxy(target, {});
        var result = proc.isProxy(proxy);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_002
     * @tc.name: testIsProxy002
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsProxy002', 0, function() {
        var proc = new util.types();
        const target = {};
        const proxy = new Proxy(target, {});
        var result = proc.isProxy(target);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_003
     * @tc.name: testIsProxy003
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_004
     * @tc.name: testIsProxy004
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_PROXY_005
     * @tc.name: testIsProxy005
     * @tc.desc: Check whether the value entered is of proxy type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_001
     * @tc.name: testIsRegExp001
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp001', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp('abc'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_002
     * @tc.name: testIsRegExp002
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp002', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(/abc/);
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_003
     * @tc.name: testIsRegExp003
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp003', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp('fgd'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_004
     * @tc.name: testIsRegExp004
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp004', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp('123'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_REGEXP_005
     * @tc.name: testIsRegExp005
     * @tc.desc: Check whether the entered value is of type regexp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsRegExp005', 0, function() {
        var proc = new util.types();
        var result = proc.isRegExp(new RegExp(/ab+c/, 'i'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_001
     * @tc.name: testIsSet001
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet001', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new Set());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_002
     * @tc.name: testIsSet002
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet002', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new Map());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_003
     * @tc.name: testIsSet003
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet003', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_004
     * @tc.name: testIsSet004
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet004', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new Boolean());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_005
     * @tc.name: testIsSet005
     * @tc.desc: Check whether the entered value is of type set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSet005', 0, function() {
        var proc = new util.types();
        var result = proc.isSet(new WeakSet());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_001
     * @tc.name: testIsSetIterator001
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator001', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set.keys());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_002
     * @tc.name: testIsSetIterator002
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator002', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set.values());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_003
     * @tc.name: testIsSetIterator003
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator003', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set.entries());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_004
     * @tc.name: testIsSetIterator004
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator004', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set[Symbol.iterator]());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SET_ITERATOR_005
     * @tc.name: testIsSetIterator005
     * @tc.desc: Check whether the entered value is the iterator type of set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSetIterator005', 0, function() {
        var proc = new util.types();
        const set = new Set();
        var result = proc.isSetIterator(set);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_001
     * @tc.name: testIsSharedArrayBuffer001
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer001', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new SharedArrayBuffer([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_002
     * @tc.name: testIsSharedArrayBuffer002
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer002', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_003
     * @tc.name: testIsSharedArrayBuffer003
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer003', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new Int32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_004
     * @tc.name: testIsSharedArrayBuffer004
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer004', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new ArrayBuffer([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SHARED_ARRAY_BUFFER_005
     * @tc.name: testIsSharedArrayBuffer005
     * @tc.desc: Check whether the entered value is of type sharedarraybuffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSharedArrayBuffer005', 0, function() {
        var proc = new util.types();
        var result = proc.isSharedArrayBuffer(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_001
     * @tc.name: testIsStringObject001
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject001', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject(new String('foo'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_002
     * @tc.name: testIsStringObject002
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject002', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject(new String('twoo'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_003
     * @tc.name: testIsStringObject003
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject003', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject(new String('fdfsfd'));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_004
     * @tc.name: testIsStringObject004
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject004', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject('ffds111');
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_STRING_OBJECT_005
     * @tc.name: testIsStringObject005
     * @tc.desc: Check whether the entered value is a string object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsStringObject005', 0, function() {
        var proc = new util.types();
        var result = proc.isStringObject('foo');
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_001
     * @tc.name: testIsSymbolObject001
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject001', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('foo');
        var result = proc.isSymbolObject(Object(symbols));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_002
     * @tc.name: testIsSymbolObject002
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject002', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('s12');
        var result = proc.isSymbolObject(Object(symbols));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_003
     * @tc.name: testIsSymbolObject003
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject003', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('sads');
        var result = proc.isSymbolObject(Object(symbols));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_004
     * @tc.name: testIsSymbolObject004
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject004', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('asdd');
        var result = proc.isSymbolObject(symbols);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_SYMBOL_OBJECT_005
     * @tc.name: testIsSymbolObject005
     * @tc.desc: Check whether the entered value is a symbol object type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsSymbolObject005', 0, function() {
        var proc = new util.types();
        const symbols = Symbol('foo');
        var result = proc.isSymbolObject(symbols);
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_001
     * @tc.name: testIsTypedArray001
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray001', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Float64Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_002
     * @tc.name: testIsTypedArray002
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray002', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Uint8Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_003
     * @tc.name: testIsTypedArray003
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray003', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Uint16Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_004
     * @tc.name: testIsTypedArray004
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray004', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new Uint32Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_TYPED_ARRAY_005
     * @tc.name: testIsTypedArray005
     * @tc.desc: Check whether the entered value is a type contained in typedarray.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsTypedArray005', 0, function() {
        var proc = new util.types();
        var result = proc.isTypedArray(new ArrayBuffer());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_001
     * @tc.name: testIsUint8Array001
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Uint8Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_002
     * @tc.name: testIsUint8Array002
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Uint16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_003
     * @tc.name: testIsUint8Array003
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Uint32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_004
     * @tc.name: testIsUint8Array004
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_ARRAY_005
     * @tc.name: testIsUint8Array005
     * @tc.desc: Check whether the entered value is the uint8array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8Array(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_001
     * @tc.name: testIsUint8ClampedArray001
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Uint8ClampedArray([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_002
     * @tc.name: testIsUint8ClampedArray002
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_003
     * @tc.name: testIsUint8ClampedArray003
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Int16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_004
     * @tc.name: testIsUint8ClampedArray004
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Int32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT8_CLAMPED_ARRAY_005
     * @tc.name: testIsUint8ClampedArray005
     * @tc.desc: Check whether the entered value is the uint8clapedarray array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint8ClampedArray005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint8ClampedArray(new Uint32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_001
     * @tc.name: testIsUint16Array001
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint16Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_002
     * @tc.name: testIsUint16Array002
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_003
     * @tc.name: testIsUint16Array003
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint32Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_004
     * @tc.name: testIsUint16Array004
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Uint8ClampedArray([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT16_ARRAY_005
     * @tc.name: testIsUint16Array005
     * @tc.desc: Check whether the entered value is the uint16array array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint16Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint16Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_001
     * @tc.name: testIsUint32Array001
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array001', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint32Array([]));
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_002
     * @tc.name: testIsUint32Array002
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array002', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_003
     * @tc.name: testIsUint32Array003
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array003', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint16Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_004
     * @tc.name: testIsUint32Array004
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array004', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Int8Array([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_UINT32_ARRAY_005
     * @tc.name: testIsUint32Array005
     * @tc.desc: Check whether the entered value is the uint32array array type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsUint32Array005', 0, function() {
        var proc = new util.types();
        var result = proc.isUint32Array(new Uint8ClampedArray([]));
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_001
     * @tc.name: testIsWeakMap001
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap001', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new WeakMap());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_002
     * @tc.name: testIsWeakMap002
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap002', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new Map());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_003
     * @tc.name: testIsWeakMap003
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap003', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new Set());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_004
     * @tc.name: testIsWeakMap004
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap004', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_MAP_005
     * @tc.name: testIsWeakMap005
     * @tc.desc: Check whether the entered value is of type weakmap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakMap005', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakMap(new WeakSet());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_001
     * @tc.name: testIsWeakSet001
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet001', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new WeakSet());
        expect(result).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_002
     * @tc.name: testIsWeakSet002
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet002', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new WeakMap());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_003
     * @tc.name: testIsWeakSet003
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet003', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new String());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_004
     * @tc.name: testIsWeakSet004
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet004', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new Set());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_IS_WEAK_SET_005
     * @tc.name: testIsWeakSet005
     * @tc.desc: Check whether the entered value is of type weakset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testIsWeakSet005', 0, function() {
        var proc = new util.types();
        var result = proc.isWeakSet(new Map());
        expect(result).assertEqual(false);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_UUID_001
     * @tc.name: testUtilRandomUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilRandomUUID001', 0, async function () {
        var result = util.randomUUID(true);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_UUID_002
     * @tc.name: testUtilRandomUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilRandomUUID002', 0, async function () {
        var result = util.randomUUID(false);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_BINARY_UUID_001
     * @tc.name: testUtilRandomBinaryUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilRandomBinaryUUID001', 0, async function () {
        var result = util.randomBinaryUUID(true);
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_BINARY_UUID_002
     * @tc.name: testUtilRandomBinaryUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilRandomBinaryUUID002', 0, async function () {
        var result = util.randomBinaryUUID(false);
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PARSE_UUID_001
     * @tc.name: testUtilParseUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilParseUUID001', 0, async function () {
        var result = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PARSE_UUID_002
     * @tc.name: testUtilParseUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilParseUUID002', 0, async function () {
        try {
            var result = util.parseUUID('84df796-66cc-4655-9b89-d6218d100f9c');
        } catch(e) {
            expect(e.message).assertEqual('Syntax Error.Invalid 84df796-66cc-4655-9b89-d6218d100f9c string');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PARSE_UUID_003
     * @tc.name: testUtilParseUUID003
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilParseUUID003', 0, async function () {
        try {
            var result = util.parseUUID('84Wdf796-66cc-4655-9b89-d6218d100f9c');
        } catch(e) {
            expect(e.message).assertEqual('Syntax Error.Invalid 84Wdf796-66cc-4655-9b89-d6218d100f9c string');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_UUID_001
     * @tc.name: testUtilgenerateRandomUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomUUID001', 0, async function () {
        var result = util.generateRandomUUID(true);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_UUID_002
     * @tc.name: testUtilgenerateRandomUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomUUID002', 0, async function () {
        var result = util.generateRandomUUID(false);
        expect(result.length).assertEqual(36);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_UUID_003
     * @tc.name: testUtilgenerateRandomUUID003
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomUUID003', 0, async function () {
        let sum = 0
        for (let i = 0; i < 10; i++) {
          let result = util.generateRandomUUID(true);
          if (result.length === 36) {
            sum++;
          }
        }
        expect(sum).assertEqual(10);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_BINARY_UUID_001
     * @tc.name: testUtilgenerateRandomBinaryUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomBinaryUUID001', 0, async function () {
        var result = util.generateRandomBinaryUUID(true);
        expect(result.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_BINARY_UUID_002
     * @tc.name: testUtilgenerateRandomBinaryUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomBinaryUUID002', 0, async function () {
        var result = util.generateRandomBinaryUUID(false);
        expect(result.length).assertEqual(16);
    })
})

describe('ScopeHelperTest', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_001
     * @tc.name: test_getLower_001
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_001', 0, function () {
        var result = rangeHp.getLower()
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_002
     * @tc.name: test_getLower_002
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_002', 0, function () {
        var result = rangeHpFir.getLower()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_003
     * @tc.name: test_getLower_003
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_003', 0, function () {
        var result = rangeHpSec.getLower()
        expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_004
     * @tc.name: test_getLower_004
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_004', 0, function () {
        var result = rangeHpThi.getLower()
        expect(result.toString()).assertEqual('20')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_LOWER_005
     * @tc.name: test_getLower_005
     * @tc.desc: Obtains the lower bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getLower_005', 0, function () {
        var result = rangeHpFif.getLower()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_001
     * @tc.name: test_getUpper_001
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_001', 0, function () {
        var result = rangeHp.getUpper()
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_002
     * @tc.name: test_getUpper_002
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_002', 0, function () {
        var result = rangeHpFir.getUpper()
        expect(result.toString()).assertEqual('39')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_003
     * @tc.name: test_getUpper_003
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_003', 0, function () {
        var result = rangeHpSec.getUpper()
        expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_004
     * @tc.name: test_getUpper_004
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_004', 0, function () {
        var result = rangeHpThi.getUpper()
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_UPPER_005
     * @tc.name: test_getUpper_005
     * @tc.desc: Obtains the upper bound of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_getUpper_005', 0, function () {
        var result = rangeHpFif.getUpper()
        expect(result.toString()).assertEqual('45')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_001
     * @tc.name: test_clamp_001
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_001', 0, function () {
        var result = rangeHp.clamp(tempLess)
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_002
     * @tc.name: test_clamp_002
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_002', 0, function () {
        var result = rangeHp.clamp(tempMiDF)
        expect(result.toString()).assertEqual('35')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_003
     * @tc.name: test_clamp_003
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_003', 0, function () {
        var result = rangeHp.clamp(tempMore)
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_004
     * @tc.name: test_clamp_004
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_004', 0, function () {
        var result = rangeHp.clamp(tempLower)
        expect(result.toString()).assertEqual('30')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_005
     * @tc.name: test_clamp_005
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_005', 0, function () {
        var result = rangeHp.clamp(tempUpper)
        expect(result.toString()).assertEqual('40')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_001
     * @tc.name: test_contains_001
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_001', 0, function () {
        var result = rangeHp.contains(tempLess)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_002
     * @tc.name: test_contains_002
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_002', 0, function () {
        var result = rangeHp.contains(tempMiDF)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_003
     * @tc.name: test_contains_003
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_003', 0, function () {
        var result = rangeHp.contains(tempMore)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_004
     * @tc.name: test_contains_004
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_004', 0, function () {
        var result = rangeHp.contains(tempLower)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_005
     * @tc.name: test_contains_005
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_005', 0, function () {
        var result = rangeHp.contains(tempUpper)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_006
     * @tc.name: test_contains_006
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_006', 0, function () {
        var result = rangeHp.contains(rangeHpFir)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_007
     * @tc.name: test_contains_007
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_007', 0, function () {
        var result = rangeHp.contains(rangeHpSec)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_008
     * @tc.name: test_contains_008
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_008', 0, function () {
        var result = rangeHp.contains(rangeHpThi)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_009
     * @tc.name: test_contains_009
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_009', 0, function () {
        var result = rangeHp.contains(rangeHpFif)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_010
     * @tc.name: test_contains_010
     * @tc.desc: Checks whether a given range is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_010', 0, function () {
        var result = rangeHp.contains(rangeHp)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_001
     * @tc.name: test_expand_001
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_001', 0, function () {
        var result = rangeHp.expand(tempMiDF, tempMidS)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_002
     * @tc.name: test_expand_002
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_002', 0, function () {
        var result = rangeHp.expand(tempLess, tempMore)
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_003
     * @tc.name: test_expand_003
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_003', 0, function () {
        var result = rangeHp.expand(tempLess, tempMiDF)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_004
     * @tc.name: test_expand_004
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_004', 0, function () {
        var result = rangeHp.expand(tempMiDF, tempMore)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_005
     * @tc.name: test_expand_005
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_005', 0, function () {
        var result = rangeHp.expand(tempLower, tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_006
     * @tc.name: test_expand_006
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_006', 0, function () {
        var result = rangeHp.expand(rangeHpFir)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_007
     * @tc.name: test_expand_007
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_007', 0, function () {
        var result = rangeHp.expand(rangeHpSec)
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_008
     * @tc.name: test_expand_008
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_008', 0, function () {
        var result = rangeHp.expand(rangeHpThi)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_009
     * @tc.name: test_expand_009
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_009', 0, function () {
        var result = rangeHp.expand(rangeHpFif)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_010
     * @tc.name: test_expand_010
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_010', 0, function () {
        var result = rangeHp.expand(rangeHp)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_011
     * @tc.name: test_expand_011
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_011', 0, function () {
        var result = rangeHp.expand(tempMiDF)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_012
     * @tc.name: test_expand_012
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_012', 0, function () {
        var result = rangeHp.expand(tempLess)
        expect(result.toString()).assertEqual('[20, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_013
     * @tc.name: test_expand_013
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_013', 0, function () {
        var result = rangeHp.expand(tempMore)
        expect(result.toString()).assertEqual('[30, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_014
     * @tc.name: test_expand_014
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_014', 0, function () {
        var result = rangeHp.expand(tempLower)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_015
     * @tc.name: test_expand_015
     * @tc.desc: Creates the smallest range that includes the current range and a given value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_015', 0, function () {
        var result = rangeHp.expand(tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_001
     * @tc.name: test_intersect_001
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_001', 0, function () {
        var result = rangeHp.intersect(rangeHpFir)
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_002
     * @tc.name: test_intersect_002
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_002', 0, function () {
        var result = rangeHp.intersect(rangeHpSec)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_003
     * @tc.name: test_intersect_003
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_003', 0, function () {
        var result = rangeHp.intersect(rangeHpThi)
        expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_004
     * @tc.name: test_intersect_004
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_004', 0, function () {
        var result = rangeHp.intersect(rangeHpFif)
        expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_005
     * @tc.name: test_intersect_005
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_005', 0, function () {
        var result = rangeHp.intersect(rangeHp)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_006
     * @tc.name: test_intersect_006
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_006', 0, function () {
        var result = rangeHp.intersect(tempMiDF, tempMidS)
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_007
     * @tc.name: test_intersect_007
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_007', 0, function () {
        var result = rangeHp.intersect(tempLess, tempMore)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_008
     * @tc.name: test_intersect_008
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_008', 0, function () {
        var result = rangeHp.intersect(tempLess, tempMiDF)
        expect(result.toString()).assertEqual('[30, 35]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_009
     * @tc.name: test_intersect_009
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_009', 0, function () {
        var result = rangeHp.intersect(tempMiDF, tempMore)
        expect(result.toString()).assertEqual('[35, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_010
     * @tc.name: test_intersect_010
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_010', 0, function () {
        var result = rangeHp.intersect(tempLower, tempUpper)
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_001
     * @tc.name: test_toString_001
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_001', 0, function () {
        var result = rangeHp.toString()
        expect(result.toString()).assertEqual('[30, 40]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_002
     * @tc.name: test_toString_002
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_002', 0, function () {
        var result = rangeHpFir.toString()
        expect(result.toString()).assertEqual('[35, 39]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_003
     * @tc.name: test_toString_003
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_003', 0, function () {
        var result = rangeHpSec.toString()
        expect(result.toString()).assertEqual('[20, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_004
     * @tc.name: test_toString_004
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_004', 0, function () {
        var result = rangeHpThi.toString()
        expect(result.toString()).assertEqual('[20, 35]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_TO_STRING_005
     * @tc.name: test_toString_005
     * @tc.desc: Obtains a string representation of the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_toString_005', 0, function () {
        var result = rangeHpFif.toString()
        expect(result.toString()).assertEqual('[35, 45]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_THROW_ERROR_001
     * @tc.name: test_constructor_throwError_001
     * @tc.desc: A constructor used to create a Scope instance with the lower and upper bounds specified.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_constructor_throwError_001', 0, function () {
        try {
            var range = new util.ScopeHelper(1, 2);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 1 must be object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_THROW_ERROR_001
     * @tc.name: test_intersect_throwError_001
     * @tc.desc: Returns the intersection of a given range and the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_throwError_001', 0, function () {
        try {
            var result = rangeHp.intersect("str")
            expect(result.toString()).assertEqual('[35, 39]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of str must be ScopeHelper " +
                                             "or ScopeType");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_INTERSECT_THROW_ERROR_002
     * @tc.name: test_intersect_throwError_002
     * @tc.desc: Returns the intersection of the current range and the range specified by
       the given lower and upper bounds.
       @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_intersect_throwError_002', 0, function () {
        try {
            var result = rangeHp.intersect(tempMiDF, 123)
            expect(result.toString()).assertEqual('[35, 39]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be ScopeType");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_THROW_ERROR_001
     * @tc.name: test_expand_throwError_001
     * @tc.desc: Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_throwError_001', 0, function () {
        try {
            var result = rangeHp.expand(tempMiDF, "123")
            expect(result.toString()).assertEqual('[30, 40]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be ScopeType");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_EXPAND_THROW_ERROR_002
     * @tc.name: test_expand_throwError_002
     * @tc.desc: Creates the smallest range that includes the current range and a given range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_expand_throwError_002', 0, function () {
        try {
            var result = rangeHp.expand(123)
            expect(result.toString()).assertEqual('[30, 40]')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be ScopeHelper " +
                                             "or ScopeType");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CONTAINS_THROW_ERROR_001
     * @tc.name: test_contains_throwError_001
     * @tc.desc: Checks whether a given value is within the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_contains_throwError_001', 0, function () {
        try {
            var result = rangeHp.contains("str")
            expect(result).assertEqual(true)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of str must be object or " +
                                             "ScopeHelper");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_CLAMP_THROW_ERROR_001
     * @tc.name: test_clamp_throwError_001
     * @tc.desc: Clamps a given value to the current range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_clamp_throwError_001', 0, function () {
        try {
             var result = rangeHp.clamp(123)
             expect(result.toString()).assertEqual('30')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be object");
        }
    })
})

describe('LRUCacheTest', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_001
     * @tc.name: testLRUCacheUpdateGetCapacity001
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity001', 0, function () {
        var that = new util.LRUCache()
        that.updateCapacity(10)
        var result = that.getCapacity()
        expect(result).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_002
     * @tc.name: testLRUCacheUpdateGetCapacity002
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity002', 0, function () {
        var that = new util.LRUCache()
        that.updateCapacity(2147483646)
        var result = that.getCapacity()
        expect(result).assertEqual(2147483646)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_003
     * @tc.name: testLRUCacheUpdateGetCapacity003
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity003', 0, function () {
        var that = new util.LRUCache(100)
        that.updateCapacity(20)
        var result = that.getCapacity()
        expect(result).assertEqual(20)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_004
     * @tc.name: testLRUCacheUpdateGetCapacity004
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity004', 0, function () {
        var that = new util.LRUCache(50)
        that.updateCapacity(2)
        var result = that.getCapacity()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_005
     * @tc.name: testLRUCacheUpdateGetCapacity005
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity005', 0, function () {
        var that = new util.LRUCache(200)
        that.updateCapacity(100)
        var result = that.getCapacity()
        expect(result).assertEqual(100)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_006
     * @tc.name: testLRUCacheUpdateGetCapacity006
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity006', 0, function () {
        var that = new util.LRUCache(200)
        try {
            that.updateCapacity('a');
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of a must be number');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of a must be number");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_001
     * @tc.name: testLRUCacheGet001
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet001', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        var result = that.get(1)
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_002
     * @tc.name: testLRUCacheGet002
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet002', 0, function () {
        var that = new util.LRUCache(100)
        that.put(1,2)
        var result = that.get(5)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_003
     * @tc.name: testLRUCacheGet003
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_004
     * @tc.name: testLRUCacheGet004
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_005
     * @tc.name: testLRUCacheGet005
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_006
     * @tc.name: testLRUCacheGet006
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet006', 0, function () {
        var that = new util.LRUCache()
        let un = undefined;
        that.put(20,'cdjcaxb')
        try {
            var result1 = that.get(un);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_001
     * @tc.name: testLRUCachePut001
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut001', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        expect(temp).assertEqual('bcjdshc')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_002
     * @tc.name: testLRUCachePut002
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut002', 0, function () {
        var that = new util.LRUCache()
        var temp1 = that.put('1111','bcjdshc')
        var temp2 = that.put('1111',13)
        expect(temp2).assertEqual(13)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_003
     * @tc.name: testLRUCachePut003
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut003', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        var temp3 = that.put(2,'adasfdad')
        var temp4 = that.put('abc',10)
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual('adasfdad')
        expect(temp4).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_004
     * @tc.name: testLRUCachePut004
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut004', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        that.updateCapacity(2)
        var temp3 = that.put(2,'adasfdad')
        var temp4 = that.put('1111',10)
        expect(temp).assertEqual('bcjdshc')
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual('adasfdad')
        expect(temp4).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_005
     * @tc.name: testLRUCachePut005
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut005', 0, function () {
        var that = new util.LRUCache()
        var temp = that.put('1111','bcjdshc')
        var temp1 = that.put(1,12)
        var temp2 = that.put(2,5)
        var temp3 = that.put(1,10)
        var temp4 = that.put(2,22)
        var temp5 = that.put(2,30)
        expect(temp).assertEqual('bcjdshc')
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual(10)
        expect(temp4).assertEqual(22)
        expect(temp5).assertEqual(30)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_006
     * @tc.name: testLRUCachePut006
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut006', 0, function () {
        var that = new util.LRUCache()
        let un = undefined;
        try {
            that.put(un,'bcjdshc')
          } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
          }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_001
     * @tc.name: testLRUCacheGetCreateCount001
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_002
     * @tc.name: testLRUCacheGetCreateCount002
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_003
     * @tc.name: testLRUCacheGetCreateCount003
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_004
     * @tc.name: testLRUCacheGetCreateCount004
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CREATE_COUNT_005
     * @tc.name: testLRUCacheGetCreateCount005
     * @tc.desc: Obtains the number of times createDefault(Object) returned a value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_001
     * @tc.name: testLRUCacheGetMissCount001
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_002
     * @tc.name: testLRUCacheGetMissCount002
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_003
     * @tc.name: testLRUCacheGetMissCount003
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_004
     * @tc.name: testLRUCacheGetMissCount004
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_005
     * @tc.name: testLRUCacheGetMissCount005
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MISS_COUNT_006
     * @tc.name: testLRUCacheGetMissCount006
     * @tc.desc: Obtains the number of times that the queried values are not matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_001
     * @tc.name: testLRUCacheGetRemovalCount001
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_002
     * @tc.name: testLRUCacheGetRemovalCount002
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_003
     * @tc.name: testLRUCacheGetRemovalCount003
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_004
     * @tc.name: testLRUCacheGetRemovalCount004
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_005
     * @tc.name: testLRUCacheGetRemovalCount005
     * @tc.desc: Obtains the number of times that values are evicted from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_001
     * @tc.name: testLRUCacheGetMatchCount001
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_002
     * @tc.name: testLRUCacheGetMatchCount002
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_003
     * @tc.name: testLRUCacheGetMatchCount003
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_004
     * @tc.name: testLRUCacheGetMatchCount004
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_005
     * @tc.name: testLRUCacheGetMatchCount005
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_MATCH_COUNT_006
     * @tc.name: testLRUCacheGetMatchCount006
     * @tc.desc: Obtains the number of times that the queried values are successfully matched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_001
     * @tc.name: testLRUCacheGetPutCount001
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetPutCount001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.getPutCount()
        expect(result).assertEqual(1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_002
     * @tc.name: testLRUCacheGetPutCount002
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetPutCount002', 0, function () {
        var that = new util.LRUCache()
        that.put(5,3)
        that.put(2,10)
        var result = that.getPutCount()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_003
     * @tc.name: testLRUCacheGetPutCount003
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_004
     * @tc.name: testLRUCacheGetPutCount004
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_PUT_COUNT_005
     * @tc.name: testLRUCacheGetPutCount005
     * @tc.desc: Obtains the number of times that values are added to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_001
     * @tc.name: testLRUCacheGetCapacity001
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity001', 0, function () {
        var that = new util.LRUCache()
        var result = that.getCapacity()
        expect(result).assertEqual(64)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_002
     * @tc.name: testLRUCacheGetCapacity002
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity002', 0, function () {
        var that = new util.LRUCache(2)
        var result = that.getCapacity()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_003
     * @tc.name: testLRUCacheGetCapacity003
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity003', 0, function () {
        var that = new util.LRUCache(100)
        var result = that.getCapacity()
        expect(result).assertEqual(100)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_004
     * @tc.name: testLRUCacheGetCapacity004
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity004', 0, function () {
        var that = new util.LRUCache()
        that.updateCapacity(50)
        var result = that.getCapacity()
        expect(result).assertEqual(50)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_CAPACITY_005
     * @tc.name: testLRUCacheGetCapacity005
     * @tc.desc: Obtains the capacity of the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGetCapacity005', 0, function () {
        var that = new util.LRUCache(100)
        that.updateCapacity(10)
        var result = that.getCapacity()
        expect(result).assertEqual(10)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_001
     * @tc.name: testLRUCacheLength001
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheLength001', 0, function () {
        var that = new util.LRUCache()
        var result = that.length
        expect(result).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_002
     * @tc.name: testLRUCacheLength002
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheLength002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.length
        expect(result).assertEqual(1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_003
     * @tc.name: testLRUCacheLength003
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheLength003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc',2)
        that.put('string','string')
        var result = that.length
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_004
     * @tc.name: testLRUCacheLength004
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_LENGTH_005
     * @tc.name: testLRUCacheLength005
     * @tc.desc: Obtains the total number of values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_001
     * @tc.name: testLRUCacheClear001
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_002
     * @tc.name: testLRUCacheClear002
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_003
     * @tc.name: testLRUCacheClear003
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_004
     * @tc.name: testLRUCacheClear004
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CLEAR_005
     * @tc.name: testLRUCacheClear005
     * @tc.desc: Clears key-value pairs from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_001
     * @tc.name: testLRUCacheIsEmpty001
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheIsEmpty001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_002
     * @tc.name: testLRUCacheIsEmpty002
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheIsEmpty002', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        that.put(2,10)
        var result = that.isEmpty()
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_003
     * @tc.name: testLRUCacheIsEmpty003
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_004
     * @tc.name: testLRUCacheIsEmpty004
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_IS_EMPTY_005
     * @tc.name: testLRUCacheIsEmpty005
     * @tc.desc: Checks whether the current buffer is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_001
     * @tc.name: testLRUCacheContains001
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.contains(1)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_002
     * @tc.name: testLRUCacheContains002
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains002', 0, function () {
        var that = new util.LRUCache()
        that.put(0,5)
        var result = that.contains(0)
        expect(result).assertEqual(true)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_003
     * @tc.name: testLRUCacheContains003
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains003', 0, function () {
        var that = new util.LRUCache()
        that.put('abc','abc')
        var result = that.contains(1)
        expect(result).assertEqual(false)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_004
     * @tc.name: testLRUCacheContains004
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_005
     * @tc.name: testLRUCacheContains005
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONTAINS_006
     * @tc.name: testLRUCacheContains006
     * @tc.desc: Checks whether the current buffer contains a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheContains006', 0, function () {
        var that = new util.LRUCache()
        that.put('abc','abc')
        let un = undefined;
        try {
            that.contains(un)
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_001
     * @tc.name: testLRUCacheRemove001
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheRemove001', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        var result = that.remove(1)
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_002
     * @tc.name: testLRUCacheRemove002
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_003
     * @tc.name: testLRUCacheRemove003
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_004
     * @tc.name: testLRUCacheRemove004
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_005
     * @tc.name: testLRUCacheRemove005
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_006
     * @tc.name: testLRUCacheRemove006
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheRemove006', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        let un = undefined;
        try {
            that.remove(un)
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_001
     * @tc.name: testLRUCacheCreateDefault001
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault001', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault(1)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_002
     * @tc.name: testLRUCacheCreateDefault002
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault002', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault(0)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_003
     * @tc.name: testLRUCacheCreateDefault003
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault003', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault('string')
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_004
     * @tc.name: testLRUCacheCreateDefault004
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault004', 0, function () {
        var that = new util.LRUCache()
        var result = that.createDefault(10)
        expect(result).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_005
     * @tc.name: testLRUCacheCreateDefault005
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault005', 0, function () {
        var that = new util.LRUCache()
        var result1 = that.createDefault('abc')
        var result2 = that.createDefault('ab')
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(undefined)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CREATE_DEFAULT_006
     * @tc.name: testLRUCacheCreateDefault006
     * @tc.desc: Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheCreateDefault006', 0, function () {
        var that = new util.LRUCache()
        let un = undefined;
        try {
            that.createDefault(un);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of undefined must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_001
     * @tc.name: testLRUCacheKeys001
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheKeys001', 0, function () {
        var that = new util.LRUCache()
        that.put('string','abc')
        var result = that.keys()
        expect(result[0]).assertEqual('string')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_002
     * @tc.name: testLRUCacheKeys002
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_003
     * @tc.name: testLRUCacheKeys003
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_004
     * @tc.name: testLRUCacheKeys004
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_KEYS_005
     * @tc.name: testLRUCacheKeys005
     * @tc.desc: Obtains a list of keys for the values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_VALUES_001
     * @tc.name: testLRUCacheValues001
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheValues001', 0, function () {
        var that = new util.LRUCache()
        that.put('string','abc')
        var result = that.values()
        expect(result[0]).assertEqual('abc')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_VALUES_002
     * @tc.name: testLRUCacheValues002
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_VALUES_003
     * @tc.name: testLRUCacheValues003
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_VALUES_004
     * @tc.name: testLRUCacheValues004
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_VALUES_005
     * @tc.name: testLRUCacheValues005
     * @tc.desc: Obtains a list of all values in the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_TO_STRING_001
     * @tc.name: testLRUCacheToString001
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheToString001', 0, function () {
        var that = new util.LRUCache()
        that.put('1111','bcjdshc')
        that.put(1,2)
        var result = that.toString()
        expect(result).assertEqual('LRUCache[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_TO_STRING_002
     * @tc.name: testLRUCacheToString002
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_TO_STRING_003
     * @tc.name: testLRUCacheToString003
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_TO_STRING_004
     * @tc.name: testLRUCacheToString004
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_TO_STRING_005
     * @tc.name: testLRUCacheToString005
     * @tc.desc: Returns a string representation of the object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_ENTRIES_001
     * @tc.name: testLRUCacheEntries001
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_ENTRIES_002
     * @tc.name: testLRUCacheEntries002
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_ENTRIES_003
     * @tc.name: testLRUCacheEntries003
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_ENTRIES_004
     * @tc.name: testLRUCacheEntries004
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_ENTRIES_005
     * @tc.name: testLRUCacheEntries005
     * @tc.desc: Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_[SYMBOL.ITERATOR]_001
     * @tc.name: testLRUCache[Symbol.iterator]001
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_[SYMBOL.ITERATOR]_002
     * @tc.name: testLRUCache[Symbol.iterator]002
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_[SYMBOL.ITERATOR]_003
     * @tc.name: testLRUCache[Symbol.iterator]003
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_[SYMBOL.ITERATOR]_004
     * @tc.name: testLRUCache[Symbol.iterator]004
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_[SYMBOL.ITERATOR]_005
     * @tc.name: testLRUCache[Symbol.iterator]005
     * @tc.desc: Returns a two - dimensional array in the form of key - value pairs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_AFTER_REMOVAL_001
     * @tc.name: testLRUCacheAfterRemoval001
     * @tc.desc: Executes subsequent operations after a value is deleted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_AFTER_REMOVAL_002
     * @tc.name: testLRUCacheAfterRemoval002
     * @tc.desc: Executes subsequent operations after a value is deleted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_AFTER_REMOVAL_003
     * @tc.name: testLRUCacheAfterRemoval003
     * @tc.desc: Executes subsequent operations after a value is deleted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_AFTER_REMOVAL_004
     * @tc.name: testLRUCacheAfterRemoval004
     * @tc.desc: Executes subsequent operations after a value is deleted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_AFTER_REMOVAL_005
     * @tc.name: testLRUCacheAfterRemoval005
     * @tc.desc: Executes subsequent operations after a value is deleted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_AFTER_REMOVAL_006
     * @tc.name: testLRUCacheAfterRemoval006
     * @tc.desc: Executes subsequent operations after a value is deleted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
        expect(arr[1]).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_AFTER_REMOVAL_007
     * @tc.name: testLRUCacheAfterRemoval007
     * @tc.desc: Executes subsequent operations after a value is deleted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_AFTER_REMOVAL_008
     * @tc.name: testLRUCacheAfterRemoval008
     * @tc.desc: Executes subsequent operations after a value is deleted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheAfterRemoval008', 0, function () {
        var arrk = [];
        var arrv = [];
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
              arrk = Array.from(key);
              arrv = Array.from(value);
            }
          }
        }
        var that = new ChildLRUCache(3);
        that.put(1,2)
        that.put(3,10)
        that.put(2,8)
        that.clear();
        expect(arrk[0]).assertEqual(1)
        expect(arrk[1]).assertEqual(3)
        expect(arrk[2]).assertEqual(2)
        expect(arrv[0]).assertEqual(2)
        expect(arrv[1]).assertEqual(10)
        expect(arrv[2]).assertEqual(8)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONSTRUCTOR_001
     * @tc.name: testLRUCacheConstrcutor001
     * @tc.desc: The default constructor is used to create a new LRUCache instance with a default capacity of 64.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheConstrcutor001', 0, function () {
        try{
            var that = new util.LRUCache(0.1)
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of 0.1 must be small integer');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of 0.1 must be small integer");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_CONSTRUCTOR_00
     * @tc.name: testLRUCacheConstrcutor001
     * @tc.desc: The default constructor is used to create a new LRUCache instance with a default capacity of 64.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheConstrcutor002', 0, function () {
        try{
            var that = new util.LRUCache(-0.1)
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of -0.1 must be small integer');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of -0.1 must be small integer");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_007
     * @tc.name: testLRUCacheUpdateGetCapacity007
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity007', 0, function () {
        var that = new util.LRUCache(200)
        try {
            that.updateCapacity(-20);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of -20 must be small integer');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of -20 must be small integer");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_008
     * @tc.name: testLRUCacheUpdateGetCapacity008
     * @tc.desc: Updates the buffer capacity to a specified capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheUpdateGetCapacity008', 0, function () {
        var that = new util.LRUCache(200)
        try {
            that.updateCapacity(50.5);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of 50.5 must be small integer');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of 50.5 must be small integer");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_GET_007
     * @tc.name: testLRUCacheGet007
     * @tc.desc: Obtains the value associated with a specified key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheGet007', 0, function () {
        var that = new util.LRUCache()
        that.put(20,'cdjcaxb')
        try {
            var result1 = that.get(null);
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of null must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of null must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_007
     * @tc.name: testLRUCachePut007
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut007', 0, function () {
        var that = new util.LRUCache()
        try {
            that.put(null,'bcjdshc')
          } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of key and value must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of key and value must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_PUT_008
     * @tc.name: testLRUCachePut008
     * @tc.desc: Adds a key-value pair to the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCachePut008', 0, function () {
        var that = new util.LRUCache()
        try {
            that.put(123, null)
          } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of key and value must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of key and value must be Object");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_LRU_CACHE_REMOVE_007
     * @tc.name: testLRUCacheRemove007
     * @tc.desc: Deletes a specified key and its associated value from the current buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLRUCacheRemove007', 0, function () {
        var that = new util.LRUCache()
        that.put(1,2)
        try {
            that.remove(null)
        } catch(e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of null must be Object');
            expect(e.code).assertEqual(401)
            expect(e.message).assertEqual("Parameter error. The type of null must be Object");
        }
    })
})

describe('FunctionTest', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_FORMAT_001
     * @tc.name: testUtilformat001
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_FORMAT_002
     * @tc.name: testUtilformat002
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilformat002', 0, function () {
        var format = "%O";
        var value = { name: 'jack' ,age: 15 };
        var result = util.format(format, value);
        expect(result).assertEqual("{ name: 'jack',\n  age: 15 }");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_FORMAT_003
     * @tc.name: testUtilformat003
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilformat003', 0, function () {
        var format = "%o";
        var value = [1, 2, 3];
        var result = util.format(format, value);
        var res = '[ 1, 2, 3, [length]: 3 ]'
        expect(result).assertEqual('[ 1, 2, 3, [length]: 3 ]');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_FORMAT_004
     * @tc.name: testUtilformat004
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilformat004', 0, function () {
        var format = "%s,%s,%s";
        var value1 = "1.5";
        var value2 = "qwer";
        var result = util.format(format, value1, value2);
        expect(result).assertEqual('1.5,qwer,%s');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_FORMAT_005
     * @tc.name: testUtilformat005
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilformat005', 0, function () {
        var format = "%d,%d";
        var value1 = 6;
        var value2 = 16;
        var result = util.format(format, value1, value2);
        expect(result).assertEqual('6,16');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_FORMAT_THROW_ERROR_001
     * @tc.name: testUtilformatThrowError001
     * @tc.desc: Returns the formatted string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be string or " +
                                             "array");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_001
     * @tc.name: testUtilerrnoToString001
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilerrnoToString001', 0, async function () {
        var errnum = 10;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('Unknown system error 10');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_002
     * @tc.name: testUtilerrnoToString002
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilerrnoToString002', 0, async function () {
        var errnum = 0;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('Unknown system error 0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_003
     * @tc.name: testUtilerrnoToString003
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilerrnoToString003', 0, async function () {
        var errnum = -1;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('operation not permitted');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_004
     * @tc.name: testUtilerrnoToString004
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilerrnoToString004', 0, async function () {
        var errnum = 9;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('Unknown system error 9');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_005
     * @tc.name: testUtilerrnoToString005
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilerrnoToString005', 0, async function () {
        var errnum = 555;
        var result = util.errnoToString(errnum);
        expect(result).assertEqual('Unknown system error 555');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_THROW_ERROR_001
     * @tc.name: testUtilerrnoToStringThrowError001
     * @tc.desc: Get the string name of the system errno.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilerrnoToStringThrowError001', 0, async function () {
        try {
            var errnum = 'str';
            var result = util.errnoToString(errnum);
            expect(result).assertEqual('Unknown system error 10');
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of str must be number");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PROMISIFY_THROW_ERROR_001
     * @tc.name: testUtilPromisifyThrowError001
     * @tc.desc: Takes a function following the common error-first callback style,
       taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_UUID_THROW_ERROR_001
     * @tc.name: testUtilRandomUUIDThrowError001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */

    it('testUtilRandomUUIDThrowError001', 0, async function () {
        try {
            var result = util.randomUUID(123);
            expect(result.length).assertEqual(36);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be boolean");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_BINARY_UUID_THROW_ERROR_001
     * @tc.name: testUtilRandomBinaryUUIDThrowError001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilRandomBinaryUUIDThrowError001', 0, async function () {
        try {
            var result = util.randomBinaryUUID(123);
            expect(result.length).assertEqual(16);
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be boolean");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_RANDOM_PARSE_UUID_THROW_001
     * @tc.name: testUtilParseUUIDThrow001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_PARSE_RATIONAL_NUMBER_001
     * @tc.name: test_parseRationalNumber_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_parseRationalNumber_001', 0, function () {
        var res = util.RationalNumber.parseRationalNumber(2, 1)
        var result = res.valueOf()
        expect(result).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_PARSE_RATIONAL_NUMBER_THROW_ERROR_001
     * @tc.name: test_parseRationalNumberThrowError_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_parseRationalNumberThrowError_001', 0, function () {
        try {
            var pro = util.RationalNumber.parseRationalNumber('str', 2)
            var result = res.valueOf()
            expect(result).assertEqual(2)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of str must be number");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_CREATE_RATIONAL_FROM_STRING_001
     * @tc.name: test_createRationalFromString_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_createRationalFromString_001', 0, function () {
        var res = util.RationalNumber.createRationalFromString('-1:2')
        var result = res.valueOf()
        expect(result).assertEqual(-0.5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_CREATE_RATIONAL_FROM_STRING_002
     * @tc.name: test_createRationalFromString_002
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_createRationalFromString_002', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+3/4')
        var result = res.valueOf()
        expect(result).assertEqual(0.75)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_CREATE_RATIONAL_FROM_STRING_003
     * @tc.name: test_createRationalFromString_003
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_createRationalFromString_003', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+3:-4')
        var result = res.valueOf()
        expect(result).assertEqual(-0.75)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_CREATE_RATIONAL_FROM_STRING_004
     * @tc.name: test_createRationalFromString_004
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_createRationalFromString_004', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+2:4')
        var result = res.valueOf()
        expect(result).assertEqual(0.5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_CREATE_RATIONAL_FROM_STRING_005
     * @tc.name: test_createRationalFromString_005
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_createRationalFromString_005', 0, function () {
        var res = util.RationalNumber.createRationalFromString('+2:-4')
        var result = res.valueOf()
        expect(result).assertEqual(-0.5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_CREATE_RATIONAL_FROM_STRING_THROW_ERROR_001
     * @tc.name: test_createRationalFromStringThrowError_001
     * @tc.desc: Creates a RationalNumber object based on a given string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_createRationalFromStringThrowError_001', 0, function () {
        try {
            var res = util.RationalNumber.createRationalFromString(123)
            var result = res.valueOf()
            expect(result).assertEqual(-0.5)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be string");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_COMPARE_001
     * @tc.name: test_compare_001
     * @tc.desc: Compares the current RationalNumber object with a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_compare_001', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(2, 1)
        var proc = util.RationalNumber.parseRationalNumber(3, 4)
        var res = pro.compare(proc)
        expect(res).assertEqual(1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_COMPARE_002
     * @tc.name: test_compare_002
     * @tc.desc: Compares the current RationalNumber object with a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_compare_002', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(2, 1)
        var proc = util.RationalNumber.parseRationalNumber(0, 0)
        var res = pro.compare(proc)
        expect(res).assertEqual(-1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_COMPARE_003
     * @tc.name: test_compare_003
     * @tc.desc: Compares the current RationalNumber object with a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_compare_003', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(2, 1)
        var proc = util.RationalNumber.parseRationalNumber(8, 3)
        var res = pro.compare(proc)
        expect(res).assertEqual(-1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_COMPARE_004
     * @tc.name: test_compare_004
     * @tc.desc: Compares the current RationalNumber object with a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_compare_004', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(2, 1)
        var proc = util.RationalNumber.parseRationalNumber(2, 1)
        var res = pro.compare(proc)
        expect(res).assertEqual(0)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_COMPARE_005
     * @tc.name: test_compare_005
     * @tc.desc: Compares the current RationalNumber object with a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_compare_005', 0, function () {
        var pro = util.RationalNumber.parseRationalNumber(0, 0)
        var proc = util.RationalNumber.parseRationalNumber(2, 1)
        var res = pro.compare(proc)
        expect(res).assertEqual(1)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_COMPARE_THROW_ERROR_001
     * @tc.name: test_compareThrowError_001
     * @tc.desc: Compares the current RationalNumber object with a given object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_compareThrowError_001', 0, function () {
        try {
            var pro = util.RationalNumber.parseRationalNumber(2, 1)
            var proc = 'str'
            var res = pro.compare(proc)
            expect(res).assertEqual(1)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of str must be RationalNumber");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_GET_COMMON_FACTOR_001
     * @tc.name: testgetCommonFactor001
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testgetCommonFactor001', 0, function () {
        var res = util.RationalNumber.getCommonFactor(4, 8)
        expect(res).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_GET_COMMON_FACTOR_002
     * @tc.name: testgetCommonFactor002
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testgetCommonFactor002', 0, function () {
        var res = util.RationalNumber.getCommonFactor(10, 15)
        expect(res).assertEqual(5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_GET_COMMON_FACTOR_003
     * @tc.name: testgetCommonFactor003
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testgetCommonFactor003', 0, function () {
        var res = util.RationalNumber.getCommonFactor(8, 4)
        expect(res).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_GET_COMMON_FACTOR_004
     * @tc.name: testgetCommonFactor004
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testgetCommonFactor004', 0, function () {
        var res = util.RationalNumber.getCommonFactor(8, 16)
        expect(res).assertEqual(8)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_GET_COMMON_FACTOR_005
     * @tc.name: testgetCommonFactor005
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testgetCommonFactor005', 0, function () {
        var res = util.RationalNumber.getCommonFactor(2, 16)
        expect(res).assertEqual(2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_GET_COMMON_FACTOR_THROW_ERROR_001
     * @tc.name: testgetCommonFactorThrowError001
     * @tc.desc: Obtains the greatest common divisor of two specified numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testgetCommonFactorThrowError001', 0, function () {
        try {
            var res = util.RationalNumber.getCommonFactor('str', 8)
            expect(res).assertEqual(4)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of str must be number");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_001
     * @tc.name: testUtilGetHash001
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash001', 0, function () {
        let person = {
          name: "Alice",
          age: 30
        };
        let result1 = util.getHash(person);
        let result2 = util.getHash(person);
        expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_002
     * @tc.name: testUtilGetHash002
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash002', 0, function () {
        let numbers = [1, 2, 3, 4, 5];
        let result1 = util.getHash(numbers);
        let result2 = util.getHash(numbers);
        expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_003
     * @tc.name: testUtilGetHash003
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash003', 0, function () {
        class Car {
          make;
          model;

          constructor(make, model) {
            this.make = make;
            this.model = model;
          }
        }

        let myCar = new Car("Toyota", "Corolla");
        let result1 = util.getHash(myCar);
        let result2 = util.getHash(myCar);
        expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_004
     * @tc.name: testUtilGetHash004
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash004', 0, function () {
        let now = new Date();
        let result1 = util.getHash(now);
        let result2 = util.getHash(now);
        expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_005
     * @tc.name: testUtilGetHash005
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash005', 0, function () {
        let regex = new RegExp("abc");
        let result1 = util.getHash(regex);
        let result2 = util.getHash(regex);
        expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_006
     * @tc.name: testUtilGetHash006
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash006', 0, function () {
        let mathObject = Math;
        let result1 = util.getHash(mathObject);
        let result2 = util.getHash(mathObject);
        expect(result1).assertEqual(result2);
    })
})

describe('Base64HelperTest', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_BASE64_001
     * @tc.name: test_encodeSync_base64_001
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_BASE64_002
     * @tc.name: test_encodeSync_base64_002
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_BASE64_003
     * @tc.name: test_encodeSync_base64_003
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_BASE64_004
     * @tc.name: test_encodeSync_base64_004
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_BASE64_005
     * @tc.name: test_encodeSync_base64_005
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_BASE64_006
     * @tc.name: test_encodeSync_base64_006
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeSync_base64_006', 0, function () {
        try {
            var that = new util.Base64Helper();
            var array = new Uint32Array([66, 97, 115, 101, 54, 52]);
            var result = that.encodeSync(array);
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array and " +
                                             "the length greater than zero.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_001
     * @tc.name: test_encodeToStringSync_base64_001
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_base64_001', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([115,49,51]);
        var result = that.encodeToStringSync(array)
        expect(result).assertEqual('czEz')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_002
     * @tc.name: test_encodeToStringSync_base64_002
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_base64_002', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('QmFzZTY0IE5vZGUuanM=')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_003
     * @tc.name: test_encodeToStringSync_base64_003
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_base64_003', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66,97,115,101,54,52,32,69,110,99,111,100,105,110,103,32,105,110,
        32,78,111,100,101,46,106,115]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_005
     * @tc.name: test_encodeToStringSync_base64_004
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_base64_004', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([168, 174, 155, 255]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('qK6b/w==')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_005
     * @tc.name: test_encodeToStringSync_base64_005
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_base64_005', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        var result = that.encodeToStringSync(array);
        expect(result).assertEqual('QmFzZTY0')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_006
     * @tc.name: test_encodeToStringSync_base64_006
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
        it('test_encodeToStringSync_base64_006', 0, function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint32Array([66, 97, 115, 101, 54, 52]);
            var result = that.encodeToStringSync(array);
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array and " +
                                             "the length greater than zero.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_001
     * @tc.name: test_decodeSync_base64_001
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_002
     * @tc.name: test_decodeSync_base64_002
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_003
     * @tc.name: test_decodeSync_base64_003
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_004
     * @tc.name: test_decodeSync_base64_004
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_005
     * @tc.name: test_decodeSync_base64_005
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_006
     * @tc.name: test_decodeSync_base64_006
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64_006', 0, function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint32Array([99,122,69,122]);
            var result = that.decodeSync(array);
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array or " +
                                             "string and the length greater than 0.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_007
     * @tc.name: test_decodeSync_base64_007
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_008
     * @tc.name: test_decodeSync_base64_008
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_009
     * @tc.name: test_decodeSync_base64_009
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODESYC_BASE64_010
     * @tc.name: test_decodeSync_base64_010
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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


    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODEASYNC_BASE64_001
     * @tc.name: test_encodeAsync_base64_001
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly
         allocated u8 array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODEASYNC_BASE64_002
     * @tc.name: test_encodeAsync_base64_002
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly
         allocated u8 array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODEASYNC_BASE64_003
     * @tc.name: test_encodeAsync_base64_003
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODEASYNC_BASE64_004
     * @tc.name: test_encodeAsync_base64_004
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODEASYNC_BASE64_005
     * @tc.name: test_encodeAsync_base64_005
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODEASYNC_BASE64_THROW_ERROR_001
     * @tc.name: test_encodeSync_base64_throwError_001
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1   
     */
        it('test_encodeSync_base64_throwError_001', 0, async function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint32Array([66, 97, 115, 101, 54, 52]);
            that.encode(array)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array and " +
                                             "the length greater than zero.")
        }

    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_001
     * @tc.name: test_encodeToString_base64_001
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_base64_001', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([115,49,51]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('czEz')
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_002
     * @tc.name: test_encodeToString_base64_002
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_base64_002', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('QmFzZTY0IE5vZGUuanM=')
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_003
     * @tc.name: test_encodeToString_base64_003
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_004
     * @tc.name: test_encodeToString_base64_004
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_base64_004', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([168, 174, 155, 255]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('qK6b/w==')
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_005
     * @tc.name: test_encodeToString_base64_005
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_base64_005', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([66, 97, 115, 101, 54, 52]);
        that.encodeToString(array).then(val=>{
            expect(val).assertEqual('QmFzZTY0')
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_006
     * @tc.name: test_encodeToString_base64_006
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
        it('test_encodeToString_base64_006', 0, async function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint32Array([66, 97, 115, 101, 54, 52]);
            that.encodeToString(array)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array and " +
                                             "the length greater than zero.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_001
     * @tc.name: test_decode_base64_001
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_002
     * @tc.name: test_decode_base64_002
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_003
     * @tc.name: test_decode_base64_003
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_004
     * @tc.name: test_decode_base64_004
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_005
     * @tc.name: test_decode_base64_005
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1 
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_006
     * @tc.name: test_decode_base64_006
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_007
     * @tc.name: test_decode_base64_007
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_008
     * @tc.name: test_decode_base64_008
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_009
     * @tc.name: test_decode_base64_009
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8 array
         into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_010
     * @tc.name: test_decode_base64_010
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_THROW_ERROR_001
     * @tc.name: test_decode_base64_throwError_001
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decode_base64_throwError_001', 0, async function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint16Array([99,122,69,122]);
            that.decode(array)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array or " +
                                             "string and the length greater than 0.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_SYNC_MIME_BASE64_001
     * @tc.name: test_encodeToStringSync_mime_base64_001
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
	it('test_encodeToStringSync_mime_base64_001', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101]);
        var result = that.encodeToStringSync(array, util.Type.MIME);
        expect(result).assertEqual('TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_SYNC_MIME_BASE64_002
     * @tc.name: test_decodeSync_mime_base64_002
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_mime_base64_002', 0, function () {
        var that = new util.Base64Helper()
        var buff = 'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
        var rarray = new Uint8Array([77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101]);
        var result = that.decodeSync(buff, util.Type.MIME);
        for (var i = 0; i < rarray.length; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_MIME_BASE64_003
     * @tc.name: test_encodeToString_mime_base64_003
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_mime_base64_003', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101]);
        that.encodeToString(array, util.Type.MIME).then(val=>{
            expect(val).assertEqual('TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n');
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE__MIME_BASE64_004
     * @tc.name: test_decode_mime_base64_004
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
        array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_mime_base64_004', 0, async function () {
        var that = new util.Base64Helper()
        var buff = 'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
        var array = new Uint8Array([77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101]);
        that.decode(buff, util.Type.MIME).then(val=>{
            for (var i = 0; i < array.length; i++) {
                expect(val[i]).assertEqual(array[i]);
            }
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_SYNC_BASIC_BASE64_001
     * @tc.name: test_encodeToStringSync_basic_base64_001
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_basic_base64_001', 0, function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101]);
        var result = that.encodeToStringSync(array, util.Type.BASIC);
        expect(result).assertEqual('TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_SYNC_BASIC_BASE64_002
     * @tc.name: test_decodeSync_basic_base64_002
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_basic_base64_002', 0, function () {
        var that = new util.Base64Helper()
        var buff = 'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=';
        var rarray = new Uint8Array([77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101]);
        var result = that.decodeSync(buff, util.Type.BASIC);
        for (var i = 0; i < rarray.length; i++) {
            expect(result[i]).assertEqual(rarray[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASIC_BASE64_003
     * @tc.name: test_encodeToString_basic_base64_003
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_basic_base64_003', 0, async function () {
        var that = new util.Base64Helper()
        var array = new Uint8Array([77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101]);
        that.encodeToString(array, util.Type.BASIC).then(val=>{
            expect(val).assertEqual('TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=');
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASIC_BASE64_004
     * @tc.name: test_decode_basic_base64_004
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
         array into a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_basic_base64_004', 0, async function () {
        var that = new util.Base64Helper()
        var buff = 'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=';
        var array = new Uint8Array([77,97,110,105,115,100,105,115,116,105,110,103,117,105,115,104,101,100,110,111,116,111,110,108,121,98,121,104,105,115,114,101,97,115,111,110,98,117,116,98,121,116,104,105,115,115,105,110,103,117,108,97,114,112,97,115,115,105,111,110,102,114,111,109,111,116,104,101,114,97,110,105,109,97,108,115,119,104,105,99,104,105,115,97,108,117,115,116,111,102,116,104,101,109,105,110,100,101,120,99,101,101,100,115,116,104,101,115,104,111,114,116,118,101,104,101,109,101,110,99,101,111,102,97,110,121,99,97,114,110,97,108,112,108,101,97,115,117,114,101]);
        that.decode(buff, util.Type.BASIC).then(val=>{
            for (var i = 0; i < array.length; i++) {
              expect(val[i]).assertEqual(array[i]);
            }
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_SYNC_BASE64_THROW_ERROR_001
     * @tc.name: test_decodeSync_base64_throwError_001
     * @tc.desc: Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64_throwError_001', 0, function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint8Array([99,122,69,122, 115, 119, 58]);
            that.decodeSync(array)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: The input string contains unsupported characters")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_SYNC_BASE64_THROW_ERROR_002
     * @tc.name: test_decodeSync_base64_throwError_002
     * @tc.desc: Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64_throwError_002', 0, function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint8Array([99, 42, 69,122, 115, 119, 36, 110]);
            that.decodeSync(array)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: The input string contains unsupported characters")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_SYNC_BASE64_THROW_ERROR_003
     * @tc.name: test_decodeSync_base64_throwError_003
     * @tc.desc: Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64_throwError_003', 0, function () {
        try {
            var that = new util.Base64Helper()
            var str = "QmFzZTY0IE5vZGU@@";
            that.decodeSync(str)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: The input string contains unsupported characters")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_SYNC_BASE64_THROW_ERROR_004
     * @tc.name: test_decodeSync_base64_throwError_004
     * @tc.desc: Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64_throwError_004', 0, function () {
        try {
            var that = new util.Base64Helper()
            var str = "QmFzZTY0IEVuY29k&&&aW5nIGluIE5vZGUua$$$%%%";
            that.decodeSync(str)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: The input string contains unsupported characters")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_SYNC_BASE64_THROW_ERROR_005
     * @tc.name: test_decodeSync_base64_throwError_005
     * @tc.desc: Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64_throwError_005', 0, function () {
        try {
            var that = new util.Base64Helper()
            var str = "";
            that.decodeSync(str)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: prolen is error !")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_SYNC_BASE64_THROW_ERROR_006
     * @tc.name: test_decodeSync_base64_throwError_006
     * @tc.desc: Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64_throwError_006', 0, function () {
        try {
            var that = new util.Base64Helper()
            var str = " ";
            that.decodeSync(str)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: The input string contains unsupported characters")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_SYNC_MIME_BASE64_THROW_ERROR_007
     * @tc.name: test_encodeToStringSync_mime_base64_throwError_007
     * @tc.desc: Use base64 for synchronous encode, an exception is thrown when the input
        parameter length does not meet the MIME encoding format.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_mime_base64_throwError_007', 0, function () {
        try {
            var that = new util.Base64Helper()
            let array = new Uint8Array([2,192,254,253,5,132,69]);
            let result = that.encodeToStringSync(array, util.Type.MIME);
        } catch (e) {
            expect(e.toString()).assertEqual("Error: The parameter length does not meet this encoding format.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_MIME_BASE64_THROW_ERROR_008
     * @tc.name: test_encodeToString_mime_base64_throwError_008
     * @tc.desc: Use base64 for synchronous encode, an exception is thrown when the input
        parameter length does not meet the MIME encoding format.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_mime_base64_throwError_008', 0, function () {
        try {
            var that = new util.Base64Helper()
            let array = new Uint8Array([2,192,254,253,5,132,69]);
            that.encodeToString(array, util.Type.MIME).then(val=>{
              expect(val).assertEqual('AsD+/QWERQ==');
            })
        } catch (e) {
            expect(e.toString()).assertEqual("Error: The parameter length does not meet this encoding format.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODETOSTRINGSYNC_BASE64URL_001
     * @tc.name: test_encodeToStringSync_base64url_001
     * @tc.desc: Encodes the specified byte array into a String using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_base64url_001', 0, function () {
        let that = new util.Base64Helper()
        let array = new Uint8Array([2,192,254,253,5,132,69]);
        let result = that.encodeToStringSync(array);
        let resBas = that.encodeToStringSync(array, util.Type.BASIC);
        let resUrl = that.encodeToStringSync(array, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual('AsD+/QWERQ==');
        expect(resBas).assertEqual('AsD+/QWERQ==');
        expect(resUrl).assertEqual('AsD-_QWERQ');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODETOSTRINGSYNC_BASE64URL_002
     * @tc.name: test_encodeToStringSync_base64url_002
     * @tc.desc: Encodes the specified byte array into a String using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
     it('test_encodeToStringSync_base64url_002', 0, function () {
        let that = new util.Base64Helper()
        let array = new Uint8Array([2,192,254,65,97,17,67,223,178]);
        let result = that.encodeToStringSync(array);
        let resBas = that.encodeToStringSync(array, util.Type.BASIC);
        let resUrl = that.encodeToStringSync(array, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual('AsD+QWERQ9+y');
        expect(resBas).assertEqual('AsD+QWERQ9+y');
        expect(resUrl).assertEqual('AsD-QWERQ9-y');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODETOSTRINGSYNC_BASE64URL_003
     * @tc.name: test_encodeToStringSync_base64url_003
     * @tc.desc: Encodes the specified byte array into a String using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_base64url_003', 0, function () {
        let that = new util.Base64Helper()
        let array = new Uint8Array([2,192,255,65,97,17,67,223,242]);
        let result = that.encodeToStringSync(array);
        let resBas = that.encodeToStringSync(array, util.Type.BASIC);
        let resUrl = that.encodeToStringSync(array, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual('AsD/QWERQ9/y');
        expect(resBas).assertEqual('AsD/QWERQ9/y');
        expect(resUrl).assertEqual('AsD_QWERQ9_y');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_BASE64URL_001
     * @tc.name: test_encodeSync_base64url_001
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeSync_base64url_001', 0, function () {
        let that = new util.Base64Helper()
        let array = new Uint8Array([2,192,254,253,5,132,69]);
        let result = that.encodeSync(array);
        let resBas = that.encodeSync(array, util.Type.BASIC);
        let resUrl = that.encodeSync(array, util.Type.BASIC_URL_SAFE);
        let arrBas = new Uint8Array([65,115,68,43,47,81,87,69,82,81,61,61]);
        let arrUrl = new Uint8Array([65,115,68,45,95,81,87,69,82,81]);
        expect(result.every((value, index) => value === arrBas[index])).assertEqual(true);
        expect(resBas.every((value, index) => value === arrBas[index])).assertEqual(true);
        expect(resUrl.every((value, index) => value === arrUrl[index])).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_BASE64URL_002
     * @tc.name: test_encodeSync_base64url_002
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeSync_base64url_002', 0, function () {
        let that = new util.Base64Helper()
        let array = new Uint8Array([2,192,254,65,97,17,67,223,178]);
        let result = that.encodeSync(array);
        let resBas = that.encodeSync(array, util.Type.BASIC);
        let resUrl = that.encodeSync(array, util.Type.BASIC_URL_SAFE);
        let arrBas = new Uint8Array([65,115,68,43,81,87,69,82,81,57,43,121]);
        let arrUrl = new Uint8Array([65,115,68,45,81,87,69,82,81,57,45,121]);
        expect(result.every((value, index) => value === arrBas[index])).assertEqual(true);
        expect(resBas.every((value, index) => value === arrBas[index])).assertEqual(true);
        expect(resUrl.every((value, index) => value === arrUrl[index])).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_BASE64URL_003
     * @tc.name: test_encodeSync_base64url_003
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeSync_base64url_003', 0, function () {
        let that = new util.Base64Helper()
        let array = new Uint8Array([2,192,255,65,97,17,67,223,242]);
        let result = that.encodeSync(array);
        let resBas = that.encodeSync(array, util.Type.BASIC);
        let resUrl = that.encodeSync(array, util.Type.BASIC_URL_SAFE);
        let arrBas = new Uint8Array([65,115,68,47,81,87,69,82,81,57,47,121]);
        let arrUrl = new Uint8Array([65,115,68,95,81,87,69,82,81,57,95,121]);
        expect(result.every((value, index) => value === arrBas[index])).assertEqual(true);
        expect(resBas.every((value, index) => value === arrBas[index])).assertEqual(true);
        expect(resUrl.every((value, index) => value === arrUrl[index])).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODETOSTRING_BASE64URL_001
     * @tc.name: test_encodeToString_base64url_001
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 and
     * Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_base64url_001', 0, function () {
        let that = new util.Base64Helper();
        let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
        that.encodeToString(array).then(result => {
            expect(result).assertEqual('AsD+/QWERQ==');
        })
        that.encodeToString(array, util.Type.BASIC).then(resBas => {
            expect(resBas).assertEqual('AsD+/QWERQ==');
        })
        that.encodeToString(array, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl).assertEqual('AsD-_QWERQ');
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODETOSTRING_BASE64URL_002
     * @tc.name: test_encodeToString_base64url_002
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 and
     * Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_base64url_002', 0, function () {
        let that = new util.Base64Helper();
        let array = new Uint8Array([2,192,254,65,97,17,67,223,178]);
        that.encodeToString(array).then(result => {
            expect(result).assertEqual('AsD+QWERQ9+y');
        })
        that.encodeToString(array, util.Type.BASIC).then(resBas => {
            expect(resBas).assertEqual('AsD+QWERQ9+y');
        })
        that.encodeToString(array, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl).assertEqual('AsD-QWERQ9-y');
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODETOSTRING_BASE64URL_003
     * @tc.name: test_encodeToString_base64url_003
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 and
     * Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_base64url_003', 0, function () {
        let that = new util.Base64Helper();
        let array = new Uint8Array([2,192,255,65,97,17,67,223,242]);
        that.encodeToString(array).then(result => {
            expect(result).assertEqual('AsD/QWERQ9/y');
        })
        that.encodeToString(array, util.Type.BASIC).then(resBas => {
            expect(resBas).assertEqual('AsD/QWERQ9/y');
        })
        that.encodeToString(array, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl).assertEqual('AsD_QWERQ9_y');
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_BASE64URL_001
     * @tc.name: test_encode_base64url_001
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated
     * u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encode_base64url_001', 0, function () {
        let that = new util.Base64Helper();
        let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
        let arrBas = new Uint8Array([65,115,68,43,47,81,87,69,82,81,61,61]);
        let arrUrl = new Uint8Array([65,115,68,45,95,81,87,69,82,81]);
        that.encode(array).then(result => {
            expect(result.every((value, index) => value === arrBas[index])).assertEqual(true);
        })
        that.encode(array, util.Type.BASIC).then(resBas => {
            expect(resBas.every((value, index) => value === arrBas[index])).assertEqual(true);
        })
        that.encode(array, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl.every((value, index) => value === arrUrl[index])).assertEqual(true);
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_BASE64URL_002
     * @tc.name: test_encode_base64url_002
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated
     * u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encode_base64url_002', 0, function () {
        let that = new util.Base64Helper();
        let array = new Uint8Array([2,192,254,65,97,17,67,223,178]);
        let arrBas = new Uint8Array([65,115,68,43,81,87,69,82,81,57,43,121]);
        let arrUrl = new Uint8Array([65,115,68,45,81,87,69,82,81,57,45,121]);
        that.encode(array).then(result => {
            expect(result.every((value, index) => value === arrBas[index])).assertEqual(true);
        })
        that.encode(array, util.Type.BASIC).then(resBas => {
            expect(resBas.every((value, index) => value === arrBas[index])).assertEqual(true);
        })
        that.encode(array, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl.every((value, index) => value === arrUrl[index])).assertEqual(true);
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_BASE64URL_003
     * @tc.name: test_encode_base64url_003
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated
     * u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encode_base64url_003', 0, function () {
        let that = new util.Base64Helper();
        let array = new Uint8Array([2,192,255,65,97,17,67,223,242]);
        let arrBas = new Uint8Array([65,115,68,47,81,87,69,82,81,57,47,121]);
        let arrUrl = new Uint8Array([65,115,68,95,81,87,69,82,81,57,95,121]);
        that.encode(array).then(result => {
            expect(result.every((value, index) => value === arrBas[index])).assertEqual(true);
        })
        that.encode(array, util.Type.BASIC).then(resBas => {
            expect(resBas.every((value, index) => value === arrBas[index])).assertEqual(true);
        })
        that.encode(array, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl.every((value, index) => value === arrUrl[index])).assertEqual(true);
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODESYNC_BASE64URL_001
     * @tc.name: test_decodeSync_base64url_001
     * @tc.desc: Decodes String into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64url_001', 0, function () {
        let that = new util.Base64Helper();
        let str = "AsD+/QWERQ==";
        let strUrl = "AsD-_QWERQ";
        let array = new Uint8Array([2,192,254,253,5,132,69]);
        let result = that.decodeSync(str);
        let resBas = that.decodeSync(str, util.Type.BASIC);
        let resUrl = that.decodeSync(strUrl, util.Type.BASIC_URL_SAFE);
        expect(result.every((value, index) => value === array[index])).assertEqual(true);
        expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODESYNC_BASE64URL_002
     * @tc.name: test_decodeSync_base64url_002
     * @tc.desc: Decodes String into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64url_002', 0, function () {
        let that = new util.Base64Helper();
        let str = "AsD+QWERQ9+y";
        let strUrl = "AsD-QWERQ9-y";
        let array = new Uint8Array([2,192,254,65,97,17,67,223,178]);
        let result = that.decodeSync(str);
        let resBas = that.decodeSync(str, util.Type.BASIC);
        let resUrl = that.decodeSync(strUrl, util.Type.BASIC_URL_SAFE);
        expect(result.every((value, index) => value === array[index])).assertEqual(true);
        expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODESYNC_BASE64URL_003
     * @tc.name: test_decodeSync_base64url_003
     * @tc.desc: Decodes String into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64url_003', 0, function () {
        let that = new util.Base64Helper();
        let str = "AsD/QWERQ9/y";
        let strUrl = "AsD_QWERQ9_y";
        let array = new Uint8Array([2,192,255,65,97,17,67,223,242]);
        let result = that.decodeSync(str);
        let resBas = that.decodeSync(str, util.Type.BASIC);
        let resUrl = that.decodeSync(strUrl, util.Type.BASIC_URL_SAFE);
        expect(result.every((value, index) => value === array[index])).assertEqual(true);
        expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODESYNC_BASE64URL_004
     * @tc.name: test_decodeSync_base64url_004
     * @tc.desc: Decodes input u8 array into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64url_004', 0, function () {
        let that = new util.Base64Helper();
        let arrBas = new Uint8Array([65,115,68,43,47,81,87,69,82,81,61,61]);
        let arrURL = new Uint8Array([65,115,68,45,95,81,87,69,82,81]);
        let array = new Uint8Array([2,192,254,253,5,132,69]);
        let result = that.decodeSync(arrBas);
        let resBas = that.decodeSync(arrBas, util.Type.BASIC);
        let resUrl = that.decodeSync(arrURL, util.Type.BASIC_URL_SAFE);
        expect(result.every((value, index) => value === array[index])).assertEqual(true);
        expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODESYNC_BASE64URL_005
     * @tc.name: test_decodeSync_base64url_005
     * @tc.desc: Decodes input u8 array into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64url_005', 0, function () {
        let that = new util.Base64Helper();
        let arrBas = new Uint8Array([65,115,68,43,81,87,69,82,81,57,43,121]);
        let arrURL = new Uint8Array([65,115,68,45,81,87,69,82,81,57,45,121]);
        let array = new Uint8Array([2,192,254,65,97,17,67,223,178]);
        let result = that.decodeSync(arrBas);
        let resBas = that.decodeSync(arrBas, util.Type.BASIC);
        let resUrl = that.decodeSync(arrURL, util.Type.BASIC_URL_SAFE);
        expect(result.every((value, index) => value === array[index])).assertEqual(true);
        expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODESYNC_BASE64URL_006
     * @tc.name: test_decodeSync_base64url_006
     * @tc.desc: Decodes input u8 array into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decodeSync_base64url_006', 0, function () {
        let that = new util.Base64Helper();
        let arrBas = new Uint8Array([65,115,68,47,81,87,69,82,81,57,47,121]);
        let arrURL = new Uint8Array([65,115,68,95,81,87,69,82,81,57,95,121]);
        let array = new Uint8Array([2,192,255,65,97,17,67,223,242]);
        let result = that.decodeSync(arrBas);
        let resBas = that.decodeSync(arrBas, util.Type.BASIC);
        let resUrl = that.decodeSync(arrURL, util.Type.BASIC_URL_SAFE);
        expect(result.every((value, index) => value === array[index])).assertEqual(true);
        expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64URL_001
     * @tc.name: test_decode_base64url_001
     * @tc.desc: Use the Base64 and Base64URL encoding scheme to asynchronously decode a string into
     * a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decode_base64url_001', 0, function () {
        let that = new util.Base64Helper();
        let str = "AsD+/QWERQ==";
        let strUrl = "AsD-_QWERQ";
        let array = new Uint8Array([2,192,254,253,5,132,69]);
        that.decode(str).then(result => {
            expect(result.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.decode(str, util.Type.BASIC).then(resBas => {
            expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.decode(strUrl, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64URL_002
     * @tc.name: test_decode_base64url_002
     * @tc.desc: Use the Base64 and Base64URL encoding scheme to asynchronously decode a string into
     * a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decode_base64url_002', 0, function () {
        let that = new util.Base64Helper();
        let str = "AsD+QWERQ9+y";
        let strUrl = "AsD-QWERQ9-y";
        let array = new Uint8Array([2,192,254,65,97,17,67,223,178]);
        that.decode(str).then(result => {
            expect(result.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.decode(str, util.Type.BASIC).then(resBas => {
            expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.decode(strUrl, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64URL_003
     * @tc.name: test_decode_base64url_003
     * @tc.desc: Use the Base64 and Base64URL encoding scheme to asynchronously decode a string into
     * a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decode_base64url_003', 0, function () {
        let that = new util.Base64Helper();
        let str = "AsD/QWERQ9/y";
        let strUrl = "AsD_QWERQ9_y";
        let array = new Uint8Array([2,192,255,65,97,17,67,223,242]);
        that.decode(str).then(result => {
            expect(result.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.decode(str, util.Type.BASIC).then(resBas => {
            expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.decode(strUrl, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64URL_004
     * @tc.name: test_decode_base64url_004
     * @tc.desc: Use the Base64 and Base64URL encoding scheme to asynchronously decode a input u8 array into
     * a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decode_base64url_004', 0, function () {
        let that = new util.Base64Helper();
        let arrBas = new Uint8Array([65,115,68,43,47,81,87,69,82,81,61,61]);
        let arrUrl = new Uint8Array([65,115,68,45,95,81,87,69,82,81]);
        let array = new Uint8Array([2,192,254,253,5,132,69]);
        that.decode(arrBas).then(result => {
            expect(result.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.encode(arrBas, util.Type.BASIC).then(resBas => {
            expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.encode(arrUrl, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64URL_005
     * @tc.name: test_decode_base64url_005
     * @tc.desc: Use the Base64 and Base64URL encoding scheme to asynchronously decode a input u8 array into
     * a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decode_base64url_005', 0, function () {
        let that = new util.Base64Helper();
        let arrBas = new Uint8Array([65,115,68,43,81,87,69,82,81,57,43,121]);
        let arrUrl = new Uint8Array([65,115,68,45,81,87,69,82,81,57,45,121]);
        let array = new Uint8Array([2,192,254,65,97,17,67,223,178]);
        that.decode(arrBas).then(result => {
            expect(result.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.encode(arrBas, util.Type.BASIC).then(resBas => {
            expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.encode(arrUrl, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64URL_006
     * @tc.name: test_decode_base64url_006
     * @tc.desc: Use the Base64 and Base64URL encoding scheme to asynchronously decode a input u8 array into
     * a newly allocated u8 array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_decode_base64url_006', 0, function () {
        let that = new util.Base64Helper();
        let arrBas = new Uint8Array([65,115,68,47,81,87,69,82,81,57,47,121]);
        let arrUrl = new Uint8Array([65,115,68,95,81,87,69,82,81,57,95,121]);
        let array = new Uint8Array([2,192,255,65,97,17,67,223,242]);
        that.decode(arrBas).then(result => {
            expect(result.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.encode(arrBas, util.Type.BASIC).then(resBas => {
            expect(resBas.every((value, index) => value === array[index])).assertEqual(true);
        })
        that.encode(arrUrl, util.Type.BASIC_URL_SAFE).then(resUrl => {
            expect(resUrl.every((value, index) => value === array[index])).assertEqual(true);
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_THROWERROR_001
     * @tc.name: test_encodesync_throwError_001
     * @tc.desc: An error is thrown when the parameter does not meet the interface requirements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodesync_throwError_001', 0, function () {
        try {
            let that = new util.Base64Helper();
            let array = new Uint8Array([115,49,51]);
            that.encodeSync(array, 5);
        } catch (e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.' +
                ' The target encoding type option must be BASIC or BASIC_URL_SAFE.');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_THROWERROR_002
     * @tc.name: test_encodesync_throwError_002
     * @tc.desc: An error is thrown when the parameter does not meet the interface requirements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodesync_throwError_002', 0, function () {
        try {
            let that = new util.Base64Helper();
            let array = new Uint8Array([115,49,51]);
            that.encodeSync(array, util.Type.MIME);
        } catch (e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.' +
                ' The target encoding type option must be BASIC or BASIC_URL_SAFE.');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_THROWERROR_003
     * @tc.name: test_encodesync_throwError_003
     * @tc.desc: An error is thrown when the parameter does not meet the interface requirements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodesync_throwError_003', 0, function () {
        try {
            let that = new util.Base64Helper();
            let array = new Uint8Array([115,49,51]);
            that.encodeSync(array, util.Type.MIME_URL_SAFE);
        } catch (e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.' +
                ' The target encoding type option must be BASIC or BASIC_URL_SAFE.');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODETOSTRINGSYNC_THROWERROR_001
     * @tc.name: test_encodeToStringSync_throwError_001
     * @tc.desc: An error is thrown when the argument is out of enumeration range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_throwError_001', 0, function () {
        try {
            let that = new util.Base64Helper();
            let array = new Uint8Array([115,49,51]);
            that.encodeToStringSync(array, 4);
        } catch (e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error.' +
                ' The target encoding type option must be one of the Type enumerations.');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_THROWERROR_001
     * @tc.name: test_encode_throwError_001
     * @tc.desc: An error is thrown when the parameter does not meet the interface requirements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encode_throwError_001', 0, function () {
        try {
            let that = new util.Base64Helper();
            let array = new Uint8Array([115,49,51]);
            that.encode(array, 6);
        } catch (e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of 6 must be BASIC or ' +
                                             'BASIC_URL_SAFE');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_THROWERROR_002
     * @tc.name: test_encode_throwError_002
     * @tc.desc: An error is thrown when the parameter does not meet the interface requirements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encode_throwError_002', 0, function () {
        try {
            let that = new util.Base64Helper();
            let array = new Uint8Array([115,49,51]);
            that.encode(array, util.Type.MIME);
        } catch (e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of 1 must be BASIC or ' +
                                             'BASIC_URL_SAFE');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_THROWERROR_003
     * @tc.name: test_encode_throwError_003
     * @tc.desc: An error is thrown when the parameter does not meet the interface requirements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encode_throwError_003', 0, function () {
        try {
            let that = new util.Base64Helper();
            let array = new Uint8Array([115,49,51]);
            that.encode(array, util.Type.MIME_URL_SAFE);
        } catch (e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of 3 must be BASIC or ' +
                                             'BASIC_URL_SAFE');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODETOSTRING_THROWERROR_001
     * @tc.name: test_encodeToString_throwError_001
     * @tc.desc: An error is thrown when the argument is out of enumeration range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_throwError_001', 0, function () {
        try {
            let that = new util.Base64Helper();
            let array = new Uint8Array([115,49,51]);
            that.encodeToString(array, 5);
        } catch (e) {
            expect(e.toString()).assertEqual('BusinessError: Parameter error. The type of 5 must be one of the type ' +
                                             'enumerations');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODESYNC_THROW_ERROR_001
     * @tc.name: test_encodeSync_base64_throw_error_001
     * @tc.desc: Encodes all bytes from the specified u8 array into a newly-allocated u8
        array using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeSync_base64_throw_error_001', 0, function () {
        try {
            var that = new util.Base64Helper();
            var array = new Uint8Array([]);
            var result = that.encodeSync(array);
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array and " +
                                             "the length greater than zero.");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_THROW_ERROR_002
     * @tc.name: test_encodeToStringSync_base64_throw_error_002
     * @tc.desc: Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToStringSync_base64_throw_error_002', 0, function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint8Array([]);
            var result = that.encodeToStringSync(array);
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array and " +
                                             "the length greater than zero.");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODESYNC_BASE64_THROW_ERROR_003
     * @tc.name: test_decodeSync_base64_throw_error_003
     * @tc.desc: Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
       array using the Base64 encoding scheme.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('test_decodeSync_base64_throw_error_003', 0, function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint8Array([]);
            var result = that.decodeSync(array);
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array or " +
                                             "string and the length greater than 0.");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODEASYNC_BASE64_THROW_ERROR_004
     * @tc.name: test_encodeAsync_base64_throwError_004
     * @tc.desc: Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
       array using the Base64 encoding scheme.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('test_encodeAsync_base64_throwError_004', 0, async function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint8Array([]);
            that.encode(array)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array and " +
                                             "the length greater than zero.");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_TO_STRING_BASE64_THROW_ERROR_005
     * @tc.name: test_encodeToString_base64_throwError_005
     * @tc.desc: Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('test_encodeToString_base64_throwError_005', 0, async function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint8Array([]);
            that.encodeToString(array)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array and " +
                                             "the length greater than zero.");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_THROW_ERROR_006
     * @tc.name: test_decode_base64_throwError_006
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('test_decode_base64_throwError_006', 0, async function () {
        try {
            var that = new util.Base64Helper()
            var array = new Uint8Array([]);
            that.decode(array)
        } catch (e) {
            expect(e.toString()).assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array or " +
                                             "string and the length greater than 0.");
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_THROW_ERROR_007
     * @tc.name: test_decode_base64_throwError_007
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('test_decode_base64_throwError_007', 0, async function () {
        let base64Helper = new util.Base64Helper();
        base64Helper.decode('1').then((val) => {
        }).catch((e) => {
          expect(e.toString()).assertContain('BusinessError: Parameter error. The type of the parameter must be a string and must be valid and legal');
          expect(e.code).assertContain(401);
          expect(e.message).assertContain("Parameter error. The type of the parameter must be a string and must be valid and legal");
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_THROW_ERROR_008
     * @tc.name: test_decode_base64_throwError_008
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('test_decode_base64_throwError_008', 0, async function () {
        let base64Helper = new util.Base64Helper();
        base64Helper.decode('12').then((val) => {
        }).catch((e) => {
          expect(e.toString()).assertContain('BusinessError: Parameter error. The type of the parameter must be a string and must be valid and legal');
          expect(e.code).assertContain(401);
          expect(e.message).assertContain("Parameter error. The type of the parameter must be a string and must be valid and legal");
        })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DECODE_BASE64_THROW_ERROR_009
     * @tc.name: test_decode_base64_throwError_009
     * @tc.desc: Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
       array into a newly allocated u8 array.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
       it('test_decode_base64_throwError_009', 0, async function () {
        let base64Helper = new util.Base64Helper();
        base64Helper.decode('150').then((val) => {
        }).catch((e) => {
          expect(e.toString()).assertContain('BusinessError: Parameter error. The type of the parameter must be a string and must be valid and legal');
          expect(e.code).assertContain(401);
          expect(e.message).assertContain("Parameter error. The type of the parameter must be a string and must be valid and legal");
        })
    })
})

describe('DecodeEncodeTest', function () {
    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_001
     * @tc.name: testTextDecoderCreate001
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate001', 0, function () {
        var  that = util.TextDecoder.create('utf-8', { ignoreBOM : true })
        var retStr = that.encoding
        expect(retStr).assertEqual('utf-8')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_002
     * @tc.name: testTextDecoderCreate002
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate002', 0, function () {
        var that = util.TextDecoder.create('utf-16le')
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16le')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_003
     * @tc.name: testTextDecoderCreate003
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate003', 0, function () {
        var that = util.TextDecoder.create('utf-16be')
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_004
     * @tc.name: testTextDecoderCreate004
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate004', 0, function () {
        var that = util.TextDecoder.create('utf-16be', { ignoreBOM : true })
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_005
     * @tc.name: testTextDecoderCreate005
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate005', 0, function () {
        var that = util.TextDecoder.create('utf-16be', { ignoreBOM : false })
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-16be')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_006
     * @tc.name: testTextDecoderCreate006
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate006', 0, function () {
        var that = util.TextDecoder.create()
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-8')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_007
     * @tc.name: testTextDecoderCreate007
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate007', 0, function () {
        var that = util.TextDecoder.create(undefined, { ignoreBOM : false })
        var encodingStr = that.encoding
        expect(encodingStr).assertEqual('utf-8')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_008
     * @tc.name: testTextDecoderCreate008
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
     it('testTextDecoderCreate008', 0, function () {
        var that = util.TextDecoder.create(undefined);
        var encodingStr = that.encoding;
        expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_009
     * @tc.name: testTextDecoderCreate009
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate009', 0, function () {
        var that = util.TextDecoder.create('utf-8', undefined);
        var encodingStr = that.encoding;
        expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_010
     * @tc.name: testTextDecoderCreate0010
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate0010', 0, function () {
        var that = util.TextDecoder.create(undefined, { ignoreBOM : true });
        var encodingStr = that.encoding;
        expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_011
     * @tc.name: testTextDecoderCreate011
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate011', 0, function () {
        var that = util.TextDecoder.create(null);
        var encodingStr = that.encoding;
        expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_012
     * @tc.name: testTextDecoderCreate012
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate012', 0, function () {
        var that = util.TextDecoder.create('utf-8', null);
        var encodingStr = that.encoding;
        expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_013
     * @tc.name: testTextDecoderCreate0013
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreate0013', 0, function () {
        var that = util.TextDecoder.create(null, { ignoreBOM : true });
        var encodingStr = that.encoding;
        expect(encodingStr).assertEqual('utf-8');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_THROW_ERROR_001
     * @tc.name: testTextDecoderCreateThrowError001
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreateThrowError001', 0, function () {
        try {
            var that = util.TextDecoder.create(123, { ignoreBOM : false })
            var encodingStr = that.encoding
            expect(encodingStr).assertEqual('utf-16be')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be string")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_THROW_ERROR_002
     * @tc.name: testTextDecoderCreateThrowError002
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreateThrowError002', 0, function () {
        try {
            var that = util.TextDecoder.create('utf-16be', 'ignoreBOM')
            var encodingStr = that.encoding
            expect(encodingStr).assertEqual('utf-16be')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of ignoreBOM must be object")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_TEXT_DECODER_CREATE_THROW_ERROR_003
     * @tc.name: testTextDecoderCreateThrowError003
     * @tc.desc: The source encoding's name, lowercased.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextDecoderCreateThrowError003', 0, function () {
        try {
            var that = util.TextDecoder.create('utf-16be', 123)
            var encodingStr = that.encoding
            expect(encodingStr).assertEqual('utf-16be')
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of 123 must be object")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDE_WITH_STREAM_001
     * @tc.name: decodeWithStream001
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeWithStream001', 0, function () {
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([0,65,49,53,79,75,70,69]);
        var retStr = that.decodeWithStream(uint8arr);
        expect(retStr).assertEqual(' A15OKFE')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDE_WITH_STREAM_002
     * @tc.name: decodeWithStream002
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeWithStream002', 0, function () {
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([67,65,49,53,0,109,112]);
        let retStr = that.decodeWithStream(uint8arr);
        expect(retStr).assertEqual('CA15 mp')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDE_WITH_STREAM_003
     * @tc.name: decodeWithStream003
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeWithStream003', 0, function () {
        const that = util.TextDecoder.create('utf-8');
        const uint8arr = new Uint8Array([84,67,65,53,49,79,0]);
        var retStr = that.decodeWithStream(uint8arr);
        expect(retStr).assertEqual('TCA51O ')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING001
     * @tc.name: decodeTostring001
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring001', 0, function () {
        let textDecoder = util.TextDecoder.create('utf-8', {ignoreBOM:true});
        let uint8 = new Uint8Array([0xEF,0xBB,0xBF,228,189,160,0,0,229,165,189,0]);
        let resStr = textDecoder.decodeToString(uint8);
        expect(resStr).assertEqual('你\u0000\u0000好\u0000');
        expect(resStr.length).assertEqual(5);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING002
     * @tc.name: decodeTostring002
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring002', 0, function () {
        let textDecoder = util.TextDecoder.create('utf-8', {ignoreBOM:false});
        let uint8 = new Uint8Array([0xEF,0xBB,0xBF,228,189,160,0,0,229,165,189,0]);
        let resStr = textDecoder.decodeToString(uint8);
        expect(resStr).assertEqual('\uFEFF你\u0000\u0000好\u0000');
        expect(resStr.length).assertEqual(6);
    })


    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING003
     * @tc.name: decodeTostring003
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring003', 0, function () {
        let textDecoder = util.TextDecoder.create('utf-8', {ignoreBOM:true});
        let uint8 = new Uint8Array([228,189,160,0,0,229,165,189,0]);
        let resStr = textDecoder.decodeToString(uint8);
        expect(resStr).assertEqual('你\u0000\u0000好\u0000');
        expect(resStr.length).assertEqual(5);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING004
     * @tc.name: decodeTostring004
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring004', 0, function () {
        let textDecoder = util.TextDecoder.create('utf-8', {ignoreBOM:false});
        let uint8 = new Uint8Array([228,189,160,0,0,229,165,189,0]);
        let resStr = textDecoder.decodeToString(uint8);
        expect(resStr).assertEqual('你\u0000\u0000好\u0000');
        expect(resStr.length).assertEqual(5);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING005
     * @tc.name: decodeTostring005
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring005', 0, function () {
        let textDecoder = util.TextDecoder.create('utf-8', {ignoreBOM:false});
        let uint8 = new Uint8Array([228,189,160,229]);
        let retStr = textDecoder.decodeToString(uint8, {stream: true});
        expect(retStr).assertEqual('你');
        let uint8arr = new Uint8Array([165,189]);
        let resStr = textDecoder.decodeToString(uint8arr, {stream: true});
        expect(resStr).assertEqual('好');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING006
     * @tc.name: decodeTostring006
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring006', 0, function () {
        let textDecoder = util.TextDecoder.create('utf-8', {ignoreBOM:false});
        let uint8 = new Uint8Array();
        let resStr = textDecoder.decodeToString(uint8);
        expect(resStr).assertEqual('');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING007
     * @tc.name: decodeTostring007
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring007', 0, function () {
        let textDecoder = util.TextDecoder.create('utf-8', {ignoreBOM:false});
        let resStr = textDecoder.decodeToString(undefined);
        expect(resStr).assertEqual('');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING008
     * @tc.name: decodeTostring008
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring008', 0, function () {
        let that = new util.TextEncoder('gb18030');
        let result = that.encodeInto('abc哈哈熠熠');
        let textDecode = util.TextDecoder.create('gb18030', {ignoreBOM : true});
        let res = textDecode.decodeToString(result);
        expect(res).assertEqual('abc哈哈熠熠')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING009
     * @tc.name: decodeTostring009
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring009', 0, function () {
        let that = new util.TextEncoder('big5');
        let result = that.encodeInto('abc哈哈熠熠');
        let textDecode = util.TextDecoder.create('big5', {ignoreBOM : true});
        let res = textDecode.decodeToString(result);
        expect(res).assertEqual('abc哈哈熠熠')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0010
     * @tc.name: decodeTostring0010
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0010', 0, function () {
        let that = new util.TextEncoder('shift_jis');
        let result = that.encodeInto('こんにちは');
        let textDecode = util.TextDecoder.create('shift_jis');
        let res = textDecode.decodeToString(result);
        expect(res).assertEqual('こんにちは')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0011
     * @tc.name: decodeTostring0011
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0011', 0, function () {
        let that = new util.TextEncoder('iso-2022-jp');
        let result = that.encodeInto('こんにちは');
        let textDecode = util.TextDecoder.create('iso-2022-jp', {ignoreBOM : true});
        let res = textDecode.decodeToString(result);
        expect(res).assertEqual('こんにちは')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0012
     * @tc.name: decodeTostring0012
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0012', 0, function () {
        let that = new util.TextEncoder('ibm866');
        let result = that.encodeInto('Здравствуйте');
        let textDecode = util.TextDecoder.create('ibm866');
        let res = textDecode.decodeToString(result);
        expect(res).assertEqual('Здравствуйте');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0013
     * @tc.name: decodeTostring0013
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0013', 0, function () {
        let that = new util.TextEncoder('GBK');
        let result = that.encodeInto('abc哈熠');
        let textDecode = util.TextDecoder.create('GBK', {ignoreBOM : true});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('abc哈熠');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0014
     * @tc.name: decodeTostring0014
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0014', 0, function () {
        let that = new util.TextEncoder('GB2312');
        let result = that.encodeInto('abc哈熠');
        let textDecode = util.TextDecoder.create('GBK');
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('abc哈熠');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0015
     * @tc.name: decodeTostring0015
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0015', 0, function () {
        let that = new util.TextEncoder('iso-8859-2');
        let result = that.encodeInto('Szia');
        let textDecode = util.TextDecoder.create('iso-8859-2');
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Szia');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0016
     * @tc.name: decodeTostring0016
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0016', 0, function () {
        let that = new util.TextEncoder('iso-8859-4');
        let result = that.encodeInto('Tavaliselt tere päeval');
        let textDecode = util.TextDecoder.create('iso-8859-4', {ignoreBOM : true});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Tavaliselt tere päeval');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0017
     * @tc.name: decodeTostring0017
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0017', 0, function () {
        let that = new util.TextEncoder('iso-8859-5');
        let result = that.encodeInto('Здравствуйте');
        let textDecode = util.TextDecoder.create('iso-8859-5', {ignoreBOM : false});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Здравствуйте');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0018
     * @tc.name: decodeTostring0018
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0018', 0, function () {
        let that = new util.TextEncoder('iso-8859-6');
        let result = that.encodeInto('مرحبا');
        let textDecode = util.TextDecoder.create('iso-8859-6');
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('مرحبا');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0019
     * @tc.name: decodeTostring0019
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0019', 0, function () {
        let that = new util.TextEncoder('iso-8859-7');
        let result = that.encodeInto('Γεια σου');
        let textDecode = util.TextDecoder.create('iso-8859-7');
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Γεια σου');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0020
     * @tc.name: decodeTostring0020
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0020', 0, function () {
        let that = new util.TextEncoder('iso-8859-8');
        let result = that.encodeInto('שלום');
        let textDecode = util.TextDecoder.create('iso-8859-8', {ignoreBOM : true});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('שלום');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0021
     * @tc.name: decodeTostring0021
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0021', 0, function () {
        let that = new util.TextEncoder('iso-8859-8');
        let result = that.encodeInto('שלום');
        let textDecode = util.TextDecoder.create('iso-8859-8', {ignoreBOM : true});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('שלום')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0022
     * @tc.name: decodeTostring0022
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0022', 0, function () {
        let that = new util.TextEncoder('iso-8859-8-i');
        let result = that.encodeInto('שלום');
        let textDecode = util.TextDecoder.create('iso-8859-8-i', {ignoreBOM : true});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('שלום');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0023
     * @tc.name: decodeTostring0023
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0023', 0, function () {
        let that = new util.TextEncoder('iso-8859-10');
        let result = that.encodeInto('Hei');
        let textDecode = util.TextDecoder.create('iso-8859-10', {ignoreBOM : true});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Hei');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0024
     * @tc.name: decodeTostring0024
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
     it('decodeTostring0024', 0, function () {
        let that = new util.TextEncoder('iso-8859-13');
        let result = that.encodeInto('Sveiki');
        let textDecode = util.TextDecoder.create('iso-8859-13');
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Sveiki');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0025
     * @tc.name: decodeTostring0025
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0025', 0, function () {
        let that = new util.TextEncoder('iso-8859-14');
        let result = that.encodeInto('Diolch');
        let textDecode = util.TextDecoder.create('iso-8859-14', {ignoreBOM : true});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Diolch');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0026
     * @tc.name: decodeTostring0026
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0026', 0, function () {
        let that = new util.TextEncoder('iso-8859-15');
        let result = that.encodeInto('Hola');
        let textDecode = util.TextDecoder.create('iso-8859-15');
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Hola');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0027
     * @tc.name: decodeTostring0027
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0027', 0, function () {
        let that = new util.TextEncoder('koi8-r');
        let result = that.encodeInto('Привет, мир!');
        let textDecode = util.TextDecoder.create('koi8-r', {ignoreBOM : true});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Привет, мир!');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_DEOCDETOSTRING0028
     * @tc.name: decodeTostring0028
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0028', 0, function () {
        let that = new util.TextEncoder('koi8-u');
        let result = that.encodeInto('Привіт, світ');
        let textDecode = util.TextDecoder.create('koi8-u', {ignoreBOM : true});
        let data= textDecode.decodeToString(result);
        expect(data).assertEqual('Привіт, світ');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_001
     * @tc.name: testEncodeInto001
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testencodeInto001', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('abc')
        expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_002
     * @tc.name: testEncodeInto002
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto002', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('\uD800楼楼')
        expect(result[5]).assertEqual(188)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_003
     * @tc.name: testEncodeInto003
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto003', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('a\uD800楼楼')
        expect(result[0]).assertEqual(0x61)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_004
     * @tc.name: testEncodeInto004
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto004', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('abc\uD800楼楼')
        expect(result[1]).assertEqual(0x62)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_005
     * @tc.name: testEncodeInto005
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_006
     * @tc.name: testEncodeInto006
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto006', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('123¥\uD800楼')
        expect(result[10]).assertEqual(0xbc)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_007
     * @tc.name: testEncodeInto007
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto007', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('¥¥')
        expect(result[0]).assertEqual(0xc2)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_008
     * @tc.name: testEncodeInto008
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto008', 0, function () {
        var that = new util.TextEncoder()
        var buffer = new ArrayBuffer(20)
        var result = new Uint8Array(buffer)
        result = that.encodeInto('$$')
        expect(result[0]).assertEqual(0x24)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_009
     * @tc.name: testEncodeInto009
     * @tc.desc: Returns the result of encoder for gb18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_010
     * @tc.name: testEncodeInto010
     * @tc.desc: Returns the result of encoder for GB18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_THROW_ERROR_001
     * @tc.name: testEncodeIntoThrowError001
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeIntoThrowError001', 0, function () {
        try {
            var that = new util.TextEncoder()
            var buffer = new ArrayBuffer(20)
            var result = new Uint8Array(buffer)
            result = that.encodeInto(123)
            expect(result[0]).assertEqual(0x61)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of Parameter must be " +
                                             "string.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_THROW_ERROR_002
     * @tc.name: testEncodeIntoThrowError002
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeIntoThrowError002', 0, function () {
        try {
            var that = new util.TextEncoder()
            var buffer = new ArrayBuffer(20)
            var result = new Uint8Array(buffer)
            result = that.encodeInto({ ignoreBOM : true })
            expect(result[0]).assertEqual(0x61)
        } catch (e) {
            expect(e.toString()).assertEqual("BusinessError: Parameter error. The type of Parameter must be " +
                                             "string.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_001
     * @tc.name: testencodeIntoUint8Array001
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_002
     * @tc.name: testencodeIntoUint8Array002
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_003
     * @tc.name: testencodeIntoUint8Array003
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_004
     * @tc.name: testencodeIntoUint8Array004
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_005
     * @tc.name: testencodeIntoUint8Array005
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_006
     * @tc.name: testencodeIntoUint8Array006
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_007
     * @tc.name: testencodeIntoUint8Array007
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_008
     * @tc.name: testencodeIntoUint8Array008
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_THROW_ERROR_001
     * @tc.name: testencodeIntoUint8ArrayThrowError001
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
            expect(e.toString()).assertEqual("BusinessError: The type of Parameter must be string.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_THROW_ERROR_002
     * @tc.name: testencodeIntoUint8ArrayThrowError002
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
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
            expect(e.toString()).assertEqual("BusinessError: The type of Parameter must be Uint8Array.")
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_001
     * @tc.name: testEncoding_001
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_001', 0, function () {
        var that = new util.TextEncoder('big5')
        var str = that.encoding
        expect(str).assertEqual('big5')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_002
     * @tc.name: testEncoding_002
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_002', 0, function () {
        var that = new util.TextEncoder('iso-8859-2')
        var str = that.encoding
        expect(str).assertEqual('iso-8859-2')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_003
     * @tc.name: testEncoding_003
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_003', 0, function () {
        var that = new util.TextEncoder('euc-kr')
        var str = that.encoding
        expect(str).assertEqual('euc-kr')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_004
     * @tc.name: testEncoding_004
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_004', 0, function () {
        var that = new util.TextEncoder('ibm866')
        var str = that.encoding
        expect(str).assertEqual('ibm866')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_005
     * @tc.name: testEncoding_005
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_005', 0, function () {
        var that = new util.TextEncoder('x-mac-cyrillic')
        var str = that.encoding
        expect(str).assertEqual('x-mac-cyrillic')
    })
	
    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_CREATE_001
     * @tc.name: testEncoding_create_001
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_create_001', 0, function () {
        var that = util.TextEncoder.create()
        var str = that.encoding
        expect(str).assertEqual('utf-8')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_CREATE_002
     * @tc.name: testEncoding_create_002
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_create_002', 0, function () {
        var that = util.TextEncoder.create('iso-8859-2')
        var str = that.encoding
        expect(str).assertEqual('iso-8859-2')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_CREATE_003
     * @tc.name: testEncoding_create_003
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_create_003', 0, function () {
        var that = util.TextEncoder.create('euc-kr')
        var str = that.encoding
        expect(str).assertEqual('euc-kr')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_CREATE_004
     * @tc.name: testEncoding_create_004
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_create_004', 0, function () {
        var that = util.TextEncoder.create('ibm866')
        var str = that.encoding
        expect(str).assertEqual('ibm866')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODING_CREATE_005
     * @tc.name: testEncoding_create_005
     * @tc.desc: Returns the result of encoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncoding_create_005', 0, function () {
        var that = util.TextEncoder.create('x-mac-cyrillic')
        var str = that.encoding
        expect(str).assertEqual('x-mac-cyrillic')
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_011
     * @tc.name: testEncodeInto011
     * @tc.desc: Returns the result of encoder for GB18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto011', 0, function () {
        let that = new util.TextEncoder('big5')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encodeInto('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(171)
        expect(result[4]).assertEqual(162)
        expect(result[7]).assertEqual(230)
        expect(result[8]).assertEqual(102)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_012
     * @tc.name: testEncodeInto012
     * @tc.desc: Returns the result of encoder for GB18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto012', 0, function () {
        let that = new util.TextEncoder('shift_jis')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encodeInto('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(153)
        expect(result[4]).assertEqual(251)
        expect(result[7]).assertEqual(252)
        expect(result[8]).assertEqual(252)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_013
     * @tc.name: testEncodeInto013
     * @tc.desc: Returns the result of encoder for GB18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto013', 0, function () {
        let that = new util.TextEncoder('iso-2022-jp')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encodeInto('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(27)
        expect(result[4]).assertEqual(36)
        expect(result[7]).assertEqual(125)
        expect(result[8]).assertEqual(82)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_014
     * @tc.name: testEncodeInto014
     * @tc.desc: Returns the result of encoder for GB18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto014', 0, function () {
        let that = new util.TextEncoder('ibm866')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encodeInto('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(127)
        expect(result[4]).assertEqual(127)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_015
     * @tc.name: testEncodeInto015
     * @tc.desc: Returns the result of encoder for GB18030.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto015', 0, function () {
        let that = new util.TextEncoder('macintosh')
        let buffer = new ArrayBuffer(20)
        let result = new Uint8Array(buffer)
        result = that.encodeInto('abc哈哈熠熠')
        expect(result[0]).assertEqual(97)
        expect(result[3]).assertEqual(63)
        expect(result[4]).assertEqual(63)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_016
     * @tc.name: testEncodeInto016
     * @tc.desc: Returns the result of encoder for GBK.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto016', 0, function () {
        let that = new util.TextEncoder('GBK');
        let result = that.encodeInto('abc哈熠');
        let res = new Uint8Array([97,98,99,185,254,236,218]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_017
     * @tc.name: testEncodeInto017
     * @tc.desc: Returns the result of encoder for GB2312.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto017', 0, function () {
        let that = new util.TextEncoder('GB2312');
        let result = that.encodeInto('abc哈熠');
        let res = new Uint8Array([97,98,99,185,254,236,218]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_018
     * @tc.name: testEncodeInto018
     * @tc.desc: Returns the result of encoder for iso-8859-2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto018', 0, function () {
        let that = new util.TextEncoder('iso-8859-2');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_019
     * @tc.name: testEncodeInto019
     * @tc.desc: Returns the result of encoder for iso-8859-3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto019', 0, function () {
        let that = new util.TextEncoder('iso-8859-3');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_020
     * @tc.name: testEncodeInto020
     * @tc.desc: Returns the result of encoder for iso-8859-4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto020', 0, function () {
        let that = new util.TextEncoder('iso-8859-4');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_021
     * @tc.name: testEncodeInto021
     * @tc.desc: Returns the result of encoder for iso-8859-5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto021', 0, function () {
        let that = new util.TextEncoder('iso-8859-5');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_022
     * @tc.name: testEncodeInto022
     * @tc.desc: Returns the result of encoder for iso-8859-6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto022', 0, function () {
        let that = new util.TextEncoder('iso-8859-6');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_023
     * @tc.name: testEncodeInto023
     * @tc.desc: Returns the result of encoder for iso-8859-7.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto023', 0, function () {
        let that = new util.TextEncoder('iso-8859-7');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_024
     * @tc.name: testEncodeInto024
     * @tc.desc: Returns the result of encoder for iso-8859-8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto024', 0, function () {
        let that = new util.TextEncoder('iso-8859-8');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_025
     * @tc.name: testEncodeInto025
     * @tc.desc: Returns the result of encoder for iso-8859-8-i.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto025', 0, function () {
        let that = new util.TextEncoder('iso-8859-8-i');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_026
     * @tc.name: testEncodeInto026
     * @tc.desc: Returns the result of encoder for iso-8859-10.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto026', 0, function () {
        let that = new util.TextEncoder('iso-8859-10');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_027
     * @tc.name: testEncodeInto027
     * @tc.desc: Returns the result of encoder for iso-8859-13.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto027', 0, function () {
        let that = new util.TextEncoder('iso-8859-13');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_028
     * @tc.name: testEncodeInto028
     * @tc.desc: Returns the result of encoder for iso-8859-14.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto028', 0, function () {
        let that = new util.TextEncoder('iso-8859-14');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([26,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_029
     * @tc.name: testEncodeInto029
     * @tc.desc: Returns the result of encoder for iso-8859-15.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto029', 0, function () {
        let that = new util.TextEncoder('iso-8859-15');
        let result = that.encodeInto('¡Hola, Mundo!');
        let res = new Uint8Array([161,72,111,108,97,44,32,77,117,110,100,111,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_030
     * @tc.name: testEncodeInto030
     * @tc.desc: Returns the result of encoder for koi8-r.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto030', 0, function () {
        let that = new util.TextEncoder('koi8-r');
        let result = that.encodeInto('Привет, мир!');
        let res = new Uint8Array([240,210,201,215,197,212,44,32,205,201,210,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_031
     * @tc.name: testEncodeInto031
     * @tc.desc: Returns the result of encoder for koi8-u.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto031', 0, function () {
        let that = new util.TextEncoder('koi8-u');
        let result = that.encodeInto('Привіт, світ');
        let res = new Uint8Array([240,210,201,215,166,212,44,32,211,215,166,212]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_032
     * @tc.name: testEncodeInto032
     * @tc.desc: Returns the result of encoder for windows-874.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto032', 0, function () {
        let that = new util.TextEncoder('windows-874');
        let result = that.encodeInto('สวัสดี，โลก');
        let res = new Uint8Array([202,199,209,202,180,213,63,226,197,161]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_033
     * @tc.name: testEncodeInto033
     * @tc.desc: Returns the result of encoder for windows-1250.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto033', 0, function () {
        let that = new util.TextEncoder('windows-1250');
        let result = that.encodeInto('Ahoj, svět');
        let res = new Uint8Array([65,104,111,106,44,32,115,118,236,116]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_034
     * @tc.name: testEncodeInto034
     * @tc.desc: Returns the result of encoder for windows-1251.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto034', 0, function () {
        let that = new util.TextEncoder('windows-1251');
        let result = that.encodeInto('Привет, мир');
        let res = new Uint8Array([207,240,232,226,229,242,44,32,236,232,240]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_035
     * @tc.name: testEncodeInto035
     * @tc.desc: Returns the result of encoder for windows-1252.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto035', 0, function () {
        let that = new util.TextEncoder('windows-1252');
        let result = that.encodeInto('Hi, World');
        let res = new Uint8Array([72,105,44,32,87,111,114,108,100]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_036
     * @tc.name: testEncodeInto036
     * @tc.desc: Returns the result of encoder for windows-1253.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto036', 0, function () {
        let that = new util.TextEncoder('windows-1253');
        let result = that.encodeInto('Γεια σας, κόσμο');
        let res = new Uint8Array([195,229,233,225,32,243,225,242,44,32,234,252,243,236,239]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_037
     * @tc.name: testEncodeInto037
     * @tc.desc: Returns the result of encoder for windows-1254.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto037', 0, function () {
        let that = new util.TextEncoder('windows-1254');
        let result = that.encodeInto('Merhaba, dünya');
        let res = new Uint8Array([77,101,114,104,97,98,97,44,32,100,252,110,121,97]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_038
     * @tc.name: testEncodeInto038
     * @tc.desc: Returns the result of encoder for windows-1255.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto038', 0, function () {
        let that = new util.TextEncoder('windows-1255');
        let result = that.encodeInto('שלום, עולם');
        let res = new Uint8Array([249,236,229,237,44,32,242,229,236,237]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_039
     * @tc.name: testEncodeInto039
     * @tc.desc: Returns the result of encoder for windows-1256.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto039', 0, function () {
        let that = new util.TextEncoder('windows-1256');
        let result = that.encodeInto('مرحبا, العالم');
        let res = new Uint8Array([227,209,205,200,199,44,32,199,225,218,199,225,227]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_040
     * @tc.name: testEncodeInto040
     * @tc.desc: Returns the result of encoder for windows-1257.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto040', 0, function () {
        let that = new util.TextEncoder('windows-1257');
        let result = that.encodeInto('Tere, maailma');
        let res = new Uint8Array([84,101,114,101,44,32,109,97,97,105,108,109,97]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_041
     * @tc.name: testEncodeInto041
     * @tc.desc: Returns the result of encoder for windows-1258.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto041', 0, function () {
        let that = new util.TextEncoder('windows-1258');
        let result = that.encodeInto('Chào, thế giới');
        let res = new Uint8Array([67,104,224,111,44,32,116,104,26,32,103,105,26,105]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_042
     * @tc.name: testEncodeInto042
     * @tc.desc: Returns the result of encoder for euc-jp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto042', 0, function () {
        let that = new util.TextEncoder('euc-jp');
        let result = that.encodeInto('こんにちは、世界!');
        let res = new Uint8Array([164,179,164,243,164,203,164,193,164,207,161,162,192,164,179,166,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_043
     * @tc.name: testEncodeInto043
     * @tc.desc: Returns the result of encoder for euc-kr.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto043', 0, function () {
        let that = new util.TextEncoder('euc-kr');
        let result = that.encodeInto('안녕, 세상!');
        let res = new Uint8Array([190,200,179,231,44,32,188,188,187,243,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_044
     * @tc.name: testEncodeInto044
     * @tc.desc: Returns the result of encoder for x-mac-cyrillic.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto044', 0, function () {
        let that = new util.TextEncoder('x-mac-cyrillic');
        let result = that.encodeInto('Привет, мир!');
        let res = new Uint8Array([143,240,232,226,229,242,44,32,236,232,240,33]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_045
     * @tc.name: testEncodeInto045
     * @tc.desc: Returns the result of encoder for utf-16be.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto045', 0, function () {
        let that = new util.TextEncoder('utf-16be');
        let result = that.encodeInto('abc哈熠');
        let res = new Uint8Array([0,97,0,98,0,99,84,200,113,160]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_046
     * @tc.name: testEncodeInto046
     * @tc.desc: Returns the result of encoder for utf-16le.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testEncodeInto046', 0, function () {
        let that = new util.TextEncoder('utf-16le');
        let result = that.encodeInto('abc哈熠');
        let res = new Uint8Array([97,0,98,0,99,0,200,84,160,113]);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(res[i]);
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_009
     * @tc.name: testencodeIntoUint8Array009
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testencodeIntoUint8Array009', 0, function () {
        var that = new util.TextEncoder('big5')
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 10)
        var result = new Uint32Array(20)
        result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(8)
        expect(result.written).assertEqual(8)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_010
     * @tc.name: testencodeIntoUint8Array010
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testencodeIntoUint8Array010', 0, function () {
        var that = new util.TextEncoder('shift_jis')
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 5)
        var result = new Uint32Array(20)
        result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(3)
        expect(result.written).assertEqual(5)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_011
     * @tc.name: testencodeIntoUint8Array011
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testencodeIntoUint8Array011', 0, function () {
        var that = new util.TextEncoder('iso-2022-jp')
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 7)
        var result = new Uint32Array(20)
        result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_012
     * @tc.name: testencodeIntoUint8Array012
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testencodeIntoUint8Array012', 0, function () {
        var that = new util.TextEncoder('ibm866')
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 4)
        var result = new Uint32Array(20)
        result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(4)
        expect(result.written).assertEqual(4)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ENCODE_INTO_UINT8ARRAY_013
     * @tc.name: testencodeIntoUint8Array013
     * @tc.desc: encode string, write the result to dest array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testencodeIntoUint8Array013', 0, function () {
        var that = new util.TextEncoder('macintosh')
        var buffer = new ArrayBuffer(20)
        var dest = new Uint8Array(buffer, 0, 10)
        var result = new Uint32Array(20)
        result = that.encodeIntoUint8Array('\uD800A\uDF06A楼HiA', dest)
        expect(result.read).assertEqual(8)
        expect(result.written).assertEqual(8)
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_00100 
     * @tc.name: testWrite001
     * @tc.desc: Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * comitted from the returned string and stored in an internal buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */

     it("testWrite001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('utf-8');
      let input =  new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const decoded = decoder.write(input);
      expect(decoded).assertEqual('你好');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_00200
     * @tc.name: testWrite002
     * @tc.desc: Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * comitted from the returned string and stored in an internal buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testWrite002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('utf-8');
      const decoded = decoder.write("abc");
      expect(decoded).assertEqual('abc');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_00300
     * @tc.name: testWrite003
     * @tc.desc:  Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * comitted from the returned string and stored in an internal buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testWrite003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('big5');
      let input = new Uint8Array([167,65,166,110]);
      const decoded = decoder.write(input);
      expect(decoded).assertEqual('你好');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_00400
     * @tc.name: testWrite004
     * @tc.desc:  Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * comitted from the returned string and stored in an internal buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testWrite004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('iso-8859-2');
      let input = new Uint8Array([0X61,0X62,0X63]);
      const decoded = decoder.write(input);
      expect(decoded).assertEqual('abc');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_00500
     * @tc.name: testWrite005
     * @tc.desc:  Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * comitted from the returned string and stored in an internal buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testWrite005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('koi8-r');
      let input = new Uint8Array([97,98,99]);
      const decoded = decoder.write(input);
      expect(decoded).assertEqual('abc');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_00600
     * @tc.name: testWrite006
     * @tc.desc: Returns a decoded string, ensuring that any incomplete multibyte characters at the end of the Uint8Array are
     * comitted from the returned string and stored in an internal buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testWrite006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('windows-1250');
      let input = new Uint8Array([0X61,0X62,0X63]);
      const decoded = decoder.write(input);
      expect(decoded).assertEqual('abc');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_00700
     * @tc.name: testEnd001
     * @tc.desc: Returns any remaining input stored in the internal buffer as a string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testEnd001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('macintosh');
      let input =  new Uint8Array([0X61]);
      const decoded = decoder.end(input);
      expect(decoded).assertEqual('a');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_00800
     * @tc.name: testEnd002
     * @tc.desc: Returns any remaining input stored in the internal buffer as a string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testEnd002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('utf-8');
      const decoded = decoder.end("abc");
      expect(decoded).assertEqual('abc');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_00900
     * @tc.name: testEnd003
     * @tc.desc: Returns any remaining input stored in the internal buffer as a string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testEnd003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('utf-8');
      let input =  new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const decoded = decoder.end(input);
      expect(decoded).assertEqual('你好');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01000
     * @tc.name: testEnd004
     * @tc.desc: Returns any remaining input stored in the internal buffer as a string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it("testEnd004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let decoder = new util.StringDecoder('utf-8');
      let input =  new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const decoded = decoder.write(input.slice(0, 5));
      const decodeend = decoder.end(input.slice(5));
      expect(decoded).assertEqual('你');
      expect(decodeend).assertEqual('好');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01100
     * @tc.name: testWrite007
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let stringDecoder = new util.StringDecoder('utf-8');
        let uint8 = new Uint8Array([228,189,160,0,229,165,189]);
        let resStr = stringDecoder.write(uint8);
        expect(resStr).assertEqual('你\u0000好');
        expect(resStr.length).assertEqual(3);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01200
     * @tc.name: testWrite008
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let stringDecoder = new util.StringDecoder('utf-8');
        let uint8 = new Uint8Array([0,228,189,160,229]);
        let retStr = stringDecoder.write(uint8);
        expect(retStr).assertEqual('\u0000你');
        let uint8arr = new Uint8Array([165,189]);
        let resStr = stringDecoder.end(uint8arr);
        expect(resStr).assertEqual('好');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01300
     * @tc.name: testWrite009
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('gb18030');
        let result = textEncoder.encodeInto('abc熠熠');
        let stringDecoder = new util.StringDecoder('gb18030');
        let res = stringDecoder.write(result);
        expect(res).assertEqual('abc熠熠');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01400
     * @tc.name: testWrite010
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('big5');
        let result = textEncoder.encodeInto('abc熠熠');
        let stringDecoder = new util.StringDecoder('big5');
        let res = stringDecoder.write(result);
        expect(res).assertEqual('abc熠熠');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01500
     * @tc.name: testWrite011
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('shift_jis');
        let result = textEncoder.encodeInto('こんにちは');
        let stringDecoder = new util.StringDecoder('shift_jis');
        let res = stringDecoder.write(result);
        expect(res).assertEqual('こんにちは');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01600
     * @tc.name: testWrite012
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-2022-jp');
        let result = textEncoder.encodeInto('こんにちは');
        let stringDecoder = new util.StringDecoder('iso-2022-jp');
        let res = stringDecoder.write(result);
        expect(res).assertEqual('こんにちは');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01700
     * @tc.name: testWrite013
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('ibm866');
        let result = textEncoder.encodeInto('Здравствуйте');
        let stringDecoder = new util.StringDecoder('ibm866');
        let res = stringDecoder.write(result);
        expect(res).assertEqual('Здравствуйте');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01800
     * @tc.name: testWrite014
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('GBK');
        let result = textEncoder.encodeInto('abc熠熠');
        let stringDecoder = new util.StringDecoder('GBK');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('abc熠熠');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_01900
     * @tc.name: testWrite015
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('GB2312');
        let result = textEncoder.encodeInto('abc熠熠');
        let stringDecoder = new util.StringDecoder('GBK');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('abc熠熠');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02000
     * @tc.name: testWrite016
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-2');
        let result = textEncoder.encodeInto('Szia');
        let stringDecoder = new util.StringDecoder('iso-8859-2');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('Szia');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02100
     * @tc.name: testWrite017
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-4');
        let result = textEncoder.encodeInto('Tavaliselt tere päeval');
        let stringDecoder = new util.StringDecoder('iso-8859-4');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('Tavaliselt tere päeval');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02200
     * @tc.name: testWrite018
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-5');
        let result = textEncoder.encodeInto('Здравствуйте');
        let stringDecoder = new util.StringDecoder('iso-8859-5');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('Здравствуйте');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02300
     * @tc.name: testWrite019
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-6');
        let result = textEncoder.encodeInto('مرحبا');
        let stringDecoder = new util.StringDecoder('iso-8859-6');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('مرحبا');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02400
     * @tc.name: testWrite020
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-7');
        let result = textEncoder.encodeInto('Γεια σου');
        let stringDecoder = new util.StringDecoder('iso-8859-7');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('Γεια σου');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02500
     * @tc.name: testWrite021
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-8');
        let result = textEncoder.encodeInto('שלום');
        let stringDecoder = new util.StringDecoder('iso-8859-8');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('שלום');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02600
     * @tc.name: testWrite022
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('macintosh');
        let result = textEncoder.encodeInto('é£');
        let stringDecoder = new util.StringDecoder('macintosh');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('é£');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02700
     * @tc.name: testWrite023
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-8-i');
        let result = textEncoder.encodeInto('שלום');
        let stringDecoder = new util.StringDecoder('iso-8859-8-i');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('שלום');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02800
     * @tc.name: stringDecoder0024
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-10');
        let result = textEncoder.encodeInto('Hei');
        let stringDecoder = new util.StringDecoder('iso-8859-10');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('Hei');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_02900
     * @tc.name: testWrite025
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-13');
        let result = textEncoder.encodeInto('Sveiki');
        let stringDecoder = new util.StringDecoder('iso-8859-13');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('Sveiki');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03000
     * @tc.name: testWrite026
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-14');
        let result = textEncoder.encodeInto('Diolch');
        let stringDecoder = new util.StringDecoder('iso-8859-14');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('Diolch');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03100
     * @tc.name: testWrite027
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('iso-8859-15');
        let result = textEncoder.encodeInto('Hola');
        let stringDecoder = new util.StringDecoder('iso-8859-15');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('Hola');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03200
     * @tc.name: testWrite028
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('koi8-r');
        let result = textEncoder.encodeInto('Привет, мир!');
        let stringDecoder = new util.StringDecoder('koi8-r');
        let data= stringDecoder.write(result);
        expect(data).assertEqual('Привет, мир!');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03300
     * @tc.name: testWrite029
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('koi8-u');
        let result = textEncoder.encodeInto('Привіт, світ');
        let stringDecoder = new util.StringDecoder('koi8-u');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('Привіт, світ');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03400
     * @tc.name: testWrite030
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder();
        let buffer = new ArrayBuffer(4);
        let dest = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('😃', dest);
        let stringDecoder = new util.StringDecoder();
        let result = stringDecoder.write(dest);
        expect(result).assertEqual('😃');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03500
     * @tc.name: testWrite031
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Functio
     * @tc.level: Level 1
     */
    it('testWrite031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder();
        let buffer = new ArrayBuffer(10);
        let dest = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('aé中😃', dest);
        let stringDecoder = new util.StringDecoder();
        let result = stringDecoder.write(dest);
        expect(result).assertEqual('aé中😃');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03600
     * @tc.name: testWrite032
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder();
        let buffer = new ArrayBuffer(4);
        let dest = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('😃🤞', dest);
        let stringDecoder = new util.StringDecoder();
        let result = stringDecoder.write(dest);
        expect(result).assertEqual('😃');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03700
     * @tc.name: testWrite033
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder();
        let buffer = new ArrayBuffer(8);
        let dest = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('😃🤞', dest);
        let stringDecoder = new util.StringDecoder();
        let result = stringDecoder.write(dest);
        expect(result).assertEqual('😃🤞');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03800
     * @tc.name: testWrite034
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder();
        let buffer = new ArrayBuffer(10);
        let dest = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('a😃🤞b', dest);
        let stringDecoder = new util.StringDecoder();
        let result = stringDecoder.write(dest);
        expect(result).assertEqual('a😃🤞b');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_03900
     * @tc.name: testWrite035
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('windows-874');
        let result = textEncoder.encodeInto('สวัสดี');
        let stringDecoder = new util.StringDecoder('windows-874');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('สวัสดี');
    })


    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04000
     * @tc.name: testWrite036
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('windows-1251');
        let result = textEncoder.encodeInto('Привет, мир');
        let stringDecoder = new util.StringDecoder('windows-1251');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('Привет, мир');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04100
     * @tc.name: testWrite037
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('windows-1252');
        let result = textEncoder.encodeInto('Hi, World');
        let stringDecoder = new util.StringDecoder('windows-1252');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('Hi, World');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04200
     * @tc.name: testWrite038
     * @tc.desc: Returns a decoded string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testWrite038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('windows-1253');
        let result = textEncoder.encodeInto('Γεια σας, κόσμο');
        let stringDecoder = new util.StringDecoder('windows-1253');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('Γεια σας, κόσμο');
    })

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04300
    * @tc.name: testWrite039
    * @tc.desc: Returns a decoded string.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testWrite039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
       let textEncoder = new util.TextEncoder('windows-1254');
       let result = textEncoder.encodeInto('Merhaba, dünya');
       let stringDecoder = new util.StringDecoder('windows-1254');
       let data = stringDecoder.write(result);
       expect(data).assertEqual('Merhaba, dünya');
    })

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04400
    * @tc.name: testWrite040
    * @tc.desc: Returns a decoded string.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testWrite040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('windows-1255');
        let result = textEncoder.encodeInto('שלום, עולם');
        let stringDecoder = new util.StringDecoder('windows-1255');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('שלום, עולם');
    })

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04500
    * @tc.name: testWrite041
    * @tc.desc: Returns a decoded string.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testWrite041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('windows-1256');
        let result = textEncoder.encodeInto('مرحبا, العالم');
        let stringDecoder = new util.StringDecoder('windows-1256');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('مرحبا, العالم');
    })

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04600
    * @tc.name: testWrite042
    * @tc.desc: Returns a decoded string.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testWrite042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('windows-1257');
        let result = textEncoder.encodeInto('Tere, maailma');
        let stringDecoder = new util.StringDecoder('windows-1257');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('Tere, maailma');
    })

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04700
    * @tc.name: testWrite043
    * @tc.desc: Returns a decoded string.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testWrite043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('windows-1258');
        let result = textEncoder.encodeInto('Chào');
        let stringDecoder = new util.StringDecoder('windows-1258');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('Chào');
    })

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04800
    * @tc.name: testWrite044
    * @tc.desc: Returns a decoded string.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testWrite044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('euc-jp');
        let result = textEncoder.encodeInto('こんにちは');
        let stringDecoder = new util.StringDecoder('euc-jp');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('こんにちは');
    })

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_04900
    * @tc.name: testWrite045
    * @tc.desc: Returns a decoded string.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testWrite045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('euc-kr');
        let result = textEncoder.encodeInto('안녕, 세상');
        let stringDecoder = new util.StringDecoder('euc-kr');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('안녕, 세상');
    })

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_05000
    * @tc.name: testWrite046
    * @tc.desc: Returns a decoded string.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testWrite046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('euc-kr');
        let result = textEncoder.encodeInto('안녕, 세상');
        let stringDecoder = new util.StringDecoder('euc-kr');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('안녕, 세상');
    })

   /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_05100
    * @tc.name: testWrite047
    * @tc.desc: Returns a decoded string.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testWrite047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textEncoder = new util.TextEncoder('x-mac-cyrillic');
        let result = textEncoder.encodeInto('Привет, мир!');
        let stringDecoder = new util.StringDecoder('x-mac-cyrillic');
        let data = stringDecoder.write(result);
        expect(data).assertEqual('Привет, мир!');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_05200
     * @tc.name: decodeTostring0029
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let textDecoder = util.TextDecoder.create('UTF-8', {fatal: true});
            let uint8arr = new Uint8Array([0xC0]);
            textDecoder.decodeToString(uint8arr);
            expect().assertFail();
        } catch (e) {
            expect(e.message).assertEqual('Parameter error. Please check if the decode data matches the encoding format.');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_05300
     * @tc.name: decodeTostring0030
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textDecoder = util.TextDecoder.create('UTF-8', {fatal: false});
        let uint8 = new Uint8Array([0xC0]);
        let result = textDecoder.decodeToString(uint8);
        expect(result.length).assertEqual(1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_05400
     * @tc.name: decodeTostring0031
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let textDecoder = util.TextDecoder.create('utf-16le', {fatal: true});
            let uint8 = new Uint8Array([0x00]);
            textDecoder.decodeToString(uint8);
            expect().assertFail();
        } catch (e) {
            expect(e.message).assertEqual('Parameter error. Please check if the decode data matches the encoding format.');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_05500
     * @tc.name: decodeTostring0032
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textDecoder = util.TextDecoder.create('utf-16le', {fatal: false});
        let uint8arr = new Uint8Array([0x00]);
        let result = textDecoder.decodeToString(uint8arr);
        expect(result.length).assertEqual(1);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_05600
     * @tc.name: decodeTostring0033
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        try {
            let textDecoder = util.TextDecoder.create('utf-16be', {fatal: true});
            let uint8 = new Uint8Array([0x00]);
            textDecoder.decodeToString(uint8);
            expect().assertFail();
        } catch (e) {
            expect(e.message).assertEqual('Parameter error. Please check if the decode data matches the encoding format.');
        }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_UTIL_05700
     * @tc.name: decodeTostring0034
     * @tc.desc: Returns the result of running encoding's decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('decodeTostring0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
        let textDecoder = util.TextDecoder.create('utf-16be', {fatal: false});
        let uint8 = new Uint8Array([0x00]);
        let result = textDecoder.decodeToString(uint8);
        expect(result.length).assertEqual(1);
    })
})
}
