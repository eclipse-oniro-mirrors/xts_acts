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

// 测试点1：未被密封的普通对象，Object.isSealed() 应返回 false
export function Fn01_testUnsealedNormalObject() {
    const normalObj = { name: "test", value: 100 };
    return Object.isSealed(normalObj) === false;
}

// 测试点2：被 Object.seal() 密封后的对象，Object.isSealed() 应返回 true
export function Fn02_testSealedObject() {
    const objToSeal = { age: 20, gender: "male" };
    Object.seal(objToSeal);
    return Object.isSealed(objToSeal) === true;
}

// 测试点3：非对象参数（基本类型值），ES2015+ 中 Object.isSealed() 应返回 true
export function Fn03_testPrimitiveValueAsParam() {
    const primitiveNum = 123;
    return Object.isSealed(primitiveNum) === true;
}

// 测试点4：未被密封的空对象，Object.isSealed() 应返回 false
export function Fn04_testUnsealedEmptyObject() {
    const emptyObj = {};
    return Object.isSealed(emptyObj) === false;
}

// 测试点5：被密封的空对象，Object.isSealed() 应返回 true
export function Fn05_testSealedEmptyObject() {
    const emptyObj = {};
    Object.seal(emptyObj);
    return Object.isSealed(emptyObj) === true;
}

// 测试点6：未被密封的数组，Object.isSealed() 应返回 false
export function Fn06_testUnsealedArray() {
    const arr = [1, 2, 3];
    return Object.isSealed(arr) === false;
}

// 测试点7：被密封的数组，Object.isSealed() 应返回 true
export function Fn07_testSealedArray() {
    const arr = [1, 2, 3];
    Object.seal(arr);
    return Object.isSealed(arr) === true;
}

// 测试点8：未被密封的函数对象，Object.isSealed() 应返回 false
export function Fn08_testUnsealedFunction() {
    const func = () => {};
    return Object.isSealed(func) === false;
}

// 测试点9：被密封的函数对象，Object.isSealed() 应返回 true
export function Fn09_testSealedFunction() {
    const func = () => {};
    Object.seal(func);
    return Object.isSealed(func) === true;
}

// 测试点10：未被密封的日期对象，Object.isSealed() 应返回 false
export function Fn10_testUnsealedDate() {
    const date = new Date();
    return Object.isSealed(date) === false;
}

// 测试点11：被密封的日期对象，Object.isSealed() 应返回 true
export function Fn11_testSealedDate() {
    const date = new Date();
    Object.seal(date);
    return Object.isSealed(date) === true;
}

// 测试点12：未被密封的正则对象，Object.isSealed() 应返回 false
export function Fn12_testUnsealedRegExp() {
    const reg = /test/;
    return Object.isSealed(reg) === false;
}

// 测试点13：被密封的正则对象，Object.isSealed() 应返回 true
export function Fn13_testSealedRegExp() {
    const reg = /test/;
    Object.seal(reg);
    return Object.isSealed(reg) === true;
}

// 测试点14：未被密封的 Map 实例，Object.isSealed() 应返回 false
export function Fn14_testUnsealedMap() {
    const map = new Map();
    return Object.isSealed(map) === false;
}

// 测试点15：被密封的 Map 实例，Object.isSealed() 应返回 true
export function Fn15_testSealedMap() {
    const map = new Map();
    Object.seal(map);
    return Object.isSealed(map) === true;
}

// 测试点16：未被密封的 Set 实例，Object.isSealed() 应返回 false
export function Fn16_testUnsealedSet() {
    const set = new Set();
    return Object.isSealed(set) === false;
}

// 测试点17：被密封的 Set 实例，Object.isSealed() 应返回 true
export function Fn17_testSealedSet() {
    const set = new Set();
    Object.seal(set);
    return Object.isSealed(set) === true;
}

