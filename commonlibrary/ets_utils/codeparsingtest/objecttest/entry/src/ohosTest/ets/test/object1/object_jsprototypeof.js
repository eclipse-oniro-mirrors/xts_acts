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

export function ObjectIsPrototypeofTest001() {
    const parentObj = { parentProp: 'parent' };
    const childObj = Object.create(parentObj);
    return [parentObj.isPrototypeOf(childObj), Object.prototype.isPrototypeOf(childObj),
        parentObj.isPrototypeOf(Object.prototype), childObj.isPrototypeOf(childObj)];
}

export function ObjectIsPrototypeofTest002() {
    const testArr = [1, 2, 3];
    const customArrProto = Object.create(Array.prototype);
    const arrWithCustomProto = Object.create(customArrProto);
    const result = [];

    result.push(Array.prototype.isPrototypeOf(testArr));
    result.push(Object.prototype.isPrototypeOf(testArr));
    result.push(customArrProto.isPrototypeOf(arrWithCustomProto));
    result.push(Array.prototype.isPrototypeOf(arrWithCustomProto));

    const ordinaryObj = {};
    result.push(Array.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest003() {
    const result = [];
    const testProto = {};
    const numPrimitive = 123;
    const strPrimitive = 'test';
    const boolPrimitive = true;
    const undef = undefined;
    const nullVal = null;

    result.push(testProto.isPrototypeOf(numPrimitive));
    result.push(testProto.isPrototypeOf(strPrimitive));
    result.push(testProto.isPrototypeOf(boolPrimitive));
    result.push(testProto.isPrototypeOf(undef));
    result.push(testProto.isPrototypeOf(nullVal));
    result.push(Object.prototype.isPrototypeOf(numPrimitive));
    result.push(String.prototype.isPrototypeOf(strPrimitive));
    return result;
}

export function ObjectIsPrototypeofTest004() {
    const result = [];
    const numWrapper = new Number(123);
    const strWrapper = new String('test');
    const boolWrapper = new Boolean(true);
    const customProto = Object.create(Number.prototype);
    const customNumWrapper = Object.create(customProto);

    result.push(Number.prototype.isPrototypeOf(numWrapper));
    result.push(String.prototype.isPrototypeOf(strWrapper));
    result.push(Boolean.prototype.isPrototypeOf(boolWrapper));
    result.push(Object.prototype.isPrototypeOf(numWrapper));
    result.push(customProto.isPrototypeOf(customNumWrapper));
    result.push(Number.prototype.isPrototypeOf(customNumWrapper));
    return result;
}

export function ObjectIsPrototypeofTest005() {
    const result = [];
    const callWithNull = Object.prototype.isPrototypeOf.bind(null);
    const callWithUndefined = Object.prototype.isPrototypeOf.bind(undefined);
    const testObj = {};
    try {
        (() => callWithNull(testObj))();
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    try {
        (() => callWithUndefined(testObj))();
    } catch (e) {
        result.push(e instanceof TypeError);
    }

    try {
        callWithNull(testObj);
    } catch (e) {
        result.push((e.message).includes('Cannot convert a NULL value to a JSObject'));
    }
    return result;
}

export function ObjectIsPrototypeofTest006() {
    const result = [];
    const nullProtoObj = Object.create(null);
    const childOfNullProto = Object.create(nullProtoObj);
    const ordinaryObj = {};

    result.push(Object.prototype.isPrototypeOf.call(Object.prototype, nullProtoObj));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoObj, childOfNullProto));
    result.push(Object.prototype.isPrototypeOf.call(Object.prototype, childOfNullProto));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoObj, ordinaryObj));
    result.push(Object.prototype.isPrototypeOf.call(ordinaryObj, nullProtoObj));
    return result;
}

export function ObjectIsPrototypeofTest007() {
    const result = [];

    function Grandparent() {
    }

    function Parent() {
    }

    function Child() {
    }

    Parent.prototype = Object.create(Grandparent.prototype);
    Child.prototype = Object.create(Parent.prototype);

    const childInstance = new Child();
    const grandparentProto = Grandparent.prototype;
    const parentProto = Parent.prototype;
    const childProto = Child.prototype;

    result.push(childProto.isPrototypeOf(childInstance));
    result.push(parentProto.isPrototypeOf(childInstance));
    result.push(grandparentProto.isPrototypeOf(childInstance));
    result.push(Object.prototype.isPrototypeOf(childInstance));
    result.push(grandparentProto.isPrototypeOf(parentProto));
    result.push(grandparentProto.isPrototypeOf(childProto));
    return result;
}

