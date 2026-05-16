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
 * 测试点1：默认创建的对象是否可扩展（预期可扩展，返回true）
 */
export function Fn01_testDefaultObjectExtensible() {
    const normalObj = { name: "test" };
    return Object.isExtensible(normalObj) === true;
}

/**
 * 测试点2：被 Object.preventExtensions() 处理后的对象是否不可扩展（预期不可扩展，返回true）
 */
export function Fn02_testPreventedObjectExtensible() {
    const lockedObj = { age: 20 };
    Object.preventExtensions(lockedObj);
    return Object.isExtensible(lockedObj) === false;
}

/**
 * 测试点4：Object.create(null) 创建的空对象是否可扩展（预期可扩展，返回true）
 */
export function Fn04_testNullPrototypeObjectExtensible() {
    const nullProtoObj = Object.create(null);
    return Object.isExtensible(nullProtoObj) === true;
}

/**
 * 测试点6：数组对象默认是否可扩展（预期可扩展，返回true）
 */
export function Fn06_testDefaultArrayExtensible() {
    const testArr = [1, 2, 3];
    return Object.isExtensible(testArr) === true;
}

/**
 * 测试点7：阻止扩展后的数组是否不可扩展（预期不可扩展，返回true）
 */
export function Fn07_testPreventedArrayExtensible() {
    const testArr = [1, 2, 3];
    Object.preventExtensions(testArr);
    return Object.isExtensible(testArr) === false;
}

/**
 * 测试点8：阻止扩展后的数组修改现有元素是否不影响可扩展性判断（返回true）
 */
export function Fn08_testModifyArrAfterPreventExtensible() {
    const testArr = [1, 2, 3];
    Object.preventExtensions(testArr);
    testArr[0] = 100; // 允许修改现有元素
    return Object.isExtensible(testArr) === false && testArr[0] === 100;
}

/**
 * 测试点9：Date对象默认是否可扩展（预期可扩展，返回true）
 */
export function Fn09_testDefaultDateExtensible() {
    const testDate = new Date();
    return Object.isExtensible(testDate) === true;
}

/**
 * 测试点10：阻止扩展后的Date对象是否不可扩展（预期不可扩展，返回true）
 */
export function Fn10_testPreventedDateExtensible() {
    const testDate = new Date();
    Object.preventExtensions(testDate);
    return Object.isExtensible(testDate) === false;
}

/**
 * 测试点11：RegExp对象默认是否可扩展（预期可扩展，返回true）
 */
export function Fn11_testDefaultRegExpExtensible() {
    const testReg = /test/;
    return Object.isExtensible(testReg) === true;
}

/**
 * 测试点12：阻止扩展后的RegExp对象是否不可扩展（预期不可扩展，返回true）
 */
export function Fn12_testPreventedRegExpExtensible() {
    const testReg = /test/;
    Object.preventExtensions(testReg);
    return Object.isExtensible(testReg) === false;
}

/**
 * 测试点14：undefined作为参数时是否返回false（符合规范，返回true）
 */
export function Fn14_testUndefinedParameter() {
    return Object.isExtensible(undefined) === false;
}

/**
 * 测试点15：null作为参数时是否返回false（符合规范，返回true）
 */
export function Fn15_testNullParameter() {
    return Object.isExtensible(null) === false;
}

/**
 * 测试点16：冻结对象（Object.freeze）是否不可扩展（预期不可扩展，返回true）
 */
export function Fn16_testFrozenObjectExtensible() {
    const frozenObj = { key: "value" };
    Object.freeze(frozenObj);
    return Object.isExtensible(frozenObj) === false;
}

/**
 * 测试点17：密封对象（Object.seal）是否不可扩展（预期不可扩展，返回true）
 */
export function Fn17_testSealedObjectExtensible() {
    const sealedObj = { key: "value" };
    Object.seal(sealedObj);
    return Object.isExtensible(sealedObj) === false;
}

/**
 * 测试点18：阻止扩展后删除现有属性是否不影响可扩展性判断（返回true）
 */
export function Fn18_testDeletePropAfterPreventExtensible() {
    const testObj = { name: "test" };
    Object.preventExtensions(testObj);
    delete testObj.name; // 允许删除现有属性
    return Object.isExtensible(testObj) === false && !("name" in testObj);
}

/**
 * 测试点19：嵌套对象中，外层阻止扩展是否影响内层对象可扩展性（内层仍可扩展，返回true）
 */
export function Fn19_testNestedObjectExtensible() {
    const outerObj = { inner: { key: "value" } };
    Object.preventExtensions(outerObj);
    const isOuterExtensible = Object.isExtensible(outerObj);
    const isInnerExtensible = Object.isExtensible(outerObj.inner);
    return isOuterExtensible === false && isInnerExtensible === true;
}

