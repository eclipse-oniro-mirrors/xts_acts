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
// 测试点1：检测未被修改的普通对象（未冻结）
export function Fn01_testNormalObjectNotFrozen() {
    const normalObj = { name: "test", age: 20 };
    return Object.isFrozen(normalObj) === false;
}

// 测试点2：检测通过 Object.freeze() 冻结后的对象
export function Fn02_testFrozenObject() {
    const obj = { id: 1, value: "frozen" };
    Object.freeze(obj);
    return Object.isFrozen(obj) === true;
}

// 测试点3：检测非对象参数（ES2015+ 特性）
export function Fn03_testNonObjectParameter() {
    const str = "hello";
    const num = 123;
    const bool = true;
    return Object.isFrozen(str) && Object.isFrozen(num) && Object.isFrozen(bool);
}

// 测试点7：检测空对象冻结后是否被识别
export function Fn07_testFrozenEmptyObject() {
    const emptyObj = {};
    Object.freeze(emptyObj);
    return Object.isFrozen(emptyObj) === true;
}

// 测试点8：检测冻结对象的原型属性不影响冻结状态
export function Fn08_testFrozenObjPrototype() {
    const parent = { p: "parent" };
    const child = Object.create(parent);
    Object.freeze(child);
    parent.p = "changed"; // 修改原型属性，不影响子对象冻结状态
    return Object.isFrozen(child) && child.p === "changed";
}

// 测试点9：检测冻结含访问器属性的对象
export function Fn09_testFrozenObjWithAccessor() {
    let val = 5;
    const obj = {
        get num() { return val; },
        set num(newVal) { val = newVal; }
    };
    Object.freeze(obj);
    obj.num = 10; // 尝试修改访问器关联值
    return Object.isFrozen(obj) && obj.num === 10; // 访问器本身未被破坏，值可改
}

// 测试点10：检测嵌套对象冻结（仅外层冻结，内层未冻结）
export function Fn10_testNestedObjFreeze() {
    const nestedObj = { outer: { inner: "value" } };
    Object.freeze(nestedObj);
    nestedObj.outer.inner = "modified"; // 内层对象未冻结，可修改
    return Object.isFrozen(nestedObj) && nestedObj.outer.inner === "modified";
}

// 测试点11：检测冻结后重新配置属性（应失败）
export function Fn11_testReconfigureFrozenProp() {
    const obj = { prop: 100 };
    Object.freeze(obj);
    try {
        Object.defineProperty(obj, "prop", { writable: true }); // 尝试重新配置
        return false; // 若未抛错，测试失败
    } catch (e) {
        return Object.isFrozen(obj); // 抛错则验证冻结状态，测试通过
    }
}

// 测试点14：检测冻结后Object.isExtensible()的返回值（应返回false）
export function Fn14_testFrozenObjIsExtensible() {
    const obj = { a: 1 };
    Object.freeze(obj);
    return Object.isFrozen(obj) && Object.isExtensible(obj) === false;
}

// 测试点15：检测冻结后Object.getOwnPropertyDescriptors()的属性配置
export function Fn15_testFrozenPropDescriptors() {
    const obj = { b: 2 };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, "b");
    // 冻结后属性应不可写、不可配置
    return Object.isFrozen(obj) && desc.writable === false && desc.configurable === false;
}

// 测试点16：检测null和undefined作为参数（ES2015+ 视为不可变，返回true）
export function Fn16_testNullUndefinedParameter() {
    return Object.isFrozen(null) && Object.isFrozen(undefined);
}

// 测试点17：检测冻结对象的属性枚举性（冻结不改变枚举性）
export function Fn17_testFrozenPropEnumerability() {
    const obj = Object.defineProperty({}, "c", {
        value: 3,
        enumerable: false, // 初始设为不可枚举
        writable: true,
        configurable: true
    });
    Object.freeze(obj);
    const keys = Object.keys(obj); // 不可枚举属性不应被获取
    return Object.isFrozen(obj) && keys.includes("c") === false;
}

// 测试点23：检测冻结对象的toString()方法是否正常（冻结不影响原型方法）
export function Fn23_testFrozenObjToString() {
    const obj = { name: "obj" };
    Object.freeze(obj);
    const str = obj.toString();
    return Object.isFrozen(obj) && str === "[object Object]";
}

// 测试点24：检测冻结含Date属性的对象
export function Fn24_testFrozenObjWithDate() {
    const date = new Date();
    const obj = { time: date };
    Object.freeze(obj);
    obj.time.setFullYear(2025); // Date对象本身可变，仅引用不可改
    return Object.isFrozen(obj) && obj.time.getFullYear() === 2025;
}

// 测试点25：检测冻结后Object.keys()获取属性（枚举性不变）
export function Fn25_testFrozenObjObjectKeys() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    const keys = Object.keys(obj);
    return Object.isFrozen(obj) && keys.length === 2 && keys.includes("a") && keys.includes("b");
}

// 测试点26：检测冻结含RegExp属性的对象
export function Fn26_testFrozenObjWithRegExp() {
    const reg = /test/;
    const obj = { pattern: reg };
    Object.freeze(obj);
    obj.pattern.lastIndex = 5; // RegExp本身可变，仅引用不可改
    return Object.isFrozen(obj) && obj.pattern.lastIndex === 5;
}

// 测试点27：检测冻结对象的hasOwnProperty()方法（正常生效）
export function Fn27_testFrozenObjHasOwnProperty() {
    const obj = { prop: "val" };
    Object.freeze(obj);
    return Object.isFrozen(obj) && obj.hasOwnProperty("prop") && !obj.hasOwnProperty("nonexist");
}

