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

// Fn01：测试基本属性复制（目标对象接收源对象的非同名属性）
export function Fn01_testBasicPropertyCopy() {
    const target = { a: 1 };
    const source = { b: 2, c: 3 };
    Object.assign(target, source);
    const isPassed = target.a === 1 && target.b === 2 && target.c === 3;
    console.log("Fn01（基本属性复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn02：测试同名属性覆盖（后续源对象覆盖前序源对象及目标对象同名属性）
export function Fn02_testSamePropertyOverride() {
    const target = { x: 10, y: 20 };
    const source1 = { y: 200, z: 300 };
    const source2 = { z: 3000 };
    Object.assign(target, source1, source2);
    const isPassed = target.x === 10 && target.y === 200 && target.z === 3000;
    console.log("Fn02（同名属性覆盖）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn03：测试Symbol类型属性可复制（Symbol类型的自有属性能被正确拷贝）
export function Fn03_testSymbolPropertyCopy() {
    const symKey = Symbol("testSymbol");
    const target = {};
    const source = { [symKey]: "symbolValue" };
    Object.assign(target, source);
    const isPassed = target[symKey] === "symbolValue";
    console.log("Fn03（Symbol属性复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn04：测试深拷贝失效（仅复制嵌套对象引用，源对象修改同步影响目标对象）
export function Fn04_testDeepCopyFailure() {
    const target = { nested: { d: 4 } };
    const source = { nested: { e: 5 } };
    Object.assign(target, source);
    source.nested.e = 500; // 修改源对象嵌套属性
    const isPassed = target.nested.e === 500; // 验证目标对象同步变化（浅拷贝特性）
    console.log("Fn04（深拷贝失效）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn05：测试忽略null/undefined源对象（传入null/undefined不报错且不影响正常复制）
export function Fn05_testIgnoreNullUndefinedSource() {
    const target = { f: 6 };
    try {
        Object.assign(target, null, undefined, { g: 7 });
        const isPassed = target.f === 6 && target.g === 7;
        console.log("Fn05（忽略null/undefined）：", isPassed ? "通过" : "失败");
        return isPassed;
    } catch (error) {
        console.log("Fn05（忽略null/undefined）：失败（意外抛出异常）");
        return false;
    }
}

// Fn06：测试多个源对象按顺序复制（属性按源对象传入顺序依次覆盖）
export function Fn06_testMultiSourceOrder() {
    const target = { a: 0 };
    const source1 = { a: 1, b: 2 };
    const source2 = { b: 3, c: 4 };
    const source3 = { c: 5 };
    Object.assign(target, source1, source2, source3);
    const isPassed = target.a === 1 && target.b === 3 && target.c === 5;
    console.log("Fn06（多源对象顺序复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn07：测试目标对象为非空对象时保留原有非同名属性
export function Fn07_testPreserveTargetNonOverlapProps() {
    const target = { name: "test", age: 20 };
    const source = { gender: "male", age: 25 };
    Object.assign(target, source);
    const isPassed = target.name === "test" && target.age === 25 && target.gender === "male";
    console.log("Fn07（保留目标非同名属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn08：测试源对象为数组时按索引复制（数组视为键为索引的对象）
export function Fn08_testArrayAsSource() {
    const target = { 0: "init" };
    const source = [10, 20, 30]; // 等价于 {0:10, 1:20, 2:30}
    Object.assign(target, source);
    const isPassed = target[0] === 10 && target[1] === 20 && target[2] === 30;
    console.log("Fn08（数组作为源对象）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn09：测试目标对象为数组时接收源对象属性（数组可作为目标对象）
export function Fn09_testArrayAsTarget() {
    const target = [1, 2, 3];
    const source = { 1: 20, 3: 40 };
    Object.assign(target, source);
    const isPassed = target[0] === 1 && target[1] === 20 && target[2] === 3 && target[3] === 40;
    console.log("Fn09（数组作为目标对象）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn10：测试源对象含不可枚举属性时不复制（仅复制可枚举属性）
export function Fn10_testIgnoreNonEnumerableProps() {
    const target = {};
    const source = {};
    Object.defineProperty(source, "nonEnum", {
        value: "hidden",
        enumerable: false // 设为不可枚举
    });
    source.enumProp = "visible"; // 可枚举属性
    Object.assign(target, source);
    const isPassed = target.enumProp === "visible" && target.hasOwnProperty("nonEnum") === false;
    console.log("Fn10（忽略不可枚举属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn11：测试源对象为字符串时按索引复制（字符串视为键为索引的对象）
export function Fn11_testStringAsSource() {
    const target = {};
    const source = "abc"; // 等价于 {0:'a', 1:'b', 2:'c'}
    Object.assign(target, source);
    const isPassed = target[0] === "a" && target[1] === "b" && target[2] === "c";
    console.log("Fn11（字符串作为源对象）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn12：测试源对象为数字时无属性复制（数字包装对象无可枚举属性）
export function Fn12_testNumberAsSource() {
    const target = {};
    const source = 123; // 数字包装对象无自身可枚举属性
    Object.assign(target, source);
    const isPassed = Object.keys(target).length === 0;
    console.log("Fn12（数字作为源对象）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn13：测试源对象为布尔值时无属性复制（布尔包装对象无可枚举属性）
export function Fn13_testBooleanAsSource() {
    const target = {};
    const source = true; // 布尔包装对象无自身可枚举属性
    Object.assign(target, source);
    const isPassed = Object.keys(target).length === 0;
    console.log("Fn13（布尔值作为源对象）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn14：测试复制原型链上的属性（仅复制自身属性，忽略原型链属性）
export function Fn14_testIgnorePrototypeProps() {
    const proto = { protoProp: "fromProto" };
    const source = Object.create(proto); // 源对象原型为 proto
    source.ownProp = "fromOwn"; // 自身属性
    const target = {};
    Object.assign(target, source);
    const isPassed = target.ownProp === "fromOwn" && target.protoProp === undefined;
    console.log("Fn14（忽略原型链属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn15：测试目标对象为null/undefined时抛出TypeError
export function Fn15_testTargetNullUndefinedThrow() {
    let isPassed = false;
    try {
        Object.assign(null, { a: 1 }); // 目标为null
    } catch (error) {
        isPassed = error instanceof TypeError;
    }
    try {
        Object.assign(undefined, { a: 1 }); // 目标为undefined
    } catch (error) {
        isPassed = isPassed && (error instanceof TypeError);
    }
    console.log("Fn15（目标为null/undefined抛错）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn16：测试源对象含getter时复制其返回值（执行getter并复制结果）
export function Fn16_testCopyGetterValue() {
    const target = {};
    const source = {
        get foo() {
            return "getterValue";
        }
    };
    Object.assign(target, source);
    const isPassed = target.foo === "getterValue";
    console.log("Fn16（复制getter返回值）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn17：测试源对象含setter时仅复制属性名（setter不被复制，仅生成普通属性）
export function Fn17_testIgnoreSetterWhenCopy() {
    const target = {};
    const source = {
        set bar(value) {
            this._bar = value;
        }
    };
    Object.assign(target, source);
    // 验证目标对象无setter，仅存在属性名（值为undefined）
    const isPassed = target.hasOwnProperty("bar") && typeof Object.getOwnPropertyDescriptor(target, "bar").set === "undefined";
    console.log("Fn17（复制时忽略setter）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn18：测试复制Date对象的可枚举属性（Date对象自身可枚举属性可被复制）
export function Fn18_testCopyDateProps() {
    const target = {};
    const date = new Date();
    date.customProp = "dateCustom"; // 给Date对象添加自定义可枚举属性
    Object.assign(target, date);
    const isPassed = target.customProp === "dateCustom";
    console.log("Fn18（复制Date对象自定义属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn19：测试复制RegExp对象的可枚举属性（RegExp自身可枚举属性可被复制）
export function Fn19_testCopyRegExpProps() {
    const target = {};
    const reg = /test/;
    reg.flagDesc = "global"; // 给RegExp添加自定义可枚举属性
    Object.assign(target, reg);
    const isPassed = target.flagDesc === "global";
    console.log("Fn19（复制RegExp对象自定义属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn20：测试源对象为空对象时不修改目标（源为空则目标保持原样）
export function Fn20_testSourceEmptyObject() {
    const target = { a: 100, b: 200 };
    const source = {}; // 空源对象
    Object.assign(target, source);
    const isPassed = target.a === 100 && target.b === 200;
    console.log("Fn20（源为空对象不修改目标）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn21：测试多个源对象含相同Symbol属性时按顺序覆盖
export function Fn21_testMultiSourceSymbolOverride() {
    const sym1 = Symbol("key1");
    const sym2 = Symbol("key2");
    const target = {};
    const source1 = { [sym1]: "v1", [sym2]: "v2" };
    const source2 = { [sym2]: "v2_updated" };
    Object.assign(target, source1, source2);
    const isPassed = target[sym1] === "v1" && target[sym2] === "v2_updated";
    console.log("Fn21（多源Symbol属性覆盖）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn22：测试复制后目标对象与源对象引用类型属性指向同一地址（浅拷贝验证）
export function Fn22_testShallowCopyReference() {
    const sourceObj = { nested: { x: 1 } };
    const target = Object.assign({}, sourceObj);
    sourceObj.nested.x = 100; // 修改源对象嵌套属性
    const isPassed = target.nested.x === 100; // 目标嵌套属性同步变化
    console.log("Fn22（浅拷贝引用类型属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn23：测试仅传入目标对象时返回目标对象本身
export function Fn23_testOnlyTargetReturnSelf() {
    const target = { a: 1 };
    const result = Object.assign(target);
    const isPassed = result === target; // 结果与目标对象是同一引用
    console.log("Fn23（仅传目标返回自身）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn24：测试源对象为函数时复制其可枚举属性（函数作为对象的可枚举属性可复制）
export function Fn24_testCopyFunctionProps() {
    const target = {};
    const func = () => {};
    func.funcProp = "functionCustom"; // 给函数添加可枚举属性
    Object.assign(target, func);
    const isPassed = target.funcProp === "functionCustom";
    console.log("Fn24（复制函数对象自定义属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn25：测试复制BigInt类型属性（BigInt值可正常复制）
export function Fn25_testCopyBigIntProp() {
    const target = {};
    const source = { bigNum: 9007199254740991n, normalNum: 123 };
    Object.assign(target, source);
    const isPassed = target.bigNum === 9007199254740991n && target.normalNum === 123;
    console.log("Fn25（复制BigInt类型属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn26：测试复制undefined值的属性（源对象中值为undefined的属性会被复制）
export function Fn26_testCopyUndefinedValueProp() {
    const target = {};
    const source = { a: undefined, b: null, c: "valid" };
    Object.assign(target, source);
    const isPassed = target.a === undefined && target.b === null && target.c === "valid";
    console.log("Fn26（复制undefined值属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn27：测试源对象为NaN时无属性复制（NaN包装对象无自身可枚举属性）
export function Fn27_testNaNAsSource() {
    const target = {};
    const source = NaN; // NaN包装对象无自身可枚举属性
    Object.assign(target, source);
    const isPassed = Object.keys(target).length === 0;
    console.log("Fn27（NaN作为源对象）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn28：测试复制后目标对象属性的可枚举性（复制的属性保持源对象的可枚举性）
export function Fn28_testPreserveEnumerableFlag() {
    const target = {};
    const source = {};
    // 给源对象添加可枚举属性
    Object.defineProperty(source, "enumProp", { value: "enum", enumerable: true });
    // 给源对象添加不可枚举属性（已在Fn10验证不复制，此处仅验证可枚举属性的flag）
    source.normalProp = "normal"; // 默认可枚举
    Object.assign(target, source);
    const enumPropDesc = Object.getOwnPropertyDescriptor(target, "enumProp");
    const normalPropDesc = Object.getOwnPropertyDescriptor(target, "normalProp");
    const isPassed = enumPropDesc.enumerable && normalPropDesc.enumerable;
    console.log("Fn28（保留属性可枚举性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn29：测试源对象含循环引用时正常复制（循环引用不影响属性复制，仅复制引用）
export function Fn29_testCopyCircularReference() {
    const target = {};
    const source = { a: 1 };
    source.self = source; // 源对象循环引用自身
    Object.assign(target, source);
    const isPassed = target.a === 1 && target.self === source; // 复制的是引用
    console.log("Fn29（复制循环引用属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn30：测试批量复制多个源对象的不同类型属性（综合验证多类型属性复制）
export function Fn30_testMultiTypePropsCopy() {
    const sym = Symbol("multiType");
    const target = { base: "baseVal" };
    const source1 = { num: 123, str: "test", bool: true };
    const source2 = { symKey: sym, nested: { x: 1 } };
    const source3 = { bool: false, nested: { y: 2 } };
    Object.assign(target, source1, source2, source3);
    const isPassed =
        target.base === "baseVal" &&
            target.num === 123 &&
            target.str === "test" &&
            target.bool === false &&
            target.symKey === sym &&
            target.nested.y === 2; // 嵌套对象覆盖且浅拷贝
    console.log("Fn30（多类型属性综合复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}
// Fn31：测试源对象为null时后续源对象仍正常复制（仅忽略null，不阻断后续操作）
export function Fn31_testNullSourceThenValidSource() {
    const target = { a: 1 };
    const source1 = null;
    const source2 = { b: 2, a: 100 };
    Object.assign(target, source1, source2);
    const isPassed = target.a === 100 && target.b === 2;
    console.log("Fn31（null源后接有效源正常复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn32：测试源对象为undefined时后续源对象仍正常复制（仅忽略undefined，不阻断后续操作）
export function Fn32_testUndefinedSourceThenValidSource() {
    const target = { x: 5 };
    const source1 = undefined;
    const source2 = { y: 6, x: 500 };
    Object.assign(target, source1, source2);
    const isPassed = target.x === 500 && target.y === 6;
    console.log("Fn32（undefined源后接有效源正常复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn33：测试复制Symbol属性到数组目标对象（数组作为目标可接收Symbol属性）
export function Fn33_testCopySymbolToArrTarget() {
    const sym = Symbol("arrSym");
    const target = [1, 2];
    const source = { [sym]: "symVal", 1: 200 };
    Object.assign(target, source);
    const isPassed = target[1] === 200 && target[sym] === "symVal";
    console.log("Fn33（Symbol属性复制到数组目标）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn34：测试源对象为数组时不复制数组原型方法（仅复制自身索引属性，忽略原型方法）
export function Fn34_testArraySourceIgnoreProtoMethods() {
    const target = {};
    const source = [10, 20];
    // 尝试复制数组原型方法（实际为原型属性，不应被复制）
    Object.assign(target, source);
    const isPassed = target[0] === 10 && target.push === undefined;
    console.log("Fn34（数组源忽略原型方法）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn35：测试目标对象为冻结对象时复制抛出TypeError（冻结对象不可修改）
export function Fn35_testFrozenTargetThrowError() {
    const frozenTarget = Object.freeze({ a: 1 }); // 冻结目标对象
    const source = { b: 2, a: 100 };
    let isPassed = false;
    try {
        Object.assign(frozenTarget, source);
    } catch (error) {
        isPassed = error instanceof TypeError;
    }
    console.log("Fn35（冻结目标复制抛错）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn36：测试源对象含可枚举的原型属性时仍不复制（仅复制自身属性，无论原型属性是否可枚举）
export function Fn36_testIgnoreEnumerableProtoProps() {
    const proto = { protoEnumProp: "enumFromProto" };
    Object.defineProperty(proto, "protoEnumProp", { enumerable: true }); // 原型属性设为可枚举
    const source = Object.create(proto);
    source.ownProp = "ownVal";
    const target = {};
    Object.assign(target, source);
    const isPassed = target.ownProp === "ownVal" && target.protoEnumProp === undefined;
    console.log("Fn36（忽略可枚举原型属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn37：测试复制后目标对象属性的可写性（默认复制的属性为可写）
export  function Fn37_testCopiedPropWritable() {
    const target = {};
    const source = { a: 10 };
    Object.assign(target, source);
    const propDesc = Object.getOwnPropertyDescriptor(target, "a");
    const isPassed = propDesc.writable === true;
    console.log("Fn37（复制属性默认可写）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn38：测试源对象属性为只读时复制后目标属性仍可写（源只读不影响目标属性可写性）
export function Fn38_testCopyReadonlySourceProp() {
    const source = {};
    Object.defineProperty(source, "readOnlyProp", { value: 100, writable: false }); // 源属性只读
    const target = {};
    Object.assign(target, source);

    // 尝试修改目标属性，验证可写性
    target.readOnlyProp = 200;
    const isPassed = target.readOnlyProp === 200;
    console.log("Fn38（源只读属性复制后目标可写）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn41：测试复制空字符串作为源对象（空字符串无索引属性，不修改目标）
export function Fn41_testEmptyStringAsSource() {
    const target = { a: 1 };
    const source = ""; // 空字符串，无0、1等索引属性
    Object.assign(target, source);
    const isPassed = target.a === 1 && Object.keys(target).length === 1;
    console.log("Fn41（空字符串源不修改目标）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn42：测试源对象为Infinity时无属性复制（Infinity包装对象无自身可枚举属性）
export function Fn42_testInfinityAsSource() {
    const target = {};
    const source = Infinity;
    Object.assign(target, source);
    const isPassed = Object.keys(target).length === 0;
    console.log("Fn42（Infinity作为源对象）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn43：测试多源对象中含空对象时不影响其他源复制（空源对象仅自身无作用，不阻断后续）
export function Fn43_testMultiSourceWithEmptyObject() {
    const target = { x: 0 };
    const source1 = { x: 10 };
    const source2 = {}; // 空源对象
    const source3 = { y: 20 };
    Object.assign(target, source1, source2, source3);
    const isPassed = target.x === 10 && target.y === 20;
    console.log("Fn43（多源含空对象不影响复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn44：测试复制后目标对象与源对象的非引用类型属性值完全独立（基本类型值复制而非引用）
export function Fn44_testPrimitiveValueIndependence() {
    const source = { num: 10, str: "test", bool: true };
    const target = Object.assign({}, source);

    // 修改源对象基本类型属性，验证目标不受影响
    source.num = 20;
    source.str = "newTest";
    source.bool = false;
    const isPassed = target.num === 10 && target.str === "test" && target.bool === true;
    console.log("Fn44（基本类型属性复制后独立）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn45：测试源对象含嵌套数组时仅复制引用（浅拷贝，源数组修改影响目标）
export function Fn45_testShallowCopyNestedArray() {
    const source = { nestedArr: [1, 2, 3] };
    const target = Object.assign({}, source);

    // 修改源对象嵌套数组
    source.nestedArr.push(4);
    const isPassed = target.nestedArr.length === 4 && target.nestedArr[3] === 4;
    console.log("Fn45（浅拷贝嵌套数组）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn46：测试目标对象为类实例时正常复制属性（类实例作为目标可接收源属性）
export function Fn46_testClassInstanceAsTarget() {
    class TestClass {
        constructor() {
            this.instanceProp = "init";
        }
    }
    const target = new TestClass();
    const source = { newProp: "added", instanceProp: "updated" };
    Object.assign(target, source);
    const isPassed = target.instanceProp === "updated" && target.newProp === "added";
    console.log("Fn46（类实例作为目标复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn47：测试源对象为类实例时仅复制自身可枚举属性（不复制类原型方法）
export function Fn47_testClassInstanceAsSource() {
    class TestClass {
        constructor() {
            this.ownProp = "ownVal"; // 自身属性
        }
        protoMethod() {} // 原型方法
    }
    const source = new TestClass();
    const target = {};
    Object.assign(target, source);
    const isPassed = target.ownProp === "ownVal" && target.protoMethod === undefined;
    console.log("Fn47（类实例作为源仅复制自身属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn48：测试复制属性名为空字符串的属性（空字符串作为键名可正常复制）
export function Fn48_testCopyEmptyStringKey() {
    const target = {};
    const source = { "": "emptyKeyVal", normalKey: "normalVal" };
    Object.assign(target, source);
    const isPassed = target[""] === "emptyKeyVal" && target.normalKey === "normalVal";
    console.log("Fn48（复制空字符串键名属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn49：测试源对象含Symbol属性且目标对象已有同名Symbol属性时覆盖
export function Fn49_testSymbolPropOverrideInTarget() {
    const sym = Symbol("overrideSym");
    const target = { [sym]: "oldVal", a: 1 };
    const source = { [sym]: "newVal", b: 2 };
    Object.assign(target, source);
    const isPassed = target[sym] === "newVal" && target.a === 1 && target.b === 2;
    console.log("Fn49（Symbol属性覆盖目标原有值）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn50：测试仅传入目标对象且目标为数组时返回数组本身（数组目标单独传入时返回自身）
export function Fn50_testOnlyArrayTargetReturnSelf() {
    const targetArr = [10, 20, 30];
    const result = Object.assign(targetArr);
    const isPassed = result === targetArr && result[1] === 20;
    console.log("Fn50（仅传数组目标返回自身）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn54：测试源对象属性为Symbol且值为引用类型时仅复制引用（浅拷贝特性）
export function Fn54_testSymbolPropShallowCopy() {
    const sym = Symbol("refSym");
    const refObj = { x: 1 };
    const source = { [sym]: refObj };
    const target = {};
    Object.assign(target, source);

    refObj.x = 100; // 修改引用对象
    const isPassed = target[sym].x === 100;
    console.log("Fn54（Symbol属性值为引用类型浅拷贝）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn55：测试复制后目标对象属性的可配置性（默认复制的属性为可配置）
export function Fn55_testCopiedPropConfigurable() {
    const target = {};
    const source = { a: 10 };
    Object.assign(target, source);
    const propDesc = Object.getOwnPropertyDescriptor(target, "a");
    const isPassed = propDesc.configurable === true;
    console.log("Fn55（复制属性默认可配置）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn56：测试源对象属性为不可配置时复制后目标属性仍可配置（源不可配置不影响目标）
export function Fn56_testCopyNonConfigurableSourceProp() {
    const source = {};
    Object.defineProperty(source, "nonConfigProp", {
        value: 100,
        configurable: false
    }); // 源属性不可配置
    const target = {};
    Object.assign(target, source);

    // 尝试删除目标属性（可配置则能删除）
    delete target.nonConfigProp;
    const isPassed = target.nonConfigProp === undefined;
    console.log("Fn56（源不可配置属性复制后目标可配置）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn57：测试源对象为字符串且含特殊字符时按索引正常复制
export function Fn57_testSpecialCharStringAsSource() {
    const target = {};
    const source = "!@#$%"; // 含特殊字符的字符串
    Object.assign(target, source);
    const isPassed = target[0] === "!" && target[2] === "#" && target[4] === "%";
    console.log("Fn57（特殊字符字符串源正常复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn58：测试多源对象中含相同数字索引属性时按顺序覆盖（数组源与对象源索引冲突）
export function Fn58_testMultiSourceNumIndexOverride() {
    const target = {};
    const source1 = [10, 20]; // 索引0:10, 1:20
    const source2 = { 1: 200, 2: 300 };
    Object.assign(target, source1, source2);
    const isPassed = target[0] === 10 && target[1] === 200 && target[2] === 300;
    console.log("Fn58（多源数字索引属性覆盖）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn59：测试目标对象为null时单独传入仍抛出TypeError（无有效源也抛错）
export function Fn59_testOnlyNullTargetThrow() {
    let isPassed = false;
    try {
        Object.assign(null); // 仅传入null作为目标
    } catch (error) {
        isPassed = error instanceof TypeError;
    }
    console.log("Fn59（仅传null目标抛错）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn60：测试目标对象为undefined时单独传入仍抛出TypeError（无有效源也抛错）
export function Fn60_testOnlyUndefinedTargetThrow() {
    let isPassed = false;
    try {
        Object.assign(undefined); // 仅传入undefined作为目标
    } catch (error) {
        isPassed = error instanceof TypeError;
    }
    console.log("Fn60（仅传undefined目标抛错）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn61：测试源对象为类实例且含getter时复制getter返回值
export function Fn61_testClassInstanceGetterCopy() {
    class TestClass {
        constructor() {
            this._val = 10;
        }
        get getterProp() {
            return this._val * 2;
        }
    }
    const source = new TestClass();
    const target = {};
    Object.assign(target, source);
    const isPassed = target.getterProp === 20;
    console.log("Fn61（类实例getter属性复制返回值）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn62：测试源对象含嵌套对象且目标对象已有同名嵌套对象时覆盖引用
export function Fn62_testNestedObjOverrideReference() {
    const target = { nested: { a: 1 } };
    const source = { nested: { b: 2 } };
    Object.assign(target, source);
    const isPassed = target.nested.a === undefined && target.nested.b === 2;
    console.log("Fn62（嵌套对象属性覆盖引用）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn63：测试复制BigInt数组作为源对象时按索引复制
export function Fn63_testBigIntArrayAsSource() {
    const target = {};
    const source = [10n, 20n, 30n]; // BigInt数组
    Object.assign(target, source);
    const isPassed = target[0] === 10n && target[2] === 30n;
    console.log("Fn63（BigInt数组源按索引复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn64：测试源对象为正则表达式且含flags属性时不复制（flags为不可枚举属性）
export function Fn64_testRegExpFlagsNotCopied() {
    const target = {};
    const source = /test/g; // flags为"g"（不可枚举）
    Object.assign(target, source);
    const isPassed = target.flags === undefined;
    console.log("Fn64（正则flags属性不复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn65：测试目标对象为数组且源对象含非索引属性时正常复制非索引属性
export function Fn65_testNonIndexPropToArrTarget() {
    const target = [1, 2];
    const source = { name: "test", 1: 200 }; // 非索引属性name，索引属性1
    Object.assign(target, source);
    const isPassed = target[1] === 200 && target.name === "test";
    console.log("Fn65（非索引属性复制到数组目标）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn66：测试多源对象中含函数属性时复制函数引用
export function Fn66_testCopyfunctionPropReference() {
    const func = () => "testFunc";
    const source1 = { fn: func };
    const source2 = { other: "val" };
    const target = {};
    Object.assign(target, source1, source2);
    const isPassed = target.fn === func && target.fn() === "testFunc";
    console.log("Fn66（函数属性复制引用）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn67：测试源对象为Date实例且含timezoneOffset属性时不复制（timezoneOffset为不可枚举）
export function Fn67_testDateTimezoneOffsetNotCopied() {
    const target = {};
    const source = new Date(); // timezoneOffset为不可枚举属性
    Object.assign(target, source);
    const isPassed = target.timezoneOffset === undefined;
    console.log("Fn67（Date timezoneOffset属性不复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn68：测试复制后目标对象属性的enumerable值与源对象一致（源可枚举则目标可枚举）
export function Fn68_testPreserveEnumerableValue() {
    const source = {};
    Object.defineProperty(source, "enumProp", { value: 10, enumerable: true });
    Object.defineProperty(source, "nonEnumProp", { value: 20, enumerable: false });
    const target = {};
    Object.assign(target, source);

    const isEnum = Object.getOwnPropertyDescriptor(target, "enumProp")?.enumerable;
    const isNonEnum = target.hasOwnProperty("nonEnumProp");
    const isPassed = isEnum && !isNonEnum;
    console.log("Fn68（保留源属性enumerable值）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn69：测试源对象为null且后续源对象含Symbol属性时正常复制Symbol属性
export function Fn69_testNullSourceThenSymbolSource() {
    const sym = Symbol("afterNull");
    const target = {};
    const source1 = null;
    const source2 = { [sym]: "symVal", a: 10 };
    Object.assign(target, source1, source2);
    const isPassed = target[sym] === "symVal" && target.a === 10;
    console.log("Fn69（null源后接Symbol源正常复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn70：测试目标对象为类实例且源对象含同名方法时覆盖实例方法
export function Fn70_testOverrideClassInstanceMethod() {
    class TestClass {
        method() {
            return "original";
        }
    }
    const target = new TestClass();
    const source = {
        method() {
            return "overridden";
        }
    };
    Object.assign(target, source);
    const isPassed = target.method() === "overridden";
    console.log("Fn70（源方法覆盖类实例方法）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn71：测试源对象为WeakMap且含getter属性时复制getter返回值
export function Fn71_testWeakMapGetterPropCopy() {
    const target = {};
    const weakMap = new WeakMap();
    Object.defineProperty(weakMap, "getterProp", {
        get: () => "weakMapGetterVal",
        enumerable: true
    });
    Object.assign(target, weakMap);
    const isPassed = target.getterProp === "weakMapGetterVal";
    console.log("Fn71（WeakMap getter属性复制返回值）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn72：测试源对象为WeakSet且含setter属性时仅复制属性名（setter不生效）
export function Fn72_testWeakSetSetterPropCopy() {
    const target = {};
    const weakSet = new WeakSet();
    let innerVal = "";
    Object.defineProperty(weakSet, "setterProp", {
        set: (val) => { innerVal = val; },
        enumerable: true
    });
    Object.assign(target, weakSet);
    const isPassed = target.hasOwnProperty("setterProp") && innerVal === "";
    console.log("Fn72（WeakSet setter属性仅复制名称）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn74：测试冻结对象作为源时仅复制自身可枚举属性
export function Fn74_testFrozenObjectAsSource() {
    const frozenSource = Object.freeze({ x: 5, y: 6 });
    const target = {};
    Object.assign(target, frozenSource);
    const isPassed = target.x === 5 && target.y === 6;
    console.log("Fn74（冻结对象作为源复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn75：测试源对象属性为Symbol且值为BigInt时正常复制
export function Fn75_testSymbolPropWithBigInt() {
    const sym = Symbol("bigIntSym");
    const target = {};
    const source = { [sym]: 9007199254740991n };
    Object.assign(target, source);
    const isPassed = target[sym] === 9007199254740991n;
    console.log("Fn75（Symbol属性值为BigInt复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}


// Fn77：测试源对象为字符串且含 emoji 时按索引正常复制
export function Fn77_testEmojiStringAsSource() {
    const target = {};
    const source = "😀😂😃"; // emoji字符串
    Object.assign(target, source);
    const isPassed = target[0] === "😀" && target[2] === "😃";
    console.log("Fn77（emoji字符串源按索引复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn78：测试多源对象含相同函数属性时按顺序覆盖
export function Fn78_testMultiSourceFuncOverride() {
    const func1 = () => "func1";
    const func2 = () => "func2";
    const target = {};
    const source1 = { fn: func1 };
    const source2 = { fn: func2 };
    Object.assign(target, source1, source2);
    const isPassed = target.fn() === "func2";
    console.log("Fn78（多源函数属性覆盖）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn79：测试目标对象为null且后续源对象为空时仍抛错
export function Fn79_testNullTargetThenEmptySource() {
    let isPassed = false;
    try {
        Object.assign(null, {}); // 目标为null，源为空对象
    } catch (error) {
        isPassed = error instanceof TypeError;
    }
    console.log("Fn79（null目标接空源仍抛错）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn80：测试目标对象为undefined且后续源对象为空时仍抛错
export function Fn80_testUndefinedTargetThenEmptySource() {
    let isPassed = false;
    try {
        Object.assign(undefined, {}); // 目标为undefined，源为空对象
    } catch (error) {
        isPassed = error instanceof TypeError;
    }
    console.log("Fn80（undefined目标接空源仍抛错）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn81：测试类实例作为源且含不可枚举属性时不复制
export function Fn81_testClassInstanceNonEnumProp() {
    class TestClass {
        constructor() {
            Object.defineProperty(this, "nonEnumProp", {
                value: "nonEnumVal",
                enumerable: false
            });
            this.enumProp = "enumVal";
        }
    }
    const source = new TestClass();
    const target = {};
    Object.assign(target, source);
    const isPassed = target.enumProp === "enumVal" && target.nonEnumProp === undefined;
    console.log("Fn81（类实例不可枚举属性不复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn82：测试嵌套对象属性值为Symbol时浅拷贝引用
export function Fn82_testNestedSymbolShallowCopy() {
    const sym = Symbol("nestedSym");
    const target = { nested: { a: sym } };
    const source = { nested: { b: sym } };
    Object.assign(target, source);
    const isPassed = target.nested.a === undefined && target.nested.b === sym;
    console.log("Fn82（嵌套对象Symbol值浅拷贝）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn83：测试BigInt对象作为源时无属性复制（BigInt对象无可枚举属性）
export function Fn83_testBigIntObjectAsSource() {
    const target = {};
    const source = Object(9007199254740991n); // BigInt对象
    Object.assign(target, source);
    const isPassed = Object.keys(target).length === 0;
    console.log("Fn83（BigInt对象作为源）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn84：测试正则表达式含lastIndex属性时不复制（lastIndex不可枚举）
export function Fn84_testRegExpLastIndexNotCopied() {
    const target = {};
    const source = /test/g;
    source.lastIndex = 5; // 修改lastIndex
    Object.assign(target, source);
    const isPassed = target.lastIndex === undefined;
    console.log("Fn84（正则lastIndex属性不复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn85：测试数组目标含非索引属性时源对象非索引属性覆盖
export function Fn85_testArrTargetNonIndexOverride() {
    const target = [1, 2];
    target.name = "oldName";
    const source = { name: "newName", 1: 200 };
    Object.assign(target, source);
    const isPassed = target[1] === 200 && target.name === "newName";
    console.log("Fn85（数组目标非索引属性覆盖）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn86：测试源对象函数属性含自身属性时复制函数引用（函数自身属性不复制）
export function Fn86_testFuncWithOwnPropsCopy() {
    const func = () => "test";
    func.ownProp = "funcOwnVal"; // 函数自身属性
    const target = {};
    Object.assign(target, { fn: func });
    const isPassed = target.fn() === "test" && target.fn.ownProp === "funcOwnVal";
    console.log("Fn86（函数自身属性随函数引用复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn87：测试Date实例含getDate方法时不复制（方法在原型链）
export function Fn87_testDatePrototypeMethodNotCopied() {
    const target = {};
    const source = new Date();
    Object.assign(target, source);
    const isPassed = target.getDate === undefined;
    console.log("Fn87（Date原型方法不复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn88：测试源对象属性enumerable为false时复制后目标无该属性
export function Fn88_testSourceNonEnumPropNoCopy() {
    const source = {};
    Object.defineProperty(source, "nonEnum", {
        value: "val",
        enumerable: false
    });
    const target = {};
    Object.assign(target, source);
    const isPassed = target.hasOwnProperty("nonEnum") === false;
    console.log("Fn88（源不可枚举属性不复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn89：测试undefined源后接Symbol源时正常复制Symbol属性
export function Fn89_testUndefinedSourceThenSymbolSource() {
    const sym = Symbol("afterUndefined");
    const target = {};
    const source1 = undefined;
    const source2 = { [sym]: "symVal", x: 100 };
    Object.assign(target, source1, source2);
    const isPassed = target[sym] === "symVal" && target.x === 100;
    console.log("Fn89（undefined源后接Symbol源）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn90：测试类实例方法被源对象普通属性覆盖
export function Fn90_testClassMethodOverriddenByProp() {
    class TestClass {
        method() {
            return "methodVal";
        }
    }
    const target = new TestClass();
    const source = { method: "propVal" }; // 普通属性覆盖方法
    Object.assign(target, source);
    const isPassed = target.method === "propVal" && typeof target.method !== "export function";
    console.log("Fn90（类方法被普通属性覆盖）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn91：测试源对象为Error实例时复制自身可枚举属性
export function Fn91_testErrorInstanceAsSource() {
    const target = {};
    const error = new Error("test error");
    error.customProp = "errorOwnVal"; // 自身可枚举属性
    Object.assign(target, error);
    const isPassed = target.customProp === "errorOwnVal";
    console.log("Fn91（Error实例自身属性复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn92：测试源对象为Promise实例时复制自身可枚举属性
export function Fn92_testPromiseInstanceAsSource() {
    const target = {};
    const promise = Promise.resolve();
    promise.customProp = "promiseOwnVal"; // 自身可枚举属性
    Object.assign(target, promise);
    const isPassed = target.customProp === "promiseOwnVal";
    console.log("Fn92（Promise实例自身属性复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn93：测试目标对象为数组且源对象含Symbol属性时正常复制
export function Fn93_testSymbolToArrTarget() {
    const sym = Symbol("arrSym");
    const target = [1, 2];
    const source = { [sym]: "symVal" };
    Object.assign(target, source);
    const isPassed = target[sym] === "symVal";
    console.log("Fn93（Symbol属性复制到数组目标）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn94：测试源对象为数组且含自定义可枚举属性时复制该属性
export function Fn94_testArrayWithCustomPropAsSource() {
    const target = {};
    const source = [10, 20];
    source.customProp = "arrayOwnVal"; // 自定义可枚举属性
    Object.assign(target, source);
    const isPassed = target[0] === 10 && target.customProp === "arrayOwnVal";
    console.log("Fn94（数组自定义属性复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn95：测试复制后目标对象属性值为undefined时正常保留
export function Fn95_testPreserveUndefinedProp() {
    const target = {};
    const source = { a: undefined, b: null };
    Object.assign(target, source);
    const isPassed = target.a === undefined && target.b === null;
    console.log("Fn95（保留undefined属性值）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn96：测试多源对象含相同null值属性时按顺序覆盖
export function Fn96_testMultiSourceNullOverride() {
    const target = {};
    const source1 = { x: 10, y: null };
    const source2 = { y: 20, z: null };
    Object.assign(target, source1, source2);
    const isPassed = target.x === 10 && target.y === 20 && target.z === null;
    console.log("Fn96（多源null值属性覆盖）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn97：测试源对象为JSON对象（无原型）时仅复制自身属性
export function Fn97_testJsonObjAsSource() {
    const jsonObj = JSON.parse('{"a":1,"b":2}'); // 无原型的纯对象
    const target = {};
    Object.assign(target, jsonObj);
    const isPassed = target.a === 1 && target.b === 2 && target.toString === undefined;
    console.log("Fn97（JSON对象作为源复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn98：测试目标对象为JSON对象时正常接收源属性
export function Fn98_testJsonObjAsTarget() {
    const target = JSON.parse('{"x":5}');
    const source = { y: 6, x: 50 };
    Object.assign(target, source);
    const isPassed = target.x === 50 && target.y === 6;
    console.log("Fn98（JSON对象作为目标复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn99：测试源对象为Map且含不可枚举属性时不复制
export function Fn99_testMapNonEnumPropNoCopy() {
    const target = {};
    const map = new Map();
    Object.defineProperty(map, "nonEnumProp", {
        value: "mapNonEnum",
        enumerable: false
    });
    map.enumProp = "mapEnum";
    Object.assign(target, map);
    const isPassed = target.enumProp === "mapEnum" && target.nonEnumProp === undefined;
    console.log("Fn99（Map不可枚举属性不复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn100：测试综合场景（多源、Symbol、嵌套、基本类型）
export function Fn100_testComprehensiveScenario() {
    const sym = Symbol("compreSym");
    const nestedRef = { val: 100 };
    const target = { base: "base", nested: { old: "val" } };
    const source1 = { a: 1, [sym]: "symVal", nested: nestedRef };
    const source2 = null;
    const source3 = { a: 2, b: null, nested: { new: "val" } };
    Object.assign(target, source1, source2, source3);

    const isPassed =
        target.base === "base" &&
            target.a === 2 &&
            target[sym] === "symVal" &&
            target.b === null &&
            target.nested.old === undefined &&
            target.nested.new === "val";

    console.log("Fn100（综合场景复制）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn101：测试目标为对象字面量，源为单个对象字面量（基本属性复制）
export function Fn101_targetLiteralSingleSourceLiteral() {
    const result = Object.assign({ a: 1 }, { b: 2, c: 3 });
    const isPassed = result.a === 1 && result.b === 2 && result.c === 3;
    console.log("Fn101（目标+单源均为字面量）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn102：测试目标为对象字面量，多源均为对象字面量（属性按顺序覆盖）
export function Fn102_targetLiteralMultiSourceLiteral() {
    const result = Object.assign({ x: 10 }, { x: 20, y: 30 }, { y: 40, z: 50 });
    const isPassed = result.x === 20 && result.y === 40 && result.z === 50;
    console.log("Fn102（目标+多源均为字面量）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn103：测试源为含Symbol的对象字面量（Symbol属性正常复制）
export function Fn103_sourceLiteralWithSymbol() {
    const sym = Symbol("litSym");
    const result = Object.assign({}, { [sym]: "symVal", a: 100 });
    const isPassed = result[sym] === "symVal" && result.a === 100;
    console.log("Fn103（源字面量含Symbol）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn104：测试源为含嵌套对象的字面量（浅拷贝，嵌套对象仅复制引用）
export function Fn104_sourceLiteralWithNestedObj() {
    const result = Object.assign({}, { nested: { x: 1 } });
    result.nested.x = 100; // 修改目标嵌套属性，验证引用
    const isPassed = result.nested.x === 100;
    console.log("Fn104（源字面量含嵌套对象）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn105：测试源为含基本类型的对象字面量（null/undefined值正常复制）
export function Fn105_sourceLiteralWithPrimitiveValues() {
    const result = Object.assign({}, { a: null, b: undefined, c: "valid" });
    const isPassed = result.a === null && result.b === undefined && result.c === "valid";
    console.log("Fn105（源字面量含null/undefined）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn106：测试源为含函数的对象字面量（函数引用正常复制）
export function Fn106_sourceLiteralWithe() {
    const result = Object.assign({}, { fn: () => "litFunc", val: 123 });
    const isPassed = result.fn() === "litFunc" && result.val === 123;
    console.log("Fn106（源字面量含函数）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn107：测试源为含BigInt的对象字面量（BigInt值正常复制）
export function Fn107_sourceLiteralWithBigInt() {
    const result = Object.assign({}, { big: 9007199254740991n, normal: 456 });
    const isPassed = result.big === 9007199254740991n && result.normal === 456;
    console.log("Fn107（源字面量含BigInt）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn108：测试目标为空白对象字面量，多源字面量含同名属性（后源覆盖前源）
export function Fn108_emptyTargetLiteralMultiSource() {
    const result = Object.assign({}, { a: 1, b: 2 }, { b: 3, c: 4 }, { c: 5 });
    const isPassed = result.a === 1 && result.b === 3 && result.c === 5;
    console.log("Fn108（空白目标+多源字面量）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn109：测试源为含空对象的字面量（空对象源不影响其他属性复制）
export function Fn109_sourceLiteralWithEmptyObj() {
    const result = Object.assign({ base: "base" }, {}, { a: 10 }, { b: 20 });
    const isPassed = result.base === "base" && result.a === 10 && result.b === 20;
    console.log("Fn109（源字面量含空对象）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn110：测试目标为含嵌套对象的字面量，源字面量覆盖嵌套对象引用
export function Fn110_targetLiteralWithNestedSourceLiteral() {
    const result = Object.assign({ nested: { old: "val" } }, { nested: { new: "val" } });
    const isPassed = result.nested.old === undefined && result.nested.new === "val";
    console.log("Fn110（目标嵌套字面量+源嵌套字面量）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn111：测试源为含特殊字符键的对象字面量（特殊键名正常复制）
export function Fn111_sourceLiteralWithSpecialKey() {
    const result = Object.assign({}, { "a-b": 1, "123": 2, "!@#": 3 });
    const isPassed = result["a-b"] === 1 && result["123"] === 2 && result["!@#"] === 3;
    console.log("Fn111（源字面量含特殊字符键）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn112：测试目标为对象字面量，源字面量含getter（复制getter返回值）
export function Fn112_sourceLiteralWithGetter() {
    const result = Object.assign({}, {
        get foo() { return "getterVal"; },
        bar: "normalVal"
    });
    const isPassed = result.foo === "getterVal" && result.bar === "normalVal";
    console.log("Fn112（源字面量含getter）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn113：测试目标为对象字面量，源字面量含setter（仅复制属性名，setter不生效）
export function Fn113_sourceLiteralWithSetter() {
    let inner = "";
    const result = Object.assign({}, {
        set foo(val) { inner = val; },
        bar: "normalVal"
    });
    const isPassed = result.hasOwnProperty("foo") && inner === "" && result.bar === "normalVal";
    console.log("Fn113（源字面量含setter）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn114：测试多源字面量含相同Symbol属性（后源Symbol覆盖前源）
export function Fn114_multiSourceLiteralWithSameSymbol() {
    const sym = Symbol("sameSym");
    const result = Object.assign({}, { [sym]: "v1" }, { [sym]: "v2" });
    const isPassed = result[sym] === "v2";
    console.log("Fn114（多源字面量含相同Symbol）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn115：测试目标为对象字面量，源字面量含数组属性（数组引用正常复制）
export function Fn115_sourceLiteralWithArray() {
    const result = Object.assign({}, { arr: [1, 2, 3], val: 4 });
    result.arr.push(4); // 修改目标数组，验证引用
    const isPassed = result.arr.length === 4 && result.val === 4;
    console.log("Fn115（源字面量含数组）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn116：测试空白目标字面量，源为仅含Symbol的字面量（Symbol属性正常复制）
export function Fn116_emptyTargetLiteralWithSymbolSource() {
    const sym1 = Symbol("s1");
    const sym2 = Symbol("s2");
    const result = Object.assign({}, { [sym1]: "v1", [sym2]: "v2" });
    const isPassed = result[sym1] === "v1" && result[sym2] === "v2";
    console.log("Fn116（空白目标+仅Symbol源字面量）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn117：测试目标字面量含已有属性，源字面量覆盖并新增属性
export function Fn117_targetLiteralWithExistingProp() {
    const result = Object.assign({ a: 1, b: 2 }, { b: 3, c: 4 });
    const isPassed = result.a === 1 && result.b === 3 && result.c === 4;
    console.log("Fn117（目标字面量含已有属性）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn118：测试源字面量含嵌套数组（嵌套数组仅复制引用，修改同步）
export function Fn118_sourceLiteralWithNestedArray() {
    const result = Object.assign({}, { nested: { arr: [1, 2] } });
    result.nested.arr.push(3);
    const isPassed = result.nested.arr.length === 3 && result.nested.arr[2] === 3;
    console.log("Fn118（源字面量含嵌套数组）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn119：测试多源字面量混合基本类型与引用类型（均按规则复制）
export function Fn119_multiSourceLiteralMixedTypes() {
    const result = Object.assign(
        { base: "base" },
        { num: 10, str: "test" },
        { nested: { x: 1 }, sym: Symbol("mix") },
        { num: 20, nested: { y: 2 } }
    );
    const isPassed =
        result.base === "base" &&
            result.num === 20 &&
            result.str === "test" &&
            result.nested.x === undefined &&
            result.nested.y === 2 &&
            result.sym === Symbol("mix");
    console.log("Fn119（多源字面量混合类型）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn120：测试目标为对象字面量，源字面量含循环引用（循环引用正常复制）
export function Fn120_sourceLiteralWithCircularRef() {
    const source = { a: 1 };
    source.self = source; // 构建循环引用
    const result = Object.assign({}, source); // 源本质是对象字面量构建的引用
    const isPassed = result.a === 1 && result.self === source;
    console.log("Fn120（源字面量含循环引用）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn121：测试源字面量含纯数字键，目标字面量接收数字键属性
export function Fn121_sourceLiteralWithNumKey() {
    const result = Object.assign({ "0": "init" }, { "1": 10, "2": 20, "3": 30 });
    const isPassed = result["0"] === "init" && result["1"] === 10 && result["3"] === 30;
    console.log("Fn121（源字面量含纯数字键）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn122：测试多源字面量含相同纯数字键，后源覆盖前源
export function Fn122_multiSourceLiteralSameNumKey() {
    const result = Object.assign(
        {},
        { "10": 100, "20": 200 },
        { "20": 2000, "30": 3000 },
        { "30": 30000 }
    );
    const isPassed = result["10"] === 100 && result["20"] === 2000 && result["30"] === 30000;
    console.log("Fn122（多源字面量相同纯数字键覆盖）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn124：测试目标为数组字面量，源字面量纯数字键匹配数组索引时覆盖
export function Fn124_arrayTargetLiteralWithNumKeySource() {
    const result = Object.assign([1, 2, 3], { "0": 10, "2": 30, "3": 40 });
    const isPassed = result[0] === 10 && result[2] === 30 && result[3] === 40;
    console.log("Fn124（数组目标+源字面量纯数字键）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn125：测试源字面量含纯数字键与普通键混合，均正常复制
export function Fn125_sourceLiteralMixedNumAndNormalKey() {
    const result = Object.assign(
        {},
        { "5": 50, "name": "test" },
        { "5": 500, "age": 20 }
    );
    const isPassed = result["5"] === 500 && result["name"] === "test" && result["age"] === 20;
    console.log("Fn125（源字面量混合纯数字键与普通键）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn126：测试源字面量含纯数字键且值为引用类型（浅拷贝，引用同步）
export function Fn126_sourceLiteralNumKeyWithRefValue() {
    const nested = { x: 1 };
    const result = Object.assign({}, { "1": nested, "2": 20 });
    nested.x = 100; // 修改引用对象
    const isPassed = result["1"].x === 100 && result["2"] === 20;
    console.log("Fn126（源字面量纯数字键值为引用类型）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn127：测试源字面量含纯数字键且值为Symbol，正常复制
export function Fn127_sourceLiteralNumKeyWithSymbolValue() {
    const sym = Symbol("numKeySym");
    const result = Object.assign({}, { "3": sym, "4": "normalVal" });
    const isPassed = result["3"] === sym && result["4"] === "normalVal";
    console.log("Fn127（源字面量纯数字键值为Symbol）：", isPassed ? "通过" : "失败");
    return isPassed;
}

// Fn128：测试空白目标字面量，源字面量仅含纯数字键，全部正常复制
export function Fn128_emptyTargetLiteralOnlyNumKeySource() {
    const result = Object.assign({}, { "0": "a", "1": "b", "2": "c", "100": "d" });
    const isPassed = result["0"] === "a" && result["1"] === "b" && result["100"] === "d";
    console.log("Fn128（空白目标+仅纯数字键源字面量）：", isPassed ? "通过" : "失败");
    return isPassed;
}
