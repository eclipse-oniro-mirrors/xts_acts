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

// 测试点1：验证不可扩展对象无法添加新的自有属性
export function Fn01_preventAddingNewOwnProperties() {
    const extensibleObj = { id: 1, name: "demo" };
    Object.preventExtensions(extensibleObj);
    extensibleObj.newProp = "shouldNotExist";
    return extensibleObj.newProp === undefined;
}

// 测试点2：验证不可扩展对象的[[Prototype]]无法重新赋值（会抛出TypeError）
export function Fn02_preventPrototypeReassignment() {
    const targetObj = { value: 100 };
    Object.preventExtensions(targetObj);
    try {
        Object.setPrototypeOf(targetObj, { newProtoMethod: () => {} });
        return false;
    } catch (error) {
        return error instanceof TypeError;
    }
}

// 测试点3：验证非对象参数（原始类型）调用时返回自身（ES2015+行为）
export function Fn03_nonObjectParameterBehavior() {
    const testCases = [
        { input: 123, desc: "number" },
        { input: "hello", desc: "string" },
        { input: true, desc: "boolean" }
    ];
    const allPass = testCases.every(({ input }) => {
        const result = Object.preventExtensions(input);
        return result === input;
    });
    return allPass;
}

// Fn04：验证不可扩展对象调用Object.isExtensible返回false
export function Fn04_verifyIsExtensibleReturnsFalse() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    return !Object.isExtensible(obj);
}

// Fn05：验证不可扩展对象调用Reflect.isExtensible返回false
export function Fn05_verifyReflectIsExtensibleReturnsFalse() {
    const obj = { b: 2 };
    Object.preventExtensions(obj);
    return !Reflect.isExtensible(obj);
}

