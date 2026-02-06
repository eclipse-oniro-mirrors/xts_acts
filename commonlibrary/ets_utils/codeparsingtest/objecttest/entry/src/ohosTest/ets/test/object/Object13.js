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

// 测试点1：获取普通对象的原型，验证其是否为 Object.prototype
export function Fn01_testGetPrototypeOfNormalObject() {
    const obj = {};
    return Object.getPrototypeOf(obj) === Object.prototype;
}

// 测试点2：获取 null 原型对象的原型，验证其是否为 null
export function Fn02_testGetPrototypeOfNullPrototypeObject() {
    const obj = Object.create(null);
    return Object.getPrototypeOf(obj) === null;
}

// 测试点3：ES2015+ 中非对象参数的强制类型转换，验证原始值的原型是否符合预期（以数字为例）
export function Fn03_testNonObjectCoercion() {
    const num = 123;
    return Object.getPrototypeOf(num) === Number.prototype;
}

// 测试点4：获取数组对象的原型，验证是否为 Array.prototype
export function Fn04_testGetPrototypeOfArray() {
    const arr = [];
    return Object.getPrototypeOf(arr) === Array.prototype;
}

// 测试点5：获取函数对象的原型，验证是否为 Function.prototype
export function Fn05_testGetPrototypeOfFunction() {
    const func = () => {
    };
    return Object.getPrototypeOf(func) === Function.prototype;
}

// 测试点6：获取日期对象的原型，验证是否为 Date.prototype
export function Fn06_testGetPrototypeOfDate() {
    const date = new Date();
    return Object.getPrototypeOf(date) === Date.prototype;
}

// 测试点7：获取正则对象的原型，验证是否为 RegExp.prototype
export function Fn07_testGetPrototypeOfRegExp() {
    const reg = /test/;
    return Object.getPrototypeOf(reg) === RegExp.prototype;
}

// 测试点8：获取布尔原始值转换后的原型，验证是否为 Boolean.prototype
export function Fn08_testGetPrototypeOfBooleanPrimitive() {
    const bool = true;
    return Object.getPrototypeOf(bool) === Boolean.prototype;
}

// 测试点9：获取字符串原始值转换后的原型，验证是否为 String.prototype
export function Fn09_testGetPrototypeOfStringPrimitive() {
    const str = "test";
    return Object.getPrototypeOf(str) === String.prototype;
}

// 测试点10：获取 Symbol原始值转换后的原型，验证是否为 Symbol.prototype
export function Fn10_testGetPrototypeOfSymbolPrimitive() {
    const sym = Symbol("test");
    return Object.getPrototypeOf(sym) === Symbol.prototype;
}

// 测试点11：获取自定义类实例的原型，验证是否为类的 prototype
export function Fn11_testGetPrototypeOfCustomClassInstance() {
    class TestClass {
    }

    const instance = new TestClass();
    return Object.getPrototypeOf(instance) === TestClass.prototype;
}

// 测试点12：获取继承类实例的原型，验证是否为子类的 prototype
export function Fn12_testGetPrototypeOfInheritedClassInstance() {
    class Parent {
    }

    class Child extends Parent {
    }

    const childInstance = new Child();
    return Object.getPrototypeOf(childInstance) === Child.prototype;
}

// 测试点13：验证子类 prototype 的原型是否为父类 prototype
export function Fn13_testPrototypeChainOfInheritedClass() {
    class Parent {
    }

    class Child extends Parent {
    }

    return Object.getPrototypeOf(Child.prototype) === Parent.prototype;
}

// 测试点14：获取 Object.prototype 的原型，验证是否为 null
export function Fn14_testGetPrototypeOfObjectPrototype() {
    return Object.getPrototypeOf(Object.prototype) === null;
}

// 测试点15：获取 Array.prototype 的原型，验证是否为 Object.prototype
export function Fn15_testGetPrototypeOfArrayPrototype() {
    return Object.getPrototypeOf(Array.prototype) === Object.prototype;
}

// 测试点16：获取 Function.prototype 的原型，验证是否为 Object.prototype
export function Fn16_testGetPrototypeOfFunctionPrototype() {
    return Object.getPrototypeOf(Function.prototype) === Object.prototype;
}

// 测试点17：获取通过 Object.create 指定原型创建的对象，验证原型正确性
export function Fn17_testGetPrototypeOfObjectCreateWithPrototype() {
    const protoObj = { key: "value" };
    const obj = Object.create(protoObj);
    return Object.getPrototypeOf(obj) === protoObj;
}

// 测试点18：获取修改过 prototype 的对象实例的原型，验证是否为修改后的 prototype
export function Fn18_testGetPrototypeOfInstanceAfterPrototypeChange() {

    function TestFunc() {
    }

    const newProto = { newKey: "newVal" };
    TestFunc.prototype = newProto;
    const instance = new TestFunc();
    return Object.getPrototypeOf(instance) === newProto;
}

// 测试点19：获取 Map 对象的原型，验证是否为 Map.prototype
export function Fn19_testGetPrototypeOfMap() {
    const map = new Map();
    return Object.getPrototypeOf(map) === Map.prototype;
}

// 测试点20：获取 Set 对象的原型，验证是否为 Set.prototype
export function Fn20_testGetPrototypeOfSet() {
    const set = new Set();
    return Object.getPrototypeOf(set) === Set.prototype;
}

// 测试点21：获取 WeakMap 对象的原型，验证是否为 WeakMap.prototype
export function Fn21_testGetPrototypeOfWeakMap() {
    const weakMap = new WeakMap();
    return Object.getPrototypeOf(weakMap) === WeakMap.prototype;
}

// 测试点22：获取 WeakSet 对象的原型，验证是否为 WeakSet.prototype
export function Fn22_testGetPrototypeOfWeakSet() {
    const weakSet = new WeakSet();
    return Object.getPrototypeOf(weakSet) === WeakSet.prototype;
}

