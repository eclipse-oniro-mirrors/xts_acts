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


// 测试点1：基本功能测试 - 验证Object.values()能正确返回对象的所有可枚举属性值
export function Fn01_testBasicFunctionality() {
    const obj = { name: "测试", age: 25, isActive: true };
    const values = Object.values(obj);
    return values.length === 3 &&
    values.includes("测试") &&
    values.includes(25) &&
    values.includes(true);
}

// 测试点2：顺序测试 - 验证返回值的顺序与for...in循环一致（数值属性按数值顺序）
export function Fn02_testPropertyOrder() {
    const obj = { "3": "第三个", "1": "第一个", "2": "第二个", "a": "字母a" };
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify(["第一个", "第二个", "第三个", "字母a"]);
}

// 测试点3：特殊输入测试 - 验证对非对象输入的处理
export function Fn03_testSpecialInputs() {
    const strTest = JSON.stringify(Object.values("abc")) === JSON.stringify(["a", "b", "c"]);
    const numTest = JSON.stringify(Object.values(123)) === JSON.stringify([]);
    let nullTest, undefinedTest;
    try {
        Object.values(null);
        nullTest = false;
    } catch (e) {
        nullTest = e instanceof TypeError;
    }
    try {
        Object.values(undefined);
        undefinedTest = false;
    } catch (e) {
        undefinedTest = e instanceof TypeError;
    }
    return strTest && numTest && nullTest && undefinedTest;
}

// 测试点4：空对象测试 - 验证空对象返回空数组
export function Fn04_testEmptyObject() {
    const obj = {};
    const values = Object.values(obj);
    return values.length === 0 && Array.isArray(values);
}

// 测试点5：单一属性对象 - 验证只有一个属性时的返回值
export function Fn05_testSingleProperty() {
    const obj = { key: "value" };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === "value";
}

// 测试点6：Symbol键属性 - 验证Symbol作为键的属性值是否被正确返回
export function Fn06_testSymbolKeys() {
    const sym = Symbol("test");
    const obj = { [sym]: "symbolValue", regular: "regularValue" };
    const values = Object.values(obj);
    return !values.includes("symbolValue") && values.includes("regularValue");
}

// 测试点7：不可枚举属性 - 验证不可枚举属性是否被忽略
export function Fn07_testNonEnumerable() {
    const obj = { enumerable: "yes" };
    Object.defineProperty(obj, "nonEnumerable", {
        value: "no",
        enumerable: false
    });
    const values = Object.values(obj);
    return values.length === 1 && values[0] === "yes";
}

// 测试点8：数组作为对象 - 验证数组的索引属性值是否被正确返回
export function Fn08_testArrayAsObject() {
    const arr = ["a", "b", "c"];
    const values = Object.values(arr);
    return JSON.stringify(values) === JSON.stringify(["a", "b", "c"]);
}

// 测试点9：类数组对象 - 验证类数组对象的数值索引属性
export function Fn09_testArrayLike() {
    const arrLike = { 0: "x", 1: "y", length: 2 };
    const values = Object.values(arrLike);
    return JSON.stringify(values) === JSON.stringify(["x", "y", 2]);
}

// 测试点10：继承属性 - 验证继承的属性不会被包含
export function Fn10_testInheritedProperties() {
    const parent = { parentProp: "parent" };
    const child = Object.create(parent);
    child.childProp = "child";
    const values = Object.values(child);
    return values.length === 1 && values[0] === "child";
}

// 测试点11：Date对象 - 验证Date对象的可枚举属性
export function Fn11_testDateObject() {
    const date = new Date();
    date.customProp = "test";
    const values = Object.values(date);
    return values.length === 1 && values[0] === "test";
}

// 测试点13：数值与字符串属性混合 - 验证不同类型键的排序
export function Fn13_testMixedKeyTypes() {
    const obj = { 2: "two", "1": "one", b: "bee", a: "ay" };
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify(["one", "two", "bee", "ay"]);
}

// 测试点14：Object.create创建的对象 - 验证指定原型和属性的对象
export function Fn14_testObjectCreate() {
    const obj = Object.create(null, {
        prop1: { value: "val1", enumerable: true },
        prop2: { value: "val2", enumerable: true }
    });
    const values = Object.values(obj);
    return values.length === 2 && values.includes("val1") && values.includes("val2");
}

// 测试点15：带有getter的属性 - 验证getter属性是否被正确求值
export function Fn15_testGetterProperties() {
    const obj = {
        get prop() { return "getterValue"; },
        normal: "normalValue"
    };
    const values = Object.values(obj);
    return values.includes("getterValue") && values.includes("normalValue");
}

// 测试点16：布尔对象 - 验证布尔对象的原始值是否被返回
export function Fn16_testBooleanObject() {
    const boolObj = new Boolean(true);
    boolObj.prop = "test";
    const values = Object.values(boolObj);
    return values.includes("test");
}

// 测试点17：数字对象 - 验证数字对象的属性
export function Fn17_testNumberObject() {
    const numObj = new Number(123);
    numObj.foo = "bar";
    const values = Object.values(numObj);
    return values.length === 1 && values[0] === "bar";
}

// 测试点18：字符串对象 - 验证字符串对象的索引和属性
export function Fn18_testStringObject() {
    const strObj = new String("test");
    strObj.custom = "prop";
    const values = Object.values(strObj);
    return JSON.stringify(values) === JSON.stringify(["t", "e", "s", "t", "prop"]);
}

// 测试点19：Map对象 - 验证Map实例的自定义属性
export function Fn19_testMapObject() {
    const map = new Map();
    map.set("key", "value");
    map.custom = "property";
    const values = Object.values(map);
    return values.length === 1 && values[0] === "property";
}

// 测试点20：Set对象 - 验证Set实例的自定义属性
export function Fn20_testSetObject() {
    const set = new Set();
    set.add("item");
    set.prop = "test";
    const values = Object.values(set);
    return values.length === 1 && values[0] === "test";
}

// 测试点21：冻结对象 - 验证冻结对象的属性值
export function Fn21_testFrozenObject() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify([1, 2]);
}

// 测试点22：密封对象 - 验证密封对象的属性值
export function Fn22_testSealedObject() {
    const obj = { x: "x", y: "y" };
    Object.seal(obj);
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify(["x", "y"]);
}

// 测试点23：扩展对象 - 验证可扩展对象的属性值
export function Fn23_testExtensibleObject() {
    const obj = { p: "p" };
    const isExtensible = Object.isExtensible(obj);
    const values = Object.values(obj);
    return isExtensible && values.length === 1 && values[0] === "p";
}

// 测试点24：包含null值的对象 - 验证null作为属性值
export function Fn24_testNullValues() {
    const obj = { a: null, b: "not null" };
    const values = Object.values(obj);
    return values.includes(null) && values.includes("not null");
}

// 测试点25：包含undefined值的对象 - 验证undefined作为属性值
export function Fn25_testUndefinedValues() {
    const obj = { a: undefined, b: "defined" };
    const values = Object.values(obj);
    return values.includes(undefined) && values.includes("defined");
}

