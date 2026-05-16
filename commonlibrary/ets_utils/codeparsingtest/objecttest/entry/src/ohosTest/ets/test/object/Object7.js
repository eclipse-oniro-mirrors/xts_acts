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

// 测试点7：冻结后Object.defineProperty无法修改属性
export function Fn07_testFreezeDefineProperty() {
    const obj = { prop: "val" };
    Object.freeze(obj);
    let defineFailed = false;
    try { Object.defineProperty(obj, "prop", { value: "newVal" }); }
    catch (e) { defineFailed = e instanceof TypeError; }
    return defineFailed && obj.prop === "val";
}


// 测试点9：冻结后对象可通过Object.isFrozen检测
export function Fn09_testFreezeIsFrozenCheck() {
    const obj = { a: 1 };
    Object.freeze(obj);
    return Object.isFrozen(obj);
}

// 测试点10：未冻结对象通过Object.isFrozen检测为false
export function Fn10_testUnfreezeIsFrozenCheck() {
    const obj = { a: 1 };
    return !Object.isFrozen(obj);
}

// 测试点11：冻结含嵌套数组对象，子数组可修改
export function Fn11_testFreezeNestedArray() {
    const obj = { nestedArr: [1, 2] };
    Object.freeze(obj);
    obj.nestedArr[0] = 9;
    return obj.nestedArr[0] === 9;
}

// 测试点12：冻结后删除原型链属性不影响冻结状态
export function Fn12_testFreezeDeleteProtoProperty() {
    const obj = Object.create({ protoProp: "val" });
    obj.ownProp = "ownVal";
    Object.freeze(obj);
    delete obj.protoProp;
    return obj.protoProp === "val" && obj.ownProp === "ownVal";
}



// 测试点14：冻结后函数属性内部逻辑可执行（属性本身未被冻结）
export function Fn14_testFreezeFunctionExecution() {
    const obj = { add: (a, b) => a + b };
    Object.freeze(obj);
    return obj.add(2, 3) === 5;
}

// 测试点15：冻结含Date属性对象，Date值可修改
export function Fn15_testFreezeDateProperty() {
    const date = new Date();
    const obj = { time: date };
    Object.freeze(obj);
    obj.time.setFullYear(2025);
    return obj.time.getFullYear() === 2025;
}


// 测试点19：冻结数组后不可用splice修改
export function Fn19_testFreezeArraySplice() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let spliceFailed = false;
    try { arr.splice(0, 1); } catch (e) { spliceFailed = e instanceof TypeError; }
    return spliceFailed && arr.length === 3;
}

// 测试点20：冻结数组后不可用pop修改
export function Fn20_testFreezeArrayPop() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let popFailed = false;
    try { arr.pop(); } catch (e) { popFailed = e instanceof TypeError; }
    return popFailed && arr.length === 3;
}

// 测试点21：冻结数组后不可用shift修改
export function Fn21_testFreezeArrayShift() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let shiftFailed = false;
    try { arr.shift(); } catch (e) { shiftFailed = e instanceof TypeError; }
    return shiftFailed && arr.length === 3;
}

// 测试点22：冻结后对象属性描述符不可修改
export function Fn22_testFreezePropertyDescriptor() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let descFailed = false;
    try { Object.defineProperty(obj, "a", { writable: true }); }
    catch (e) { descFailed = e instanceof TypeError; }
    return descFailed;
}

// 测试点27：冻结空数组后不可添加元素
export function Fn27_testFreezeEmptyArray() {
    const emptyArr = [];
    Object.freeze(emptyArr);
    let pushFailed = false;
    try { emptyArr.push(1); } catch (e) { pushFailed = e instanceof TypeError; }
    return pushFailed && emptyArr.length === 0;
}

// 测试点28：冻结含嵌套对象的数组，子对象可修改
export function Fn28_testFreezeArrayWithNestedObj() {
    const arr = [{ name: "A" }, { name: "B" }];
    Object.freeze(arr);
    arr[0].name = "C";
    return arr[0].name === "C";
}


// 测试点32：冻结后不可用Object.defineProperties批量修改属性
export function Fn32_testFreezeDefineProperties() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    let defineFailed = false;
    try { Object.defineProperties(obj, { a: { value: 3 }, b: { value: 4 } }); }
    catch (e) { defineFailed = e instanceof TypeError; }
    return defineFailed && obj.a === 1 && obj.b === 2;
}

