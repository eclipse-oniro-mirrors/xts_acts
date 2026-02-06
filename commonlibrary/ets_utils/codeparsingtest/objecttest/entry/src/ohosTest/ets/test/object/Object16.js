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
export function Fn01_testNaNEquality() {
    const isNaNEqual = Object.is(NaN, NaN);
    const isStrictNaNEqual = NaN === NaN;
    return isNaNEqual && !isStrictNaNEqual;
}

export function Fn02_testSignedZeroInequality() {
    const isZeroNotEqual = !Object.is(+0, -0);
    const isStrictZeroEqual = +0 === -0;
    return isZeroNotEqual && isStrictZeroEqual;
}

export function Fn03_testReferenceTypeEquality() {
    const obj1 = { name: "test", value: 123 };
    const obj2 = { name: "test", value: 123 };
    const obj3 = obj1;

    const isObj1Obj2Equal = Object.is(obj1, obj2);
    const isObj1Obj3Equal = Object.is(obj1, obj3);

    return !isObj1Obj2Equal && isObj1Obj3Equal;
}
// 测试点4：基本类型（字符串）相同值判断
export function Fn04_testStringSameValue() {
    const str1 = "hello Object.is()";
    const str2 = "hello Object.is()";
    const str3 = new String("hello Object.is()");
    return Object.is(str1, str2) && !Object.is(str1, str3);
}

// 测试点5：基本类型（数字）相同值判断
export function Fn05_testNumberSameValue() {
    const num1 = 123.45;
    const num2 = 123.45;
    const num3 = 123.456;
    return Object.is(num1, num2) && !Object.is(num1, num3);
}

// 测试点6：基本类型（布尔值）相同值判断
export function Fn06_testBooleanSameValue() {
    const bool1 = true;
    const bool2 = true;
    const bool3 = false;
    return Object.is(bool1, bool2) && !Object.is(bool1, bool3);
}

// 测试点7：null值相等性判断
export function Fn07_testNullEquality() {
    const null1 = null;
    const null2 = null;
    const undef = undefined;
    return Object.is(null1, null2) && !Object.is(null1, undef);
}

// 测试点8：undefined值相等性判断
export function Fn08_testUndefinedEquality() {
    const undef1 = undefined;
    const undef2 = undefined;
    const nullVal = null;
    return Object.is(undef1, undef2) && !Object.is(undef1, nullVal);
}

// 测试点9：Symbol相同值判断（同一Symbol实例）
export function Fn09_testSymbolSameInstance() {
    const sym1 = Symbol("test");
    const sym2 = sym1;
    const sym3 = Symbol("test");
    return Object.is(sym1, sym2) && !Object.is(sym1, sym3);
}

// 测试点10：BigInt相同值判断（相同数值）
export function Fn10_testBigIntSameValue() {
    const big1 = 9007199254740991n;
    const big2 = 9007199254740991n;
    const big3 = 9007199254740992n;
    return Object.is(big1, big2) && !Object.is(big1, big3);
}

// 测试点11：基本类型与包装对象区分判断
export function Fn11_testPrimitiveVsWrapper() {
    const numPrimitive = 456;
    const numWrapper = new Number(456);
    const strPrimitive = "test";
    const strWrapper = new String("test");
    return !Object.is(numPrimitive, numWrapper) && !Object.is(strPrimitive, strWrapper);
}

// 测试点12：数组引用不同判断（内容相同但实例不同）
export function Fn12_testArrayDifferentInstance() {
    const arr1 = [1, 2, 3];
    const arr2 = [1, 2, 3];
    const arr3 = arr1;
    return !Object.is(arr1, arr2) && Object.is(arr1, arr3);
}

// 测试点13：函数引用不同判断（相同逻辑不同实例）
export function Fn13_testFunctionDifferentInstance() {
    const func1 = () => { return "test"; };
    const func2 = () => { return "test"; };
    const func3 = func1;
    return !Object.is(func1, func2) && Object.is(func1, func3);
}

// 测试点14：Date对象相同时间判断（同一实例）
export function Fn14_testDateSameInstance() {
    const date1 = new Date("2024-05-01");
    const date2 = date1;
    const date3 = new Date("2024-05-01");
    return Object.is(date1, date2) && !Object.is(date1, date3);
}

// 测试点15：NaN与其他虚假值区分判断
export function Fn15_testNaNvsFalsyValues() {
    const nan = NaN;
    const zero = 0;
    const emptyStr = "";
    const nullVal = null;
    return !Object.is(nan, zero) && !Object.is(nan, emptyStr) && !Object.is(nan, nullVal);
}

// 测试点16：+0与其他数字区分判断
export function Fn16_testPositiveZeroVsOthers() {
    const posZero = +0;
    const negZero = -0;
    const zero = 0;
    const one = 1;
    return !Object.is(posZero, negZero) && Object.is(posZero, zero) && !Object.is(posZero, one);
}

// 测试点17：嵌套对象引用判断（外层不同，内层相同）
export function Fn17_testNestedObjReference() {
    const innerObj = { key: "value" };
    const outerObj1 = { inner: innerObj };
    const outerObj2 = { inner: innerObj };
    const outerObj3 = outerObj1;
    return !Object.is(outerObj1, outerObj2) && Object.is(outerObj1, outerObj3) && Object.is(outerObj1.inner, outerObj2.inner);
}

// 测试点18：RegExp相同模式不同实例判断
export function Fn18_testRegExpDifferentInstance() {
    const reg1 = /test/g;
    const reg2 = /test/g;
    const reg3 = reg1;
    return !Object.is(reg1, reg2) && Object.is(reg1, reg3);
}

// 测试点19：基本类型与转换后值判断（如数字字符串vs数字）
export function Fn19_testPrimitiveVsConverted() {
    const num = 789;
    const strNum = "789";
    const boolNum = Boolean(num);
    return !Object.is(num, strNum) && !Object.is(num, boolNum) && !Object.is(strNum, boolNum);
}

// 测试点20：undefined与未初始化变量判断
export function Fn20_testUndefinedVsUninitialized() {
    let uninitVar;
    const undef = undefined;
    const nullVal = null;
    return Object.is(uninitVar, undef) && !Object.is(uninitVar, nullVal);
}
// 测试点21：空对象与空对象引用判断
export function Fn21_testEmptyObjReference() {
    const emptyObj1 = {};
    const emptyObj2 = {};
    const emptyObj3 = emptyObj1;
    return !Object.is(emptyObj1, emptyObj2) && Object.is(emptyObj1, emptyObj3);
}

// 测试点22：空数组与空数组引用判断
export function Fn22_testEmptyArrayReference() {
    const emptyArr1 = [];
    const emptyArr2 = [];
    const emptyArr3 = emptyArr1;
    return !Object.is(emptyArr1, emptyArr2) && Object.is(emptyArr1, emptyArr3);
}

// 测试点23：Symbol与字符串转换后值判断
export function Fn23_testSymbolVsString() {
    const sym = Symbol("foo");
    const symStr = sym.toString();
    return !Object.is(sym, symStr);
}