// 测试点26：嵌套对象属性 - 验证嵌套对象作为属性值（非递归）
export function Fn26_testNestedObjects() {
    const nested = { x: 1, y: 2 };
    const obj = { a: nested, b: 3 };
    const values = Object.values(obj);
    return values.length === 2 && values[0] === nested && values[1] === 3;
}

// 测试点27：BigInt属性值 - 验证BigInt类型作为属性值
export function Fn27_testBigIntValues() {
    const obj = { a: 123n, b: "string" };
    const values = Object.values(obj);
    return values[0] === 123n && values[1] === "string";
}

// 测试点28：函数作为属性值 - 验证函数作为属性值
export function Fn28_testFunctionValues() {
    const func = () => "test";
    const obj = { a: func, b: 5 };
    const values = Object.values(obj);
    return values[0] === func && values[1] === 5;
}

// 测试点29：数组作为属性值 - 验证数组作为属性值
export function Fn29_testArrayValues() {
    const arr = [1, 2, 3];
    const obj = { a: arr, b: "text" };
    const values = Object.values(obj);
    return values[0] === arr && values[1] === "text";
}

// 测试点30：正则作为属性值 - 验证正则表达式作为属性值
export function Fn30_testRegExpValues() {
    const regex = /pattern/;
    const obj = { a: regex, b: 42 };
    const values = Object.values(obj);
    return values[0] === regex && values[1] === 42;
}

// 测试点31：日期作为属性值 - 验证日期对象作为属性值
export function Fn31_testDateValues() {
    const date = new Date();
    const obj = { a: date, b: "date" };
    const values = Object.values(obj);
    return values[0] === date && values[1] === "date";
}

// 测试点32：包含Infinity的属性 - 验证Infinity作为属性值
export function Fn32_testInfinityValues() {
    const obj = { a: Infinity, b: -Infinity };
    const values = Object.values(obj);
    return values[0] === Infinity && values[1] === -Infinity;
}

// 测试点33：包含NaN的属性 - 验证NaN作为属性值
export function Fn33_testNaNValues() {
    const obj = { a: NaN, b: "not NaN" };
    const values = Object.values(obj);
    return isNaN(values[0]) && values[1] === "not NaN";
}

// 测试点34：defineProperty定义的可枚举属性 - 验证显式定义的可枚举属性
export function Fn34_testDefinedEnumerable() {
    const obj = {};
    Object.defineProperty(obj, "prop", {
        value: "test",
        enumerable: true
    });
    const values = Object.values(obj);
    return values.length === 1 && values[0] === "test";
}

// 测试点35：数组索引属性 - 验证数组的索引属性顺序
export function Fn35_testArrayIndices() {
    const arr = [];
    arr[3] = "d";
    arr[1] = "b";
    const values = Object.values(arr);
    return JSON.stringify(values) === JSON.stringify(["b", "d"]);
}

// 测试点36：稀疏数组 - 验证稀疏数组的处理
export function Fn36_testSparseArray() {
    const arr = [1, , 3];
    const values = Object.values(arr);
    return JSON.stringify(values) === JSON.stringify([1, 3]);
}

// 测试点37：类数组的length属性 - 验证length属性是否被包含
export function Fn37_testArrayLikeLength() {
    const arrLike = { 0: "a", 1: "b", length: 2 };
    const values = Object.values(arrLike);
    return values.includes(2) && values.includes("a") && values.includes("b");
}

// 测试点38：模拟DOM元素 - 验证DOM元素的属性
export function Fn38_testMockDomElement() {
    const mockDiv = { tagName: "DIV", id: "test", className: "cls" };
    const values = Object.values(mockDiv);
    return values.includes("DIV") && values.includes("test") && values.includes("cls");
}

// 测试点39：循环引用对象 - 验证循环引用是否会导致错误
export function Fn39_testCircularReference() {
    const obj = { a: 1 };
    obj.self = obj;
    try {
        const values = Object.values(obj);
        return values.length === 2 && values[0] === 1 && values[1] === obj;
    } catch (e) {
        return false;
    }
}

// 测试点40：Proxy对象 - 验证Proxy对象的属性值
export function Fn40_testProxyObject() {
    const target = { a: 1, b: 2 };
    const proxy = new Proxy(target, {});
    const values = Object.values(proxy);
    return JSON.stringify(values) === JSON.stringify([1, 2]);
}

// 测试点41：生成器对象 - 验证生成器对象的自定义属性
export function Fn41_testGeneratorObject() {
    function* generator() { yield 1; }
    const gen = generator();
    gen.prop = "test";
    const values = Object.values(gen);
    return values.length === 1 && values[0] === "test";
}

// 测试点42：Promise对象 - 验证Promise的自定义属性
export function Fn42_testPromiseObject() {
    const promise = Promise.resolve();
    promise.test = "value";
    const values = Object.values(promise);
    return values.length === 1 && values[0] === "value";
}

// 测试点43：重复值属性 - 验证包含相同值的多个属性
export function Fn43_testDuplicateValues() {
    const obj = { a: "same", b: "same", c: "different" };
    const values = Object.values(obj);
    return values.length === 3 &&
        values.filter(v => v === "same").length === 2 &&
    values.includes("different");
}

// 测试点44：空字符串属性名 - 验证空字符串作为属性名
export function Fn44_testEmptyStringKey() {
    const obj = { "": "empty", a: "not empty" };
    const values = Object.values(obj);
    return values.includes("empty") && values.includes("not empty");
}

// 测试点45：特殊字符属性名 - 验证包含特殊字符的属性名
export function Fn45_testSpecialCharKeys() {
    const obj = { "a-b": "hyphen", "a@b": "at", "a#b": "hash" };
    const values = Object.values(obj);
    return values.includes("hyphen") && values.includes("at") && values.includes("hash");
}

// 测试点46：数字字符串与数值键 - 验证数字字符串和数值键的区别
export function Fn46_testNumberStringKeys() {
    const obj = { "123": "string key", 123: "number key" };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === "number key";
}

// 测试点47：Symbol.for键 - 验证全局Symbol的处理
export function Fn47_testSymbolForKeys() {
    const sym1 = Symbol.for("test");
    const sym2 = Symbol.for("test");
    const obj = { [sym1]: "value" };
    const values = Object.values(obj);
    return values.length === 0;
}

// 测试点48：原型链可枚举属性 - 验证原型链上的可枚举属性是否被排除
export function Fn48_testPrototypeEnumerable() {
    function Parent() {}
    Parent.prototype.inherited = "value";
    const child = new Parent();
    child.own = "own value";
    const values = Object.values(child);
    return values.length === 1 && values[0] === "own value";
}

// 测试点49：自身与原型同名属性 - 验证自身属性覆盖原型属性
export function Fn49_testOwnVsPrototype() {
    const parent = { prop: "parent" };
    const child = Object.create(parent);
    child.prop = "child";
    const values = Object.values(child);
    return values.length === 1 && values[0] === "child";
}