// 测试点33：冻结数组后不可用unshift添加元素
export function Fn33_testFreezeArrayUnshift() {
    const arr = [1, 2];
    Object.freeze(arr);
    let unshiftFailed = false;
    try { arr.unshift(0); } catch (e) { unshiftFailed = e instanceof TypeError; }
    return unshiftFailed && arr.length === 2 && arr[0] === 1;
}

// 测试点34：冻结数组后不可用fill修改元素
export function Fn34_testFreezeArrayFill() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let fillFailed = false;
    try { arr.fill(0); } catch (e) { fillFailed = e instanceof TypeError; }
    return fillFailed && arr[0] === 1 && arr[2] === 3;
}

// 测试点35：冻结含Set属性对象，Set内部可修改（浅冻结）
export function Fn35_testFreezeSetProperty() {
    const set = new Set([1, 2]);
    const obj = { mySet: set };
    Object.freeze(obj);
    obj.mySet.add(3);
    return obj.mySet.has(3) && obj.mySet.size === 3;
}

// 测试点37：冻结含Map属性对象，Map内部可修改（浅冻结）
export function Fn37_testFreezeMapProperty() {
    const map = new Map([["a", 1]]);
    const obj = { myMap: map };
    Object.freeze(obj);
    obj.myMap.set("b", 2);
    return obj.myMap.get("b") === 2 && obj.myMap.size === 2;
}

// 测试点39：冻结后对象不可用Reflect.set修改属性
export function Fn39_testFreezeReflectSet() {
    const obj = { x: 10 };
    Object.freeze(obj);
    const setResult = Reflect.set(obj, "x", 20);
    return !setResult && obj.x === 10;
}

// 测试点40：冻结后对象不可用Reflect.deleteProperty删除属性
export function Fn40_testFreezeReflectDelete() {
    const obj = { y: 20 };
    Object.freeze(obj);
    const deleteResult = Reflect.deleteProperty(obj, "y");
    return !deleteResult && obj.hasOwnProperty("y");
}

// 测试点41：冻结嵌套两层对象，最内层子对象可修改
export function Fn41_testFreezeTwoLevelNestedObj() {
    const obj = { level1: { level2: { val: "old" } } };
    Object.freeze(obj);
    obj.level1.level2.val = "new";
    return obj.level1.level2.val === "new";
}

// 测试点43：冻结数组后不可用reverse反转
export function Fn43_testFreezeArrayReverse() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let reverseFailed = false;
    try { arr.reverse(); } catch (e) { reverseFailed = e instanceof TypeError; }
    return reverseFailed && arr[0] === 1 && arr[2] === 3;
}

// 测试点44：冻结数组后不可用sort排序
export function Fn44_testFreezeArraySort() {
    const arr = [3, 1, 2];
    Object.freeze(arr);
    let sortFailed = false;
    try { arr.sort(); } catch (e) { sortFailed = e instanceof TypeError; }
    return sortFailed && arr[0] === 3 && arr[1] === 1;
}

// 测试点46：冻结后对象属性的enumerable特性不可修改
export function Fn46_testFreezePropertyEnumerable() {
    const obj = { z: 30 };
    Object.freeze(obj);
    let enumFailed = false;
    try { Object.defineProperty(obj, "z", { enumerable: false }); }
    catch (e) { enumFailed = e instanceof TypeError; }
    return enumFailed && Object.keys(obj).includes("z");
}

// 测试点47：冻结后对象属性的configurable特性不可修改
export function Fn47_testFreezePropertyConfigurable() {
    const obj = { w: 40 };
    Object.freeze(obj);
    let configFailed = false;
    try { Object.defineProperty(obj, "w", { configurable: true }); }
    catch (e) { configFailed = e instanceof TypeError; }
    return configFailed;
}

// 测试点48：冻结含类实例属性对象，实例内部可修改（浅冻结）
export function Fn48_testFreezeClassInstance() {
    class TestClass { constructor() { this.val = "old"; } }
    const instance = new TestClass();
    const obj = { myInstance: instance };
    Object.freeze(obj);
    obj.myInstance.val = "new";
    return obj.myInstance.val === "new";
}