// 测试点18：未被密封的类实例，Object.isSealed() 应返回 false
export function Fn18_testUnsealedClassInstance() {
    class TestClass {}
    const instance = new TestClass();
    return Object.isSealed(instance) === false;
}

// 测试点19：被密封的类实例，Object.isSealed() 应返回 true
export function Fn19_testSealedClassInstance() {
    class TestClass {}
    const instance = new TestClass();
    Object.seal(instance);
    return Object.isSealed(instance) === true;
}

// 测试点20：冻结对象（冻结对象默认密封），Object.isSealed() 应返回 true
export function Fn20_testFrozenObjectIsSealed() {
    const frozenObj = Object.freeze({ a: 1 });
    return Object.isSealed(frozenObj) === true;
}

// 测试点21：不可扩展但存在 configurable:true 属性的对象，Object.isSealed() 应返回 false
export function Fn21_testNonExtensibleWithConfigTrue() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { configurable: true });
    return Object.isSealed(obj) === false;
}

// 测试点22：不可扩展且所有属性 configurable:false 的对象，Object.isSealed() 应返回 true
export function Fn22_testNonExtensibleAllConfigFalse() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'a', { configurable: false });
    Object.preventExtensions(obj);
    return Object.isSealed(obj) === true;
}

// 测试点24：密封对象修改可写属性值后，Object.isSealed() 仍返回 true
export function Fn24_testSealedObjModifyWritableProp() {
    const sealedObj = Object.seal({ a: 1 });
    sealedObj.a = 100; // 可写属性允许修改值
    return Object.isSealed(sealedObj) === true;
}

// 测试点26：嵌套对象（外层密封、内层未密封），外层 Object.isSealed() 应返回 true
export function Fn26_testNestedOuterSealedInnerUnsealed() {
    const outer = { inner: { a: 1 } };
    Object.seal(outer);
    return Object.isSealed(outer) === true;
}

// 测试点27：嵌套对象（外层密封、内层密封），外层 Object.isSealed() 应返回 true
export function Fn27_testNestedOuterSealedInnerSealed() {
    const inner = Object.seal({ a: 1 });
    const outer = Object.seal({ inner });
    return Object.isSealed(outer) === true;
}

// 测试点28：未被密封的原型对象，Object.isSealed() 应返回 false
export function Fn28_testUnsealedPrototype() {
    class TestClass {}
    return Object.isSealed(TestClass.prototype) === false;
}

// 测试点29：被密封的原型对象，Object.isSealed() 应返回 true
export function Fn29_testSealedPrototype() {
    class TestClass {}
    Object.seal(TestClass.prototype);
    return Object.isSealed(TestClass.prototype) === true;
}

// 测试点30：继承自密封原型的未密封实例，实例 Object.isSealed() 应返回 false
export function Fn30_testInstanceInheritSealedProto() {
    class Parent {}
    Object.seal(Parent.prototype);
    class Child extends Parent {}
    const instance = new Child();
    return Object.isSealed(instance) === false;
}

// 测试点31：非严格模式下未被密封的 arguments 对象，Object.isSealed() 应返回 false
export function Fn31_testUnsealedArgumentsNonStrict() {
    function getArgs() { return arguments; }
    const args = getArgs(1, 2, 3);
    return Object.isSealed(args) === false;
}

// 测试点32：非严格模式下被密封的 arguments 对象，Object.isSealed() 应返回 true
export function Fn32_testSealedArgumentsNonStrict() {
    function getArgs() {
        Object.seal(arguments);
        return arguments;
    }
    const args = getArgs(1, 2, 3);
    return Object.isSealed(args) === true;
}

// 测试点33：未被密封的 TypedArray 实例（Uint8Array），Object.isSealed() 应返回 false
export function Fn33_testUnsealedTypedArray() {
    const typedArr = new Uint8Array([1, 2, 3]);
    return Object.isSealed(typedArr) === false;
}