// 测试点50：修改原型的对象 - 验证修改原型后的值
export function Fn50_testModifiedPrototype() {
    const obj = { a: 1 };
    const newProto = { b: 2 };
    Object.setPrototypeOf(obj, newProto);
    const values = Object.values(obj);
    return values.length === 1 && values[0] === 1;
}

// 测试点51：空数组 - 验证空数组的返回值
export function Fn51_testEmptyArray() {
    const arr = [];
    const values = Object.values(arr);
    return values.length === 0;
}

// 测试点52：单元素数组 - 验证只有一个元素的数组
export function Fn52_testSingleElementArray() {
    const arr = ["only"];
    const values = Object.values(arr);
    return values.length === 1 && values[0] === "only";
}

// 测试点53：多维数组 - 验证多维数组的表层值
export function Fn53_testMultiDimensionalArray() {
    const arr = [1, [2, 3], 4];
    const values = Object.values(arr);
    return JSON.stringify(values) === JSON.stringify([1, [2, 3], 4]);
}

// 测试点54：TypedArray - 验证TypedArray的处理
export function Fn54_testTypedArray() {
    const typedArr = new Uint8Array([1, 2, 3]);
    const values = Object.values(typedArr);
    return JSON.stringify(values) === JSON.stringify([1, 2, 3]);
}

// 测试点55：ArrayBuffer - 验证ArrayBuffer的自定义属性
export function Fn55_testArrayBuffer() {
    const buffer = new ArrayBuffer(16);
    buffer.prop = "test";
    const values = Object.values(buffer);
    return values.length === 1 && values[0] === "test";
}

// 测试点56：DataView - 验证DataView的自定义属性
export function Fn56_testDataView() {
    const buffer = new ArrayBuffer(16);
    const view = new DataView(buffer);
    view.test = "value";
    const values = Object.values(view);
    return values.length === 1 && values[0] === "value";
}

// 测试点57：包含函数的对象 - 验证函数作为属性值的处理
export function Fn57_testObjectWithFunctions() {
    const obj = {
        add: (a, b) => a + b,
        multiply: (a, b) => a * b
    };
    const values = Object.values(obj);
    return values.length === 2 && typeof values[0] === "function" && typeof values[1] === "function";
}

// 测试点58：箭头函数属性 - 验证箭头函数作为属性值
export function Fn58_testArrowFunctionProperties() {
    const obj = { arrow: () => "arrow" };
    const values = Object.values(obj);
    return typeof values[0] === "function" && values[0]() === "arrow";
}

// 测试点59：异步函数属性 - 验证异步函数作为属性值
export function Fn59_testAsyncFunctionProperties() {
    const obj = { async asyncFunc() { return "async"; } };
    const values = Object.values(obj);
    return typeof values[0] === "function";
}

// 测试点60：生成器函数属性 - 验证生成器函数作为属性值
export function Fn60_testGeneratorFunctionProperties() {
    const obj = { *generator() { yield "gen"; } };
    const values = Object.values(obj);
    return typeof values[0] === "function";
}

// 测试点61：类作为属性值 - 验证类作为属性值
export function Fn61_testClassAsProperty() {
    class MyClass {}
    const obj = { cls: MyClass };
    const values = Object.values(obj);
    return values[0] === MyClass;
}

// 测试点62：实例作为属性值 - 验证类实例作为属性值
export function Fn62_testInstanceAsProperty() {
    class MyClass {}
    const instance = new MyClass();
    const obj = { inst: instance };
    const values = Object.values(obj);
    return values[0] === instance;
}

// 测试点63：Error对象作为属性 - 验证Error对象作为属性值
export function Fn63_testErrorAsProperty() {
    const error = new Error("test");
    const obj = { err: error };
    const values = Object.values(obj);
    return values[0] === error && values[0].message === "test";
}

// 测试点64：不可序列化值 - 验证包含不可序列化值的对象
export function Fn64_testNonSerializableValues() {
    const obj = { func: () => {}, date: new Date() };
    const values = Object.values(obj);
    return typeof values[0] === "function" && values[1] instanceof Date;
}

// 测试点65：与Object.keys对应 - 验证values与keys的对应关系
export function Fn65_testKeysValuesCorrespondence() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys = Object.keys(obj);
    const values = Object.values(obj);
    return keys.every((key, index) => obj[key] === values[index]);
}

// 测试点66：值为Symbol类型 - 验证Symbol作为属性值
export function Fn66_testSymbolValues() {
    const sym = Symbol("value");
    const obj = { a: sym, b: "string" };
    const values = Object.values(obj);
    return values[0] === sym && values[1] === "string";
}

// 测试点67：值为null - 验证null作为属性值
export function Fn67_testNullAsValue() {
    const obj = { a: null };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === null;
}

// 测试点68：值为undefined - 验证undefined作为属性值
export function Fn68_testUndefinedAsValue() {
    const obj = { a: undefined };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === undefined;
}

// 测试点69：值为NaN - 验证NaN作为属性值
export function Fn69_testNaNAsValue() {
    const obj = { a: NaN };
    const values = Object.values(obj);
    return values.length === 1 && isNaN(values[0]);
}

// 测试点70：值为Infinity - 验证Infinity作为属性值
export function Fn70_testInfinityAsValue() {
    const obj = { a: Infinity };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === Infinity;
}

// 测试点71：值为负Infinity - 验证负Infinity作为属性值
export function Fn71_testNegativeInfinityAsValue() {
    const obj = { a: -Infinity };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === -Infinity;
}

// 测试点72：大数字属性名 - 验证大数字作为属性名的顺序
export function Fn72_testLargeNumberKeys() {
    const obj = { 100: "hundred", 2: "two", 50: "fifty" };
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify(["two", "fifty", "hundred"]);
}

// 测试点73：小数属性名 - 验证小数作为属性名
export function Fn73_testDecimalNumberKeys() {
    const obj = { 1.5: "one point five", 2.3: "two point three" };
    const values = Object.values(obj);
    return values.includes("one point five") && values.includes("two point three");
}

// 测试点74：科学计数法属性名 - 验证科学计数法表示的数字键
export function Fn74_testScientificNotationKeys() {
    const obj = { 1e3: "thousand", 10: "ten" };
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify(["ten", "thousand"]);
}

// 测试点75：删除属性后 - 验证删除属性后的values
export function Fn75_testAfterDeleteProperty() {
    const obj = { a: 1, b: 2, c: 3 };
    delete obj.b;
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify([1, 3]);
}

// 测试点76：动态添加属性 - 验证动态添加属性后的values
export function Fn76_testDynamicallyAddedProperty() {
    const obj = { a: 1 };
    obj.b = 2;
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify([1, 2]);
}

// 测试点77：删除属性测试 - 验证delete操作后的values
export function Fn77_testDeleteProperty() {
    const obj = { x: "x", y: "y" };
    delete obj.x;
    const values = Object.values(obj);
    return values.length === 1 && values[0] === "y";
}