// 测试点24：BigInt与Number相同数值判断
export function Fn24_testBigIntVsNumber() {
    const bigNum = 123n;
    const num = 123;
    return !Object.is(bigNum, num);
}

// 测试点25：Date对象与时间戳数值判断
export function Fn25_testDateVsTimestamp() {
    const date = new Date("2024-01-01");
    const timestamp = date.getTime();
    return !Object.is(date, timestamp);
}

// 测试点26：布尔值true与1判断
export function Fn26_testTrueVsOne() {
    const boolTrue = true;
    const numOne = 1;
    return !Object.is(boolTrue, numOne);
}

// 测试点27：布尔值false与0判断
export function Fn27_testFalseVsZero() {
    const boolFalse = false;
    const numZero = 0;
    return !Object.is(boolFalse, numZero);
}

// 测试点28：字符串"true"与布尔值true判断
export function Fn28_testStrTrueVsBoolTrue() {
    const strTrue = "true";
    const boolTrue = true;
    return !Object.is(strTrue, boolTrue);
}

// 测试点29：字符串"false"与布尔值false判断
export function Fn29_testStrFalseVsBoolFalse() {
    const strFalse = "false";
    const boolFalse = false;
    return !Object.is(strFalse, boolFalse);
}

// 测试点30：null与0判断
export function Fn30_testNullVsZero() {
    const nullVal = null;
    const numZero = 0;
    return !Object.is(nullVal, numZero);
}

// 测试点31：undefined与空字符串判断
export function Fn31_testUndefinedVsEmptyStr() {
    const undef = undefined;
    const emptyStr = "";
    return !Object.is(undef, emptyStr);
}

// 测试点32：嵌套数组不同实例判断
export function Fn32_testNestedArrayInstance() {
    const nestedArr1 = [1, [2, 3]];
    const nestedArr2 = [1, [2, 3]];
    const nestedArr3 = nestedArr1;
    return !Object.is(nestedArr1, nestedArr2) && Object.is(nestedArr1, nestedArr3);
}

// 测试点33：函数与箭头函数相同逻辑判断
export function Fn33_testFunctionVsArrowFunc() {
    const func = function() { return 123; };
    const arrowFunc = () => 123;
    return !Object.is(func, arrowFunc);
}

// 测试点34：RegExp不同修饰符判断
export function Fn34_testRegExpDifferentFlags() {
    const regG = /abc/g;
    const regI = /abc/i;
    return !Object.is(regG, regI);
}

// 测试点35：Symbol.for创建相同key的Symbol判断
export function Fn35_testSymbolForSameKey() {
    const sym1 = Symbol.for("shared");
    const sym2 = Symbol.for("shared");
    const sym3 = Symbol("shared");
    return Object.is(sym1, sym2) && !Object.is(sym1, sym3);
}

// 测试点36：BigInt与BigInt不同数值判断
export function Fn36_testDifferentBigInt() {
    const big1 = 456n;
    const big2 = 457n;
    return !Object.is(big1, big2);
}

// 测试点37：数字Infinity与-Infinity判断
export function Fn37_testInfinityVsNegativeInfinity() {
    const inf = Infinity;
    const negInf = -Infinity;
    return !Object.is(inf, negInf);
}

// 测试点38：数字Infinity与相同Infinity判断
export function Fn38_testSameInfinity() {
    const inf1 = Infinity;
    const inf2 = Infinity;
    return Object.is(inf1, inf2);
}

// 测试点39：对象属性修改后引用判断
export function Fn39_testObjPropChangeReference() {
    const obj1 = { a: 1 };
    const obj2 = obj1;
    obj1.a = 2;
    return Object.is(obj1, obj2);
}

// 测试点40：数组元素修改后引用判断
export function Fn40_testArrayElemChangeReference() {
    const arr1 = [1, 2];
    const arr2 = arr1;
    arr1[0] = 3;
    return Object.is(arr1, arr2);
}

// 测试点41：字符串模板与普通字符串相同内容判断
export function Fn41_testTemplateStrVsNormalStr() {
    const normalStr = "hello";
    const templateStr = `hello`;
    return Object.is(normalStr, templateStr);
}

// 测试点42：字符串模板与普通字符串不同内容判断
export function Fn42_testDifferentTemplateVsNormalStr() {
    const normalStr = "hello";
    const templateStr = `hello!`;
    return !Object.is(normalStr, templateStr);
}

// 测试点43：布尔值与Boolean包装对象判断
export function Fn43_testBoolVsBooleanWrapper() {
    const boolPrimitive = true;
    const boolWrapper = new Boolean(true);
    return !Object.is(boolPrimitive, boolWrapper);
}

// 测试点44：null与Boolean(null)结果判断
export function Fn44_testNullVsBooleanNull() {
    const nullVal = null;
    const boolNull = Boolean(null);
    return !Object.is(nullVal, boolNull);
}

// 测试点45：undefined与Boolean(undefined)结果判断
export function Fn45_testUndefinedVsBooleanUndefined() {
    const undef = undefined;
    const boolUndef = Boolean(undefined);
    return !Object.is(undef, boolUndef);
}

// 测试点46：嵌套对象内层修改后外层引用判断
export function Fn46_testNestedObjInnerChange() {
    const inner = { x: 10 };
    const outer1 = { inner: inner };
    const outer2 = outer1;
    inner.x = 20;
    return Object.is(outer1, outer2);
}

// 测试点47：Set对象相同实例判断
export function Fn47_testSameSetInstance() {
    const set1 = new Set([1, 2]);
    const set2 = set1;
    const set3 = new Set([1, 2]);
    return Object.is(set1, set2) && !Object.is(set1, set3);
}

// 测试点48：Map对象相同实例判断
export function Fn48_testSameMapInstance() {
    const map1 = new Map([["a", 1]]);
    const map2 = map1;
    const map3 = new Map([["a", 1]]);
    return Object.is(map1, map2) && !Object.is(map1, map3);
}

// 测试点49：Number包装对象不同实例判断
export function Fn49_testDifferentNumberWrapper() {
    const numWrapper1 = new Number(789);
    const numWrapper2 = new Number(789);
    return !Object.is(numWrapper1, numWrapper2);
}

// 测试点50：String包装对象不同实例判断
export function Fn50_testDifferentStringWrapper() {
    const strWrapper1 = new String("test");
    const strWrapper2 = new String("test");
    return !Object.is(strWrapper1, strWrapper2);
}

// 测试点51：Infinity与数字判断
export function Fn51_testInfinityVsNumber() {
    const inf = Infinity;
    const num = 999999999;
    return !Object.is(inf, num);
}

// 测试点52：-Infinity与数字判断
export function Fn52_testNegativeInfinityVsNumber() {
    const negInf = -Infinity;
    const num = -999999999;
    return !Object.is(negInf, num);
}

// 测试点53：Symbol与Symbol.for不同key判断
export function Fn53_testSymbolVsSymbolForDifferentKey() {
    const sym = Symbol("unique");
    const symFor = Symbol.for("another");
    return !Object.is(sym, symFor);
}