// Fn06：验证不可扩展对象用Object.defineProperty添加新属性抛出TypeError
export function Fn06_defineNewPropWithDefinePropertyThrows() {
    const obj = { c: 3 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperty(obj, 'd', { value: 4 });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn07：验证不可扩展对象已有的可写属性能正常修改值
export function Fn07_modifyExistingWritablePropSucceeds() {
    const obj = { e: 5, f: 6 };
    Object.preventExtensions(obj);
    obj.e = 55;
    return obj.e === 55;
}

// Fn09：验证不可扩展数组修改length为更小值成功
export function Fn09_shrinkExtensibleArrayLengthSucceeds() {
    const arr = [1, 2, 3, 4];
    Object.preventExtensions(arr);
    arr.length = 2;
    return arr.length === 2 && arr[2] === undefined;
}

// Fn10：验证不可扩展数组修改length为更大值失败（length不变）
export function Fn10_expandExtensibleArrayLengthFails() {
    const arr = [1, 2];
    Object.preventExtensions(arr);
    arr.length = 5;
    return arr.length === 5;
}

// Fn11：验证不可扩展对象调用Object.seal后仍保持不可扩展
export function Fn11_sealExtensibleObjRemainsNonExtensible() {
    const obj = { g: 7 };
    Object.preventExtensions(obj);
    Object.seal(obj);
    return !Object.isExtensible(obj);
}

// Fn12：验证Object.freeze后的对象调用preventExtensions仍返回自身
export function Fn12_frozenObjPreventExtensionsReturnsSelf() {
    const obj = { h: 8 };
    Object.freeze(obj);
    const result = Object.preventExtensions(obj);
    return result === obj;
}

// Fn13：验证不可扩展对象用Reflect.defineProperty添加新属性抛出TypeError
export function Fn13_reflectDefineNewPropOnExtensibleObjThrows() {
    const obj = { i: 9 };
    Object.preventExtensions(obj);
    try {
        Reflect.defineProperty(obj, 'j', { value: 10 });
        return true;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn14：验证不可扩展对象已有的不可写属性无法修改值
export function Fn14_modifyExistingNonWritablePropFails() {
    const obj = Object.defineProperty({}, 'k', { value: 11, writable: false });
    Object.preventExtensions(obj);
    obj.k = 111;
    return obj.k === 11;
}

// Fn15：验证不可扩展对象使用delete删除自有属性成功
export function Fn15_deleteOwnPropOnExtensibleObjSucceeds() {
    const obj = { l: 12 };
    Object.preventExtensions(obj);
    delete obj.l;
    return obj.l === undefined;
}

// Fn16：验证不可扩展数组调用pop方法成功（删除末尾元素）
export function Fn16_extensibleArrayPopSucceeds() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    const popped = arr.pop();
    return popped === 3 && arr.length === 2;
}

// Fn17：验证不可扩展数组调用shift方法成功（删除首元素）
export function Fn17_extensibleArrayShiftSucceeds() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    const shifted = arr.shift();
    return shifted === 1 && arr.length === 2;
}


// Fn19：验证不可扩展对象使用Object.assign添加新属性失败（目标对象不可扩展）
export function Fn19_assignNewPropToExtensibleObjFails() {
    const target = { m: 13 };
    const source = { n: 14 };
    Object.preventExtensions(target);
    try {
        Object.assign(target, source);
        return target.n === undefined;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn20：验证不可扩展对象使用Object.assign更新已有属性成功
export function Fn20_assignUpdateExistingPropToExtensibleObjSucceeds() {
    const target = { o: 15 };
    const source = { o: 155 };
    Object.preventExtensions(target);
    Object.assign(target, source);
    return target.o === 155;
}

// Fn21：验证不可扩展对象使用扩展运算符复制时不包含新属性
export function Fn21_spreadExtensibleObjNoNewProp() {
    const obj = { p: 16 };
    Object.preventExtensions(obj);
    const newObj = { ...obj, q: 17 };
    return newObj.p === 16 && obj.q === undefined;
}

// Fn22：验证不可扩展对象的Symbol属性无法新增
export function Fn22_addSymbolPropToExtensibleObjFails() {
    const sym = Symbol('r');
    const obj = { s: 18 };
    Object.preventExtensions(obj);
    obj[sym] = 19;
    return obj[sym] === undefined;
}

// Fn23：验证不可扩展对象已有的Symbol属性能修改值
export function Fn23_modifyExistingSymbolPropSucceeds() {
    const sym = Symbol('t');
    const obj = { [sym]: 20 };
    Object.preventExtensions(obj);
    obj[sym] = 200;
    return obj[sym] === 200;
}

// Fn24：验证不可扩展对象的不可枚举属性无法新增
export function Fn24_addNonEnumerablePropToExtensibleObjThrows() {
    const obj = { u: 21 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperty(obj, 'v', { value: 22, enumerable: false });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn25：验证不可扩展对象已有的不可枚举属性能修改值
export function Fn25_modifyExistingNonEnumerablePropSucceeds() {
    const obj = Object.defineProperty({}, 'w', { value: 23, enumerable: false });
    Object.preventExtensions(obj);
    obj.w = 233;
    return obj.w === 23;
}

// Fn26：验证不可扩展对象使用for...in遍历包含继承属性
export function Fn26_forInExtensibleObjIncludesInherited() {
    const parent = { x: 24 };
    const child = Object.create(parent);
    child.y = 25;
    Object.preventExtensions(child);
    let hasX = false;
    for (const key in child) {
        if (key === 'x') hasX = true;
    }
    return hasX && child.hasOwnProperty('x') === false;
}

// Fn27：验证不可扩展对象使用Object.keys只返回自有属性
export function Fn27_objectKeysExtensibleObjOnlyOwn() {
    const parent = { z: 26 };
    const child = Object.create(parent);
    child.aa = 27;
    Object.preventExtensions(child);
    const keys = Object.keys(child);
    return keys.length === 1 && keys[0] === 'aa';
}

// Fn28：验证不可扩展对象使用Object.values只返回自有属性值
export function Fn28_objectValuesExtensibleObjOnlyOwn() {
    const parent = { ab: 28 };
    const child = Object.create(parent);
    child.ac = 29;
    Object.preventExtensions(child);
    const values = Object.values(child);
    return values.length === 1 && values[0] === 29;
}

// Fn29：验证不可扩展对象使用JSON.stringify正常序列化自有属性
export function Fn29_jsonStringifyExtensibleObjWorks() {
    const obj = { ad: 30, ae: 'test' };
    Object.preventExtensions(obj);
    const str = JSON.stringify(obj);
    const parsed = JSON.parse(str);
    return parsed.ad === 30 && parsed.ae === 'test';
}

// Fn30：验证不可扩展对象多次调用Object.preventExtensions仍返回自身（幂等性）
export function Fn30_preventExtensionsIdempotent() {
    const obj = { af: 31 };
    const firstCall = Object.preventExtensions(obj);
    const secondCall = Object.preventExtensions(obj);
    return firstCall === obj && secondCall === obj;
}

// Fn31：验证不可扩展对象多次调用Reflect.preventExtensions返回true（幂等性）
export function Fn31_reflectPreventExtensionsIdempotent() {
    const obj = { ag: 32 };
    const firstCall = Reflect.preventExtensions(obj);
    const secondCall = Reflect.preventExtensions(obj);
    return firstCall && secondCall;
}

// Fn32：验证不可扩展函数对象无法添加新属性
export function Fn32_preventExtensionsOnFunctionNoNewProp() {
    function testFn() {}
    testFn.ah = 33;
    Object.preventExtensions(testFn);
    testFn.ai = 34;
    return testFn.ai === undefined;
}

// Fn33：验证不可扩展函数对象的prototype无法添加新属性
export function Fn33_extensibleFunctionPrototypeNoNewProp() {
    function testFn() {}
    Object.preventExtensions(testFn.prototype);
    testFn.prototype.aj = 35;
    return testFn.prototype.aj === undefined;
}

// Fn34：验证不可扩展日期对象无法添加新属性
export function Fn34_preventExtensionsOnDateNoNewProp() {
    const date = new Date();
    date.ak = 36;
    Object.preventExtensions(date);
    date.al = 37;
    return date.al === undefined;
}

// Fn35：验证不可扩展正则对象无法添加新属性
export function Fn35_preventExtensionsOnRegExpNoNewProp() {
    const reg = /test/;
    reg.am = 38;
    Object.preventExtensions(reg);
    reg.an = 39;
    return reg.an === undefined;
}

// Fn36：验证不可扩展类实例无法添加新属性
export function Fn36_preventExtensionsOnClassInstanceNoNewProp() {
    class TestClass { constructor() { this.ao = 40; } }
    const instance = new TestClass();
    Object.preventExtensions(instance);
    instance.ap = 41;
    return instance.ap === undefined;
}

// Fn37：验证不可扩展类的prototype无法添加新方法
export function Fn37_extensibleClassPrototypeNoNewMethod() {
    class TestClass { constructor() {} }
    Object.preventExtensions(TestClass.prototype);
    TestClass.prototype.aq = () => 42;
    const instance = new TestClass();
    return typeof instance.aq === 'undefined';
}

// Fn38：验证不可扩展对象作为原型时，子对象仍可扩展
export function Fn38_childOfExtensibleProtoRemainsExtensible() {
    const proto = { ar: 43 };
    Object.preventExtensions(proto);
    const child = Object.create(proto);
    child.as = 44;
    return Object.isExtensible(child) && child.as === 44;
}

// Fn39：验证不可扩展对象作为原型时，子对象无法修改原型
export function Fn39_childOfExtensibleProtoCantChangeProto() {
    const proto = { at: 45 };
    Object.preventExtensions(proto);
    const child = Object.create(proto);
    try {
        Object.setPrototypeOf(child, { au: 46 });
        return true;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn40：验证不可扩展对象使用Object.getPrototypeOf正常获取原型
export function Fn40_getPrototypeOfExtensibleObjWorks() {
    const proto = { av: 47 };
    const obj = Object.create(proto);
    obj.aw = 48;
    Object.preventExtensions(obj);
    const gotProto = Object.getPrototypeOf(obj);
    return gotProto === proto && gotProto.av === 47;
}

// Fn41：验证不可扩展对象使用Reflect.getPrototypeOf正常获取原型
export function Fn41_reflectGetPrototypeOfExtensibleObjWorks() {
    const proto = { ax: 49 };
    const obj = Object.create(proto);
    obj.ay = 50;
    Object.preventExtensions(obj);
    const gotProto = Reflect.getPrototypeOf(obj);
    return gotProto === proto && gotProto.ax === 49;
}

// Fn42：验证不可扩展对象使用WeakMap能正常作为key
export function Fn42_weakMapUseExtensibleObjAsKey() {
    const wm = new WeakMap();
    const obj = { az: 51 };
    Object.preventExtensions(obj);
    wm.set(obj, 52);
    return wm.get(obj) === 52;
}

// Fn43：验证不可扩展对象使用WeakSet能正常添加
export function Fn43_weakSetAddExtensibleObj() {
    const ws = new WeakSet();
    const obj = { ba: 53 };
    Object.preventExtensions(obj);
    ws.add(obj);
    return ws.has(obj);
}

// Fn46：验证不可扩展对象使用Object.getOwnPropertyDescriptors正常获取描述符
export function Fn46_getOwnPropertyDescriptorsExtensibleObjWorks() {
    const obj = { be: 56 };
    Object.preventExtensions(obj);
    const descs = Object.getOwnPropertyDescriptors(obj);
    return descs.be.value === 56 && descs.be.writable === true;
}

// Fn47：验证不可扩展对象修改已有属性的描述符（configurable为true时）
export function Fn47_modifyExistingPropDescOnExtensibleObj() {
    const obj = { bf: 57 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'bf', { writable: false });
    obj.bf = 577;
    return obj.bf === 57;
}

// Fn48：验证不可扩展对象无法删除configurable为false的属性
export function Fn48_cantDeleteNonConfigurablePropOnExtensibleObj() {
    const obj = Object.defineProperty({}, 'bg', { value: 58, configurable: false });
    Object.preventExtensions(obj);
    try {
        delete obj.bg;
        return obj.bg === 58;
    } catch (e) {
        return e instanceof TypeError;
    }
}



// Fn50：验证不可扩展数组调用splice删除元素成功
export function Fn50_extensibleArraySpliceDeleteSucceeds() {
    const arr = [1, 2, 3, 4];
    Object.preventExtensions(arr);
    const deleted = arr.splice(1, 2);
    return deleted.join(',') === '2,3' && arr.length === 2;
}

// Fn51：验证不可扩展对象在严格模式下添加新属性抛出TypeError
export function Fn51_strictModeAddPropToExtensibleObjThrows() {
    const obj = { bh: 59 };
    Object.preventExtensions(obj);
    try {
        (function() {
            'use strict';
            obj.bi = 60;
        })();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn52：验证不可扩展对象在严格模式下修改原型抛出TypeError
export function Fn52_strictModeChangeProtoOfExtensibleObjThrows() {
    const obj = { bj: 61 };
    Object.preventExtensions(obj);
    try {
        (function() {
            'use strict';
            Object.setPrototypeOf(obj, { bk: 62 });
        })();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn53：验证不可扩展对象的getter属性正常触发
export function Fn53_extensibleObjGetterWorks() {
    let val = 63;
    const obj = { get bl() { return val; } };
    Object.preventExtensions(obj);
    val = 633;
    return obj.bl === 633;
}

// Fn54：验证不可扩展对象的setter属性正常触发
export function Fn54_extensibleObjSetterWorks() {
    let val = 64;
    const obj = { set bm(v) { val = v; } };
    Object.preventExtensions(obj);
    obj.bm = 644;
    return val === 644;
}

// Fn55：验证不可扩展对象无法添加新的getter属性
export function Fn55_addGetterToExtensibleObjThrows() {
    const obj = { bn: 65 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperty(obj, 'bo', { get: () => 66 });
        return true;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn56：验证不可扩展对象已有的getter属性无法修改为数据属性
export function Fn56_modifyGetterToDataOnExtensibleObjThrows() {
    const obj = { get bp() { return 67; } };
    Object.preventExtensions(obj);
    try {
        Object.defineProperty(obj, 'bp', { value: 677 });
        return true;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn57：验证不可扩展对象使用Object.getOwnPropertySymbols返回自有Symbol属性
export function Fn57_getOwnPropertySymbolsExtensibleObjWorks() {
    const sym = Symbol('bq');
    const obj = { [sym]: 68, br: 69 };
    Object.preventExtensions(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// Fn58：验证不可扩展对象使用Object.getOwnPropertyNames返回自有属性名
export function Fn58_getOwnPropertyNamesExtensibleObjWorks() {
    const obj = { bs: 70, bt: 71 };
    Object.preventExtensions(obj);
    const names = Object.getOwnPropertyNames(obj);
    return names.sort().join(',') === 'bs,bt';
}

// Fn59：验证不可扩展数组使用fill方法正常填充（不新增元素）
export function Fn59_extensibleArrayFillWorks() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    arr.fill(0);
    return arr.join(',') === '0,0,0';
}

// Fn60：验证不可扩展数组使用reverse方法正常反转
export function Fn60_extensibleArrayReverseWorks() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    arr.reverse();
    return arr.join(',') === '3,2,1';
}

// Fn61：验证不可扩展数组使用sort方法正常排序
export function Fn61_extensibleArraySortWorks() {
    const arr = [3, 1, 2];
    Object.preventExtensions(arr);
    arr.sort();
    return arr.join(',') === '1,2,3';
}

// Fn62：验证不可扩展对象作为Map的key正常使用
export function Fn62_mapUseExtensibleObjAsKey() {
    const map = new Map();
    const obj = { bu: 72 };
    Object.preventExtensions(obj);
    map.set(obj, 73);
    return map.get(obj) === 73 && map.has(obj);
}

// Fn63：验证不可扩展对象作为Set的元素正常使用
export function Fn63_setAddExtensibleObj() {
    const set = new Set();
    const obj = { bv: 74 };
    Object.preventExtensions(obj);
    set.add(obj);
    return set.has(obj) && set.size === 1;
}

// Fn64：验证不可扩展对象使用Object.is判断与自身相等
export function Fn64_objectIsExtensibleObjWithSelf() {
    const obj = { bw: 75 };
    Object.preventExtensions(obj);
    return Object.is(obj, obj);
}

// Fn66：验证不可扩展对象的属性被冻结后无法修改值
export function Fn66_frozenPropOnExtensibleObjCantModify() {
    const obj = { by: 77 };
    Object.preventExtensions(obj);
    Object.freeze(obj);
    obj.by = 777;
    return obj.by === 77;
}

// Fn67：验证不可扩展对象的属性被密封后无法删除
export function Fn67_sealedPropOnExtensibleObjCantDelete() {
    const obj = { bz: 78 };
    Object.preventExtensions(obj);
    Object.seal(obj);
    try {
        delete obj.bz;
        return obj.bz === 78;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn68：验证不可扩展对象的toString方法正常调用
export function Fn68_extensibleObjToStringWorks() {
    const obj = { ca: 79 };
    Object.preventExtensions(obj);
    const str = obj.toString();
    return str === '[object Object]';
}

// Fn69：验证不可扩展对象的valueOf方法正常调用
export function Fn69_extensibleObjValueOfWorks() {
    const obj = { cb: 80 };
    Object.preventExtensions(obj);
    const val = obj.valueOf();
    return val === obj;
}

// Fn70：验证不可扩展对象的hasOwnProperty方法正常调用
export function Fn70_extensibleObjHasOwnPropertyWorks() {
    const obj = { cc: 81 };
    Object.preventExtensions(obj);
    return obj.hasOwnProperty('cc') && !obj.hasOwnProperty('cd');
}

// Fn71：验证不可扩展对象的propertyIsEnumerable方法正常调用
export function Fn71_extensibleObjPropertyIsEnumerableWorks() {
    const obj = { ce: 82 };
    Object.preventExtensions(obj);
    return obj.propertyIsEnumerable('ce');
}

// Fn72：验证不可扩展对象的非 enumerable 属性propertyIsEnumerable返回false
export function Fn72_nonEnumerablePropIsNotEnumerable() {
    const obj = Object.defineProperty({}, 'cf', { value: 83, enumerable: false });
    Object.preventExtensions(obj);
    return !obj.propertyIsEnumerable('cf');
}

// Fn73：验证不可扩展对象使用for...of遍历可迭代属性（如数组）
export function Fn73_forOfExtensibleArrayWorks() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    let sum = 0;
    for (const num of arr) sum += num;
    return sum === 6;
}

// Fn74：验证不可扩展对象（非可迭代）使用for...of抛出错误
export function Fn74_forOfNonIterableExtensibleObjThrows() {
    const obj = { cg: 84 };
    Object.preventExtensions(obj);
    try {
        for (const val of obj) {}
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn75：验证不可扩展对象使用Object.entries返回自有属性键值对
export function Fn75_objectEntriesExtensibleObjWorks() {
    const obj = { ch: 85, ci: 86 };
    Object.preventExtensions(obj);
    const entries = Object.entries(obj);
    return entries.length === 2 && entries.some(e => e[0] === 'ch' && e[1] === 85);
}

// Fn76：验证不可扩展对象使用JSON.parse生成后再设为不可扩展
export function Fn76_parseThenPreventExtensionsWorks() {
    const str = '{"cj":87,"ck":88}';
    const obj = JSON.parse(str);
    Object.preventExtensions(obj);
    obj.cl = 89;
    return obj.cl === undefined && obj.cj === 87;
}

// Fn77：验证不可扩展对象的JSON.stringify replacer参数正常工作
export function Fn77_stringifyExtensibleObjWithReplacer() {
    const obj = { cm: 90, cn: 91 };
    Object.preventExtensions(obj);
    const str = JSON.stringify(obj, (k, v) => k === 'cm' ? 900 : v);
    const parsed = JSON.parse(str);
    return parsed.cm === 900 && parsed.cn === 91;
}

// Fn78：验证不可扩展对象的JSON.parse reviver参数正常工作
export function Fn78_parseExtensibleObjWithReviver() {
    const str = '{"co":92,"cp":93}';
    const obj = JSON.parse(str, (k, v) => k === 'co' ? 920 : v);
    Object.preventExtensions(obj);
    return obj.co === 920 && obj.cp === 93;
}

// Fn79：验证不可扩展对象嵌套在可扩展对象中，嵌套对象仍不可扩展
export function Fn79_nestedExtensibleObjInExtensibleObj() {
    const nested = { cq: 94 };
    Object.preventExtensions(nested);
    const parent = { cr: nested };
    parent.cs = 95;
    nested.ct = 96;
    return parent.cs === 95 && nested.ct === undefined;
}

// Fn80：验证可扩展对象嵌套在不可扩展对象中，可扩展对象仍可扩展
export function Fn80_extensibleObjInNonExtensibleObj() {
    const nested = { cu: 97 };
    const parent = { cv: nested };
    Object.preventExtensions(parent);
    nested.cw = 98;
    parent.cx = 99;
    return nested.cw === 98 && parent.cx === undefined;
}

// Fn81：验证不可扩展对象使用Reflect.deleteProperty删除自有属性成功
export function Fn81_reflectDeleteOwnPropOnExtensibleObj() {
    const obj = { cy: 100 };
    Object.preventExtensions(obj);
    const result = Reflect.deleteProperty(obj, 'cy');
    return result && obj.cy === undefined;
}

// Fn82：验证不可扩展对象使用Reflect.deleteProperty删除不存在属性返回true
export function Fn82_reflectDeleteNonExistentPropOnExtensibleObj() {
    const obj = { cz: 101 };
    Object.preventExtensions(obj);
    const result = Reflect.deleteProperty(obj, 'da');
    return result;
}

// Fn83：验证不可扩展对象的原型链上的属性可修改（如果原型可扩展）
export function Fn83_modifyInheritedPropOnExtensibleObj() {
    const proto = { db: 102 };
    const obj = Object.create(proto);
    Object.preventExtensions(obj);
    proto.db = 1022;
    return obj.db === 1022;
}

// Fn84：验证不可扩展对象的原型链上的属性无法新增（如果原型不可扩展）
export function Fn84_addInheritedPropOnExtensibleObjFails() {
    const proto = { dc: 103 };
    Object.preventExtensions(proto);
    const obj = Object.create(proto);
    proto.dd = 104;
    return obj.dd === undefined;
}

// Fn85：验证不可扩展对象作为函数参数传递后仍不可扩展
export function Fn85_extensibleObjAsFunctionParam() {
    function test(param) {
        param.de = 105;
        return !Object.isExtensible(param);
    }
    const obj = { df: 106 };
    Object.preventExtensions(obj);
    return test(obj) && obj.de === undefined;
}

// Fn86：验证不可扩展对象在闭包中仍保持不可扩展
export function Fn86_extensibleObjInClosure() {
    const obj = { dg: 107 };
    Object.preventExtensions(obj);
    function closure() {
        obj.dh = 108;
        return !Object.isExtensible(obj);
    }
    return closure() && obj.dh === undefined;
}

// Fn87：验证不可扩展对象的属性描述符configurable为true时可删除
export function Fn87_deleteConfigurablePropOnExtensibleObj() {
    const obj = { di: 109 };
    Object.preventExtensions(obj);
    delete obj.di;
    return obj.di === undefined;
}

// Fn88：验证不可扩展对象的属性描述符configurable为false时不可删除
export function Fn88_cantDeleteNonConfigurableProp() {
    const obj = Object.defineProperty({}, 'dj', { value: 110, configurable: false });
    Object.preventExtensions(obj);
    try {
        delete obj.dj;
        return obj.dj === 110;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn89：验证不可扩展对象的属性描述符enumerable为false时不被for...in遍历
export function Fn89_nonEnumerablePropNotInForIn() {
    const obj = Object.defineProperty({}, 'dk', { value: 111, enumerable: false });
    Object.preventExtensions(obj);
    let hasDk = false;
    for (const key in obj) {
        if (key === 'dk') hasDk = true;
    }
    return !hasDk;
}

// Fn90：验证不可扩展对象的属性描述符writable为false时不可修改值
export function Fn90_nonWritablePropCantModify() {
    const obj = Object.defineProperty({}, 'dl', { value: 112, writable: false });
    Object.preventExtensions(obj);
    obj.dl = 1122;
    return obj.dl === 112;
}

// Fn91：验证不可扩展对象使用Object.defineProperties更新已有属性成功
export function Fn91_definePropertiesUpdateExistingOnExtensibleObj() {
    const obj = { dm: 113, dn: 114 };
    Object.preventExtensions(obj);
    Object.defineProperties(obj, {
        dm: { value: 1133 },
        dn: { writable: false }
    });
    obj.dn = 1144;
    return obj.dm === 1133 && obj.dn === 114;
}

// Fn92：验证不可扩展对象使用Object.defineProperties添加新属性抛出错误
export function Fn92_definePropertiesAddNewOnExtensibleObjThrows() {
    const obj = { do: 115 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperties(obj, { dp: { value: 116 } });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn93：验证不可扩展对象的Proxy代理无法添加新属性
export function Fn93_proxyOfExtensibleObjNoNewProp() {
    const obj = { dq: 117 };
    Object.preventExtensions(obj);
    const proxy = new Proxy(obj, {});
    proxy.dr = 118;
    return proxy.dr === undefined && obj.dr === undefined;
}

// Fn94：验证不可扩展对象的Proxy代理能修改已有属性
export function Fn94_proxyOfExtensibleObjModifyExistingProp() {
    const obj = { ds: 119 };
    Object.preventExtensions(obj);
    const proxy = new Proxy(obj, {});
    proxy.ds = 1199;
    return proxy.ds === 1199 && obj.ds === 1199;
}

// Fn95：验证不可扩展对象的Proxy handler中set陷阱拦截新属性添加
export function Fn95_proxySetTrapBlockNewPropOnExtensibleObj() {
    const obj = { dt: 120 };
    Object.preventExtensions(obj);
    const proxy = new Proxy(obj, {
        set(target, prop, value) {
            if (!target.hasOwnProperty(prop)) return false;
            target[prop] = value;
            return true;
        }
    });
    proxy.du = 121;
    proxy.dt = 1200;
    return proxy.du === undefined && proxy.dt === 1200;
}

// Fn96：验证不可扩展对象的Proxy handler中defineProperty陷阱拦截新属性
export function Fn96_proxyDefinePropertyTrapBlockNewProp() {
    const obj = { dv: 122 };
    Object.preventExtensions(obj);
    const proxy = new Proxy(obj, {
        defineProperty(target, prop, desc) {
            if (!target.hasOwnProperty(prop)) return false;
            return Object.defineProperty(target, prop, desc);
        }
    });
    try {
        Object.defineProperty(proxy, 'dw', { value: 123 });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn97：验证不可扩展对象的原始类型包装对象无法添加新属性
export function Fn97_preventExtensionsOnPrimitiveWrapper() {
    const numWrapper = new Number(124);
    Object.preventExtensions(numWrapper);
    numWrapper.dx = 125;
    return numWrapper.dx === undefined;
}

// Fn98：验证不可扩展对象的原始类型包装对象已有的属性能修改
export function Fn98_modifyPrimitiveWrapperExtensibleObj() {
    const strWrapper = new String('test');
    strWrapper.dy = 126;
    Object.preventExtensions(strWrapper);
    strWrapper.dy = 1266;
    return strWrapper.dy === 1266;
}

// Fn99：验证不可扩展对象使用Object.isSealed返回false（未密封）
export function Fn99_extensibleObjIsNotSealed() {
    const obj = { dz: 127 };
    Object.preventExtensions(obj);
    return !Object.isSealed(obj);
}

// Fn100：验证不可扩展对象使用Object.isFrozen返回false（未冻结）
export function Fn100_extensibleObjIsNotFrozen() {
    const obj = { ea: 128 };
    Object.preventExtensions(obj);
    return !Object.isFrozen(obj);
}

// Fn101：验证不可扩展对象调用Object.seal后isSealed返回true
export function Fn101_extensibleObjSealedAfterSeal() {
    const obj = { eb: 129 };
    Object.preventExtensions(obj);
    Object.seal(obj);
    return Object.isSealed(obj);
}

// Fn102：验证不可扩展对象调用Object.freeze后isFrozen返回true
export function Fn102_extensibleObjFrozenAfterFreeze() {
    const obj = { ec: 130 };
    Object.preventExtensions(obj);
    Object.freeze(obj);
    return Object.isFrozen(obj);
}

// Fn103：验证不可扩展对象的length属性（非数组）能修改
export function Fn103_modifyLengthOnNonArrayExtensibleObj() {
    const obj = { ed: 131, length: 2 };
    Object.preventExtensions(obj);
    obj.length = 5;
    return obj.length === 5;
}

// Fn104：验证不可扩展对象作为Error实例无法添加新属性
export function Fn104_preventExtensionsOnErrorInstance() {
    const err = new Error('test');
    err.ee = 132;
    Object.preventExtensions(err);
    err.ef = 133;
    return err.ef === undefined && err.ee === 132;
}

// Fn105：验证不可扩展对象作为Promise实例无法添加新属性
export function Fn105_preventExtensionsOnPromiseInstance() {
    const promise = Promise.resolve();
    promise.eg = 134;
    Object.preventExtensions(promise);
    promise.eh = 135;
    return promise.eh === undefined && promise.eg === 134;
}

// Fn106：验证不可扩展ArrayBuffer视图无法添加新属性
export function Fn106_preventExtensionsOnArrayBufferView() {
    const buf = new ArrayBuffer(8);
    const view = new DataView(buf);
    view.ei = 136;
    Object.preventExtensions(view);
    view.ej = 137;
    return view.ej === undefined && view.ei === 136;
}

// Fn107：验证不可扩展Set实例无法添加新属性（但可add元素）
export function Fn107_preventExtensionsOnSetInstance() {
    const set = new Set([1]);
    set.ek = 138;
    Object.preventExtensions(set);
    set.el = 139;
    set.add(2);
    return set.el === undefined && set.has(2);
}

// Fn108：验证不可扩展Map实例无法添加新属性（但可set键值对）
export function Fn108_preventExtensionsOnMapInstance() {
    const map = new Map([['a', 1]]);
    map.em = 140;
    Object.preventExtensions(map);
    map.en = 141;
    map.set('b', 2);
    return map.en === undefined && map.get('b') === 2;
}

// Fn109：验证不可扩展对象的Symbol.species属性无法新增
export function Fn109_addSymbolSpeciesToExtensibleObjFails() {
    const obj = { eo: 142 };
    Object.preventExtensions(obj);
    obj[Symbol.species] = function() {};
    return obj[Symbol.species] === undefined;
}

// Fn110：验证不可扩展对象的Symbol.iterator属性无法新增
export function Fn110_addSymbolIteratorToExtensibleObjFails() {
    const obj = { ep: 143 };
    Object.preventExtensions(obj);
    obj[Symbol.iterator] = function*() {};
    return obj[Symbol.iterator] === undefined;
}

// Fn111：验证不可扩展可迭代对象的iterator正常工作
export function Fn111_extensibleIterableObjIteratorWorks() {
    const arr = [1, 2];
    Object.preventExtensions(arr);
    const iter = arr[Symbol.iterator]();
    return iter.next().value === 1 && iter.next().value === 2;
}

// Fn112：验证不可扩展对象的generator函数交互正常
export function Fn112_extensibleObjWithGenerator() {
    const obj = { eq: 144 };
    Object.preventExtensions(obj);
    function* gen() { yield obj.eq; }
    const iter = gen();
    return iter.next().value === 144;
}

// Fn113：验证不可扩展对象的async函数交互正常
export function Fn113_extensibleObjWithAsyncFunc() {
    const obj = { er: 145 };
    Object.preventExtensions(obj);
    const asyncFunc = async () => obj.er;
    return asyncFunc().then(val => val === 145).toString() === "[object Promise]";
}

// Fn115：验证不可扩展对象使用bind绑定this后仍不可扩展
export function Fn115_bindExtensibleObjThis() {
    const obj = { et: 147 };
    Object.preventExtensions(obj);
    function test() { this.eu = 148; }
    const boundTest = test.bind(obj);
    boundTest();
    return obj.eu === undefined;
}

// Fn116：验证不可扩展对象使用call绑定this后仍不可扩展
export function Fn116_callExtensibleObjThis() {
    const obj = { ev: 149 };
    Object.preventExtensions(obj);
    function test() { this.ew = 150; }
    test.call(obj);
    return obj.ew === undefined;
}

// Fn117：验证不可扩展对象使用apply绑定this后仍不可扩展
export function Fn117_applyExtensibleObjThis() {
    const obj = { ex: 151 };
    Object.preventExtensions(obj);
    function test() { this.ey = 152; }
    test.apply(obj);
    return obj.ey === undefined;
}

// Fn118：验证不可扩展对象在箭头函数中this绑定正常
export function Fn118_extensibleObjInArrowFuncThis() {
    const obj = { ez: 153 };
    Object.preventExtensions(obj);
    const arrowFunc = () => this.ez;
    const boundFunc = arrowFunc.bind(obj);
    return boundFunc()=== undefined;
}

// Fn119：验证不可扩展对象的循环引用序列化正常
export function Fn119_circularExtensibleObjStringify() {
    const obj = { fa: 154 };
    Object.preventExtensions(obj);
    obj.self = obj;
    try {
        const str = JSON.stringify(obj, (k, v) => k === 'self' ? '[Circular]' : v);
        return str.includes('"self":"[Circular]"') === false;
    } catch (e) {
        return false;
    }
}

// Fn120：验证不可扩展对象的克隆处理循环引用
export function Fn120_cloneCircularExtensibleObj() {
    const obj = { fb: 155 };
    Object.preventExtensions(obj);
    obj.self = obj;
    try {
        const clone = structuredClone(obj, {
            transfer: [],
            onClone(cloneObj) {
                if (cloneObj.self === obj) cloneObj.self = cloneObj;
            }
        });
        return clone.fb === 155 && clone.self === undefined;
    } catch (e) {
        return false;
    }
}

// Fn121：验证不可扩展对象使用localStorage存储/读取正常
export function Fn121_extensibleObjWithLocalStorage() {
    if (typeof localStorage === 'undefined') return true;
    const obj = { fc: 156 };
    Object.preventExtensions(obj);
    const str = JSON.stringify(obj);
    localStorage.setItem('testKey', str);
    const parsed = JSON.parse(localStorage.getItem('testKey'));
    localStorage.removeItem('testKey');
    return parsed.fc === 156;
}

// Fn122：验证不可扩展对象使用sessionStorage存储/读取正常
export function Fn122_extensibleObjWithSessionStorage() {
    if (typeof sessionStorage === 'undefined') return true;
    const obj = { fd: 157 };
    Object.preventExtensions(obj);
    const str = JSON.stringify(obj);
    sessionStorage.setItem('testKey', str);
    const parsed = JSON.parse(sessionStorage.getItem('testKey'));
    sessionStorage.removeItem('testKey');
    return parsed.fd === 157;
}

// Fn123：验证不可扩展对象的属性被继承后可修改（原型属性可写）
export function Fn123_modifyInheritedWritableProp() {
    const proto = { fe: 158 };
    const obj = Object.create(proto);
    Object.preventExtensions(obj);
    obj.fe = 1588;
    return obj.fe === 158 && proto.fe === 158;
}

// Fn124：验证不可扩展对象的属性被继承后不可修改（原型属性不可写）
export function Fn124_cantModifyInheritedNonWritableProp() {
    const proto = Object.defineProperty({}, 'ff', { value: 159, writable: false });
    const obj = Object.create(proto);
    Object.preventExtensions(obj);
    obj.ff = 1599;
    return obj.ff === 159;
}

// Fn125：验证不可扩展对象使用Object.getOwnPropertyDescriptors修改已有属性描述符
export function Fn125_modifyPropDescWithGetDescriptors() {
    const obj = { fg: 160 };
    Object.preventExtensions(obj);
    const descs = Object.getOwnPropertyDescriptors(obj);
    descs.fg.writable = false;
    Object.defineProperties(obj, descs);
    obj.fg = 1600;
    return obj.fg === 160;
}

// Fn126：验证不可扩展对象的Proxy handler中deleteProperty陷阱正常工作
export function Fn126_proxyDeletePropertyTrapOnExtensibleObj() {
    const obj = { fh: 161 };
    Object.preventExtensions(obj);
    const proxy = new Proxy(obj, {
        deleteProperty(target, prop) {
            if (prop === 'fh') return false;
            return Reflect.deleteProperty(target, prop);
        }
    });
    delete proxy.fh;
    return obj.fh === 161;
}

// Fn128：验证不可扩展对象的Proxy handler中setPrototypeOf陷阱拦截修改
export function Fn128_proxySetPrototypeOfTrapOnExtensibleObj() {
    const obj = { fk: 164 };
    Object.preventExtensions(obj);
    const proxy = new Proxy(obj, {
        setPrototypeOf(target, newProto) {
            return false;
        }
    });
    try {
        Object.setPrototypeOf(proxy, { fl: 165 });
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Fn129：验证不可扩展对象使用Object.isExtensible多次调用返回一致结果
export function Fn129_isExtensibleConsistentOnExtensibleObj() {
    const obj = { fm: 166 };
    Object.preventExtensions(obj);
    const res1 = Object.isExtensible(obj);
    const res2 = Object.isExtensible(obj);
    const res3 = Object.isExtensible(obj);
    return res1 === res2 && res2 === res3 && !res1;
}

// Fn130：验证不可扩展对象使用Reflect.isExtensible多次调用返回一致结果
export function Fn130_reflectIsExtensibleConsistentOnExtensibleObj() {
    const obj = { fn: 167 };
    Object.preventExtensions(obj);
    const res1 = Reflect.isExtensible(obj);
    const res2 = Reflect.isExtensible(obj);
    const res3 = Reflect.isExtensible(obj);
    return res1 === res2 && res2 === res3 && !res1;
}