/**
 * 测试点20：类实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn20_testClassInstanceExtensible() {
    class TestClass {
    }

    const classInstance = new TestClass();
    return Object.isExtensible(classInstance) === true;
}

/**
 * 测试点22：Map实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn22_testDefaultMapExtensible() {
    const testMap = new Map([["key1", "value1"]]);
    return Object.isExtensible(testMap) === true;
}

/**
 * 测试点23：阻止扩展后的Map实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn23_testPreventedMapExtensible() {
    const testMap = new Map([["key1", "value1"]]);
    Object.preventExtensions(testMap);
    return Object.isExtensible(testMap) === false;
}

/**
 * 测试点24：Set实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn24_testDefaultSetExtensible() {
    const testSet = new Set([1, 2, 3]);
    return Object.isExtensible(testSet) === true;
}

/**
 * 测试点25：阻止扩展后的Set实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn25_testPreventedSetExtensible() {
    const testSet = new Set([1, 2, 3]);
    Object.preventExtensions(testSet);
    return Object.isExtensible(testSet) === false;
}

/**
 * 测试点26：WeakMap实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn26_testDefaultWeakMapExtensible() {
    const testWeakMap = new WeakMap();
    const key = {};
    testWeakMap.set(key, "value");
    return Object.isExtensible(testWeakMap) === true;
}

/**
 * 测试点27：阻止扩展后的WeakMap实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn27_testPreventedWeakMapExtensible() {
    const testWeakMap = new WeakMap();
    const key = {};
    testWeakMap.set(key, "value");
    Object.preventExtensions(testWeakMap);
    return Object.isExtensible(testWeakMap) === false;
}

/**
 * 测试点28：WeakSet实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn28_testDefaultWeakSetExtensible() {
    const testWeakSet = new WeakSet();
    const val = {};
    testWeakSet.add(val);
    return Object.isExtensible(testWeakSet) === true;
}

/**
 * 测试点29：阻止扩展后的WeakSet实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn29_testPreventedWeakSetExtensible() {
    const testWeakSet = new WeakSet();
    const val = {};
    testWeakSet.add(val);
    Object.preventExtensions(testWeakSet);
    return Object.isExtensible(testWeakSet) === false;
}

/**
 * 测试点30：Function实例（普通函数）默认是否可扩展（预期可扩展，返回true）
 */
export function Fn30_testDefaultFunctionExtensible() {

    function testFunc() {
    }

    return Object.isExtensible(testFunc) === true;
}

/**
 * 测试点31：阻止扩展后的Function实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn31_testPreventedFunctionExtensible() {

    function testFunc() {
    }

    Object.preventExtensions(testFunc);
    return Object.isExtensible(testFunc) === false;
}

/**
 * 测试点32：箭头函数默认是否可扩展（预期可扩展，返回true）
 */
export function Fn32_testDefaultArrowFuncExtensible() {
    const testArrowFunc = () => {
    };
    return Object.isExtensible(testArrowFunc) === true;
}

/**
 * 测试点33：阻止扩展后的箭头函数是否不可扩展（预期不可扩展，返回true）
 */
export function Fn33_testPreventedArrowFuncExtensible() {
    const testArrowFunc = () => {
    };
    Object.preventExtensions(testArrowFunc);
    return Object.isExtensible(testArrowFunc) === false;
}

/**
 * 测试点34：Promise实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn34_testDefaultPromiseExtensible() {
    const testPromise = Promise.resolve("test");
    return Object.isExtensible(testPromise) === true;
}

/**
 * 测试点35：阻止扩展后的Promise实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn35_testPreventedPromiseExtensible() {
    const testPromise = Promise.resolve("test");
    Object.preventExtensions(testPromise);
    return Object.isExtensible(testPromise) === false;
}

/**
 * 测试点36：Generator函数实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn36_testDefaultGeneratorExtensible() {

    function* testGenerator() {
        yield 1;
    }

    const genInstance = testGenerator();
    return Object.isExtensible(genInstance) === true;
}

/**
 * 测试点37：阻止扩展后的Generator实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn37_testPreventedGeneratorExtensible() {

    function* testGenerator() {
        yield 1;
    }

    const genInstance = testGenerator();
    Object.preventExtensions(genInstance);
    return Object.isExtensible(genInstance) === false;
}

/**
 * 测试点38：TypedArray（Uint8Array）实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn38_testDefaultTypedArrayExtensible() {
    const testTypedArr = new Uint8Array([1, 2, 3]);
    return Object.isExtensible(testTypedArr) === true;
}

/**
 * 测试点39：阻止扩展后的TypedArray实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn39_testPreventedTypedArrayExtensible() {
    const testTypedArr = new Uint8Array([1, 2, 3]);
    Object.preventExtensions(testTypedArr);
    return Object.isExtensible(testTypedArr) === false;
}

/**
 * 测试点44：继承自不可扩展对象的子对象是否可扩展（子对象默认可扩展，返回true）
 */