// 测试点54：BigInt与字符串相同数值判断
export function Fn54_testBigIntVsStrSameValue() {
    const big = 1234n;
    const str = "1234";
    return !Object.is(big, str);
}

// 测试点55：Date对象与字符串日期判断
export function Fn55_testDateVsStrDate() {
    const date = new Date("2024-12-31");
    const strDate = "2024-12-31";
    return !Object.is(date, strDate);
}

// 测试点56：空Set与空Set不同实例判断
export function Fn56_testEmptySetDifferentInstance() {
    const set1 = new Set();
    const set2 = new Set();
    return !Object.is(set1, set2);
}

// 测试点57：空Map与空Map不同实例判断
export function Fn57_testEmptyMapDifferentInstance() {
    const map1 = new Map();
    const map2 = new Map();
    return !Object.is(map1, map2);
}

// 测试点58：Set添加元素后引用判断
export function Fn58_testSetAddElemReference() {
    const set1 = new Set([1]);
    const set2 = set1;
    set1.add(2);
    return Object.is(set1, set2);
}

// 测试点59：Map添加键值对后引用判断
export function Fn59_testMapAddEntryReference() {
    const map1 = new Map([["key1", 1]]);
    const map2 = map1;
    map1.set("key2", 2);
    return Object.is(map1, map2);
}

// 测试点60：字符串与字符串对象（Object包装）判断
export function Fn60_testStrVsObjectWrappedStr() {
    const str = "test-str";
    const objWrappedStr = Object("test-str");
    return !Object.is(str, objWrappedStr);
}

// 测试点61：数字与数字对象（Object包装）判断
export function Fn61_testNumVsObjectWrappedNum() {
    const num = 567;
    const objWrappedNum = Object(567);
    return !Object.is(num, objWrappedNum);
}

// 测试点62：布尔值与布尔对象（Object包装）判断
export function Fn62_testBoolVsObjectWrappedBool() {
    const bool = false;
    const objWrappedBool = Object(false);
    return !Object.is(bool, objWrappedBool);
}

// 测试点63：嵌套Set不同实例判断
export function Fn63_testNestedSetDifferentInstance() {
    const innerSet = new Set([1]);
    const set1 = new Set([innerSet]);
    const set2 = new Set([innerSet]);
    return !Object.is(set1, set2);
}

// 测试点64：嵌套Map不同实例判断
export function Fn64_testNestedMapDifferentInstance() {
    const innerMap = new Map([["a", 1]]);
    const map1 = new Map([["inner", innerMap]]);
    const map2 = new Map([["inner", innerMap]]);
    return !Object.is(map1, map2);
}

// 测试点65：函数参数不同但逻辑相同判断
export function Fn65_testFuncDifferentParamsSameLogic() {
    const func1 = (x) => x * 2;
    const func2 = (y) => y * 2;
    return !Object.is(func1, func2);
}

// 测试点66：生成器函数不同实例判断
export function Fn66_testGeneratorFuncDifferentInstance() {
    function* gen1() { yield 1; }
    function* gen2() { yield 1; }
    return !Object.is(gen1, gen2);
}

// 测试点67：异步函数不同实例判断
export function Fn67_testAsyncFuncDifferentInstance() {
    const asyncFunc1 = async () => { return "async1"; };
    const asyncFunc2 = async () => { return "async1"; };
    return !Object.is(asyncFunc1, asyncFunc2);
}

// 测试点68：RegExp与字符串正则表达式判断
export function Fn68_testRegExpVsStrRegExp() {
    const reg = /abc/;
    const strReg = "/abc/";
    return !Object.is(reg, strReg);
}

// 测试点69：BigInt与BigInt运算结果判断
export function Fn69_testBigIntVsBigIntResult() {
    const big1 = 5n;
    const big2 = 3n;
    const bigResult = 5n;
    return Object.is(big1, bigResult) && !Object.is(big2, bigResult);
}

// 测试点70：数组与类数组对象判断
export function Fn70_testArrayVsArrayLike() {
    const arr = [1, 2, 3];
    const arrayLike = { 0: 1, 1: 2, 2: 3, length: 3 };
    return !Object.is(arr, arrayLike);
}

// 测试点71：字符串与Unicode转义字符相同内容判断
export function Fn71_testStrVsUnicodeSameContent() {
    const str = "你好";
    const unicodeStr = "\u4F60\u597D";
    return Object.is(str, unicodeStr);
}

// 测试点72：字符串与Unicode转义字符不同内容判断
export function Fn72_testStrVsUnicodeDifferentContent() {
    const str = "你好";
    const unicodeStr = "\u4F60\u5973";
    return !Object.is(str, unicodeStr);
}

// 测试点73：对象原型修改后引用判断
export function Fn73_testObjProtoChangeReference() {
    const obj1 = {};
    const obj2 = obj1;
    Object.setPrototypeOf(obj1, { protoKey: "protoVal" });
    return Object.is(obj1, obj2);
}

// 测试点74：冻结对象与原对象引用判断
export function Fn74_testFrozenObjVsOriginal() {
    const obj1 = { a: 1 };
    const obj2 = obj1;
    Object.freeze(obj1);
    return Object.is(obj1, obj2);
}

// 测试点75：密封对象与原对象引用判断
export function Fn75_testSealedObjVsOriginal() {
    const obj1 = { b: 2 };
    const obj2 = obj1;
    Object.seal(obj1);
    return Object.is(obj1, obj2);
}

// 测试点76：不可扩展对象与原对象引用判断
export function Fn76_testNonExtensibleObjVsOriginal() {
    const obj1 = { c: 3 };
    const obj2 = obj1;
    Object.preventExtensions(obj1);
    return Object.is(obj1, obj2);
}

// 测试点77：Set删除元素后引用判断
export function Fn77_testSetDeleteElemReference() {
    const set1 = new Set([1, 2, 3]);
    const set2 = set1;
    set1.delete(2);
    return Object.is(set1, set2);
}

// 测试点78：Map删除键值对后引用判断
export function Fn78_testMapDeleteEntryReference() {
    const map1 = new Map([["k1", 1], ["k2", 2]]);
    const map2 = map1;
    map1.delete("k2");
    return Object.is(map1, map2);
}

// 测试点79：Symbol.toString()结果与原Symbol判断
export function Fn79_testSymbolToStringVsOriginal() {
    const sym = Symbol("test-sym");
    const symStr = sym.toString();
    return !Object.is(sym, symStr);
}

// 测试点80：BigInt.toString()结果与原BigInt判断
export function Fn80_testBigIntToStringVsOriginal() {
    const big = 9876n;
    const bigStr = big.toString();
    return !Object.is(big, bigStr);
}
// 测试点81：类实例与类实例（同构造不同实例）判断
export function Fn81_testClassInstancesDifferent() {
    class TestClass { constructor(val) { this.val = val; } }
    const inst1 = new TestClass(10);
    const inst2 = new TestClass(10);
    return !Object.is(inst1, inst2);
}