export function ObjectIsPrototypeofTest008() {
    const result = [];

    function TestFunc() {
    }

    const arrowFunc = () => {
    };
    const funcProto = Function.prototype;
    const customFuncProto = Object.create(funcProto);
    const customFunc = Object.create(customFuncProto);
    customFunc.apply = function () {
    };

    result.push(funcProto.isPrototypeOf(TestFunc));
    result.push(funcProto.isPrototypeOf(arrowFunc));
    result.push(Object.prototype.isPrototypeOf(TestFunc));
    result.push(customFuncProto.isPrototypeOf(customFunc));
    result.push(funcProto.isPrototypeOf(customFunc));

    const ordinaryObj = {};
    result.push(funcProto.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest009() {
    const result = [];
    const testDate = new Date();
    const customDateProto = Object.create(Date.prototype);
    const customDate = Object.create(customDateProto);
    customDate.getFullYear = function () {
        return 2024;
    };

    result.push(Date.prototype.isPrototypeOf(testDate));
    result.push(Object.prototype.isPrototypeOf(testDate));
    result.push(Date.prototype.isPrototypeOf(customDate));
    result.push(customDateProto.isPrototypeOf(customDate));
    result.push(customDateProto.isPrototypeOf(testDate));

    const ordinaryObj = {};
    result.push(Date.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest010() {
    const result = [];
    const testReg = /test/;
    const newReg = new RegExp('test');
    const customRegProto = Object.create(RegExp.prototype);
    const customReg = Object.create(customRegProto);
    customReg.test = function (str) {
        return str.includes('test');
    };

    result.push(RegExp.prototype.isPrototypeOf(testReg));
    result.push(RegExp.prototype.isPrototypeOf(newReg));
    result.push(Object.prototype.isPrototypeOf(testReg));
    result.push(customRegProto.isPrototypeOf(customReg));
    result.push(RegExp.prototype.isPrototypeOf(customReg));

    const ordinaryObj = {};
    result.push(RegExp.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest011() {
    const result = [];

    function* TestGenerator() {
        yield 1;
    }

    const genInstance = TestGenerator();
    const genProto = genInstance.__proto__;
    const customGenProto = Object.create(genProto);
    const customGen = Object.create(customGenProto);
    customGen.next = function () {
        return { value: null, done: true };
    };

    result.push(genProto.isPrototypeOf(genInstance));
    result.push(Object.prototype.isPrototypeOf(genInstance));
    result.push(customGenProto.isPrototypeOf(customGen));
    result.push(genProto.isPrototypeOf(customGen));
    result.push(Array.prototype.isPrototypeOf(genInstance));

    const ordinaryObj = {};
    result.push(genProto.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest012() {
    const result = [];
    const testPromise = Promise.resolve();
    const customPromiseProto = Object.create(Promise.prototype);
    const customPromise = Object.create(customPromiseProto);
    customPromise.then = function (onFulfilled) {
        onFulfilled();
        return this;
    };
    result.push(Promise.prototype.isPrototypeOf(testPromise));
    result.push(Object.prototype.isPrototypeOf(testPromise));
    result.push(customPromiseProto.isPrototypeOf(customPromise));
    result.push(Promise.prototype.isPrototypeOf(customPromise));
    result.push(Array.prototype.isPrototypeOf(testPromise));

    const ordinaryObj = {};
    result.push(Promise.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest013() {
    const result = [];
    const testMap = new Map([[1, 'a']]);
    const customMapProto = Object.create(Map.prototype);
    const customMap = Object.create(customMapProto);
    customMap.set = function (key, val) {
        return this;
    };

    result.push(Map.prototype.isPrototypeOf(testMap));
    result.push(Object.prototype.isPrototypeOf(testMap));
    result.push(customMapProto.isPrototypeOf(customMap));
    result.push(Map.prototype.isPrototypeOf(customMap));
    result.push(Set.prototype.isPrototypeOf(testMap));

    const ordinaryObj = {};
    result.push(Map.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest014() {
    const result = [];
    const testSet = new Set([1, 2]);
    const customSetProto = Object.create(Set.prototype);
    const customSet = Object.create(customSetProto);
    customSet.add = function (val) {
        return this;
    };

    result.push(Set.prototype.isPrototypeOf(testSet));
    result.push(Object.prototype.isPrototypeOf(testSet));
    result.push(customSetProto.isPrototypeOf(customSet));
    result.push(Set.prototype.isPrototypeOf(customSet));
    result.push(Map.prototype.isPrototypeOf(testSet));

    const ordinaryObj = {};
    result.push(Set.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest015() {
    const result = [];
    const testBuffer = new ArrayBuffer(8);
    const customBufferProto = Object.create(ArrayBuffer.prototype);
    const customBuffer = Object.create(customBufferProto);
    Object.defineProperty(customBuffer, 'byteLength', {
        value: 16,
        writable: true, // 可设置为 true 允许后续修改
        enumerable: true,
        configurable: true
    });

    result.push(ArrayBuffer.prototype.isPrototypeOf(testBuffer));
    result.push(Object.prototype.isPrototypeOf(testBuffer));
    result.push(customBufferProto.isPrototypeOf(customBuffer));
    result.push(ArrayBuffer.prototype.isPrototypeOf(customBuffer));
    result.push(Uint8Array.prototype.isPrototypeOf(testBuffer));

    const ordinaryObj = {};
    result.push(ArrayBuffer.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest016() {
    const result = [];
    const testTypedArr = new Uint8Array([1, 2, 3]);
    const customTypedProto = Object.create(Uint8Array.prototype);
    const customTypedArr = Object.create(customTypedProto);
    customTypedArr.length = 5;

    result.push(Uint8Array.prototype.isPrototypeOf(testTypedArr));
    result.push(TypedArray.prototype.isPrototypeOf(testTypedArr));
    result.push(Object.prototype.isPrototypeOf(testTypedArr));
    result.push(customTypedProto.isPrototypeOf(customTypedArr));
    result.push(Uint8Array.prototype.isPrototypeOf(customTypedArr));

    const ordinaryObj = {};
    result.push(Uint8Array.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest017() {
    const result = [];
    const testError = new Error('test');
    const testTypeError = new TypeError('type error');
    const customErrorProto = Object.create(Error.prototype);
    const customError = Object.create(customErrorProto);
    customError.message = 'custom error';

    result.push(Error.prototype.isPrototypeOf(testError));
    result.push(Error.prototype.isPrototypeOf(testTypeError));
    result.push(TypeError.prototype.isPrototypeOf(testTypeError));
    result.push(Object.prototype.isPrototypeOf(testError));
    result.push(customErrorProto.isPrototypeOf(customError));
    result.push(Error.prototype.isPrototypeOf(customError));
    const ordinaryObj = {};
    result.push(Error.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest018() {
    const result = [];
    const bigIntWrapper = BigInt(12345678901234567890n);
    const customBigIntProto = Object.create(BigInt.prototype);
    const customBigInt = Object.create(customBigIntProto);
    const bigIntPrimitive = 98765432109876543210n;

    result.push(BigInt.prototype.isPrototypeOf(bigIntWrapper));
    result.push(Object.prototype.isPrototypeOf(bigIntWrapper));
    result.push(customBigIntProto.isPrototypeOf(customBigInt));
    result.push(BigInt.prototype.isPrototypeOf(customBigInt));
    result.push(BigInt.prototype.isPrototypeOf(bigIntPrimitive));
    const ordinaryObj = {};
    result.push(BigInt.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest019() {
    const result = [];
    const symbolWrapper = Object(Symbol('test'));
    const customSymbolProto = Object.create(Symbol.prototype);
    const customSymbol = Object.create(customSymbolProto);
    const symbolPrimitive = Symbol('primitive');

    result.push(Symbol.prototype.isPrototypeOf(symbolWrapper));
    result.push(Object.prototype.isPrototypeOf(symbolWrapper));
    result.push(customSymbolProto.isPrototypeOf(customSymbol));
    result.push(Symbol.prototype.isPrototypeOf(customSymbol));
    result.push(Symbol.prototype.isPrototypeOf(symbolPrimitive));
    const ordinaryObj = {};
    result.push(Symbol.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest020() {
    const result = [];
    const symbolWrapper = Object(Symbol('test'));
    const customSymbolProto = Object.create(Symbol.prototype);
    const customSymbol = Object.create(customSymbolProto);
    const symbolPrimitive = Symbol('primitive');

    result.push(Symbol.prototype.isPrototypeOf(symbolWrapper));
    result.push(Object.prototype.isPrototypeOf(symbolWrapper));
    result.push(customSymbolProto.isPrototypeOf(customSymbol));
    result.push(Symbol.prototype.isPrototypeOf(customSymbol));
    result.push(Symbol.prototype.isPrototypeOf(symbolPrimitive));
    const ordinaryObj = {};
    result.push(Symbol.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest021() {
    const result = [];
    const testWeakSet = new WeakSet();
    const itemObj = {};
    testWeakSet.add(itemObj);
    const customWeakSetProto = Object.create(WeakSet.prototype);
    const customWeakSet = Object.create(customWeakSetProto);
    customWeakSet.add = function (item) {
        return this;
    };

    result.push(WeakSet.prototype.isPrototypeOf(testWeakSet));
    result.push(Object.prototype.isPrototypeOf(testWeakSet));
    result.push(customWeakSetProto.isPrototypeOf(customWeakSet));
    result.push(WeakSet.prototype.isPrototypeOf(customWeakSet));
    result.push(Set.prototype.isPrototypeOf(testWeakSet));
    const ordinaryObj = {};
    result.push(WeakSet.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest022() {
    const result = [];
    const buffer = new ArrayBuffer(16);
    const testDataView = new DataView(buffer);
    const customDataViewProto = Object.create(DataView.prototype);
    const customDataView = Object.create(customDataViewProto);
    customDataView.getUint8 = function (byteOffset) {
        return 0;
    };

    result.push(DataView.prototype.isPrototypeOf(testDataView));
    result.push(Object.prototype.isPrototypeOf(testDataView));
    result.push(customDataViewProto.isPrototypeOf(customDataView));
    result.push(DataView.prototype.isPrototypeOf(customDataView));
    result.push(ArrayBuffer.prototype.isPrototypeOf(testDataView));
    const ordinaryObj = {};
    result.push(DataView.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest023() {
    const result = [];
    const testIntl = new Intl.DateTimeFormat('en-US');
    const customIntlProto = Object.create(Intl.DateTimeFormat.prototype);
    const customIntl = Object.create(customIntlProto);
    Object.defineProperty(customIntl, 'format', {
        value: function(date) {
            return '2024-01-01';
        },
        writable: true, // 允许后续修改（可选）
        enumerable: true,
        configurable: true
    });

    result.push(Intl.DateTimeFormat.prototype.isPrototypeOf(testIntl));
    result.push(Object.prototype.isPrototypeOf(testIntl));
    result.push(customIntlProto.isPrototypeOf(customIntl));
    result.push(Intl.DateTimeFormat.prototype.isPrototypeOf(customIntl));
    result.push(Intl.NumberFormat.prototype.isPrototypeOf(testIntl));
    const ordinaryObj = {};
    result.push(Intl.DateTimeFormat.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest024() {
    const result = [];

    class MockPromiseRejectionEvent {
        constructor(type, eventInitDict) {
            this.type = type;
            this.promise = eventInitDict.promise;
            this.reason = eventInitDict.reason;
        }
    }

    const mockPromise = Promise.reject('error');
    const testEvent = new MockPromiseRejectionEvent('unhandledrejection', { promise: mockPromise, reason: 'error' });
    const customEventProto = Object.create(MockPromiseRejectionEvent.prototype);
    const customEvent = Object.create(customEventProto);

    result.push(MockPromiseRejectionEvent.prototype.isPrototypeOf(testEvent));
    result.push(Object.prototype.isPrototypeOf(testEvent));
    result.push(customEventProto.isPrototypeOf(customEvent));
    result.push(MockPromiseRejectionEvent.prototype.isPrototypeOf(customEvent));
    const ordinaryObj = {};
    result.push(MockPromiseRejectionEvent.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest025() {
    const result = [];
    const uint8Arr = new Uint8Array([1, 2]);
    const int32Arr = new Int32Array([100, 200]);
    const float64Arr = new Float64Array([3.14, 2.71]);
    const uint16Arr = new Uint16Array([512, 1024]);

    result.push(Uint8Array.prototype.isPrototypeOf(uint8Arr));
    result.push(Int32Array.prototype.isPrototypeOf(int32Arr));
    result.push(Float64Array.prototype.isPrototypeOf(float64Arr));
    result.push(Uint16Array.prototype.isPrototypeOf(uint16Arr));

    result.push(TypedArray.prototype.isPrototypeOf(uint8Arr));
    result.push(TypedArray.prototype.isPrototypeOf(int32Arr));
    result.push(TypedArray.prototype.isPrototypeOf(float64Arr));

    result.push(Uint8Array.prototype.isPrototypeOf(int32Arr));
    result.push(Float64Array.prototype.isPrototypeOf(uint16Arr));

    const ordinaryObj = {};
    result.push(TypedArray.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest026() {
    const result = [];
    const dateFormat = new Intl.DateTimeFormat('fr-FR', { year: 'numeric' });
    const numberFormat = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'EUR' });
    const collator = new Intl.Collator('es-ES');
    const pluralRules = new Intl.PluralRules('zh-CN');

    result.push(Intl.DateTimeFormat.prototype.isPrototypeOf(dateFormat));
    result.push(Intl.NumberFormat.prototype.isPrototypeOf(numberFormat));
    result.push(Intl.Collator.prototype.isPrototypeOf(collator));
    result.push(Intl.PluralRules.prototype.isPrototypeOf(pluralRules));

    result.push(Intl.DateTimeFormat.prototype.isPrototypeOf(numberFormat));
    result.push(Intl.Collator.prototype.isPrototypeOf(pluralRules));

    result.push(Object.prototype.isPrototypeOf(dateFormat));
    result.push(Object.prototype.isPrototypeOf(collator));

    const ordinaryObj = {};
    result.push(Intl.NumberFormat.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest027() {
    const result = [];
    const buffer = new ArrayBuffer(32);
    const view1 = new DataView(buffer, 0, 16);
    const view2 = new DataView(buffer, 16, 16);
    const customDataViewProto = Object.create(DataView.prototype);
    const customView = Object.create(customDataViewProto);
    customView.getFloat32 = function (byteOffset) {
        return 1.234;
    };

    result.push(DataView.prototype.isPrototypeOf(view1));
    result.push(DataView.prototype.isPrototypeOf(view2));

    result.push(customDataViewProto.isPrototypeOf(customView));
    result.push(DataView.prototype.isPrototypeOf(customView));

    result.push(ArrayBuffer.prototype.isPrototypeOf(view1));
    result.push(DataView.prototype.isPrototypeOf(buffer));

    Object.defineProperty(view1, 'byteOffset', {
        value: 0,
        writable: true, // 可设置为 true 允许后续修改
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(view2, 'byteLength', {
        value: 16,
        writable: true, // 可设置为 true 允许后续修改
        enumerable: true,
        configurable: true
    });
    result.push(DataView.prototype.isPrototypeOf(view1));
    return result;
}

export function ObjectIsPrototypeofTest028() {
    const result = [];
    const plainSymbol = Object(Symbol('plain'));
    const wellKnownSymbol = Object(Symbol.iterator);
    const keySymbol = Object(Symbol.for('shared-key'));
    const customSymbolProto = Object.create(Symbol.prototype);
    const customSymbol = Object.create(customSymbolProto);

    result.push(Symbol.prototype.isPrototypeOf(plainSymbol));
    result.push(Symbol.prototype.isPrototypeOf(wellKnownSymbol));
    result.push(Symbol.prototype.isPrototypeOf(keySymbol));

    result.push(customSymbolProto.isPrototypeOf(customSymbol));
    result.push(Symbol.prototype.isPrototypeOf(customSymbol));

    const primitiveSym = Symbol('primitive');
    result.push(Symbol.prototype.isPrototypeOf(primitiveSym));
    result.push(Symbol.prototype.isPrototypeOf(Symbol.iterator));

    result.push(String.prototype.isPrototypeOf(plainSymbol));
    result.push(Number.prototype.isPrototypeOf(keySymbol));
    return result;
}

export function ObjectIsPrototypeofTest029() {
    const result = [];
    const weakMap = new WeakMap();
    const objKey = {};
    const arrKey = [1, 2];
    const funcKey = () => {
    };
    weakMap.set(objKey, 'obj-val');
    weakMap.set(arrKey, 'arr-val');
    weakMap.set(funcKey, 'func-val');

    const weakSet = new WeakSet();
    const dateItem = new Date();
    const regItem = /test/;
    weakSet.add(objKey);
    weakSet.add(dateItem);
    weakSet.add(regItem);

    result.push(WeakMap.prototype.isPrototypeOf(weakMap));
    result.push(WeakSet.prototype.isPrototypeOf(weakSet));

    const customWeakMapProto = Object.create(WeakMap.prototype);
    const customWeakMap = Object.create(customWeakMapProto);
    customWeakMap.get = function (key) {
        return 'custom-val';
    };

    const customWeakSetProto = Object.create(WeakSet.prototype);
    const customWeakSet = Object.create(customWeakSetProto);
    customWeakSet.has = function (item) {
        return true;
    };

    result.push(customWeakMapProto.isPrototypeOf(customWeakMap));
    result.push(WeakMap.prototype.isPrototypeOf(customWeakMap));
    result.push(customWeakSetProto.isPrototypeOf(customWeakSet));
    result.push(WeakSet.prototype.isPrototypeOf(customWeakSet));

    result.push(Map.prototype.isPrototypeOf(weakMap));
    result.push(Set.prototype.isPrototypeOf(weakSet));
    return result;
}

export function ObjectIsPrototypeofTest030() {
    const result = [];

    function* SyncGen() {
        yield 1;
    }

    async function* AsyncGen() {
        yield 1;
    }

    const syncGenInst = SyncGen();
    const asyncGenInst = AsyncGen();

    const syncGenProto = syncGenInst.__proto__;
    const asyncGenProto = asyncGenInst.__proto__;

    result.push(syncGenProto.isPrototypeOf(syncGenInst));
    result.push(asyncGenProto.isPrototypeOf(asyncGenInst));

    result.push(syncGenProto.isPrototypeOf(asyncGenInst));
    result.push(asyncGenProto.isPrototypeOf(syncGenInst));

    result.push(Object.prototype.isPrototypeOf(syncGenInst));
    result.push(Object.prototype.isPrototypeOf(asyncGenInst));

    const customSyncProto = Object.create(syncGenProto);
    const customSyncGen = Object.create(customSyncProto);
    result.push(customSyncProto.isPrototypeOf(customSyncGen));
    result.push(syncGenProto.isPrototypeOf(customSyncGen));
    return result;
}

export function ObjectIsPrototypeofTest031() {
    const result = [];
    const bigIntWrap = BigInt(9007199254740991n);
    const numWrap = new Number(9007199254740990);
    const customBigIntProto = Object.create(BigInt.prototype);
    const customNumProto = Object.create(Number.prototype);

    const customBigInt = Object.create(customBigIntProto);
    const customNum = Object.create(customNumProto);

    result.push(BigInt.prototype.isPrototypeOf(bigIntWrap));
    result.push(Number.prototype.isPrototypeOf(numWrap));
    result.push(customBigIntProto.isPrototypeOf(customBigInt));
    result.push(customNumProto.isPrototypeOf(customNum));

    result.push(BigInt.prototype.isPrototypeOf(numWrap));
    result.push(Number.prototype.isPrototypeOf(bigIntWrap));
    result.push(customBigIntProto.isPrototypeOf(customNum));

    const bigIntPrim = 123n;
    const numPrim = 123;
    result.push(BigInt.prototype.isPrototypeOf(bigIntPrim));
    result.push(Number.prototype.isPrototypeOf(numPrim));
    return result;
}

export function ObjectIsPrototypeofTest032() {
    const result = [];
    const typeErr = new TypeError('Invalid type');
    const rangeErr = new RangeError('Out of range');
    const customTypeErrProto = Object.create(TypeError.prototype);
    const customRangeErr = Object.create(customTypeErrProto);

    result.push(TypeError.prototype.isPrototypeOf(typeErr));
    result.push(RangeError.prototype.isPrototypeOf(rangeErr));
    result.push(Error.prototype.isPrototypeOf(typeErr));
    result.push(Error.prototype.isPrototypeOf(rangeErr));

    result.push(TypeError.prototype.isPrototypeOf(rangeErr));
    result.push(RangeError.prototype.isPrototypeOf(typeErr));

    result.push(customTypeErrProto.isPrototypeOf(customRangeErr));
    result.push(TypeError.prototype.isPrototypeOf(customRangeErr));
    result.push(Error.prototype.isPrototypeOf(customRangeErr));

    const ordinaryObj = {};
    result.push(TypeError.prototype.isPrototypeOf(ordinaryObj));
    return result;
}

export function ObjectIsPrototypeofTest033() {
    const result = [];
    const relTimeFormatter = new Intl.RelativeTimeFormat('en-US', { style: 'short' });
    const listFormatter = new Intl.ListFormat('en-US', { type: 'conjunction' });
    const customRelTimeProto = Object.create(Intl.RelativeTimeFormat.prototype);
    const customRelTimeFormatter = Object.create(customRelTimeProto);

    result.push(Intl.RelativeTimeFormat.prototype.isPrototypeOf(relTimeFormatter));
    result.push(Intl.ListFormat.prototype.isPrototypeOf(listFormatter));
    result.push(customRelTimeProto.isPrototypeOf(customRelTimeFormatter));
    result.push(Intl.RelativeTimeFormat.prototype.isPrototypeOf(customRelTimeFormatter));

    result.push(Intl.RelativeTimeFormat.prototype.isPrototypeOf(listFormatter));
    result.push(Intl.ListFormat.prototype.isPrototypeOf(relTimeFormatter));

    result.push(Object.prototype.isPrototypeOf(relTimeFormatter));
    result.push(Object.prototype.isPrototypeOf(listFormatter));
    return result;
}

export function ObjectIsPrototypeofTest034() {
    const result = [];
    const customProto = {
        testMethod: () => {
        }
    };

    const sealedObj = Object.create(customProto);
    Object.seal(sealedObj);
    const frozenObj = Object.create(customProto);
    Object.freeze(frozenObj);

    result.push(customProto.isPrototypeOf(sealedObj));
    result.push(customProto.isPrototypeOf(frozenObj));
    result.push(Object.prototype.isPrototypeOf(sealedObj));
    result.push(Object.prototype.isPrototypeOf(frozenObj));

    try {
        sealedObj.__proto__ = {};
    } catch (e) {
    }
    try {
        frozenObj.__proto__ = {};
    } catch (e) {
    }

    result.push(customProto.isPrototypeOf(sealedObj));
    result.push(customProto.isPrototypeOf(frozenObj));

    const plainFrozen = Object.freeze({});
    result.push(Object.prototype.isPrototypeOf(plainFrozen));
    return result;
}

export function ObjectIsPrototypeofTest035() {
    const result = [];
    const targetProto = {
        targetMethod: () => {
        }
    };
    const targetObj = Object.create(targetProto);
    const proxyObj = new Proxy(targetObj, {
        get: (target, prop) => target[prop]
    });

    result.push(targetProto.isPrototypeOf(proxyObj));
    result.push(Object.prototype.isPrototypeOf(proxyObj));
    result.push(targetProto.isPrototypeOf(targetObj));

    const proxyArr = new Proxy([1, 2], {});
    const proxyMap = new Proxy(new Map(), {});
    result.push(Array.prototype.isPrototypeOf(proxyArr));
    result.push(Map.prototype.isPrototypeOf(proxyMap));

    const customProxyTarget = Object.create(targetProto);
    const customProxy = new Proxy(customProxyTarget, {});
    result.push(targetProto.isPrototypeOf(customProxy));
    result.push(customProxyTarget.isPrototypeOf(customProxy));
    return result;
}

export function ObjectIsPrototypeofTest036() {
    const result = [];
    const reflectProto = { reflectProp: 'reflect' };
    const reflectTarget = {};
    Reflect.setPrototypeOf(reflectTarget, reflectProto);

    result.push(reflectProto.isPrototypeOf(reflectTarget));
    result.push(Object.prototype.isPrototypeOf(reflectTarget));

    const directTarget = {};
    directTarget.__proto__ = reflectProto;
    result.push(reflectProto.isPrototypeOf(directTarget));

    const protoFromReflect = Reflect.getPrototypeOf(reflectTarget);
    result.push(protoFromReflect.isPrototypeOf(reflectTarget));

    const nullProtoTarget = {};
    Reflect.setPrototypeOf(nullProtoTarget, null);
    result.push(Object.prototype.isPrototypeOf(nullProtoTarget));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoTarget, nullProtoTarget));
    return result;
}

export function ObjectIsPrototypeofTest037() {
    const result = [];
    const asyncFunc = async () => {
    };
    const syncFunc = () => {
    };
    const asyncFuncViaConstructor = async () => { return 1; };
    const syncFuncViaConstructor = () => { return 1; };

    const asyncFuncProto = asyncFunc.__proto__;
    const syncFuncProto = syncFunc.__proto__;

    result.push(asyncFuncProto.isPrototypeOf(asyncFunc));
    result.push(syncFuncProto.isPrototypeOf(syncFunc));
    result.push(asyncFuncProto.isPrototypeOf(asyncFuncViaConstructor));
    result.push(syncFuncProto.isPrototypeOf(syncFuncViaConstructor));

    result.push(asyncFuncProto.isPrototypeOf(syncFunc));
    result.push(syncFuncProto.isPrototypeOf(asyncFunc));

    result.push(Function.prototype.isPrototypeOf(asyncFunc));
    result.push(Function.prototype.isPrototypeOf(syncFunc));

    const customAsyncProto = Object.create(asyncFuncProto);
    const customAsyncFunc = Object.create(customAsyncProto);
    customAsyncFunc.call = function () {
    };
    result.push(customAsyncProto.isPrototypeOf(customAsyncFunc));
    return result;
}

export function ObjectIsPrototypeofTest038() {
    const result = [];
    const level1Proto = { level1: 'level1' };
    const level2Proto = Object.create(level1Proto);
    const level3Proto = Object.create(level2Proto);
    const level4Obj = Object.create(level3Proto);

    result.push(level3Proto.isPrototypeOf(level4Obj));
    result.push(level2Proto.isPrototypeOf(level4Obj));
    result.push(level1Proto.isPrototypeOf(level4Obj));
    result.push(Object.prototype.isPrototypeOf(level4Obj));

    const unrelatedProto = { unrelated: 'unrelated' };
    result.push(unrelatedProto.isPrototypeOf(level4Obj));

    level2Proto.level2 = 'level2';
    result.push(level2Proto.isPrototypeOf(level4Obj));

    const anotherLevel4Obj = Object.create(level3Proto);
    result.push(level1Proto.isPrototypeOf(anotherLevel4Obj));
    return result;
}

export function ObjectIsPrototypeofTest039() {
    const result = [];
    const iterableArr = [1, 2];
    const iterableStr = 'test';
    const iterableMap = new Map();
    // Get iterators from iterables
    const arrIterator = iterableArr[Symbol.iterator]();
    const strIterator = iterableStr[Symbol.iterator]();
    const mapIterator = iterableMap[Symbol.iterator]();

    // Check iterator prototypes
    const arrIterProto = arrIterator.__proto__;
    const strIterProto = strIterator.__proto__;
    const mapIterProto = mapIterator.__proto__;

    result.push(arrIterProto.isPrototypeOf(arrIterator));
    result.push(strIterProto.isPrototypeOf(strIterator));
    result.push(mapIterProto.isPrototypeOf(mapIterator));
    result.push(arrIterProto.isPrototypeOf(strIterator));
    result.push(mapIterProto.isPrototypeOf(arrIterator));

    // Custom iterator prototype
    const customIterProto = Object.create(arrIterProto);
    const customIterator = Object.create(customIterProto);
    customIterator.next = function () {
        return { value: null, done: true };
    };
    result.push(customIterProto.isPrototypeOf(customIterator));
    result.push(arrIterProto.isPrototypeOf(customIterator));
    return result;
}

export function ObjectIsPrototypeofTest040() {
    const result = [];
    const cleanupCallback = (heldValue) => {
    };
    const finalizationReg = new FinalizationRegistry(cleanupCallback);
    const customFRProto = Object.create(FinalizationRegistry.prototype);
    const customFR = Object.create(customFRProto);

    result.push(FinalizationRegistry.prototype.isPrototypeOf(finalizationReg));
    result.push(Object.prototype.isPrototypeOf(finalizationReg));

    result.push(customFRProto.isPrototypeOf(customFR));
    result.push(FinalizationRegistry.prototype.isPrototypeOf(customFR));

    result.push(FinalizationRegistry.prototype.isPrototypeOf(new WeakMap()));
    result.push(WeakRef.prototype.isPrototypeOf(finalizationReg));

    const testObj = {};
    finalizationReg.register(testObj, 'held-value');
    result.push(FinalizationRegistry.prototype.isPrototypeOf(finalizationReg));
    return result;
}

export function ObjectIsPrototypeofTest041() {
    const result = [];
    const targetObj = { data: 'test' };
    const weakRef = new WeakRef(targetObj);
    const customWRProto = Object.create(WeakRef.prototype);
    const customWR = Object.create(customWRProto);

    result.push(WeakRef.prototype.isPrototypeOf(weakRef));
    result.push(Object.prototype.isPrototypeOf(weakRef));

    result.push(customWRProto.isPrototypeOf(customWR));
    result.push(WeakRef.prototype.isPrototypeOf(customWR));

    result.push(WeakRef.prototype.isPrototypeOf(new FinalizationRegistry(() => {
    })));
    result.push(Map.prototype.isPrototypeOf(weakRef));

    weakRef.deref();
    result.push(WeakRef.prototype.isPrototypeOf(weakRef));
    return result;
}

export function ObjectIsPrototypeofTest042() {
    const result = [];
    const localeEn = new Intl.Locale('en-US');
    const localeZh = new Intl.Locale('zh-CN', { calendar: 'gregory' });
    const customLocaleProto = Object.create(Intl.Locale.prototype);
    const customLocale = Object.create(customLocaleProto);

    result.push(Intl.Locale.prototype.isPrototypeOf(localeEn));
    result.push(Intl.Locale.prototype.isPrototypeOf(localeZh));
    result.push(Object.prototype.isPrototypeOf(localeEn));

    result.push(customLocaleProto.isPrototypeOf(customLocale));
    result.push(Intl.Locale.prototype.isPrototypeOf(customLocale));

    result.push(Intl.Locale.prototype.isPrototypeOf(new Intl.DateTimeFormat('en-US')));
    result.push(Intl.NumberFormat.prototype.isPrototypeOf(localeZh));

    localeEn.maximize();
    result.push(Intl.Locale.prototype.isPrototypeOf(localeEn));
    return result;
}

export function ObjectIsPrototypeofTest043() {
    const result = [];
    const arrayLikeObj = { length: 2, 0: 'a', 1: 'b' };
    const domLikeCollection = { length: 3, item: (i) => i };
    const customArrayLikeProto = Object.create(Object.prototype);
    const customArrayLike = Object.create(customArrayLikeProto);
    Object.assign(customArrayLike, { length: 1, 0: 'x' });

    result.push(Array.prototype.isPrototypeOf(arrayLikeObj));
    result.push(Array.prototype.isPrototypeOf(domLikeCollection));
    result.push(Array.prototype.isPrototypeOf(customArrayLike));

    result.push(Object.prototype.isPrototypeOf(arrayLikeObj));
    result.push(Object.prototype.isPrototypeOf(domLikeCollection));

    const convertedArr = Array.from(arrayLikeObj);
    result.push(Array.prototype.isPrototypeOf(convertedArr));
    result.push(Object.prototype.isPrototypeOf(convertedArr));

    result.push(customArrayLikeProto.isPrototypeOf(customArrayLike));
    return result;
}

export function ObjectIsPrototypeofTest044() {
    const result = [];

    function RegularFunc() {
        return this.value;
    }

    const boundFunc = RegularFunc.bind({ value: 123 });
    const customBoundProto = Object.create(Function.prototype);
    const customBoundFunc = Object.create(customBoundProto);

    result.push(Function.prototype.isPrototypeOf(RegularFunc));
    result.push(Function.prototype.isPrototypeOf(boundFunc));

    result.push(customBoundProto.isPrototypeOf(customBoundFunc));
    result.push(Function.prototype.isPrototypeOf(customBoundFunc));

    const funcInstance = new RegularFunc();
    result.push(RegularFunc.prototype.isPrototypeOf(funcInstance));
    result.push(Function.prototype.isPrototypeOf(funcInstance));

    try {
        const boundInstance = new boundFunc();
        result.push(RegularFunc.prototype.isPrototypeOf(boundInstance));
    } catch (e) {
        result.push(Function.prototype.isPrototypeOf(boundFunc));
    }
    return result;
}

export function ObjectIsPrototypeofTest045() {
    const result = [];
    let sab;
    try {
        sab = new SharedArrayBuffer(16);
    } catch (e) {
        return result;
    }
    const customSABProto = Object.create(SharedArrayBuffer.prototype);
    const customSAB = Object.create(customSABProto);

    result.push(SharedArrayBuffer.prototype.isPrototypeOf(sab));
    result.push(Object.prototype.isPrototypeOf(sab));

    result.push(customSABProto.isPrototypeOf(customSAB));
    result.push(SharedArrayBuffer.prototype.isPrototypeOf(customSAB));

    const regularAB = new ArrayBuffer(16);
    result.push(SharedArrayBuffer.prototype.isPrototypeOf(regularAB));
    result.push(ArrayBuffer.prototype.isPrototypeOf(sab));

    const uint32Arr = new Uint32Array(sab);
    result.push(SharedArrayBuffer.prototype.isPrototypeOf(sab));
    result.push(SharedArrayBuffer.prototype.isPrototypeOf(uint32Arr));
    return result;
}

export function ObjectIsPrototypeofTest046() {
    const result = [];
    const currencyFormat = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' });
    const percentFormat = new Intl.NumberFormat('de-DE', { style: 'percent' });
    const unitFormat = new Intl.NumberFormat('fr-FR', { style: 'unit', unit: 'meter' });
    const customNumFormatProto = Object.create(Intl.NumberFormat.prototype);
    const customNumFormat = Object.create(customNumFormatProto);

    result.push(Intl.NumberFormat.prototype.isPrototypeOf(currencyFormat));
    result.push(Intl.NumberFormat.prototype.isPrototypeOf(percentFormat));
    result.push(Intl.NumberFormat.prototype.isPrototypeOf(unitFormat));
    result.push(Object.prototype.isPrototypeOf(currencyFormat));

    result.push(customNumFormatProto.isPrototypeOf(customNumFormat));
    result.push(Intl.NumberFormat.prototype.isPrototypeOf(customNumFormat));

    result.push(Intl.NumberFormat.prototype.isPrototypeOf(new Intl.DateTimeFormat('en-US')));
    result.push(Intl.Collator.prototype.isPrototypeOf(percentFormat));
    return result;
}

export function ObjectIsPrototypeofTest047() {
    const result = [];

    function* RegularGen() {
        yield this.value;
    }

    const boundGen = RegularGen.bind({ value: 456 });
    const genInst = boundGen();

    const genFuncProto = RegularGen.__proto__;
    const boundGenProto = boundGen.__proto__;
    const genInstProto = genInst.__proto__;

    result.push(genFuncProto.isPrototypeOf(RegularGen));
    result.push(boundGenProto.isPrototypeOf(boundGen));
    result.push(Function.prototype.isPrototypeOf(RegularGen));
    result.push(Function.prototype.isPrototypeOf(boundGen));

    result.push(genInstProto.isPrototypeOf(genInst));
    result.push(Object.prototype.isPrototypeOf(genInst));

    result.push(genFuncProto.isPrototypeOf(genInst));
    result.push(genInstProto.isPrototypeOf(RegularGen));

    const customGenInstProto = Object.create(genInstProto);
    const customGenInst = Object.create(customGenInstProto);
    result.push(customGenInstProto.isPrototypeOf(customGenInst));
    return result;
}

export function ObjectIsPrototypeofTest048() {
    const result = [];
    const langDisplay = new Intl.DisplayNames('en-US', { type: 'language' });
    const regionDisplay = new Intl.DisplayNames('ja-JP', { type: 'region' });
    const scriptDisplay = new Intl.DisplayNames('fr-CA', { type: 'script' });
    const customDisplayProto = Object.create(Intl.DisplayNames.prototype);
    const customDisplay = Object.create(customDisplayProto);

    result.push(Intl.DisplayNames.prototype.isPrototypeOf(langDisplay));
    result.push(Intl.DisplayNames.prototype.isPrototypeOf(regionDisplay));
    result.push(Intl.DisplayNames.prototype.isPrototypeOf(scriptDisplay));
    result.push(Object.prototype.isPrototypeOf(langDisplay));

    result.push(customDisplayProto.isPrototypeOf(customDisplay));
    result.push(Intl.DisplayNames.prototype.isPrototypeOf(customDisplay));

    result.push(Intl.DisplayNames.prototype.isPrototypeOf(new Intl.ListFormat('en-US')));
    result.push(Intl.RelativeTimeFormat.prototype.isPrototypeOf(regionDisplay));
    return result;
}

export function ObjectIsPrototypeofTest049() {
    const result = [];
    const mathProto = Math.__proto__;
    const jsonProto = JSON.__proto__;
    const reflectProto = Reflect.__proto__;

    result.push(mathProto.isPrototypeOf(Math));
    result.push(jsonProto.isPrototypeOf(JSON));
    result.push(reflectProto.isPrototypeOf(Reflect));
    result.push(Object.prototype.isPrototypeOf(Math));
    result.push(Object.prototype.isPrototypeOf(JSON));

    try {
        new Math();
    } catch (e) {
        result.push(mathProto.isPrototypeOf(Math));
    }
    try {
        new JSON();
    } catch (e) {
        result.push(jsonProto.isPrototypeOf(JSON));
    }

    result.push(mathProto.isPrototypeOf(JSON));
    result.push(reflectProto.isPrototypeOf(Math));

    const customMathObj = Object.create(mathProto);
    result.push(mathProto.isPrototypeOf(customMathObj));
    result.push(Object.prototype.isPrototypeOf(customMathObj));
    return result;
}

export function ObjectIsPrototypeofTest050() {
    const result = [];

    class ParentClass {
        parentMethod() {
        }
    }

    class ChildClass extends ParentClass {
        childMethod() {
        }
    }

    const childInst = new ChildClass();
    const customClassProto = Object.create(ChildClass.prototype);
    const customClassInst = Object.create(customClassProto);

    result.push(ChildClass.prototype.isPrototypeOf(childInst));
    result.push(ParentClass.prototype.isPrototypeOf(childInst));
    result.push(Object.prototype.isPrototypeOf(childInst));

    result.push(customClassProto.isPrototypeOf(customClassInst));
    result.push(ChildClass.prototype.isPrototypeOf(customClassInst));

    class UnrelatedClass {
    }

    result.push(UnrelatedClass.prototype.isPrototypeOf(childInst));

    childInst.childMethod();
    result.push(ChildClass.prototype.isPrototypeOf(childInst));
    return result;
}

export function ObjectIsPrototypeofTest051() {
    const result = [];

    function Car(make) {
        this.make = make;
    }

    Car.prototype.drive = function () {
        return 'Driving';
    };
    const myCar = new Car('Tesla');

    function ElectricCar(make, battery) {
        Car.call(this, make);
        this.battery = battery;
    }

    ElectricCar.prototype = Object.create(Car.prototype);
    ElectricCar.prototype.charge = function () {
        return 'Charging';
    };
    const myEV = new ElectricCar('Model 3', '100kWh');

    result.push(Car.prototype.isPrototypeOf(myCar));
    result.push(ElectricCar.prototype.isPrototypeOf(myEV));
    result.push(Car.prototype.isPrototypeOf(myEV));
    result.push(Object.prototype.isPrototypeOf(myCar));

    function Bike(brand) {
        this.brand = brand;
    }

    result.push(Bike.prototype.isPrototypeOf(myEV));

    const customCarProto = Object.create(Car.prototype);
    const customCar = Object.create(customCarProto);
    result.push(customCarProto.isPrototypeOf(customCar));
    return result;
}

export function ObjectIsPrototypeofTest052() {
    const result = [];
    const FlyMixin = {
        fly() {
            return 'Flying';
        }
    };
    const SwimMixin = {
        swim() {
            return 'Swimming';
        }
    };

    function Amphibian(name) {
        this.name = name;
    }

    Object.assign(Amphibian.prototype, FlyMixin, SwimMixin);
    const frog = new Amphibian('Frog');

    const customAmphibianProto = Object.create(Amphibian.prototype);
    const customAmphibian = Object.create(customAmphibianProto);

    result.push(Amphibian.prototype.isPrototypeOf(frog));
    result.push(Object.prototype.isPrototypeOf(frog));
    result.push(FlyMixin.isPrototypeOf(frog));
    result.push(SwimMixin.isPrototypeOf(frog));

    result.push(customAmphibianProto.isPrototypeOf(customAmphibian));
    result.push(Amphibian.prototype.isPrototypeOf(customAmphibian));

    frog.fly();
    result.push(Amphibian.prototype.isPrototypeOf(frog));
    return result;
}

export function ObjectIsPrototypeofTest053() {
    const result = [];
    const grandparentObj = { greet: () => 'Hello' };
    const parentObj = Object.create(grandparentObj);
    parentObj.walk = () => 'Walking';
    const childObj = Object.create(parentObj);
    childObj.run = () => 'Running';

    const customChildProto = Object.create(parentObj);
    const customChildObj = Object.create(customChildProto);

    result.push(parentObj.isPrototypeOf(childObj));
    result.push(grandparentObj.isPrototypeOf(childObj));
    result.push(Object.prototype.isPrototypeOf(childObj));

    result.push(customChildProto.isPrototypeOf(customChildObj));
    result.push(parentObj.isPrototypeOf(customChildObj));

    const unrelatedObj = { jump: () => 'Jumping' };
    result.push(unrelatedObj.isPrototypeOf(childObj));

    parentObj.walk = () => 'Fast walking';
    result.push(parentObj.isPrototypeOf(childObj));
    return result;
}

export function ObjectIsPrototypeofTest054() {
    const result = [];
    const userProto = { userMethod: () => 'User action' };
    const userObj = Object.create(userProto);
    userObj.name = 'Alice';

    const userProxy = new Proxy(userObj, {
        get: (target, prop) => prop === 'name' ? target[prop].toUpperCase() : target[prop]
    });

    const customUserProto = Object.create(userProto);
    const customUserObj = Object.create(customUserProto);
    const customUserProxy = new Proxy(customUserObj, {});

    result.push(userProto.isPrototypeOf(userProxy));
    result.push(Object.prototype.isPrototypeOf(userProxy));
    result.push(userProto.isPrototypeOf(userObj));

    result.push(customUserProto.isPrototypeOf(customUserProxy));
    result.push(userProto.isPrototypeOf(customUserProxy));

    const otherUserProto = { otherMethod: () => 'Other action' };
    const otherUserObj = Object.create(otherUserProto);
    const otherUserProxy = new Proxy(otherUserObj, {});
    result.push(otherUserProto.isPrototypeOf(userProxy));
    return result;
}

export function ObjectIsPrototypeofTest055() {
    const result = [];
    const moduleDefaultProto = { getConfig: () => ({ mode: 'dev' }) };
    const moduleDefaultExport = Object.create(moduleDefaultProto);
    moduleDefaultExport.init = () => 'Module initialized';

    const moduleNamedProto = { log: (msg) => `[LOG] ${msg}` };
    const moduleNamedExport1 = Object.create(moduleNamedProto);
    const moduleNamedExport2 = Object.create(moduleNamedProto);
    moduleNamedExport1.fetchData = () => 'Data fetched';
    moduleNamedExport2.saveData = () => 'Data saved';

    result.push(moduleDefaultProto.isPrototypeOf(moduleDefaultExport));
    result.push(Object.prototype.isPrototypeOf(moduleDefaultExport));

    result.push(moduleNamedProto.isPrototypeOf(moduleNamedExport1));
    result.push(moduleNamedProto.isPrototypeOf(moduleNamedExport2));
    result.push(Object.prototype.isPrototypeOf(moduleNamedExport1));

    result.push(moduleDefaultProto.isPrototypeOf(moduleNamedExport1));
    result.push(moduleNamedProto.isPrototypeOf(moduleDefaultExport));

    moduleDefaultExport.init();
    moduleNamedExport1.fetchData();
    result.push(moduleDefaultProto.isPrototypeOf(moduleDefaultExport));
    result.push(moduleNamedProto.isPrototypeOf(moduleNamedExport1));
    return result;
}

export function ObjectIsPrototypeofTest056() {
    const result = [];
    const createEncapsulatedObj = () => {
        const privateProto = {
            validate: (val) => typeof val === 'string',
            format: (val) => val.trim()
        };
        const privateObj = Object.create(privateProto);
        privateObj.value = '';

        return {
            setValue: (val) => {
                if (privateObj.validate(val)) {
                    privateObj.value = privateObj.format(val);
                }
            },
            getValue: () => privateObj.value,
            getPrivateObj: () => privateObj,
            getPrivateProto: () => privateProto
        };
    };

    const encapsulatedInst = createEncapsulatedObj();
    const privateObj = encapsulatedInst.getPrivateObj();
    const privateProto = encapsulatedInst.getPrivateProto();

    result.push(privateProto.isPrototypeOf(privateObj));
    result.push(Object.prototype.isPrototypeOf(privateObj));

    const publicProto = {
        setValue: () => {
        }, getValue: () => {
        }
    };
    Object.setPrototypeOf(encapsulatedInst, publicProto);
    result.push(publicProto.isPrototypeOf(encapsulatedInst));
    result.push(privateProto.isPrototypeOf(encapsulatedInst));

    encapsulatedInst.setValue('  Test Value  ');
    result.push(privateProto.isPrototypeOf(privateObj));

    const anotherEncapsulatedInst = createEncapsulatedObj();
    const anotherPrivateProto = anotherEncapsulatedInst.getPrivateProto();
    result.push(anotherPrivateProto.isPrototypeOf(privateObj));
    return result;
}

export function ObjectIsPrototypeofTest057() {
    const result = [];
    const productProto = {
        calculatePrice: function () {
            return this.cost * this.quantity;
        },
        getDetails: function () {
            return `${this.name} (x${this.quantity})`;
        }
    };
    const createProduct = (name, cost, quantity) => {
        const product = Object.create(productProto);
        product.name = name;
        product.cost = cost;
        product.quantity = quantity;
        return product;
    };

    const laptop = createProduct('Laptop', 999, 2);
    const phone = createProduct('Phone', 699, 5);

    result.push(productProto.isPrototypeOf(laptop));
    result.push(productProto.isPrototypeOf(phone));
    result.push(Object.prototype.isPrototypeOf(laptop));

    const premiumProductProto = Object.create(productProto);
    premiumProductProto.getWarranty = () => '2-year warranty';
    const createPremiumProduct = (name, cost, quantity) => {
        const product = Object.create(premiumProductProto);
        product.name = name;
        product.cost = cost;
        product.quantity = quantity;
        return product;
    };
    const premiumLaptop = createPremiumProduct('Premium Laptop', 1499, 1);

    result.push(premiumProductProto.isPrototypeOf(premiumLaptop));
    result.push(productProto.isPrototypeOf(premiumLaptop));

    result.push(productProto.isPrototypeOf(premiumProductProto));
    result.push(premiumProductProto.isPrototypeOf(laptop));
    return result;
}

export function ObjectIsPrototypeofTest058() {
    const result = [];
    const userProto = { getStatus: () => 'active' };

    const sealedObj = Object.create(userProto);
    sealedObj.id = 101;
    Object.seal(sealedObj);

    const frozenObj = Object.create(userProto);
    frozenObj.id = 102;
    Object.freeze(frozenObj);

    const frozenProto = Object.freeze({ getType: () => 'frozen-type' });
    const objWithFrozenProto = Object.create(frozenProto);
    objWithFrozenProto.data = 'test';

    result.push(userProto.isPrototypeOf(sealedObj));
    result.push(userProto.isPrototypeOf(frozenObj));
    result.push(frozenProto.isPrototypeOf(objWithFrozenProto));

    try {
        sealedObj.__proto__ = {};
        frozenObj.__proto__ = {};
    } catch (e) {
    }

    result.push(userProto.isPrototypeOf(sealedObj));
    result.push(userProto.isPrototypeOf(frozenObj));

    result.push(frozenProto.isPrototypeOf(sealedObj));
    result.push(userProto.isPrototypeOf(objWithFrozenProto));
    return result;
}

export function ObjectIsPrototypeofTest059() {
    const result = [];
    const isProtoWithNullThis = Object.prototype.isPrototypeOf.bind(null);
    const testObj = {};
    const testArr = [];
    const testNum = 123;
    try {
        isProtoWithNullThis(testObj);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    try {
        isProtoWithNullThis(testArr);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    try {
        isProtoWithNullThis(testNum);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    try {
        isProtoWithNullThis(null);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    try {
        isProtoWithNullThis(undefined);
    } catch (e) {
        result.push(e instanceof TypeError);
    }

    // 验证错误信息
    try {
        isProtoWithNullThis(testObj);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    return result;
}

export function ObjectIsPrototypeofTest060() {
    const result = [];
    const isProtoWithUndefinedThis = Object.prototype.isPrototypeOf.bind(undefined);
    const testStr = 'test';
    const testMap = new Map();
    const testCustomObj = Object.create({});
    try {
        isProtoWithUndefinedThis(testStr);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    try {
        isProtoWithUndefinedThis(testMap);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    try {
        isProtoWithUndefinedThis(testCustomObj);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    try {
        isProtoWithUndefinedThis(null);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    try {
        isProtoWithUndefinedThis(undefined);
    } catch (e) {
        result.push(e instanceof TypeError);
    }

    // 验证错误类型
    try {
        isProtoWithUndefinedThis(testMap);
    } catch (e) {
        result.push(e instanceof TypeError);
    }
    return result;
}

export function ObjectIsPrototypeofTest061() {
    const result = [];
    const objProto = Object.prototype;
    const arrProto = Array.prototype;
    const numProto = Number.prototype;
    const customProto = {
        method: () => {
        }
    };

    result.push(objProto.isPrototypeOf(null));
    result.push(arrProto.isPrototypeOf(null));
    result.push(numProto.isPrototypeOf(null));
    result.push(customProto.isPrototypeOf(null));

    const invalidCaller = Object.create(null);
    result.push(Object.prototype.isPrototypeOf.call(invalidCaller, null));
    return result;
}

export function ObjectIsPrototypeofTest062() {
    const result = [];
    const strProto = String.prototype;
    const funcProto = Function.prototype;
    const mapProto = Map.prototype;
    const customProto = Object.create(funcProto);

    result.push(strProto.isPrototypeOf(undefined));
    result.push(funcProto.isPrototypeOf(undefined));
    result.push(mapProto.isPrototypeOf(undefined));
    result.push(customProto.isPrototypeOf(undefined));

    const emptyProtoObj = Object.create(null);
    result.push(Object.prototype.isPrototypeOf.call(emptyProtoObj, undefined));
    return result;
}

export function ObjectIsPrototypeofTest063() {
    const result = [];
    const nullProtoObj = Object.create(null);
    const childOfNullProto = Object.create(nullProtoObj);
    const grandchildObj = Object.create(childOfNullProto);

    result.push(Object.prototype.isPrototypeOf.call(nullProtoObj, grandchildObj));
    result.push(Object.prototype.isPrototypeOf.call(childOfNullProto, grandchildObj));
    result.push(Object.prototype.isPrototypeOf.call(Object.prototype, grandchildObj));

    const getNull = () => null;
    const getUndefined = () => undefined;
    const testProto = {};

    result.push(testProto.isPrototypeOf(getNull()));
    result.push(testProto.isPrototypeOf(getUndefined()));

    const mixedArr = [null, undefined, {}, []];
    result.push(Object.prototype.isPrototypeOf(mixedArr[0]));
    result.push(Object.prototype.isPrototypeOf(mixedArr[1]));
    result.push(Object.prototype.isPrototypeOf(mixedArr[2]));
    result.push(Array.prototype.isPrototypeOf(mixedArr[3]));
    return result;
}

export function ObjectIsPrototypeofTest064() {
    const result = [];
    const nullProtoTop = Object.create(null);
    nullProtoTop.topMethod = () => 'Top action';

    const ordinaryMiddle = Object.create(nullProtoTop);
    ordinaryMiddle.middleMethod = () => 'Middle action';

    const bottomInstance = Object.create(ordinaryMiddle);
    bottomInstance.instanceProp = 'Instance value';

    result.push(Object.prototype.isPrototypeOf.call(ordinaryMiddle, bottomInstance));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoTop, bottomInstance));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoTop, ordinaryMiddle));
    result.push(Object.prototype.isPrototypeOf(bottomInstance));
    result.push(Object.prototype.isPrototypeOf(nullProtoTop));

    result.push(bottomInstance.topMethod() === 'Top action');
    result.push(ordinaryMiddle.topMethod() === 'Top action');

    const pureOrdinaryProto = {};
    const pureOrdinaryObj = Object.create(pureOrdinaryProto);
    result.push(Object.prototype.isPrototypeOf.call(nullProtoTop, pureOrdinaryObj));
    result.push(pureOrdinaryProto.isPrototypeOf(bottomInstance));
    return result;
}

export function ObjectIsPrototypeofTest065() {
    const result = [];
    const ordinaryTop = { topProp: 'Top value' };

    const nullProtoMiddle = Object.create(ordinaryTop);
    nullProtoMiddle.middleMethod = () => 'Middle action';

    const bottomInstance = Object.create(nullProtoMiddle);
    bottomInstance.instanceMethod = () => 'Instance action';

    result.push(nullProtoMiddle.isPrototypeOf(bottomInstance));
    result.push(ordinaryTop.isPrototypeOf(bottomInstance));
    result.push(ordinaryTop.isPrototypeOf(nullProtoMiddle));
    result.push(Object.prototype.isPrototypeOf(ordinaryTop));
    result.push(Object.prototype.isPrototypeOf(bottomInstance));

    const unrelatedNullProto = Object.create(null);
    result.push(Object.prototype.isPrototypeOf.call(unrelatedNullProto, bottomInstance));

    const newOrdinaryTop = { newTopProp: 'New top value' };
    Object.setPrototypeOf(nullProtoMiddle, newOrdinaryTop);
    result.push(newOrdinaryTop.isPrototypeOf(bottomInstance));
    result.push(ordinaryTop.isPrototypeOf(bottomInstance));
    return result;
}

export function ObjectIsPrototypeofTest066() {
    const result = [];
    const level4NullProto = Object.create(null);
    level4NullProto.level4Method = () => 'Level4 action';

    const level3Ordinary = Object.create(level4NullProto);
    level3Ordinary.level3Prop = 'Level3 value';

    const level2NullProto = Object.create(level3Ordinary);
    level2NullProto.level2Method = () => 'Level2 action';

    const level1Instance = Object.create(level2NullProto);
    level1Instance.level1Prop = 'Level1 value';

    result.push(Object.prototype.isPrototypeOf.call(level2NullProto, level1Instance));
    result.push(Object.prototype.isPrototypeOf.call(level3Ordinary, level1Instance));
    result.push(Object.prototype.isPrototypeOf.call(level4NullProto, level1Instance));
    result.push(Object.prototype.isPrototypeOf.call(level3Ordinary, level2NullProto));
    result.push(Object.prototype.isPrototypeOf.call(level4NullProto, level3Ordinary));

    result.push(Object.prototype.isPrototypeOf(level4NullProto));
    result.push(Object.prototype.isPrototypeOf(level2NullProto));
    result.push(Object.prototype.isPrototypeOf(level1Instance));

    result.push(Object.prototype.isPrototypeOf.call(level4NullProto, level2NullProto));
    result.push(Object.prototype.isPrototypeOf.call(level2NullProto, level4NullProto));
    result.push(Object.prototype.isPrototypeOf.call(level3Ordinary, level4NullProto));
    return result;
}

export function ObjectIsPrototypeofTest067() {
    const result = [];
    const nullProtoBase = Object.create(null);
    nullProtoBase.sharedProp = 'Base value';
    nullProtoBase.baseMethod = () => 'Base method call';

    const ordinaryShadow = Object.create(nullProtoBase);
    ordinaryShadow.sharedProp = 'Ordinary shadow value';
    ordinaryShadow.ordinaryMethod = () => 'Ordinary method call';

    const instanceShadow = Object.create(ordinaryShadow);
    instanceShadow.sharedProp = 'Instance shadow value';
    instanceShadow.instanceMethod = () => 'Instance method call';

    result.push(Object.prototype.isPrototypeOf.call(ordinaryShadow, instanceShadow));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoBase, instanceShadow));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoBase, ordinaryShadow));
    result.push(Object.prototype.isPrototypeOf(instanceShadow));

    result.push(instanceShadow.sharedProp === 'Instance shadow value');
    result.push(ordinaryShadow.sharedProp === 'Ordinary shadow value');
    result.push(nullProtoBase.sharedProp === 'Base value');

    delete instanceShadow.sharedProp;
    result.push(instanceShadow.sharedProp === 'Ordinary shadow value');
    delete ordinaryShadow.sharedProp;
    result.push(instanceShadow.sharedProp === 'Base value');

    result.push(Object.prototype.isPrototypeOf.call(ordinaryShadow, instanceShadow));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoBase, instanceShadow));
    return result;
}

export function ObjectIsPrototypeofTest068() {
    const result = [];
    const ordinaryBase = {
        calculate: (a, b) => a + b,
        baseProp: 'Ordinary base value'
    };

    const nullProtoOverride = Object.create(ordinaryBase);
    nullProtoOverride.calculate = (a, b) => a * b;
    nullProtoOverride.overrideProp = 'Null-proto override value';

    const instanceOverride = Object.create(nullProtoOverride);
    instanceOverride.calculate = (a, b) => a - b;
    instanceOverride.instanceProp = 'Instance override value';

    result.push(nullProtoOverride.isPrototypeOf(instanceOverride));
    result.push(ordinaryBase.isPrototypeOf(instanceOverride));
    result.push(ordinaryBase.isPrototypeOf(nullProtoOverride));
    result.push(Object.prototype.isPrototypeOf(nullProtoOverride));

    result.push(instanceOverride.calculate(10, 5) === 5);
    result.push(nullProtoOverride.calculate(10, 5) === 50);
    result.push(ordinaryBase.calculate(10, 5) === 15);

    const instanceProto = Object.getPrototypeOf(instanceOverride);
    result.push(instanceProto.calculate(10, 5) === 50);
    const protoBase = Object.getPrototypeOf(instanceProto);
    result.push(protoBase.calculate(10, 5) === 15);

    nullProtoOverride.calculate = (a, b) => a / b;
    result.push(nullProtoOverride.isPrototypeOf(instanceOverride));
    result.push(ordinaryBase.isPrototypeOf(instanceOverride));
    return result;
}

export function ObjectIsPrototypeofTest069() {
    const result = [];
    const nullProtoShadow = Object.create(null);
    nullProtoShadow.toString = () => '[Null-proto shadow object]';
    nullProtoShadow.shadowProp = 'Null-proto shadow value';

    const ordinaryExtend = Object.create(nullProtoShadow);
    ordinaryExtend.valueOf = () => 999;
    ordinaryExtend.ordinaryProp = 'Ordinary extend value';

    const instanceFinal = Object.create(ordinaryExtend);
    instanceFinal.instanceProp = 'Instance final value';

    result.push(Object.prototype.isPrototypeOf.call(ordinaryExtend, instanceFinal));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoShadow, instanceFinal));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoShadow, ordinaryExtend));
    result.push(Object.prototype.isPrototypeOf(ordinaryExtend));
    result.push(Object.prototype.isPrototypeOf(instanceFinal));

    result.push(instanceFinal.toString() === '[Null-proto shadow object]');
    result.push(ordinaryExtend.valueOf() === 999);

    result.push(instanceFinal.hasOwnProperty === undefined);
    result.push(ordinaryExtend.hasOwnProperty === undefined);

    const pureOrdinary = {};
    result.push(Object.prototype.isPrototypeOf(pureOrdinary));
    result.push(Object.prototype.isPrototypeOf.call(nullProtoShadow, pureOrdinary));
    result.push(pureOrdinary.isPrototypeOf(instanceFinal));
    return result;
}