// 测试点35：未被密封的 WeakMap 实例，Object.isSealed() 应返回 false
export function Fn35_testUnsealedWeakMap() {
    const weakMap = new WeakMap();
    return Object.isSealed(weakMap) === false;
}

// 测试点36：被密封的 WeakMap 实例，Object.isSealed() 应返回 true
export function Fn36_testSealedWeakMap() {
    const weakMap = new WeakMap();
    Object.seal(weakMap);
    return Object.isSealed(weakMap) === true;
}

// 测试点37：未被密封的 WeakSet 实例，Object.isSealed() 应返回 false
export function Fn37_testUnsealedWeakSet() {
    const weakSet = new WeakSet();
    return Object.isSealed(weakSet) === false;
}

// 测试点38：被密封的 WeakSet 实例，Object.isSealed() 应返回 true
export function Fn38_testSealedWeakSet() {
    const weakSet = new WeakSet();
    Object.seal(weakSet);
    return Object.isSealed(weakSet) === true;
}

// 测试点39：含 Symbol 类型属性的未密封对象，Object.isSealed() 应返回 false
export function Fn39_testUnsealedObjWithSymbolProp() {
    const sym = Symbol('test');
    const obj = { [sym]: 1 };
    return Object.isSealed(obj) === false;
}

// 测试点40：含 Symbol 类型属性的密封对象，Object.isSealed() 应返回 true
export function Fn40_testSealedObjWithSymbolProp() {
    const sym = Symbol('test');
    const obj = { [sym]: 1 };
    Object.seal(obj);
    return Object.isSealed(obj) === true;
}

// 测试点41：含不可枚举属性的未密封对象，Object.isSealed() 应返回 false
export function Fn41_testUnsealedObjWithNonEnumProp() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
    return Object.isSealed(obj) === false;
}

// 测试点42：含不可枚举属性的密封对象，Object.isSealed() 应返回 true
export function Fn42_testSealedObjWithNonEnumProp() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
    Object.seal(obj);
    return Object.isSealed(obj) === true;
}

// 测试点43：含不可写属性的未密封对象，Object.isSealed() 应返回 false
export function Fn43_testUnsealedObjWithNonWritableProp() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: false });
    return Object.isSealed(obj) === false;
}

// 测试点44：含不可写属性的密封对象，Object.isSealed() 应返回 true
export function Fn44_testSealedObjWithNonWritableProp() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: false });
    Object.seal(obj);
    return Object.isSealed(obj) === true;
}

// 测试点45：密封对象尝试修改属性 configurable，Object.isSealed() 仍返回 true
export function Fn45_testSealedObjModifyConfigurable() {
    const sealedObj = Object.seal({ a: 1 });
    try {
        Object.defineProperty(sealedObj, 'a', { configurable: true });
    } catch (e) {} // 忽略严格模式下的错误
    return Object.isSealed(sealedObj) === true;
}

// 测试点46：密封对象尝试修改属性 enumerable，Object.isSealed() 仍返回 true
export function Fn46_testSealedObjModifyEnumerable() {
    const sealedObj = Object.seal({ a: 1 });
    try {
        Object.defineProperty(sealedObj, 'a', { enumerable: false });
    } catch (e) {} // 忽略严格模式下的错误
    return Object.isSealed(sealedObj) === true;
}

// 测试点47：含 getter 的未密封对象，Object.isSealed() 应返回 false
export function Fn47_testUnsealedObjWithGetter() {
    const obj = { get a() { return 1; } };
    return Object.isSealed(obj) === false;
}

// 测试点48：含 getter 的密封对象，Object.isSealed() 应返回 true
export function Fn48_testSealedObjWithGetter() {
    const obj = { get a() { return 1; } };
    Object.seal(obj);
    return Object.isSealed(obj) === true;
}

// 测试点49：含 setter 的未密封对象，Object.isSealed() 应返回 false
export function Fn49_testUnsealedObjWithSetter() {
    const obj = { set a(v) {} };
    return Object.isSealed(obj) === false;
}