// 测试点23：获取 Promise 对象的原型，验证是否为 Promise.prototype
export function Fn23_testGetPrototypeOfPromise() {
    const promise = Promise.resolve();
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点24：获取 Error 对象的原型，验证是否为 Error.prototype
export function Fn24_testGetPrototypeOfError() {
    const error = new Error("test");
    return Object.getPrototypeOf(error) === Error.prototype;
}

// 测试点25：获取 TypeError 对象的原型，验证是否为 TypeError.prototype
export function Fn25_testGetPrototypeOfTypeError() {
    const typeError = new TypeError("test");
    return Object.getPrototypeOf(typeError) === TypeError.prototype;
}

// 测试点26：获取自定义对象字面量的原型，验证是否为 Object.prototype
export function Fn26_testGetPrototypeOfObjectLiteral() {
    const obj = { name: "test" };
    return Object.getPrototypeOf(obj) === Object.prototype;
}

// 测试点27：获取通过类实例继承链的原型，验证多层原型正确性
export function Fn27_testMultiLevelPrototypeChain() {
    class Grandparent {
    }

    class Parent extends Grandparent {
    }

    class Child extends Parent {
    }

    const child = new Child();
    const parentProto = Object.getPrototypeOf(child);
    const grandparentProto = Object.getPrototypeOf(parentProto);
    return grandparentProto === Grandparent.prototype;
}

// 测试点28：获取 BigInt 原始值转换后的原型，验证是否为 BigInt.prototype
export function Fn28_testGetPrototypeOfBigIntPrimitive() {
    const bigInt = 123n;
    return Object.getPrototypeOf(bigInt) === BigInt.prototype;
}

// 测试点29：获取 ArrayBuffer 对象的原型，验证是否为 ArrayBuffer.prototype
export function Fn29_testGetPrototypeOfArrayBuffer() {
    const buffer = new ArrayBuffer(8);
    return Object.getPrototypeOf(buffer) === ArrayBuffer.prototype;
}

// 测试点30：获取 TypedArray（Uint8Array）对象的原型，验证是否为 Uint8Array.prototype
export function Fn30_testGetPrototypeOfTypedArray() {
    const uint8Arr = new Uint8Array(8);
    return Object.getPrototypeOf(uint8Arr) === Uint8Array.prototype;
}

// 测试点31：获取 DataView 对象的原型，验证是否为 DataView.prototype
export function Fn31_testGetPrototypeOfDataView() {
    const buffer = new ArrayBuffer(16);
    const dataView = new DataView(buffer);
    return Object.getPrototypeOf(dataView) === DataView.prototype;
}

// 测试点32：获取 RegExp 构造函数实例的原型（非字面量），验证是否为 RegExp.prototype
export function Fn32_testGetPrototypeOfRegExpConstructor() {
    const reg = new RegExp("test", "g");
    return Object.getPrototypeOf(reg) === RegExp.prototype;
}

// 测试点33：获取空函数（传统声明）的原型，验证是否为 Function.prototype
export function Fn33_testGetPrototypeOfTraditionalFunction() {

    function testFunc() {
    }

    return Object.getPrototypeOf(testFunc) === Function.prototype;
}

// 测试点34：获取箭头函数的原型，验证是否为 Function.prototype
export function Fn34_testGetPrototypeOfArrowFunction() {
    const arrowFunc = () => {
    };
    return Object.getPrototypeOf(arrowFunc) === Function.prototype;
}

// 测试点35：获取类构造函数的原型，验证是否为 Function.prototype
export function Fn35_testGetPrototypeOfClassConstructor() {
    class TestClass {
    }

    return Object.getPrototypeOf(TestClass) === Function.prototype;
}

// 测试点36：获取继承类构造函数的原型，验证是否为 Function.prototype
export function Fn36_testGetPrototypeOfInheritedClassConstructor() {
    class Parent {
    }

    class Child extends Parent {
    }

    return Object.getPrototypeOf(Child) === Function.prototype;
}

// 测试点37：获取 Object.create 嵌套原型对象的原型，验证多层原型正确性
export function Fn37_testGetPrototypeOfNestedObjectCreate() {
    const grandProto = { g: 1 };
    const parentProto = Object.create(grandProto);
    const obj = Object.create(parentProto);
    return Object.getPrototypeOf(Object.getPrototypeOf(obj)) === grandProto;
}

// 测试点38：获取 Boolean 对象（非原始值）的原型，验证是否为 Boolean.prototype
export function Fn38_testGetPrototypeOfBooleanObject() {
    const boolObj = new Boolean(true);
    return Object.getPrototypeOf(boolObj) === Boolean.prototype;
}

// 测试点39：获取 String 对象（非原始值）的原型，验证是否为 String.prototype
export function Fn39_testGetPrototypeOfStringObject() {
    const strObj = new String("test");
    return Object.getPrototypeOf(strObj) === String.prototype;
}

// 测试点40：获取 Number 对象（非原始值）的原型，验证是否为 Number.prototype
export function Fn40_testGetPrototypeOfNumberObject() {
    const numObj = new Number(123);
    return Object.getPrototypeOf(numObj) === Number.prototype;
}

// 测试点41：获取 BigInt 对象（非原始值）的原型，验证是否为 BigInt.prototype
export function Fn41_testGetPrototypeOfBigIntObject() {
    const bigIntObj = Object(123n);
    return Object.getPrototypeOf(bigIntObj) === BigInt.prototype;
}

// 测试点42：获取 Symbol 对象（非原始值）的原型，验证是否为 Symbol.prototype
export function Fn42_testGetPrototypeOfSymbolObject() {
    const symObj = Object(Symbol("test"));
    return Object.getPrototypeOf(symObj) === Symbol.prototype;
}

// 测试点43：获取 Error 子类（RangeError）实例的原型，验证是否为 RangeError.prototype
export function Fn43_testGetPrototypeOfRangeError() {
    const rangeError = new RangeError("out of range");
    return Object.getPrototypeOf(rangeError) === RangeError.prototype;
}

// 测试点44：获取 Error 子类（ReferenceError）实例的原型，验证是否为 ReferenceError.prototype
export function Fn44_testGetPrototypeOfReferenceError() {
    const refError = new ReferenceError("not defined");
    return Object.getPrototypeOf(refError) === ReferenceError.prototype;
}

// 测试点45：获取 Promise 子类实例的原型，验证是否为子类 prototype
export function Fn45_testGetPrototypeOfPromiseSubclass() {
    class MyPromise extends Promise {
    }

    const myPromise = MyPromise.resolve();
    return Object.getPrototypeOf(myPromise) === MyPromise.prototype;
}

// 测试点46：验证 Promise.prototype 的原型是否为 Object.prototype
export function Fn46_testGetPrototypeOfPromisePrototype() {
    return Object.getPrototypeOf(Promise.prototype) === Object.prototype;
}

// 测试点47：验证 Map.prototype 的原型是否为 Object.prototype
export function Fn47_testGetPrototypeOfMapPrototype() {
    return Object.getPrototypeOf(Map.prototype) === Object.prototype;
}

// 测试点48：验证 Set.prototype 的原型是否为 Object.prototype
export function Fn48_testGetPrototypeOfSetPrototype() {
    return Object.getPrototypeOf(Set.prototype) === Object.prototype;
}

// 测试点49：获取 TypedArray（Int32Array）实例的原型，验证是否为 Int32Array.prototype
export function Fn49_testGetPrototypeOfInt32Array() {
    const int32Arr = new Int32Array(4);
    return Object.getPrototypeOf(int32Arr) === Int32Array.prototype;
}

// 测试点50：获取 TypedArray（Float64Array）实例的原型，验证是否为 Float64Array.prototype
export function Fn50_testGetPrototypeOfFloat64Array() {
    const float64Arr = new Float64Array(4);
    return Object.getPrototypeOf(float64Arr) === Float64Array.prototype;
}

// 测试点51：验证 TypedArray.prototype 的原型是否为 Object.prototype
export function Fn51_testGetPrototypeOfTypedArrayPrototype() {
    return Object.getPrototypeOf(Uint8Array.prototype) === Object.prototype;
}

// 测试点52：获取 ArrayBuffer 子类实例的原型，验证是否为子类 prototype
export function Fn52_testGetPrototypeOfArrayBufferSubclass() {
    class MyArrayBuffer extends ArrayBuffer {
    }

    const myBuffer = new MyArrayBuffer(8);
    return Object.getPrototypeOf(myBuffer) === MyArrayBuffer.prototype;
}

// 测试点53：获取 WeakMap 子类实例的原型，验证是否为子类 prototype
export function Fn53_testGetPrototypeOfWeakMapSubclass() {
    class MyWeakMap extends WeakMap {
    }

    const myWeakMap = new MyWeakMap();
    return Object.getPrototypeOf(myWeakMap) === MyWeakMap.prototype;
}

// 测试点54：获取 WeakSet 子类实例的原型，验证是否为子类 prototype
export function Fn54_testGetPrototypeOfWeakSetSubclass() {
    class MyWeakSet extends WeakSet {
    }

    const myWeakSet = new MyWeakSet();
    return Object.getPrototypeOf(myWeakSet) === MyWeakSet.prototype;
}

// 测试点55：获取自定义对象通过 Object.setPrototypeOf 修改后的原型，验证正确性
export function Fn55_testGetPrototypeAfterSetPrototypeOf() {
    const obj = {};
    const newProto = { key: "val" };
    Object.setPrototypeOf(obj, newProto);
    return Object.getPrototypeOf(obj) === newProto;
}

// 测试点56：验证 Error.prototype 的原型是否为 Object.prototype
export function Fn56_testGetPrototypeOfErrorPrototype() {
    return Object.getPrototypeOf(Error.prototype) === Object.prototype;
}

// 测试点57：验证 Date.prototype 的原型是否为 Object.prototype
export function Fn57_testGetPrototypeOfDatePrototype() {
    return Object.getPrototypeOf(Date.prototype) === Object.prototype;
}

// 测试点59：获取空对象字面量（含属性）的原型，验证是否为 Object.prototype
export function Fn59_testGetPrototypeOfObjectLiteralWithProps() {
    const obj = { id: 1, name: "test" };
    return Object.getPrototypeOf(obj) === Object.prototype;
}

// 测试点60：获取多层继承类实例的最顶层原型，验证是否为顶层父类 prototype
export function Fn60_testGetPrototypeOfTopLevelInheritedClass() {
    class Top {
    }

    class Middle extends Top {
    }

    class Bottom extends Middle {
    }

    const bottomInstance = new Bottom();
    let proto = Object.getPrototypeOf(bottomInstance);
    proto = Object.getPrototypeOf(proto);
    return Object.getPrototypeOf(proto) === Top.prototype;
}

// 测试点65：获取 Int8Array 实例的原型，验证是否为 Int8Array.prototype
export function Fn65_testGetPrototypeOfInt8Array() {
    const int8Arr = new Int8Array(2);
    return Object.getPrototypeOf(int8Arr) === Int8Array.prototype;
}

// 测试点66：获取 Uint16Array 实例的原型，验证是否为 Uint16Array.prototype
export function Fn66_testGetPrototypeOfUint16Array() {
    const uint16Arr = new Uint16Array(2);
    return Object.getPrototypeOf(uint16Arr) === Uint16Array.prototype;
}

// 测试点67：获取 Int16Array 实例的原型，验证是否为 Int16Array.prototype
export function Fn67_testGetPrototypeOfInt16Array() {
    const int16Arr = new Int16Array(2);
    return Object.getPrototypeOf(int16Arr) === Int16Array.prototype;
}

// 测试点68：获取 Uint32Array 实例的原型，验证是否为 Uint32Array.prototype
export function Fn68_testGetPrototypeOfUint32Array() {
    const uint32Arr = new Uint32Array(2);
    return Object.getPrototypeOf(uint32Arr) === Uint32Array.prototype;
}

// 测试点69：获取 Int32Array 实例的原型（重复验证不同场景），验证是否为 Int32Array.prototype
export function Fn69_testGetPrototypeOfInt32ArrayAgain() {
    const int32Arr = new Int32Array([1, 2, 3]);
    return Object.getPrototypeOf(int32Arr) === Int32Array.prototype;
}

// 测试点70：获取 Float32Array 实例的原型，验证是否为 Float32Array.prototype
export function Fn70_testGetPrototypeOfFloat32Array() {
    const float32Arr = new Float32Array(2);
    return Object.getPrototypeOf(float32Arr) === Float32Array.prototype;
}

// 测试点71：获取 Float64Array 实例的原型（重复验证不同场景），验证是否为 Float64Array.prototype
export function Fn71_testGetPrototypeOfFloat64ArrayAgain() {
    const float64Arr = new Float64Array([1.1, 2.2]);
    return Object.getPrototypeOf(float64Arr) === Float64Array.prototype;
}

// 测试点72：获取 BigInt64Array 实例的原型，验证是否为 BigInt64Array.prototype
export function Fn72_testGetPrototypeOfBigInt64Array() {
    const bigInt64Arr = new BigInt64Array([1n, 2n]);
    return Object.getPrototypeOf(bigInt64Arr) === BigInt64Array.prototype;
}

// 测试点73：获取 BigUint64Array 实例的原型，验证是否为 BigUint64Array.prototype
export function Fn73_testGetPrototypeOfBigUint64Array() {
    const bigUint64Arr = new BigUint64Array([1n, 2n]);
    return Object.getPrototypeOf(bigUint64Arr) === BigUint64Array.prototype;
}

// 测试点74：获取自定义类实例（含方法）的原型，验证是否为类 prototype
export function Fn74_testGetPrototypeOfCustomClassWithMethod() {
    class TestClass {
        testMethod() {
        }
    }

    const instance = new TestClass();
    return Object.getPrototypeOf(instance) === TestClass.prototype;
}

// 测试点75：获取继承类实例（含重写方法）的原型，验证是否为子类 prototype
export function Fn75_testGetPrototypeOfInheritedClassWithMethod() {
    class Parent {
        parentMethod() {
        }
    }

    class Child extends Parent {
        childMethod() {
        }
    }

    const instance = new Child();
    return Object.getPrototypeOf(instance) === Child.prototype;
}

// 测试点76：验证子类 prototype 的原型是否为父类 prototype（含方法场景）
export function Fn76_testPrototypeChainOfInheritedClassWithMethod() {
    class Parent {
        parentMethod() {
        }
    }

    class Child extends Parent {
        childMethod() {
        }
    }

    return Object.getPrototypeOf(Child.prototype) === Parent.prototype;
}

// 测试点77：获取 Object.create 空原型对象的原型，验证是否为 null
export function Fn77_testGetPrototypeOfObjectCreateNull() {
    const obj = Object.create(null);
    return Object.getPrototypeOf(obj) === null;
}

// 测试点78：获取 Object.create 带多层原型的对象的顶层原型，验证是否为顶层原型对象
export function Fn78_testGetTopPrototypeOfNestedObjectCreate() {
    const topProto = { top: "val" };
    const midProto = Object.create(topProto);
    const obj = Object.create(midProto);
    return Object.getPrototypeOf(Object.getPrototypeOf(obj)) === topProto;
}

// 测试点79：获取 Promise.reject 生成的 Promise 实例的原型，验证是否为 Promise.prototype
export function Fn79_testGetPrototypeOfRejectedPromise() {
    const rejectedPromise = Promise.reject("error");
    return Object.getPrototypeOf(rejectedPromise) === Promise.prototype;
}

// 测试点80：获取 Promise.all 生成的 Promise 实例的原型，验证是否为 Promise.prototype
export function Fn80_testGetPrototypeOfPromiseAll() {
    const allPromise = Promise.all([Promise.resolve()]);
    return Object.getPrototypeOf(allPromise) === Promise.prototype;
}

// 测试点81：获取 Promise.race 生成的 Promise 实例的原型，验证是否为 Promise.prototype
export function Fn81_testGetPrototypeOfPromiseRace() {
    const racePromise = Promise.race([Promise.resolve()]);
    return Object.getPrototypeOf(racePromise) === Promise.prototype;
}

// 测试点82：获取 Promise.allSettled 生成的 Promise 实例的原型，验证是否为 Promise.prototype
export function Fn82_testGetPrototypeOfPromiseAllSettled() {
    const allSettledPromise = Promise.allSettled([Promise.resolve()]);
    return Object.getPrototypeOf(allSettledPromise) === Promise.prototype;
}

// 测试点83：获取 Promise.any 生成的 Promise 实例的原型，验证是否为 Promise.prototype
export function Fn83_testGetPrototypeOfPromiseAny() {
    const anyPromise = Promise.any([Promise.resolve()]);
    return Object.getPrototypeOf(anyPromise) === Promise.prototype;
}

// 测试点84：获取 EvalError 实例的原型，验证是否为 EvalError.prototype
export function Fn84_testGetPrototypeOfEvalError() {
    const evalError = new EvalError("eval error");
    return Object.getPrototypeOf(evalError) === EvalError.prototype;
}

// 测试点85：获取 SyntaxError 实例的原型，验证是否为 SyntaxError.prototype
export function Fn85_testGetPrototypeOfSyntaxError() {
    const syntaxError = new SyntaxError("syntax error");
    return Object.getPrototypeOf(syntaxError) === SyntaxError.prototype;
}

// 测试点86：获取 URIError 实例的原型，验证是否为 URIError.prototype
export function Fn86_testGetPrototypeOfURIError() {
    const uriError = new URIError("uri error");
    return Object.getPrototypeOf(uriError) === URIError.prototype;
}

// 测试点87：获取通过 Object.assign 创建的对象的原型，验证是否为原对象原型
export function Fn87_testGetPrototypeOfAssignedObject() {
    const source = { a: 1 };
    const assignedObj = Object.assign({}, source);
    return Object.getPrototypeOf(assignedObj) === Object.getPrototypeOf(source);
}

// 测试点88：获取数组 slice 方法返回的新数组的原型，验证是否为 Array.prototype
export function Fn88_testGetPrototypeOfSlicedArray() {
    const arr = [1, 2, 3];
    const slicedArr = arr.slice(1);
    return Object.getPrototypeOf(slicedArr) === Array.prototype;
}

// 测试点89：获取数组 map 方法返回的新数组的原型，验证是否为 Array.prototype
export function Fn89_testGetPrototypeOfMappedArray() {
    const arr = [1, 2, 3];
    const mappedArr = arr.map(item => item * 2);
    return Object.getPrototypeOf(mappedArr) === Array.prototype;
}

// 测试点90：获取多层继承类（3层以上）的最顶层原型，验证是否为顶层父类 prototype
export function Fn90_testGetTopPrototypeOfMultiLevelInheritance() {
    class Level1 {
    }

    class Level2 extends Level1 {
    }

    class Level3 extends Level2 {
    }

    class Level4 extends Level3 {
    }

    const instance = new Level4();
    let proto = Object.getPrototypeOf(instance);
    proto = Object.getPrototypeOf(proto);
    proto = Object.getPrototypeOf(proto);
    return Object.getPrototypeOf(proto) === Level1.prototype;
}

// 测试点94：获取 Array.from 生成数组的原型，验证是否为 Array.prototype
export function Fn94_testGetPrototypeOfArrayFrom() {
    const arr = Array.from([1, 2, 3]);
    return Object.getPrototypeOf(arr) === Array.prototype;
}

// 测试点95：获取 Array.of 生成数组的原型，验证是否为 Array.prototype
export function Fn95_testGetPrototypeOfArrayOf() {
    const arr = Array.of(1, 2, 3);
    return Object.getPrototypeOf(arr) === Array.prototype;
}

// 测试点96：获取字符串 split 方法返回数组的原型，验证是否为 Array.prototype
export function Fn96_testGetPrototypeOfSplitArray() {
    const str = "a,b,c";
    const arr = str.split(",");
    return Object.getPrototypeOf(arr) === Array.prototype;
}

// 测试点97：获取 Map 实例 entries 方法返回迭代器的原型，验证是否为 Map Iterator.prototype
export function Fn97_testGetPrototypeOfMapIterator() {
    const map = new Map();
    const iterator = map.entries();
    return Object.getPrototypeOf(iterator).name === "Map Iterator";
}

// 测试点98：获取 Set 实例 keys 方法返回迭代器的原型，验证是否为 Set Iterator.prototype
export function Fn98_testGetPrototypeOfSetIterator() {
    const set = new Set();
    const iterator = set.keys();
    return Object.getPrototypeOf(iterator).name === "Set Iterator";
}

// 测试点99：获取数组 entries 方法返回迭代器的原型，验证是否为 Array Iterator.prototype
export function Fn99_testGetPrototypeOfArrayIterator() {
    const arr = [1, 2, 3];
    const iterator = arr.entries();
    return Object.getPrototypeOf(iterator).name === "Array Iterator";
}

// 测试点100：获取字符串 [Symbol.iterator] 返回迭代器的原型，验证是否为 String Iterator.prototype
export function Fn100_testGetPrototypeOfStringIterator() {
    const str = "test";
    const iterator = str[Symbol.iterator]();
    return Object.getPrototypeOf(iterator).name === "String Iterator";
}

// 测试点101：获取自定义迭代器对象的原型，验证是否为自定义迭代器原型
export function Fn101_testGetPrototypeOfCustomIterator() {
    const customProto = { next: () => ({ done: true }) };
    const iterator = Object.create(customProto);
    return Object.getPrototypeOf(iterator) === customProto;
}

// 测试点102：获取 Proxy 实例的原型，验证是否为目标对象的原型
export function Fn102_testGetPrototypeOfProxy() {
    const target = {};
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === Object.getPrototypeOf(target);
}

// 测试点103：获取 Proxy 代理数组的原型，验证是否为 Array.prototype
export function Fn103_testGetPrototypeOfProxyArray() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === Array.prototype;
}