// 测试点82：类实例与类实例（同引用）判断
export function Fn82_testClassInstancesSameReference() {
    class TestClass { constructor(val) { this.val = val; } }
    const inst1 = new TestClass(20);
    const inst2 = inst1;
    return Object.is(inst1, inst2);
}

// 测试点83：ArrayBuffer相同内容不同实例判断
export function Fn83_testArrayBufferDifferentInstance() {
    const buf1 = new ArrayBuffer(8);
    const buf2 = new ArrayBuffer(8);
    return !Object.is(buf1, buf2);
}

// 测试点84：ArrayBuffer同引用判断
export function Fn84_testArrayBufferSameReference() {
    const buf1 = new ArrayBuffer(16);
    const buf2 = buf1;
    return Object.is(buf1, buf2);
}

// 测试点85：TypedArray相同内容不同实例判断
export function Fn85_testTypedArrayDifferentInstance() {
    const arr1 = new Uint8Array([1, 2, 3]);
    const arr2 = new Uint8Array([1, 2, 3]);
    return !Object.is(arr1, arr2);
}

// 测试点86：TypedArray共享缓冲区判断
export function Fn86_testTypedArraySharedBuffer() {
    const buf = new ArrayBuffer(8);
    const arr1 = new Float32Array(buf);
    const arr2 = new Float32Array(buf);
    return !Object.is(arr1, arr2);
}

// 测试点87：Promise不同实例（同状态同结果）判断
export function Fn87_testPromiseDifferentInstanceSameState() {
    const promise1 = Promise.resolve("success");
    const promise2 = Promise.resolve("success");
    return !Object.is(promise1, promise2);
}

// 测试点88：Promise同引用判断
export function Fn88_testPromiseSameReference() {
    const promise1 = Promise.reject("error");
    const promise2 = promise1;
    return Object.is(promise1, promise2);
}

// 测试点89：WeakSet不同实例（同元素）判断
export function Fn89_testWeakSetDifferentInstance() {
    const obj = {};
    const ws1 = new WeakSet([obj]);
    const ws2 = new WeakSet([obj]);
    return !Object.is(ws1, ws2);
}

// 测试点90：WeakMap不同实例（同键值）判断
export function Fn90_testWeakMapDifferentInstance() {
    const key = {};
    const wm1 = new WeakMap([[key, "val"]]);
    const wm2 = new WeakMap([[key, "val"]]);
    return !Object.is(wm1, wm2);
}

// 测试点92：数字与科学计数法相同数值判断
export function Fn92_testNumberVsScientificNotation() {
    const num = 123000;
    const sciNum = 1.23e5;
    return Object.is(num, sciNum);
}

// 测试点93：数字与科学计数法不同数值判断
export function Fn93_testNumberVsScientificNotationDifferent() {
    const num = 123000;
    const sciNum = 1.23e6;
    return !Object.is(num, sciNum);
}

// 测试点94：函数与bind后函数（同逻辑）判断
export function Fn94_testFuncVsBoundFunc() {
    const func = (x) => x + 1;
    const boundFunc = func.bind(null, 2);
    return !Object.is(func, boundFunc);
}

// 测试点95：Symbol与Symbol.keyFor获取key后的字符串判断
export function Fn95_testSymbolVsKeyForString() {
    const sym = Symbol.for("key-test");
    const keyStr = Symbol.keyFor(sym);
    return !Object.is(sym, keyStr);
}

// 测试点96：Date对象与toISOString结果判断
export function Fn96_testDateVsToISOString() {
    const date = new Date("2024-06-01");
    const isoStr = date.toISOString();
    return !Object.is(date, isoStr);
}

// 测试点97：空对象与Object.create(null)对象判断
export function Fn97_testEmptyObjVsCreateNullObj() {
    const emptyObj = {};
    const createNullObj = Object.create(null);
    return !Object.is(emptyObj, createNullObj);
}

// 测试点98：数组与展开运算符创建的新数组判断
export function Fn98_testArrayVsSpreadNewArray() {
    const arr = [1, 2, 3];
    const spreadArr = [...arr];
    return !Object.is(arr, spreadArr);
}

// 测试点99：对象与展开运算符创建的新对象判断
export function Fn99_testObjVsSpreadNewObj() {
    const obj = { a: 1, b: 2 };
    const spreadObj = { ...obj };
    return !Object.is(obj, spreadObj);
}

// 测试点100：NaN与Number.NaN判断
export function Fn100_testNaNVsNumberNaN() {
    const nan = NaN;
    const numberNaN = Number.NaN;
    return Object.is(nan, numberNaN);
}
// 测试点101：Number.MAX_SAFE_INTEGER与相同值判断
export function Fn101_testMaxSafeIntegerSame() {
    const maxSafe = Number.MAX_SAFE_INTEGER;
    const sameVal = 9007199254740991;
    return Object.is(maxSafe, sameVal);
}

// 测试点102：Number.MAX_SAFE_INTEGER与超出值判断
export function Fn102_testMaxSafeIntegerExceed() {
    const maxSafe = Number.MAX_SAFE_INTEGER;
    const exceedVal = 9007199254740992;
    return !Object.is(maxSafe, exceedVal);
}

// 测试点103：Number.MIN_SAFE_INTEGER与相同值判断
export function Fn103_testMinSafeIntegerSame() {
    const minSafe = Number.MIN_SAFE_INTEGER;
    const sameVal = -9007199254740991;
    return Object.is(minSafe, sameVal);
}

// 测试点107：RegExp.lastIndex修改后实例判断
export function Fn107_testRegExpLastIndexChange() {
    const reg1 = /abc/g;
    const reg2 = reg1;
    reg1.lastIndex = 5;
    return Object.is(reg1, reg2);
}

// 测试点108：函数name属性不同但逻辑相同判断
export function Fn108_testFuncDifferentNameSameLogic() {
    const funcA = function funcA() { return "func"; };
    const funcB = function funcB() { return "func"; };
    return !Object.is(funcA, funcB);
}

// 测试点109：匿名函数与命名函数判断
export function Fn109_testAnonymousVsNamedFunc() {
    const anonFunc = () => "anon";
    const namedFunc = function namedFunc() { return "anon"; };
    return !Object.is(anonFunc, namedFunc);
}

// 测试点110：Array.from生成数组与原数组判断
export function Fn110_testArrayFromVsOriginal() {
    const original = [1, 2, 3];
    const fromArr = Array.from(original);
    return !Object.is(original, fromArr);
}

// 测试点111：Object.assign生成对象与原对象判断
export function Fn111_testObjectAssignVsOriginal() {
    const original = { x: 1, y: 2 };
    const assignObj = Object.assign({}, original);
    return !Object.is(original, assignObj);
}

// 测试点112：JSON.parse解析结果与原对象判断
export function Fn112_testJsonParseVsOriginal() {
    const original = { a: 3, b: 4 };
    const jsonStr = JSON.stringify(original);
    const parsed = JSON.parse(jsonStr);
    return !Object.is(original, parsed);
}