export function Fn44_testInheritedFromNonExtensibleObj() {
    const parent = { p: 1 };
    Object.preventExtensions(parent);
    const child = Object.create(parent); // 子对象继承自不可扩展的父对象
    return Object.isExtensible(child) === true;
}

/**
 * 测试点45：子对象阻止扩展后，父对象可扩展性是否不变（父对象仍不可扩展，返回true）
 */
export function Fn45_testChildPreventExtensibleAffectParent() {
    const parent = { p: 1 };
    Object.preventExtensions(parent);
    const child = Object.create(parent);
    Object.preventExtensions(child);
    return Object.isExtensible(child) === false && Object.isExtensible(parent) === false;
}

/**
 * 测试点46：空对象阻止扩展后，使用Object.defineProperty添加属性是否失败（返回true）
 */
export function Fn46_testDefinePropAfterPreventExtensible() {
    const testObj = {};
    Object.preventExtensions(testObj);
    let defineSuccess = true;
    try {
        Object.defineProperty(testObj, "newKey", { value: "newVal" });
    } catch (e) {
        defineSuccess = false; // 严格模式下会抛错，非严格模式静默失败，此处捕获错误标记失败
    }
    return Object.isExtensible(testObj) === false && !defineSuccess;
}

/**
 * 测试点47：类的原型对象默认是否可扩展（预期可扩展，返回true）
 */
export function Fn47_testDefaultClassProtoExtensible() {
    class TestCls {
    }

    return Object.isExtensible(TestCls.prototype) === true;
}

/**
 * 测试点48：类的原型对象阻止扩展后是否不可扩展（预期不可扩展，返回true）
 */
export function Fn48_testPreventedClassProtoExtensible() {
    class TestCls {
    }

    Object.preventExtensions(TestCls.prototype);
    return Object.isExtensible(TestCls.prototype) === false;
}

/**
 * 测试点49：扩展内置类（如Array）的实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn49_testExtendedBuiltInClassInstanceExtensible() {
    class MyArray extends Array {
    }

    const myArr = new MyArray(1, 2, 3);
    return Object.isExtensible(myArr) === true;
}

/**
 * 测试点50：扩展内置类的实例阻止扩展后是否不可扩展（预期不可扩展，返回true）
 */
export function Fn50_testPreventedExtendedBuiltInClassInstanceExtensible() {
    class MyArray extends Array {
    }

    const myArr = new MyArray(1, 2, 3);
    Object.preventExtensions(myArr);
    return Object.isExtensible(myArr) === false;
}

/**
 * 测试点55：ArrayBuffer实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn55_testDefaultArrayBufferExtensible() {
    const testBuffer = new ArrayBuffer(8);
    return Object.isExtensible(testBuffer) === true;
}

/**
 * 测试点56：阻止扩展后的ArrayBuffer实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn56_testPreventedArrayBufferExtensible() {
    const testBuffer = new ArrayBuffer(8);
    Object.preventExtensions(testBuffer);
    return Object.isExtensible(testBuffer) === false;
}

/**
 * 测试点57：DataView实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn57_testDefaultDataViewExtensible() {
    const buffer = new ArrayBuffer(8);
    const testDataView = new DataView(buffer);
    return Object.isExtensible(testDataView) === true;
}

/**
 * 测试点58：阻止扩展后的DataView实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn58_testPreventedDataViewExtensible() {
    const buffer = new ArrayBuffer(8);
    const testDataView = new DataView(buffer);
    Object.preventExtensions(testDataView);
    return Object.isExtensible(testDataView) === false;
}

/**
 * 测试点65：不可扩展对象的原型链修改是否不影响可扩展性判断（返回true）
 */
export function Fn65_testProtoChainModifyOnNonExtensibleObj() {
    const parent = { p: 1 };
    const child = { c: 2 };
    Object.setPrototypeOf(child, parent);
    Object.preventExtensions(child);
    const newParent = { p: 100 };
    Object.setPrototypeOf(child, newParent); // 非严格模式允许修改原型
    return Object.isExtensible(child) === false && child.p === 100;
}

/**
 * 测试点66：不可扩展对象添加访问器属性是否失败（返回true）
 */