// 测试点79：密封对象修改属性 - 验证密封对象修改属性
export function Fn79_testSealedModifyProperty() {
    const obj = { a: 1 };
    Object.seal(obj);
    obj.a = 2;
    const values = Object.values(obj);
    return values.length === 1 && values[0] === 2;
}

// 测试点80：扩展对象添加属性 - 验证可扩展对象添加属性
export function Fn80_testExtensibleAddProperty() {
    const obj = { a: 1 };
    obj.b = 2;
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify([1, 2]);
}

// 测试点81：Date实例属性 - 验证包含Date实例的对象
export function Fn81_testDateInstanceProperty() {
    const date = new Date(2023, 0, 1);
    const obj = { event: "New Year", date: date };
    const values = Object.values(obj);
    return values.includes("New Year") && values.includes(date);
}

// 测试点82：RegExp实例属性 - 验证包含RegExp实例的对象
export function Fn82_testRegExpInstanceProperty() {
    const regex = /pattern/gi;
    const obj = { regex: regex, flags: regex.flags };
    const values = Object.values(obj);
    return values.includes(regex) && values.includes("gi");
}

// 测试点83：Map实例属性 - 验证包含Map实例的对象
export function Fn83_testMapInstanceProperty() {
    const map = new Map([["key", "value"]]);
    const obj = { map: map, size: map.size };
    const values = Object.values(obj);
    return values.includes(map) && values.includes(1);
}

// 测试点84：Set实例属性 - 验证包含Set实例的对象
export function Fn84_testSetInstanceProperty() {
    const set = new Set(["item"]);
    const obj = { set: set, hasItem: set.has("item") };
    const values = Object.values(obj);
    return values.includes(set) && values.includes(true);
}

// 测试点85：WeakMap实例属性 - 验证包含WeakMap实例的对象
export function Fn85_testWeakMapInstanceProperty() {
    const weakMap = new WeakMap();
    const objKey = {};
    weakMap.set(objKey, "value");
    const obj = { weakMap: weakMap };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === weakMap;
}

// 测试点86：WeakSet实例属性 - 验证包含WeakSet实例的对象
export function Fn86_testWeakSetInstanceProperty() {
    const weakSet = new WeakSet();
    const objVal = {};
    weakSet.add(objVal);
    const obj = { weakSet: weakSet };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === weakSet;
}

// 测试点87：ArrayBuffer实例属性 - 验证包含ArrayBuffer的对象
export function Fn87_testArrayBufferInstanceProperty() {
    const buffer = new ArrayBuffer(32);
    const obj = { buffer: buffer, byteLength: buffer.byteLength };
    const values = Object.values(obj);
    return values.includes(buffer) && values.includes(32);
}

// 测试点88：Promise实例属性 - 验证包含Promise的对象
export function Fn88_testPromiseInstanceProperty() {
    const promise = Promise.resolve("resolved");
    const obj = { promise: promise };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === promise;
}

// 测试点89：Proxy实例属性 - 验证包含Proxy的对象
export function Fn89_testProxyInstanceProperty() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    const obj = { proxy: proxy, target: target };
    const values = Object.values(obj);
    return values.includes(proxy) && values.includes(target);
}

// 测试点90：Reflect对象属性 - 验证包含Reflect方法的对象
export function Fn90_testReflectProperty() {
    const obj = { has: Reflect.has, ownKeys: Reflect.ownKeys };
    const values = Object.values(obj);
    return values[0] === Reflect.has && values[1] === Reflect.ownKeys;
}

// 测试点91：Math对象属性 - 验证包含Math属性的对象
export function Fn91_testMathProperty() {
    const obj = { pi: Math.PI, e: Math.E };
    const values = Object.values(obj);
    return values[0] === Math.PI && values[1] === Math.E;
}

// 测试点92：JSON对象属性 - 验证包含JSON方法的对象
export function Fn92_testJSONProperty() {
    const obj = { parse: JSON.parse, stringify: JSON.stringify };
    const values = Object.values(obj);
    return values[0] === JSON.parse && values[1] === JSON.stringify;
}

// 测试点93：全局对象属性 - 验证包含全局对象属性的对象
export function Fn93_testGlobalObjectProperty() {
    const obj = { isNaN: isNaN, parseInt: parseInt };
    const values = Object.values(obj);
    return values[0] === isNaN && values[1] === parseInt;
}

// 测试点94：模拟DOM事件 - 验证包含模拟DOM事件的对象
export function Fn94_testMockDomEvent() {
    const event = { type: "click", bubbles: true, cancelable: true };
    const obj = { event: event, target: "button" };
    const values = Object.values(obj);
    return values.includes(event) && values.includes("button");
}

// 测试点98：Arguments对象 - 验证arguments对象的处理
export function Fn98_testArgumentsObject() {
    function testFunc() {
        return Object.values(arguments);
    }
    const values = testFunc("a", "b", "c");
    return JSON.stringify(values) === JSON.stringify(["a", "b", "c"]);
}

// 测试点99：Number.EPSILON属性 - 验证包含Number常量的对象
export function Fn99_testNumberConstants() {
    const obj = { epsilon: Number.EPSILON, max: Number.MAX_VALUE };
    const values = Object.values(obj);
    return values[0] === Number.EPSILON && values[1] === Number.MAX_VALUE;
}

// 测试点100：Symbol属性值 - 验证多个Symbol作为属性值
export function Fn100_testMultipleSymbolValues() {
    const sym1 = Symbol("1");
    const sym2 = Symbol("2");
    const obj = { a: sym1, b: sym2 };
    const values = Object.values(obj);
    return values[0] === sym1 && values[1] === sym2;
}

// 测试点101：Intl对象属性 - 验证包含Intl对象的属性值
export function Fn101_testIntlObject() {
    const formatter = new Intl.DateTimeFormat();
    const obj = { formatter: formatter, type: "date" };
    const values = Object.values(obj);
    return values.includes(formatter) && values.includes("date");
}

// 测试点103：带有私有属性的类 - 验证类的私有属性是否被排除
export function Fn103_testPrivateClassProperties() {
    class TestClass {
        #privateProp = "private";
        publicProp = "public";
    }
    const instance = new TestClass();
    const values = Object.values(instance);
    return values.length === 1 && values[0] === "public";
}

// 测试点104：Object.assign创建的对象 - 验证合并对象的属性值
export function Fn104_testObjectAssign() {
    const obj1 = { a: 1 };
    const obj2 = { b: 2 };
    const merged = Object.assign({}, obj1, obj2);
    const values = Object.values(merged);
    return JSON.stringify(values) === JSON.stringify([1, 2]);
}

// 测试点105：Unicode字符属性名 - 验证Unicode字符作为属性名
export function Fn105_testUnicodePropertyNames() {
    const obj = { "π": "pi", "ñ": "n tilde", "€": "euro" };
    const values = Object.values(obj);
    return values.includes("pi") && values.includes("n tilde") && values.includes("euro");
}

// 测试点106：非常长的属性名 - 验证长属性名的处理
export function Fn106_testLongPropertyNames() {
    const longKey = "a".repeat(1000);
    const obj = { [longKey]: "long value", short: "short" };
    const values = Object.values(obj);
    return values.includes("long value") && values.includes("short");
}