// 测试点113：Symbol与Symbol.withStringTag判断
export function Fn113_testSymbolVsWithStringTag() {
    const sym = Symbol("tag");
    const tagSym = Symbol.toStringTag;
    return !Object.is(sym, tagSym);
}

// 测试点114：BigInt与Number.MIN_VALUE判断
export function Fn114_testBigIntVsMinValue() {
    const big = 1n;
    const minVal = Number.MIN_VALUE;
    return !Object.is(big, minVal);
}

// 测试点115：Date.now()结果与新Date时间戳判断
export function Fn115_testDateNowVsNewDateTimestamp() {
    const now = Date.now();
    const dateTimestamp = new Date().getTime();
    // 允许毫秒级误差（因两次调用可能间隔极短时间）
    return Math.abs(now - dateTimestamp) < 2 && !Object.is(now, dateTimestamp);
}

// 测试点116：Set.prototype.values()迭代器与原Set判断
export function Fn116_testSetValuesIteratorVsSet() {
    const set = new Set([1, 2]);
    const iterator = set.values();
    return !Object.is(set, iterator);
}

// 测试点117：Map.prototype.entries()迭代器与原Map判断
export function Fn117_testMapEntriesIteratorVsMap() {
    const map = new Map([["k", "v"]]);
    const iterator = map.entries();
    return !Object.is(map, iterator);
}

// 测试点118：类的静态属性与实例属性判断
export function Fn118_testClassStaticVsInstanceProp() {
    class Test { static staticProp = 100; constructor() { this.instanceProp = 100; } }
    const inst = new Test();
    return !Object.is(Test.staticProp, inst.instanceProp);
}

// 测试点119：继承类实例与父类实例判断
export function Fn119_testSubClassVsSuperClassInstance() {
    class Super { constructor() {} }
    class Sub extends Super { constructor() { super(); } }
    const superInst = new Super();
    const subInst = new Sub();
    return !Object.is(superInst, subInst);
}

// 测试点120：ArrayBuffer.slice()生成缓冲区与原缓冲区判断
export function Fn120_testArrayBufferSliceVsOriginal() {
    const original = new ArrayBuffer(16);
    const sliced = original.slice(0, 8);
    return !Object.is(original, sliced);
}

// 测试点121：TypedArray.subarray()生成数组与原数组判断
export function Fn121_testTypedArraySubarrayVsOriginal() {
    const original = new Int16Array([1, 2, 3, 4]);
    const subArr = original.subarray(1, 3);
    return !Object.is(original, subArr);
}

// 测试点122：Promise.all返回的Promise与原Promise数组判断
export function Fn122_testPromiseAllVsOriginalArray() {
    const promises = [Promise.resolve(1), Promise.resolve(2)];
    const allPromise = Promise.all(promises);
    return !Object.is(promises, allPromise);
}

// 测试点123：WeakSet.add()后实例与原实例判断
export function Fn123_testWeakSetAddVsOriginal() {
    const ws1 = new WeakSet();
    const ws2 = ws1;
    const obj = {};
    ws1.add(obj);
    return Object.is(ws1, ws2);
}

// 测试点124：WeakMap.set()后实例与原实例判断
export function Fn124_testWeakMapSetVsOriginal() {
    const wm1 = new WeakMap();
    const wm2 = wm1;
    const key = {};
    wm1.set(key, "val");
    return Object.is(wm1, wm2);
}

// 测试点125：字符串trim()前后判断
export function Fn125_testStringTrimVsOriginal() {
    const original = "  test trim  ";
    const trimmed = original.trim();
    return !Object.is(original, trimmed);
}

// 测试点126：数组reverse()后与原数组判断（原地修改）
export function Fn126_testArrayReverseVsOriginal() {
    const arr1 = [1, 2, 3];
    const arr2 = arr1;
    arr1.reverse();
    return Object.is(arr1, arr2);
}

// 测试点127：对象属性 descriptors 不同但值相同判断
export function Fn127_testObjDifferentDescriptorsSameValue() {
    const obj1 = {};
    const obj2 = {};
    Object.defineProperty(obj1, "key", { value: 5, writable: true });
    Object.defineProperty(obj2, "key", { value: 5, writable: false });
    return !Object.is(obj1, obj2);
}

// 测试点128：Number.POSITIVE_INFINITY与Infinity判断
export function Fn128_testPositiveInfinityVsInfinity() {
    const posInf = Number.POSITIVE_INFINITY;
    const inf = Infinity;
    return Object.is(posInf, inf);
}

// 测试点129：Number.NEGATIVE_INFINITY与-Infinity判断
export function Fn129_testNegativeInfinityVsNegativeInfinity() {
    const negInf = Number.NEGATIVE_INFINITY;
    const negInfDirect = -Infinity;
    return Object.is(negInf, negInfDirect);
}

// 测试点130：Symbol.prototype.description相同的Symbol判断
export function Fn130_testSymbolSameDescriptionDifferentInstance() {
    const sym1 = Symbol("same desc");
    const sym2 = Symbol("same desc");
    return !Object.is(sym1, sym2);
}

// 测试点131：Array.prototype.fill()填充后数组与原数组判断（原地修改）
export function Fn131_testArrayFillVsOriginal() {
    const arr1 = [1, 2, 3];
    const arr2 = arr1;
    arr1.fill(0);
    return Object.is(arr1, arr2);
}

// 测试点132：Object.keys()返回数组与原对象判断
export function Fn132_testObjectKeysVsOriginal() {
    const obj = { a: 1, b: 2 };
    const keysArr = Object.keys(obj);
    return !Object.is(obj, keysArr);
}

// 测试点133：Object.values()返回数组与原对象判断
export function Fn133_testObjectValuesVsOriginal() {
    const obj = { x: 3, y: 4 };
    const valuesArr = Object.values(obj);
    return !Object.is(obj, valuesArr);
}

// 测试点134：Object.entries()返回数组与原对象判断
export function Fn134_testObjectEntriesVsOriginal() {
    const obj = { m: 5, n: 6 };
    const entriesArr = Object.entries(obj);
    return !Object.is(obj, entriesArr);
}

// 测试点135：字符串concat()结果与原字符串判断（字符串不可变）
export function Fn135_testStringConcatVsOriginal() {
    const original = "hello";
    const concatenated = original.concat(" world");
    return !Object.is(original, concatenated);
}

// 测试点136：数组concat()结果与原数组判断（返回新数组）
export function Fn136_testArrayConcatVsOriginal() {
    const original = [1, 2];
    const concatenated = original.concat([3, 4]);
    return !Object.is(original, concatenated);
}

// 测试点137：Number.parseInt()结果与原字符串判断
export function Fn137_testParseIntVsOriginalStr() {
    const str = "123";
    const parsed = Number.parseInt(str);
    return !Object.is(str, parsed);
}

// 测试点138：Number.parseFloat()结果与原字符串判断
export function Fn138_testParseFloatVsOriginalStr() {
    const str = "123.45";
    const parsed = Number.parseFloat(str);
    return !Object.is(str, parsed);
}