export function Fn66_testAddAccessorPropOnNonExtensibleObj() {
    const testObj = { a: 1 };
    Object.preventExtensions(testObj);
    let addSuccess = true;
    try {
        Object.defineProperty(testObj, "b", {
            get() {
                return 2;
            },
            set(val) { /* 空实现 */
            }
        });
    } catch (e) {
        addSuccess = false;
    }
    return Object.isExtensible(testObj) === false && !addSuccess;
}

/**
 * 测试点67：类的静态属性所在对象（类本身）默认是否可扩展（预期可扩展，返回true）
 */
export function Fn67_testDefaultClassStaticExtensible() {
    class TestCls {
        static staticProp = 1;
    }

    return Object.isExtensible(TestCls) === true;
}

/**
 * 测试点68：类本身阻止扩展后是否不可扩展（预期不可扩展，返回true）
 */
export function Fn68_testPreventedClassStaticExtensible() {
    class TestCls {
        static staticProp = 1;
    }

    Object.preventExtensions(TestCls);
    return Object.isExtensible(TestCls) === false;
}

/**
 * 测试点70：Proxy实例默认是否可扩展（预期可扩展，返回true）
 */
export function Fn70_testDefaultProxyExtensible() {
    const target = { a: 1 };
    const testProxy = new Proxy(target, {});
    return Object.isExtensible(testProxy) === true;
}

/**
 * 测试点71：阻止扩展后的Proxy实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn71_testPreventedProxyExtensible() {
    const target = { a: 1 };
    const testProxy = new Proxy(target, {});
    Object.preventExtensions(testProxy);
    return Object.isExtensible(testProxy) === false;
}

/**
 * 测试点72：Proxy目标不可扩展时，Proxy实例是否不可扩展（返回true）
 */
export function Fn72_testProxyTargetNonExtensible() {
    const target = { a: 1 };
    Object.preventExtensions(target);
    const testProxy = new Proxy(target, {});
    return Object.isExtensible(testProxy) === false;
}

/**
 * 测试点76：Map实例阻止扩展后添加键值对是否不影响可扩展性（返回true）
 */
export function Fn76_testAddMapEntryAfterPreventExtensible() {
    const testMap = new Map([["k1", "v1"]]);
    Object.preventExtensions(testMap);
    testMap.set("k2", "v2"); // Map自身方法不受Object.preventExtensions影响
    return Object.isExtensible(testMap) === false && testMap.has("k2");
}

/**
 * 测试点77：Set实例阻止扩展后添加元素是否不影响可扩展性（返回true）
 */
export function Fn77_testAddSetElementAfterPreventExtensible() {
    const testSet = new Set([1, 2]);
    Object.preventExtensions(testSet);
    testSet.add(3); // Set自身方法不受Object.preventExtensions影响
    return Object.isExtensible(testSet) === false && testSet.has(3);
}

/**
 * 测试点78：不可扩展对象的原型对象可扩展时，子对象仍不可扩展（返回true）
 */
export function Fn78_testNonExtensibleChildWithExtensibleProto() {
    const parent = { p: 1 }; // 父对象默认可扩展
    const child = Object.create(parent);
    Object.preventExtensions(child);
    return Object.isExtensible(child) === false && Object.isExtensible(parent) === true;
}

/**
 * 测试点79：不可扩展对象使用Object.getOwnPropertyDescriptors验证属性限制（返回true）
 */
export function Fn79_testGetPropDescriptorsOnNonExtensibleObj() {
    const testObj = { a: 1 };
    Object.preventExtensions(testObj);
    const descriptors = Object.getOwnPropertyDescriptors(testObj);
    // 验证自有属性存在且对象不可扩展
    return Object.isExtensible(testObj) === false && descriptors.a.value === 1;
}

/**
 * 测试点80：跨全局对象创建的对象默认是否可扩展（假设存在iframe，模拟场景返回true）
 */
export function Fn80_testCrossGlobalObjectExtensible() {
    // 模拟跨全局场景（实际需iframe，此处简化验证逻辑）
    const mockGlobalObj = { create: (obj) => obj };
    const crossObj = mockGlobalObj.create({ x: 1 });
    return Object.isExtensible(crossObj) === true;
}

/**
 * 测试点85：不可扩展对象使用Object.keys获取属性是否正常（返回true）
 */
export function Fn85_testObjectKeysOnNonExtensibleObj() {
    const testObj = { a: 1, b: 2 };
    Object.preventExtensions(testObj);
    const keys = Object.keys(testObj);
    return Object.isExtensible(testObj) === false && keys.length === 2 && keys.includes("a") && keys.includes("b");
}

