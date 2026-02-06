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
// 测试点1：获取对象自有数据属性的完整描述符，验证value、writable、enumerable、configurable属性是否正确
export function Fn01_testDataPropertyDescriptor() {
    const obj = { name: "Alice", age: 30 };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "name");
    return (
        descriptor.value === "Alice" &&
            descriptor.writable === true &&
            descriptor.enumerable === true &&
            descriptor.configurable === true &&
            descriptor.get === undefined &&
            descriptor.set === undefined
    );
}

// 测试点2：获取对象自有访问器属性的描述符，验证get、set、enumerable、configurable属性是否正确
export function Fn02_testAccessorPropertyDescriptor() {
    let internalValue = "test";
    const obj = {
        get value() { return internalValue; },
        set value(newVal) { internalValue = newVal; }
    };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "value");
    return (
        typeof descriptor.get === "function" &&
            typeof descriptor.set === "function" &&
            descriptor.get() === "test" &&
            descriptor.writable === undefined &&
            descriptor.value === undefined &&
            descriptor.enumerable === true &&
            descriptor.configurable === true
    );
}

// 测试点3：获取不存在的属性或原型链上的属性，验证返回undefined
export function Fn03_testNonExistentOrPrototypeProperty() {
    const parent = { protoProp: "parentProp" };
    const child = Object.create(parent);
    child.ownProp = "childProp";

    const nonExistentDesc = Object.getOwnPropertyDescriptor(child, "nonExistent");
    const protoDesc = Object.getOwnPropertyDescriptor(child, "protoProp");
    const ownDesc = Object.getOwnPropertyDescriptor(child, "ownProp");

    return nonExistentDesc === undefined && protoDesc === undefined && ownDesc.value === "childProp";
}