// 测试点139：Boolean()转换结果与原数字判断
export function Fn139_testBooleanConversionVsOriginalNum() {
    const num = 0;
    const converted = Boolean(num);
    return !Object.is(num, converted);
}

// 测试点140：String()转换结果与原布尔值判断
export function Fn140_testStringConversionVsOriginalBool() {
    const bool = true;
    const converted = String(bool);
    return !Object.is(bool, converted);
}

// 测试点141：Number()转换结果与原布尔值判断
export function Fn141_testNumberConversionVsOriginalBool() {
    const bool = false;
    const converted = Number(bool);
    return !Object.is(bool, converted);
}

// 测试点142：类实例方法this指向修改后实例判断
export function Fn142_testClassMethodThisChangeInstance() {
    class Test { method() { return this; } }
    const inst1 = new Test();
    const inst2 = new Test();
    const boundMethod = inst1.method.bind(inst2);
    return !Object.is(inst1, boundMethod()) && Object.is(inst2, boundMethod());
}

// 测试点143：Proxy包装对象与原对象判断
export function Fn143_testProxyVsOriginalObj() {
    const original = { a: 1 };
    const proxy = new Proxy(original, {});
    return !Object.is(original, proxy);
}

// 测试点144：Reflect.get()返回值与原对象判断
export function Fn144_testReflectGetVsOriginalObj() {
    const obj = { key: "value" };
    const getVal = Reflect.get(obj, "key");
    return !Object.is(obj, getVal);
}

// 测试点145：Reflect.set()修改后对象与原对象判断（同引用）
export function Fn145_testReflectSetVsOriginalObj() {
    const obj1 = { x: 10 };
    const obj2 = obj1;
    Reflect.set(obj1, "x", 20);
    return Object.is(obj1, obj2);
}

// 测试点146：Date.setTime()修改后对象与原对象判断（同引用）
export function Fn146_testDateSetTimeVsOriginal() {
    const date1 = new Date();
    const date2 = date1;
    date1.setTime(date1.getTime() + 3600000);
    return Object.is(date1, date2);
}

// 测试点147：Set.clear()清空后实例与原实例判断（同引用）
export function Fn147_testSetClearVsOriginalInstance() {
    const set1 = new Set([1, 2]);
    const set2 = set1;
    set1.clear();
    return Object.is(set1, set2);
}

// 测试点148：Map.clear()清空后实例与原实例判断（同引用）
export function Fn148_testMapClearVsOriginalInstance() {
    const map1 = new Map([["a", 1]]);
    const map2 = map1;
    map1.clear();
    return Object.is(map1, map2);
}

// 测试点149：Symbol.for()与Symbol()相同key判断
export function Fn149_testSymbolForVsSymbolSameKey() {
    const symFor = Symbol.for("test-key");
    const sym = Symbol("test-key");
    return !Object.is(symFor, sym);
}

// 测试点150：Symbol.keyFor()返回值与Symbol.for()创建的Symbol判断
export function Fn150_testSymbolKeyForVsSymbolFor() {
    const sym = Symbol.for("key-150");
    const key = Symbol.keyFor(sym);
    return !Object.is(sym, key);
}

// 测试点151：BigInt()转换结果与原数字判断
export function Fn151_testBigIntConversionVsOriginalNum() {
    const num = 123;
    const converted = BigInt(num);
    return !Object.is(num, converted);
}

// 测试点152：BigInt()转换结果与原字符串判断
export function Fn152_testBigIntConversionVsOriginalStr() {
    const str = "456";
    const converted = BigInt(str);
    return !Object.is(str, converted);
}

// 测试点153：Array.prototype.flat()结果与原数组判断（返回新数组）
export function Fn153_testArrayFlatVsOriginal() {
    const original = [1, [2, [3]]];
    const flattened = original.flat(2);
    return !Object.is(original, flattened);
}

// 测试点154：Array.prototype.filter()结果与原数组判断（返回新数组）
export function Fn154_testArrayFilterVsOriginal() {
    const original = [1, 2, 3, 4];
    const filtered = original.filter(item => item % 2 === 0);
    return !Object.is(original, filtered);
}

// 测试点155：Array.prototype.map()结果与原数组判断（返回新数组）
export function Fn155_testArrayMapVsOriginal() {
    const original = [1, 2, 3];
    const mapped = original.map(item => item * 2);
    return !Object.is(original, mapped);
}

// 测试点156：字符串slice()结果与原字符串判断（返回新字符串）
export function Fn156_testStringSliceVsOriginal() {
    const original = "abcdef";
    const sliced = original.slice(2, 4);
    return !Object.is(original, sliced);
}

// 测试点157：字符串substring()结果与原字符串判断（返回新字符串）
export function Fn157_testStringSubstringVsOriginal() {
    const original = "hello world";
    const subbed = original.substring(6, 11);
    return !Object.is(original, subbed);
}

// 测试点158：字符串substr()结果与原字符串判断（返回新字符串）
export function Fn158_testStringSubstrVsOriginal() {
    const original = "javascript";
    const subbed = original.substr(4, 6);
    return !Object.is(original, subbed);
}

// 测试点159：Number.EPSILON与接近值判断
export function Fn159_testNumberEpsilonVsCloseValue() {
    const epsilon = Number.EPSILON;
    const closeVal = epsilon + 1e-30;
    return !Object.is(epsilon, closeVal);
}

// 测试点160：空字符串与String.prototype.toString()结果判断
export function Fn160_testEmptyStrVsStringToString() {
    const emptyStr = "";
    const toStringResult = emptyStr.toString();
    return Object.is(emptyStr, toStringResult);
}
// 测试点161：String.prototype.toUpperCase()结果与原字符串判断
export function Fn161_testStringToUpperVsOriginal() {
    const original = "hello";
    const upperStr = original.toUpperCase();
    return !Object.is(original, upperStr);
}

// 测试点162：String.prototype.toLowerCase()结果与原字符串判断
export function Fn162_testStringToLowerVsOriginal() {
    const original = "HELLO";
    const lowerStr = original.toLowerCase();
    return !Object.is(original, lowerStr);
}

// 测试点163：Array.prototype.pop()后数组与原数组判断（原地修改）
export function Fn163_testArrayPopVsOriginal() {
    const arr1 = [1, 2, 3];
    const arr2 = arr1;
    arr1.pop();
    return Object.is(arr1, arr2);
}

// 测试点164：Array.prototype.push()后数组与原数组判断（原地修改）
export function Fn164_testArrayPushVsOriginal() {
    const arr1 = [1, 2];
    const arr2 = arr1;
    arr1.push(3);
    return Object.is(arr1, arr2);
}

// 测试点165：Array.prototype.shift()后数组与原数组判断（原地修改）
export function Fn165_testArrayShiftVsOriginal() {
    const arr1 = [1, 2, 3];
    const arr2 = arr1;
    arr1.shift();
    return Object.is(arr1, arr2);
}

// 测试点166：Array.prototype.unshift()后数组与原数组判断（原地修改）
export function Fn166_testArrayUnshiftVsOriginal() {
    const arr1 = [2, 3];
    const arr2 = arr1;
    arr1.unshift(1);
    return Object.is(arr1, arr2);
}