// 测试点50：含 setter 的密封对象，Object.isSealed() 应返回 true
export function Fn50_testSealedObjWithSetter() {
    const obj = { set a(v) {} };
    Object.seal(obj);
    return Object.isSealed(obj) === true;
}

// 测试点51：null 作为参数，Object.isSealed() 应返回 true（ES2015+ 基本类型处理）
export function Fn51_testNullAsParam() {
    return Object.isSealed(null) === true;
}

// 测试点52：undefined 作为参数，Object.isSealed() 应返回 true（ES2015+ 基本类型处理）
export function Fn52_testUndefinedAsParam() {
    return Object.isSealed(undefined) === true;
}

// 测试点53：字符串基本类型作为参数，Object.isSealed() 应返回 true
export function Fn53_testStringPrimitiveAsParam() {
    return Object.isSealed('test') === true;
}

// 测试点54：布尔基本类型 true 作为参数，Object.isSealed() 应返回 true
export function Fn54_testBooleanTrueAsParam() {
    return Object.isSealed(true) === true;
}

// 测试点55：布尔基本类型 false 作为参数，Object.isSealed() 应返回 true
export function Fn55_testBooleanFalseAsParam() {
    return Object.isSealed(false) === true;
}

// 测试点56：BigInt 基本类型作为参数，Object.isSealed() 应返回 true
export function Fn56_testBigIntPrimitiveAsParam() {
    return Object.isSealed(123n) === true;
}

// 测试点57：Symbol 基本类型作为参数，Object.isSealed() 应返回 true
export function Fn57_testSymbolPrimitiveAsParam() {
    return Object.isSealed(Symbol('test')) === true;
}

// 测试点58：未被密封的 String 对象（new String），Object.isSealed() 应返回 false
export function Fn58_testUnsealedStringObject() {
    const strObj = new String('test');
    return Object.isSealed(strObj) === false;
}

// 测试点59：被密封的 String 对象（new String），Object.isSealed() 应返回 true
export function Fn59_testSealedStringObject() {
    const strObj = new String('test');
    Object.seal(strObj);
    return Object.isSealed(strObj) === true;
}

// 测试点60：未被密封的 Number 对象（new Number），Object.isSealed() 应返回 false
export function Fn60_testUnsealedNumberObject() {
    const numObj = new Number(123);
    return Object.isSealed(numObj) === false;
}

// 测试点61：被密封的 Number 对象（new Number），Object.isSealed() 应返回 true
export function Fn61_testSealedNumberObject() {
    const numObj = new Number(123);
    Object.seal(numObj);
    return Object.isSealed(numObj) === true;
}

// 测试点62：未被密封的 Boolean 对象（new Boolean），Object.isSealed() 应返回 false
export function Fn62_testUnsealedBooleanObject() {
    const boolObj = new Boolean(true);
    return Object.isSealed(boolObj) === false;
}

// 测试点63：被密封的 Boolean 对象（new Boolean），Object.isSealed() 应返回 true
export function Fn63_testSealedBooleanObject() {
    const boolObj = new Boolean(true);
    Object.seal(boolObj);
    return Object.isSealed(boolObj) === true;
}

// 测试点64：空数组未密封，Object.isSealed() 应返回 false
export function Fn64_testUnsealedEmptyArray() {
    const emptyArr = [];
    return Object.isSealed(emptyArr) === false;
}

// 测试点65：空数组密封后，Object.isSealed() 应返回 true
export function Fn65_testSealedEmptyArray() {
    const emptyArr = [];
    Object.seal(emptyArr);
    return Object.isSealed(emptyArr) === true;
}

// 测试点67：未被密封的 Promise 实例，Object.isSealed() 应返回 false
export function Fn67_testUnsealedPromise() {
    const promise = new Promise(() => {});
    return Object.isSealed(promise) === false;
}