/**
 * 测试点86：不可扩展对象使用Object.values获取值是否正常（返回true）
 */
export function Fn86_testObjectValuesOnNonExtensibleObj() {
    const testObj = { a: 1, b: 2 };
    Object.preventExtensions(testObj);
    const values = Object.values(testObj);
    return Object.isExtensible(testObj) === false && values.length === 2 && values.includes(1) && values.includes(2);
}

/**
 * 测试点87：不可扩展对象使用Object.entries获取键值对是否正常（返回true）
 */
export function Fn87_testObjectEntriesOnNonExtensibleObj() {
    const testObj = { a: 1, b: 2 };
    Object.preventExtensions(testObj);
    const entries = Object.entries(testObj);
    const expectedEntries = [["a", 1], ["b", 2]];
    return Object.isExtensible(testObj) === false && JSON.stringify(entries) === JSON.stringify(expectedEntries);
}

/**
 * 测试点88：不可扩展对象的原型对象阻止扩展后，子对象仍不可扩展（返回true）
 */
export function Fn88_testNonExtensibleChildWithNonExtensibleProto() {
    const parent = { p: 1 };
    Object.preventExtensions(parent);
    const child = Object.create(parent);
    Object.preventExtensions(child);
    return Object.isExtensible(child) === false && Object.isExtensible(parent) === false;
}

/**
 * 测试点91：不可扩展对象使用spread运算符复制是否不影响原对象可扩展性（返回true）
 */
export function Fn91_testSpreadNonExtensibleObj() {
    const testObj = { a: 1 };
    Object.preventExtensions(testObj);
    const copyObj = { ...testObj }; // spread复制
    return Object.isExtensible(testObj) === false && Object.isExtensible(copyObj) === true;
}

/**
 * 测试点92：不可扩展对象与可扩展对象合并（Object.assign）是否正常（返回true）
 */
export function Fn92_testAssignNonExtensibleAndExtensible() {
    const nonExtObj = { a: 1 };
    const extObj = { b: 2 };
    Object.preventExtensions(nonExtObj);
    const merged = Object.assign({}, nonExtObj, extObj);
    return Object.isExtensible(nonExtObj) === false && Object.isExtensible(merged) === true && merged.a === 1 &&
        merged.b === 2;
}

/**
 * 测试点93：不可扩展对象的hasOwnProperty方法调用是否正常（返回true）
 */
export function Fn93_testHasOwnPropertyOnNonExtensibleObj() {
    const testObj = { a: 1 };
    Object.preventExtensions(testObj);
    return Object.isExtensible(testObj) === false && testObj.hasOwnProperty("a") === true &&
        testObj.hasOwnProperty("b") === false;
}

/**
 * 测试点94：不可扩展对象的isPrototypeOf方法调用是否正常（返回true）
 */
export function Fn94_testIsPrototypeOfOnNonExtensibleObj() {
    const parent = { p: 1 };
    const child = Object.create(parent);
    Object.preventExtensions(parent);
    return Object.isExtensible(parent) === false && parent.isPrototypeOf(child) === true;
}

/**
 * 测试点95：不可扩展对象使用for...in循环遍历是否正常（返回true）
 */
export function Fn95_testForInLoopOnNonExtensibleObj() {
    const testObj = { a: 1, b: 2 };
    Object.preventExtensions(testObj);
    const keys = [];
    for (const key in testObj) {
        keys.push(key);
    }
    return Object.isExtensible(testObj) === false && keys.length === 2 && keys.includes("a") && keys.includes("b");
}

/**
 * 测试点96：不可扩展对象使用Object.getPrototypeOf获取原型是否正常（返回true）
 */
export function Fn96_testGetPrototypeOfOnNonExtensibleObj() {
    const parent = { p: 1 };
    const child = Object.create(parent);
    Object.preventExtensions(child);
    const proto = Object.getPrototypeOf(child);
    return Object.isExtensible(child) === false && proto === parent;
}

/**
 * 测试点97：不可扩展对象使用Object.setPrototypeOf修改原型是否允许（非严格模式，返回true）
 */
export function Fn97_testSetPrototypeOfOnNonExtensibleObj() {
    const testObj = { a: 1 };
    const newProto = { p: 100 };
    Object.preventExtensions(testObj);
    Object.setPrototypeOf(testObj, newProto); // 非严格模式允许修改
    return Object.isExtensible(testObj) === false && Object.getPrototypeOf(testObj) === newProto;
}

/**
 * 测试点98：不可扩展对象的toString方法调用是否正常（返回true）
 */
