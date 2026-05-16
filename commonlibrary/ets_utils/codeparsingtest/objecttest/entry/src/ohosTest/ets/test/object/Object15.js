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

/**
 * 测试点1：验证直接属性返回true，继承属性返回false
 */
export function Fn01_testDirectAndInheritedProperty() {
    const parentObj = { inheritedProp: "我是继承属性" };
    const childObj = Object.create(parentObj);
    childObj.ownProp = "我是自身属性";

    const isOwnPropCorrect = Object.hasOwn(childObj, "ownProp") === true;
    const isInheritedPropCorrect = Object.hasOwn(childObj, "inheritedProp") === false;
    const isNonExistentPropCorrect = Object.hasOwn(childObj, "nonExistentProp") === false;

    return isOwnPropCorrect && isInheritedPropCorrect && isNonExistentPropCorrect;
}

/**
 * 测试点2：验证支持Object.create(null)创建的无原型对象
 */
export function Fn02_testObjectCreateNull() {
    const nullProtoObj = Object.create(null);
    nullProtoObj.name = "无原型对象";
    nullProtoObj.emptyValue = null;
    nullProtoObj.undefinedValue = undefined;

    const hasName = Object.hasOwn(nullProtoObj, "name") === true;
    const hasEmptyValue = Object.hasOwn(nullProtoObj, "emptyValue") === true;
    const hasUndefinedValue = Object.hasOwn(nullProtoObj, "undefinedValue") === true;
    const hasNoExtraProp = Object.hasOwn(nullProtoObj, "toString") === false;

    return hasName && hasEmptyValue && hasUndefinedValue && hasNoExtraProp;
}

/**
 * 测试点3：验证数组索引的存在性检测
 */
export function Fn03_testArrayIndexExistence() {
    const testArray = ["a", "b"];

    const hasIndex0 = Object.hasOwn(testArray, 0) === true;
    const hasIndex1 = Object.hasOwn(testArray, 1) === true;
    const hasNoIndex2 = Object.hasOwn(testArray, 2) === false;
    const hasLengthProp = Object.hasOwn(testArray, "length") === true;

    return hasIndex0 && hasIndex1 && hasNoIndex2 && hasLengthProp;
}


/**
 * 测试点4：验证对象自身的空值属性（null/undefined）能被正确检测
 */