// 测试点107：修改Array.prototype - 验证修改原型后的数组
export function Fn107_testModifiedArrayPrototype() {
    Array.prototype.customMethod = () => {};
    const arr = [1, 2, 3];
    const values = Object.values(arr);
    delete Array.prototype.customMethod;
    return JSON.stringify(values) === JSON.stringify([1, 2, 3]);
}

// 测试点108：ShadowRoot模拟 - 验证模拟ShadowRoot对象
export function Fn108_testShadowRootMock() {
    const shadowMock = { mode: "open", host: "div" };
    const obj = { shadow: shadowMock };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === shadowMock;
}

// 测试点109：Atomics对象属性 - 验证包含Atomics方法的对象
export function Fn109_testAtomicsProperty() {
    const obj = { add: Atomics.add, load: Atomics.load };
    const values = Object.values(obj);
    return values[0] === Atomics.add && values[1] === Atomics.load;
}

// 测试点110：FinalizationRegistry - 验证FinalizationRegistry实例属性
export function Fn110_testFinalizationRegistry() {
    const registry = new FinalizationRegistry(() => {});
    registry.prop = "test";
    const values = Object.values(registry);
    return values.length === 1 && values[0] === "test";
}

// 测试点111：WeakRef对象 - 验证WeakRef实例的属性
export function Fn111_testWeakRefObject() {
    const target = {};
    const weakRef = new WeakRef(target);
    weakRef.test = "value";
    const values = Object.values(weakRef);
    return values.length === 1 && values[0] === "value";
}

// 测试点112：数组的自定义属性 - 验证数组上的非索引属性
export function Fn112_testArrayCustomProperties() {
    const arr = [1, 2, 3];
    arr.custom = "property";
    const values = Object.values(arr);
    return JSON.stringify(values) === JSON.stringify([1, 2, 3, "property"]);
}

// 测试点113：函数的自定义属性 - 验证函数上的自定义属性
export function Fn113_testFunctionCustomProperties() {
    function testFunc() {}
    testFunc.prop1 = "val1";
    testFunc.prop2 = "val2";
    const values = Object.values(testFunc);
    return values.includes("val1") && values.includes("val2");
}

// 测试点114：GeneratorFunction实例 - 验证生成器函数的属性
export function Fn114_testGeneratorFunction() {
    const generator = function* () { yield 1; };
    generator.prop = "gen prop";
    const values = Object.values(generator);
    return values.length === 1 && values[0] === "gen prop";
}

// 测试点115：AsyncFunction实例 - 验证异步函数的属性
export function Fn115_testAsyncFunction() {
    const asyncFunc = async () => {};
    asyncFunc.attr = "async attr";
    const values = Object.values(asyncFunc);
    return values.length === 1 && values[0] === "async attr";
}

// 测试点116：Error子类实例 - 验证Error子类的属性
export function Fn116_testErrorSubclass() {
    const error = new TypeError("type error");
    error.custom = "error prop";
    const values = Object.values(error);
    return values.includes("error prop") && !values.includes("type error");
}

// 测试点118：ArrayBuffer视图 - 验证ArrayBuffer视图的属性
export function Fn118_testArrayBufferViews() {
    const buffer = new ArrayBuffer(16);
    const view = new Uint32Array(buffer);
    view[0] = 0x12345678;
    const obj = { view: view, value: view[0] };
    const values = Object.values(obj);
    return values.includes(view) && values.includes(0x12345678);
}

// 测试点119：Map迭代器 - 验证Map迭代器的属性
export function Fn119_testMapIterator() {
    const map = new Map([["key", "value"]]);
    const iterator = map.entries();
    iterator.prop = "iterator prop";
    const values = Object.values(iterator);
    return values.length === 1 && values[0] === "iterator prop";
}

// 测试点120：Set迭代器 - 验证Set迭代器的属性
export function Fn120_testSetIterator() {
    const set = new Set(["item"]);
    const iterator = set.values();
    iterator.attr = "set iterator";
    const values = Object.values(iterator);
    return values.length === 1 && values[0] === "set iterator";
}

// 测试点121：字符串迭代器 - 验证字符串迭代器的属性
export function Fn121_testStringIterator() {
    const str = "test";
    const iterator = str[Symbol.iterator]();
    iterator.test = "string iter";
    const values = Object.values(iterator);
    return values.length === 1 && values[0] === "string iter";
}

// 测试点122：数组迭代器 - 验证数组迭代器的属性
export function Fn122_testArrayIterator() {
    const arr = [1, 2];
    const iterator = arr[Symbol.iterator]();
    iterator.prop = "array iter";
    const values = Object.values(iterator);
    return values.length === 1 && values[0] === "array iter";
}

// 测试点123：对象原型链多层 - 验证多层原型链的属性
export function Fn123_testMultiLevelPrototype() {
    const grandparent = { g: "grandparent" };
    const parent = Object.create(grandparent);
    parent.p = "parent";
    const child = Object.create(parent);
    child.c = "child";
    const values = Object.values(child);
    return values.length === 1 && values[0] === "child";
}

// 测试点124：Proxy修改属性 - 验证Proxy修改属性后的values
export function Fn124_testProxyModifyProperty() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        set: (obj, prop, value) => {
            obj[prop] = value * 2;
            return true;
        }
    });
    proxy.a = 3;
    const values = Object.values(proxy);
    return JSON.stringify(values) === JSON.stringify([6]);
}

// 测试点125：Proxy拦截get - 验证Proxy拦截get后的values
export function Fn125_testProxyGetInterceptor() {
    const target = { a: 1, b: 2 };
    const proxy = new Proxy(target, {
        get: (obj, prop) => prop === "a" ? 100 : obj[prop]
    });
    const values = Object.values(proxy);
    return JSON.stringify(values) === JSON.stringify([100, 2]);
}

// 测试点126：空迭代器对象 - 验证空迭代器的属性
export function Fn126_testEmptyIterator() {
    const iterator = { next: () => ({ done: true }) };
    iterator.prop = "empty";
    const values = Object.values(iterator);
    return values.length === 2 && values[1] === "empty";
}

// 测试点127：可迭代对象 - 验证自定义可迭代对象
export function Fn127_testIterableObject() {
    const iterable = {
        [Symbol.iterator]: () => ({
            next: () => ({ done: false, value: 1 }),
            return: () => ({ done: true })
        }),
        prop: "iterable"
    };
    const values = Object.values(iterable);
    return values.length === 1 && values[0] === "iterable";
}

// 测试点128：具有Symbol.iterator的对象 - 验证包含迭代器的对象
export function Fn128_testObjectWithIterator() {
    const obj = {
        a: 1,
        [Symbol.iterator]: () => ({ next: () => ({ done: true }) })
    };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === 1;
}

// 测试点129：Math扩展对象 - 验证包含Math扩展的对象
export function Fn129_testMathExtension() {
    const obj = {
        random: Math.random,
        sqrt: Math.sqrt,
        custom: () => 42
    };
    const values = Object.values(obj);
    return values[0] === Math.random && values[1] === Math.sqrt && typeof values[2] === "function";
}