// 测试点52：冻结数组后不可用splice删除元素
export function Fn52_testFreezeArraySpliceDelete() {
    const arr = [1, 2, 3, 4];
    Object.freeze(arr);
    let spliceFailed = false;
    try { arr.splice(1, 2); } catch (e) { spliceFailed = e instanceof TypeError; }
    return spliceFailed && arr.length === 4 && arr[1] === 2;
}

// 测试点55：冻结含WeakSet属性对象，WeakSet内部可修改（浅冻结）
export function Fn55_testFreezeWeakSetProperty() {
    const weakSet = new WeakSet();
    const testObj = {};
    weakSet.add(testObj);
    const obj = { myWeakSet: weakSet };
    Object.freeze(obj);
    const newObj = {};
    obj.myWeakSet.add(newObj);
    return obj.myWeakSet.has(newObj);
}

// 测试点56：冻结含WeakMap属性对象，WeakMap内部可修改（浅冻结）
export function Fn56_testFreezeWeakMapProperty() {
    const weakMap = new WeakMap();
    const testKey = {};
    weakMap.set(testKey, "val1");
    const obj = { myWeakMap: weakMap };
    Object.freeze(obj);
    const newKey = {};
    obj.myWeakMap.set(newKey, "val2");
    return obj.myWeakMap.get(newKey) === "val2";
}

// 测试点57：冻结数组后不可用copyWithin修改元素
export function Fn57_testFreezeArrayCopyWithin() {
    const arr = [1, 2, 3, 4];
    Object.freeze(arr);
    let copyFailed = false;
    try { arr.copyWithin(0, 2); } catch (e) { copyFailed = e instanceof TypeError; }
    return copyFailed && arr[0] === 1 && arr[2] === 3;
}

// 测试点59：冻结含Promise属性对象，Promise状态可正常变更（浅冻结）
export function Fn59_testFreezePromiseProperty() {
    let resolveFn;
    const promise = new Promise((resolve) => { resolveFn = resolve; });
    const obj = { myPromise: promise };
    Object.freeze(obj);
    resolveFn("success");
    return obj.myPromise.then(res => res === "success") && obj.myPromise === promise;
}

// 测试点64：冻结含ArrayBuffer属性对象，ArrayBuffer内容可修改（浅冻结）
export function Fn64_testFreezeArrayBuffer() {
    const buf = new ArrayBuffer(4);
    const view = new Uint8Array(buf);
    view[0] = 10;
    const obj = { myBuf: buf };
    Object.freeze(obj);
    view[0] = 20;
    return new Uint8Array(obj.myBuf)[0] === 20;
}


// 测试点68：冻结含TypedArray属性对象，TypedArray内容可修改（浅冻结）
export function Fn68_testFreezeTypedArray() {
    const typedArr = new Uint16Array([1, 2]);
    const obj = { myTypedArr: typedArr };
    Object.freeze(obj);
    obj.myTypedArr[0] = 100;
    return obj.myTypedArr[0] === 100;
}

// 测试点77：冻结含Error对象属性，Error内部可修改（浅冻结）
export function Fn77_testFreezeErrorModify() {
    const err = new Error("old error");
    const obj = { myErr: err };
    Object.freeze(obj);
    obj.myErr.message = "updated error";
    return obj.myErr.message === "updated error";
}

// 测试点78：冻结后对象不可用Reflect.defineProperty修改属性
export function Fn78_testFreezeReflectDefineProperty() {
    const obj = { prop: "old" };
    Object.freeze(obj);
    const result = Reflect.defineProperty(obj, "prop", { value: "new" });
    return !result && obj.prop === "old";
}

// 测试点80：冻结含Date对象的数组，Date内部可修改（浅冻结）
export function Fn80_testFreezeArrayWithDate() {
    const date = new Date(2024);
    const arr = [date];
    Object.freeze(arr);
    arr[0].setFullYear(2025);
    return arr[0].getFullYear() === 2025;
}

// 测试点84：冻结含Set的数组，Set内部可修改（浅冻结）
export function Fn84_testFreezeArrayWithSet() {
    const set = new Set([1]);
    const arr = [set];
    Object.freeze(arr);
    arr[0].add(2);
    return arr[0].has(2);
}