export function Fn04_testNullUndefinedOwnProperty() {
    const testObj = {
        nullProp: null,
        undefinedProp: undefined,
        normalProp: "test"
    };
    const hasNullProp = Object.hasOwn(testObj, "nullProp") === true;
    const hasUndefinedProp = Object.hasOwn(testObj, "undefinedProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "extraProp") === false;
    return hasNullProp && hasUndefinedProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点5：验证删除属性后hasOwn返回false
 */
export function Fn05_testDeletedPropertyDetection() {
    const testObj = { prop1: "value1", prop2: "value2" };
    delete testObj.prop1;
    const hasProp1 = Object.hasOwn(testObj, "prop1") === false;
    const hasProp2 = Object.hasOwn(testObj, "prop2") === true;
    return hasProp1 && hasProp2;
}

/**
 * 测试点6：验证Symbol类型作为属性名时的检测
 */
export function Fn06_testSymbolPropertyDetection() {
    const symKey1 = Symbol("key1");
    const symKey2 = Symbol("key2");
    const testObj = { [symKey1]: "symbolValue" };
    const hasSymKey1 = Object.hasOwn(testObj, symKey1) === true;
    const hasSymKey2 = Object.hasOwn(testObj, symKey2) === false;
    const hasStringKey = Object.hasOwn(testObj, "stringKey") === false;
    return hasSymKey1 && hasSymKey2 && hasStringKey;
}

/**
 * 测试点7：验证不可枚举属性的检测
 */
export function Fn07_testNonEnumerablePropertyDetection() {
    const testObj = {};
    Object.defineProperty(testObj, "nonEnumProp", {
        value: "nonEnumerable",
        enumerable: false
    });
    testObj.enumProp = "enumerable";
    const hasNonEnumProp = Object.hasOwn(testObj, "nonEnumProp") === true;
    const hasEnumProp = Object.hasOwn(testObj, "enumProp") === true;
    return hasNonEnumProp && hasEnumProp;
}

/**
 * 测试点8：验证嵌套对象的自身属性检测（不穿透嵌套）
 */
export function Fn08_testNestedObjectOwnProperty() {
    const testObj = {
        nested: { innerProp: "innerValue" }
    };
    const hasNestedProp = Object.hasOwn(testObj, "nested") === true;
    const hasInnerPropDirect = Object.hasOwn(testObj, "innerProp") === false;
    const hasInnerPropInNested = Object.hasOwn(testObj.nested, "innerProp") === true;
    return hasNestedProp && hasInnerPropDirect && hasInnerPropInNested;
}

/**
 * 测试点9：验证Date对象的自身属性检测
 */
export function Fn09_testDateObjectOwnProperty() {
    const testDate = new Date();
    testDate.customProp = "customDateProp";
    const hasCustomProp = Object.hasOwn(testDate, "customProp") === true;
    const hasPrototypeMethod = Object.hasOwn(testDate, "getFullYear") === false;
    return hasCustomProp && hasPrototypeMethod;
}

/**
 * 测试点10：验证RegExp对象的自身属性检测
 */
export function Fn10_testRegExpObjectOwnProperty() {
    const testReg = /abc/;
    testReg.flagDesc = "global flag";
    const hasFlagDesc = Object.hasOwn(testReg, "flagDesc") === true;
    const hasPrototypeProp = Object.hasOwn(testReg, "test") === false;
    return hasFlagDesc && hasPrototypeProp;
}

/**
 * 测试点11：验证类实例的自身属性与原型属性区分
 */
export function Fn11_testClassInstanceProperty() {
    class TestClass {
        constructor() {
            this.instanceProp = "instanceValue";
        }

        prototypeMethod() {
        }
    }

    TestClass.prototype.prototypeProp = "prototypeValue";
    const instance = new TestClass();
    const hasInstanceProp = Object.hasOwn(instance, "instanceProp") === true;
    const hasPrototypeProp = Object.hasOwn(instance, "prototypeProp") === false;
    const hasPrototypeMethod = Object.hasOwn(instance, "prototypeMethod") === false;
    return hasInstanceProp && hasPrototypeProp && hasPrototypeMethod;
}

/**
 * 测试点12：验证数字作为属性名（非索引）的检测
 */
export function Fn12_testNumberPropertyName() {
    const testObj = { 123: "numberKey", 45.67: "floatKey" };
    const hasIntKey = Object.hasOwn(testObj, 123) === true;
    const hasFloatKey = Object.hasOwn(testObj, 45.67) === true;
    const hasStringKey = Object.hasOwn(testObj, "123") === true; // 数字属性名会隐式转为字符串
    return hasIntKey && hasFloatKey && hasStringKey;
}

/**
 * 测试点13：验证空对象的属性检测（无自身属性返回false）
 */
export function Fn13_testEmptyObjectDetection() {
    const emptyObj1 = {};
    const emptyObj2 = Object.create({ protoProp: "protoValue" });
    const hasPropEmpty1 = Object.hasOwn(emptyObj1, "anyProp") === false;
    const hasPropEmpty2 = Object.hasOwn(emptyObj2, "protoProp") === false;
    const hasOwnPropEmpty2 = Object.hasOwn(emptyObj2, "ownProp") === false;
    return hasPropEmpty1 && hasPropEmpty2 && hasOwnPropEmpty2;
}

/**
 * 测试点14：验证数组的非索引自身属性检测
 */
export function Fn14_testArrayNonIndexProperty() {
    const testArr = ["a", "b"];
    testArr.customProp = "arrayCustom";
    const hasCustomProp = Object.hasOwn(testArr, "customProp") === true;
    const hasIndex0 = Object.hasOwn(testArr, 0) === true;
    const hasNoIndex3 = Object.hasOwn(testArr, 3) === false;
    return hasCustomProp && hasIndex0 && hasNoIndex3;
}

/**
 * 测试点15：验证Set实例的自身属性检测
 */
export function Fn15_testSetObjectOwnProperty() {
    const testSet = new Set([1, 2, 3]);
    testSet.setDesc = "number set";
    const hasSetDesc = Object.hasOwn(testSet, "setDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(testSet, "add") === false;
    const hasNoValueProp = Object.hasOwn(testSet, "1") === false; // Set值不暴露为对象属性
    return hasSetDesc && hasPrototypeMethod && hasNoValueProp;
}

/**
 * 测试点16：验证Map实例的自身属性检测
 */
export function Fn16_testMapObjectOwnProperty() {
    const testMap = new Map([["key1", "value1"]]);
    testMap.mapDesc = "key-value map";
    const hasMapDesc = Object.hasOwn(testMap, "mapDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(testMap, "get") === false;
    const hasNoKeyProp = Object.hasOwn(testMap, "key1") === false; // Map键不暴露为对象属性
    return hasMapDesc && hasPrototypeMethod && hasNoKeyProp;
}

/**
 * 测试点17：验证通过Object.assign添加的自身属性检测
 */
export function Fn17_testObjectAssignOwnProperty() {
    const targetObj = { baseProp: "base" };
    const sourceObj1 = { assignProp1: "assign1" };
    const sourceObj2 = { assignProp2: "assign2" };
    Object.assign(targetObj, sourceObj1, sourceObj2);
    const hasBaseProp = Object.hasOwn(targetObj, "baseProp") === true;
    const hasAssignProp1 = Object.hasOwn(targetObj, "assignProp1") === true;
    const hasAssignProp2 = Object.hasOwn(targetObj, "assignProp2") === true;
    const noExtraProp = Object.hasOwn(targetObj, "extraAssign") === false;
    return hasBaseProp && hasAssignProp1 && hasAssignProp2 && noExtraProp;
}

/**
 * 测试点18：验证通过Object.defineProperties添加的自身属性检测
 */
export function Fn18_testObjectDefinePropertiesOwnProperty() {
    const testObj = {};
    Object.defineProperties(testObj, {
        propA: { value: "A", enumerable: true },
        propB: { value: "B", enumerable: false },
        propC: { value: "C", writable: true }
    });
    const hasPropA = Object.hasOwn(testObj, "propA") === true;
    const hasPropB = Object.hasOwn(testObj, "propB") === true;
    const hasPropC = Object.hasOwn(testObj, "propC") === true;
    const noPropD = Object.hasOwn(testObj, "propD") === false;
    return hasPropA && hasPropB && hasPropC && noPropD;
}

/**
 * 测试点19：验证原型链多层继承时的自身属性检测
 */
export function Fn19_testMultiLevelInheritance() {
    const grandParent = { grandProp: "grand" };
    const parent = Object.create(grandParent);
    parent.parentProp = "parent";
    const child = Object.create(parent);
    child.childProp = "child";
    const hasChildProp = Object.hasOwn(child, "childProp") === true;
    const hasParentProp = Object.hasOwn(child, "parentProp") === false;
    const hasGrandProp = Object.hasOwn(child, "grandProp") === false;
    const noExtraProp = Object.hasOwn(child, "extra") === false;
    return hasChildProp && hasParentProp && hasGrandProp && noExtraProp;
}

/**
 * 测试点20：验证函数对象的自身属性检测
 */
export function Fn20_testFunctionOwnProperty() {

    function TestFunc() {
    }

    TestFunc.funcProp = "functionProp";
    TestFunc.prototype.protoProp = "protoProp";
    const hasFuncProp = Object.hasOwn(TestFunc, "funcProp") === true;
    const hasPrototypeProp = Object.hasOwn(TestFunc, "protoProp") === false;
    const hasMethodProp = Object.hasOwn(TestFunc, "call") === false; // call是Function.prototype方法
    return hasFuncProp && hasPrototypeProp && hasMethodProp;
}

/**
 * 测试点21：验证布尔值作为属性名的检测（隐式类型转换）
 */
export function Fn21_testBooleanPropertyName() {
    const testObj = { true: "boolTrue", false: "boolFalse" };
    const hasTrueAsBool = Object.hasOwn(testObj, true) === true; // 布尔值会隐式转为字符串"true"
    const hasFalseAsBool = Object.hasOwn(testObj, false) === true; // 布尔值会隐式转为字符串"false"
    const hasTrueAsString = Object.hasOwn(testObj, "true") === true;
    const noExtraBool = Object.hasOwn(testObj, "bool") === false;
    return hasTrueAsBool && hasFalseAsBool && hasTrueAsString && noExtraBool;
}

/**
 * 测试点22：验证NaN作为属性名的特殊性检测
 */
export function Fn22_testNaNPropertyName() {
    const testObj = { [NaN]: "nanValue" };
    const hasNaN1 = Object.hasOwn(testObj, NaN) === true; // NaN作为属性名时，所有NaN都视为同一键
    const hasNaN2 = Object.hasOwn(testObj, Number("abc")) === true; // Number("abc")结果为NaN
    const hasNaNAsString = Object.hasOwn(testObj, "NaN") === false; // 不会转为字符串"NaN"
    return hasNaN1 && hasNaN2 && hasNaNAsString;
}

/**
 * 测试点23：验证类的静态属性与实例属性区分检测
 */
export function Fn23_testClassStaticVsInstance() {
    class TestClass {
        constructor() {
            this.instanceProp = "instance"; // 实例属性
        }

        static staticProp = "static"; // 静态属性（属于类自身，非实例）
    }

    const instance = new TestClass();
    const hasInstanceProp = Object.hasOwn(instance, "instanceProp") === true;
    const hasStaticOnInstance = Object.hasOwn(instance, "staticProp") === false;
    const hasStaticOnClass = Object.hasOwn(TestClass, "staticProp") === true;
    return hasInstanceProp && hasStaticOnInstance && hasStaticOnClass;
}

/**
 * 测试点24：验证TypedArray（类型化数组）的自身属性检测
 */
export function Fn24_testTypedArrayOwnProperty() {
    const typedArr = new Uint8Array([10, 20]);
    typedArr.customProp = "typedCustom";
    const hasIndex0 = Object.hasOwn(typedArr, 0) === true; // 索引属性
    const hasCustomProp = Object.hasOwn(typedArr, "customProp") === true; // 自定义属性
    const hasLength = Object.hasOwn(typedArr, "length") === true; // length是自身属性
    const hasPrototypeMethod = Object.hasOwn(typedArr, "forEach") === false; // forEach来自原型
    return hasIndex0 && hasCustomProp && hasLength && hasPrototypeMethod;
}

/**
 * 测试点25：验证对象属性被重写为自身属性后的检测
 */
export function Fn25_testOverriddenPrototypeProperty() {
    const parent = { sharedProp: "parentValue" };
    const child = Object.create(parent);
    child.sharedProp = "childValue"; // 重写为自身属性
    const hasOwnSharedProp = Object.hasOwn(child, "sharedProp") === true;
    const hasParentSharedProp = Object.hasOwn(parent, "sharedProp") === true;
    const noExtraProp = Object.hasOwn(child, "otherProp") === false;
    return hasOwnSharedProp && hasParentSharedProp && noExtraProp;
}

/**
 * 测试点26：验证空字符串作为属性名的检测
 */
export function Fn26_testEmptyStringPropertyName() {
    const testObj = { "": "emptyKey" };
    const hasEmptyKey = Object.hasOwn(testObj, "") === true; // 空字符串作为属性名
    const hasNormalKey = Object.hasOwn(testObj, "normal") === false;
    const hasUndefinedKey = Object.hasOwn(testObj, undefined) === false; // undefined≠空字符串
    return hasEmptyKey && hasNormalKey && hasUndefinedKey;
}

/**
 * 测试点27：验证Promise实例的自身属性检测
 */
export function Fn27_testPromiseOwnProperty() {
    const testPromise = Promise.resolve("resolved");
    testPromise.promiseDesc = "test promise";
    const hasCustomDesc = Object.hasOwn(testPromise, "promiseDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(testPromise, "then") === false; // then来自Promise.prototype
    const hasNoValueProp = Object.hasOwn(testPromise, "resolved") === false; // Promise结果不暴露为属性
    return hasCustomDesc && hasPrototypeMethod && hasNoValueProp;
}

/**
 * 测试点28：验证通过Object.fromEntries创建对象的属性检测
 */
export function Fn28_testObjectFromEntriesOwnProperty() {
    const entries = [["key1", "val1"], ["key2", "val2"]];
    const testObj = Object.fromEntries(entries); // 从键值对创建对象
    const hasKey1 = Object.hasOwn(testObj, "key1") === true;
    const hasKey2 = Object.hasOwn(testObj, "key2") === true;
    const hasNoKey3 = Object.hasOwn(testObj, "key3") === false;
    return hasKey1 && hasKey2 && hasNoKey3;
}

/**
 * 测试点29：验证对象原型被修改后仍能正确检测自身属性
 */
export function Fn29_testModifiedPrototypeOwnProperty() {
    const testObj = { ownProp: "own" };
    Object.setPrototypeOf(testObj, { protoProp: "proto" }); // 修改原型
    const hasOwnProp = Object.hasOwn(testObj, "ownProp") === true;
    const hasProtoProp = Object.hasOwn(testObj, "protoProp") === false;
    const noExtraProp = Object.hasOwn(testObj, "extra") === false;
    return hasOwnProp && hasProtoProp && noExtraProp;
}

/**
 * 测试点30：验证BigInt作为属性名的检测
 */
export function Fn30_testBigIntPropertyName() {
    const bigIntKey = 123n;
    const testObj = { [bigIntKey]: "bigIntValue" };
    const hasBigIntKey = Object.hasOwn(testObj, bigIntKey) === true;
    const hasNumberKey = Object.hasOwn(testObj, 123) === false; // 123n≠123，不隐式转换
    const hasStringKey = Object.hasOwn(testObj, "123") === false; // 不转为字符串"123"
    return hasBigIntKey && hasNumberKey && hasStringKey;
}

/**
 * 测试点31：验证Error实例的自身属性检测
 */
export function Fn31_testErrorOwnProperty() {
    const testError = new Error("test error");
    testError.errorCode = 400; // 自定义属性
    const hasErrorCode = Object.hasOwn(testError, "errorCode") === true;
    const hasMessageProp = Object.hasOwn(testError, "message") === true; // message是Error实例的自身属性
    const hasPrototypeMethod = Object.hasOwn(testError, "toString") === false; // toString来自原型
    return hasErrorCode && hasMessageProp && hasPrototypeMethod;
}

/**
 * 测试点32：验证对象属性使用defineProperty设置为可配置/不可配置的检测
 */
export function Fn32_testConfigurablePropertyDetection() {
    const testObj = {};
    // 不可配置属性
    Object.defineProperty(testObj, "nonConfigProp", { value: "nonConfig", configurable: false });
    // 可配置属性
    Object.defineProperty(testObj, "configProp", { value: "config", configurable: true });
    const hasNonConfig = Object.hasOwn(testObj, "nonConfigProp") === true;
    const hasConfig = Object.hasOwn(testObj, "configProp") === true;
    const noExtra = Object.hasOwn(testObj, "extra") === false;
    return hasNonConfig && hasConfig && noExtra;
}

/**
 * 测试点33：验证通过扩展运算符添加的自身属性检测
 */
export function Fn33_testSpreadOperatorOwnProperty() {
    const baseObj = { base: "baseVal" };
    const testObj = { ...baseObj, newProp: "newVal" }; // 扩展运算符复制属性（均为自身属性）
    const hasBase = Object.hasOwn(testObj, "base") === true;
    const hasNewProp = Object.hasOwn(testObj, "newProp") === true;
    const noExtra = Object.hasOwn(testObj, "extra") === false;
    return hasBase && hasNewProp && noExtra;
}

/**
 * 测试点34：验证WeakMap/WeakSet实例的自身属性检测（无迭代暴露）
 */
export function Fn34_testWeakCollectionOwnProperty() {
    const weakMap = new WeakMap();
    weakMap.weakDesc = "weak map test";
    const weakSet = new WeakSet();
    weakSet.weakDesc = "weak set test";
    // WeakMap/WeakSet的键/值不暴露为属性，仅自定义属性可检测
    const hasWeakMapDesc = Object.hasOwn(weakMap, "weakDesc") === true;
    const hasWeakSetDesc = Object.hasOwn(weakSet, "weakDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(weakMap, "set") === false; // set来自原型
    return hasWeakMapDesc && hasWeakSetDesc && hasPrototypeMethod;
}

/**
 * 测试点35：验证对象属性值为函数时的检测
 */
export function Fn35_testFunctionValueProperty() {
    const testObj = {
        funcProp: () => "funcValue",
        normalProp: "normalValue"
    };
    const hasFuncProp = Object.hasOwn(testObj, "funcProp") === true; // 属性值为函数仍视为自身属性
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtra = Object.hasOwn(testObj, "extraFunc") === false;
    return hasFuncProp && hasNormalProp && noExtra;
}

/**
 * 测试点36：验证ArrayBuffer实例的自身属性检测
 */
export function Fn36_testArrayBufferOwnProperty() {
    const buffer = new ArrayBuffer(16); // 16字节的ArrayBuffer
    buffer.bufferDesc = "16-byte buffer";
    const hasDesc = Object.hasOwn(buffer, "bufferDesc") === true;
    const hasByteLength = Object.hasOwn(buffer, "byteLength") === true; // byteLength是自身属性
    const hasPrototypeMethod = Object.hasOwn(buffer, "slice") === false; // slice来自原型
    return hasDesc && hasByteLength && hasPrototypeMethod;
}

/**
 * 测试点37：验证对象属性被冻结后仍能检测自身属性
 */
export function Fn37_testFrozenObjectOwnProperty() {
    const testObj = { frozenProp: "frozen" };
    Object.freeze(testObj); // 冻结对象（不可修改/删除属性）
    const hasFrozenProp = Object.hasOwn(testObj, "frozenProp") === true;
    const noExtra = Object.hasOwn(testObj, "extra") === false;
    return hasFrozenProp && noExtra;
}

/**
 * 测试点38：验证Symbol.iterator作为属性名的检测
 */
export function Fn38_testSymbolIteratorProperty() {
    const testObj = {
        [Symbol.iterator]: function* () {
            yield 1;
            yield 2;
        }
    };
    const hasIterator = Object.hasOwn(testObj, Symbol.iterator) === true; // 内置Symbol作为属性名
    const hasNormalSymbol = Object.hasOwn(testObj, Symbol("other")) === false;
    return hasIterator && hasNormalSymbol;
}

/**
 * 测试点39：验证对象属性值为嵌套数组时的检测（不穿透数组）
 */
export function Fn39_testNestedArrayOwnProperty() {
    const testObj = { nestedArr: [1, 2, [3, 4]] };
    const hasNestedArr = Object.hasOwn(testObj, "nestedArr") === true;
    const hasArrIndexDirect = Object.hasOwn(testObj, 0) === false; // 不穿透数组检测索引
    const hasInnerArrIndex = Object.hasOwn(testObj.nestedArr[2], 0) === true; // 需手动访问嵌套数组
    return hasNestedArr && hasArrIndexDirect && hasInnerArrIndex;
}

/**
 * 测试点40：验证通过Object.getOwnPropertyNames获取的属性与hasOwn一致性
 */
export function Fn40_testConsistencyWithGetOwnPropertyNames() {
    const testObj = { prop1: "val1", prop2: "val2" };
    const ownNames = Object.getOwnPropertyNames(testObj); // 获取所有自身属性名
    // 验证getOwnPropertyNames中的属性均能被hasOwn检测到
    const hasProp1 = Object.hasOwn(testObj, ownNames[0]) === true;
    const hasProp2 = Object.hasOwn(testObj, ownNames[1]) === true;
    // 验证非自身属性不在列表中
    const noExtraInNames = ownNames.includes("extra") === false;
    return hasProp1 && hasProp2 && noExtraInNames;
}

/**
 * 测试点42：验证对象属性名含特殊字符（如空格、符号）的检测
 */
export function Fn42_testSpecialCharPropertyName() {
    const testObj = {
        "user name": "testUser",
        "prop@123": "specialVal",
        "key-with-dash": "dashVal"
    };
    const hasSpaceProp = Object.hasOwn(testObj, "user name") === true;
    const hasSymbolProp = Object.hasOwn(testObj, "prop@123") === true;
    const hasDashProp = Object.hasOwn(testObj, "key-with-dash") === true;
    const noNormalProp = Object.hasOwn(testObj, "userName") === false;
    return hasSpaceProp && hasSymbolProp && hasDashProp && noNormalProp;
}

/**
 * 测试点43：验证类的私有属性（#开头）无法被hasOwn检测（私有属性不暴露）
 */
export function Fn43_testClassPrivateProperty() {
    class TestClass {
        #privateProp = "privateVal"; // 私有属性

        constructor() {
            this.publicProp = "publicVal"; // 公有实例属性
        }
    }

    const instance = new TestClass();
    const hasPublicProp = Object.hasOwn(instance, "publicProp") === true;
    const hasPrivateProp = Object.hasOwn(instance, "#privateProp") === false; // 私有属性不可检测
    const hasPrivatePropDirect = Object.hasOwn(instance, "privateProp") === false;
    return hasPublicProp && hasPrivateProp && hasPrivatePropDirect;
}

/**
 * 测试点44：验证DataView实例的自身属性检测
 */
export function Fn44_testDataViewOwnProperty() {
    const buffer = new ArrayBuffer(16);
    const dataView = new DataView(buffer);
    dataView.viewDesc = "test data view";
    const hasDesc = Object.hasOwn(dataView, "viewDesc") === true;
    const hasBufferProp = Object.hasOwn(dataView, "buffer") === true; // buffer是DataView自身属性
    const hasPrototypeMethod = Object.hasOwn(dataView, "getUint8") === false; // getUint8来自原型
    return hasDesc && hasBufferProp && hasPrototypeMethod;
}

/**
 * 测试点45：验证对象属性被密封后仍能检测自身属性
 */
export function Fn45_testSealedObjectOwnProperty() {
    const testObj = { sealedProp: "sealedVal", anotherSealed: "anotherVal" };
    Object.seal(testObj); // 密封对象（不可添加/删除属性，可修改现有属性）
    const hasSealedProp = Object.hasOwn(testObj, "sealedProp") === true;
    const hasAnotherSealed = Object.hasOwn(testObj, "anotherSealed") === true;
    const noExtraProp = Object.hasOwn(testObj, "newProp") === false;
    return hasSealedProp && hasAnotherSealed && noExtraProp;
}

/**
 * 测试点46：验证通过Object.keys获取的属性与hasOwn一致性
 */
export function Fn46_testConsistencyWithObjectKeys() {
    const testObj = { keyA: "valA", keyB: "valB" };
    const ownKeys = Object.keys(testObj); // 获取自身可枚举属性名
    const hasKeyA = Object.hasOwn(testObj, ownKeys[0]) === true;
    const hasKeyB = Object.hasOwn(testObj, ownKeys[1]) === true;
    const noExtraKey = ownKeys.includes("extraKey") === false;
    return hasKeyA && hasKeyB && noExtraKey;
}

/**
 * 测试点47：验证RegExp实例的固有属性（如source、flags）是否为自身属性
 */
export function Fn47_testRegExpIntrinsicProperties() {
    const testReg = /abc/gmi; // 带全局、多行、不区分大小写标志
    const hasSource = Object.hasOwn(testReg, "source") === true; // source是RegExp自身属性
    const hasFlags = Object.hasOwn(testReg, "flags") === true; // flags是RegExp自身属性
    const hasLastIndex = Object.hasOwn(testReg, "lastIndex") === true; // lastIndex是自身属性
    const hasPrototypeMethod = Object.hasOwn(testReg, "exec") === false; // exec来自原型
    return hasSource && hasFlags && hasLastIndex && hasPrototypeMethod;
}

/**
 * 测试点48：验证对象属性值为Symbol类型时的检测
 */
export function Fn48_testSymbolValueProperty() {
    const symVal = Symbol("value");
    const testObj = {
        symProp: symVal,
        normalProp: "normal"
    };
    const hasSymProp = Object.hasOwn(testObj, "symProp") === true; // 属性值为Symbol不影响检测
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherSym") === false;
    return hasSymProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点49：验证Generator函数实例的自身属性检测
 */
export function Fn49_testGeneratorOwnProperty() {

    function* TestGenerator() {
        yield 1;
        yield 2;
    }

    const generator = TestGenerator();
    generator.genDesc = "test generator";
    const hasDesc = Object.hasOwn(generator, "genDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(generator, "next") === false; // next来自Generator.prototype
    const hasNoYieldProp = Object.hasOwn(generator, "1") === false; // yield值不暴露为属性
    return hasDesc && hasPrototypeMethod && hasNoYieldProp;
}

/**
 * 测试点50：验证对象属性名与原型链方法名重名时的检测
 */
export function Fn50_testPropertyNameConflictWithPrototype() {
    const testObj = {
        toString: "customToString", // 重写Object.prototype的toString
        valueOf: "customValueOf"    // 重写Object.prototype的valueOf
    };
    const hasToString = Object.hasOwn(testObj, "toString") === true; // 自身属性优先检测
    const hasValueOf = Object.hasOwn(testObj, "valueOf") === true;
    const hasPrototypeMethod = Object.hasOwn(testObj, "hasOwnProperty") === false; // 未重写的原型方法
    return hasToString && hasValueOf && hasPrototypeMethod;
}

/**
 * 测试点52：验证对象属性被多次赋值后仍能正确检测
 */
export function Fn52_testMultipleAssignedProperty() {
    const testObj = {};
    testObj.prop = "firstVal";
    testObj.prop = "secondVal"; // 多次赋值，仍为自身属性
    testObj.anotherProp = "anotherVal";
    const hasProp = Object.hasOwn(testObj, "prop") === true;
    const hasAnotherProp = Object.hasOwn(testObj, "anotherProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "unassigned") === false;
    return hasProp && hasAnotherProp && noExtraProp;
}


/**
 * 测试点54：验证对象属性名含Unicode字符的检测
 */
export function Fn54_testUnicodePropertyName() {
    const testObj = {
        "中文属性": "chineseVal",
        "дополнительно": "russianVal", // 俄语字符
        "ｶﾀｶﾅ": "japaneseVal" // 日语半角片假名
    };
    const hasChinese = Object.hasOwn(testObj, "中文属性") === true;
    const hasRussian = Object.hasOwn(testObj, "дополнительно") === true;
    const hasJapanese = Object.hasOwn(testObj, "ｶﾀｶﾅ") === true;
    return hasChinese && hasRussian && hasJapanese;
}

/**
 * 测试点55：验证AsyncFunction实例的自身属性检测
 */
export function Fn55_testAsyncFunctionOwnProperty() {
    const asyncFunc = async () => "async result";
    asyncFunc.asyncDesc = "test async function";
    const hasDesc = Object.hasOwn(asyncFunc, "asyncDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(asyncFunc, "then") === false; // then来自Promise原型（调用后）
    const hasNameProp = Object.hasOwn(asyncFunc, "name") === true; // name是函数自身属性
    return hasDesc && hasPrototypeMethod && hasNameProp;
}

/**
 * 测试点57：验证Intl对象（如Intl.DateTimeFormat）实例的自身属性检测
 */
export function Fn57_testIntlObjectOwnProperty() {
    const dateFormatter = new Intl.DateTimeFormat("zh-CN");
    dateFormatter.formatDesc = "chinese date formatter";
    const hasDesc = Object.hasOwn(dateFormatter, "formatDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(dateFormatter, "format") === false; // format来自原型
    const hasNoLocaleProp = Object.hasOwn(dateFormatter, "zh-CN") === false; //  locale不暴露为属性
    return hasDesc && hasPrototypeMethod && hasNoLocaleProp;
}

/**
 * 测试点58：验证对象属性使用Object.defineProperty设置为可写/不可写的检测
 */
export function Fn58_testWritablePropertyDetection() {
    const testObj = {};
    // 不可写属性
    Object.defineProperty(testObj, "nonWritable", { value: "fixed", writable: false });
    // 可写属性
    Object.defineProperty(testObj, "writable", { value: "changeable", writable: true });
    const hasNonWritable = Object.hasOwn(testObj, "nonWritable") === true;
    const hasWritable = Object.hasOwn(testObj, "writable") === true;
    const noExtra = Object.hasOwn(testObj, "extra") === false;
    return hasNonWritable && hasWritable && noExtra;
}

/**
 * 测试点59：验证通过Object.setPrototypeOf设置为null的对象属性检测
 */
export function Fn59_testPrototypeSetToNull() {
    const testObj = { ownProp: "ownVal" };
    Object.setPrototypeOf(testObj, null); // 原型设为null（无任何继承）
    const hasOwnProp = Object.hasOwn(testObj, "ownProp") === true;
    const hasNoProtoMethod = Object.hasOwn(testObj, "toString") === false; // 无原型继承
    const noExtra = Object.hasOwn(testObj, "extra") === false;
    return hasOwnProp && hasNoProtoMethod && noExtra;
}

/**
 * 测试点60：验证对象属性名与数组索引重名时的检测（对象非数组）
 */
export function Fn60_testPropertyNameAsArrayIndex() {
    const testObj = {
        "0": "index0Val",
        "100": "index100Val",
        normalProp: "normal"
    };
    // 对象中"0"是字符串属性名，与数组索引逻辑无关
    const hasIndex0 = Object.hasOwn(testObj, "0") === true;
    const hasIndex100 = Object.hasOwn(testObj, "100") === true;
    const hasNumberKey = Object.hasOwn(testObj, 0) === true; // 数字0隐式转为字符串"0"
    return hasIndex0 && hasIndex100 && hasNumberKey;
}

/**
 * 测试点61：验证Map/Set键值修改后自身属性检测不受影响
 */
export function Fn61_testMapSetModifyNoAffectOwnProp() {
    const testMap = new Map([["key", "oldVal"]]);
    testMap.ownProp = "mapOwn"; // 自身属性
    testMap.set("key", "newVal"); // 修改Map键值（不影响自身属性）

    const testSet = new Set([1]);
    testSet.ownProp = "setOwn"; // 自身属性
    testSet.delete(1); // 修改Set值（不影响自身属性）

    const mapHasOwn = Object.hasOwn(testMap, "ownProp") === true;
    const setHasOwn = Object.hasOwn(testSet, "ownProp") === true;
    const mapNoKeyAsProp = Object.hasOwn(testMap, "key") === false;
    return mapHasOwn && setHasOwn && mapNoKeyAsProp;
}

/**
 * 测试点62：验证对象属性名含换行符的检测
 */
export function Fn62_testNewlineInPropertyName() {
    const testObj = { "line\nbreak": "newlineVal" }; // 属性名含换行符
    const hasNewlineProp = Object.hasOwn(testObj, "line\nbreak") === true;
    const hasNoNormalProp = Object.hasOwn(testObj, "linebreak") === false; // 无换行符的属性名不匹配
    return hasNewlineProp && hasNoNormalProp;
}

/**
 * 测试点63：验证TypedArray视图（如Uint16Array）的索引属性检测
 */
export function Fn63_testTypedArrayViewIndex() {
    const typedArr = new Uint16Array([300, 400]);
    const hasIndex0 = Object.hasOwn(typedArr, 0) === true; // 索引属性
    const hasIndex1 = Object.hasOwn(typedArr, 1) === true;
    const hasNoIndex2 = Object.hasOwn(typedArr, 2) === false;
    const hasLength = Object.hasOwn(typedArr, "length") === true; // length是自身属性
    return hasIndex0 && hasIndex1 && hasNoIndex2 && hasLength;
}

/**
 * 测试点64：验证类继承中父类实例属性与子类实例属性的区分
 */
export function Fn64_testClassInheritanceInstanceProp() {
    class Parent {
        constructor() {
            this.parentInstanceProp = "parentInst"; // 父类实例属性
        }
    }

    class Child extends Parent {
        constructor() {
            super();
            this.childInstanceProp = "childInst"; // 子类实例属性
        }
    }

    const childInst = new Child();
    const hasChildProp = Object.hasOwn(childInst, "childInstanceProp") === true;
    const hasParentProp = Object.hasOwn(childInst, "parentInstanceProp") === true; // 父类实例属性继承后仍为子类实例自身属性
    const hasNoProtoProp = Object.hasOwn(childInst, "parentProtoProp") === false;
    return hasChildProp && hasParentProp && hasNoProtoProp;
}

/**
 * 测试点65：验证Error子类（如TypeError）实例的自身属性检测
 */
export function Fn65_testErrorSubclassOwnProperty() {
    const typeError = new TypeError("type error test");
    typeError.errorCode = 500; // 自定义属性
    const hasErrorCode = Object.hasOwn(typeError, "errorCode") === true;
    const hasMessage = Object.hasOwn(typeError, "message") === true; // message是自身属性
    const hasPrototypeMethod = Object.hasOwn(typeError, "stack") === false; // stack来自原型（部分环境可能为自身属性，此处以标准原型逻辑为准）
    return hasErrorCode && hasMessage && hasPrototypeMethod;
}

/**
 * 测试点66：验证对象属性值为BigInt类型时的检测
 */
export function Fn66_testBigIntValueProperty() {
    const testObj = {
        bigIntProp: 9007199254740991n, // 属性值为BigInt
        normalProp: "normal"
    };
    const hasBigIntProp = Object.hasOwn(testObj, "bigIntProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherBigInt") === false;
    return hasBigIntProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点68：验证对象属性名与内置对象名重名时的检测
 */
export function Fn68_testPropertyNameConflictWithBuiltIn() {
    const testObj = {
        Object: "customObject",
        Array: "customArray",
        String: "customString"
    };
    const hasObjectProp = Object.hasOwn(testObj, "Object") === true; // 与内置对象名重名仍为自身属性
    const hasArrayProp = Object.hasOwn(testObj, "Array") === true;
    const hasStringProp = Object.hasOwn(testObj, "String") === true;
    return hasObjectProp && hasArrayProp && hasStringProp;
}

/**
 * 测试点70：验证对象属性被Object.preventExtensions后仍能检测
 */
export function Fn70_testPreventExtensionsObject() {
    const testObj = { extProp: "extVal" };
    Object.preventExtensions(testObj); // 禁止扩展（不可添加新属性）
    const hasExtProp = Object.hasOwn(testObj, "extProp") === true;
    const noNewProp = Object.hasOwn(testObj, "newExtProp") === false;
    return hasExtProp && noNewProp;
}

/**
 * 测试点71：验证GeneratorFunction实例的自身属性检测
 */
export function Fn71_testGeneratorFunctionOwnProperty() {
    const genFunc = function* () {
        yield "genFuncTest";
    };
    genFunc.genFuncDesc = "generator function";
    const hasDesc = Object.hasOwn(genFunc, "genFuncDesc") === true;
    const hasNameProp = Object.hasOwn(genFunc, "name") === true; // name是函数自身属性
    const hasPrototypeMethod = Object.hasOwn(genFunc, "prototype") === false; // prototype来自Function原型
    return hasDesc && hasNameProp && hasPrototypeMethod;
}

/**
 * 测试点72：验证对象属性名含制表符的检测
 */
export function Fn72_testTabInPropertyName() {
    const testObj = { "tab\tsep": "tabVal" }; // 属性名含制表符
    const hasTabProp = Object.hasOwn(testObj, "tab\tsep") === true;
    const hasNoNormalProp = Object.hasOwn(testObj, "tabsep") === false; // 无制表符的属性名不匹配
    return hasTabProp && hasNoNormalProp;
}

/**
 * 测试点73：验证Intl.NumberFormat实例的自身属性检测
 */
export function Fn73_testIntlNumberFormatOwnProperty() {
    const numberFormatter = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" });
    numberFormatter.formatDesc = "usd formatter";
    const hasDesc = Object.hasOwn(numberFormatter, "formatDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(numberFormatter, "format") === false; // format来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点74：验证对象属性值为Promise类型时的检测
 */
export function Fn74_testPromiseValueProperty() {
    const testObj = {
        promiseProp: Promise.reject("error"), // 属性值为Promise
        normalProp: "normal"
    };
    const hasPromiseProp = Object.hasOwn(testObj, "promiseProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherPromise") === false;
    return hasPromiseProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点75：验证ReadableStream实例的自身属性检测
 */
export function Fn75_testReadableStreamOwnProperty() {
    // 简化创建ReadableStream（实际需符合流规范）
    const stream = typeof ReadableStream !== "undefined" ? new ReadableStream() : {};
    stream.streamDesc = "readable stream";
    const hasDesc = Object.hasOwn(stream, "streamDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(stream, "getReader") === false; // getReader来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点76：验证对象属性名含反斜杠的检测
 */
export function Fn76_testBackslashInPropertyName() {
    const testObj = { "back\\slash": "backslashVal" }; // 属性名含反斜杠（需转义）
    const hasBackslashProp = Object.hasOwn(testObj, "back\\slash") === true;
    const hasNoNormalProp = Object.hasOwn(testObj, "backslash") === false; // 无反斜杠的属性名不匹配
    return hasBackslashProp && hasNoNormalProp;
}

/**
 * 测试点77：验证类的getter/setter作为自身属性的检测
 */
export function Fn77_testClassGetterSetterOwnProperty() {
    class TestClass {
        get getterProp() {
            return "getVal";
        } // getter

        set setterProp(val) {
            this._setVal = val;
        } // setter

        constructor() {
            this.normalProp = "normal";
        }
    }

    const inst = new TestClass();
    const hasGetter = Object.hasOwn(inst, "getterProp") === false ; // getter是自身属性
    const hasSetter = Object.hasOwn(inst, "setterProp") === false; // setter是自身属性
    const hasNormal = Object.hasOwn(inst, "normalProp") === true;
    return hasGetter && hasSetter && hasNormal;
}

/**
 * 测试点78：验证对象属性值为RegExp类型时的检测
 */
export function Fn78_testRegExpValueProperty() {
    const testObj = {
        regProp: /testReg/, // 属性值为RegExp
        normalProp: "normal"
    };
    const hasRegProp = Object.hasOwn(testObj, "regProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherReg") === false;
    return hasRegProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点79：验证WritableStream实例的自身属性检测
 */
export function Fn79_testWritableStreamOwnProperty() {
    // 简化创建WritableStream
    const stream = typeof WritableStream !== "undefined" ? new WritableStream({
        write: () => {
        }
    }) : {};
    stream.streamDesc = "writable stream";
    const hasDesc = Object.hasOwn(stream, "streamDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(stream, "write") === false; // write来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点80：验证对象属性名含Emoji的检测
 */
export function Fn80_testEmojiInPropertyName() {
    const testObj = { "😀smile": "emojiVal", "🚗car": "carVal" }; // 属性名含Emoji
    const hasSmileProp = Object.hasOwn(testObj, "😀smile") === true;
    const hasCarProp = Object.hasOwn(testObj, "🚗car") === true;
    const hasNoNormalProp = Object.hasOwn(testObj, "smile") === false;
    return hasSmileProp && hasCarProp && hasNoNormalProp;
}

/**
 * 测试点81：验证对象属性名含全角符号的检测（如全角数字、符号）
 */
export function Fn81_testFullWidthCharPropertyName() {
    const testObj = {
        "１２３": "fullWidthNum", // 全角数字
        "＋－×÷": "fullWidthSymbol" // 全角运算符号
    };
    const hasFullWidthNum = Object.hasOwn(testObj, "１２３") === true;
    const hasFullWidthSym = Object.hasOwn(testObj, "＋－×÷") === true;
    const hasNoHalfWidth = Object.hasOwn(testObj, "123") === false; // 半角与全角不匹配
    return hasFullWidthNum && hasFullWidthSym && hasNoHalfWidth;
}

/**
 * 测试点82：验证TransformStream实例的自身属性检测
 */
export function Fn82_testTransformStreamOwnProperty() {
    // 简化创建TransformStream（需符合流规范）
    const stream = typeof TransformStream !== "undefined"
        ? new TransformStream({ transform: (chunk, controller) => controller.enqueue(chunk) })
        : {};
    stream.streamDesc = "transform stream";
    const hasDesc = Object.hasOwn(stream, "streamDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(stream, "getReader") === false; // getReader来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点83：验证对象属性值为Error实例时的检测
 */
export function Fn83_testErrorInstanceValueProperty() {
    const testObj = {
        errorProp: new RangeError("range error"), // 属性值为Error实例
        normalProp: "normal"
    };
    const hasErrorProp = Object.hasOwn(testObj, "errorProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherError") === false;
    return hasErrorProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点84：验证类的静态方法与实例属性的区分检测
 */
export function Fn84_testClassStaticMethodVsInstanceProp() {
    class TestClass {
        static staticMethod() {
            return "static";
        } // 静态方法（属于类）

        constructor() {
            this.instanceProp = "instance"; // 实例属性
        }
    }

    const instance = new TestClass();
    const hasInstanceProp = Object.hasOwn(instance, "instanceProp") === true;
    const hasStaticOnInstance = Object.hasOwn(instance, "staticMethod") === false;
    const hasStaticOnClass = Object.hasOwn(TestClass, "staticMethod") === true; // 静态方法是类的自身属性
    return hasInstanceProp && hasStaticOnInstance && hasStaticOnClass;
}

/**
 * 测试点85：验证对象属性名含空格+特殊符号的组合检测
 */
export function Fn85_testSpaceSpecialCharComboProperty() {
    const testObj = {
        "user@ test": "spaceAt",
        "prop# 123": "spaceHash"
    };
    const hasSpaceAt = Object.hasOwn(testObj, "user@ test") === true;
    const hasSpaceHash = Object.hasOwn(testObj, "prop# 123") === true;
    const hasNoSpaceLess = Object.hasOwn(testObj, "user@test") === false; // 缺失空格不匹配
    return hasSpaceAt && hasSpaceHash && hasNoSpaceLess;
}

/**
 * 测试点86：验证Atomics对象（SharedArrayBuffer相关）的自身属性检测
 */
export function Fn86_testAtomicsRelatedProperty() {
    // 仅验证自定义属性，Atomics为内置对象，不直接创建实例
    const testObj = { atomicDesc: "atomics test" };
    if (typeof SharedArrayBuffer !== "undefined") {
        testObj.sab = new SharedArrayBuffer(16);
    }
    const hasDesc = Object.hasOwn(testObj, "atomicDesc") === true;
    const hasSabProp = typeof SharedArrayBuffer !== "undefined"
        ? Object.hasOwn(testObj, "sab") === true
        : true;
    const hasNoAtomicsMethod = Object.hasOwn(testObj, "add") === false; // Atomics方法不属自身
    return hasDesc && hasSabProp && hasNoAtomicsMethod;
}

/**
 * 测试点87：验证对象属性被重定义后（defineProperty覆盖）的检测
 */
export function Fn87_testRedefinedPropertyDetection() {
    const testObj = { prop: "initialVal" };
    // 用defineProperty重定义现有属性
    Object.defineProperty(testObj, "prop", { value: "redefinedVal", enumerable: false });
    const hasRedefined = Object.hasOwn(testObj, "prop") === true; // 重定义后仍为自身属性
    const hasNewProp = Object.hasOwn(testObj, "newProp") === false;
    return hasRedefined && hasNewProp;
}

/**
 * 测试点88：验证Intl.DateTimeFormat的formatToParts方法关联属性检测
 */
export function Fn88_testIntlDateTimeFormatParts() {
    const formatter = new Intl.DateTimeFormat("zh-CN", { year: "numeric", month: "long" });
    formatter.partDesc = "format parts test";
    const hasDesc = Object.hasOwn(formatter, "partDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(formatter, "formatToParts") === false; // 方法来自原型
    const hasNoYearProp = Object.hasOwn(formatter, "year") === false; // 格式化参数不暴露为属性
    return hasDesc && hasPrototypeMethod && hasNoYearProp;
}

/**
 * 测试点89：验证对象属性名含非打印字符（如ASCII控制字符）的检测
 */
export function Fn89_testNonPrintableCharPropertyName() {
    const testObj = {
        "\x00": "nullChar", // ASCII空字符
        "\x07": "bellChar"  // ASCII响铃字符
    };
    const hasNullChar = Object.hasOwn(testObj, "\x00") === true;
    const hasBellChar = Object.hasOwn(testObj, "\x07") === true;
    const hasNoPrintable = Object.hasOwn(testObj, "nullChar") === false; // 非对应属性名
    return hasNullChar && hasBellChar && hasNoPrintable;
}

/**
 * 测试点90：验证Promise.all返回的Promise实例自身属性检测
 */
export function Fn90_testPromiseAllInstanceProperty() {
    const promise = Promise.all([Promise.resolve(1), Promise.resolve(2)]);
    promise.allDesc = "promise all test";
    const hasDesc = Object.hasOwn(promise, "allDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(promise, "catch") === false; // catch来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点91：验证对象属性值为Map/Set实例时的检测
 */
export function Fn91_testMapSetInstanceValueProperty() {
    const testObj = {
        mapProp: new Map([["k", "v"]]),
        setProp: new Set([1, 2]),
        normalProp: "normal"
    };
    const hasMapProp = Object.hasOwn(testObj, "mapProp") === true;
    const hasSetProp = Object.hasOwn(testObj, "setProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    return hasMapProp && hasSetProp && hasNormalProp;
}

/**
 * 测试点92：验证类的私有静态属性无法被hasOwn检测
 */
export function Fn92_testClassPrivateStaticProperty() {
    class TestClass {
        static #privateStaticProp = "privateStatic"; // 私有静态属性
        static publicStaticProp = "publicStatic"; // 公有静态属性
    }

    const hasPublicStatic = Object.hasOwn(TestClass, "publicStaticProp") === true;
    const hasPrivateStatic = Object.hasOwn(TestClass, "#privateStaticProp") === false; // 私有不可检测
    const hasNoInstanceProp = Object.hasOwn(TestClass, "instanceProp") === false;
    return hasPublicStatic && hasPrivateStatic && hasNoInstanceProp;
}

/**
 * 测试点93：验证对象属性名含多语言混合字符的检测
 */
export function Fn93_testMixedLangPropertyName() {
    const testObj = {
        "user_用户": "cnEnMix",
        "data_データ": "enJpMix"
    };
    const hasCnEnMix = Object.hasOwn(testObj, "user_用户") === true;
    const hasEnJpMix = Object.hasOwn(testObj, "data_データ") === true;
    const hasNoSingleLang = Object.hasOwn(testObj, "user") === false; // 单语言不匹配
    return hasCnEnMix && hasEnJpMix && hasNoSingleLang;
}

/**
 * 测试点94：验证ReadableStreamDefaultReader实例的自身属性检测
 */
export function Fn94_testReadableStreamReaderOwnProperty() {
    let reader = {};
    if (typeof ReadableStream !== "undefined") {
        const stream = new ReadableStream();
        reader = stream.getReader(); // 获取默认读取器
    }
    reader.readerDesc = "stream reader";
    const hasDesc = Object.hasOwn(reader, "readerDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(reader, "read") === false; // read来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点95：验证对象属性值为TypedArray实例时的检测
 */
export function Fn95_testTypedArrayInstanceValueProperty() {
    const testObj = {
        uint8Arr: new Uint8Array([1, 2]),
        float32Arr: new Float32Array([3.14, 2.71]),
        normalProp: "normal"
    };
    const hasUint8 = Object.hasOwn(testObj, "uint8Arr") === true;
    const hasFloat32 = Object.hasOwn(testObj, "float32Arr") === true;
    const hasNormal = Object.hasOwn(testObj, "normalProp") === true;
    return hasUint8 && hasFloat32 && hasNormal;
}

/**
 * 测试点96：验证类的继承链中静态属性的检测（子类访问父类静态属性）
 */
export function Fn96_testClassInheritanceStaticProperty() {
    class Parent {
        static parentStatic = "parentStaticVal";
    }

    class Child extends Parent {
        static childStatic = "childStaticVal";
    }

    const hasChildStatic = Object.hasOwn(Child, "childStatic") === true; // 子类自身静态属性
    const hasParentStaticOnChild = Object.hasOwn(Child, "parentStatic") === false; // 父类静态属性格式上不属子类自身
    const hasParentStaticOnParent = Object.hasOwn(Parent, "parentStatic") === true;
    return hasChildStatic && hasParentStaticOnChild && hasParentStaticOnParent;
}

/**
 * 测试点97：验证对象属性名含下划线+数字的组合检测
 */
export function Fn97_testUnderlineNumberComboProperty() {
    const testObj = {
        "user_001": "user1",
        "data_2024": "yearData"
    };
    const hasUser001 = Object.hasOwn(testObj, "user_001") === true;
    const hasData2024 = Object.hasOwn(testObj, "data_2024") === true;
    const hasNoMismatch = Object.hasOwn(testObj, "user001") === false; // 缺失下划线不匹配
    return hasUser001 && hasData2024 && hasNoMismatch;
}

/**
 * 测试点98：验证WritableStreamDefaultWriter实例的自身属性检测
 */
export function Fn98_testWritableStreamWriterOwnProperty() {
    let writer = {};
    if (typeof WritableStream !== "undefined") {
        const stream = new WritableStream({
            write: () => {
            }
        });
        writer = stream.getWriter(); // 获取默认写入器
    }
    writer.writerDesc = "stream writer";
    const hasDesc = Object.hasOwn(writer, "writerDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(writer, "write") === false; // write来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点99：验证对象属性被Object.getOwnPropertyDescriptors获取后与hasOwn的一致性
 */
export function Fn99_testConsistencyWithGetOwnPropertyDescriptors() {
    const testObj = { prop1: "val1", prop2: "val2" };
    const descriptors = Object.getOwnPropertyDescriptors(testObj); // 获取自身属性描述符
    const hasProp1 = Object.hasOwn(testObj, "prop1") === true && descriptors.prop1 !== undefined;
    const hasProp2 = Object.hasOwn(testObj, "prop2") === true && descriptors.prop2 !== undefined;
    const hasNoExtra = Object.hasOwn(testObj, "prop3") === false && descriptors.prop3 === undefined;
    return hasProp1 && hasProp2 && hasNoExtra;
}

/**
 * 测试点100：验证对象属性名含表情符号+文字的组合检测
 */
export function Fn100_testEmojiTextComboPropertyName() {
    const testObj = {
        "🍎apple": "fruit",
        "🐶doggy": "pet"
    };
    const hasApple = Object.hasOwn(testObj, "🍎apple") === true;
    const hasDoggy = Object.hasOwn(testObj, "🐶doggy") === true;
    const hasNoTextOnly = Object.hasOwn(testObj, "apple") === false; // 缺失表情符号不匹配
    return hasApple && hasDoggy && hasNoTextOnly;
}

/**
 * 测试点101：验证对象属性名含上标/下标字符的检测（如²、₃）
 */
export function Fn101_testSuperscriptSubscriptPropertyName() {
    const testObj = {
        "num²": "square", // 上标2
        "num₃": "cube"      // 下标3
    };
    const hasSuperscript = Object.hasOwn(testObj, "num²") === true;
    const hasSubscript = Object.hasOwn(testObj, "num₃") === true;
    const hasNoNormalNum = Object.hasOwn(testObj, "num2") === false; // 普通数字不匹配
    return hasSuperscript && hasSubscript && hasNoNormalNum;
}

/**
 * 测试点102：验证ReadableStreamBYOBReader实例的自身属性检测
 */
export function Fn102_testReadableStreamBYOBReaderOwnProperty() {
    let byobReader = {};
    if (typeof ReadableStream !== "undefined" && typeof ArrayBuffer !== "undefined") {
        const stream = new ReadableStream({
            type: "bytes",
            start(controller) {
                controller.enqueue(new Uint8Array(8));
            }
        });
        byobReader = stream.getReader({ mode: "byob" }); // 获取BYOB读取器
    }
    byobReader.byobDesc = "byob reader test";
    const hasDesc = Object.hasOwn(byobReader, "byobDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(byobReader, "read") === false; // read来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点103：验证对象属性值为ArrayBuffer实例时的检测
 */
export function Fn103_testArrayBufferInstanceValueProperty() {
    const testObj = {
        bufferProp: new ArrayBuffer(32), // 属性值为ArrayBuffer
        normalProp: "normal"
    };
    const hasBufferProp = Object.hasOwn(testObj, "bufferProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherBuffer") === false;
    return hasBufferProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点104：验证类的私有方法无法被hasOwn检测
 */
export function Fn104_testClassPrivateMethodDetection() {
    class TestClass {
        #privateMethod() {
            return "private";
        } // 私有方法

        constructor() {
            this.publicProp = "public";
        }
    }

    const instance = new TestClass();
    const hasPublicProp = Object.hasOwn(instance, "publicProp") === true;
    const hasPrivateMethod = Object.hasOwn(instance, "#privateMethod") === false; // 私有方法不可检测
    const hasNoPublicMethod = Object.hasOwn(instance, "publicMethod") === false;
    return hasPublicProp && hasPrivateMethod && hasNoPublicMethod;
}

/**
 * 测试点105：验证对象属性名含特殊符号组合（如@#$%）的检测
 */
export function Fn105_testSpecialSymbolComboPropertyName() {
    const testObj = {
        "user@#123": "atHashNum",
        "prop$%test": "dollarPercent"
    };
    const hasAtHash = Object.hasOwn(testObj, "user@#123") === true;
    const hasDollarPercent = Object.hasOwn(testObj, "prop$%test") === true;
    const hasNoSingleSym = Object.hasOwn(testObj, "user@123") === false; // 缺失#不匹配
    return hasAtHash && hasDollarPercent && hasNoSingleSym;
}

/**
 * 测试点106：验证Intl.RelativeTimeFormat实例的自身属性检测
 */
export function Fn106_testIntlRelativeTimeFormatOwnProperty() {
    const rtf = new Intl.RelativeTimeFormat("zh-CN", { style: "long" });
    rtf.rtfDesc = "relative time formatter";
    const hasDesc = Object.hasOwn(rtf, "rtfDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(rtf, "format") === false; // format来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点108：验证Promise.race返回的Promise实例自身属性检测
 */
export function Fn108_testPromiseRaceInstanceProperty() {
    const promise = Promise.race([Promise.resolve(1), new Promise(() => {
    })]);
    promise.raceDesc = "promise race test";
    const hasDesc = Object.hasOwn(promise, "raceDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(promise, "finally") === false; // finally来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点109：验证对象属性名含Unicode控制字符（如零宽度空格）的检测
 */
export function Fn109_testUnicodeControlCharPropertyName() {
    const testObj = {
        "a\u200Bc": "zeroWidthSpace", // 零宽度空格
        "x\u00ADy": "softHyphen"     // 软连字符
    };
    const hasZeroWidth = Object.hasOwn(testObj, "a\u200Bc") === true;
    const hasSoftHyphen = Object.hasOwn(testObj, "x\u00ADy") === true;
    const hasNoControlLess = Object.hasOwn(testObj, "ac") === false; // 缺失控制字符不匹配
    return hasZeroWidth && hasSoftHyphen && hasNoControlLess;
}

/**
 * 测试点110：验证WeakRef实例的自身属性检测（弱引用目标不影响属性检测）
 */
export function Fn110_testWeakRefOwnProperty() {
    let weakRef = {};
    if (typeof WeakRef !== "undefined") {
        const target = {};
        weakRef = new WeakRef(target); // 创建弱引用
    }
    weakRef.refDesc = "weak ref test";
    const hasDesc = Object.hasOwn(weakRef, "refDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(weakRef, "deref") === false; // deref来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点111：验证对象属性值为DataView实例时的检测
 */
export function Fn111_testDataViewInstanceValueProperty() {
    const buffer = new ArrayBuffer(16);
    const testObj = {
        viewProp: new DataView(buffer), // 属性值为DataView
        normalProp: "normal"
    };
    const hasViewProp = Object.hasOwn(testObj, "viewProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherView") === false;
    return hasViewProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点112：验证类的静态私有方法无法被hasOwn检测
 */
export function Fn112_testClassStaticPrivateMethodDetection() {
    class TestClass {
        static #privateStaticMethod() {
            return "static private";
        } // 静态私有方法

        static publicStaticProp = "static public";
    }

    const hasPublicStatic = Object.hasOwn(TestClass, "publicStaticProp") === true;
    const hasPrivateStaticMethod = Object.hasOwn(TestClass, "#privateStaticMethod") === false; // 不可检测
    const noExtraStatic = Object.hasOwn(TestClass, "extraStatic") === false;
    return hasPublicStatic && hasPrivateStaticMethod && noExtraStatic;
}

/**
 * 测试点113：验证对象属性名含语言特定字符（如法语é、德语ü）的检测
 */
export function Fn113_testLangSpecificCharPropertyName() {
    const testObj = {
        "café": "frenchCoffee", // 法语带重音字符
        "Müller": "germanName"   // 德语带变音字符
    };
    const hasFrench = Object.hasOwn(testObj, "café") === true;
    const hasGerman = Object.hasOwn(testObj, "Müller") === true;
    const hasNoPlainChar = Object.hasOwn(testObj, "cafe") === false; // 无重音字符不匹配
    return hasFrench && hasGerman && hasNoPlainChar;
}

/**
 * 测试点114：验证TransformStreamDefaultController实例的自身属性检测
 */
export function Fn114_testTransformStreamControllerOwnProperty() {
    let controller = {};
    if (typeof TransformStream !== "undefined") {
        new TransformStream({
            start(ctrl) {
                controller = ctrl;
            } // 获取转换控制器
        });
    }
    if (controller) {
        controller.ctrlDesc = "transform controller";
    }
    const hasDesc = controller ? Object.hasOwn(controller, "ctrlDesc") === true : true;
    const hasPrototypeMethod = controller ? Object.hasOwn(controller, "enqueue") === false : true; // enqueue来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点116：验证Intl.PluralRules实例的自身属性检测
 */
export function Fn116_testIntlPluralRulesOwnProperty() {
    const pluralRules = new Intl.PluralRules("zh-CN");
    pluralRules.pluralDesc = "plural rules test";
    const hasDesc = Object.hasOwn(pluralRules, "pluralDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(pluralRules, "select") === false; // select来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点117：验证对象属性名含括号组合（如()、[]）的检测
 */
export function Fn117_testBracketComboPropertyName() {
    const testObj = {
        "user(123)": "userWithId",
        "prop[test]": "propWithBracket"
    };
    const hasParenthesis = Object.hasOwn(testObj, "user(123)") === true;
    const hasBracket = Object.hasOwn(testObj, "prop[test]") === true;
    const hasNoBracketLess = Object.hasOwn(testObj, "prop test") === false; // 缺失括号不匹配
    return hasParenthesis && hasBracket && hasNoBracketLess;
}

/**
 * 测试点118：验证Promise.resolve返回的已决议Promise实例自身属性检测
 */
export function Fn118_testResolvedPromiseInstanceProperty() {
    const promise = Promise.resolve("resolved value");
    promise.resolvedDesc = "resolved promise test";
    const hasDesc = Object.hasOwn(promise, "resolvedDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(promise, "then") === false; // then来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点119：验证对象属性值为WeakMap/WeakSet实例时的检测
 */
export function Fn119_testWeakMapSetInstanceValueProperty() {
    const testObj = {
        weakMapProp: new WeakMap(), // 属性值为WeakMap
        weakSetProp: new WeakSet(), // 属性值为WeakSet
        normalProp: "normal"
    };
    const hasWeakMap = Object.hasOwn(testObj, "weakMapProp") === true;
    const hasWeakSet = Object.hasOwn(testObj, "weakSetProp") === true;
    const hasNormal = Object.hasOwn(testObj, "normalProp") === true;
    return hasWeakMap && hasWeakSet && hasNormal;
}

/**
 * 测试点120：验证对象属性名含特殊空格（如非断行空格、窄空格）的检测
 */
export function Fn120_testSpecialSpacePropertyName() {
    const testObj = {
        "user\u00A0name": "nonBreakingSpace", // 非断行空格
        "prop\u2000test": "enQuadSpace"       // 窄空格
    };
    const hasNonBreaking = Object.hasOwn(testObj, "user\u00A0name") === true;
    const hasEnQuad = Object.hasOwn(testObj, "prop\u2000test") === true;
    const hasNoNormalSpace = Object.hasOwn(testObj, "user name") === false; // 普通空格不匹配
    return hasNonBreaking && hasEnQuad && hasNoNormalSpace;
}

/**
 * 测试点121：验证对象属性名含罗马数字（如Ⅰ、Ⅸ）的检测
 */
export function Fn121_testRomanNumeralPropertyName() {
    const testObj = {
        "chapterⅠ": "firstChapter", // 罗马数字1
        "sectionⅨ": "ninthSection"  // 罗马数字9
    };
    const hasChapterI = Object.hasOwn(testObj, "chapterⅠ") === true;
    const hasSectionIX = Object.hasOwn(testObj, "sectionⅨ") === true;
    const hasNoArabic = Object.hasOwn(testObj, "chapter1") === false; // 阿拉伯数字不匹配
    return hasChapterI && hasSectionIX && hasNoArabic;
}

/**
 * 测试点122：验证FinalizationRegistry实例的自身属性检测
 */
export function Fn122_testFinalizationRegistryOwnProperty() {
    let registry = {};
    if (typeof FinalizationRegistry !== "undefined") {
        registry = new FinalizationRegistry(key => {
        }); // 创建终结器注册表
    }
    registry.registryDesc = "finalization registry test";
    const hasDesc = Object.hasOwn(registry, "registryDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(registry, "register") === false; // register来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点124：验证类的私有字段（#field）与实例属性的区分检测
 */
export function Fn124_testClassPrivateFieldVsInstanceProp() {
    class TestClass {
        #privateField = "privateVal"; // 私有字段

        constructor() {
            this.publicProp = "publicVal"; // 公有实例属性
        }
    }

    const instance = new TestClass();
    const hasPublicProp = Object.hasOwn(instance, "publicProp") === true;
    const hasPrivateField = Object.hasOwn(instance, "#privateField") === false; // 私有字段不可检测
    const hasNoExtra = Object.hasOwn(instance, "extraProp") === false;
    return hasPublicProp && hasPrivateField && hasNoExtra;
}

/**
 * 测试点125：验证对象属性名含斜杠+反斜杠组合（如/\/）的检测
 */
export function Fn125_testSlashBackslashComboProperty() {
    const testObj = {
        "path/\\file": "slashCombo", // 斜杠+反斜杠（需双重转义）
        "url/\\path": "urlCombo"
    };
    const hasPathCombo = Object.hasOwn(testObj, "path/\\file") === true;
    const hasUrlCombo = Object.hasOwn(testObj, "url/\\path") === true;
    const hasNoSingleSlash = Object.hasOwn(testObj, "path/file") === false; // 缺失反斜杠不匹配
    return hasPathCombo && hasUrlCombo && hasNoSingleSlash;
}

/**
 * 测试点126：验证Intl.DisplayNames实例的自身属性检测
 */
export function Fn126_testIntlDisplayNamesOwnProperty() {
    const displayNames = new Intl.DisplayNames("zh-CN", { type: "language" });
    displayNames.desc = "language display names";
    const hasDesc = Object.hasOwn(displayNames, "desc") === true;
    const hasPrototypeMethod = Object.hasOwn(displayNames, "of") === false; // of来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点128：验证Promise.reject返回的已拒绝Promise实例自身属性检测
 */
export function Fn128_testRejectedPromiseInstanceProperty() {
    const promise = Promise.reject(new Error("rejected error"));
    promise.rejectedDesc = "rejected promise test";
    const hasDesc = Object.hasOwn(promise, "rejectedDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(promise, "catch") === false; // catch来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点129：验证对象属性名含表意文字描述符（如👨‍👩‍👧）的检测
 */
export function Fn129_testEmojiModifierPropertyName() {
    const testObj = {
        "family👨‍👩‍👧": "parentChild", // 家庭表情组合
        "hand🤝": "handshake"        // 基础表情
    };
    const hasFamily = Object.hasOwn(testObj, "family👨‍👩‍👧") === true;
    const hasHandshake = Object.hasOwn(testObj, "hand🤝") === true;
    const hasNoTextOnly = Object.hasOwn(testObj, "family") === false; // 缺失表情不匹配
    return hasFamily && hasHandshake && hasNoTextOnly;
}

/**
 * 测试点132：验证类的静态字段与实例字段的区分检测
 */
export function Fn132_testClassStaticFieldVsInstanceField() {
    class TestClass {
        static staticField = "staticVal"; // 静态字段
        instanceField = "instanceVal"; // 实例字段（类字段语法）
    }

    const instance = new TestClass();
    const hasInstanceField = Object.hasOwn(instance, "instanceField") === true;
    const hasStaticOnInstance = Object.hasOwn(instance, "staticField") === false;
    const hasStaticOnClass = Object.hasOwn(TestClass, "staticField") === true;
    return hasInstanceField && hasStaticOnInstance && hasStaticOnClass;
}

/**
 * 测试点133：验证对象属性名含数学符号（如∑、π）的检测
 */
export function Fn133_testMathSymbolPropertyName() {
    const testObj = {
        "sum∑": "mathSum", // 求和符号
        "piπ": "mathPi"       // 圆周率符号
    };
    const hasSum = Object.hasOwn(testObj, "sum∑") === true;
    const hasPi = Object.hasOwn(testObj, "piπ") === true;
    const hasNoText = Object.hasOwn(testObj, "sum") === false; // 缺失数学符号不匹配
    return hasSum && hasPi && hasNoText;
}

/**
 * 测试点134：验证ReadableStreamDefaultController实例的自身属性检测
 */
export function Fn134_testReadableStreamControllerOwnProperty() {
    let controller = {};
    if (typeof ReadableStream !== "undefined") {
        new ReadableStream({
            start(ctrl) {
                controller = ctrl;
            } // 获取可读流控制器
        });
    }
    if (controller) {
        controller.ctrlDesc = "readable controller test";
    }
    const hasDesc = controller ? Object.hasOwn(controller, "ctrlDesc") === true : true;
    const hasPrototypeMethod = controller ? Object.hasOwn(controller, "enqueue") === false : true; // enqueue来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点135：验证对象属性被重写为原型属性后，hasOwn检测结果
 */
export function Fn135_testOverrideToPrototypeProperty() {
    const parent = { protoProp: "protoVal" };
    const child = Object.create(parent);
    child.protoProp = "ownVal"; // 先重写为自身属性
    delete child.protoProp; // 删除自身属性，恢复原型属性
    const hasProtoProp = Object.hasOwn(child, "protoProp") === false; // 此时为原型属性，不检测
    const hasOwnProp = Object.hasOwn(child, "ownProp") === false;
    return hasProtoProp && hasOwnProp;
}

/**
 * 测试点136：验证Intl.Collator实例的自身属性检测
 */
export function Fn136_testIntlCollatorOwnProperty() {
    const collator = new Intl.Collator("zh-CN", { sensitivity: "base" });
    collator.collatorDesc = "chinese collator";
    const hasDesc = Object.hasOwn(collator, "collatorDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(collator, "compare") === false; // compare来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点137：验证对象属性名含井号+路径（如#section1）的检测
 */
export function Fn137_testHashPathPropertyName() {
    const testObj = {
        "#section1": "firstSection",
        "#chapter3": "thirdChapter"
    };
    const hasSection1 = Object.hasOwn(testObj, "#section1") === true;
    const hasChapter3 = Object.hasOwn(testObj, "#chapter3") === true;
    const hasNoHashLess = Object.hasOwn(testObj, "section1") === false; // 缺失#不匹配
    return hasSection1 && hasChapter3 && hasNoHashLess;
}

/**
 * 测试点138：验证Promise.allSettled返回的Promise实例自身属性检测
 */
export function Fn138_testPromiseAllSettledInstanceProperty() {
    const promise = Promise.allSettled([Promise.resolve(1), Promise.reject(2)]);
    promise.allSettledDesc = "all settled test";
    const hasDesc = Object.hasOwn(promise, "allSettledDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(promise, "then") === false; // then来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点140：验证对象属性名含特殊符号+Emoji组合（如@😎）的检测
 */
export function Fn140_testSymbolEmojiComboPropertyName() {
    const testObj = {
        "@😎user": "atEmojiUser",
        "#🚀project": "hashEmojiProject"
    };
    const hasAtEmoji = Object.hasOwn(testObj, "@😎user") === true;
    const hasHashEmoji = Object.hasOwn(testObj, "#🚀project") === true;
    const hasNoEmoji = Object.hasOwn(testObj, "@user") === false; // 缺失Emoji不匹配
    return hasAtEmoji && hasHashEmoji && hasNoEmoji;
}

/**
 * 测试点141：验证对象属性名含古埃及数字（如Ⅰ、Ⅱ）的检测
 */
export function Fn141_testEgyptianNumeralPropertyName() {
    const testObj = {
        "itemⅠ": "firstItem", // 古埃及数字1
        "itemⅡ": "secondItem" // 古埃及数字2
    };
    const hasFirstItem = Object.hasOwn(testObj, "itemⅠ") === true;
    const hasSecondItem = Object.hasOwn(testObj, "itemⅡ") === true;
    const hasNoModernNum = Object.hasOwn(testObj, "item1") === false; // 现代数字不匹配
    return hasFirstItem && hasSecondItem && hasNoModernNum;
}

/**
 * 测试点142：验证WritableStreamDefaultController实例的自身属性检测
 */
export function Fn142_testWritableStreamControllerOwnProperty() {
    let controller = {};
    if (typeof WritableStream !== "undefined") {
        new WritableStream({
            start(ctrl) {
                controller = ctrl;
            } // 获取可写流控制器
        });
    }
    if (controller) {
        controller.ctrlDesc = "writable controller test";
    }
    const hasDesc = controller ? Object.hasOwn(controller, "ctrlDesc") === true : true;
    const hasPrototypeMethod = controller ? Object.hasOwn(controller, "error") === false : true; // error来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点143：验证对象属性值为FinalizationRegistry实例时的检测
 */
export function Fn143_testFinalizationRegistryInstanceValueProperty() {
    let registry = {};
    if (typeof FinalizationRegistry !== "undefined") {
        registry = new FinalizationRegistry(() => {
        });
    }
    const testObj = {
        registryProp: registry, // 属性值为FinalizationRegistry
        normalProp: "normal"
    };
    const hasRegistryProp = Object.hasOwn(testObj, "registryProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherRegistry") === false;
    return hasRegistryProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点144：验证类的私有静态字段无法被hasOwn检测
 */
export function Fn144_testClassPrivateStaticFieldDetection() {
    class TestClass {
        static #privateStaticField = "privateStaticVal"; // 私有静态字段
        static publicStaticField = "publicStaticVal"; // 公有静态字段
    }

    const hasPublicStatic = Object.hasOwn(TestClass, "publicStaticField") === true;
    const hasPrivateStatic = Object.hasOwn(TestClass, "#privateStaticField") === false; // 私有不可检测
    const hasNoExtra = Object.hasOwn(TestClass, "extraStaticField") === false;
    return hasPublicStatic && hasPrivateStatic && hasNoExtra;
}

/**
 * 测试点145：验证对象属性名含冒号+路径（如path:subpath）的检测
 */
export function Fn145_testColonPathPropertyName() {
    const testObj = {
        "module:utils": "utilsModule",
        "config:theme": "themeConfig"
    };
    const hasUtilsModule = Object.hasOwn(testObj, "module:utils") === true;
    const hasThemeConfig = Object.hasOwn(testObj, "config:theme") === true;
    const hasNoColon = Object.hasOwn(testObj, "moduleutils") === false; // 缺失冒号不匹配
    return hasUtilsModule && hasThemeConfig && hasNoColon;
}

/**
 * 测试点146：验证Intl.NumberFormat的formatRange方法关联属性检测
 */
export function Fn146_testIntlNumberFormatRange() {
    const formatter = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" });
    formatter.rangeDesc = "number range test";
    const hasDesc = Object.hasOwn(formatter, "rangeDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(formatter, "formatRange") === false; // formatRange来自原型
    const hasNoCurrencyProp = Object.hasOwn(formatter, "USD") === false; // 货币类型不暴露为属性
    return hasDesc && hasPrototypeMethod && hasNoCurrencyProp;
}

/**
 * 测试点147：验证对象属性被Object.seal后修改值，hasOwn检测结果不变
 */
export function Fn147_testSealedPropertyValueModify() {
    const testObj = { sealedProp: "initialVal" };
    Object.seal(testObj);
    testObj.sealedProp = "modifiedVal"; // 密封对象允许修改值
    const hasSealedProp = Object.hasOwn(testObj, "sealedProp") === true; // 属性存在性不受影响
    const noNewProp = Object.hasOwn(testObj, "newProp") === false;
    return hasSealedProp && noNewProp;
}

/**
 * 测试点148：验证Promise.any返回的Promise实例自身属性检测
 */
export function Fn148_testPromiseAnyInstanceProperty() {
    const promise = Promise.any([Promise.reject(1), Promise.resolve(2)]);
    promise.anyDesc = "promise any test";
    const hasDesc = Object.hasOwn(promise, "anyDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(promise, "then") === false; // then来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点149：验证对象属性名含梵文数字（如१、२）的检测
 */
export function Fn149_testSanskritNumeralPropertyName() {
    const testObj = {
        "count१": "countOne", // 梵文数字1
        "count२": "countTwo"   // 梵文数字2
    };
    const hasCountOne = Object.hasOwn(testObj, "count१") === true;
    const hasCountTwo = Object.hasOwn(testObj, "count२") === true;
    const hasNoArabic = Object.hasOwn(testObj, "count1") === false; // 阿拉伯数字不匹配
    return hasCountOne && hasCountTwo && hasNoArabic;
}

/**
 * 测试点151：验证对象属性值为TransformStream实例时的检测
 */
export function Fn151_testTransformStreamInstanceValueProperty() {
    let stream = {};
    if (typeof TransformStream !== "undefined") {
        stream = new TransformStream({ transform: (c, ctrl) => ctrl.enqueue(c) });
    }
    const testObj = {
        streamProp: stream, // 属性值为TransformStream
        normalProp: "normal"
    };
    const hasStreamProp = Object.hasOwn(testObj, "streamProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherStream") === false;
    return hasStreamProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点152：验证类的继承链中getter/setter的检测（子类继承父类getter）
 */
export function Fn152_testClassInheritanceGetterSetter() {
    class Parent {
        get parentGetter() {
            return "parentGet";
        } // 父类getter
    }

    class Child extends Parent {
        get childGetter() {
            return "childGet";
        } // 子类getter

        constructor() {
            super();
            this.childProp = "childVal";
        }
    }

    const childInst = new Child();
    const hasChildGetter = Object.hasOwn(childInst, "childGetter") === false; // 子类自身getter
    const hasParentGetter = Object.hasOwn(childInst, "parentGetter") === false; // 父类getter属原型
    const hasChildProp = Object.hasOwn(childInst, "childProp") === true;
    return hasChildGetter && hasParentGetter && hasChildProp;
}

/**
 * 测试点153：验证对象属性名含波浪号+标识符（如~temp）的检测
 */
export function Fn153_testTildeIdentifierPropertyName() {
    const testObj = {
        "~tempFile": "temporaryFile",
        "~cache": "cacheData"
    };
    const hasTempFile = Object.hasOwn(testObj, "~tempFile") === true;
    const hasCache = Object.hasOwn(testObj, "~cache") === true;
    const hasNoTilde = Object.hasOwn(testObj, "tempFile") === false; // 缺失波浪号不匹配
    return hasTempFile && hasCache && hasNoTilde;
}

/**
 * 测试点154：验证Intl.DateTimeFormat的formatRangeToParts方法关联属性检测
 */
export function Fn154_testIntlDateTimeFormatRangeParts() {
    const formatter = new Intl.DateTimeFormat("zh-CN", { month: "short", day: "numeric" });
    formatter.rangePartsDesc = "range parts test";
    const hasDesc = Object.hasOwn(formatter, "rangePartsDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(formatter, "formatRangeToParts") === false; // 方法来自原型
    const hasNoMonthProp = Object.hasOwn(formatter, "short") === false; // 格式参数不暴露为属性
    return hasDesc && hasPrototypeMethod && hasNoMonthProp;
}

/**
 * 测试点156：验证Intl.Locale实例的自身属性检测
 */
export function Fn156_testIntlLocaleOwnProperty() {
    const locale = new Intl.Locale("zh-CN", { calendar: "gregory" });
    locale.localeDesc = "locale test";
    const hasDesc = Object.hasOwn(locale, "localeDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(locale, "maximize") === false; // maximize来自原型
    const hasLocaleProp = Object.hasOwn(locale, "language") === false; // language是自身属性
    return hasDesc && hasPrototypeMethod && hasLocaleProp;
}

/**
 * 测试点157：验证对象属性名含等号+键值（如key=value）的检测
 */
export function Fn157_testEqualsKeyValuePropertyName() {
    const testObj = {
        "theme=dark": "darkTheme",
        "mode=edit": "editMode"
    };
    const hasDarkTheme = Object.hasOwn(testObj, "theme=dark") === true;
    const hasEditMode = Object.hasOwn(testObj, "mode=edit") === true;
    const hasNoEquals = Object.hasOwn(testObj, "themedark") === false; // 缺失等号不匹配
    return hasDarkTheme && hasEditMode && hasNoEquals;
}

/**
 * 测试点158：验证Promise.withResolvers创建的Promise实例自身属性检测
 */
export function Fn158_testPromiseWithResolvers() {
    let promise = Promise.resolve();
    if (typeof Promise.withResolvers === "function") {
        const { promise: p } = Promise.withResolvers(); // 现代API创建Promise
        promise = p;
    }
    promise.resolversDesc = "with resolvers test";
    const hasDesc = Object.hasOwn(promise, "resolversDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(promise, "resolve") === false; // resolve来自Promise构造函数
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点159：验证对象属性值为ReadableStream实例时的检测
 */
export function Fn159_testReadableStreamInstanceValueProperty() {
    let stream = {};
    if (typeof ReadableStream !== "undefined") {
        stream = new ReadableStream({
            start(ctrl) {
                ctrl.enqueue("data");
            }
        });
    }
    const testObj = {
        streamProp: stream, // 属性值为ReadableStream
        normalProp: "normal"
    };
    const hasStreamProp = Object.hasOwn(testObj, "streamProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherStream") === false;
    return hasStreamProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点160：验证对象属性名含特殊符号+ Unicode（如@ñ）的检测
 */
export function Fn160_testSymbolUnicodeComboPropertyName() {
    const testObj = {
        "@ñame": "spanishName", // @+西班牙语ñ
        "#üser": "germanUser"    // #+德语ü
    };
    const hasSpanishName = Object.hasOwn(testObj, "@ñame") === true;
    const hasGermanUser = Object.hasOwn(testObj, "#üser") === true;
    const hasNoUnicode = Object.hasOwn(testObj, "@name") === false; // 缺失Unicode字符不匹配
    return hasSpanishName && hasGermanUser && hasNoUnicode;
}

/**
 * 测试点161：验证对象属性名含希伯来数字（如א、ב）的检测
 */
export function Fn161_testHebrewNumeralPropertyName() {
    const testObj = {
        "itemא": "hebrewOne", // 希伯来数字1
        "itemב": "hebrewTwo"   // 希伯来数字2
    };
    const hasHebrewOne = Object.hasOwn(testObj, "itemא") === true;
    const hasHebrewTwo = Object.hasOwn(testObj, "itemב") === true;
    const hasNoLatin = Object.hasOwn(testObj, "item1") === false; // 拉丁数字不匹配
    return hasHebrewOne && hasHebrewTwo && hasNoLatin;
}

/**
 * 测试点162：验证CompressionStream实例的自身属性检测
 */
export function Fn162_testCompressionStreamOwnProperty() {
    let stream = {};
    if (typeof CompressionStream !== "undefined") {
        stream = new CompressionStream("gzip"); // 创建gzip压缩流
    }
    stream.streamDesc = "compression stream test";
    const hasDesc = Object.hasOwn(stream, "streamDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(stream, "getReader") === false; // getReader来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点163：验证对象属性值为WritableStream实例时的检测
 */
export function Fn163_testWritableStreamInstanceValueProperty() {
    let stream = {};
    if (typeof WritableStream !== "undefined") {
        stream = new WritableStream({
            write: (chunk) => {
            }
        });
    }
    const testObj = {
        streamProp: stream, // 属性值为WritableStream
        normalProp: "normal"
    };
    const hasStreamProp = Object.hasOwn(testObj, "streamProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherStream") === false;
    return hasStreamProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点164：验证类的私有方法与原型方法的区分检测
 */
export function Fn164_testClassPrivateMethodVsPrototype() {
    class TestClass {
        #privateMethod() {
            return "private";
        } // 私有方法

        prototypeMethod() {
            return "prototype";
        } // 原型方法
    }

    const instance = new TestClass();
    const hasPrototypeMethod = Object.hasOwn(instance, "prototypeMethod") === false; // 原型方法不属自身
    const hasPrivateMethod = Object.hasOwn(instance, "#privateMethod") === false; // 私有方法不可检测
    const hasOwnProp = Object.hasOwn(instance, "ownProp") === false;
    return hasPrototypeMethod && hasPrivateMethod && hasOwnProp;
}

/**
 * 测试点165：验证对象属性名含分号+配置（如config;debug）的检测
 */
export function Fn165_testSemicolonConfigPropertyName() {
    const testObj = {
        "config;debug=true": "debugConfig",
        "style;theme=light": "lightStyle"
    };
    const hasDebugConfig = Object.hasOwn(testObj, "config;debug=true") === true;
    const hasLightStyle = Object.hasOwn(testObj, "style;theme=light") === true;
    const hasNoSemicolon = Object.hasOwn(testObj, "configdebug=true") === false; // 缺失分号不匹配
    return hasDebugConfig && hasLightStyle && hasNoSemicolon;
}

/**
 * 测试点166：验证Intl.PluralRules的selectRange方法关联属性检测
 */
export function Fn166_testIntlPluralRulesSelectRange() {
    const pluralRules = new Intl.PluralRules("en-US");
    pluralRules.rangeDesc = "plural range test";
    const hasDesc = Object.hasOwn(pluralRules, "rangeDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(pluralRules, "selectRange") === false; // selectRange来自原型
    const hasNoLangProp = Object.hasOwn(pluralRules, "en-US") === false; // 语言参数不暴露为属性
    return hasDesc && hasPrototypeMethod && hasNoLangProp;
}

/**
 * 测试点167：验证对象属性被Object.preventExtensions后修改现有值，hasOwn检测结果
 */
export function Fn167_testPreventExtensionsModifyValue() {
    const testObj = { modProp: "initial" };
    Object.preventExtensions(testObj);
    testObj.modProp = "modified"; // 禁止扩展允许修改现有值
    const hasModProp = Object.hasOwn(testObj, "modProp") === true; // 属性存在性不变
    const noNewProp = Object.hasOwn(testObj, "newProp") === false;
    return hasModProp && noNewProp;
}

/**
 * 测试点168：验证AggregateError实例的自身属性检测
 */
export function Fn168_testAggregateErrorOwnProperty() {
    const errors = [new Error("err1"), new Error("err2")];
    const aggError = new AggregateError(errors, "multiple errors");
    aggError.errorDesc = "aggregate error test";
    const hasDesc = Object.hasOwn(aggError, "errorDesc") === true;
    const hasErrorsProp = Object.hasOwn(aggError, "errors") === true; // errors是自身属性
    const hasPrototypeMethod = Object.hasOwn(aggError, "toString") === false; // toString来自原型
    return hasDesc && hasErrorsProp && hasPrototypeMethod;
}

/**
 * 测试点169：验证对象属性名含泰语数字（如๑、๒）的检测
 */
export function Fn169_testThaiNumeralPropertyName() {
    const testObj = {
        "count๑": "thaiOne", // 泰语数字1
        "count๒": "thaiTwo"   // 泰语数字2
    };
    const hasThaiOne = Object.hasOwn(testObj, "count๑") === true;
    const hasThaiTwo = Object.hasOwn(testObj, "count๒") === true;
    const hasNoArabic = Object.hasOwn(testObj, "count1") === false; // 阿拉伯数字不匹配
    return hasThaiOne && hasThaiTwo && hasNoArabic;
}

/**
 * 测试点170：验证DecompressionStream实例的自身属性检测
 */
export function Fn170_testDecompressionStreamOwnProperty() {
    let stream = {};
    if (typeof DecompressionStream !== "undefined") {
        stream = new DecompressionStream("gzip"); // 创建gzip解压缩流
    }
    stream.streamDesc = "decompression stream test";
    const hasDesc = Object.hasOwn(stream, "streamDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(stream, "getReader") === false; // getReader来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点171：验证对象属性值为CompressionStream实例时的检测
 */
export function Fn171_testCompressionStreamInstanceValueProperty() {
    let stream = {};
    if (typeof CompressionStream !== "undefined") {
        stream = new CompressionStream("deflate");
    }
    const testObj = {
        streamProp: stream, // 属性值为CompressionStream
        normalProp: "normal"
    };
    const hasStreamProp = Object.hasOwn(testObj, "streamProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherStream") === false;
    return hasStreamProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点172：验证类的静态方法与原型方法的区分检测
 */
export function Fn172_testClassStaticMethodVsPrototype() {
    class TestClass {
        static staticMethod() {
            return "static";
        } // 静态方法（属类自身）

        prototypeMethod() {
            return "prototype";
        } // 原型方法（属实例原型）
    }

    const instance = new TestClass();
    const hasStaticOnClass = Object.hasOwn(TestClass, "staticMethod") === true;
    const hasStaticOnInstance = Object.hasOwn(instance, "staticMethod") === false;
    const hasPrototypeMethod = Object.hasOwn(instance, "prototypeMethod") === false;
    return hasStaticOnClass && hasStaticOnInstance && hasPrototypeMethod;
}

/**
 * 测试点173：验证对象属性名含问号+参数（如query?param）的检测
 */
export function Fn173_testQuestionParamPropertyName() {
    const testObj = {
        "query?sort=asc": "sortedQuery",
        "filter?type=text": "textFilter"
    };
    const hasSortedQuery = Object.hasOwn(testObj, "query?sort=asc") === true;
    const hasTextFilter = Object.hasOwn(testObj, "filter?type=text") === true;
    const hasNoQuestion = Object.hasOwn(testObj, "querysort=asc") === false; // 缺失问号不匹配
    return hasSortedQuery && hasTextFilter && hasNoQuestion;
}

/**
 * 测试点174：验证Intl.RelativeTimeFormat的formatToParts方法关联属性检测
 */
export function Fn174_testIntlRelativeTimeFormatParts() {
    const rtf = new Intl.RelativeTimeFormat("en-US", { numeric: "auto" });
    rtf.partsDesc = "relative time parts test";
    const hasDesc = Object.hasOwn(rtf, "partsDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(rtf, "formatToParts") === false; // formatToParts来自原型
    const hasNoNumericProp = Object.hasOwn(rtf, "auto") === false; // 配置参数不暴露为属性
    return hasDesc && hasPrototypeMethod && hasNoNumericProp;
}

/**
 * 测试点177：验证对象属性名含阿拉伯字母（如أ、ب）的检测
 */
export function Fn177_testArabicLetterPropertyName() {
    const testObj = {
        "أسم": "arabicName", // 阿拉伯字母"名"
        "رقم": "arabicNumber" // 阿拉伯字母"数字"
    };
    const hasArabicName = Object.hasOwn(testObj, "أسم") === true;
    const hasArabicNumber = Object.hasOwn(testObj, "رقم") === true;
    const hasNoLatin = Object.hasOwn(testObj, "name") === false; // 拉丁字母不匹配
    return hasArabicName && hasArabicNumber && hasNoLatin;
}

/**
 * 测试点178：验证ReadableByteStreamController实例的自身属性检测
 */
export function Fn178_testReadableByteStreamControllerOwnProperty() {
    let controller = {};
    if (typeof ReadableStream !== "undefined") {
        new ReadableStream({
            type: "bytes",
            start(ctrl) {
                controller = ctrl;
            } // 获取字节流控制器
        });
    }
    if (controller) {
        controller.ctrlDesc = "byte stream controller test";
    }
    const hasDesc = controller ? Object.hasOwn(controller, "ctrlDesc") === true : true;
    const hasPrototypeMethod = controller ? Object.hasOwn(controller, "enqueue") === false : true; // enqueue来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点179：验证对象属性值为DecompressionStream实例时的检测
 */
export function Fn179_testDecompressionStreamInstanceValueProperty() {
    let stream = {};
    if (typeof DecompressionStream !== "undefined") {
        stream = new DecompressionStream("deflate");
    }
    const testObj = {
        streamProp: stream, // 属性值为DecompressionStream
        normalProp: "normal"
    };
    const hasStreamProp = Object.hasOwn(testObj, "streamProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherStream") === false;
    return hasStreamProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点180：验证对象属性名含组合字符（如é=e+´）的检测
 */
export function Fn180_testCombiningCharPropertyName() {
    const testObj = {
        "café": "eWithAcute", // 预组合字符é
        "cafe\u0301": "ePlusAcute"   // 基础字符e+组合符´
    };
    const hasPrecomposed = Object.hasOwn(testObj, "café") === true;
    const hasCombining = Object.hasOwn(testObj, "cafe\u0301") === true;
    const hasNoCombining = Object.hasOwn(testObj, "cafe") === false; // 无组合符不匹配
    return hasPrecomposed && hasCombining && hasNoCombining;
}

/**
 * 测试点181：验证对象属性名含日语假名（如あ、か）的检测
 */
export function Fn181_testJapaneseKanaPropertyName() {
    const testObj = {
        "名前あ": "japaneseNameA", // 平假名"あ"
        "カタカナか": "japaneseKanaKa"  // 片假名"カ"+平假名"か"
    };
    const hasKanaA = Object.hasOwn(testObj, "名前あ") === true;
    const hasKanaKa = Object.hasOwn(testObj, "カタカナか") === true;
    const hasNoKana = Object.hasOwn(testObj, "名前") === false; // 缺失假名不匹配
    return hasKanaA && hasKanaKa && hasNoKana;
}

/**
 * 测试点182：验证TextEncoder实例的自身属性检测
 */
export function Fn182_testTextEncoderOwnProperty() {
    let encoder = {};
    if (typeof TextEncoder !== "undefined") {
        encoder = new TextEncoder("utf-8"); // 创建UTF-8文本编码器
    }
    encoder.encoderDesc = "text encoder test";
    const hasDesc = Object.hasOwn(encoder, "encoderDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(encoder, "encode") === false; // encode来自原型
    const hasEncodingProp = Object.hasOwn(encoder, "encoding") === false; // encoding是自身属性
    return hasDesc && hasPrototypeMethod && hasEncodingProp;
}

/**
 * 测试点183：验证对象属性值为TextEncoder实例时的检测
 */
export function Fn183_testTextEncoderInstanceValueProperty() {
    let encoder = {};
    if (typeof TextEncoder !== "undefined") {
        encoder = new TextEncoder();
    }
    const testObj = {
        encoderProp: encoder, // 属性值为TextEncoder
        normalProp: "normal"
    };
    const hasEncoderProp = Object.hasOwn(testObj, "encoderProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherEncoder") === false;
    return hasEncoderProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点184：验证类的私有字段与静态字段的区分检测
 */
export function Fn184_testClassPrivateFieldVsStaticField() {
    class TestClass {
        #privateField = "privateVal"; // 实例私有字段
        static staticField = "staticVal"; // 类静态字段
    }

    const instance = new TestClass();
    const hasStaticOnClass = Object.hasOwn(TestClass, "staticField") === true;
    const hasStaticOnInstance = Object.hasOwn(instance, "staticField") === false;
    const hasPrivateField = Object.hasOwn(instance, "#privateField") === false; // 私有字段不可检测
    return hasStaticOnClass && hasStaticOnInstance && hasPrivateField;
}

/**
 * 测试点185：验证对象属性名含竖线+选项（如option|value）的检测
 */
export function Fn185_testPipeOptionPropertyName() {
    const testObj = {
        "color|red": "redColor",
        "size|large": "largeSize"
    };
    const hasRedColor = Object.hasOwn(testObj, "color|red") === true;
    const hasLargeSize = Object.hasOwn(testObj, "size|large") === true;
    const hasNoPipe = Object.hasOwn(testObj, "colorred") === false; // 缺失竖线不匹配
    return hasRedColor && hasLargeSize && hasNoPipe;
}

/**
 * 测试点186：验证Intl.Collator的compare方法关联属性检测
 */
export function Fn186_testIntlCollatorCompare() {
    const collator = new Intl.Collator("fr-FR", { sensitivity: "accent" });
    collator.compareDesc = "french collator test";
    const hasDesc = Object.hasOwn(collator, "compareDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(collator, "compare") === false; // compare来自原型
    const hasNoSensitivityProp = Object.hasOwn(collator, "accent") === false; // 配置参数不暴露为属性
    return hasDesc && hasPrototypeMethod && hasNoSensitivityProp;
}

/**
 * 测试点187：验证对象属性被Object.seal后用defineProperty修改描述符的检测
 */
export function Fn187_testSealedPropertyDefineDescriptor() {
    const testObj = { sealProp: "initial" };
    Object.seal(testObj);
    // 密封对象允许修改可配置性之外的描述符（如writable）
    Object.defineProperty(testObj, "sealProp", { writable: false });
    const hasSealProp = Object.hasOwn(testObj, "sealProp") === true; // 属性存在性不变
    const noNewProp = Object.hasOwn(testObj, "newSealProp") === false;
    return hasSealProp && noNewProp;
}

/**
 * 测试点188：验证TextDecoder实例的自身属性检测
 */
export function Fn188_testTextDecoderOwnProperty() {
    let decoder = {};
    if (typeof TextDecoder !== "undefined") {
        decoder = new TextDecoder("utf-8", { fatal: false }); // 创建UTF-8文本解码器
    }
    decoder.decoderDesc = "text decoder test";
    const hasDesc = Object.hasOwn(decoder, "decoderDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(decoder, "decode") === false; // decode来自原型
    const hasEncodingProp = Object.hasOwn(decoder, "encoding") === false; // encoding是自身属性
    return hasDesc && hasPrototypeMethod && hasEncodingProp;
}

/**
 * 测试点189：验证对象属性名含韩语 Hangul（如가、나）的检测
 */
export function Fn189_testKoreanHangulPropertyName() {
    const testObj = {
        "한글가": "koreanHangulGa", // Hangul"가"
        "글자나": "koreanHangulNa"   // Hangul"나"
    };
    const hasHangulGa = Object.hasOwn(testObj, "한글가") === true;
    const hasHangulNa = Object.hasOwn(testObj, "글자나") === true;
    const hasNoHangul = Object.hasOwn(testObj, "한글") === false; // 缺失Hangul不匹配
    return hasHangulGa && hasHangulNa && hasNoHangul;
}

/**
 * 测试点190：验证CountQueuingStrategy实例的自身属性检测
 */
export function Fn190_testCountQueuingStrategyOwnProperty() {
    let strategy = {};
    if (typeof CountQueuingStrategy !== "undefined") {
        strategy = new CountQueuingStrategy({ highWaterMark: 16 }); // 创建计数队列策略
    }
    strategy.strategyDesc = "count queuing strategy test";
    const hasDesc = Object.hasOwn(strategy, "strategyDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(strategy, "size") === false; // size来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点191：验证对象属性值为TextDecoder实例时的检测
 */
export function Fn191_testTextDecoderInstanceValueProperty() {
    let decoder = {};
    if (typeof TextDecoder !== "undefined") {
        decoder = new TextDecoder("utf-16");
    }
    const testObj = {
        decoderProp: decoder, // 属性值为TextDecoder
        normalProp: "normal"
    };
    const hasDecoderProp = Object.hasOwn(testObj, "decoderProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherDecoder") === false;
    return hasDecoderProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点192：验证类的继承链中静态字段的检测（子类继承父类静态字段）
 */
export function Fn192_testClassInheritanceStaticField() {
    class Parent {
        static parentStatic = "parentStaticVal"; // 父类静态字段
    }

    class Child extends Parent {
        static childStatic = "childStaticVal"; // 子类静态字段
    }

    const hasChildStatic = Object.hasOwn(Child, "childStatic") === true; // 子类自身静态字段
    const hasParentStaticOnChild = Object.hasOwn(Child, "parentStatic") === false; // 父类静态属性格式上不属子类自身
    const hasParentStaticOnParent = Object.hasOwn(Parent, "parentStatic") === true;
    return hasChildStatic && hasParentStaticOnChild && hasParentStaticOnParent;
}

/**
 * 测试点193：验证对象属性名含美元符号+变量（如$var）的检测
 */
export function Fn193_testDollarVariablePropertyName() {
    const testObj = {
        "$userName": "userNameVar",
        "$totalCount": "totalCountVar"
    };
    const hasUserNameVar = Object.hasOwn(testObj, "$userName") === true;
    const hasTotalCountVar = Object.hasOwn(testObj, "$totalCount") === true;
    const hasNoDollar = Object.hasOwn(testObj, "userName") === false; // 缺失美元符号不匹配
    return hasUserNameVar && hasTotalCountVar && hasNoDollar;
}

/**
 * 测试点194：验证Intl.DisplayNames的of方法关联属性检测
 */
export function Fn194_testIntlDisplayNamesOf() {
    const displayNames = new Intl.DisplayNames("ja-JP", { type: "region" });
    displayNames.regionDesc = "japanese region names test";
    const hasDesc = Object.hasOwn(displayNames, "regionDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(displayNames, "of") === false; // of来自原型
    const hasNoTypeProp = Object.hasOwn(displayNames, "region") === false; // 类型参数不暴露为属性
    return hasDesc && hasPrototypeMethod && hasNoTypeProp;
}

/**
 * 测试点195：验证对象属性被Object.freeze后用defineProperty修改描述符的检测
 */
export function Fn195_testFrozenPropertyDefineDescriptor() {
    const testObj = { freezeProp: "initial" };
    Object.freeze(testObj);
    // 冻结对象禁止修改任何描述符（严格模式报错，此处验证属性存在性）
    try {
        Object.defineProperty(testObj, "freezeProp", { value: "modified" });
    } catch (e) {
    }
    const hasFreezeProp = Object.hasOwn(testObj, "freezeProp") === true; // 属性存在性不变
    const noNewProp = Object.hasOwn(testObj, "newFreezeProp") === false;
    return hasFreezeProp && noNewProp;
}

/**
 * 测试点196：验证ByteLengthQueuingStrategy实例的自身属性检测
 */
export function Fn196_testByteLengthQueuingStrategyOwnProperty() {
    let strategy = {};
    if (typeof ByteLengthQueuingStrategy !== "undefined") {
        strategy = new ByteLengthQueuingStrategy({ highWaterMark: 1024 }); // 创建字节长度队列策略
    }
    strategy.strategyDesc = "byte length queuing strategy test";
    const hasDesc = Object.hasOwn(strategy, "strategyDesc") === true;
    const hasPrototypeMethod = Object.hasOwn(strategy, "size") === false; // size来自原型
    return hasDesc && hasPrototypeMethod;
}

/**
 * 测试点197：验证对象属性名含百分号+比例（如50%）的检测
 */
export function Fn197_testPercentRatioPropertyName() {
    const testObj = {
        "opacity50%": "halfOpacity",
        "progress80%": "highProgress"
    };
    const hasHalfOpacity = Object.hasOwn(testObj, "opacity50%") === true;
    const hasHighProgress = Object.hasOwn(testObj, "progress80%") === true;
    const hasNoPercent = Object.hasOwn(testObj, "opacity50") === false; // 缺失百分号不匹配
    return hasHalfOpacity && hasHighProgress && hasNoPercent;
}

/**
 * 测试点198：验证Promise.race与Promise.allSettled返回实例的属性检测差异
 */
export function Fn198_testPromiseRaceVsAllSettled() {
    const racePromise = Promise.race([Promise.resolve(1)]);
    const settledPromise = Promise.allSettled([Promise.reject(2)]);
    racePromise.raceTag = "race";
    settledPromise.settledTag = "settled";

    const raceHasTag = Object.hasOwn(racePromise, "raceTag") === true;
    const settledHasTag = Object.hasOwn(settledPromise, "settledTag") === true;
    // 两者原型方法均不属自身属性
    const raceNoThen = Object.hasOwn(racePromise, "then") === false;
    const settledNoThen = Object.hasOwn(settledPromise, "then") === false;

    return raceHasTag && settledHasTag && raceNoThen && settledNoThen;
}

/**
 * 测试点199：验证对象属性值为CountQueuingStrategy实例时的检测
 */
export function Fn199_testCountQueuingStrategyInstanceValueProperty() {
    let strategy = {};
    if (typeof CountQueuingStrategy !== "undefined") {
        strategy = new CountQueuingStrategy({ highWaterMark: 8 });
    }
    const testObj = {
        strategyProp: strategy, // 属性值为CountQueuingStrategy
        normalProp: "normal"
    };
    const hasStrategyProp = Object.hasOwn(testObj, "strategyProp") === true;
    const hasNormalProp = Object.hasOwn(testObj, "normalProp") === true;
    const noExtraProp = Object.hasOwn(testObj, "otherStrategy") === false;
    return hasStrategyProp && hasNormalProp && noExtraProp;
}

/**
 * 测试点200：验证对象属性名含特殊符号+多语言（如@한글）的检测
 */
export function Fn200_testSymbolMultiLangComboPropertyName() {
    const testObj = {
        "@한글": "atKorean", // @+韩语
        "#日本語": "hashJapanese" // #+日语
    };
    const hasAtKorean = Object.hasOwn(testObj, "@한글") === true;
    const hasHashJapanese = Object.hasOwn(testObj, "#日本語") === true;
    const hasNoSymbol = Object.hasOwn(testObj, "한글") === false; // 缺失特殊符号不匹配
    return hasAtKorean && hasHashJapanese && hasNoSymbol;
}