// 测试点130：JSON扩展对象 - 验证包含JSON扩展的对象
export function Fn130_testJSONExtension() {
    const obj = {
        parse: JSON.parse,
        stringify: JSON.stringify,
        reviver: (key, value) => value
    };
    const values = Object.values(obj);
    return values[0] === JSON.parse && values[1] === JSON.stringify && typeof values[2] === "function";
}

// 测试点131：BigInt对象属性 - 验证BigInt对象的属性
export function Fn131_testBigIntObject() {
    const bigInt = BigInt(12345678901234567890);
    const obj = { big: bigInt, desc: "a big number" };
    const values = Object.values(obj);
    return values[0] === bigInt && values[1] === "a big number";
}

// 测试点132：Symbol.hasInstance属性 - 验证自定义instanceof行为
export function Fn132_testSymbolHasInstance() {
    class MyClass {
        static [Symbol.hasInstance](instance) {
            return instance.isMyClass;
        }
    }
    const obj = { cls: MyClass, prop: "test" };
    const values = Object.values(obj);
    return values[0] === MyClass && values[1] === "test";
}

// 测试点133：Symbol.toStringTag属性 - 验证自定义toString标签
export function Fn133_testSymbolToStringTag() {
    const obj = {
        [Symbol.toStringTag]: "MyObject",
        value: 42
    };
    const values = Object.values(obj);
    return values.length === 1 && values[0] === 42;
}

// 测试点134：对象属性的动态修改 - 验证动态修改属性后的values
export function Fn134_testDynamicPropertyModification() {
    const obj = { a: 1, b: 2 };
    obj.a = 10;
    delete obj.b;
    obj.c = 3;
    const values = Object.values(obj);
    return JSON.stringify(values) === JSON.stringify([10, 3]);
}

// 测试点135：大量属性的对象 - 验证包含大量属性的对象
export function Fn135_testManyProperties() {
    const obj = {};
    for (let i = 0; i < 100; i++) {
        obj[`prop${i}`] = i;
    }
    const values = Object.values(obj);
    return values.length === 100 && values[99] === 99;
}

// 测试点136：属性名包含表情符号 - 验证表情符号作为属性名
export function Fn136_testEmojiPropertyNames() {
    const obj = { "😊": "smile", "👍": "like", "🔥": "fire" };
    const values = Object.values(obj);
    return values.includes("smile") && values.includes("like") && values.includes("fire");
}

// 测试点137：属性名包含控制字符 - 验证控制字符作为属性名
export function Fn137_testControlCharPropertyNames() {
    const obj = { "\n": "newline", "\t": "tab", "\r": "carriage return" };
    const values = Object.values(obj);
    return values.includes("newline") && values.includes("tab") && values.includes("carriage return");
}

// 测试点138：对象属性的getter和setter - 验证包含getter和setter的对象
export function Fn138_testGetterAndSetter() {
    let value = 0;
    const obj = {
        get count() { return value; },
        set count(v) { value = v; },
        other: "prop"
    };
    obj.count = 5;
    const values = Object.values(obj);
    return values.includes(5) && values.includes("prop");
}

// 测试点142：模块命名空间对象 - 验证模拟模块命名空间对象
export function Fn142_testModuleNamespace() {
    const moduleMock = {
        a: 1,
        b: 2,
        [Symbol.toStringTag]: "Module"
    };
    const values = Object.values(moduleMock);
    return JSON.stringify(values) === JSON.stringify([1, 2]);
}

// 测试点143：WeakMap的原型属性 - 验证WeakMap原型的属性
export function Fn143_testWeakMapPrototype() {
    const obj = {
        set: WeakMap.prototype.set,
        get: WeakMap.prototype.get
    };
    const values = Object.values(obj);
    return values[0] === WeakMap.prototype.set && values[1] === WeakMap.prototype.get;
}

// 测试点144：WeakSet的原型属性 - 验证WeakSet原型的属性
export function Fn144_testWeakSetPrototype() {
    const obj = {
        add: WeakSet.prototype.add,
        has: WeakSet.prototype.has
    };
    const values = Object.values(obj);
    return values[0] === WeakSet.prototype.add && values[1] === WeakSet.prototype.has;
}

// 测试点145：ArrayBuffer的原型属性 - 验证ArrayBuffer原型的属性
export function Fn145_testArrayBufferPrototype() {
    const obj = {
        slice: ArrayBuffer.prototype.slice,
        test: "value"
    };
    const values = Object.values(obj);
    return values[0] === ArrayBuffer.prototype.slice && values[1] === "value";
}

// 测试点146：DataView的原型属性 - 验证DataView原型的属性
export function Fn146_testDataViewPrototype() {
    const obj = {
        getUint8: DataView.prototype.getUint8,
        setUint8: DataView.prototype.setUint8
    };
    const values = Object.values(obj);
    return values[0] === DataView.prototype.getUint8 && values[1] === DataView.prototype.setUint8;
}

// 测试点147：Promise的原型属性 - 验证Promise原型的属性
export function Fn147_testPromisePrototype() {
    const obj = {
        then: Promise.prototype.then,
        catch: Promise.prototype.catch
    };
    const values = Object.values(obj);
    return values[0] === Promise.prototype.then && values[1] === Promise.prototype.catch;
}

// 测试点148：Function的原型属性 - 验证Function原型的属性
export function Fn148_testFunctionPrototype() {
    const obj = {
        apply: Function.prototype.apply,
        bind: Function.prototype.bind
    };
    const values = Object.values(obj);
    return values[0] === Function.prototype.apply && values[1] === Function.prototype.bind;
}

// 测试点149：Number的原型属性 - 验证Number原型的属性
export function Fn149_testNumberPrototype() {
    const obj = {
        toFixed: Number.prototype.toFixed,
        toString: Number.prototype.toString
    };
    const values = Object.values(obj);
    return values[0] === Number.prototype.toFixed && values[1] === Number.prototype.toString;
}

// 测试点150：String的原型属性 - 验证String原型的属性
export function Fn150_testStringPrototype() {
    const obj = {
        slice: String.prototype.slice,
        toUpperCase: String.prototype.toUpperCase
    };
    const values = Object.values(obj);
    return values[0] === String.prototype.slice && values[1] === String.prototype.toUpperCase;
}

// 测试点151：Boolean的原型属性 - 验证Boolean原型的属性
export function Fn151_testBooleanPrototype() {
    const obj = {
        toString: Boolean.prototype.toString,
        valueOf: Boolean.prototype.valueOf
    };
    const values = Object.values(obj);
    return values[0] === Boolean.prototype.toString && values[1] === Boolean.prototype.valueOf;
}

// 测试点152：Date的原型属性 - 验证Date原型的属性
export function Fn152_testDatePrototype() {
    const obj = {
        getFullYear: Date.prototype.getFullYear,
        toISOString: Date.prototype.toISOString
    };
    const values = Object.values(obj);
    return values[0] === Date.prototype.getFullYear && values[1] === Date.prototype.toISOString;
}