// 测试点104：获取 Date 实例 toISOString 方法所属原型，验证是否为 Date.prototype
export function Fn104_testGetPrototypeOfDateMethod() {
    const date = new Date();
    return Object.getPrototypeOf(date.toISOString) === Date.prototype.toISOString.__proto__;
}

// 测试点105：获取 Function.prototype.bind 方法返回函数的原型，验证是否为 Function.prototype
export function Fn105_testGetPrototypeOfBoundFunctionProto() {
    const func = () => {
    };
    const boundFunc = func.bind(null);
    return Object.getPrototypeOf(boundFunc) === Function.prototype;
}

// 测试点106：获取类静态方法的原型，验证是否为 Function.prototype
export function Fn106_testGetPrototypeOfClassStaticMethod() {
    class TestClass {
        static staticMethod() {
        }
    }

    return Object.getPrototypeOf(TestClass.staticMethod) === Function.prototype;
}

// 测试点107：获取类实例方法的原型，验证是否为 Function.prototype
export function Fn107_testGetPrototypeOfClassInstanceMethod() {
    class TestClass {
        instanceMethod() {
        }
    }

    const instance = new TestClass();
    return Object.getPrototypeOf(instance.instanceMethod) === Function.prototype;
}

// 测试点108：获取 Object.keys 返回数组的原型，验证是否为 Array.prototype
export function Fn108_testGetPrototypeOfObjectKeysArray() {
    const obj = { a: 1, b: 2 };
    const keysArr = Object.keys(obj);
    return Object.getPrototypeOf(keysArr) === Array.prototype;
}