// 测试点4：验证不可写数据属性的descriptor.writable为false
export function Fn04_testNonWritableDataProperty() {
    const obj = {};
    Object.defineProperty(obj, "id", { value: 123, writable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "id");
    return descriptor.value === 123 && descriptor.writable === false;
}

// 测试点5：验证不可枚举数据属性的descriptor.enumerable为false
export function Fn05_testNonEnumerableDataProperty() {
    const obj = { visible: "yes" };
    Object.defineProperty(obj, "hidden", { value: "no", enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "hidden");
    return descriptor.value === "no" && descriptor.enumerable === false;
}

// 测试点6：验证不可配置数据属性的descriptor.configurable为false
export function Fn06_testNonConfigurableDataProperty() {
    const obj = {};
    Object.defineProperty(obj, "lock", { value: "locked", configurable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "lock");
    return descriptor.value === "locked" && descriptor.configurable === false;
}

// 测试点7：验证访问器属性仅定义getter时set为undefined
export function Fn07_testAccessorOnlyGetter() {
    const obj = { get msg() { return "hello"; } };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "msg");
    return descriptor.get() === "hello" && descriptor.set === undefined;
}

// 测试点8：验证访问器属性仅定义setter时get为undefined
export function Fn08_testAccessorOnlySetter() {
    let val = "";
    const obj = { set msg(newVal) { val = newVal; } };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "msg");
    obj.msg = "test";
    return descriptor.get === undefined && val === "test";
}

// 测试点9：验证不可枚举访问器属性的descriptor.enumerable为false
export function Fn09_testNonEnumerableAccessor() {
    let num = 1;
    const obj = {};
    Object.defineProperty(obj, "count", {
        get() { return num; },
        enumerable: false
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "count");
    return descriptor.get() === 1 && descriptor.enumerable === false;
}

// 测试点10：验证不可配置访问器属性的descriptor.configurable为false
export function Fn10_testNonConfigurableAccessor() {
    let val = "test";
    const obj = {};
    Object.defineProperty(obj, "fixed", {
        get() { return val; },
        configurable: false
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "fixed");
    return descriptor.get() === "test" && descriptor.configurable === false;
}

// 测试点11：对null/undefined调用时抛出TypeError（通过try-catch捕获验证）
export function Fn11_testNullUndefinedTarget() {
    try {
        Object.getOwnPropertyDescriptor(null, "prop");
        return false; // 未抛出错误则测试失败
    } catch (e) {
        return e instanceof TypeError;
    }
}

// 测试点13：对基本类型（String）包装对象获取属性描述符
export function Fn13_testStringWrapperObject() {
    const strObj = new String("test");
    const descriptor = Object.getOwnPropertyDescriptor(strObj, "length");
    return descriptor.value === 4 && descriptor.writable === false;
}

// 测试点14：验证数组自有索引属性的描述符
export function Fn14_testArrayIndexProperty() {
    const arr = ["a", "b"];
    const descriptor = Object.getOwnPropertyDescriptor(arr, "0");
    return descriptor.value === "a" && descriptor.enumerable === true && descriptor.writable === true;
}

// 测试点15：验证数组length属性的descriptor（不可枚举、可写）
export function Fn15_testArrayLengthProperty() {
    const arr = [1, 2, 3];
    const descriptor = Object.getOwnPropertyDescriptor(arr, "length");
    return descriptor.value === 3 && descriptor.enumerable === false && descriptor.writable === true;
}

// 测试点16：验证Symbol作为属性名时的描述符获取
export function Fn16_testSymbolProperty() {
    const sym = Symbol("key");
    const obj = { [sym]: "symbolVal" };
    const descriptor = Object.getOwnPropertyDescriptor(obj, sym);
    return descriptor.value === "symbolVal" && descriptor.enumerable === true;
}

// 测试点17：验证不可写属性修改后描述符value不变（通过try-catch确认）
export function Fn17_testNonWritableValueUnchangeable() {
    const obj = {};
    Object.defineProperty(obj, "num", { value: 10, writable: false });
    try {
        obj.num = 20; // 严格模式下抛错，非严格模式下静默失败
    } catch (e) {}
    const descriptor = Object.getOwnPropertyDescriptor(obj, "num");
    return descriptor.value === 10;
}

// 测试点19：验证访问器属性getter依赖外部变量时的返回值
export function Fn19_testAccessorDependsExternalVar() {
    let external = "foo";
    const obj = { get ext() { return external; } };
    external = "bar";
    const descriptor = Object.getOwnPropertyDescriptor(obj, "ext");
    return descriptor.get() === "bar";
}

// 测试点20：验证通过defineProperty定义的空值数据属性描述符
export function Fn20_testEmptyValueDataProperty() {
    const obj = {};
    Object.defineProperty(obj, "empty", { value: undefined });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "empty");
    return descriptor.value === undefined && descriptor.writable === false && descriptor.enumerable === false && descriptor.configurable === false;
}

// 测试点21：验证函数对象的prototype属性描述符
export function Fn21_testFunctionPrototypeDescriptor() {
    function TestFunc() {}
    const descriptor = Object.getOwnPropertyDescriptor(TestFunc, "prototype");
    return descriptor.value instanceof Object && descriptor.writable === true && descriptor.enumerable === false && descriptor.configurable === false;
}

// 测试点22：验证对象原型（Object.prototype）的toString属性描述符
export function Fn22_testObjectPrototypeToString() {
    const descriptor = Object.getOwnPropertyDescriptor(Object.prototype, "toString");
    return typeof descriptor.get === "function" && descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点23：验证不可枚举属性在for...in中不可见（结合描述符验证）
export function Fn23_testNonEnumerableInForIn() {
    const obj = { a: 1 };
    Object.defineProperty(obj, "b", { value: 2, enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "b");
    let hasB = false;
    for (const key in obj) {
        if (key === "b") hasB = true;
    }
    return descriptor.enumerable === false && !hasB;
}

// 测试点24：验证可配置属性删除后描述符为undefined
export function Fn24_testConfigurablePropertyDeletable() {
    const obj = { del: "canDelete" };
    const descriptor1 = Object.getOwnPropertyDescriptor(obj, "del");
    const deleteResult = delete obj.del;
    const descriptor2 = Object.getOwnPropertyDescriptor(obj, "del");
    return descriptor1.configurable === true && deleteResult && descriptor2 === undefined;
}

// 测试点25：验证访问器属性setter修改外部变量的有效性
export function Fn25_testAccessorSetterModifyExternal() {
    let store = "";
    const obj = { set save(val) { store = val; } };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "save");
    obj.save = "data";
    return typeof descriptor.set === "function" && store === "data";
}

// 测试点26：验证数字基本类型直接调用时自动包装（获取toString描述符）
export function Fn26_testNumberPrimitiveAutoWrap() {
    try {
        const descriptor = Object.getOwnPropertyDescriptor(123, "toString");
        return typeof descriptor.get === "function";
    } catch (e) {
        return false;
    }
}

// 测试点28：验证对象自有属性与原型属性同名时优先获取自有描述符
export function Fn28_testOwnVsPrototypeSameName() {
    const parent = { name: "parent" };
    const child = Object.create(parent);
    child.name = "child";
    const descriptor = Object.getOwnPropertyDescriptor(child, "name");
    return descriptor.value === "child" && descriptor.enumerable === true;
}

// 测试点29：验证不可配置访问器属性无法修改getter（通过try-catch）
export function Fn29_testNonConfigurableAccessorNoModify() {
    let val = "fixed";
    const obj = {};
    Object.defineProperty(obj, "noChange", {
        get() { return val; },
        configurable: false
    });
    try {
        Object.defineProperty(obj, "noChange", { get() { return "changed"; } });
        return false; // 未抛出错误则测试失败
    } catch (e) {
        const descriptor = Object.getOwnPropertyDescriptor(obj, "noChange");
        return e instanceof TypeError && descriptor.get() === "fixed";
    }
}

// 测试点30：验证可写访问器属性（不存在，访问器无writable，验证descriptor.writable为undefined）
export function Fn30_testAccessorWritableUndefined() {
    const obj = { get x() { return 1; }, set x(v) {} };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "x");
    return descriptor.writable === undefined && typeof descriptor.get === "function" && typeof descriptor.set === "function";
}

// 测试点31：验证空对象的自有属性描述符获取（不存在属性返回undefined）
export function Fn31_testEmptyObjectNonExistentProp() {
    const emptyObj = {};
    const descriptor = Object.getOwnPropertyDescriptor(emptyObj, "none");
    return descriptor === undefined;
}

// 测试点33：验证通过Object.create定义的对象自有属性描述符
export function Fn33_testObjectCreateOwnProp() {
    const obj = Object.create({}, {
        prop: { value: "created", enumerable: true }
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.value === "created" && descriptor.enumerable === true;
}

// 测试点34：验证不可写且不可配置属性的value无法修改
export function Fn34_testNonWritableNonConfigurableValue() {
    const obj = {};
    Object.defineProperty(obj, "static", { value: "immutable", writable: false, configurable: false });
    try {
        obj.static = "mutated";
    } catch (e) {}
    const descriptor = Object.getOwnPropertyDescriptor(obj, "static");
    return descriptor.value === "immutable";
}

// 测试点36：验证通过Object.defineProperties定义的多属性中某一属性的描述符
export function Fn36_testDefinePropertiesSingleDescriptor() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: "test1", enumerable: true },
        prop2: { value: "test2", writable: false }
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop2");
    return descriptor.value === "test2" && descriptor.writable === false && descriptor.enumerable === false;
}

// 测试点38：验证不可配置数据属性无法修改enumerable（通过try-catch）
export function Fn38_testNonConfigurableCannotChangeEnumerable() {
    const obj = {};
    Object.defineProperty(obj, "prop", { value: "val", configurable: false, enumerable: true });
    try {
        Object.defineProperty(obj, "prop", { enumerable: false });
        return false; // 未抛错则测试失败
    } catch (e) {
        const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
        return e instanceof TypeError && descriptor.enumerable === true;
    }
}

// 测试点39：验证Symbol.iterator作为对象属性时的描述符获取
export function Fn39_testSymbolIteratorPropertyDescriptor() {
    const obj = {
        [Symbol.iterator]: function* () { yield 1; yield 2; }
    };
    const descriptor = Object.getOwnPropertyDescriptor(obj, Symbol.iterator);
    return typeof descriptor.value === "function" && descriptor.enumerable === true;
}

// 测试点40：验证WeakSet实例无自有可枚举属性（描述符获取为undefined）
export function Fn40_testWeakSetNoOwnEnumerableProps() {
    const weakSet = new WeakSet();
    const descriptor = Object.getOwnPropertyDescriptor(weakSet, "anyProp");
    return descriptor === undefined && Object.keys(weakSet).length === 0;
}

// 测试点41：验证类实例的实例属性描述符（非原型属性）
export function Fn41_testClassInstancePropDescriptor() {
    class TestClass {
        constructor() {
            this.instanceProp = "instanceVal";
        }
    }
    const instance = new TestClass();
    const descriptor = Object.getOwnPropertyDescriptor(instance, "instanceProp");
    return descriptor.value === "instanceVal" && descriptor.writable === true && descriptor.enumerable === true;
}

// 测试点43：验证不可配置数据属性无法修改configurable自身（try-catch捕获错误）
export function Fn43_testNonConfigurableCannotChangeConfigurable() {
    const obj = {};
    Object.defineProperty(obj, "lock", { value: "val", configurable: false });
    try {
        Object.defineProperty(obj, "lock", { configurable: true });
        return false;
    } catch (e) {
        const descriptor = Object.getOwnPropertyDescriptor(obj, "lock");
        return e instanceof TypeError && descriptor.configurable === false;
    }
}

// 测试点44：验证字符串基本类型自动包装后length属性描述符
export function Fn44_testStringPrimitiveLengthDescriptor() {
    const str = "hello";
    const descriptor = Object.getOwnPropertyDescriptor(str, "length");
    return descriptor.value === 5 && descriptor.writable === false && descriptor.enumerable === false;
}

// 测试点45：验证类静态属性的描述符（通过类直接定义）
export function Fn45_testClassStaticPropDescriptor() {
    class MyClass {
        static staticProp = "staticVal";
    }
    const descriptor = Object.getOwnPropertyDescriptor(MyClass, "staticProp");
    return descriptor.value === "staticVal" && descriptor.enumerable === true && descriptor.writable === true;
}

// 测试点46：验证Array.prototype.push方法的描述符（不可枚举、可配置）
export function Fn46_testArrayPrototypePushDescriptor() {
    const descriptor = Object.getOwnPropertyDescriptor(Array.prototype, "push");
    return typeof descriptor.value === "function" && descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点47：验证不可写访问器属性（无此概念，验证setter可正常定义且writable为undefined）
export function Fn47_testAccessorNoWritableConcept() {
    let val = 10;
    const obj = {
        get num() { return val; },
        set num(newVal) { val = newVal; }
    };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "num");
    return descriptor.writable === undefined && typeof descriptor.set === "function";
}

// 测试点48：验证WeakMap实例无自有属性（任意属性描述符均为undefined）
export function Fn48_testWeakMapNoOwnProps() {
    const weakMap = new WeakMap([[{ key: 1 }, "val1"]]);
    const descriptor1 = Object.getOwnPropertyDescriptor(weakMap, "size");
    const descriptor2 = Object.getOwnPropertyDescriptor(weakMap, "anyKey");
    return descriptor1 === undefined && descriptor2 === undefined;
}

// 测试点49：验证通过Object.assign添加的自有属性描述符
export function Fn49_testObjectAssignPropDescriptor() {
    const source = { assignProp: "assignVal" };
    const target = Object.assign({}, source);
    const descriptor = Object.getOwnPropertyDescriptor(target, "assignProp");
    return descriptor.value === "assignVal" && descriptor.enumerable === true && descriptor.writable === true;
}

// 测试点50：验证RegExp对象lastIndex属性的描述符（可写、不可枚举）
export function Fn50_testRegExpLastIndexDescriptor() {
    const reg = /abc/g;
    reg.lastIndex = 2;
    const descriptor = Object.getOwnPropertyDescriptor(reg, "lastIndex");
    return descriptor.value === 2 && descriptor.writable === true && descriptor.enumerable === false;
}

// 测试点51：验证函数对象name属性的描述符（不可写、不可枚举）
export function Fn51_testFunctionNameDescriptor() {
    function testFunc() {}
    const descriptor = Object.getOwnPropertyDescriptor(testFunc, "name");
    return descriptor.writable === false && descriptor.enumerable === false;
}

// 测试点52：验证可配置访问器属性可修改setter
export function Fn52_testConfigurableAccessorModifySetter() {
    let val = "old";
    const obj = {
        get msg() { return val; },
        set msg(newVal) { val = newVal; }
    };
    Object.defineProperty(obj, "msg", {
        set(newVal) { val = `new:${newVal}`; }
    });
    obj.msg = "val";
    const descriptor = Object.getOwnPropertyDescriptor(obj, "msg");
    return descriptor.get() === "new:val" && typeof descriptor.set === "function";
}

// 测试点53：验证数组空位的属性描述符（空位无自有属性，返回undefined）
export function Fn53_testArrayHoleDescriptor() {
    const arr = [1, , 3]; // 索引1为空位
    const descriptor = Object.getOwnPropertyDescriptor(arr, "1");
    return descriptor === undefined;
}


// 测试点55：验证Symbol作为属性名的不可枚举属性描述符
export function Fn55_testSymbolNonEnumerableProp() {
    const sym = Symbol("hidden");
    const obj = {};
    Object.defineProperty(obj, sym, { value: "hiddenVal", enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, sym);
    return descriptor.value === "hiddenVal" && descriptor.enumerable === false;
}

// 测试点56：验证不可配置数据属性在严格模式下修改抛错（try-catch验证）
export function Fn56_testNonWritableStrictModeError() {
    'use strict';
    const obj = {};
    Object.defineProperty(obj, "strictProp", { value: "val", writable: false });
    try {
        obj.strictProp = "newVal";
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// 测试点57：验证类实例方法的原型属性描述符（非自有属性，返回undefined）
export function Fn57_testClassProtoMethodDescriptor() {
    class TestClass {
        testMethod() {}
    }
    const instance = new TestClass();
    const descriptor = Object.getOwnPropertyDescriptor(instance, "testMethod");
    return descriptor === undefined;
}


// 测试点59：验证对象自有属性描述符的value为null时的正确性
export function Fn59_testDescriptorValueNull() {
    const obj = { nullVal: null };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "nullVal");
    return descriptor.value === null && descriptor.writable === true && descriptor.enumerable === true;
}

// 测试点60：验证可配置数据属性可修改为访问器属性
export function Fn60_testConfigurableDataToAccessor() {
    const obj = { dataProp: "data" };
    let accessorVal = "accessor";
    Object.defineProperty(obj, "dataProp", {
        get() { return accessorVal; },
        set(newVal) { accessorVal = newVal; }
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "dataProp");
    return descriptor.get() === "accessor" && descriptor.value === undefined;
}

// 测试点62：验证类静态方法的描述符（不可枚举、可配置）
export function Fn62_testClassStaticMethodDescriptor() {
    class MyClass {
        static staticMethod() {}
    }
    const descriptor = Object.getOwnPropertyDescriptor(MyClass, "staticMethod");
    return typeof descriptor.value === "function" && descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点63：验证Array.prototype.pop方法的描述符（不可枚举、可配置）
export function Fn63_testArrayPrototypePopDescriptor() {
    const descriptor = Object.getOwnPropertyDescriptor(Array.prototype, "pop");
    return typeof descriptor.value === "function" && descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点67：验证可配置数据属性可修改value（非严格模式）
export function Fn67_testConfigurableDataModifyValue() {
    const obj = { val: 10 };
    obj.val = 20;
    const descriptor = Object.getOwnPropertyDescriptor(obj, "val");
    return descriptor.value === 20 && descriptor.configurable === true;
}

// 测试点69：验证Symbol属性名的可配置访问器属性描述符
export function Fn69_testSymbolConfigurableAccessor() {
    const sym = Symbol("accessor");
    let val = "symVal";
    const obj = {};
    Object.defineProperty(obj, sym, {
        get() { return val; },
        set(newVal) { val = newVal; },
        configurable: true
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, sym);
    return descriptor.get() === "symVal" && descriptor.configurable === true;
}

// 测试点71：验证不可枚举属性在Object.keys中不显示（结合描述符）
export function Fn71_testNonEnumerableNotInObjectKeys() {
    const obj = { a: 1 };
    Object.defineProperty(obj, "b", { value: 2, enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "b");
    const keys = Object.keys(obj);
    return descriptor.enumerable === false && !keys.includes("b");
}

// 测试点72：验证函数对象length属性的描述符（不可写、不可枚举）
export function Fn72_testFunctionLengthDescriptor() {
    function testFunc(a, b) {}
    const descriptor = Object.getOwnPropertyDescriptor(testFunc, "length");
    return descriptor.value === 2 && descriptor.writable === false && descriptor.enumerable === false;
}

// 测试点74：验证可配置访问器属性可修改enumerable
export function Fn74_testConfigurableAccessorModifyEnumerable() {
    let val = "test";
    const obj = { get prop() { return val; } };
    Object.defineProperty(obj, "prop", { enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点76：验证对象自有属性描述符的configurable为true时可删除
export function Fn76_testConfigurablePropDeletable() {
    const obj = { delProp: "canDel" };
    const descriptor1 = Object.getOwnPropertyDescriptor(obj, "delProp");
    delete obj.delProp;
    const descriptor2 = Object.getOwnPropertyDescriptor(obj, "delProp");
    return descriptor1.configurable === true && descriptor2 === undefined;
}

// 测试点78：验证数组自有属性（非索引）的描述符
export function Fn78_testArrayNonIndexOwnProp() {
    const arr = [1, 2];
    arr.customProp = "custom";
    const descriptor = Object.getOwnPropertyDescriptor(arr, "customProp");
    return descriptor.value === "custom" && descriptor.enumerable === true && descriptor.writable === true;
}


// 测试点80：验证可配置数据属性可修改为不可写
export function Fn80_testConfigurableDataToNonWritable() {
    const obj = { val: 10 };
    Object.defineProperty(obj, "val", { writable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "val");
    return descriptor.writable === false && descriptor.configurable === true;
}

// 测试点82：验证类实例的不可枚举自有属性描述符
export function Fn82_testClassInstanceNonEnumerableProp() {
    class TestClass {
        constructor() {
            Object.defineProperty(this, "hiddenProp", { value: "hidden", enumerable: false });
        }
    }
    const instance = new TestClass();
    const descriptor = Object.getOwnPropertyDescriptor(instance, "hiddenProp");
    return descriptor.value === "hidden" && descriptor.enumerable === false;
}

// 测试点84：验证不可配置数据属性无法修改为访问器属性（try-catch）
export function Fn84_testNonConfigurableDataToAccessor() {
    const obj = {};
    Object.defineProperty(obj, "fixedData", { value: "data", configurable: false });
    try {
        Object.defineProperty(obj, "fixedData", { get() { return "accessor"; } });
        return false;
    } catch (e) {
        const descriptor = Object.getOwnPropertyDescriptor(obj, "fixedData");
        return e instanceof TypeError && descriptor.value === "data";
    }
}

// 测试点87：验证可配置访问器属性可删除
export function Fn87_testConfigurableAccessorDeletable() {
    let val = "delAccessor";
    const obj = { get prop() { return val; } };
    const deleteResult = delete obj.prop;
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return deleteResult && descriptor === undefined;
}

// 测试点90：验证不可枚举访问器属性在Object.getOwnPropertyNames中显示
export function Fn90_testNonEnumerableAccessorInGetOwnNames() {
    let val = "test";
    const obj = {};
    Object.defineProperty(obj, "hiddenAccessor", {
        get() { return val; },
        enumerable: false
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "hiddenAccessor");
    const names = Object.getOwnPropertyNames(obj);
    return descriptor.enumerable === false && names.includes("hiddenAccessor");
}

// 测试点92：验证类私有字段（#field）的描述符（不可访问，返回undefined）
export function Fn92_testClassPrivateFieldDescriptor() {
    class TestClass {
        #privateField = "privateVal";
    }
    const instance = new TestClass();
    const descriptor = Object.getOwnPropertyDescriptor(instance, "#privateField");
    return descriptor === undefined;
}

// 测试点93：验证Array.prototype.shift方法的描述符（不可枚举、可配置）
export function Fn93_testArrayPrototypeShiftDescriptor() {
    const descriptor = Object.getOwnPropertyDescriptor(Array.prototype, "shift");
    return typeof descriptor.value === "function" && descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点94：验证不可配置数据属性在Object.freeze后描述符不变
export function Fn94_testNonConfigurableAfterFreeze() {
    const obj = {};
    Object.defineProperty(obj, "prop", { value: "val", configurable: false });
    Object.freeze(obj);
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.value === "val" && descriptor.configurable === false;
}

// 测试点97：验证可配置数据属性修改enumerable为false后生效
export function Fn97_testConfigurableDataModifyEnumerable() {
    const obj = { val: 10 };
    Object.defineProperty(obj, "val", { enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "val");
    return descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点99：验证Symbol作为属性名的不可配置数据属性描述符
export function Fn99_testSymbolNonConfigurableData() {
    const sym = Symbol("fixedData");
    const obj = {};
    Object.defineProperty(obj, sym, { value: "symData", configurable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, sym);
    return descriptor.value === "symData" && descriptor.configurable === false;
}

// 测试点101：验证不可枚举属性在Object.values中不显示（结合描述符）
export function Fn101_testNonEnumerableNotInObjectValues() {
    const obj = { a: 1 };
    Object.defineProperty(obj, "b", { value: 2, enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "b");
    const values = Object.values(obj);
    return descriptor.enumerable === false && !values.includes(2);
}

// 测试点102：验证箭头函数name属性的描述符（不可写、不可枚举）
export function Fn102_testArrowFunctionNameDescriptor() {
    const arrowFunc = () => {};
    const descriptor = Object.getOwnPropertyDescriptor(arrowFunc, "name");
    return descriptor.value === "" && descriptor.writable === false && descriptor.enumerable === false;
}

// 测试点104：验证可配置访问器属性修改configurable为false后生效
export function Fn104_testConfigurableAccessorModifyConfigurable() {
    let val = "test";
    const obj = { get prop() { return val; } };
    Object.defineProperty(obj, "prop", { configurable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.configurable === false && typeof descriptor.get === "function";
}

// 测试点106：验证对象自有属性描述符的value为NaN时的正确性
export function Fn106_testDescriptorValueNaN() {
    const obj = { nanVal: NaN };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "nanVal");
    return Number.isNaN(descriptor.value) && descriptor.writable === true && descriptor.enumerable === true;
}

// 测试点108：验证数组自有属性（Symbol键）的描述符
export function Fn108_testArraySymbolOwnProp() {
    const arr = [1, 2];
    const sym = Symbol("arrSym");
    arr[sym] = "symVal";
    const descriptor = Object.getOwnPropertyDescriptor(arr, sym);
    return descriptor.value === "symVal" && descriptor.enumerable === true;
}

// 测试点110：验证可配置数据属性修改为不可配置后无法再修改
export function Fn110_testConfigurableToNonConfigurable() {
    const obj = { val: 10 };
    Object.defineProperty(obj, "val", { configurable: false });
    try {
        Object.defineProperty(obj, "val", { writable: false });
        return false;
    } catch (e) {
        const descriptor = Object.getOwnPropertyDescriptor(obj, "val");
        return e instanceof TypeError && descriptor.configurable === false;
    }
}

// 测试点112：验证类实例的可写访问器属性描述符
export function Fn112_testClassInstanceWritableAccessor() {
    class TestClass {
        constructor() {
            let val = "init";
            Object.defineProperty(this, "writableAcc", {
                get() { return val; },
                set(newVal) { val = newVal; },
                enumerable: true
            });
        }
    }
    const instance = new TestClass();
    instance.writableAcc = "newVal";
    const descriptor = Object.getOwnPropertyDescriptor(instance, "writableAcc");
    return descriptor.get() === "newVal" && typeof descriptor.set === "function";
}

// 测试点114：验证不可配置访问器属性无法修改getter（严格模式）
export function Fn114_testNonConfigurableAccessorStrictMode() {
    'use strict';
    let val = "fixed";
    const obj = {};
    Object.defineProperty(obj, "noChange", {
        get() { return val; },
        configurable: false
    });
    try {
        Object.defineProperty(obj, "noChange", { get() { return "changed"; } });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// 测试点117：验证可配置访问器属性删除后重新定义
export function Fn117_testConfigurableAccessorDeleteAndRedefine() {
    let val1 = "old";
    const obj = { get prop() { return val1; } };
    delete obj.prop;
    let val2 = "new";
    Object.defineProperty(obj, "prop", { get() { return val2; } });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.get() === "new" && descriptor.configurable === true;
}

// 测试点120：验证不可枚举属性在Object.getOwnPropertyDescriptors中显示
export function Fn120_testNonEnumerableInGetOwnDescriptors() {
    const obj = { a: 1 };
    Object.defineProperty(obj, "b", { value: 2, enumerable: false });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return descriptors.b.value === 2 && descriptors.b.enumerable === false;
}

// 测试点122：验证可配置数据属性修改为不可枚举后，在for...in中不可见
export function Fn122_testConfigurableToNonEnumerable() {
    const obj = { prop: "test" };
    Object.defineProperty(obj, "prop", { enumerable: false });
    let found = false;
    for (const key in obj) {
        if (key === "prop") found = true;
    }
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return !found && descriptor.enumerable === false;
}

// 测试点123：验证Array.prototype.unshift方法的描述符（不可枚举、可配置）
export function Fn123_testArrayPrototypeUnshiftDescriptor() {
    const descriptor = Object.getOwnPropertyDescriptor(Array.prototype, "unshift");
    return typeof descriptor.value === "function" && descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点124：验证冻结对象上不可配置属性的描述符（writable为false）
export function Fn124_testFrozenObjectNonConfigurable() {
    const obj = { prop: "val" };
    Object.freeze(obj);
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.configurable === false && descriptor.writable === false;
}

// 测试点127：验证可配置数据属性的value为Infinity时的描述符
export function Fn127_testDescriptorValueInfinity() {
    const obj = { infVal: Infinity };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "infVal");
    return descriptor.value === Infinity && descriptor.writable === true;
}

// 测试点129：验证Symbol作为属性名的可枚举访问器属性描述符
export function Fn129_testSymbolEnumerableAccessor() {
    const sym = Symbol("enumerable");
    let val = "symVal";
    const obj = {};
    Object.defineProperty(obj, sym, {
        get() { return val; },
        set(newVal) { val = newVal; },
        enumerable: true
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, sym);
    return descriptor.enumerable === true && descriptor.get() === "symVal";
}

// 测试点131：验证不可枚举属性在Object.entries中不显示（结合描述符）
export function Fn131_testNonEnumerableNotInObjectEntries() {
    const obj = { a: 1 };
    Object.defineProperty(obj, "b", { value: 2, enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "b");
    const entries = Object.entries(obj);
    return descriptor.enumerable === false && !entries.some(([k, v]) => k === "b" && v === 2);
}

// 测试点132：验证绑定函数name属性的描述符（不可写、不可枚举）
export function Fn132_testBoundFunctionNameDescriptor() {
    function original() {}
    const bound = original.bind(null);
    const descriptor = Object.getOwnPropertyDescriptor(bound, "name");
    return descriptor.writable === false;
}

// 测试点136：验证对象自有属性描述符的value为负无穷时的正确性
export function Fn136_testDescriptorValueNegativeInfinity() {
    const obj = { negInfVal: -Infinity };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "negInfVal");
    return descriptor.value === -Infinity && descriptor.writable === true;
}

// 测试点138：验证数组的Symbol.species属性描述符（不可枚举、可配置）
export function Fn138_testArraySymbolSpeciesDescriptor() {
    const descriptor = Object.getOwnPropertyDescriptor(Array, Symbol.species);
    return typeof descriptor.get === "function" && descriptor.enumerable === false;
}

// 测试点140：验证可配置数据属性修改为不可配置后value保持不变
export function Fn140_testConfigurableToNonConfigurableValue() {
    const obj = { val: "original" };
    Object.defineProperty(obj, "val", { configurable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "val");
    return descriptor.value === "original" && descriptor.configurable === false;
}

// 测试点142：验证类的原型方法描述符（在原型上，非实例自有）
export function Fn142_testClassPrototypeMethodDescriptor() {
    class TestClass {
        protoMethod() {}
    }
    const descriptor = Object.getOwnPropertyDescriptor(TestClass.prototype, "protoMethod");
    return typeof descriptor.value === "function" && descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点144：验证不可配置访问器属性在严格模式下无法删除
export function Fn144_testNonConfigurableAccessorDeleteStrict() {
    'use strict';
    let val = "test";
    const obj = {};
    Object.defineProperty(obj, "prop", {
        get() { return val; },
        configurable: false
    });
    try {
        delete obj.prop;
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}


// 测试点147：验证可配置访问器属性删除后重新定义为数据属性
export function Fn147_testAccessorDeleteRedefineData() {
    let val = "accessor";
    const obj = { get prop() { return val; } };
    delete obj.prop;
    obj.prop = "data";
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.value === "data" && descriptor.get === undefined;
}

// 测试点150：验证不可枚举属性在JSON.stringify中不被序列化
export function Fn150_testNonEnumerableNotInStringify() {
    const obj = { a: 1 };
    Object.defineProperty(obj, "b", { value: 2, enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "b");
    const json = JSON.stringify(obj);
    return descriptor.enumerable === false && !json.includes("b");
}

// 测试点151：验证Error对象message属性的描述符（可写、不可枚举）
export function Fn151_testErrorMessageDescriptor() {
    const error = new Error("test");
    const descriptor = Object.getOwnPropertyDescriptor(error, "message");
    error.message = "new message";
    return descriptor.writable === true && descriptor.enumerable === false && error.message === "new message";
}

// 测试点153：验证Array.prototype.slice方法的描述符（不可枚举、可配置）
export function Fn153_testArrayPrototypeSliceDescriptor() {
    const descriptor = Object.getOwnPropertyDescriptor(Array.prototype, "slice");
    return typeof descriptor.value === "function" && descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点154：验证密封对象上可配置属性的描述符（configurable变为false）
export function Fn154_testSealedObjectProperty() {
    const obj = { prop: "val" };
    Object.seal(obj);
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.configurable === false && descriptor.writable === true;
}

// 测试点157：验证对象自有属性描述符的value为函数时的正确性
export function Fn157_testDescriptorValueFunction() {
    const obj = { func: () => "test" };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "func");
    return typeof descriptor.value === "function" && descriptor.value() === "test" && descriptor.writable === true;
}

// 测试点161：验证不可枚举属性在Object.getOwnPropertySymbols中不显示（非Symbol键）
export function Fn161_testNonEnumerableInGetOwnSymbols() {
    const obj = {};
    Object.defineProperty(obj, "nonSym", { value: 1, enumerable: false });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 0;
}

// 测试点162：验证生成器函数name属性的描述符（不可写、不可枚举）
export function Fn162_testGeneratorFunctionNameDescriptor() {
    function* genFunc() {}
    const descriptor = Object.getOwnPropertyDescriptor(genFunc, "name");
    return descriptor.writable === false && descriptor.enumerable === false;
}

// 测试点164：验证可配置访问器属性修改为不可枚举后在for...in中不可见
export function Fn164_testAccessorToNonEnumerable() {
    let val = "test";
    const obj = { get prop() { return val; } };
    Object.defineProperty(obj, "prop", { enumerable: false });
    let found = false;
    for (const key in obj) {
        if (key === "prop") found = true;
    }
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return !found && descriptor.enumerable === false;
}

// 测试点166：验证对象自有属性描述符的value为对象时的正确性
export function Fn166_testDescriptorValueObject() {
    const nested = { a: 1 };
    const obj = { nested: nested };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "nested");
    return descriptor.value === nested && descriptor.writable === true && descriptor.enumerable === true;
}

// 测试点170：验证可配置数据属性修改为不可配置后仍可修改值（可写的情况下）
export function Fn170_testNonConfigurableWritableValue() {
    const obj = { val: "original" };
    Object.defineProperty(obj, "val", { configurable: false });
    obj.val = "modified";
    const descriptor = Object.getOwnPropertyDescriptor(obj, "val");
    return descriptor.value === "modified" && descriptor.configurable === false && descriptor.writable === true;
}

// 测试点172：验证类的静态访问器属性描述符
export function Fn172_testClassStaticAccessorDescriptor() {
    let staticVal = "static";
    class TestClass {
        static get staticAcc() { return staticVal; }
        static set staticAcc(val) { staticVal = val; }
    }
    const descriptor = Object.getOwnPropertyDescriptor(TestClass, "staticAcc");
    TestClass.staticAcc = "newStatic";
    return descriptor.get() === "newStatic" && typeof descriptor.set === "function";
}

// 测试点177：验证可配置访问器属性重新定义为不可写数据属性
export function Fn177_testAccessorRedefineAsNonWritableData() {
    let val = "accessor";
    const obj = { get prop() { return val; } };
    Object.defineProperty(obj, "prop", { value: "data", writable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.value === "data" && descriptor.writable === false && descriptor.get === undefined;
}

// 测试点180：验证不可枚举属性在Object.assign时不会被复制
export function Fn180_testNonEnumerableNotInObjectAssign() {
    const source = { a: 1 };
    Object.defineProperty(source, "b", { value: 2, enumerable: false });
    const target = Object.assign({}, source);
    const descriptor = Object.getOwnPropertyDescriptor(source, "b");
    return descriptor.enumerable === false && Object.getOwnPropertyDescriptor(target, "b") === undefined;
}


// 测试点182：验证可配置数据属性修改为不可写后在严格模式下修改抛错
export function Fn182_testNonWritableStrictModeThrow() {
    'use strict';
    const obj = { val: "original" };
    Object.defineProperty(obj, "val", { writable: false });
    try {
        obj.val = "modified";
        return false;
    } catch (e) {
        return e instanceof TypeError && obj.val === "original";
    }
}

// 测试点183：验证Array.prototype.filter方法的描述符（不可枚举、可配置）
export function Fn183_testArrayPrototypeFilterDescriptor() {
    const descriptor = Object.getOwnPropertyDescriptor(Array.prototype, "filter");
    return typeof descriptor.value === "function" && descriptor.enumerable === false && descriptor.configurable === true;
}

// 测试点184：验证冻结对象上访问器属性的描述符（configurable和writable为false）
export function Fn184_testFrozenAccessorProperty() {
    let val = "test";
    const obj = {
        get prop() { return val; },
        set prop(newVal) { val = newVal; }
    };
    Object.freeze(obj);
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.configurable === false && descriptor.writable === undefined;
}


// 测试点187：验证对象自有属性描述符的value为数组时的正确性
export function Fn187_testDescriptorValueArray() {
    const arr = [1, 2, 3];
    const obj = { list: arr };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "list");
    return descriptor.value === arr && descriptor.value.length === 3 && descriptor.writable === true;
}


// 测试点189：验证Symbol作为属性名的不可配置访问器属性描述符
export function Fn189_testSymbolNonConfigurableAccessor() {
    const sym = Symbol("nonConfigurable");
    let val = "test";
    const obj = {};
    Object.defineProperty(obj, sym, {
        get() { return val; },
        set(newVal) { val = newVal; },
        configurable: false
    });
    const descriptor = Object.getOwnPropertyDescriptor(obj, sym);
    return descriptor.configurable === false && typeof descriptor.get === "function";
}

// 测试点191：验证不可枚举Symbol属性在Object.getOwnPropertySymbols中显示
export function Fn191_testNonEnumerableSymbolInGetOwnSymbols() {
    const sym = Symbol("nonEnumerable");
    const obj = {};
    Object.defineProperty(obj, sym, { value: 1, enumerable: false });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点192：验证异步函数name属性的描述符（不可写、不可枚举）
export function Fn192_testAsyncFunctionNameDescriptor() {
    async function asyncFunc() {}
    const descriptor = Object.getOwnPropertyDescriptor(asyncFunc, "name");
    return descriptor.writable === false && descriptor.enumerable === false;
}

// 测试点193：验证WeakSet实例的原型属性不可通过实例获取描述符
export function Fn193_testWeakSetPrototypeProps() {
    const weakSet = new WeakSet();
    const descriptor = Object.getOwnPropertyDescriptor(weakSet, "add");
    return descriptor === undefined;
}

// 测试点194：验证可配置访问器属性修改为不可配置后仍可修改值
export function Fn194_testNonConfigurableAccessorModifyValue() {
    let val = "original";
    const obj = {
        get prop() { return val; },
        set prop(newVal) { val = newVal; }
    };
    Object.defineProperty(obj, "prop", { configurable: false });
    obj.prop = "modified";
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.get() === "modified" && descriptor.configurable === false;
}

// 测试点196：验证对象自有属性描述符的value为正则表达式时的正确性
export function Fn196_testDescriptorValueRegExp() {
    const reg = /test/;
    const obj = { pattern: reg };
    const descriptor = Object.getOwnPropertyDescriptor(obj, "pattern");
    return descriptor.value === reg && descriptor.value.test("test") && descriptor.writable === true;
}

// 测试点198：验证数组的Symbol.isConcatSpreadable属性描述符（可写、可枚举）
export function Fn198_testArraySymbolIsConcatSpreadable() {
    const arr = [1, 2];
    const descriptor = Object.getOwnPropertyDescriptor(arr, Symbol.isConcatSpreadable);
    arr[Symbol.isConcatSpreadable] = false;
    const newDescriptor = Object.getOwnPropertyDescriptor(arr, Symbol.isConcatSpreadable);
    return descriptor === undefined && newDescriptor.value === false && newDescriptor.writable === true;
}

// 测试点199：验证WeakMap实例的原型属性不可通过实例获取描述符
export function Fn199_testWeakMapPrototypeProps() {
    const weakMap = new WeakMap();
    const descriptor = Object.getOwnPropertyDescriptor(weakMap, "set");
    return descriptor === undefined;
}

// 测试点200：验证不可配置且不可写的数据属性无法修改
export function Fn200_testNonConfigurableNonWritable() {
    const obj = {};
    Object.defineProperty(obj, "val", { value: "fixed", writable: false, configurable: false });
    try {
        obj.val = "changed";
    } catch (e) {}
    const descriptor = Object.getOwnPropertyDescriptor(obj, "val");
    return descriptor.value === "fixed" && descriptor.writable === false && descriptor.configurable === false;
}

// 测试点202：验证类的私有方法无法通过getOwnPropertyDescriptor获取
export function Fn202_testClassPrivateMethodDescriptor() {
    class TestClass {
        #privateMethod() { return "private"; }
    }
    const instance = new TestClass();
    const descriptor = Object.getOwnPropertyDescriptor(instance, "#privateMethod");
    return descriptor === undefined;
}

// 测试点204：验证不可配置访问器属性在严格模式下修改setter抛错
export function Fn204_testNonConfigurableAccessorModifySetterStrict() {
    'use strict';
    let val = "test";
    const obj = {};
    Object.defineProperty(obj, "prop", {
        get() { return val; },
        set(newVal) { val = newVal; },
        configurable: false
    });
    try {
        Object.defineProperty(obj, "prop", { set(newVal) { val = `new:${newVal}`; } });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// 测试点207：验证可配置访问器属性重新定义为不可枚举数据属性
export function Fn207_testAccessorRedefineAsNonEnumerableData() {
    let val = "accessor";
    const obj = { get prop() { return val; } };
    Object.defineProperty(obj, "prop", { value: "data", enumerable: false });
    const descriptor = Object.getOwnPropertyDescriptor(obj, "prop");
    return descriptor.value === "data" && descriptor.enumerable === false && descriptor.get === undefined;
}

// 测试点210：验证不可枚举属性在Object.getOwnPropertyNames中可见
export function Fn210_testNonEnumerableInGetOwnNames() {
    const obj = { a: 1 };
    Object.defineProperty(obj, "b", { value: 2, enumerable: false });
    const names = Object.getOwnPropertyNames(obj);
    return names.includes("a") && names.includes("b");
}