// 测试点88：冻结含Map的数组，Map内部可修改（浅冻结）
export function Fn88_testFreezeArrayWithMap() {
    const map = new Map([["a", 1]]);
    const arr = [map];
    Object.freeze(arr);
    arr[0].set("b", 2);
    return arr[0].get("b") === 2;
}

// 测试点90：冻结后对象与原对象严格相等（引用不变）
export function Fn90_testFreezeObjectReference() {
    const obj = { prop: "val" };
    const frozenObj = Object.freeze(obj);
    return obj === frozenObj && Object.isFrozen(frozenObj);
}

// 测试点94：冻结后对象不可用Reflect.setPrototypeOf修改原型
export function Fn94_testFreezeReflectSetPrototype() {
    const obj = { a: 1 };
    const originalProto = Object.getPrototypeOf(obj);
    Object.freeze(obj);
    const result = Reflect.setPrototypeOf(obj, {});
    return !result && Object.getPrototypeOf(obj) === originalProto;
}

// 测试点95：冻结含ImageData属性对象，ImageData内容可修改（浅冻结）
export function Fn95_testFreezeImageDataModify() {
    const imgData = new ImageData(1, 1);
    imgData.data[0] = 0; // 红色通道
    const obj = { myImgData: imgData };
    Object.freeze(obj);
    obj.myImgData.data[0] = 255;
    return obj.myImgData.data[0] === 255;
}

// 测试点99：冻结含Int8Array属性对象，内容可修改（浅冻结）
export function Fn99_testFreezeInt8ArrayModify() {
    const intArr = new Int8Array([-1, 2]);
    const obj = { myIntArr: intArr };
    Object.freeze(obj);
    obj.myIntArr[0] = -10;
    return obj.myIntArr[0] === -10;
}

// 测试点103：冻结含DataView属性对象，DataView内容可修改（浅冻结）
export function Fn103_testFreezeDataViewModify() {
    const buf = new ArrayBuffer(4);
    const dataView = new DataView(buf);
    dataView.setInt16(0, 100);
    const obj = { myView: dataView };
    Object.freeze(obj);
    obj.myView.setInt16(0, 200);
    return obj.myView.getInt16(0) === 200;
}

// 测试点106：冻结后对象不可用Reflect.deleteProperty删除原型链属性（无影响）
export function Fn106_testFreezeReflectDeleteProto() {
    const proto = { protoProp: "val" };
    const obj = Object.create(proto);
    obj.ownProp = "own";
    Object.freeze(obj);
    const result = Reflect.deleteProperty(obj, "protoProp");
    return result && obj.protoProp === "val" && obj.ownProp === "own";
}

// 测试点107：冻结含BigUint64Array属性对象，内容可修改（浅冻结）
export function Fn107_testFreezeBigUint64ArrayModify() {
    const bigArr = new BigUint64Array([100n, 200n]);
    const obj = { myBigArr: bigArr };
    Object.freeze(obj);
    obj.myBigArr[0] = 300n;
    return obj.myBigArr[0] === 300n;
}

// 测试点111：冻结含WeakMap的对象，WeakMap内部可修改（浅冻结）
export function Fn111_testFreezeWeakMapModify() {
    const weakMap = new WeakMap();
    const key1 = {};
    weakMap.set(key1, "val1");
    const obj = { myWeakMap: weakMap };
    Object.freeze(obj);
    const key2 = {};
    obj.myWeakMap.set(key2, "val2");
    return obj.myWeakMap.get(key2) === "val2";
}

// 测试点115：冻结含WeakSet的对象，WeakSet内部可修改（浅冻结）
export function Fn115_testFreezeWeakSetModify() {
    const weakSet = new WeakSet();
    const item1 = {};
    weakSet.add(item1);
    const obj = { myWeakSet: weakSet };
    Object.freeze(obj);
    const item2 = {};
    obj.myWeakSet.add(item2);
    return obj.myWeakSet.has(item2);
}

// 测试点118：冻结后对象不可用Object.isExtensible检测为不可扩展（冻结隐含不可扩展）
export function Fn118_testFreezeIsExtensible() {
    const obj = { prop: "val" };
    Object.freeze(obj);
    return !Object.isExtensible(obj);
}