// 测试点153：RegExp的原型属性 - 验证RegExp原型的属性
export function Fn153_testRegExpPrototype() {
    const obj = {
        test: RegExp.prototype.test,
        exec: RegExp.prototype.exec
    };
    const values = Object.values(obj);
    return values[0] === RegExp.prototype.test && values[1] === RegExp.prototype.exec;
}

// 测试点154：Array的原型属性 - 验证Array原型的属性
export function Fn154_testArrayPrototype() {
    const obj = {
        push: Array.prototype.push,
        pop: Array.prototype.pop
    };
    const values = Object.values(obj);
    return values[0] === Array.prototype.push && values[1] === Array.prototype.pop;
}

// 测试点155：Map的原型属性 - 验证Map原型的属性
export function Fn155_testMapPrototype() {
    const obj = {
        set: Map.prototype.set,
        get: Map.prototype.get
    };
    const values = Object.values(obj);
    return values[0] === Map.prototype.set && values[1] === Map.prototype.get;
}

// 测试点156：Set的原型属性 - 验证Set原型的属性
export function Fn156_testSetPrototype() {
    const obj = {
        add: Set.prototype.add,
        has: Set.prototype.has
    };
    const values = Object.values(obj);
    return values[0] === Set.prototype.add && values[1] === Set.prototype.has;
}

// 测试点157：Error的原型属性 - 验证Error原型的属性
export function Fn157_testErrorPrototype() {
    const obj = {
        toString: Error.prototype.toString,
        message: Error.prototype.message
    };
    const values = Object.values(obj);
    return values[0] === Error.prototype.toString && values[1] === Error.prototype.message;
}

// 测试点161：多层嵌套对象 - 验证多层嵌套对象的表层值
export function Fn161_testDeepNestedObject() {
    const obj = {
        a: 1,
        b: {
            c: 2,
            d: {
                e: 3
            }
        }
    };
    const values = Object.values(obj);
    return values.length === 2 && values[0] === 1 && values[1].c === 2;
}

// 测试点162：对象属性值为自身 - 验证属性值为对象自身
export function Fn162_testSelfReferentialProperty() {
    const obj = { a: 1 };
    obj.self = obj;
    const values = Object.values(obj);
    return values.length === 2 && values[0] === 1 && values[1] === obj;
}

// 测试点163：对象属性值为其他对象 - 验证属性值为其他对象
export function Fn163_testOtherObjectReference() {
    const other = { x: 10 };
    const obj = { a: 1, ref: other };
    const values = Object.values(obj);
    return values.length === 2 && values[0] === 1 && values[1] === other;
}

// 测试点164：对象属性包含函数调用结果 - 验证函数调用结果作为属性值
export function Fn164_testFunctionResultProperty() {
    const obj = {
        a: (() => 42)(),
        b: Math.random()
    };
    const values = Object.values(obj);
    return values[0] === 42 && typeof values[1] === "number";
}

// 测试点165：对象属性使用计算属性名 - 验证计算属性名的处理
export function Fn165_testComputedPropertyNames() {
    const key1 = "a";
    const key2 = "b";
    const obj = {
        [key1 + key2]: "ab",
        [key1 * 2]: "aa"
    };
    const values = Object.values(obj);
    return values.includes("ab") && values.includes("aa");
}

// 测试点166：对象属性使用模板字符串 - 验证模板字符串作为属性名
export function Fn166_testTemplateLiteralKeys() {
    const prefix = "prop";
    const obj = {
        [`${prefix}1`]: "value1",
        [`${prefix}2`]: "value2"
    };
    const values = Object.values(obj);
    return values.includes("value1") && values.includes("value2");
}

// 测试点167：对象属性使用Symbol表达式 - 验证Symbol表达式作为属性名
export function Fn167_testSymbolExpressionKeys() {
    const sym1 = Symbol("1");
    const sym2 = Symbol("2");
    const obj = {
        [sym1]: "val1",
        [sym2]: "val2"
    };
    const values = Object.values(obj);
    return !values.includes("val1") && !values.includes("val2");
}

// 测试点168：类的静态属性 - 验证类的静态属性
export function Fn168_testClassStaticProperties() {
    class MyClass {
        static staticProp = "static";
        instanceProp = "instance";
    }
    const values = Object.values(MyClass);
    return values.length === 1 && values[0] === "static";
}

// 测试点169：类的实例方法 - 验证类的实例方法作为属性
export function Fn169_testClassInstanceMethods() {
    class MyClass {
        constructor() {
            this.method = () => "method";
        }
    }
    const instance = new MyClass();
    const values = Object.values(instance);
    return values.length === 1 && typeof values[0] === "function" && values[0]() === "method";
}

// 测试点170：类的静态方法 - 验证类的静态方法作为属性
export function Fn170_testClassStaticMethods() {
    class MyClass {}
    Object.defineProperty(MyClass, "staticMethod", {
        value: () => "static",
        enumerable: true
    });
    const values = Object.values(MyClass);
    return values.length === 1 && typeof values[0] === "function" && values[0]() === "static";
}

// 测试点171：扩展内置类 - 验证扩展内置类的实例
export function Fn171_testExtendedBuiltinClass() {
    class MyArray extends Array {
        get first() { return this[0]; }
    }
    const instance = new MyArray(1, 2, 3);
    const values = Object.values(instance);
    return JSON.stringify(values) === JSON.stringify([1, 2, 3]);
}

// 测试点172：对象属性的默认值 - 验证属性默认值
export function Fn172_testDefaultPropertyValues() {
    const obj = {
        a: undefined,
        b: null,
        c: "",
        d: 0,
        e: false
    };
    const values = Object.values(obj);
    return values.length === 5 &&
        values[0] === undefined &&
        values[1] === null &&
        values[2] === "" &&
        values[3] === 0 &&
        values[4] === false;
}

// 测试点173：对象属性值为正则表达式 - 验证正则表达式作为属性值
export function Fn173_testRegExpAsValue() {
    const regex1 = /test/;
    const regex2 = /another/g;
    const obj = { r1: regex1, r2: regex2 };
    const values = Object.values(obj);
    return values[0] === regex1 && values[1] === regex2;
}

// 测试点174：对象属性值为日期对象 - 验证日期对象作为属性值
export function Fn174_testDateAsValue() {
    const date1 = new Date(2020, 0, 1);
    const date2 = new Date(2023, 11, 31);
    const obj = { d1: date1, d2: date2 };
    const values = Object.values(obj);
    return values[0] === date1 && values[1] === date2;
}

// 测试点175：对象属性值为Map - 验证Map作为属性值
export function Fn175_testMapAsValue() {
    const map1 = new Map([["a", 1]]);
    const map2 = new Map([["b", 2]]);
    const obj = { m1: map1, m2: map2 };
    const values = Object.values(obj);
    return values[0] === map1 && values[1] === map2;
}