export function Fn98_testToStringOnNonExtensibleObj() {
    const testObj = { a: 1 };
    Object.preventExtensions(testObj);
    const str = testObj.toString();
    return Object.isExtensible(testObj) === false && str === "[object Object]";
}

/**
 * 测试点99：不可扩展对象的valueOf方法调用是否正常（返回true）
 */
export function Fn99_testValueOfOnNonExtensibleObj() {
    const testObj = { a: 1 };
    Object.preventExtensions(testObj);
    const value = testObj.valueOf();
    return Object.isExtensible(testObj) === false && value === testObj;
}

/**
 * 测试点100：不可扩展对象多次调用Object.preventExtensions是否不影响结果（返回true）
 */
export function Fn100_testMultiplePreventExtensionsOnObj() {
    const testObj = { a: 1 };
    Object.preventExtensions(testObj);
    const firstResult = Object.isExtensible(testObj);
    Object.preventExtensions(testObj); // 再次调用阻止扩展
    const secondResult = Object.isExtensible(testObj);
    return firstResult === false && secondResult === false;
}

/**
 * 测试点103：默认ImageData实例是否可扩展（预期可扩展，返回true）
 */
export function Fn103_testDefaultImageDataExtensible() {
    const imageData = new ImageData(100, 50);
    return Object.isExtensible(imageData) === true;
}

/**
 * 测试点104：阻止扩展后的ImageData实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn104_testPreventedImageDataExtensible() {
    const imageData = new ImageData(100, 50);
    Object.preventExtensions(imageData);
    return Object.isExtensible(imageData) === false;
}

/**
 * 测试点105：不可扩展对象使用Object.hasOwn检测属性是否正常（返回true）
 */
export function Fn105_testObjectHasOwnOnNonExtensibleObj() {
    const testObj = { name: "test" };
    Object.preventExtensions(testObj);
    return Object.isExtensible(testObj) === false && Object.hasOwn(testObj, "name") && !Object.hasOwn(testObj, "age");
}

/**
 * 测试点106：默认OffscreenCanvas实例是否可扩展（预期可扩展，返回true）
 */
export function Fn106_testDefaultOffscreenCanvasExtensible() {
    const offscreenCanvas = new OffscreenCanvas(200, 150);
    return Object.isExtensible(offscreenCanvas) === true;
}

/**
 * 测试点107：阻止扩展后的OffscreenCanvas实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn107_testPreventedOffscreenCanvasExtensible() {
    const offscreenCanvas = new OffscreenCanvas(200, 150);
    Object.preventExtensions(offscreenCanvas);
    return Object.isExtensible(offscreenCanvas) === false;
}

/**
 * 测试点108：不可扩展对象添加可枚举属性是否失败（返回true）
 */
export function Fn108_testAddEnumerablePropToNonExtensibleObj() {
    const testObj = { id: 123 };
    Object.preventExtensions(testObj);
    let addSuccess = true;
    try {
        Object.defineProperty(testObj, "newProp", { value: "test", enumerable: true });
    } catch (e) {
        addSuccess = false;
    }
    return Object.isExtensible(testObj) === false && !addSuccess;
}

/**
 * 测试点111：不可扩展对象的属性特性修改（如configurable）是否允许（返回true）
 */
export function Fn111_testModifyPropConfigOnNonExtensibleObj() {
    const testObj = { value: "demo" };
    Object.defineProperty(testObj, "value", { configurable: true });
    Object.preventExtensions(testObj);
    Object.defineProperty(testObj, "value", { configurable: false }); // 修改特性
    return Object.isExtensible(testObj) === false &&
        Object.getOwnPropertyDescriptor(testObj, "value").configurable === false;
}

/**
 * 测试点114：不可扩展对象使用JSON.stringify序列化是否正常（返回true）
 */
export function Fn114_testJsonStringifyNonExtensibleObj() {
    const testObj = { a: 1, b: "2" };
    Object.preventExtensions(testObj);
    const jsonStr = JSON.stringify(testObj);
    return Object.isExtensible(testObj) === false && jsonStr === '{"a":1,"b":"2"}';
}

/**
 * 测试点117：不可扩展对象继承的原型方法调用是否正常（返回true）
 */
export function Fn117_testCallInheritedMethodOnNonExtensibleObj() {
    class Parent {
        getMessage() {
            return "hello";
        }
    }

    class Child extends Parent {
        constructor() {
            super();
            this.id = 1;
        }
    }

    const childInstance = new Child();
    Object.preventExtensions(childInstance);
    return Object.isExtensible(childInstance) === false && childInstance.getMessage() === "hello";
}

/**
 * 测试点120：不可扩展对象作为函数参数传递时可扩展性是否不变（返回true）
 */