// 测试点119：冻结后对象不可用Object.isSealed检测为密封（冻结隐含密封）
export function Fn119_testFreezeIsSealed() {
    const obj = { prop: "val" };
    Object.freeze(obj);
    return Object.isSealed(obj);
}

// 测试点120：冻结空对象后，Object.getOwnPropertyNames返回空数组
export function Fn120_testFreezeEmptyObjGetNames() {
    const emptyObj = {};
    Object.freeze(emptyObj);
    const props = Object.getOwnPropertyNames(emptyObj);
    return props.length === 0;
}

// 测试点127：冻结含Float32Array属性对象，内容可修改（浅冻结）
export function Fn127_testFreezeFloat32ArrayModify() {
    const floatArr = new Float32Array([1.5, 2.5]);
    const obj = { myFloatArr: floatArr };
    Object.freeze(obj);
    obj.myFloatArr[0] = 3.5;
    return obj.myFloatArr[0].toFixed(1) === "3.5";
}

// 测试点131：冻结含Float64Array属性对象，内容可修改（浅冻结）
export function Fn131_testFreezeFloat64ArrayModify() {
    const floatArr = new Float64Array([1.1234, 2.5678]);
    const obj = { myFloatArr: floatArr };
    Object.freeze(obj);
    obj.myFloatArr[0] = 3.9876;
    return obj.myFloatArr[0].toFixed(4) === "3.9876";
}

// 测试点133：冻结数组后不可用flat(Infinity)修改嵌套数组（原数组不变）
export function Fn133_testFreezeArrayFlatInfinity() {
    const arr = [1, [2, [3, [4]]]];
    Object.freeze(arr);
    const flatArr = arr.flat(Infinity);
    arr[1][0] = 10; // 子数组可修改（浅冻结）
    return flatArr.join(",") === "1,2,3,4" && arr[1][0] === 10;
}

// 测试点135：冻结含Int16Array属性对象，内容可修改（浅冻结）
export function Fn135_testFreezeInt16ArrayModify() {
    const intArr = new Int16Array([100, -200]);
    const obj = { myIntArr: intArr };
    Object.freeze(obj);
    obj.myIntArr[0] = 300;
    return obj.myIntArr[0] === 300;
}

// 测试点139：冻结含Int32Array属性对象，内容可修改（浅冻结）
export function Fn139_testFreezeInt32ArrayModify() {
    const intArr = new Int32Array([1000, -2000]);
    const obj = { myIntArr: intArr };
    Object.freeze(obj);
    obj.myIntArr[0] = 3000;
    return obj.myIntArr[0] === 3000;
}

// 测试点143：冻结含Uint32Array属性对象，内容可修改（浅冻结）
export function Fn143_testFreezeUint32ArrayModify() {
    const uintArr = new Uint32Array([10000, 20000]);
    const obj = { myUintArr: uintArr };
    Object.freeze(obj);
    obj.myUintArr[0] = 30000;
    return obj.myUintArr[0] === 30000;
}

// 测试点147：冻结含BigInt64Array属性对象，内容可修改（浅冻结）
export function Fn147_testFreezeBigInt64ArrayModify() {
    const bigArr = new BigInt64Array([9007199254740991n, -9007199254740991n]);
    const obj = { myBigArr: bigArr };
    Object.freeze(obj);
    obj.myBigArr[0] = 9007199254740992n;
    return obj.myBigArr[0] === 9007199254740992n;
}

// 测试点153：冻结后对象不可用Reflect.set修改Symbol属性（修改失败）
export function Fn153_testFreezeReflectSetSymbol() {
    const sym = Symbol("test");
    const obj = { [sym]: "old" };
    Object.freeze(obj);
    const result = Reflect.set(obj, sym, "new");
    return !result && obj[sym] === "old";
}

// 测试点154：冻结含Uint8ClampedArray属性对象，内容可修改（浅冻结）
export function Fn154_testFreezeUint8ClampedArrayModify() {
    const clampedArr = new Uint8ClampedArray([250, 5]);
    const obj = { myClampedArr: clampedArr };
    Object.freeze(obj);
    obj.myClampedArr[0] = 260; // 会被钳位到255
    return obj.myClampedArr[0] === 255;
}

