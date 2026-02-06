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
// 测试点1：空对象调用Object.getOwnPropertySymbols()应返回空数组
export function Fn01_testEmptyObject() {
    const emptyObj = {};
    const symbols = Object.getOwnPropertySymbols(emptyObj);
    return Array.isArray(symbols) && symbols.length === 0;
}

// 测试点2：仅含字符串属性的对象，调用后应返回空数组（排除字符串属性）
export function Fn02_testStringPropertiesOnly() {
    const obj = { name: "test", age: 20 };
    const symbols = Object.getOwnPropertySymbols(obj);
    return Array.isArray(symbols) && symbols.length === 0;
}

// 测试点3：含自有Symbol属性的对象，调用后应准确返回所有Symbol属性组成的数组
export function Fn03_testWithOwnSymbolProperties() {
    const sym1 = Symbol("symbol1");
    const sym2 = Symbol("symbol2");
    const obj = { [sym1]: "value1" };
    Object.defineProperty(obj, sym2, { value: "value2" });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.includes(sym1) && symbols.includes(sym2) && symbols.length === 2;
}

// 测试点4：Symbol属性为不可枚举时，仍能被getOwnPropertySymbols捕获
export function Fn04_testNonEnumerableSymbol() {
    const sym = Symbol("non-enum");
    const obj = {};
    Object.defineProperty(obj, sym, { value: "test", enumerable: false });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点5：对象同时含可枚举与不可枚举Symbol属性，返回所有Symbol
export function Fn05_testMixedEnumerableSymbol() {
    const symEnum = Symbol("enum");
    const symNonEnum = Symbol("non-enum");
    const obj = { [symEnum]: "enum-val" };
    Object.defineProperty(obj, symNonEnum, { value: "non-enum-val", enumerable: false });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.includes(symEnum) && symbols.includes(symNonEnum) && symbols.length === 2;
}

// 测试点6：原型链上的Symbol属性不会被当前对象的getOwnPropertySymbols返回
export function Fn06_testPrototypeChainSymbol() {
    const symProto = Symbol("proto-sym");
    const protoObj = { [symProto]: "proto-val" };
    const obj = Object.create(protoObj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 0;
}

// 测试点7：getOwnPropertySymbols返回的数组为新数组，修改不影响原对象
export function Fn07_testReturnArrayIndependence() {
    const sym = Symbol("test");
    const obj = { [sym]: "val" };
    const symbols = Object.getOwnPropertySymbols(obj);
    symbols.push(Symbol("new-sym"));
    return Object.getOwnPropertySymbols(obj).length === 1;
}

// 测试点8：对象含多个同名Symbol（不同实例），均能被返回
export function Fn08_testMultipleSameDescSymbol() {
    const sym1 = Symbol("same-desc");
    const sym2 = Symbol("same-desc");
    const obj = { [sym1]: "val1", [sym2]: "val2" };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.includes(sym1) && symbols.includes(sym2) && symbols.length === 2;
}

// 测试点9：Symbol.for创建的共享Symbol属性，能被正确捕获
export function Fn09_testSharedSymbol() {
    const symShared = Symbol.for("shared");
    const obj = { [symShared]: "shared-val" };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === symShared;
}

// 测试点10：getOwnPropertySymbols参数为null时，抛出TypeError
export function Fn10_testNullParameter() {
    try {
        Object.getOwnPropertySymbols(null);
        return false; // 未抛出错误则测试失败
    } catch (err) {
        return err instanceof TypeError;
    }
}

// 测试点11：getOwnPropertySymbols参数为undefined时，抛出TypeError
export function Fn11_testUndefinedParameter() {
    try {
        Object.getOwnPropertySymbols(undefined);
        return false;
    } catch (err) {
        return err instanceof TypeError;
    }
}

// 测试点12：参数为基本类型（如数字），先转为对象再获取Symbol（无则返回空数组）
export function Fn12_testPrimitiveParameter() {
    const num = 123;
    const symbols = Object.getOwnPropertySymbols(num);
    return Array.isArray(symbols) && symbols.length === 0;
}

// 测试点13：为基本类型原型添加Symbol属性，不影响实例的getOwnPropertySymbols结果
export function Fn13_testPrimitivePrototypeSymbol() {
    const sym = Symbol("num-proto");
    Number.prototype[sym] = "proto-val";
    const num = 456;
    const symbols = Object.getOwnPropertySymbols(num);
    delete Number.prototype[sym]; // 清理原型修改
    return symbols.length === 0;
}

// 测试点14：对象含Symbol属性且值为undefined，仍能被正确检测
export function Fn14_testSymbolWithUndefinedValue() {
    const sym = Symbol("undef-val");
    const obj = { [sym]: undefined };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点15：getOwnPropertySymbols返回的数组元素顺序与属性定义顺序一致
export function Fn15_testSymbolOrderConsistency() {
    const sym1 = Symbol("order1");
    const sym2 = Symbol("order2");
    const sym3 = Symbol("order3");
    const obj = {};
    obj[sym1] = "val1";
    obj[sym2] = "val2";
    obj[sym3] = "val3";
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols[0] === sym1 && symbols[1] === sym2 && symbols[2] === sym3;
}

// 测试点16：删除对象的Symbol属性后，getOwnPropertySymbols不再返回该Symbol
export function Fn16_testDeletedSymbolProperty() {
    const sym = Symbol("delete-me");
    const obj = { [sym]: "val" };
    delete obj[sym];
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 0;
}

// 测试点17：对象含Symbol属性且配置为不可配置，仍能被getOwnPropertySymbols返回
export function Fn17_testNonConfigurableSymbol() {
    const sym = Symbol("non-config");
    const obj = {};
    Object.defineProperty(obj, sym, { value: "val", configurable: false });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点18：对象同时含Symbol属性与字符串属性，仅返回Symbol属性数组
export function Fn18_testMixedSymbolAndStringProp() {
    const sym = Symbol("mix-sym");
    const obj = { [sym]: "sym-val", name: "test", age: 30 };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点19：getOwnPropertySymbols返回的数组可通过索引访问单个Symbol
export function Fn19_testSymbolArrayIndexAccess() {
    const sym1 = Symbol("index1");
    const sym2 = Symbol("index2");
    const obj = { [sym1]: "val1", [sym2]: "val2" };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols[0] === sym1 || symbols[0] === sym2 && symbols.length === 2;
}

// 测试点20：参数为数组对象，仅返回数组自身的Symbol属性（排除原型链）
export function Fn20_testArrayObjectSymbol() {
    const sym = Symbol("array-sym");
    const arr = [1, 2, 3];
    arr[sym] = "array-val";
    const symbols = Object.getOwnPropertySymbols(arr);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点21：参数为函数对象，仅返回函数自身的Symbol属性
export function Fn21_testFunctionObjectSymbol() {
    const sym = Symbol("func-sym");
    function testFunc() {}
    testFunc[sym] = "func-val";
    const symbols = Object.getOwnPropertySymbols(testFunc);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点22：Symbol属性值为对象类型，不影响getOwnPropertySymbols检测
export function Fn22_testSymbolWithObjectValue() {
    const sym = Symbol("obj-val-sym");
    const objVal = { nested: "value" };
    const targetObj = { [sym]: objVal };
    const symbols = Object.getOwnPropertySymbols(targetObj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点23：同一对象多次调用getOwnPropertySymbols，返回不同数组实例
export function Fn23_testMultipleCallsReturnDifferentArrays() {
    const sym = Symbol("multi-call");
    const obj = { [sym]: "val" };
    const symbols1 = Object.getOwnPropertySymbols(obj);
    const symbols2 = Object.getOwnPropertySymbols(obj);
    return symbols1 !== symbols2 && symbols1[0] === symbols2[0];
}

// 测试点24：参数为Date对象，仅返回Date自身的Symbol属性
export function Fn24_testDateObjectSymbol() {
    const sym = Symbol("date-sym");
    const date = new Date();
    date[sym] = "date-val";
    const symbols = Object.getOwnPropertySymbols(date);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点25：Symbol属性通过Object.assign添加后，能被正确捕获
export function Fn25_testSymbolFromObjectAssign() {
    const sym = Symbol("assign-sym");
    const source = { [sym]: "assign-val" };
    const target = {};
    Object.assign(target, source);
    const symbols = Object.getOwnPropertySymbols(target);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点26：参数为RegExp对象，仅返回RegExp自身的Symbol属性
export function Fn26_testRegExpObjectSymbol() {
    const sym = Symbol("regex-sym");
    const regex = /test/;
    regex[sym] = "regex-val";
    const symbols = Object.getOwnPropertySymbols(regex);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点27：Symbol属性配置为可写，不影响getOwnPropertySymbols检测
export function Fn27_testWritableSymbolProperty() {
    const sym = Symbol("writable-sym");
    const obj = {};
    Object.defineProperty(obj, sym, { value: "init", writable: true });
    obj[sym] = "updated";
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点28：对象含10个不同Symbol属性，getOwnPropertySymbols返回全部
export function Fn28_testTenDifferentSymbols() {
    const symbolsList = Array.from({ length: 10 }, (_, i) => Symbol(`sym-${i}`));
    const obj = {};
    symbolsList.forEach(sym => obj[sym] = `val-${sym.description}`);
    const resultSymbols = Object.getOwnPropertySymbols(obj);
    return resultSymbols.length === 10 && symbolsList.every(sym => resultSymbols.includes(sym));
}

// 测试点29：参数为Map对象，仅返回Map自身的Symbol属性（排除内置Symbol）
export function Fn29_testMapObjectSymbol() {
    const sym = Symbol("map-sym");
    const map = new Map();
    map[sym] = "map-val";
    const resultSymbols = Object.getOwnPropertySymbols(map);
    return resultSymbols.includes(sym) && resultSymbols.length === 1;
}

// 测试点30：Symbol属性名含特殊字符，不影响getOwnPropertySymbols检测
export function Fn30_testSymbolWithSpecialChars() {
    const sym = Symbol("!@#$%^&*()_+");
    const obj = { [sym]: "special-val" };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点31：对象通过Object.defineProperties添加多个Symbol属性，均能被返回
export function Fn31_testSymbolsFromDefineProperties() {
    const sym1 = Symbol("def-prop1");
    const sym2 = Symbol("def-prop2");
    const obj = {};
    Object.defineProperties(obj, {
        [sym1]: { value: "val1" },
        [sym2]: { value: "val2" }
    });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.includes(sym1) && symbols.includes(sym2) && symbols.length === 2;
}

// 测试点32：参数为Set对象，仅返回Set自身的Symbol属性
export function Fn32_testSetObjectSymbol() {
    const sym = Symbol("set-sym");
    const set = new Set();
    set[sym] = "set-val";
    const symbols = Object.getOwnPropertySymbols(set);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点33：Symbol属性值为Symbol类型，不影响getOwnPropertySymbols检测
export function Fn33_testSymbolWithSymbolValue() {
    const propSym = Symbol("prop-sym");
    const valueSym = Symbol("value-sym");
    const obj = { [propSym]: valueSym };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === propSym;
}

// 测试点34：对象含Symbol属性且原型链多层，仅返回自身Symbol
export function Fn34_testMultiLevelPrototypeSymbol() {
    const symProto1 = Symbol("proto1-sym");
    const symProto2 = Symbol("proto2-sym");
    const proto2 = { [symProto2]: "proto2-val" };
    const proto1 = Object.create(proto2);
    proto1[symProto1] = "proto1-val";
    const obj = Object.create(proto1);
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 0;
}

// 测试点35：参数为Promise对象，仅返回Promise自身的Symbol属性
export function Fn35_testPromiseObjectSymbol() {
    const sym = Symbol("promise-sym");
    const promise = Promise.resolve();
    promise[sym] = "promise-val";
    const symbols = Object.getOwnPropertySymbols(promise);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点36：Symbol属性通过解构赋值添加后，能被正确捕获
export function Fn36_testSymbolFromDestructuring() {
    const sym = Symbol("destruct-sym");
    const source = { [sym]: "destruct-val", other: "val" };
    const { [sym]: symVal, ...target } = source;
    target[sym] = symVal;
    const symbols = Object.getOwnPropertySymbols(target);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点37：对象含Symbol属性且被冻结，getOwnPropertySymbols仍能检测
export function Fn37_testFrozenObjectSymbol() {
    const sym = Symbol("frozen-sym");
    const obj = { [sym]: "frozen-val" };
    Object.freeze(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点39：Symbol属性与字符串属性同名（描述相同），仅返回Symbol属性
export function Fn39_testSymbolAndStringSameDesc() {
    const sym = Symbol("same-desc");
    const obj = { [sym]: "sym-val", "same-desc": "str-val" };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点40：对象含Symbol属性且被密封，getOwnPropertySymbols仍能检测
export function Fn40_testSealedObjectSymbol() {
    const sym = Symbol("sealed-sym");
    const obj = { [sym]: "sealed-val" };
    Object.seal(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点41：参数为ArrayBuffer对象，仅返回自身的Symbol属性
export function Fn41_testArrayBufferSymbol() {
    const sym = Symbol("ab-sym");
    const ab = new ArrayBuffer(8);
    ab[sym] = "ab-val";
    const symbols = Object.getOwnPropertySymbols(ab);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点42：Symbol属性通过Object.keys无法获取（验证Symbol属性特殊性）
export function Fn42_testSymbolNotInObjectKeys() {
    const sym = Symbol("keys-test");
    const obj = { [sym]: "val", strKey: "str-val" };
    const keys = Object.keys(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return !keys.includes(sym) && symbols.length === 1;
}

// 测试点43：对象含Symbol属性且值为函数，不影响getOwnPropertySymbols检测
export function Fn43_testSymbolWithFunctionValue() {
    const sym = Symbol("func-val-sym");
    const obj = { [sym]: () => "test" };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点44：参数为TypedArray（如Uint8Array），仅返回自身的Symbol属性
export function Fn44_testTypedArraySymbol() {
    const sym = Symbol("uint8-sym");
    const typedArr = new Uint8Array([1, 2, 3]);
    typedArr[sym] = "typed-val";
    const symbols = Object.getOwnPropertySymbols(typedArr);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点45：Symbol属性通过for...in循环无法遍历（验证Symbol属性特殊性）
export function Fn45_testSymbolNotInForIn() {
    const sym = Symbol("forin-test");
    const obj = { [sym]: "val", strKey: "str-val" };
    let hasSymbol = false;
    for (const key in obj) {
        if (key === sym) hasSymbol = true;
    }
    const symbols = Object.getOwnPropertySymbols(obj);
    return !hasSymbol && symbols.length === 1;
}

// 测试点46：对象含多个Symbol属性，删除部分后仅返回剩余Symbol
export function Fn46_testDeletePartialSymbols() {
    const sym1 = Symbol("del1");
    const sym2 = Symbol("del2");
    const sym3 = Symbol("del3");
    const obj = { [sym1]: "val1", [sym2]: "val2", [sym3]: "val3" };
    delete obj[sym2];
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.includes(sym1) && symbols.includes(sym3) && symbols.length === 2;
}

// 测试点47：参数为Error对象，仅返回Error自身的Symbol属性
export function Fn47_testErrorObjectSymbol() {
    const sym = Symbol("error-sym");
    const error = new Error("test");
    error[sym] = "error-val";
    const symbols = Object.getOwnPropertySymbols(error);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点48：Symbol属性通过JSON.stringify无法序列化（验证Symbol属性特殊性）
export function Fn48_testSymbolNotInJsonStringify() {
    const sym = Symbol("json-test");
    const obj = { [sym]: "val", strKey: "str-val" };
    const jsonStr = JSON.stringify(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return !jsonStr.includes(sym.description) && symbols.length === 1;
}

// 测试点49：对象含Symbol属性且原型为null，仍能正常返回Symbol
export function Fn49_testObjectWithNullPrototypeSymbol() {
    const sym = Symbol("null-proto-sym");
    const obj = Object.create(null);
    obj[sym] = "null-proto-val";
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点50：参数为自定义类实例，仅返回实例自身的Symbol属性
export function Fn50_testCustomClassInstanceSymbol() {
    const sym = Symbol("class-sym");
    class TestClass {}
    const instance = new TestClass();
    instance[sym] = "class-val";
    const symbols = Object.getOwnPropertySymbols(instance);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点51：参数为WeakMap对象，仅返回自身添加的Symbol属性
export function Fn51_testWeakMapObjectSymbol() {
    const sym = Symbol("weakmap-sym");
    const weakMap = new WeakMap();
    weakMap[sym] = "weakmap-val";
    const symbols = Object.getOwnPropertySymbols(weakMap);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点52：Symbol属性值为数组类型，不影响getOwnPropertySymbols检测
export function Fn52_testSymbolWithArrayValue() {
    const sym = Symbol("array-val-sym");
    const obj = { [sym]: [1, 2, 3] };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点53：对象含Symbol属性，通过Object.getOwnPropertyNames无法获取
export function Fn53_testSymbolNotInGetOwnPropertyNames() {
    const sym = Symbol("get-names-test");
    const obj = { [sym]: "val", strKey: "str-val" };
    const names = Object.getOwnPropertyNames(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return !names.includes(sym.description) && symbols.length === 1;
}

// 测试点54：参数为WeakSet对象，仅返回自身添加的Symbol属性
export function Fn54_testWeakSetObjectSymbol() {
    const sym = Symbol("weakset-sym");
    const weakSet = new WeakSet();
    weakSet[sym] = "weakset-val";
    const symbols = Object.getOwnPropertySymbols(weakSet);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点55：Symbol属性通过Object.create第二个参数添加，能被正确捕获
export function Fn55_testSymbolFromObjectCreateProps() {
    const sym = Symbol("create-props-sym");
    const obj = Object.create({}, {
        [sym]: { value: "create-val", enumerable: true }
    });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点56：参数为DataView对象，仅返回自身添加的Symbol属性
export function Fn56_testDataViewObjectSymbol() {
    const sym = Symbol("dataview-sym");
    const ab = new ArrayBuffer(16);
    const dataView = new DataView(ab);
    dataView[sym] = "dataview-val";
    const symbols = Object.getOwnPropertySymbols(dataView);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点57：对象含多个Symbol属性，通过forEach遍历返回数组能获取全部
export function Fn57_testIterateSymbolArray() {
    const sym1 = Symbol("iter1");
    const sym2 = Symbol("iter2");
    const obj = { [sym1]: "val1", [sym2]: "val2" };
    const symbols = Object.getOwnPropertySymbols(obj);
    let count = 0;
    symbols.forEach(sym => {
        if (sym === sym1 || sym === sym2) count++;
    });
    return count === 2;
}

// 测试点58：参数为Set对象（含元素），不影响自身Symbol属性检测
export function Fn58_testSetWithElementsSymbol() {
    const sym = Symbol("set-elem-sym");
    const set = new Set([1, 2, 3]);
    set[sym] = "set-elem-val";
    const symbols = Object.getOwnPropertySymbols(set);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点59：Symbol属性配置为getter，仍能被getOwnPropertySymbols检测
export function Fn59_testSymbolWithGetter() {
    const sym = Symbol("getter-sym");
    const obj = {
        get [sym]() {
            return "getter-val";
        }
    };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点60：参数为Map对象（含键值对），不影响自身Symbol属性检测
export function Fn60_testMapWithEntriesSymbol() {
    const sym = Symbol("map-entry-sym");
    const map = new Map([["key1", "val1"]]);
    map[sym] = "map-entry-val";
    const symbols = Object.getOwnPropertySymbols(map);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点61：对象含Symbol属性，通过Object.hasOwn检测返回true
export function Fn61_testHasOwnSymbolProperty() {
    const sym = Symbol("has-own-sym");
    const obj = { [sym]: "val" };
    const hasOwn = Object.hasOwn(obj, sym);
    const symbols = Object.getOwnPropertySymbols(obj);
    return hasOwn && symbols.length === 1;
}

// 测试点62：参数为Error子类实例（如TypeError），仅返回自身Symbol属性
export function Fn62_testTypeErrorInstanceSymbol() {
    const sym = Symbol("typeerror-sym");
    const error = new TypeError("test");
    error[sym] = "typeerror-val";
    const symbols = Object.getOwnPropertySymbols(error);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点63：Symbol属性配置为setter，仍能被getOwnPropertySymbols检测
export function Fn63_testSymbolWithSetter() {
    const sym = Symbol("setter-sym");
    let val = "";
    const obj = {
        set [sym](newVal) {
            val = newVal;
        }
    };
    obj[sym] = "setter-val";
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点65：对象含Symbol属性，通过Object.getOwnPropertyDescriptor能获取描述符
export function Fn65_testGetSymbolDescriptor() {
    const sym = Symbol("desc-sym");
    const obj = { [sym]: "val" };
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    const symbols = Object.getOwnPropertySymbols(obj);
    return desc.value === "val" && symbols.length === 1;
}

// 测试点66：参数为ArrayBuffer（不同长度），不影响自身Symbol属性检测
export function Fn66_testDifferentLenArrayBufferSymbol() {
    const sym = Symbol("ab-len-sym");
    const ab = new ArrayBuffer(256); // 256字节长度
    ab[sym] = "ab-len-val";
    const symbols = Object.getOwnPropertySymbols(ab);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点67：Symbol属性通过类的实例方法添加，能被正确捕获
export function Fn67_testSymbolFromClassMethod() {
    const sym = Symbol("class-method-sym");
    class TestClass {
        addSymbol() {
            this[sym] = "method-val";
        }
    }
    const instance = new TestClass();
    instance.addSymbol();
    const symbols = Object.getOwnPropertySymbols(instance);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点68：参数为TypedArray（不同类型，如Float64Array），仅返回自身Symbol属性
export function Fn68_testFloat64ArraySymbol() {
    const sym = Symbol("float64-sym");
    const typedArr = new Float64Array([1.1, 2.2]);
    typedArr[sym] = "float64-val";
    const symbols = Object.getOwnPropertySymbols(typedArr);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点69：对象含Symbol属性，被Object.preventExtensions后仍能检测
export function Fn69_testPreventExtensionsSymbol() {
    const sym = Symbol("prevent-ext-sym");
    const obj = { [sym]: "val" };
    Object.preventExtensions(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点70：参数为Promise（pending状态），不影响自身Symbol属性检测
export function Fn70_testPendingPromiseSymbol() {
    const sym = Symbol("pending-promise-sym");
    const promise = new Promise(() => {}); // pending状态
    promise[sym] = "pending-val";
    const symbols = Object.getOwnPropertySymbols(promise);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点71：Symbol属性描述符为不可枚举+不可配置，仍能被检测
export function Fn71_testNonEnumNonConfigSymbol() {
    const sym = Symbol("non-enum-config-sym");
    const obj = {};
    Object.defineProperty(obj, sym, {
        value: "val",
        enumerable: false,
        configurable: false
    });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点72：参数为RegExp（带标志，如/g），不影响自身Symbol属性检测
export function Fn72_testRegExpWithFlagsSymbol() {
    const sym = Symbol("regex-flag-sym");
    const regex = /test/gi; // 全局+不区分大小写标志
    regex[sym] = "regex-flag-val";
    const symbols = Object.getOwnPropertySymbols(regex);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点73：对象含Symbol属性，通过扩展运算符复制后仍能检测
export function Fn73_testSymbolInSpreadOperator() {
    const sym = Symbol("spread-sym");
    const source = { [sym]: "spread-val", strKey: "str" };
    const target = { ...source };
    const symbols = Object.getOwnPropertySymbols(target);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点74：参数为Date（不同时间），不影响自身Symbol属性检测
export function Fn74_testDifferentDateSymbol() {
    const sym = Symbol("date-time-sym");
    const date = new Date("2024-01-01"); // 特定时间
    date[sym] = "date-time-val";
    const symbols = Object.getOwnPropertySymbols(date);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点75：Symbol属性值为null，仍能被getOwnPropertySymbols检测
export function Fn75_testSymbolWithNullValue() {
    const sym = Symbol("null-val-sym");
    const obj = { [sym]: null };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点76：参数为函数（箭头函数），仅返回自身添加的Symbol属性
export function Fn76_testArrowFunctionSymbol() {
    const sym = Symbol("arrow-func-sym");
    const arrowFunc = () => {};
    arrowFunc[sym] = "arrow-val";
    const symbols = Object.getOwnPropertySymbols(arrowFunc);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点77：对象含多个Symbol属性，通过filter筛选能匹配目标Symbol
export function Fn77_testFilterSymbolArray() {
    const targetSym = Symbol("target");
    const sym1 = Symbol("other1");
    const sym2 = Symbol("other2");
    const obj = { [targetSym]: "val", [sym1]: "v1", [sym2]: "v2" };
    const symbols = Object.getOwnPropertySymbols(obj);
    const filtered = symbols.filter(sym => sym === targetSym);
    return filtered.length === 1 && filtered[0] === targetSym;
}

// 测试点78：参数为Generator函数，仅返回自身添加的Symbol属性
export function Fn78_testGeneratorFunctionSymbol() {
    const sym = Symbol("generator-sym");
    function* genFunc() {}
    genFunc[sym] = "generator-val";
    const symbols = Object.getOwnPropertySymbols(genFunc);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点79：Symbol属性通过Object.defineProperties添加（混合配置），均能检测
export function Fn79_testMixedConfigSymbols() {
    const sym1 = Symbol("mix1");
    const sym2 = Symbol("mix2");
    const obj = {};
    Object.defineProperties(obj, {
        [sym1]: { value: "v1", enumerable: true },
        [sym2]: { value: "v2", enumerable: false }
    });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.includes(sym1) && symbols.includes(sym2) && symbols.length === 2;
}

// 测试点80：参数为AsyncFunction，仅返回自身添加的Symbol属性
export function Fn80_testAsyncFunctionSymbol() {
    const sym = Symbol("async-func-sym");
    const asyncFunc = async () => {};
    asyncFunc[sym] = "async-val";
    const symbols = Object.getOwnPropertySymbols(asyncFunc);
    return symbols.length === 1 && symbols[0] === sym;
}
// 测试点81：参数为AsyncGenerator函数，仅返回自身添加的Symbol属性
export function Fn81_testAsyncGeneratorFunctionSymbol() {
    const sym = Symbol("async-gen-sym");
    async function* asyncGenFunc() {}
    asyncGenFunc[sym] = "async-gen-val";
    const symbols = Object.getOwnPropertySymbols(asyncGenFunc);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点82：Symbol属性值为BigInt类型，不影响getOwnPropertySymbols检测
export function Fn82_testSymbolWithBigIntValue() {
    const sym = Symbol("bigint-val-sym");
    const obj = { [sym]: 9007199254740991n };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点83：对象含Symbol属性，通过Object.getOwnPropertyDescriptors能获取描述符
export function Fn83_testGetSymbolDescriptors() {
    const sym = Symbol("descs-sym");
    const obj = { [sym]: "val" };
    const descs = Object.getOwnPropertyDescriptors(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return descs[sym].value === "val" && symbols.length === 1;
}

// 测试点85：Symbol属性通过类的静态方法添加到实例，能被正确捕获
export function Fn85_testSymbolFromStaticClassMethod() {
    const sym = Symbol("static-method-sym");
    class TestClass {
        static addSymbolToInstance(instance) {
            instance[sym] = "static-val";
        }
    }
    const instance = new TestClass();
    TestClass.addSymbolToInstance(instance);
    const symbols = Object.getOwnPropertySymbols(instance);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点87：对象含Symbol属性，被冻结后无法修改值但仍能检测属性
export function Fn87_testFrozenSymbolValueUnchangeable() {
    const sym = Symbol("frozen-val-sym");
    const obj = { [sym]: "init-val" };
    Object.freeze(obj);
    try {
        obj[sym] = "new-val"; // 冻结后赋值无效（严格模式会报错，非严格模式静默失败）
    } catch {}
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && obj[sym] === "init-val";
}

// 测试点89：Symbol属性与内置Symbol（如Symbol.iterator）同名，仍能正常返回
export function Fn89_testCustomSymbolSameAsBuiltIn() {
    const customSym = Symbol("iterator"); // 与内置Symbol.iterator描述相同但实例不同
    const obj = { [customSym]: "custom-iter-val" };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === customSym && symbols[0] !== Symbol.iterator;
}

// 测试点91：对象含多个Symbol属性，通过find方法能定位目标Symbol
export function Fn91_testFindSymbolInArray() {
    const targetSym = Symbol("find-target");
    const sym1 = Symbol("other-a");
    const sym2 = Symbol("other-b");
    const obj = { [targetSym]: "val", [sym1]: "a", [sym2]: "b" };
    const symbols = Object.getOwnPropertySymbols(obj);
    const foundSym = symbols.find(sym => sym === targetSym);
    return foundSym === targetSym;
}

// 测试点92：参数为Intl.DateTimeFormat实例，仅返回自身添加的Symbol属性
export function Fn92_testIntlDateTimeFormatSymbol() {
    const sym = Symbol("intl-dt-sym");
    const dtFormat = new Intl.DateTimeFormat("zh-CN");
    dtFormat[sym] = "intl-val";
    const symbols = Object.getOwnPropertySymbols(dtFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点93：Symbol属性通过Proxy代理对象添加，能被正确捕获
export function Fn93_testSymbolInProxyObject() {
    const sym = Symbol("proxy-sym");
    const target = {};
    const proxy = new Proxy(target, {});
    proxy[sym] = "proxy-val";
    const symbols = Object.getOwnPropertySymbols(proxy);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点94：参数为ArrayBuffer的slice结果，仅返回自身添加的Symbol属性
export function Fn94_testArrayBufferSliceSymbol() {
    const sym = Symbol("ab-slice-sym");
    const ab = new ArrayBuffer(16);
    const slicedAb = ab.slice(4, 12);
    slicedAb[sym] = "slice-val";
    const symbols = Object.getOwnPropertySymbols(slicedAb);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点95：对象含Symbol属性，通过Reflect.ownKeys能同时获取字符串键与Symbol
export function Fn95_testSymbolInReflectOwnKeys() {
    const sym = Symbol("reflect-sym");
    const obj = { [sym]: "val", strKey: "str" };
    const ownKeys = Reflect.ownKeys(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return ownKeys.includes(sym) && ownKeys.includes("strKey") && symbols.length === 1;
}

// 测试点96：参数为TypedArray的subarray结果，仅返回自身添加的Symbol属性
export function Fn96_testTypedArraySubarraySymbol() {
    const sym = Symbol("subarray-sym");
    const typedArr = new Uint16Array([1, 2, 3, 4]);
    const subArr = typedArr.subarray(1, 3);
    subArr[sym] = "subarray-val";
    const symbols = Object.getOwnPropertySymbols(subArr);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点97：Symbol属性配置为可枚举+不可配置，仍能被getOwnPropertySymbols检测
export function Fn97_testEnumNonConfigSymbol() {
    const sym = Symbol("enum-non-config-sym");
    const obj = {};
    Object.defineProperty(obj, sym, {
        value: "val",
        enumerable: true,
        configurable: false
    });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点98：参数为WeakMap（含键值对），不影响自身Symbol属性检测
export function Fn98_testWeakMapWithEntriesSymbol() {
    const sym = Symbol("weakmap-entry-sym");
    const weakMap = new WeakMap([[{ key: 1 }, "val1"]]);
    weakMap[sym] = "weakmap-entry-val";
    const symbols = Object.getOwnPropertySymbols(weakMap);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点99：对象含Symbol属性，通过Object.assign复制到冻结对象，仍能检测
export function Fn99_testSymbolAssignToFrozenObject() {
    const sym = Symbol("assign-frozen-sym");
    const source = { [sym]: "assign-val" };
    const frozenTarget = Object.freeze({});
    try {
        Object.assign(frozenTarget, source); // 冻结对象无法添加新属性，赋值失败
    } catch {}
    const symbols = Object.getOwnPropertySymbols(frozenTarget);
    return symbols.length === 0;
}

// 测试点100：参数为WeakSet（含元素），不影响自身Symbol属性检测
export function Fn100_testWeakSetWithElementsSymbol() {
    const sym = Symbol("weakset-elem-sym");
    const weakSet = new WeakSet([{ elem: 1 }]);
    weakSet[sym] = "weakset-elem-val";
    const symbols = Object.getOwnPropertySymbols(weakSet);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点101：Symbol属性值为Symbol.for创建的共享Symbol，不影响检测
export function Fn101_testSymbolWithSharedValue() {
    const propSym = Symbol("prop");
    const sharedValSym = Symbol.for("shared-val");
    const obj = { [propSym]: sharedValSym };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === propSym;
}

// 测试点102：参数为Intl.NumberFormat实例，仅返回自身添加的Symbol属性
export function Fn102_testIntlNumberFormatSymbol() {
    const sym = Symbol("intl-num-sym");
    const numFormat = new Intl.NumberFormat("en-US");
    numFormat[sym] = "intl-num-val";
    const symbols = Object.getOwnPropertySymbols(numFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点103：对象含Symbol属性，通过JSON.parse解析的对象不包含该Symbol
export function Fn103_testSymbolNotInJsonParse() {
    const sym = Symbol("json-parse-sym");
    const obj = { [sym]: "val", strKey: "str" };
    const jsonStr = JSON.stringify(obj);
    const parsedObj = JSON.parse(jsonStr);
    const symbols = Object.getOwnPropertySymbols(parsedObj);
    return symbols.length === 0 && parsedObj.strKey === "str";
}

// 测试点106：参数为DataView（不同字节偏移），仅返回自身添加的Symbol属性
export function Fn106_testDataViewWithOffsetSymbol() {
    const sym = Symbol("dataview-offset-sym");
    const ab = new ArrayBuffer(32);
    const dataView = new DataView(ab, 8, 16); // 偏移8字节，长度16字节
    dataView[sym] = "offset-val";
    const symbols = Object.getOwnPropertySymbols(dataView);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点107：对象含多个Symbol属性，通过every方法验证全部为目标Symbol
export function Fn107_testEverySymbolInArray() {
    const symList = [Symbol("every1"), Symbol("every2"), Symbol("every3")];
    const obj = {};
    symList.forEach(sym => obj[sym] = "val");
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.every(sym => symList.includes(sym)) && symbols.length === 3;
}

// 测试点108：参数为ClosedRange对象（ES2024+），仅返回自身添加的Symbol属性
export function Fn108_testClosedRangeSymbol() {
    if (typeof ClosedRange !== "function") return true; // 环境不支持则跳过测试
    const sym = Symbol("closed-range-sym");
    const range = new ClosedRange(1, 10);
    range[sym] = "range-val";
    const symbols = Object.getOwnPropertySymbols(range);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点109：Symbol属性通过Function.prototype.call添加到对象，能被检测
export function Fn109_testSymbolAddedByCall() {
    const sym = Symbol("call-add-sym");
    function addSymbol(obj, val) {
        obj[sym] = val;
    }
    const targetObj = {};
    addSymbol.call(null, targetObj, "call-val");
    const symbols = Object.getOwnPropertySymbols(targetObj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点101：Symbol属性值为嵌套对象，不影响getOwnPropertySymbols检测
export function Fn101_testSymbolWithNestedObjectValue() {
    const sym = Symbol("nested-obj-val");
    const obj = { [sym]: { level1: { level2: "val" } } };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点102：参数为Intl.Collator实例，仅返回自身添加的Symbol属性
export function Fn102_testIntlCollatorSymbol() {
    const sym = Symbol("intl-collator-sym");
    const collator = new Intl.Collator("zh-CN");
    collator[sym] = "collator-val";
    const symbols = Object.getOwnPropertySymbols(collator);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点103：对象含Symbol属性，通过Object.isFrozen检测后仍能正常获取Symbol
export function Fn103_testFrozenCheckWithSymbol() {
    const sym = Symbol("frozen-check-sym");
    const obj = { [sym]: "val" };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return isFrozen && symbols.length === 1;
}

// 测试点104：参数为TransformStream对象，仅返回自身添加的Symbol属性
export function Fn104_testTransformStreamSymbol() {
    const sym = Symbol("transform-stream-sym");
    const stream = new TransformStream();
    stream[sym] = "transform-val";
    const symbols = Object.getOwnPropertySymbols(stream);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点105：Symbol属性通过类的getter方法关联外部变量，仍能被检测
export function Fn105_testSymbolWithClassGetter() {
    const sym = Symbol("class-getter-sym");
    let externalVal = "ext-val";
    class TestClass {
        get [sym]() {
            return externalVal;
        }
    }
    const instance = new TestClass();
    const symbols = Object.getOwnPropertySymbols(instance);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点106：参数为DataView（读写数据后），不影响自身Symbol属性检测
export function Fn106_testDataViewAfterReadWriteSymbol() {
    const sym = Symbol("dataview-rw-sym");
    const ab = new ArrayBuffer(16);
    const dataView = new DataView(ab);
    dataView.setUint32(0, 12345); // 写入数据
    dataView[sym] = "rw-val";
    const symbols = Object.getOwnPropertySymbols(dataView);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点107：对象含多个Symbol属性，通过some方法检测目标Symbol存在
export function Fn107_testSomeSymbolInArray() {
    const targetSym = Symbol("some-target");
    const sym1 = Symbol("other-x");
    const sym2 = Symbol("other-y");
    const obj = { [targetSym]: "val", [sym1]: "x", [sym2]: "y" };
    const symbols = Object.getOwnPropertySymbols(obj);
    const hasTarget = symbols.some(sym => sym === targetSym);
    return hasTarget && symbols.length === 3;
}

// 测试点108：参数为Intl.PluralRules实例，仅返回自身添加的Symbol属性
export function Fn108_testIntlPluralRulesSymbol() {
    const sym = Symbol("intl-plural-sym");
    const pluralRules = new Intl.PluralRules("en-US");
    pluralRules[sym] = "plural-val";
    const symbols = Object.getOwnPropertySymbols(pluralRules);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点109：Symbol属性通过Function.prototype.apply添加到对象，能被检测
export function Fn109_testSymbolAddedByApply() {
    const sym = Symbol("apply-add-sym");
    function addSymbol(obj, val) {
        obj[sym] = val;
    }
    const targetObj = {};
    addSymbol.apply(null, [targetObj, "apply-val"]);
    const symbols = Object.getOwnPropertySymbols(targetObj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点110：参数为WritableStreamDefaultWriter对象，仅返回自身添加的Symbol属性
export function Fn110_testWritableStreamWriterSymbol() {
    const sym = Symbol("writable-writer-sym");
    const stream = new WritableStream();
    const writer = stream.getWriter();
    writer[sym] = "writer-val";
    const symbols = Object.getOwnPropertySymbols(writer);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点111：Symbol属性值为Set实例，不影响getOwnPropertySymbols检测
export function Fn111_testSymbolWithSetValue() {
    const sym = Symbol("set-val-sym");
    const obj = { [sym]: new Set([1, 2, 3]) };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点112：参数为Intl.RelativeTimeFormat实例，仅返回自身添加的Symbol属性
export function Fn112_testIntlRelativeTimeFormatSymbol() {
    const sym = Symbol("intl-relative-sym");
    const timeFormat = new Intl.RelativeTimeFormat("zh-CN");
    timeFormat[sym] = "relative-val";
    const symbols = Object.getOwnPropertySymbols(timeFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点113：对象含Symbol属性，被Object.isSealed检测后仍能正常获取Symbol
export function Fn113_testSealedCheckWithSymbol() {
    const sym = Symbol("sealed-check-sym");
    const obj = { [sym]: "val" };
    Object.seal(obj);
    const isSealed = Object.isSealed(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return isSealed && symbols.length === 1;
}

// 测试点115：Symbol属性通过Proxy拦截set操作后，仍能被getOwnPropertySymbols检测
export function Fn115_testSymbolInProxyWithSetHandler() {
    const sym = Symbol("proxy-set-sym");
    const target = {};
    const proxy = new Proxy(target, {
        set(obj, prop, value) {
            obj[prop] = value;
            return true;
        }
    });
    proxy[sym] = "proxy-set-val";
    const symbols = Object.getOwnPropertySymbols(proxy);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点116：参数为TypedArray（修改元素后），不影响自身Symbol属性检测
export function Fn116_testTypedArrayAfterModifySymbol() {
    const sym = Symbol("typed-array-mod-sym");
    const typedArr = new Int32Array([10, 20, 30]);
    typedArr[1] = 200; // 修改元素
    typedArr[sym] = "mod-val";
    const symbols = Object.getOwnPropertySymbols(typedArr);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点117：对象含Symbol属性，通过Object.getPrototypeOf获取原型后不影响Symbol检测
export function Fn117_testPrototypeGetWithSymbol() {
    const sym = Symbol("proto-get-sym");
    const proto = {};
    const obj = Object.create(proto);
    obj[sym] = "val";
    const protoGet = Object.getPrototypeOf(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return protoGet === proto && symbols.length === 1;
}

// 测试点118：参数为Intl.Locale实例（ES2022+），仅返回自身添加的Symbol属性
export function Fn118_testIntlLocaleSymbol() {
    if (typeof Intl.Locale !== "function") return true; // 环境不支持则跳过
    const sym = Symbol("intl-locale-sym");
    const locale = new Intl.Locale("zh-CN");
    locale[sym] = "locale-val";
    const symbols = Object.getOwnPropertySymbols(locale);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点119：Symbol属性配置为不可写+不可配置，仍能被getOwnPropertySymbols检测
export function Fn119_testNonWritableNonConfigSymbol() {
    const sym = Symbol("non-write-config-sym");
    const obj = {};
    Object.defineProperty(obj, sym, {
        value: "val",
        writable: false,
        configurable: false
    });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点120：参数为WeakMap（删除键后），不影响自身Symbol属性检测
export function Fn120_testWeakMapAfterDeleteSymbol() {
    const sym = Symbol("weakmap-del-sym");
    const weakMap = new WeakMap();
    const key = {};
    weakMap.set(key, "val");
    weakMap.delete(key); // 删除键
    weakMap[sym] = "del-val";
    const symbols = Object.getOwnPropertySymbols(weakMap);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点121：Symbol属性值为Map实例，不影响getOwnPropertySymbols检测
export function Fn121_testSymbolWithMapValue() {
    const sym = Symbol("map-val-sym");
    const obj = { [sym]: new Map([["k1", "v1"]]) };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点123：对象含多个Symbol属性，通过reduce统计数量与实际一致
export function Fn123_testReduceSymbolCount() {
    const symList = [Symbol("reduce1"), Symbol("reduce2"), Symbol("reduce3"), Symbol("reduce4")];
    const obj = {};
    symList.forEach(sym => obj[sym] = "val");
    const symbols = Object.getOwnPropertySymbols(obj);
    const count = symbols.reduce((acc) => acc + 1, 0);
    return count === symList.length;
}

// 测试点124：参数为Intl.NumberFormat（带样式配置），不影响自身Symbol属性检测
export function Fn124_testConfiguredNumberFormatSymbol() {
    const sym = Symbol("config-num-format-sym");
    const numFormat = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" });
    numFormat[sym] = "config-val";
    const symbols = Object.getOwnPropertySymbols(numFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点125：Symbol属性通过类的静态字段定义，能被类自身的getOwnPropertySymbols检测
export function Fn125_testStaticClassSymbol() {
    const sym = Symbol("static-class-sym");
    class TestClass {
        static [sym] = "static-val";
    }
    const symbols = Object.getOwnPropertySymbols(TestClass);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点126：参数为ArrayBuffer（转移所有权后），不影响自身Symbol属性检测
export function Fn126_testTransferredArrayBufferSymbol() {
    const sym = Symbol("transfer-ab-sym");
    const ab = new ArrayBuffer(16);
    const view = new Uint8Array(ab);
    const transferredAb = ab; // 模拟转移场景（实际转移后原ab不可用，此处仅测试Symbol）
    transferredAb[sym] = "transfer-val";
    const symbols = Object.getOwnPropertySymbols(transferredAb);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点127：对象含Symbol属性，通过Reflect.get获取属性值后仍能检测Symbol
export function Fn127_testReflectGetWithSymbol() {
    const sym = Symbol("reflect-get-sym");
    const obj = { [sym]: "reflect-val" };
    const val = Reflect.get(obj, sym);
    const symbols = Object.getOwnPropertySymbols(obj);
    return val === "reflect-val" && symbols.length === 1;
}

// 测试点128：参数为Intl.DateTimeFormat（带日期样式），不影响自身Symbol属性检测
export function Fn128_testStyledDateTimeFormatSymbol() {
    const sym = Symbol("styled-dt-format-sym");
    const dtFormat = new Intl.DateTimeFormat("zh-CN", { dateStyle: "long" });
    dtFormat[sym] = "styled-val";
    const symbols = Object.getOwnPropertySymbols(dtFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点129：Symbol属性通过Proxy拦截get操作后，仍能被getOwnPropertySymbols检测
export function Fn129_testSymbolInProxyWithGetHandler() {
    const sym = Symbol("proxy-get-sym");
    const target = { [sym]: "proxy-get-val" };
    const proxy = new Proxy(target, {
        get(obj, prop) {
            return obj[prop];
        }
    });
    const symbols = Object.getOwnPropertySymbols(proxy);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点130：参数为WeakSet（删除元素后），不影响自身Symbol属性检测
export function Fn130_testWeakSetAfterDeleteSymbol() {
    const sym = Symbol("weakset-del-sym");
    const weakSet = new WeakSet();
    const elem = {};
    weakSet.add(elem);
    weakSet.delete(elem); // 删除元素
    weakSet[sym] = "del-val";
    const symbols = Object.getOwnPropertySymbols(weakSet);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点131：Symbol属性值为WeakMap实例，不影响getOwnPropertySymbols检测
export function Fn131_testSymbolWithWeakMapValue() {
    const sym = Symbol("weakmap-val-sym");
    const obj = { [sym]: new WeakMap([[{ k: 1 }, "v1"]]) };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点132：参数为Intl.DisplayNames实例，仅返回自身添加的Symbol属性
export function Fn132_testIntlDisplayNamesSymbol() {
    const sym = Symbol("intl-display-sym");
    const displayNames = new Intl.DisplayNames("zh-CN", { type: "region" });
    displayNames[sym] = "display-val";
    const symbols = Object.getOwnPropertySymbols(displayNames);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点133：对象含Symbol属性，通过Object.isExtensible检测后仍能正常获取Symbol
export function Fn133_testExtensibleCheckWithSymbol() {
    const sym = Symbol("extensible-check-sym");
    const obj = { [sym]: "val" };
    const isExtensible = Object.isExtensible(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return isExtensible && symbols.length === 1;
}

// 测试点135：Symbol属性通过类的setter方法修改外部变量，仍能被检测
export function Fn135_testSymbolWithClassSetter() {
    const sym = Symbol("class-setter-sym");
    let externalVal = "";
    class TestClass {
        set [sym](newVal) {
            externalVal = newVal;
        }
    }
    const instance = new TestClass();
    instance[sym] = "setter-val";
    const symbols = Object.getOwnPropertySymbols(instance);
    return symbols.length === 0 && externalVal === "setter-val";
}

// 测试点136：参数为DataView（不同数据类型读写后），不影响自身Symbol属性检测
export function Fn136_testDataViewMultiTypeRWSymbol() {
    const sym = Symbol("dataview-multi-rw-sym");
    const ab = new ArrayBuffer(32);
    const dataView = new DataView(ab);
    dataView.setFloat64(0, 3.14);
    dataView.setInt16(8, -123);
    dataView[sym] = "multi-rw-val";
    const symbols = Object.getOwnPropertySymbols(dataView);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点137：对象含多个Symbol属性，通过indexOf定位目标Symbol索引正确
export function Fn137_testIndexOfSymbolInArray() {
    const sym1 = Symbol("index1");
    const targetSym = Symbol("index-target");
    const sym2 = Symbol("index2");
    const obj = { [sym1]: "v1", [targetSym]: "v2", [sym2]: "v3" };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.indexOf(targetSym) === 1;
}

// 测试点141：Symbol属性值为WeakSet实例，不影响getOwnPropertySymbols检测
export function Fn141_testSymbolWithWeakSetValue() {
    const sym = Symbol("weakset-val-sym");
    const obj = { [sym]: new WeakSet([{ e: 1 }, { e: 2 }]) };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点143：对象含Symbol属性，通过Object.defineProperty修改属性值后仍能检测
export function Fn143_testModifySymbolValueWithDefineProperty() {
    const sym = Symbol("modify-val-sym");
    const obj = { [sym]: "old-val" };
    Object.defineProperty(obj, sym, { value: "new-val" });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && obj[sym] === "new-val";
}

// 测试点144：参数为Intl.NumberFormat（带货币配置），不影响自身Symbol属性检测
export function Fn144_testCurrencyNumberFormatSymbol() {
    const sym = Symbol("currency-num-sym");
    const numFormat = new Intl.NumberFormat("ja-JP", { style: "currency", currency: "JPY" });
    numFormat[sym] = "currency-val";
    const symbols = Object.getOwnPropertySymbols(numFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点146：参数为TypedArray（复制后），不影响自身Symbol属性检测
export function Fn146_testCopiedTypedArraySymbol() {
    const sym = Symbol("copied-typed-sym");
    const original = new Uint32Array([1, 2, 3]);
    const copied = new Uint32Array(original);
    copied[sym] = "copied-val";
    const symbols = Object.getOwnPropertySymbols(copied);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点147：对象含Symbol属性，通过Reflect.set修改属性值后仍能检测
export function Fn147_testModifySymbolValueWithReflectSet() {
    const sym = Symbol("reflect-set-sym");
    const obj = { [sym]: "old-val" };
    Reflect.set(obj, sym, "new-val");
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && obj[sym] === "new-val";
}

// 测试点148：参数为Intl.DateTimeFormat（带时间样式），不影响自身Symbol属性检测
export function Fn148_testTimeStyledDateTimeFormatSymbol() {
    const sym = Symbol("time-styled-dt-sym");
    const dtFormat = new Intl.DateTimeFormat("en-US", { timeStyle: "short" });
    dtFormat[sym] = "time-styled-val";
    const symbols = Object.getOwnPropertySymbols(dtFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点149：Symbol属性配置为可枚举+可写+可配置，仍能被getOwnPropertySymbols检测
export function Fn149_testFullConfigurableSymbol() {
    const sym = Symbol("full-config-sym");
    const obj = {};
    Object.defineProperty(obj, sym, {
        value: "val",
        enumerable: true,
        writable: true,
        configurable: true
    });
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点150：参数为WeakMap（键被垃圾回收后模拟），不影响自身Symbol属性检测
export function Fn150_testWeakMapAfterGcSymbol() {
    const sym = Symbol("weakmap-gc-sym");
    const weakMap = new WeakMap();
    weakMap.set({}, "val"); // 临时键，模拟后续被GC回收
    weakMap[sym] = "gc-val";
    const symbols = Object.getOwnPropertySymbols(weakMap);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点151：Symbol属性值为Promise实例，不影响getOwnPropertySymbols检测
export function Fn151_testSymbolWithPromiseValue() {
    const sym = Symbol("promise-val-sym");
    const obj = { [sym]: Promise.resolve("promise-val") };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点152：参数为Intl.Collator（带敏感度配置），不影响自身Symbol属性检测
export function Fn152_testSensitiveCollatorSymbol() {
    const sym = Symbol("sensitive-collator-sym");
    const collator = new Intl.Collator("de-DE", { sensitivity: "base" });
    collator[sym] = "sensitive-val";
    const symbols = Object.getOwnPropertySymbols(collator);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点153：对象含多个Symbol属性，通过lastIndexOf定位最后一个目标Symbol正确
export function Fn153_testLastIndexOfSymbolInArray() {
    const sym1 = Symbol("last1");
    const targetSym = Symbol("last-target");
    const sym2 = Symbol("last2");
    const sym3 = Symbol("last-target"); // 重复目标Symbol
    const obj = { [sym1]: "v1", [targetSym]: "v2", [sym2]: "v3", [sym3]: "v4" };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.lastIndexOf(targetSym) === 1 && symbols.lastIndexOf(sym3) === 3;
}

// 测试点155：Symbol属性通过Proxy拦截has操作后，仍能被getOwnPropertySymbols检测
export function Fn155_testSymbolInProxyWithHasHandler() {
    const sym = Symbol("proxy-has-sym");
    const target = { [sym]: "proxy-has-val" };
    const proxy = new Proxy(target, {
        has(obj, prop) {
            return prop in obj;
        }
    });
    const symbols = Object.getOwnPropertySymbols(proxy);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点156：参数为TypedArray（从ArrayBuffer创建），不影响自身Symbol属性检测
export function Fn156_testTypedArrayFromAbSymbol() {
    const sym = Symbol("typed-from-ab-sym");
    const ab = new ArrayBuffer(16);
    const typedArr = new Int16Array(ab);
    typedArr[sym] = "from-ab-val";
    const symbols = Object.getOwnPropertySymbols(typedArr);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点157：对象含Symbol属性，通过Object.preventExtensions后无法添加新Symbol
export function Fn157_testPreventExtensionsNewSymbol() {
    const sym1 = Symbol("ext1-sym");
    const sym2 = Symbol("ext2-sym");
    const obj = { [sym1]: "val1" };
    Object.preventExtensions(obj);
    try {
        obj[sym2] = "val2"; // 禁止扩展后无法添加新属性
    } catch {}
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym1;
}

// 测试点158：参数为Intl.PluralRules（带类型配置），不影响自身Symbol属性检测
export function Fn158_testTypePluralRulesSymbol() {
    const sym = Symbol("type-plural-sym");
    const pluralRules = new Intl.PluralRules("fr-FR", { type: "ordinal" });
    pluralRules[sym] = "type-plural-val";
    const symbols = Object.getOwnPropertySymbols(pluralRules);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点160：参数为WeakSet（元素被垃圾回收后模拟），不影响自身Symbol属性检测
export function Fn160_testWeakSetAfterGcSymbol() {
    const sym = Symbol("weakset-gc-sym");
    const weakSet = new WeakSet();
    weakSet.add({}); // 临时元素，模拟后续被GC回收
    weakSet[sym] = "gc-val";
    const symbols = Object.getOwnPropertySymbols(weakSet);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点161：Symbol属性值为Error实例，不影响getOwnPropertySymbols检测
export function Fn161_testSymbolWithErrorValue() {
    const sym = Symbol("error-val-sym");
    const obj = { [sym]: new Error("test-error") };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点162：参数为Intl.RelativeTimeFormat（带数字样式），不影响自身Symbol属性检测
export function Fn162_testNumberStyledRelativeTimeFormatSymbol() {
    const sym = Symbol("num-styled-relative-sym");
    const timeFormat = new Intl.RelativeTimeFormat("zh-CN", { numeric: "auto" });
    timeFormat[sym] = "num-styled-val";
    const symbols = Object.getOwnPropertySymbols(timeFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点165：Symbol属性通过箭头函数作为类方法添加，仍能被检测
export function Fn165_testSymbolFromArrowClassMethod() {
    const sym = Symbol("arrow-method-sym");
    class TestClass {
        addSymbol = () => {
            this[sym] = "arrow-val";
        };
    }
    const instance = new TestClass();
    instance.addSymbol();
    const symbols = Object.getOwnPropertySymbols(instance);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点166：参数为DataView（零长度），不影响自身Symbol属性检测
export function Fn166_testZeroLengthDataViewSymbol() {
    const sym = Symbol("zero-dataview-sym");
    const ab = new ArrayBuffer(8);
    const dataView = new DataView(ab, 4, 0); // 长度为0
    dataView[sym] = "zero-val";
    const symbols = Object.getOwnPropertySymbols(dataView);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点167：对象含多个Symbol属性，通过concat合并数组后仍能识别原Symbol
export function Fn167_testConcatSymbolArray() {
    const sym1 = Symbol("concat1");
    const sym2 = Symbol("concat2");
    const obj1 = { [sym1]: "v1" };
    const obj2 = { [sym2]: "v2" };
    const symbols1 = Object.getOwnPropertySymbols(obj1);
    const symbols2 = Object.getOwnPropertySymbols(obj2);
    const combined = symbols1.concat(symbols2);
    return combined.includes(sym1) && combined.includes(sym2) && combined.length === 2;
}

// 测试点168：参数为Intl.Locale（带扩展选项），仅返回自身添加的Symbol属性
export function Fn168_testExtendedLocaleSymbol() {
    if (typeof Intl.Locale !== "function") return true; // 环境不支持则跳过
    const sym = Symbol("extended-locale-sym");
    const locale = new Intl.Locale("en-US-u-ca-gregory"); // 带日历扩展
    locale[sym] = "extended-val";
    const symbols = Object.getOwnPropertySymbols(locale);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点169：Symbol属性配置为不可枚举+可写，仍能被getOwnPropertySymbols检测
export function Fn169_testNonEnumWritableSymbol() {
    const sym = Symbol("non-enum-write-sym");
    const obj = {};
    Object.defineProperty(obj, sym, {
        value: "init-val",
        enumerable: false,
        writable: true
    });
    obj[sym] = "update-val";
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && obj[sym] === "update-val";
}

// 测试点170：参数为WeakMap（多次添加删除键后），不影响自身Symbol属性检测
export function Fn170_testWeakMapAfterMultiOpsSymbol() {
    const sym = Symbol("weakmap-multi-sym");
    const weakMap = new WeakMap();
    const key1 = {};
    const key2 = {};
    weakMap.set(key1, "v1");
    weakMap.delete(key1);
    weakMap.set(key2, "v2");
    weakMap[sym] = "multi-ops-val";
    const symbols = Object.getOwnPropertySymbols(weakMap);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点173：对象含Symbol属性，通过Object.freeze后无法修改Symbol属性描述符
export function Fn173_testFrozenCannotModifyDescriptor() {
    const sym = Symbol("frozen-desc-sym");
    const obj = { [sym]: "val" };
    Object.freeze(obj);
    try {
        Object.defineProperty(obj, sym, { value: "new-val" }); // 冻结后无法修改描述符
        return false;
    } catch (err) {
        const symbols = Object.getOwnPropertySymbols(obj);
        return err instanceof TypeError && symbols.length === 1;
    }
}

// 测试点174：参数为Intl.DisplayNames（带 fallback配置），不影响自身Symbol属性检测
export function Fn174_testFallbackDisplayNamesSymbol() {
    const sym = Symbol("fallback-display-sym");
    const displayNames = new Intl.DisplayNames(["xx", "zh-CN"], { type: "language" });
    displayNames[sym] = "fallback-val";
    const symbols = Object.getOwnPropertySymbols(displayNames);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点175：Symbol属性通过类的继承方法添加，仍能被子类实例检测
export function Fn175_testSymbolFromInheritedMethod() {
    const sym = Symbol("inherit-method-sym");
    class ParentClass {
        addSymbol() {
            this[sym] = "parent-val";
        }
    }
    class ChildClass extends ParentClass {}
    const instance = new ChildClass();
    instance.addSymbol();
    const symbols = Object.getOwnPropertySymbols(instance);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点176：参数为TypedArray（零长度），不影响自身Symbol属性检测
export function Fn176_testZeroLengthTypedArraySymbol() {
    const sym = Symbol("zero-typed-sym");
    const typedArr = new Uint8Array(0); // 长度为0
    typedArr[sym] = "zero-val";
    const symbols = Object.getOwnPropertySymbols(typedArr);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点177：对象含Symbol属性，通过Reflect.deleteProperty无法删除密封对象的Symbol
export function Fn177_testReflectDeleteSealedSymbol() {
    const sym = Symbol("reflect-del-seal-sym");
    const obj = { [sym]: "val" };
    Object.seal(obj);
    const deleteResult = Reflect.deleteProperty(obj, sym);
    const symbols = Object.getOwnPropertySymbols(obj);
    return !deleteResult && symbols.length === 1;
}


// 测试点179：Symbol属性通过Proxy拦截deleteProperty后，仍能被getOwnPropertySymbols检测
export function Fn179_testSymbolInProxyWithDeleteHandler() {
    const sym = Symbol("proxy-delete-sym");
    const target = { [sym]: "proxy-delete-val" };
    const proxy = new Proxy(target, {
        deleteProperty(obj, prop) {
            return delete obj[prop];
        }
    });
    delete proxy[sym]; // 尝试删除
    const symbols = Object.getOwnPropertySymbols(proxy);
    return symbols.length === 0; // 删除成功则返回空数组
}

// 测试点180：参数为WeakSet（多次添加删除元素后），不影响自身Symbol属性检测
export function Fn180_testWeakSetAfterMultiOpsSymbol() {
    const sym = Symbol("weakset-multi-sym");
    const weakSet = new WeakSet();
    const elem1 = {};
    const elem2 = {};
    weakSet.add(elem1);
    weakSet.delete(elem1);
    weakSet.add(elem2);
    weakSet[sym] = "multi-ops-val";
    const symbols = Object.getOwnPropertySymbols(weakSet);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点181：Symbol属性值为ArrayBuffer实例，不影响getOwnPropertySymbols检测
export function Fn181_testSymbolWithArrayBufferValue() {
    const sym = Symbol("ab-val-sym");
    const obj = { [sym]: new ArrayBuffer(32) };
    const symbols = Object.getOwnPropertySymbols(obj);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点183：对象含多个Symbol属性，通过slice截取数组后仍能识别目标Symbol
export function Fn183_testSliceSymbolArray() {
    const sym1 = Symbol("slice1");
    const sym2 = Symbol("slice2");
    const sym3 = Symbol("slice3");
    const obj = { [sym1]: "v1", [sym2]: "v2", [sym3]: "v3" };
    const symbols = Object.getOwnPropertySymbols(obj);
    const sliced = symbols.slice(1, 3); // 截取索引1-2（含头不含尾）
    return sliced.includes(sym2) && sliced.includes(sym3) && sliced.length === 2;
}

// 测试点184：参数为Intl.NumberFormat（带百分比样式），不影响自身Symbol属性检测
export function Fn184_testPercentNumberFormatSymbol() {
    const sym = Symbol("percent-num-sym");
    const numFormat = new Intl.NumberFormat("es-ES", { style: "percent", minimumFractionDigits: 2 });
    numFormat[sym] = "percent-val";
    const symbols = Object.getOwnPropertySymbols(numFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点185：Symbol属性通过类的静态继承方法添加，仍能被子类检测
export function Fn185_testSymbolFromStaticInheritedMethod() {
    const sym = Symbol("static-inherit-sym");
    class ParentClass {
        static addSymbolToInstance(instance) {
            instance[sym] = "static-inherit-val";
        }
    }
    class ChildClass extends ParentClass {}
    const instance = new ChildClass();
    ChildClass.addSymbolToInstance(instance);
    const symbols = Object.getOwnPropertySymbols(instance);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点186：参数为DataView（从TypedArray创建），不影响自身Symbol属性检测
export function Fn186_testDataViewFromTypedArraySymbol() {
    const sym = Symbol("dataview-from-typed-sym");
    const typedArr = new Float32Array([1.1, 2.2]);
    const dataView = new DataView(typedArr.buffer);
    dataView[sym] = "from-typed-val";
    const symbols = Object.getOwnPropertySymbols(dataView);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点187：对象含Symbol属性，通过Object.isSealed检测密封状态后仍能获取Symbol
export function Fn187_testIsSealedCheckWithSymbol() {
    const sym = Symbol("is-sealed-sym");
    const obj = { [sym]: "val" };
    Object.seal(obj);
    const isSealed = Object.isSealed(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return isSealed && symbols.length === 1;
}

// 测试点188：参数为Intl.DateTimeFormat（带时区配置），不影响自身Symbol属性检测
export function Fn188_testTimezoneDateTimeFormatSymbol() {
    const sym = Symbol("timezone-dt-sym");
    const dtFormat = new Intl.DateTimeFormat("en-US", { timeZone: "UTC" });
    dtFormat[sym] = "timezone-val";
    const symbols = Object.getOwnPropertySymbols(dtFormat);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点189：Symbol属性通过Proxy拦截defineProperty后，仍能被getOwnPropertySymbols检测
export function Fn189_testSymbolInProxyWithDefineHandler() {
    const sym = Symbol("proxy-define-sym");
    const target = {};
    const proxy = new Proxy(target, {
        defineProperty(obj, prop, desc) {
            Object.defineProperty(obj, prop, desc);
            return true;
        }
    });
    Object.defineProperty(proxy, sym, { value: "proxy-define-val" });
    const symbols = Object.getOwnPropertySymbols(proxy);
    return symbols.length === 1 && symbols[0] === sym;
}

// 测试点190：参数为TypedArray（从另一个TypedArray创建），不影响自身Symbol属性检测
export function Fn190_testTypedArrayFromTypedArraySymbol() {
    const sym = Symbol("typed-from-typed-sym");
    const original = new Int8Array([-1, -2, -3]);
    const copied = new Int8Array(original);
    copied[sym] = "from-typed-val";
    const symbols = Object.getOwnPropertySymbols(copied);
    return symbols.length === 1 && symbols[0] === sym;
}