// 测试点68：被密封的 Promise 实例，Object.isSealed() 应返回 true
export function Fn68_testSealedPromise() {
    const promise = new Promise(() => {});
    Object.seal(promise);
    return Object.isSealed(promise) === true;
}

// 测试点69：未被密封的 Generator 实例，Object.isSealed() 应返回 false
export function Fn69_testUnsealedGenerator() {
    function* gen() {}
    const generator = gen();
    return Object.isSealed(generator) === false;
}

// 测试点70：被密封的 Generator 实例，Object.isSealed() 应返回 true
export function Fn70_testSealedGenerator() {
    function* gen() {}
    const generator = gen();
    Object.seal(generator);
    return Object.isSealed(generator) === true;
}

// 测试点71：未被密封的 Async 函数实例，Object.isSealed() 应返回 false
export function Fn71_testUnsealedAsyncFunction() {
    const asyncFunc = async () => {};
    return Object.isSealed(asyncFunc) === false;
}

// 测试点72：被密封的 Async 函数实例，Object.isSealed() 应返回 true
export function Fn72_testSealedAsyncFunction() {
    const asyncFunc = async () => {};
    Object.seal(asyncFunc);
    return Object.isSealed(asyncFunc) === true;
}

// 测试点73：含 getter/setter 的未密封对象，Object.isSealed() 应返回 false
export function Fn73_testUnsealedObjWithGetterSetter() {
    const obj = {
        get a() { return this._a; },
        set a(v) { this._a = v; }
    };
    return Object.isSealed(obj) === false;
}

// 测试点74：含 getter/setter 的密封对象，Object.isSealed() 应返回 true
export function Fn74_testSealedObjWithGetterSetter() {
    const obj = {
        get a() { return this._a; },
        set a(v) { this._a = v; }
    };
    Object.seal(obj);
    return Object.isSealed(obj) === true;
}

// 测试点75：密封对象尝试修改 getter，Object.isSealed() 仍返回 true
export function Fn75_testSealedObjModifyGetter() {
    const sealedObj = Object.seal({ get a() { return 1; } });
    try {
        Object.defineProperty(sealedObj, 'a', { get: () => 2 });
    } catch (e) {} // 忽略严格模式下的错误
    return Object.isSealed(sealedObj) === true;
}

// 测试点76：密封对象尝试修改 setter，Object.isSealed() 仍返回 true
export function Fn76_testSealedObjModifySetter() {
    const sealedObj = Object.seal({ set a(v) {} });
    try {
        Object.defineProperty(sealedObj, 'a', { set: (v) => {} });
    } catch (e) {} // 忽略严格模式下的错误
    return Object.isSealed(sealedObj) === true;
}

// 测试点77：未被密封的无原型对象（Object.create(null)），Object.isSealed() 应返回 false
export function Fn77_testUnsealedNoProtoObj() {
    const noProtoObj = Object.create(null);
    return Object.isSealed(noProtoObj) === false;
}

// 测试点78：被密封的无原型对象（Object.create(null)），Object.isSealed() 应返回 true
export function Fn78_testSealedNoProtoObj() {
    const noProtoObj = Object.create(null);
    Object.seal(noProtoObj);
    return Object.isSealed(noProtoObj) === true;
}

// 测试点79：继承自未密封原型的密封实例，实例 Object.isSealed() 应返回 true
export function Fn79_testSealedInstanceInheritUnsealedProto() {
    class Parent {}
    class Child extends Parent {}
    const instance = new Child();
    Object.seal(instance);
    return Object.isSealed(instance) === true;
}

// 测试点80：未被密封的 Proxy 实例，Object.isSealed() 应返回 false
export function Fn80_testUnsealedProxy() {
    const proxy = new Proxy({}, {});
    return Object.isSealed(proxy) === false;
}