// 测试点167：Number.prototype.toString()结果与原数字判断
export function Fn167_testNumberToStringVsOriginal() {
    const num = 123;
    const numStr = num.toString();
    return !Object.is(num, numStr);
}

// 测试点168：Boolean.prototype.toString()结果与原布尔值判断
export function Fn168_testBooleanToStringVsOriginal() {
    const bool = false;
    const boolStr = bool.toString();
    return !Object.is(bool, boolStr);
}

// 测试点169：BigInt.prototype.toString()结果与原BigInt判断
export function Fn169_testBigIntToStringVsOriginal() {
    const big = 456n;
    const bigStr = big.toString();
    return !Object.is(big, bigStr);
}

// 测试点170：Date.prototype.toDateString()结果与原Date判断
export function Fn170_testDateToDateStrVsOriginal() {
    const date = new Date();
    const dateStr = date.toDateString();
    return !Object.is(date, dateStr);
}

// 测试点171：Date.prototype.toTimeString()结果与原Date判断
export function Fn171_testDateToTimeStrVsOriginal() {
    const date = new Date();
    const timeStr = date.toTimeString();
    return !Object.is(date, timeStr);
}

// 测试点172：Proxy包装的数组与原数组判断
export function Fn172_testProxyArrayVsOriginal() {
    const originalArr = [1, 2, 3];
    const proxyArr = new Proxy(originalArr, {});
    return !Object.is(originalArr, proxyArr);
}

// 测试点173：Reflect.deleteProperty()修改后对象与原对象判断（同引用）
export function Fn173_testReflectDeleteVsOriginal() {
    const obj1 = { a: 1, b: 2 };
    const obj2 = obj1;
    Reflect.deleteProperty(obj1, "b");
    return Object.is(obj1, obj2);
}

// 测试点174：Object.freeze()后的对象与原对象判断（同引用）
export function Fn174_testFrozenObjReference() {
    const obj1 = { x: 10 };
    const obj2 = obj1;
    Object.freeze(obj1);
    return Object.is(obj1, obj2);
}

// 测试点175：Object.seal()后的对象与原对象判断（同引用）
export function Fn175_testSealedObjReference() {
    const obj1 = { y: 20 };
    const obj2 = obj1;
    Object.seal(obj1);
    return Object.is(obj1, obj2);
}

// 测试点176：类的getter属性返回值与原实例判断
export function Fn176_testClassGetterVsInstance() {
    class Test { get prop() { return 100; } }
    const inst = new Test();
    return !Object.is(inst, inst.prop);
}

// 测试点177：类的setter修改后实例与原实例判断（同引用）
export function Fn177_testClassSetterVsInstance() {
    class Test { constructor() { this.val = 0; } set prop(v) { this.val = v; } }
    const inst1 = new Test();
    const inst2 = inst1;
    inst1.prop = 50;
    return Object.is(inst1, inst2);
}

// 测试点178：TypedArray.prototype.set()修改后数组与原数组判断（同引用）
export function Fn178_testTypedArraySetVsOriginal() {
    const arr1 = new Uint8Array([1, 2, 3]);
    const arr2 = arr1;
    arr1.set([4, 5], 1);
    return Object.is(arr1, arr2);
}

// 测试点180：Promise.resolve()包装的原始值与原原始值判断
export function Fn180_testPromiseResolvePrimVsOriginal() {
    const original = "test";
    const promise = Promise.resolve(original);
    return !Object.is(original, promise);
}

// 测试点181：Promise.reject()包装的错误与原错误判断
export function Fn181_testPromiseRejectErrVsOriginal() {
    const originalErr = new Error("test err");
    const promise = Promise.reject(originalErr);
    return !Object.is(originalErr, promise);
}

// 测试点182：WeakSet.delete()后实例与原实例判断（同引用）
export function Fn182_testWeakSetDeleteVsOriginal() {
    const ws1 = new WeakSet();
    const ws2 = ws1;
    const obj = {};
    ws1.add(obj);
    ws1.delete(obj);
    return Object.is(ws1, ws2);
}

// 测试点183：WeakMap.delete()后实例与原实例判断（同引用）
export function Fn183_testWeakMapDeleteVsOriginal() {
    const wm1 = new WeakMap();
    const wm2 = wm1;
    const key = {};
    wm1.set(key, "val");
    wm1.delete(key);
    return Object.is(wm1, wm2);
}

// 测试点184：字符串includes()返回值与原字符串判断
export function Fn184_testStringIncludesVsOriginal() {
    const original = "hello world";
    const includesRes = original.includes("world");
    return !Object.is(original, includesRes);
}

// 测试点185：数组includes()返回值与原数组判断
export function Fn185_testArrayIncludesVsOriginal() {
    const original = [1, 2, 3];
    const includesRes = original.includes(2);
    return !Object.is(original, includesRes);
}

// 测试点186：Set.has()返回值与原Set判断
export function Fn186_testSetHasVsOriginal() {
    const set = new Set([1, 2]);
    const hasRes = set.has(2);
    return !Object.is(set, hasRes);
}

// 测试点187：Map.has()返回值与原Map判断
export function Fn187_testMapHasVsOriginal() {
    const map = new Map([["a", 1]]);
    const hasRes = map.has("a");
    return !Object.is(map, hasRes);
}

// 测试点188：Symbol.prototype.valueOf()结果与原Symbol判断
export function Fn188_testSymbolValueOfVsOriginal() {
    const sym = Symbol("test");
    const valueOfRes = sym.valueOf();
    return Object.is(sym, valueOfRes);
}

// 测试点189：BigInt.prototype.valueOf()结果与原BigInt判断
export function Fn189_testBigIntValueOfVsOriginal() {
    const big = 789n;
    const valueOfRes = big.valueOf();
    return Object.is(big, valueOfRes);
}

// 测试点190：Number.prototype.valueOf()结果与原Number判断
export function Fn190_testNumberValueOfVsOriginal() {
    const num = 123.45;
    const valueOfRes = num.valueOf();
    return Object.is(num, valueOfRes);
}
// 测试点191：Array.prototype.sort()排序后数组与原数组判断（原地修改）
export function Fn191_testArraySortVsOriginal() {
    const arr1 = [3, 1, 2];
    const arr2 = arr1;
    arr1.sort();
    return Object.is(arr1, arr2);
}

// 测试点192：Array.prototype.splice()修改后数组与原数组判断（原地修改）
export function Fn192_testArraySpliceVsOriginal() {
    const arr1 = [1, 2, 3, 4];
    const arr2 = arr1;
    arr1.splice(1, 2, 5);
    return Object.is(arr1, arr2);
}

// 测试点193：String.prototype.replace()结果与原字符串判断（返回新字符串）
export function Fn193_testStringReplaceVsOriginal() {
    const original = "hello java";
    const replaced = original.replace("java", "js");
    return !Object.is(original, replaced);
}