// 测试点176：对象属性值为Set - 验证Set作为属性值
export function Fn176_testSetAsValue() {
    const set1 = new Set([1, 2]);
    const set2 = new Set([3, 4]);
    const obj = { s1: set1, s2: set2 };
    const values = Object.values(obj);
    return values[0] === set1 && values[1] === set2;
}

// 测试点177：对象属性值为WeakMap - 验证WeakMap作为属性值
export function Fn177_testWeakMapAsValue() {
    const wm1 = new WeakMap();
    const wm2 = new WeakMap();
    const obj = { wm1: wm1, wm2: wm2 };
    const values = Object.values(obj);
    return values[0] === wm1 && values[1] === wm2;
}

// 测试点178：对象属性值为WeakSet - 验证WeakSet作为属性值
export function Fn178_testWeakSetAsValue() {
    const ws1 = new WeakSet();
    const ws2 = new WeakSet();
    const obj = { ws1: ws1, ws2: ws2 };
    const values = Object.values(obj);
    return values[0] === ws1 && values[1] === ws2;
}

// 测试点179：对象属性值为ArrayBuffer - 验证ArrayBuffer作为属性值
export function Fn179_testArrayBufferAsValue() {
    const buf1 = new ArrayBuffer(16);
    const buf2 = new ArrayBuffer(32);
    const obj = { b1: buf1, b2: buf2 };
    const values = Object.values(obj);
    return values[0] === buf1 && values[1] === buf2;
}

// 测试点180：对象属性值为DataView - 验证DataView作为属性值
export function Fn180_testDataViewAsValue() {
    const buf = new ArrayBuffer(16);
    const dv1 = new DataView(buf);
    const dv2 = new DataView(buf, 8);
    const obj = { dv1: dv1, dv2: dv2 };
    const values = Object.values(obj);
    return values[0] === dv1 && values[1] === dv2;
}

// 测试点181：对象属性值为Promise - 验证Promise作为属性值
export function Fn181_testPromiseAsValue() {
    const p1 = Promise.resolve(1);
    const p2 = Promise.reject(new Error("error"));
    const obj = { p1: p1, p2: p2 };
    const values = Object.values(obj);
    return values[0] === p1 && values[1] === p2;
}

// 测试点183：对象属性值为Generator - 验证Generator作为属性值
export function Fn183_testGeneratorAsValue() {
    function* gen1() { yield 1; }
    function* gen2() { yield 2; }
    const obj = { g1: gen1(), g2: gen2() };
    const values = Object.values(obj);
    return typeof values[0].next === "function" && typeof values[1].next === "function";
}

// 测试点184：对象属性值为Error - 验证Error作为属性值
export function Fn184_testErrorAsValue() {
    const e1 = new Error("error1");
    const e2 = new TypeError("error2");
    const obj = { e1: e1, e2: e2 };
    const values = Object.values(obj);
    return values[0] === e1 && values[1] === e2;
}

// 测试点188：对象属性值为Intl对象 - 验证Intl对象作为属性值
export function Fn188_testIntlAsValue() {
    const formatter1 = new Intl.DateTimeFormat();
    const formatter2 = new Intl.NumberFormat();
    const obj = { f1: formatter1, f2: formatter2 };
    const values = Object.values(obj);
    return values[0] === formatter1 && values[1] === formatter2;
}

// 测试点189：对象属性值为FinalizationRegistry - 验证FinalizationRegistry作为属性值
export function Fn189_testFinalizationRegistryAsValue() {
    const fr1 = new FinalizationRegistry(() => {});
    const fr2 = new FinalizationRegistry(() => {});
    const obj = { fr1: fr1, fr2: fr2 };
    const values = Object.values(obj);
    return values[0] === fr1 && values[1] === fr2;
}

// 测试点190：对象属性值为WeakRef - 验证WeakRef作为属性值
export function Fn190_testWeakRefAsValue() {
    const target1 = {};
    const target2 = {};
    const obj = {
        wr1: new WeakRef(target1),
        wr2: new WeakRef(target2)
    };
    const values = Object.values(obj);
    return values[0] === obj.wr1 && values[1] === obj.wr2;
}

// 测试点191：对象属性值为BigInt - 验证BigInt作为属性值
export function Fn191_testBigIntAsValue() {
    const b1 = 123456789012345678901234567890n;
    const b2 = 987654321098765432109876543210n;
    const obj = { b1: b1, b2: b2 };
    const values = Object.values(obj);
    return values[0] === b1 && values[1] === b2;
}

// 测试点192：对象属性值为Symbol - 验证Symbol作为属性值
export function Fn192_testSymbolAsValue() {
    const s1 = Symbol("sym1");
    const s2 = Symbol("sym2");
    const obj = { s1: s1, s2: s2 };
    const values = Object.values(obj);
    return values[0] === s1 && values[1] === s2;
}

// 测试点193：对象属性值为函数 - 验证函数作为属性值
export function Fn193_testFunctionAsValue() {
    const f1 = () => 1;
    const f2 = () => 2;
    const obj = { f1: f1, f2: f2 };
    const values = Object.values(obj);
    return values[0] === f1 && values[1] === f2 && values[0]() === 1 && values[1]() === 2;
}

// 测试点194：对象属性值为数组 - 验证数组作为属性值
export function Fn194_testArrayAsValue() {
    const arr1 = [1, 2, 3];
    const arr2 = ["a", "b"];
    const obj = { arr1: arr1, arr2: arr2 };
    const values = Object.values(obj);
    return values[0] === arr1 && values[1] === arr2;
}

// 测试点195：对象属性值为对象 - 验证对象作为属性值
export function Fn195_testObjectAsValue() {
    const obj1 = { a: 1 };
    const obj2 = { b: 2 };
    const obj = { obj1: obj1, obj2: obj2 };
    const values = Object.values(obj);
    return values[0] === obj1 && values[1] === obj2;
}

// 测试点196：对象属性值为字符串 - 验证字符串作为属性值
export function Fn196_testStringAsValue() {
    const obj = { s1: "string1", s2: "string2" };
    const values = Object.values(obj);
    return values[0] === "string1" && values[1] === "string2";
}

// 测试点197：对象属性值为数字 - 验证数字作为属性值
export function Fn197_testNumberAsValue() {
    const obj = { n1: 123, n2: 45.67 };
    const values = Object.values(obj);
    return values[0] === 123 && values[1] === 45.67;
}

// 测试点198：对象属性值为布尔值 - 验证布尔值作为属性值
export function Fn198_testBooleanAsValue() {
    const obj = { b1: true, b2: false };
    const values = Object.values(obj);
    return values[0] === true && values[1] === false;
}

// 测试点199：对象属性值为null - 验证null作为属性值
export function Fn199_testNullAsValue() {
    const obj = { n1: null, n2: null };
    const values = Object.values(obj);
    return values[0] === null && values[1] === null;
}

// 测试点200：对象属性值为undefined - 验证undefined作为属性值
export function Fn200_testUndefinedAsValue() {
    const obj = { u1: undefined, u2: undefined };
    const values = Object.values(obj);
    return values[0] === undefined && values[1] === undefined;
}