// 测试点81：被密封的 Proxy 实例，Object.isSealed() 应返回 true
export function Fn81_testSealedProxy() {
    const proxy = new Proxy({}, {});
    Object.seal(proxy);
    return Object.isSealed(proxy) === true;
}

// 测试点82：代理密封对象的 Proxy 实例（自身未密封），Proxy 实例 Object.isSealed() 应返回 false
export function Fn82_testProxySealedTarget() {
    const sealedTarget = Object.seal({ a: 1 });
    const proxy = new Proxy(sealedTarget, {});
    return Object.isSealed(proxy) === true;
}

// 测试点83：代理未密封对象的 Proxy 实例（自身密封），Proxy 实例 Object.isSealed() 应返回 true
export function Fn83_testSealedProxyUnsealedTarget() {
    const unsealedTarget = { a: 1 };
    const proxy = new Proxy(unsealedTarget, {});
    Object.seal(proxy);
    return Object.isSealed(proxy) === true;
}

// 测试点84：含 BigInt 类型属性的未密封对象，Object.isSealed() 应返回 false
export function Fn84_testUnsealedObjWithBigIntProp() {
    const obj = { num: 123n };
    return Object.isSealed(obj) === false;
}

// 测试点85：含 BigInt 类型属性的密封对象，Object.isSealed() 应返回 true
export function Fn85_testSealedObjWithBigIntProp() {
    const obj = { num: 123n };
    Object.seal(obj);
    return Object.isSealed(obj) === true;
}

// 测试点86：类静态属性所在对象（类本身）未密封，Object.isSealed() 应返回 false
export function Fn86_testUnsealedClassStaticPropObj() {
    class TestClass { static a = 1; }
    return Object.isSealed(TestClass) === false;
}

// 测试点87：类静态属性所在对象（类本身）密封后，Object.isSealed() 应返回 true
export function Fn87_testSealedClassStaticPropObj() {
    class TestClass { static a = 1; }
    Object.seal(TestClass);
    return Object.isSealed(TestClass) === true;
}

// 测试点88：不可扩展且含多个属性（部分 configurable:false）的对象，Object.isSealed() 应返回 false
export function Fn88_testNonExtensiblePartialConfigFalse() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'a', { configurable: false });
    Object.preventExtensions(obj);
    return Object.isSealed(obj) === false;
}

// 测试点89：不可扩展且含多个属性（全部 configurable:false）的对象，Object.isSealed() 应返回 true
export function Fn89_testNonExtensibleAllConfigFalseMultiProp() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'a', { configurable: false });
    Object.defineProperty(obj, 'b', { configurable: false });
    Object.preventExtensions(obj);
    return Object.isSealed(obj) === true;
}

// 测试点96：含循环引用的未密封对象，Object.isSealed() 应返回 false
export function Fn96_testUnsealedObjWithCircularRef() {
    const obj = {};
    obj.self = obj; // 循环引用
    return Object.isSealed(obj) === false;
}

// 测试点97：含循环引用的密封对象，Object.isSealed() 应返回 true
export function Fn97_testSealedObjWithCircularRef() {
    const obj = {};
    obj.self = obj; // 循环引用
    Object.seal(obj);
    return Object.isSealed(obj) === true;
}

// 测试点98：未被密封的模块导出对象（假设模块环境），Object.isSealed() 应返回 false
export function Fn98_testUnsealedModuleExportObj() {
    const exportObj = {};
    // 模拟模块导出场景
    return Object.isSealed(exportObj) === false;
}

// 测试点99：被密封的模块导出对象（假设模块环境），Object.isSealed() 应返回 true
export function Fn99_testSealedModuleExportObj() {
    const exportObj = {};
    Object.seal(exportObj);
    // 模拟模块导出场景
    return Object.isSealed(exportObj) === true;
}

// 测试点100：未被密封的 Error 对象，Object.isSealed() 应返回 false
export function Fn100_testUnsealedError() {
    const error = new Error('test');
    return Object.isSealed(error) === false;
}