// 测试点156：冻结数组后不可用find检测修改后的元素（无影响）
export function Fn156_testFreezeArrayFindModify() {
    const arr = [{ id: 1 }, { id: 2 }];
    Object.freeze(arr);
    const found = arr.find(item => item.id === 2);
    arr[1].id = 3; // 子对象可修改（浅冻结）
    const newFound = arr.find(item => item.id === 2);
    return found.id === 2 && newFound === undefined;
}

// 测试点157：冻结后对象不可用Object.getOwnPropertyDescriptor获取Symbol属性描述符（描述符不变）
export function Fn157_testFreezeGetSymbolDescriptor() {
    const sym = Symbol("key");
    const obj = { [sym]: "val" };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    return !desc.writable && !desc.configurable && desc.value === "val";
}

// 测试点160：冻结后对象不可用Reflect.defineProperty添加新属性（添加失败）
export function Fn160_testFreezeReflectDefineNewProp() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const result = Reflect.defineProperty(obj, "b", { value: 2 });
    return !result && !obj.hasOwnProperty("b");
}

// 测试点161：冻结含嵌套WeakMap的对象，WeakMap内部可修改（浅冻结）
export function Fn161_testFreezeNestedWeakMapModify() {
    const weakMap = new WeakMap();
    const key1 = {};
    weakMap.set(key1, "val1");
    const obj = { nested: { myWeakMap: weakMap } };
    Object.freeze(obj);
    const key2 = {};
    obj.nested.myWeakMap.set(key2, "val2");
    return obj.nested.myWeakMap.get(key2) === "val2";
}

// 测试点163：冻结数组后不可用flatMap处理嵌套数组（原数组不变）
export function Fn163_testFreezeArrayFlatMapNested() {
    const arr = [1, [2, 3]];
    Object.freeze(arr);
    const flatMapped = arr.flatMap(item => Array.isArray(item) ? item : [item * 2]);
    arr[1][0] = 4; // 子数组可修改
    return flatMapped.join(",") === "2,2,3" && arr[1][0] === 4;
}

// 测试点165：冻结含Uint16Array属性对象，内容可修改（浅冻结）
export function Fn165_testFreezeUint16ArrayModify() {
    const uintArr = new Uint16Array([32000, 65000]);
    const obj = { myUintArr: uintArr };
    Object.freeze(obj);
    obj.myUintArr[0] = 33000;
    return obj.myUintArr[0] === 33000;
}

// 测试点169：冻结含嵌套WeakSet的对象，WeakSet内部可修改（浅冻结）
export function Fn169_testFreezeNestedWeakSetModify() {
    const weakSet = new WeakSet();
    const item1 = {};
    weakSet.add(item1);
    const obj = { nested: { myWeakSet: weakSet } };
    Object.freeze(obj);
    const item2 = {};
    obj.nested.myWeakSet.add(item2);
    return obj.nested.myWeakSet.has(item2);
}

// 测试点173：冻结含BigUint64Array的数组，BigUint64Array内容可修改（浅冻结）
export function Fn173_testFreezeArrayWithBigUint64() {
    const bigArr = new BigUint64Array([100n, 200n]);
    const arr = [bigArr];
    Object.freeze(arr);
    arr[0][0] = 300n;
    return arr[0][0] === 300n;
}

// 测试点177：冻结含DataView的数组，DataView内容可修改（浅冻结）
export function Fn177_testFreezeArrayWithDataView() {
    const buf = new ArrayBuffer(4);
    const view = new DataView(buf);
    view.setUint32(0, 1000);
    const arr = [view];
    Object.freeze(arr);
    arr[0].setUint32(0, 2000);
    return arr[0].getUint32(0) === 2000;
}

// 测试点181：冻结含SharedArrayBuffer属性对象，内容可修改（浅冻结）
export function Fn181_testFreezeSharedArrayBufferModify() {
    const sab = new SharedArrayBuffer(4);
    const view = new Int32Array(sab);
    view[0] = 10;
    const obj = { mySab: sab };
    Object.freeze(obj);
    view[0] = 20;
    return new Int32Array(obj.mySab)[0] === 20;
}