export function Fn120_testNonExtensibleObjAsFuncParam() {
    const testObj = { data: "param" };
    Object.preventExtensions(testObj);

    function checkExtensibility(obj) {
        return Object.isExtensible(obj);
    }

    return Object.isExtensible(testObj) === false && !checkExtensibility(testObj);
}

/**
 * 测试点123：不可扩展对象使用Object.getOwnPropertyNames获取属性是否正常（返回true）
 */
export function Fn123_testGetOwnPropertyNamesOnNonExtensibleObj() {
    const testObj = { x: 10, y: 20 };
    Object.preventExtensions(testObj);
    const propNames = Object.getOwnPropertyNames(testObj);
    return Object.isExtensible(testObj) === false && propNames.length === 2 && propNames.includes("x") &&
    propNames.includes("y");
}

/**
 * 测试点126：不可扩展对象添加不可枚举属性是否失败（返回true）
 */
export function Fn126_testAddNonEnumerablePropToNonExtensibleObj() {
    const testObj = { base: "val" };
    Object.preventExtensions(testObj);
    let addSuccess = true;
    try {
        Object.defineProperty(testObj, "hiddenProp", { value: "hide", enumerable: false });
    } catch (e) {
        addSuccess = false;
    }
    return Object.isExtensible(testObj) === false && !addSuccess;
}

/**
 * 测试点132：不可扩展对象使用Object.isFrozen检测是否为冻结（返回true，非冻结）
 */
export function Fn132_testIsFrozenOnNonExtensibleObj() {
    const testObj = { prop: "test" };
    Object.preventExtensions(testObj); // 仅阻止扩展，未冻结
    return Object.isExtensible(testObj) === false && Object.isFrozen(testObj) === false;
}


/**
 * 测试点135：不可扩展对象使用Object.isSealed检测是否为密封（返回true，非密封）
 */
export function Fn135_testIsSealedOnNonExtensibleObj() {
    const testObj = { data: "demo" };
    Object.preventExtensions(testObj); // 仅阻止扩展，未密封
    return Object.isExtensible(testObj) === false && Object.isSealed(testObj) === false;
}


/**
 * 测试点138：不可扩展对象作为Map键值时可扩展性是否不变（返回true）
 */
export function Fn138_testNonExtensibleObjAsMapKey() {
    const testObj = { key: "val" };
    Object.preventExtensions(testObj);
    const map = new Map();
    map.set(testObj, "data");
    const storedObj = Array.from(map.keys())[0]; // 获取存储的对象
    return Object.isExtensible(storedObj) === false && map.get(storedObj) === "data";
}


/**
 * 测试点143：不可扩展对象使用Object.getOwnPropertySymbols获取Symbol属性是否正常（返回true）
 */
export function Fn143_testGetOwnPropertySymbolsOnNonExtensibleObj() {
    const sym = Symbol("testSym");
    const testObj = { [sym]: "symVal", normal: "val" };
    Object.preventExtensions(testObj);
    const symbols = Object.getOwnPropertySymbols(testObj);
    return Object.isExtensible(testObj) === false && symbols.length === 1 && symbols[0] === sym;
}

/**
 * 测试点146：不可扩展对象添加getter属性是否失败（返回true）
 */
export function Fn146_testAddGetterToNonExtensibleObj() {
    const testObj = { base: 10 };
    Object.preventExtensions(testObj);
    let addSuccess = true;
    try {
        Object.defineProperty(testObj, "double", { get() { return this.base * 2; } });
    } catch (e) {
        addSuccess = false;
    }
    return Object.isExtensible(testObj) === false && !addSuccess;
}

/**
 * 测试点147：默认ShareDataContainer实例（Shared Workers）是否可扩展（预期可扩展，返回true）
 */
export function Fn147_testDefaultShareDataContainerExtensible() {
    // 模拟ShareDataContainer（实际需SharedWorker环境，此处简化）
    const mockContainer = { set: () => {}, get: () => {} };
    return Object.isExtensible(mockContainer) === true;
}

/**
 * 测试点148：阻止扩展后的ShareDataContainer实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn148_testPreventedShareDataContainerExtensible() {
    const mockContainer = { set: () => {}, get: () => {} };
    Object.preventExtensions(mockContainer);
    return Object.isExtensible(mockContainer) === false;
}

/**
 * 测试点149：不可扩展对象作为Set元素时可扩展性是否不变（返回true）
 */
export function Fn149_testNonExtensibleObjAsSetElement() {
    const testObj = { elem: "data" };
    Object.preventExtensions(testObj);
    const set = new Set();
    set.add(testObj);
    const storedObj = Array.from(set)[0];
    return Object.isExtensible(storedObj) === false && set.has(storedObj);
}