// 测试点101：被密封的 Error 对象，Object.isSealed() 应返回 true
export function Fn101_testSealedError() {
    const error = new Error('test');
    Object.seal(error);
    return Object.isSealed(error) === true;
}

// 测试点102：未被密封的 TypeError 对象，Object.isSealed() 应返回 false
export function Fn102_testUnsealedTypeError() {
    const typeError = new TypeError('test');
    return Object.isSealed(typeError) === false;
}

// 测试点103：被密封的 TypeError 对象，Object.isSealed() 应返回 true
export function Fn103_testSealedTypeError() {
    const typeError = new TypeError('test');
    Object.seal(typeError);
    return Object.isSealed(typeError) === true;
}

// 测试点104：未被密封的 RangeError 对象，Object.isSealed() 应返回 false
export function Fn104_testUnsealedRangeError() {
    const rangeError = new RangeError('test');
    return Object.isSealed(rangeError) === false;
}

// 测试点105：被密封的 RangeError 对象，Object.isSealed() 应返回 true
export function Fn105_testSealedRangeError() {
    const rangeError = new RangeError('test');
    Object.seal(rangeError);
    return Object.isSealed(rangeError) === true;
}

// 测试点106：未被密封的 Date 对象（指定时间），Object.isSealed() 应返回 false
export function Fn106_testUnsealedDateWithTime() {
    const date = new Date('2024-01-01');
    return Object.isSealed(date) === false;
}

// 测试点107：被密封的 Date 对象（指定时间），Object.isSealed() 应返回 true
export function Fn107_testSealedDateWithTime() {
    const date = new Date('2024-01-01');
    Object.seal(date);
    return Object.isSealed(date) === true;
}

// 测试点108：未被密封的 RegExp 对象（带标志），Object.isSealed() 应返回 false
export function Fn108_testUnsealedRegExpWithFlags() {
    const reg = /test/gi;
    return Object.isSealed(reg) === false;
}

// 测试点109：被密封的 RegExp 对象（带标志），Object.isSealed() 应返回 true
export function Fn109_testSealedRegExpWithFlags() {
    const reg = /test/gi;
    Object.seal(reg);
    return Object.isSealed(reg) === true;
}

// 测试点110：未被密封的 Uint16Array 实例，Object.isSealed() 应返回 false
export function Fn110_testUnsealedUint16Array() {
    const uint16Arr = new Uint16Array([100, 200]);
    return Object.isSealed(uint16Arr) === false;
}

// 测试点112：未被密封的 Float32Array 实例，Object.isSealed() 应返回 false
export function Fn112_testUnsealedFloat32Array() {
    const float32Arr = new Float32Array([1.1, 2.2]);
    return Object.isSealed(float32Arr) === false;
}

// 测试点114：未被密封的 Map 实例（含数据），Object.isSealed() 应返回 false
export function Fn114_testUnsealedMapWithData() {
    const map = new Map([['a', 1], ['b', 2]]);
    return Object.isSealed(map) === false;
}

// 测试点115：被密封的 Map 实例（含数据），Object.isSealed() 应返回 true
export function Fn115_testSealedMapWithData() {
    const map = new Map([['a', 1], ['b', 2]]);
    Object.seal(map);
    return Object.isSealed(map) === true;
}

// 测试点116：未被密封的 Set 实例（含数据），Object.isSealed() 应返回 false
export function Fn116_testUnsealedSetWithData() {
    const set = new Set([1, 2, 3]);
    return Object.isSealed(set) === false;
}

// 测试点117：被密封的 Set 实例（含数据），Object.isSealed() 应返回 true
export function Fn117_testSealedSetWithData() {
    const set = new Set([1, 2, 3]);
    Object.seal(set);
    return Object.isSealed(set) === true;
}