// 测试点194：String.prototype.match()结果与原字符串判断
export function Fn194_testStringMatchVsOriginal() {
    const original = "test123";
    const matched = original.match(/\d+/);
    return !Object.is(original, matched);
}

// 测试点195：RegExp.test()返回值与原RegExp判断
export function Fn195_testRegExpTestVsOriginal() {
    const reg = /abc/;
    const testRes = reg.test("abc123");
    return !Object.is(reg, testRes);
}

// 测试点196：RegExp.exec()结果与原RegExp判断
export function Fn196_testRegExpExecVsOriginal() {
    const reg = /\w+/g;
    const execRes = reg.exec("hello");
    return !Object.is(reg, execRes);
}

// 测试点197：Object.getPrototypeOf()返回值与原对象判断
export function Fn197_testGetPrototypeOfVsOriginal() {
    const obj = {};
    const proto = Object.getPrototypeOf(obj);
    return !Object.is(obj, proto);
}

// 测试点198：Object.setPrototypeOf()修改后对象与原对象判断（同引用）
export function Fn198_testSetPrototypeOfVsOriginal() {
    const obj1 = {};
    const obj2 = obj1;
    const newProto = { protoMethod: () => {} };
    Object.setPrototypeOf(obj1, newProto);
    return Object.is(obj1, obj2);
}

// 测试点199：Function.prototype.call()返回值与原函数判断
export function Fn199_testFuncCallVsOriginal() {
    const func = (x) => x * 3;
    const callRes = func.call(null, 2);
    return !Object.is(func, callRes);
}

// 测试点200：Function.prototype.apply()返回值与原函数判断
export function Fn200_testFuncApplyVsOriginal() {
    const func = (a, b) => a + b;
    const applyRes = func.apply(null, [3, 4]);
    return !Object.is(func, applyRes);
}

// 测试点201：Array.prototype.reduce()返回值与原数组判断
export function Fn201_testArrayReduceVsOriginal() {
    const original = [1, 2, 3];
    const reduceRes = original.reduce((acc, curr) => acc + curr, 0);
    return !Object.is(original, reduceRes);
}

// 测试点202：Array.prototype.every()返回值与原数组判断
export function Fn202_testArrayEveryVsOriginal() {
    const original = [2, 4, 6];
    const everyRes = original.every(item => item % 2 === 0);
    return !Object.is(original, everyRes);
}

// 测试点203：Array.prototype.some()返回值与原数组判断
export function Fn203_testArraySomeVsOriginal() {
    const original = [1, 3, 5];
    const someRes = original.some(item => item % 2 === 0);
    return !Object.is(original, someRes);
}

// 测试点204：Set.prototype.size属性值与原Set判断
export function Fn204_testSetSizeVsOriginal() {
    const set = new Set([1, 2, 3]);
    const size = set.size;
    return !Object.is(set, size);
}

// 测试点205：Map.prototype.size属性值与原Map判断
export function Fn205_testMapSizeVsOriginal() {
    const map = new Map([["a", 1], ["b", 2]]);
    const size = map.size;
    return !Object.is(map, size);
}

// 测试点207：ArrayBuffer.byteLength属性值与原ArrayBuffer判断
export function Fn207_testArrayBufferByteLengthVsOriginal() {
    const buf = new ArrayBuffer(16);
    const byteLength = buf.byteLength;
    return !Object.is(buf, byteLength);
}

// 测试点208：TypedArray.byteLength属性值与原TypedArray判断
export function Fn208_testTypedArrayByteLengthVsOriginal() {
    const arr = new Int32Array([1, 2, 3]);
    const byteLength = arr.byteLength;
    return !Object.is(arr, byteLength);
}

// 测试点209：Date.prototype.getTimezoneOffset()返回值与原Date判断
export function Fn209_testDateTimezoneOffsetVsOriginal() {
    const date = new Date();
    const offset = date.getTimezoneOffset();
    return !Object.is(date, offset);
}

// 测试点210：Promise.prototype.then()返回的新Promise与原Promise判断
export function Fn210_testPromiseThenVsOriginal() {
    const originalPromise = Promise.resolve(1);
    const newPromise = originalPromise.then(res => res + 1);
    return !Object.is(originalPromise, newPromise);
}

// 测试点211：Promise.prototype.catch()返回的新Promise与原Promise判断
export function Fn211_testPromiseCatchVsOriginal() {
    const originalPromise = Promise.reject(new Error("err"));
    const newPromise = originalPromise.catch(err => err);
    return !Object.is(originalPromise, newPromise);
}

// 测试点212：Proxy.get()拦截返回值与原Proxy判断
export function Fn212_testProxyGetReturnVsProxy() {
    const target = { a: 1 };
    const proxy = new Proxy(target, { get: (t, k) => t[k] * 2 });
    const getRes = proxy.a;
    return !Object.is(proxy, getRes);
}

// 测试点213：Proxy.set()拦截返回值与原Proxy判断
export function Fn213_testProxySetReturnVsProxy() {
    const target = { b: 2 };
    const proxy = new Proxy(target, { set: (t, k, v) => { t[k] = v; return true; } });
    const setRes = proxy.b = 3;
    return !Object.is(proxy, setRes);
}

// 测试点214：Reflect.construct()返回的实例与原构造函数判断
export function Fn214_testReflectConstructVsCtor() {
    class Test {}
    const inst = Reflect.construct(Test, []);
    return !Object.is(Test, inst);
}

// 测试点215：Reflect.apply()返回值与原函数判断
export function Fn215_testReflectApplyVsFunc() {
    const func = (x, y) => x * y;
    const applyRes = Reflect.apply(func, null, [3, 4]);
    return !Object.is(func, applyRes);
}

// 测试点216：String.prototype.padStart()结果与原字符串判断
export function Fn216_testStringPadStartVsOriginal() {
    const original = "5";
    const padded = original.padStart(3, "0");
    return !Object.is(original, padded);
}

// 测试点217：String.prototype.padEnd()结果与原字符串判断
export function Fn217_testStringPadEndVsOriginal() {
    const original = "test";
    const padded = original.padEnd(6, "-");
    return !Object.is(original, padded);
}

// 测试点218：Array.prototype.flatMap()结果与原数组判断（返回新数组）
export function Fn218_testArrayFlatMapVsOriginal() {
    const original = [1, 2, 3];
    const flatMapped = original.flatMap(item => [item, item * 2]);
    return !Object.is(original, flatMapped);
}

// 测试点219：Object.defineProperty()修改后对象与原对象判断（同引用）
export function Fn219_testDefinePropertyVsOriginal() {
    const obj1 = {};
    const obj2 = obj1;
    Object.defineProperty(obj1, "key", { value: 100, enumerable: true });
    return Object.is(obj1, obj2);
}

// 测试点220：Object.defineProperties()修改后对象与原对象判断（同引用）
export function Fn220_testDefinePropertiesVsOriginal() {
    const obj1 = {};
    const obj2 = obj1;
    Object.defineProperties(obj1, {
        a: { value: 1, writable: true },
        b: { value: 2, enumerable: false }
    });
    return Object.is(obj1, obj2);
}