// 测试点29：检测冻结后Object.getPrototypeOf()获取原型（原型引用不变）
export function Fn29_testFrozenObjGetPrototype() {
    const proto = { parent: "val" };
    const obj = Object.create(proto);
    Object.freeze(obj);
    const objProto = Object.getPrototypeOf(obj);
    return Object.isFrozen(obj) && objProto === proto;
}

// 测试点30：检测冻结含Map属性的对象
export function Fn30_testFrozenObjWithMap() {
    const map = new Map([["key", "value"]]);
    const obj = { store: map };
    Object.freeze(obj);
    obj.store.set("key", "newVal"); // Map本身可变，仅引用不可改
    return Object.isFrozen(obj) && obj.store.get("key") === "newVal";
}

// 测试点32：检测冻结含Set属性的对象
export function Fn32_testFrozenObjWithSet() {
    const set = new Set(["a"]);
    const obj = { collection: set };
    Object.freeze(obj);
    obj.collection.add("b"); // Set本身可变，仅引用不可改
    return Object.isFrozen(obj) && obj.collection.has("b");
}

// 测试点35：检测冻结对象的属性描述符中value值正确性
export function Fn35_testFrozenObjPropDescValue() {
    const obj = { prop: "testValue" };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, "prop");
    return Object.isFrozen(obj) && desc.value === "testValue";
}

// 测试点37：检测冻结对象的原型链修改（冻结不影响原型链上层）
export function Fn37_testFrozenObjPrototypeChain() {
    const grandParent = { g: "gVal" };
    const parent = Object.create(grandParent);
    const child = Object.create(parent);
    Object.freeze(child);
    grandParent.g = "newGVal"; // 上层原型可改
    return Object.isFrozen(child) && child.g === "newGVal";
}

// 测试点40：检测冻结含嵌套数组的对象（仅外层冻结，内层数组元素可改）
export function Fn40_testFrozenObjWithNestedArray() {
    const obj = { nested: [1, [2, 3]] };
    Object.freeze(obj);
    obj.nested[0] = 10;
    obj.nested[1][0] = 20;
    return Object.isFrozen(obj) && obj.nested[0] === 10 && obj.nested[1][0] === 20;
}

// 测试点43：检测冻结后Object.getOwnPropertyNames()获取属性（包含不可枚举）
export function Fn43_testFrozenObjGetOwnNames() {
    const obj = {};
    Object.defineProperty(obj, "enumProp", { value: 1, enumerable: true });
    Object.defineProperty(obj, "nonEnumProp", { value: 2, enumerable: false });
    Object.freeze(obj);
    const names = Object.getOwnPropertyNames(obj);
    return Object.isFrozen(obj) && names.includes("enumProp") && names.includes("nonEnumProp");
}

// 测试点47：检测冻结对象与Object.isSealed()的状态关联（冻结对象一定是密封的）
export function Fn47_testFrozenObjIsSealed() {
    const obj = { key: "val" };
    Object.freeze(obj);
    return Object.isFrozen(obj) && Object.isSealed(obj) === true;
}

// 测试点53：检测冻结对象的属性描述符中enumerable值正确性
export function Fn53_testFrozenObjPropDescEnumerable() {
    const obj = Object.defineProperty({}, "prop", { value: 5, enumerable: true });
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, "prop");
    return Object.isFrozen(obj) && desc.enumerable === true;
}

// 测试点54：检测冻结含Date实例且修改时间的对象
export function Fn54_testFrozenObjWithDateModify() {
    const date = new Date("2024-01-01");
    const obj = { time: date };
    Object.freeze(obj);
    obj.time.setMonth(5); // 修改月份（6月）
    return Object.isFrozen(obj) && obj.time.getMonth() === 5;
}

// 测试点57：检测冻结对象与Object.preventExtensions()的状态关联（冻结对象一定不可拓展）
export function Fn57_testFrozenObjPreventExt() {
    const obj = { key: "val" };
    Object.freeze(obj);
    return Object.isFrozen(obj) && Object.isExtensible(obj) === false;
}

// 测试点61：检测冻结对象的属性描述符中getter/setter是否保留（访问器属性）
export function Fn61_testFrozenObjAccessorDescPreserve() {
    let num = 10;
    const obj = {
        get num() { return num; },
        set num(newVal) { num = newVal; }
    };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, "num");
    obj.num = 20;
    return Object.isFrozen(obj) && desc.get !== undefined && desc.set !== undefined && obj.num === 20;
}

// 测试点68：检测冻结含Date且重置时间的对象
export function Fn68_testFrozenObjWithDateReset() {
    const date = new Date();
    const originalTime = date.getTime();
    const obj = { time: date };
    Object.freeze(obj);
    obj.time.setTime(originalTime + 3600000); // 加1小时
    return Object.isFrozen(obj) && obj.time.getTime() === originalTime + 3600000;
}

// 测试点75：检测冻结含Symbol作为原型属性的对象
export function Fn75_testFrozenObjWithSymbolProto() {
    const symProtoKey = Symbol("protoKey");
    const proto = { [symProtoKey]: "protoVal" };
    const obj = Object.create(proto);
    Object.freeze(obj);
    proto[symProtoKey] = "newProtoVal"; // 原型属性可改
    return Object.isFrozen(obj) && obj[symProtoKey] === "newProtoVal";
}