// 测试点109：获取 Object.values 返回数组的原型，验证是否为 Array.prototype
export function Fn109_testGetPrototypeOfObjectValuesArray() {
    const obj = { a: 1, b: 2 };
    const valuesArr = Object.values(obj);
    return Object.getPrototypeOf(valuesArr) === Array.prototype;
}

// 测试点110：获取 Object.entries 返回数组的原型，验证是否为 Array.prototype
export function Fn110_testGetPrototypeOfObjectEntriesArray() {
    const obj = { a: 1, b: 2 };
    const entriesArr = Object.entries(obj);
    return Object.getPrototypeOf(entriesArr) === Array.prototype;
}

// 测试点111：获取 JSON.parse 返回对象的原型，验证是否为 Object.prototype
export function Fn111_testGetPrototypeOfJsonParsedObject() {
    const obj = JSON.parse('{"a":1}');
    return Object.getPrototypeOf(obj) === Object.prototype;
}

// 测试点112：获取 JSON.parse 返回数组的原型，验证是否为 Array.prototype
export function Fn112_testGetPrototypeOfJsonParsedArray() {
    const arr = JSON.parse('[1,2,3]');
    return Object.getPrototypeOf(arr) === Array.prototype;
}

// 测试点113：获取 WeakMap 实例 has 方法的原型，验证是否为 Function.prototype
export function Fn113_testGetPrototypeOfWeakMapMethod() {
    const weakMap = new WeakMap();
    return Object.getPrototypeOf(weakMap.has) === Function.prototype;
}