// 测试点184：冻结后对象不可用Reflect.set修改嵌套属性（浅冻结允许子对象修改）
export function Fn184_testFreezeReflectSetNested() {
    const obj = { nested: { val: "old" } };
    Object.freeze(obj);
    const result = Reflect.set(obj.nested, "val", "new");
    return result && obj.nested.val === "new";
}

// 测试点185：冻结含Uint32Array的数组，Uint32Array内容可修改（浅冻结）
export function Fn185_testFreezeArrayWithUint32() {
    const uintArr = new Uint32Array([1000, 2000]);
    const arr = [uintArr];
    Object.freeze(arr);
    arr[0][0] = 3000;
    return arr[0][0] === 3000;
}

// 测试点187：冻结后对象不可用Object.isFrozen检测子对象（子对象未冻结）
export function Fn187_testFreezeIsFrozenChild() {
    const obj = { child: { val: 1 } };
    Object.freeze(obj);
    return Object.isFrozen(obj) && !Object.isFrozen(obj.child);
}

// 测试点189：冻结含Int32Array的数组，Int32Array内容可修改（浅冻结）
export function Fn189_testFreezeArrayWithInt32() {
    const intArr = new Int32Array([-100, 200]);
    const arr = [intArr];
    Object.freeze(arr);
    arr[0][0] = -300;
    return arr[0][0] === -300;
}


// 测试点191：冻结后对象不可用Reflect.deleteProperty删除子对象属性（允许删除子对象属性）
export function Fn191_testFreezeReflectDeleteChild() {
    const obj = { child: { prop: "val" } };
    Object.freeze(obj);
    const result = Reflect.deleteProperty(obj.child, "prop");
    return result && !obj.child.hasOwnProperty("prop");
}

// 测试点192：冻结数组后不可用some检测子对象修改（子对象可修改）
export function Fn192_testFreezeArraySomeChild() {
    const arr = [{ id: 1 }, { id: 2 }];
    Object.freeze(arr);
    arr[0].id = 3;
    const hasId3 = arr.some(item => item.id === 3);
    return hasId3 && arr[1].id === 2;
}

// 测试点193：冻结含Float64Array的数组，Float64Array内容可修改（浅冻结）
export function Fn193_testFreezeArrayWithFloat64() {
    const floatArr = new Float64Array([1.23, 4.56]);
    const arr = [floatArr];
    Object.freeze(arr);
    arr[0][0] = 7.89;
    return arr[0][0].toFixed(2) === "7.89";
}

// 测试点195：冻结后对象不可用Object.keys检测子对象键（子对象键独立）
export function Fn195_testFreezeObjectKeysChild() {
    const obj = { child: { a: 1, b: 2 } };
    Object.freeze(obj);
    delete obj.child.b;
    const childKeys = Object.keys(obj.child);
    return childKeys.length === 1 && childKeys[0] === "a";
}

// 测试点196：冻结数组后不可用every检测子对象修改（子对象可修改）
export function Fn196_testFreezeArrayEveryChild() {
    const arr = [{ active: true }, { active: true }];
    Object.freeze(arr);
    arr[0].active = false;
    const allActive = arr.every(item => item.active);
    return !allActive && arr[1].active === true;
}

// 测试点197：冻结含BigInt64Array的数组，BigInt64Array内容可修改（浅冻结）
export function Fn197_testFreezeArrayWithBigInt64() {
    const bigArr = new BigInt64Array([10n, 20n]);
    const arr = [bigArr];
    Object.freeze(arr);
    arr[0][0] = 30n;
    return arr[0][0] === 30n;
}

// 测试点199：冻结后对象不可用Reflect.get获取子对象属性（正常获取子对象属性）
export function Fn199_testFreezeReflectGetChild() {
    const obj = { child: { val: "test" } };
    Object.freeze(obj);
    const val = Reflect.get(obj.child, "val");
    return val === "test";
}

// 测试点200：冻结数组后不可用flat获取子数组修改（子数组可修改）
export function Fn200_testFreezeArrayFlatChild() {
    const arr = [1, [2, 3]];
    Object.freeze(arr);
    arr[1][0] = 4;
    const flatArr = arr.flat();
    return flatArr.join(",") === "1,4,3";
}