/**
 * 测试点152：不可扩展对象使用Reflect.isExtensible检测是否与Object.isExtensible一致（返回true）
 */
export function Fn152_testReflectIsExtensibleOnNonExtensibleObj() {
    const testObj = { prop: "sync" };
    Object.preventExtensions(testObj);
    const objResult = Object.isExtensible(testObj);
    const reflectResult = Reflect.isExtensible(testObj);
    return objResult === false && reflectResult === false && objResult === reflectResult;
}

/**
 * 测试点155：不可扩展对象的属性删除后可扩展性是否不变（返回true）
 */
export function Fn155_testDeletePropOnNonExtensibleObj() {
    const testObj = { a: 1, b: 2 };
    Object.preventExtensions(testObj);
    delete testObj.a; // 允许删除已有属性
    return Object.isExtensible(testObj) === false && !("a" in testObj) && "b" in testObj;
}

/**
 * 测试点156：默认GeolocationPosition实例是否可扩展（预期可扩展，返回true）
 */
export function Fn156_testDefaultGeolocationPositionExtensible() {
    // 模拟GeolocationPosition（实际需调用getCurrentPosition，此处简化）
    const mockPosition = {
        coords: { latitude: 30, longitude: 120 },
        timestamp: Date.now()
    };
    return Object.isExtensible(mockPosition) === true;
}

/**
 * 测试点157：阻止扩展后的GeolocationPosition实例是否不可扩展（预期不可扩展，返回true）
 */
export function Fn157_testPreventedGeolocationPositionExtensible() {
    const mockPosition = {
        coords: { latitude: 30, longitude: 120 },
        timestamp: Date.now()
    };
    Object.preventExtensions(mockPosition);
    return Object.isExtensible(mockPosition) === false;
}

/**
 * 测试点158：不可扩展对象嵌套属性修改是否允许（返回true）
 */
export function Fn158_testModifyNestedPropOnNonExtensibleObj() {
    const testObj = { nested: { x: 10 } };
    Object.preventExtensions(testObj);
    testObj.nested.x = 20; // 允许修改嵌套对象的属性（嵌套对象未阻止扩展）
    return Object.isExtensible(testObj) === false && testObj.nested.x === 20;
}

/**
 * 测试点163：不可扩展对象使用Object.assign复制自身属性是否正常（返回true）
 */
export function Fn163_testAssignSelfPropOnNonExtensibleObj() {
    const testObj = { a: 1, b: 2 };
    Object.preventExtensions(testObj);
    Object.assign(testObj, { a: 10 }); // 覆盖已有属性，非添加新属性
    return Object.isExtensible(testObj) === false && testObj.a === 10 && testObj.b === 2;
}

/**
 * 测试点166：不可扩展对象添加setter属性是否失败（返回true）
 */
export function Fn166_testAddSetterToNonExtensibleObj() {
    const testObj = { count: 0 };
    Object.preventExtensions(testObj);
    let addSuccess = true;
    try {
        Object.defineProperty(testObj, "increment", {
            set(val) { this.count += val; }
        });
    } catch (e) {
        addSuccess = false;
    }
    return Object.isExtensible(testObj) === false && !addSuccess;
}

/**
 * 测试点169：不可扩展对象作为WeakMap键时可扩展性是否不变（返回true）
 */
export function Fn169_testNonExtensibleObjAsWeakMapKey() {
    const testObj = { key: "weak-key" };
    Object.preventExtensions(testObj);
    const weakMap = new WeakMap();
    weakMap.set(testObj, "weak-value");
    return Object.isExtensible(testObj) === false && weakMap.has(testObj);
}

/**
 * 测试点172：不可扩展对象使用Reflect.preventExtensions后可扩展性是否不变（返回true）
 */
export function Fn172_testReflectPreventExtensionsOnNonExtensibleObj() {
    const testObj = { prop: "reflect-test" };
    Object.preventExtensions(testObj);
    const firstResult = Object.isExtensible(testObj);
    Reflect.preventExtensions(testObj); // 再次调用Reflect阻止扩展
    const secondResult = Object.isExtensible(testObj);
    return firstResult === false && secondResult === false;
}

/**
 * 测试点175：不可扩展对象的原型链上添加属性是否不影响自身可扩展性（返回true）
 */
export function Fn175_testAddPropToProtoChainOfNonExtensibleObj() {
    const parent = { p: 1 };
    const child = Object.create(parent);
    Object.preventExtensions(child);
    parent.newProp = 2; // 给原型添加属性
    return Object.isExtensible(child) === false && child.newProp === 2;
}