// 测试点114：获取 WeakSet 实例 add 方法的原型，验证是否为 Function.prototype
export function Fn114_testGetPrototypeOfWeakSetMethod() {
    const weakSet = new WeakSet();
    return Object.getPrototypeOf(weakSet.add) === Function.prototype;
}

// 测试点122：获取 AsyncGeneratorFunction 实例的原型，验证是否为 AsyncGeneratorFunction.prototype
export function Fn122_testGetPrototypeOfAsyncGeneratorFunction() {

    async function* asyncGenFunc() {
    }

    return Object.getPrototypeOf(asyncGenFunc) === AsyncGeneratorFunction.prototype;
}

// 测试点123：获取 async 函数返回 Promise 实例的原型，验证是否为 Promise.prototype
export function Fn123_testGetPrototypeOfAsyncFuncPromise() {
    const asyncFunc = async () => {
    };
    const promise = asyncFunc();
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点126：获取 DataView 实例 getUint8 方法的原型，验证是否为 Function.prototype
export function Fn126_testGetPrototypeOfDataViewMethod() {
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    return Object.getPrototypeOf(dataView.getUint8) === Function.prototype;
}

// 测试点127：获取 TypedArray 实例 set 方法的原型，验证是否为 Function.prototype
export function Fn127_testGetPrototypeOfTypedArraySetMethod() {
    const uint8Arr = new Uint8Array(4);
    return Object.getPrototypeOf(uint8Arr.set) === Function.prototype;
}

// 测试点129：获取通过 Object.create 复制原型的对象原型，验证与原原型一致
export function Fn129_testGetPrototypeOfCopiedProtoObject() {
    const originalProto = { foo: "bar" };
    const obj = Object.create(originalProto);
    const copiedObj = Object.create(Object.getPrototypeOf(obj));
    return Object.getPrototypeOf(copiedObj) === originalProto;
}

// 测试点130：获取空数组（无元素）的原型，验证是否为 Array.prototype
export function Fn130_testGetPrototypeOfEmptyArray() {
    const emptyArr = [];
    return Object.getPrototypeOf(emptyArr) === Array.prototype;
}

// 测试点131：获取包含嵌套对象的对象原型，验证是否为 Object.prototype
export function Fn131_testGetPrototypeOfObjectWithNestedObj() {
    const obj = { nested: { key: "val" } };
    return Object.getPrototypeOf(obj) === Object.prototype;
}

// 测试点132：获取包含数组的对象原型，验证是否为 Object.prototype
export function Fn132_testGetPrototypeOfObjectWithArray() {
    const obj = { list: [1, 2, 3] };
    return Object.getPrototypeOf(obj) === Object.prototype;
}

// 测试点133：获取 RegExp 实例 exec 方法返回结果的原型，验证是否为 Array.prototype
export function Fn133_testGetPrototypeOfRegExpExecResult() {
    const reg = /test/;
    const result = reg.exec("test string");
    return Object.getPrototypeOf(result) === Array.prototype;
}

// 测试点134：获取 Date 实例 getTime 方法返回值的原型（数字），验证是否为 Number.prototype
export function Fn134_testGetPrototypeOfDateGetTimeResult() {
    const date = new Date();
    const time = date.getTime();
    return Object.getPrototypeOf(time) === Number.prototype;
}

// 测试点135：获取 Map 实例 get 方法返回值（对象类型）的原型，验证是否为 Object.prototype
export function Fn135_testGetPrototypeOfMapGetResult() {
    const map = new Map();
    const valueObj = { key: "val" };
    map.set("key", valueObj);
    const result = map.get("key");
    return Object.getPrototypeOf(result) === Object.prototype;
}

// 测试点136：获取 Set 实例 has 方法返回值（布尔值）的原型，验证是否为 Boolean.prototype
export function Fn136_testGetPrototypeOfSetHasResult() {
    const set = new Set([1]);
    const result = set.has(1);
    return Object.getPrototypeOf(result) === Boolean.prototype;
}

// 测试点137：获取自定义错误类实例的原型，验证是否为自定义错误类 prototype
export function Fn137_testGetPrototypeOfCustomErrorInstance() {
    class CustomError extends Error {
    }

    const error = new CustomError("test");
    return Object.getPrototypeOf(error) === CustomError.prototype;
}

// 测试点138：验证自定义错误类 prototype 的原型是否为 Error.prototype
export function Fn138_testGetPrototypeOfCustomErrorPrototype() {
    class CustomError extends Error {
    }

    return Object.getPrototypeOf(CustomError.prototype) === Error.prototype;
}

// 测试点142：获取 ArrayBuffer 实例 byteLength 属性值（数字）的原型，验证是否为 Number.prototype
export function Fn142_testGetPrototypeOfArrayBufferByteLength() {
    const buffer = new ArrayBuffer(8);
    const byteLength = buffer.byteLength;
    return Object.getPrototypeOf(byteLength) === Number.prototype;
}

// 测试点143：获取通过 Object.freeze 冻结对象的原型，验证是否为原原型
export function Fn143_testGetPrototypeOfFrozenObject() {
    const obj = {};
    Object.freeze(obj);
    return Object.getPrototypeOf(obj) === Object.prototype;
}

// 测试点144：获取通过 Object.seal 密封对象的原型，验证是否为原原型
export function Fn144_testGetPrototypeOfSealedObject() {
    const obj = {};
    Object.seal(obj);
    return Object.getPrototypeOf(obj) === Object.prototype;
}

// 测试点145：获取通过 Object.preventExtensions 限制扩展对象的原型，验证是否为原原型
export function Fn145_testGetPrototypeOfNonExtensibleObject() {
    const obj = {};
    Object.preventExtensions(obj);
    return Object.getPrototypeOf(obj) === Object.prototype;
}

// 测试点146：获取 Generator 实例 next 方法返回对象的原型，验证是否为 Object.prototype
export function Fn146_testGetPrototypeOfGeneratorNextResult() {

    function* genFunc() {
        yield 1;
    }

    const gen = genFunc();
    const result = gen.next();
    return Object.getPrototypeOf(result) === Object.prototype;
}

// 测试点147：获取 AsyncGenerator 实例 next 方法返回 Promise 的原型，验证是否为 Promise.prototype
export function Fn147_testGetPrototypeOfAsyncGeneratorNextPromise() {

    async function* asyncGenFunc() {
        yield 1;
    }

    const asyncGen = asyncGenFunc();
    const promise = asyncGen.next();
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点148：获取字符串 trim 方法返回新字符串的原型，验证是否为 String.prototype
export function Fn148_testGetPrototypeOfTrimmedString() {
    const str = "  test  ";
    const trimmedStr = str.trim();
    return Object.getPrototypeOf(trimmedStr) === String.prototype;
}

// 测试点149：获取数字 toFixed 方法返回字符串的原型，验证是否为 String.prototype
export function Fn149_testGetPrototypeOfToFixedResult() {
    const num = 123.456;
    const fixedStr = num.toFixed(2);
    return Object.getPrototypeOf(fixedStr) === String.prototype;
}

// 测试点150：获取 Symbol 实例 description 属性值（字符串）的原型，验证是否为 String.prototype
export function Fn150_testGetPrototypeOfSymbolDescription() {
    const sym = Symbol("test desc");
    const desc = sym.description;
    return Object.getPrototypeOf(desc) === String.prototype;
}

// 测试点151：获取 BigInt 实例 toString 方法返回字符串的原型，验证是否为 String.prototype
export function Fn151_testGetPrototypeOfBigIntToStringResult() {
    const bigInt = 456n;
    const str = bigInt.toString();
    return Object.getPrototypeOf(str) === String.prototype;
}

// 测试点152：获取 Array 实例 concat 方法返回新数组的原型，验证是否为 Array.prototype
export function Fn152_testGetPrototypeOfConcatenatedArray() {
    const arr1 = [1, 2];
    const arr2 = [3, 4];
    const concatArr = arr1.concat(arr2);
    return Object.getPrototypeOf(concatArr) === Array.prototype;
}

// 测试点153：获取 Object.assign 多源合并对象的原型，验证是否为 Object.prototype
export function Fn153_testGetPrototypeOfMultiSourceAssignedObject() {
    const source1 = { a: 1 };
    const source2 = { b: 2 };
    const mergedObj = Object.assign({}, source1, source2);
    return Object.getPrototypeOf(mergedObj) === Object.prototype;
}

// 测试点154：获取 Promise.prototype.then 返回新 Promise 的原型，验证是否为 Promise.prototype
export function Fn154_testGetPrototypeOfPromiseThenResult() {
    const promise = Promise.resolve().then(() => {
    });
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点155：获取 Promise.prototype.catch 返回新 Promise 的原型，验证是否为 Promise.prototype
export function Fn155_testGetPrototypeOfPromiseCatchResult() {
    const promise = Promise.reject().catch(() => {
    });
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点156：获取 Promise.prototype.finally 返回新 Promise 的原型，验证是否为 Promise.prototype
export function Fn156_testGetPrototypeOfPromiseFinallyResult() {
    const promise = Promise.resolve().finally(() => {
    });
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点157：获取 TypedArray 实例 subarray 方法返回新 TypedArray 的原型，验证是否为对应 TypedArray.prototype
export function Fn157_testGetPrototypeOfTypedArraySubarray() {
    const uint8Arr = new Uint8Array([1, 2, 3, 4]);
    const subArr = uint8Arr.subarray(1, 3);
    return Object.getPrototypeOf(subArr) === Uint8Array.prototype;
}

// 测试点158：获取 DataView 实例 setInt16 方法的原型，验证是否为 Function.prototype
export function Fn158_testGetPrototypeOfDataViewSetMethod() {
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    return Object.getPrototypeOf(dataView.setInt16) === Function.prototype;
}

// 测试点163：获取自定义类静态属性的原型（对象类型），验证是否为 Object.prototype
export function Fn163_testGetPrototypeOfClassStaticProperty() {
    class TestClass {
        static staticProp = { x: 10 };
    }

    return Object.getPrototypeOf(TestClass.staticProp) === Object.prototype;
}

// 测试点164：获取类实例属性的原型（数组类型），验证是否为 Array.prototype
export function Fn164_testGetPrototypeOfClassInstanceArrayProperty() {
    class TestClass {
        constructor() {
            this.instanceArr = [1, 2];
        }
    }

    const instance = new TestClass();
    return Object.getPrototypeOf(instance.instanceArr) === Array.prototype;
}

// 测试点165：获取 Proxy 代理自定义类实例的原型，验证是否为类 prototype
export function Fn165_testGetPrototypeOfProxyCustomClassInstance() {
    class TestClass {
    }

    const target = new TestClass();
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === TestClass.prototype;
}

// 测试点166：获取 Error 实例 stack 属性值（字符串）的原型，验证是否为 String.prototype
export function Fn166_testGetPrototypeOfErrorStack() {
    const error = new Error("test");
    const stack = error.stack;
    return Object.getPrototypeOf(stack) === String.prototype;
}

// 测试点167：获取 Date 实例 toLocaleDateString 方法返回字符串的原型，验证是否为 String.prototype
export function Fn167_testGetPrototypeOfDateLocaleString() {
    const date = new Date();
    const localeStr = date.toLocaleDateString();
    return Object.getPrototypeOf(localeStr) === String.prototype;
}

// 测试点168：获取 Map 实例 values 方法返回迭代器的原型，验证是否为 Map Iterator.prototype
export function Fn168_testGetPrototypeOfMapValuesIterator() {
    const map = new Map();
    const iterator = map.values();
    return Object.getPrototypeOf(iterator).name === "Map Iterator";
}

// 测试点169：获取 Set 实例 values 方法返回迭代器的原型，验证是否为 Set Iterator.prototype
export function Fn169_testGetPrototypeOfSetValuesIterator() {
    const set = new Set();
    const iterator = set.values();
    return Object.getPrototypeOf(iterator).name === "Set Iterator";
}

// 测试点170：获取 Array 实例 keys 方法返回迭代器的原型，验证是否为 Array Iterator.prototype
export function Fn170_testGetPrototypeOfArrayKeysIterator() {
    const arr = [1, 2, 3];
    const iterator = arr.keys();
    return Object.getPrototypeOf(iterator).name === "Array Iterator";
}

// 测试点171：获取 Symbol 实例 toString 方法返回字符串的原型，验证是否为 String.prototype
export function Fn171_testGetPrototypeOfSymbolToStringResult() {
    const sym = Symbol("test");
    const str = sym.toString();
    return Object.getPrototypeOf(str) === String.prototype;
}

// 测试点172：获取 Boolean 实例 valueOf 方法返回布尔值的原型，验证是否为 Boolean.prototype
export function Fn172_testGetPrototypeOfBooleanValueOfResult() {
    const boolObj = new Boolean(false);
    const bool = boolObj.valueOf();
    return Object.getPrototypeOf(bool) === Boolean.prototype;
}

// 测试点173：获取 Number 实例 valueOf 方法返回数字的原型，验证是否为 Number.prototype
export function Fn173_testGetPrototypeOfNumberValueOfResult() {
    const numObj = new Number(789);
    const num = numObj.valueOf();
    return Object.getPrototypeOf(num) === Number.prototype;
}

// 测试点174：获取 String 实例 valueOf 方法返回字符串的原型，验证是否为 String.prototype
export function Fn174_testGetPrototypeOfStringValueOfResult() {
    const strObj = new String("test");
    const str = strObj.valueOf();
    return Object.getPrototypeOf(str) === String.prototype;
}

// 测试点175：获取通过 Object.create 继承多层原型的对象的中层原型，验证正确性
export function Fn175_testGetMiddlePrototypeOfNestedInheritance() {
    const topProto = { a: 1 };
    const midProto = Object.create(topProto);
    const lowProto = Object.create(midProto);
    const obj = Object.create(lowProto);
    return Object.getPrototypeOf(obj) === lowProto && Object.getPrototypeOf(lowProto) === midProto;
}

// 测试点176：获取 AsyncFunction 实例 call 方法的原型，验证是否为 Function.prototype
export function Fn176_testGetPrototypeOfAsyncFunctionCallMethod() {
    const asyncFunc = async () => {
    };
    return Object.getPrototypeOf(asyncFunc.call) === Function.prototype;
}

// 测试点177：获取 AsyncGenerator 实例 return 方法返回 Promise 的原型，验证是否为 Promise.prototype
export function Fn177_testGetPrototypeOfAsyncGeneratorReturnPromise() {

    async function* asyncGenFunc() {
    }

    const asyncGen = asyncGenFunc();
    const promise = asyncGen.return();
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点180：获取 ArrayBuffer 实例 slice 方法返回新 ArrayBuffer 的原型，验证是否为 ArrayBuffer.prototype
export function Fn180_testGetPrototypeOfArrayBufferSlice() {
    const buffer = new ArrayBuffer(16);
    const slicedBuffer = buffer.slice(4, 12);
    return Object.getPrototypeOf(slicedBuffer) === ArrayBuffer.prototype;
}

// 测试点181：获取 TypedArray（Int8Array）实例 slice 方法返回新数组的原型，验证是否为 Int8Array.prototype
export function Fn181_testGetPrototypeOfInt8ArraySlice() {
    const int8Arr = new Int8Array([10, 20, 30]);
    const slicedArr = int8Arr.slice(1);
    return Object.getPrototypeOf(slicedArr) === Int8Array.prototype;
}

// 测试点183：获取 Promise.allSettled 返回 Promise 实例的原型，验证是否为 Promise.prototype
export function Fn183_testGetPrototypeOfPromiseAllSettledResult() {
    const promise = Promise.allSettled([Promise.resolve(1), Promise.reject(2)]);
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点184：获取自定义类继承 Error 后的实例原型，验证是否为自定义类 prototype
export function Fn184_testGetPrototypeOfCustomErrorInherited() {
    class MyError extends Error {
        constructor() {
            super("MyError");
        }
    }

    const error = new MyError();
    return Object.getPrototypeOf(error) === MyError.prototype;
}

// 测试点185：获取 Map 实例 clear 方法的原型，验证是否为 Function.prototype
export function Fn185_testGetPrototypeOfMapClearMethod() {
    const map = new Map();
    return Object.getPrototypeOf(map.clear) === Function.prototype;
}

// 测试点186：获取 Set 实例 delete 方法的原型，验证是否为 Function.prototype
export function Fn186_testGetPrototypeOfSetDeleteMethod() {
    const set = new Set();
    return Object.getPrototypeOf(set.delete) === Function.prototype;
}

// 测试点187：获取 Array 实例 filter 方法返回新数组的原型，验证是否为 Array.prototype
export function Fn187_testGetPrototypeOfFilteredArray() {
    const arr = [1, 2, 3, 4];
    const filteredArr = arr.filter(item => item % 2 === 0);
    return Object.getPrototypeOf(filteredArr) === Array.prototype;
}

// 测试点188：获取 Array 实例 reduce 方法返回对象的原型，验证是否为 Object.prototype
export function Fn188_testGetPrototypeOfReduceResultObject() {
    const arr = [1, 2, 3];
    const resultObj = arr.reduce((acc, curr) => ({ ...acc, [curr]: curr }), {});
    return Object.getPrototypeOf(resultObj) === Object.prototype;
}

// 测试点189：获取 AsyncGenerator 实例 throw 方法返回 Promise 的原型，验证是否为 Promise.prototype
export function Fn189_testGetPrototypeOfAsyncGeneratorThrowPromise() {

    async function* asyncGenFunc() {
    }

    const asyncGen = asyncGenFunc();
    const promise = asyncGen.throw(new Error("test"));
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点195：获取 TypedArray（Uint32Array）实例 map 方法返回新数组的原型，验证是否为 Uint32Array.prototype
export function Fn195_testGetPrototypeOfUint32ArrayMap() {
    const uint32Arr = new Uint32Array([1, 2, 3]);
    const mappedArr = uint32Arr.map(item => item * 2);
    return Object.getPrototypeOf(mappedArr) === Uint32Array.prototype;
}

// 测试点196：获取 DataView 实例 getFloat32 方法的原型，验证是否为 Function.prototype
export function Fn196_testGetPrototypeOfDataViewGetFloat32Method() {
    const buffer = new ArrayBuffer(16);
    const dataView = new DataView(buffer);
    return Object.getPrototypeOf(dataView.getFloat32) === Function.prototype;
}

// 测试点197：获取 Proxy 代理 Map 实例的原型，验证是否为 Map.prototype
export function Fn197_testGetPrototypeOfProxyMap() {
    const target = new Map();
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === Map.prototype;
}

// 测试点198：获取 Proxy 代理 Set 实例的原型，验证是否为 Set.prototype
export function Fn198_testGetPrototypeOfProxySet() {
    const target = new Set();
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === Set.prototype;
}

// 测试点199：获取自定义迭代器 next 方法返回对象的原型，验证是否为 Object.prototype
export function Fn199_testGetPrototypeOfCustomIteratorNextResult() {
    const iterator = { next: () => ({ done: false, value: 1 }) };
    const result = iterator.next();
    return Object.getPrototypeOf(result) === Object.prototype;
}

// 测试点200：获取 Generator 实例 throw 方法返回对象的原型，验证是否为 Object.prototype
export function Fn200_testGetPrototypeOfGeneratorThrowResult() {

    function* genFunc() {
        yield;
    }

    const gen = genFunc();
    gen.next(); // 先执行一次以进入生成器内部
    const result = gen.throw(new Error("test"));
    return Object.getPrototypeOf(result) === Object.prototype;
}

// 测试点201：获取 Array 实例 find 方法返回对象的原型，验证是否为 Object.prototype
export function Fn201_testGetPrototypeOfArrayFindResultObject() {
    const arr = [{ id: 1 }, { id: 2 }];
    const foundObj = arr.find(item => item.id === 1);
    return Object.getPrototypeOf(foundObj) === Object.prototype;
}

// 测试点202：获取 String 实例 match 方法返回数组的原型，验证是否为 Array.prototype
export function Fn202_testGetPrototypeOfStringMatchResult() {
    const str = "hello world";
    const matchArr = str.match(/hello/);
    return Object.getPrototypeOf(matchArr) === Array.prototype;
}

// 测试点203：获取 String 实例 replace 方法返回新字符串的原型，验证是否为 String.prototype
export function Fn203_testGetPrototypeOfStringReplaceResult() {
    const str = "test string";
    const replacedStr = str.replace("test", "demo");
    return Object.getPrototypeOf(replacedStr) === String.prototype;
}

// 测试点204：获取 Number 实例 toExponential 方法返回字符串的原型，验证是否为 String.prototype
export function Fn204_testGetPrototypeOfNumberToExponentialResult() {
    const num = 12345;
    const expStr = num.toExponential(2);
    return Object.getPrototypeOf(expStr) === String.prototype;
}

// 测试点205：获取 BigInt 实例 toLocaleString 方法返回字符串的原型，验证是否为 String.prototype
export function Fn205_testGetPrototypeOfBigIntToLocaleStringResult() {
    const bigInt = 123456789n;
    const localeStr = bigInt.toLocaleString();
    return Object.getPrototypeOf(localeStr) === String.prototype;
}

// 测试点206：获取通过 Object.create 继承 null 原型的对象的原型，验证是否为 null
export function Fn206_testGetPrototypeOfObjectCreateNullInherit() {
    const obj = Object.create(Object.create(null));
    return Object.getPrototypeOf(obj) === Object.create(null) &&
        Object.getPrototypeOf(Object.getPrototypeOf(obj)) === null;
}

// 测试点209：获取类实例原型上自定义方法的原型，验证是否为 Function.prototype
export function Fn209_testGetPrototypeOfClassInstanceCustomMethod() {
    class TestClass {
        customMethod() {
        }
    }

    const instance = new TestClass();
    return Object.getPrototypeOf(instance.customMethod) === Function.prototype;
}

// 测试点210：获取类静态方法 call 方法的原型，验证是否为 Function.prototype
export function Fn210_testGetPrototypeOfClassStaticMethodCall() {
    class TestClass {
        static staticMethod() {
        }
    }

    return Object.getPrototypeOf(TestClass.staticMethod.call) === Function.prototype;
}

// 测试点211：获取 TypedArray（Float32Array）实例 slice 方法返回新数组的原型，验证是否为 Float32Array.prototype
export function Fn211_testGetPrototypeOfFloat32ArraySlice() {
    const float32Arr = new Float32Array([1.1, 2.2, 3.3]);
    const slicedArr = float32Arr.slice(1);
    return Object.getPrototypeOf(slicedArr) === Float32Array.prototype;
}

// 测试点213：获取 Promise.any 返回 Promise 实例的原型，验证是否为 Promise.prototype
export function Fn213_testGetPrototypeOfPromiseAnyResult() {
    const promise = Promise.any([Promise.reject(), Promise.resolve(1)]);
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点214：获取自定义类继承 Map 后的实例原型，验证是否为自定义类 prototype
export function Fn214_testGetPrototypeOfCustomMapInherited() {
    class MyMap extends Map {
        constructor() {
            super();
        }
    }

    const myMap = new MyMap();
    return Object.getPrototypeOf(myMap) === MyMap.prototype;
}

// 测试点215：获取 WeakMap 实例 delete 方法的原型，验证是否为 Function.prototype
export function Fn215_testGetPrototypeOfWeakMapDeleteMethod() {
    const weakMap = new WeakMap();
    const key = {};
    weakMap.set(key, 1);
    return Object.getPrototypeOf(weakMap.delete) === Function.prototype;
}

// 测试点216：获取 WeakSet 实例 has 方法的原型，验证是否为 Function.prototype
export function Fn216_testGetPrototypeOfWeakSetHasMethod() {
    const weakSet = new WeakSet();
    const key = {};
    weakSet.add(key);
    return Object.getPrototypeOf(weakSet.has) === Function.prototype;
}

// 测试点217：获取 Array 实例 every 方法返回布尔值的原型，验证是否为 Boolean.prototype
export function Fn217_testGetPrototypeOfArrayEveryResult() {
    const arr = [2, 4, 6];
    const result = arr.every(item => item % 2 === 0);
    return Object.getPrototypeOf(result) === Boolean.prototype;
}

// 测试点218：获取 Array 实例 some 方法返回布尔值的原型，验证是否为 Boolean.prototype
export function Fn218_testGetPrototypeOfArraySomeResult() {
    const arr = [1, 3, 4];
    const result = arr.some(item => item % 2 === 0);
    return Object.getPrototypeOf(result) === Boolean.prototype;
}

// 测试点219：获取 AsyncGenerator 实例 return 方法返回 Promise 的原型（重复验证场景），验证是否为 Promise.prototype
export function Fn219_testGetPrototypeOfAsyncGeneratorReturnPromiseAgain() {

    async function* asyncGenFunc() {
        yield 10;
    }

    const asyncGen = asyncGenFunc();
    const promise = asyncGen.return(20);
    return Object.getPrototypeOf(promise) === Promise.prototype;
}

// 测试点224：获取 TypedArray（BigInt64Array）实例 filter 方法返回新数组的原型，验证是否为 BigInt64Array.prototype
export function Fn224_testGetPrototypeOfBigInt64ArrayFilter() {
    const bigInt64Arr = new BigInt64Array([10n, 20n, 30n]);
    const filteredArr = bigInt64Arr.filter(item => item > 15n);
    return Object.getPrototypeOf(filteredArr) === BigInt64Array.prototype;
}

// 测试点225：获取 DataView 实例 setFloat64 方法的原型，验证是否为 Function.prototype
export function Fn225_testGetPrototypeOfDataViewSetFloat64Method() {
    const buffer = new ArrayBuffer(16);
    const dataView = new DataView(buffer);
    return Object.getPrototypeOf(dataView.setFloat64) === Function.prototype;
}

// 测试点226：获取 Proxy 代理 WeakMap 实例的原型，验证是否为 WeakMap.prototype
export function Fn226_testGetPrototypeOfProxyWeakMap() {
    const target = new WeakMap();
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === WeakMap.prototype;
}

// 测试点227：获取 Proxy 代理 WeakSet 实例的原型，验证是否为 WeakSet.prototype
export function Fn227_testGetPrototypeOfProxyWeakSet() {
    const target = new WeakSet();
    const proxy = new Proxy(target, {});
    return Object.getPrototypeOf(proxy) === WeakSet.prototype;
}

// 测试点228：获取自定义迭代器 [Symbol.iterator] 方法的原型，验证是否为 Function.prototype
export function Fn228_testGetPrototypeOfCustomIteratorSymbolMethod() {
    const iterator = {
        [Symbol.iterator]() {
            return this;
        },
        next: () => ({ done: true })
    };
    return Object.getPrototypeOf(iterator[Symbol.iterator]) === Function.prototype;
}

// 测试点229：获取 Generator 实例 return 方法返回对象的原型，验证是否为 Object.prototype
export function Fn229_testGetPrototypeOfGeneratorReturnResult() {

    function* genFunc() {
        yield 5;
    }

    const gen = genFunc();
    const result = gen.return(10);
    return Object.getPrototypeOf(result) === Object.prototype;
}

// 测试点230：获取 Array 实例 findIndex 方法返回数字的原型，验证是否为 Number.prototype
export function Fn230_testGetPrototypeOfArrayFindIndexResult() {
    const arr = [5, 10, 15];
    const index = arr.findIndex(item => item === 10);
    return Object.getPrototypeOf(index) === Number.prototype;
}

// 测试点231：获取 String 实例 split 方法返回数组（空分隔符）的原型，验证是否为 Array.prototype
export function Fn231_testGetPrototypeOfStringSplitEmptySeparator() {
    const str = "abc";
    const splitArr = str.split("");
    return Object.getPrototypeOf(splitArr) === Array.prototype;
}

// 测试点232：获取 String 实例 toUpperCase 方法返回新字符串的原型，验证是否为 String.prototype
export function Fn232_testGetPrototypeOfStringToUpperCaseResult() {
    const str = "hello";
    const upperStr = str.toUpperCase();
    return Object.getPrototypeOf(upperStr) === String.prototype;
}

// 测试点233：获取 Number 实例 toPrecision 方法返回字符串的原型，验证是否为 String.prototype
export function Fn233_testGetPrototypeOfNumberToPrecisionResult() {
    const num = 123.456;
    const precStr = num.toPrecision(4);
    return Object.getPrototypeOf(precStr) === String.prototype;
}

// 测试点234：获取 BigInt 实例 valueOf 方法返回 BigInt 的原型，验证是否为 BigInt.prototype
export function Fn234_testGetPrototypeOfBigIntValueOfResult() {
    const bigIntObj = Object(987654321n);
    const bigInt = bigIntObj.valueOf();
    return Object.getPrototypeOf(bigInt) === BigInt.prototype;
}

// 测试点235：获取通过 Object.create 继承多层原型（3层）的对象的顶层原型，验证正确性
export function Fn235_testGetTopPrototypeOfThreeLevelInherit() {
    const level1 = { x: 1 };
    const level2 = Object.create(level1);
    const level3 = Object.create(level2);
    const obj = Object.create(level3);
    return Object.getPrototypeOf(Object.getPrototypeOf(Object.getPrototypeOf(obj))) === level1;
}

// 测试点238：获取类实例原型上继承的方法（父类方法）的原型，验证是否为 Function.prototype
export function Fn238_testGetPrototypeOfInheritedClassMethod() {
    class Parent {
        parentMethod() {
        }
    }

    class Child extends Parent {
    }

    const instance = new Child();
    return Object.getPrototypeOf(instance.parentMethod) === Function.prototype;
}

// 测试点239：获取类静态方法 apply 方法的原型，验证是否为 Function.prototype
export function Fn239_testGetPrototypeOfClassStaticMethodApply() {
    class TestClass {
        static staticMethod() {
        }
    }

    return Object.getPrototypeOf(TestClass.staticMethod.apply) === Function.prototype;
}

// 测试点240：获取 Object.prototype.hasOwnProperty 方法的原型，验证是否为 Function.prototype
export function Fn240_testGetPrototypeOfObjectHasOwnPropertyMethod() {
    const hasOwnProperty = Object.prototype.hasOwnProperty;
    return Object.getPrototypeOf(hasOwnProperty) === Function.prototype;
}