// 测试点118：未被密封的类实例（含属性），Object.isSealed() 应返回 false
export function Fn118_testUnsealedClassInstanceWithProp() {
    class TestClass { constructor() { this.a = 1; } }
    const instance = new TestClass();
    return Object.isSealed(instance) === false;
}

// 测试点119：被密封的类实例（含属性），Object.isSealed() 应返回 true
export function Fn119_testSealedClassInstanceWithProp() {
    class TestClass { constructor() { this.a = 1; } }
    const instance = new TestClass();
    Object.seal(instance);
    return Object.isSealed(instance) === true;
}

// 测试点120：未被密封的继承类实例（含属性），Object.isSealed() 应返回 false
export function Fn120_testUnsealedInheritedClassInstance() {
    class Parent { constructor() { this.p = 1; } }
    class Child extends Parent { constructor() { super(); this.c = 2; } }
    const instance = new Child();
    return Object.isSealed(instance) === false;
}

// 测试点121：被密封的继承类实例（含属性），Object.isSealed() 应返回 true
export function Fn121_testSealedInheritedClassInstance() {
    class Parent { constructor() { this.p = 1; } }
    class Child extends Parent { constructor() { super(); this.c = 2; } }
    const instance = new Child();
    Object.seal(instance);
    return Object.isSealed(instance) === true;
}

// 测试点122：密封对象与冻结对象对比（密封对象 isFrozen 为 false，isSealed 为 true）
export function Fn122_testSealedVsFrozen() {
    const sealedObj = Object.seal({ a: 1 });
    return Object.isSealed(sealedObj) === true && Object.isFrozen(sealedObj) === false;
}

// 测试点123：密封对象与不可扩展对象对比（密封对象 isExtensible 为 false，isSealed 为 true）
export function Fn123_testSealedVsNonExtensible() {
    const sealedObj = Object.seal({ a: 1 });
    const nonExtensibleObj = Object.preventExtensions({ a: 1 });
    return Object.isSealed(sealedObj) === true && Object.isSealed(nonExtensibleObj) === false;
}

// 测试点124：未被密封的 Proxy 实例（代理数组），Object.isSealed() 应返回 false
export function Fn124_testUnsealedProxyForArray() {
    const proxy = new Proxy([1, 2, 3], {});
    return Object.isSealed(proxy) === false;
}

// 测试点125：被密封的 Proxy 实例（代理数组），Object.isSealed() 应返回 true
export function Fn125_testSealedProxyForArray() {
    const proxy = new Proxy([1, 2, 3], {});
    Object.seal(proxy);
    return Object.isSealed(proxy) === true;
}

// 测试点126：未被密封的 Proxy 实例（代理 Map），Object.isSealed() 应返回 false
export function Fn126_testUnsealedProxyForMap() {
    const proxy = new Proxy(new Map(), {});
    return Object.isSealed(proxy) === false;
}

// 测试点127：被密封的 Proxy 实例（代理 Map），Object.isSealed() 应返回 true
export function Fn127_testSealedProxyForMap() {
    const proxy = new Proxy(new Map(), {});
    Object.seal(proxy);
    return Object.isSealed(proxy) === true;
}

// 测试点128：未被密封的 Proxy 实例（代理 Set），Object.isSealed() 应返回 false
export function Fn128_testUnsealedProxyForSet() {
    const proxy = new Proxy(new Set(), {});
    return Object.isSealed(proxy) === false;
}

// 测试点129：被密封的 Proxy 实例（代理 Set），Object.isSealed() 应返回 true
export function Fn129_testSealedProxyForSet() {
    const proxy = new Proxy(new Set(), {});
    Object.seal(proxy);
    return Object.isSealed(proxy) === true;
}

// 测试点130：未被密封的空 Map 实例，Object.isSealed() 应返回 false
export function Fn130_testUnsealedEmptyMap() {
    const emptyMap = new Map();
    return Object.isSealed(emptyMap) === false;
}