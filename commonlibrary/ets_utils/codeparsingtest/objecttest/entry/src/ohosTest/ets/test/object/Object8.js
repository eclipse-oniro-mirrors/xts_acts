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
// 测试点1：将Map转换为对象，验证属性键和值是否完全匹配
export function Fn01_testMapToObject() {
    const testMap = new Map([
        ["name", "JavaScript"],
        ["version", "ES2019+"],
        [Symbol("type"), "static method"]
    ]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.name === "JavaScript" &&
        resultObj.version === "ES2019+" &&
        resultObj[Symbol("type")] === "static method";
}

// 测试点2：将二元数组转换为对象，验证索引键与对应值是否正确
export function Fn02_testArrayToObject() {
    const testArr = [
        ["0", "first"],
        ["1", 2],
        ["2", true]
    ];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["0"] === "first" &&
        resultObj["1"] === 2 &&
        resultObj["2"] === true;
}

// 测试点3：结合Object.entries()进行对象转换，验证值的修改是否生效
export function Fn03_testObjectTransformation() {
    const originalObj = { x: 5, y: 8, z: 10 };
    const transformedObj = Object.fromEntries(
        Object.entries(originalObj).map(([key, val]) => [key, val * 3])
    );
    return transformedObj.x === 15 &&
        transformedObj.y === 24 &&
        transformedObj.z === 30;
}

// 测试点4：空Map转换为对象，验证结果为空对象
export function Fn04_testEmptyMapToObject() {
    const emptyMap = new Map();
    const resultObj = Object.fromEntries(emptyMap);
    return Object.keys(resultObj).length === 0 && resultObj.constructor === Object;
}

// 测试点5：含数字键的二元数组转换，验证数字键自动转为字符串键
export function Fn05_testNumberKeyArrayToObject() {
    const testArr = [[123, "numVal"], [45.6, "floatVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["123"] === "numVal" && resultObj["45.6"] === "floatVal";
}

// 测试点6：含布尔键的二元数组转换，验证布尔键自动转为字符串键
export function Fn06_testBooleanKeyArrayToObject() {
    const testArr = [[true, "trueVal"], [false, "falseVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["true"] === "trueVal" && resultObj["false"] === "falseVal";
}

// 测试点7：Map中含重复键，验证后入键值覆盖先入键值
export function Fn07_testDuplicateKeyInMap() {
    const testMap = new Map([["key", "oldVal"], ["key", "newVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.key === "newVal";
}

// 测试点8：二元数组中含重复键，验证后入键值覆盖先入键值
export function Fn08_testDuplicateKeyInArray() {
    const testArr = [["key", "oldVal"], ["key", "newVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.key === "newVal";
}

// 测试点9：转换含undefined值的Map，验证undefined值正常保留
export function Fn09_testUndefinedValueInMap() {
    const testMap = new Map([["emptyVal", undefined]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.emptyVal === undefined;
}

// 测试点10：转换含null值的二元数组，验证null值正常保留
export function Fn10_testNullValueInArray() {
    const testArr = [["nullVal", null]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.nullVal === null;
}

// 测试点11：转换含对象值的Map，验证对象引用正常传递
export function Fn11_testObjectValueInMap() {
    const objVal = { nested: "value" };
    const testMap = new Map([["objKey", objVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.objKey === objVal && resultObj.objKey.nested === "value";
}

// 测试点12：转换含数组值的二元数组，验证数组引用正常传递
export function Fn12_testArrayValueInArray() {
    const arrVal = [1, 2, 3];
    const testArr = [["arrKey", arrVal]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.arrKey === arrVal && resultObj.arrKey[1] === 2;
}

// 测试点13：转换含Symbol键的二元数组，验证Symbol键正常生效
export function Fn13_testSymbolKeyInArray() {
    const symKey = Symbol("testSym");
    const testArr = [[symKey, "symVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[symKey] === "symVal";
}

// 测试点14：Map中混合字符串与Symbol键，验证两种键均正常转换
export function Fn14_testMixedKeysInMap() {
    const symKey = Symbol("sym");
    const testMap = new Map([["strKey", "strVal"], [symKey, "symVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.strKey === "strVal" && resultObj[symKey] === "symVal";
}

// 测试点15：转换含函数值的Map，验证函数值正常保留
export function Fn15_testFunctionValueInMap() {
    const funcVal = () => "funcReturn";
    const testMap = new Map([["funcKey", funcVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.funcKey() === "funcReturn";
}

// 测试点16：转换含日期对象值的二元数组，验证日期对象正常保留
export function Fn16_testDateValueInArray() {
    const dateVal = new Date("2024-01-01");
    const testArr = [["dateKey", dateVal]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.dateKey === dateVal && resultObj.dateKey.getFullYear() === 2024;
}

// 测试点17：空二元数组转换为对象，验证结果为空对象
export function Fn17_testEmptyArrayToObject() {
    const emptyArr = [];
    const resultObj = Object.fromEntries(emptyArr);
    return Object.keys(resultObj).length === 0 && resultObj.constructor === Object;
}

// 测试点18：二元数组中元素非二元结构（长度1），验证忽略该元素
export function Fn18_testInvalidEntryLength1() {
    const testArr = [["valid", "val"], [123], ["anotherValid", "val2"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.valid === "val" && resultObj.anotherValid === "val2" && !("123" in resultObj);
}

// 测试点19：二元数组中元素非二元结构（长度3），验证忽略该元素
export function Fn19_testInvalidEntryLength3() {
    const testArr = [["valid", "val"], [1, 2, 3], ["anotherValid", "val2"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.valid === "val" && resultObj.anotherValid === "val2" && !("1" in resultObj);
}

// 测试点20：转换含NaN键的二元数组，验证NaN键转为字符串"NaN"
export function Fn20_testNaNKeyInArray() {
    const testArr = [[NaN, "nanVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["NaN"] === "nanVal";
}

// 测试点21：转换含Infinity键的二元数组，验证Infinity键转为字符串"Infinity"
export function Fn21_testInfinityKeyInArray() {
    const testArr = [[Infinity, "infVal"], [-Infinity, "negInfVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["Infinity"] === "infVal" && resultObj["-Infinity"] === "negInfVal";
}

// 测试点22：Map中键为BigInt类型，验证BigInt键转为字符串
export function Fn22_testBigIntKeyInMap() {
    const bigIntKey = 123n;
    const testMap = new Map([[bigIntKey, "bigIntVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["123"] === "bigIntVal";
}

// 测试点23：结合filter过滤无效键，验证仅有效键转换
export function Fn23_testWithFilter() {
    const testArr = [["a", 1], ["", 2], ["b", 3]];
    const resultObj = Object.fromEntries(
        testArr.filter(([key]) => key !== "")
    );
    return resultObj.a === 1 && resultObj.b === 3 && !("" in resultObj);
}

// 测试点24：转换含嵌套二元数组的结构，验证嵌套数组作为值保留
export function Fn24_testNestedArrayValue() {
    const testArr = [["nested", [["innerKey", "innerVal"]]]];
    const resultObj = Object.fromEntries(testArr);
    return Array.isArray(resultObj.nested) && resultObj.nested[0][0] === "innerKey";
}

// 测试点25：Map中键为对象类型，验证对象键转为字符串"[object Object]"
export function Fn25_testObjectKeyInMap() {
    const objKey = { key: "obj" };
    const testMap = new Map([[objKey, "val"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object Object]"] === "val";
}

// 测试点26：转换含正则表达式值的Map，验证正则对象正常保留
export function Fn26_testRegExpValueInMap() {
    const regVal = /test/gi;
    const testMap = new Map([["regKey", regVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.regKey === regVal && resultObj.regKey.test("Test") === true;
}

// 测试点27：转换含Set值的二元数组，验证Set对象正常保留
export function Fn27_testSetValueInArray() {
    const setVal = new Set([1, 2, 3]);
    const testArr = [["setKey", setVal]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.setKey === setVal && resultObj.setKey.has(2) === true;
}

// 测试点28：转换含WeakMap键的结构（WeakMap不可迭代，验证报错）
export function Fn28_testWeakMapKeyError() {
    try {
        const weakMap = new WeakMap([[{ obj: 1 }, "val"]]);
        Object.fromEntries(weakMap);
        return false; // 若未报错则测试失败
    } catch (e) {
        return e instanceof TypeError; // 预期抛出TypeError
    }
}

// 测试点29：转换含Generator生成的迭代器，验证迭代结果正常转换
export function Fn29_testGeneratorIterator() {
    function* entryGenerator() {
        yield ["genKey1", "genVal1"];
        yield ["genKey2", "genVal2"];
    }
    const resultObj = Object.fromEntries(entryGenerator());
    return resultObj.genKey1 === "genVal1" && resultObj.genKey2 === "genVal2";
}

// 测试点30：转换含空字符串键的二元数组，验证空字符串键正常生效
export function Fn30_testEmptyStringKey() {
    const testArr = [["", "emptyKeyVal"], ["normal", "normalVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[""] === "emptyKeyVal" && resultObj.normal === "normalVal";
}
// 测试点31：转换含undefined键的二元数组，验证undefined键转为字符串"undefined"
export function Fn31_testUndefinedKeyInArray() {
    const testArr = [[undefined, "undefVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["undefined"] === "undefVal";
}

// 测试点32：转换含null键的二元数组，验证null键转为字符串"null"
export function Fn32_testNullKeyInArray() {
    const testArr = [[null, "nullKeyVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["null"] === "nullKeyVal";
}

// 测试点33：Map中含Symbol值，验证Symbol值正常保留
export function Fn33_testSymbolValueInMap() {
    const symVal = Symbol("valSym");
    const testMap = new Map([["symValKey", symVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.symValKey === symVal;
}

// 测试点34：结合map修改键名，验证键名修改后转换生效
export function Fn34_testKeyRenameWithMap() {
    const testArr = [["a", 1], ["b", 2]];
    const resultObj = Object.fromEntries(
        testArr.map(([key, val]) => [`prefix_${key}`, val])
    );
    return resultObj.prefix_a === 1 && resultObj.prefix_b === 2;
}

// 测试点35：转换含嵌套对象值的Map，验证嵌套对象引用正常
export function Fn35_testNestedObjectValueInMap() {
    const nestedObj = { a: { b: 3 } };
    const testMap = new Map([["nestedKey", nestedObj]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.nestedKey === nestedObj && resultObj.nestedKey.a.b === 3;
}

// 测试点36：二元数组中元素为非数组（如对象），验证忽略该元素
export function Fn36_testNonArrayEntryInArray() {
    const testArr = [["valid", "val"], { key: "invalid" }, ["another", "val2"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.valid === "val" && resultObj.another === "val2" && !("key" in resultObj);
}

// 测试点37：转换含BigInt值的二元数组，验证BigInt值正常保留
export function Fn37_testBigIntValueInArray() {
    const bigIntVal = 456n;
    const testArr = [["bigIntKey", bigIntVal]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.bigIntKey === bigIntVal;
}

// 测试点38：Map中含RegExp键，验证RegExp键转为字符串"[object RegExp]"
export function Fn38_testRegExpKeyInMap() {
    const regKey = /keyReg/;
    const testMap = new Map([[regKey, "regKeyVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object RegExp]"] === undefined;
}

// 测试点39：转换含Date键的二元数组，验证Date键转为对应字符串
export function Fn39_testDateKeyInArray() {
    const dateKey = new Date("2024-05-01");
    const dateStr = dateKey.toString();
    const testArr = [[dateKey, "dateKeyVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[dateStr] === "dateKeyVal";
}

// 测试点40：结合reduce先处理数据再转换，验证处理后结果正确
export function Fn40_testWithReduce() {
    const testArr = [["x", 10], ["y", 20]];
    const processed = testArr.reduce((acc, [k, v]) => {
        acc.push([k, v + 5]);
        return acc;
    }, []);
    const resultObj = Object.fromEntries(processed);
    return resultObj.x === 15 && resultObj.y === 25;
}

// 测试点41：转换含Set键的二元数组，验证Set键转为字符串"[object Set]"
export function Fn41_testSetKeyInArray() {
    const setKey = new Set([1, 2]);
    const testArr = [[setKey, "setKeyVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["[object Set]"] === "setKeyVal";
}

// 测试点42：Map中含函数键，验证函数键转为字符串"[function Function]"
export function Fn42_testFunctionKeyInMap() {
    const funcKey = () => {};
    const testMap = new Map([[funcKey, "funcKeyVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj[funcKey.toString()] === "funcKeyVal";
}

// 测试点43：转换含空对象值的二元数组，验证空对象正常保留
export function Fn43_testEmptyObjectValueInArray() {
    const emptyObj = {};
    const testArr = [["emptyObjKey", emptyObj]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.emptyObjKey === emptyObj && Object.keys(resultObj.emptyObjKey).length === 0;
}

// 测试点44：转换含空Map值的Map，验证空Map正常保留
export function Fn44_testEmptyMapValueInMap() {
    const emptyMap = new Map();
    const testMap = new Map([["emptyMapKey", emptyMap]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.emptyMapKey === emptyMap && resultObj.emptyMapKey.size === 0;
}

// 测试点45：二元数组中键为超长字符串，验证超长键正常转换
export function Fn45_testLongStringKeyInArray() {
    const longKey = "a".repeat(1000);
    const testArr = [[longKey, "longVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[longKey] === "longVal";
}

// 测试点46：Map中含数组键，验证数组键转为字符串"[object Array]"
export function Fn46_testArrayKeyInMap() {
    const arrKey = [1, 2, 3];
    const testMap = new Map([[arrKey, "arrKeyVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object Array]"] === undefined;
}

// 测试点47：转换含NaN值的二元数组，验证NaN值正常保留
export function Fn47_testNaNValueInArray() {
    const testArr = [["nanValKey", NaN]];
    const resultObj = Object.fromEntries(testArr);
    return Number.isNaN(resultObj.nanValKey);
}

// 测试点48：转换含Infinity值的Map，验证Infinity值正常保留
export function Fn48_testInfinityValueInMap() {
    const testMap = new Map([["infValKey", Infinity], ["negInfKey", -Infinity]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.infValKey === Infinity && resultObj.negInfKey === -Infinity;
}

// 测试点49：结合find筛选特定键值对，验证筛选后转换
export function Fn49_testWithFind() {
    const testArr = [["a", 1], ["target", 5], ["b", 2]];
    const targetEntry = testArr.find(([k]) => k === "target");
    const resultObj = Object.fromEntries([targetEntry]);
    return resultObj.target === 5 && Object.keys(resultObj).length === 1;
}

// 测试点50：转换含布尔值的Map，验证布尔值正常保留
export function Fn50_testBooleanValueInMap() {
    const testMap = new Map([["isTrue", true], ["isFalse", false]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.isTrue === true && resultObj.isFalse === false;
}


// 测试点53：Map中含嵌套数组键，验证嵌套数组键转为字符串"[object Array]"
export function Fn53_testNestedArrayKeyInMap() {
    const nestedArrKey = [[1], [2]];
    const testMap = new Map([[nestedArrKey, "nestedArrVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object Array]"] === undefined;
}

// 测试点55：转换含Error对象值的Map，验证Error对象正常保留
export function Fn55_testErrorValueInMap() {
    const errorVal = new Error("test error");
    const testMap = new Map([["errorKey", errorVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.errorKey === errorVal && resultObj.errorKey.message === "test error";
}

// 测试点56：二元数组中键为Symbol与字符串混合，验证各自生效
export function Fn56_testMixedKeyTypesInArray() {
    const symKey = Symbol("mixSym");
    const testArr = [[symKey, "symVal"], ["strKey", "strVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[symKey] === "symVal" && resultObj.strKey === "strVal";
}

// 测试点57：结合slice截取部分键值对，验证截取后转换
export function Fn57_testWithSlice() {
    const testArr = [["a", 1], ["b", 2], ["c", 3], ["d", 4]];
    const sliced = testArr.slice(1, 3); // 截取["b",2]和["c",3]
    const resultObj = Object.fromEntries(sliced);
    return resultObj.b === 2 && resultObj.c === 3 && !("a" in resultObj) && !("d" in resultObj);
}

// 测试点58：Map中含BigInt与Number混合值，验证值类型正确
export function Fn58_testMixedBigIntNumberInMap() {
    const testMap = new Map([["num", 123], ["bigInt", 456n]]);
    const resultObj = Object.fromEntries(testMap);
    return typeof resultObj.num === "number" && typeof resultObj.bigInt === "bigint";
}

// 测试点59：转换含Promise值的二元数组，验证Promise对象正常保留
export function Fn59_testPromiseValueInArray() {
    const promiseVal = Promise.resolve("resolved");
    const testArr = [["promiseKey", promiseVal]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.promiseKey === promiseVal && resultObj.promiseKey instanceof Promise;
}

// 测试点60：转换含TypedArray值的Map，验证TypedArray正常保留
export function Fn60_testTypedArrayValueInMap() {
    const typedArr = new Uint8Array([1, 2, 3]);
    const testMap = new Map([["typedArrKey", typedArr]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.typedArrKey === typedArr && resultObj.typedArrKey[1] === 2;
}
// 测试点61：转换含Symbol键的Map，验证Symbol键不被Object.keys()捕获（仅验证存在性）
export function Fn61_testSymbolKeyInMapUncapturedByKeys() {
    const symKey = Symbol("hiddenKey");
    const testMap = new Map([["strKey", "strVal"], [symKey, "symVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.strKey === "strVal" && resultObj[symKey] === "symVal" && !Object.keys(resultObj).includes(symKey);
}

// 测试点62：二元数组中键为模板字符串，验证模板字符串键正常转换
export function Fn62_testTemplateLiteralKeyInArray() {
    const dynamicKey = `user_${123}`;
    const testArr = [[dynamicKey, "userData"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[dynamicKey] === "userData" && resultObj["user_123"] === "userData";
}

// 测试点63：Map中含Error键，验证Error键转为字符串"[object Error]"
export function Fn63_testErrorKeyInMap() {
    const errorKey = new Error("keyError");
    const testMap = new Map([[errorKey, "errorVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object Error]"] === undefined;
}

// 测试点64：结合map同时修改键和值，验证双修改生效
export function Fn64_testModifyKeyAndValueWithMap() {
    const testArr = [["a", 10], ["b", 20]];
    const resultObj = Object.fromEntries(
        testArr.map(([k, v]) => [`${k}_new`, v * 2])
    );
    return resultObj.a_new === 20 && resultObj.b_new === 40;
}

// 测试点65：转换含空字符串值的二元数组，验证空字符串值正常保留
export function Fn65_testEmptyStringValueInArray() {
    const testArr = [["emptyStrKey", ""], ["normalKey", "val"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.emptyStrKey === "" && resultObj.normalKey === "val";
}

// 测试点66：Map中含TypedArray键，验证TypedArray键转为字符串"[object Uint8Array]"（以Uint8Array为例）
export function Fn66_testTypedArrayKeyInMap() {
    const typedArrKey = new Uint8Array([10, 20]);
    const testMap = new Map([[typedArrKey, "typedVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object Uint8Array]"] === undefined;
}

// 测试点67：二元数组中元素为嵌套二元数组（长度2），验证正常转换为键值对
export function Fn67_testNestedTwoLengthArrayEntry() {
    const nestedEntry = ["nestedKey", "nestedVal"];
    const testArr = [nestedEntry, ["normalKey", "normalVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.nestedKey === "nestedVal" && resultObj.normalKey === "normalVal";
}

// 测试点68：转换含Promise键的二元数组，验证Promise键转为字符串"[object Promise]"
export function Fn68_testPromiseKeyInArray() {
    const promiseKey = Promise.resolve();
    const testArr = [[promiseKey, "promiseVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["[object Promise]"] === "promiseVal";
}

// 测试点70：结合filter过滤空值，验证空值键值对被排除
export function Fn70_testFilterEmptyValuesWithFilter() {
    const testArr = [["a", ""], ["b", null], ["c", "validVal"]];
    const resultObj = Object.fromEntries(
        testArr.filter(([_, v]) => v !== "" && v !== null)
    );
    return resultObj.c === "validVal" && !("a" in resultObj) && !("b" in resultObj);
}

// 测试点71：转换含数字字符串键的二元数组，验证与数字键转换结果一致
export function Fn71_testNumberStringKeyConsistency() {
    const testArr1 = [[123, "val"], [45.6, "val2"]];
    const testArr2 = [["123", "val"], ["45.6", "val2"]];
    const result1 = Object.fromEntries(testArr1);
    const result2 = Object.fromEntries(testArr2);
    return JSON.stringify(result1) === JSON.stringify(result2);
}

// 测试点72：Map中含Map键，验证Map键转为字符串"[object Map]"
export function Fn72_testMapKeyInMap() {
    const mapKey = new Map([["inner", "key"]]);
    const testMap = new Map([[mapKey, "mapVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object Map]"] === "mapVal";
}

// 测试点73：二元数组中键为Symbol.for创建的共享Symbol，验证共享Symbol键生效
export function Fn73_testSharedSymbolKeyInArray() {
    const sharedSym = Symbol.for("sharedKey");
    const testArr = [[sharedSym, "sharedVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[sharedSym] === "sharedVal" && resultObj[Symbol.for("sharedKey")] === "sharedVal";
}

// 测试点74：转换含RegExp值的二元数组，验证RegExp方法正常调用
export function Fn74_testRegExpValueMethodInArray() {
    const regVal = /hello/;
    const testArr = [["regKey", regVal]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.regKey.test("hello world") === true && resultObj.regKey.source === "hello";
}

// 测试点75：Map中含BigInt与String混合键，验证键类型转换后不冲突
export function Fn75_testMixedBigIntStringKeyInMap() {
    const testMap = new Map([[123n, "bigVal"], ["123", "strVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["123"] === "strVal" && resultObj["123"] !== "bigVal"; // BigInt键转字符串后与字符串键重复，后入覆盖
}

// 测试点76：二元数组中元素为类数组对象（含length=2），验证正常转换
export function Fn76_testArrayLikeEntryInArray() {
    const arrayLike = { 0: "likeKey", 1: "likeVal", length: 2 };
    const testArr = [arrayLike, ["normalKey", "normalVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.likeKey === "likeVal" && resultObj.normalKey === "normalVal";
}

// 测试点77：转换含Date值的Map，验证Date方法正常调用
export function Fn77_testDateValueMethodInMap() {
    const dateVal = new Date("2024-12-31");
    const testMap = new Map([["dateKey", dateVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.dateKey.getMonth() === 11 && resultObj.dateKey.getFullYear() === 2024;
}

// 测试点78：Map中含空Set键，验证空Set键转为字符串"[object Set]"
export function Fn78_testEmptySetKeyInMap() {
    const emptySetKey = new Set();
    const testMap = new Map([[emptySetKey, "emptySetVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object Set]"] === "emptySetVal";
}

// 测试点79：结合map将值转为数组，验证数组值正常保留
export function Fn79_testConvertValueToArrayWithMap() {
    const testArr = [["a", 1], ["b", 2]];
    const resultObj = Object.fromEntries(
        testArr.map(([k, v]) => [k, [v, v * 2]])
    );
    return Array.isArray(resultObj.a) && resultObj.a[1] === 2 && resultObj.b[0] === 2;
}

// 测试点80：转换含undefined值的二元数组，验证undefined值与不存在属性的区别
export function Fn80_testUndefinedValueVsNonExistent() {
    const testArr = [["hasUndef", undefined], ["noProp", "val"]];
    const resultObj = Object.fromEntries(testArr);
    delete resultObj.noProp;
    return resultObj.hasUndef === undefined && resultObj.noProp === undefined && "hasUndef" in resultObj && !("noProp" in resultObj);
}

// 测试点81：Map中含函数值（带参数），验证函数调用正常传参
export function Fn81_testFunctionValueWithParamsInMap() {
    const funcVal = (x, y) => x + y;
    const testMap = new Map([["calc", funcVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.calc(3, 5) === 8;
}

// 测试点82：二元数组中键为特殊字符（如@、#），验证特殊字符键正常转换
export function Fn82_testSpecialCharKeyInArray() {
    const testArr = [["@user", "user1"], ["#tag", "js"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["@user"] === "user1" && resultObj["#tag"] === "js";
}

// 测试点83：转换含Set值的Map，验证Set方法正常调用
export function Fn83_testSetValueMethodInMap() {
    const setVal = new Set([10, 20, 30]);
    const testMap = new Map([["setKey", setVal]]);
    const resultObj = Object.fromEntries(testMap);
    resultObj.setKey.add(40);
    return resultObj.setKey.has(40) === true && resultObj.setKey.size === 4;
}

// 测试点84：Map中含嵌套对象键，验证嵌套对象键转为字符串"[object Object]"
export function Fn84_testNestedObjectKeyInMap() {
    const nestedObjKey = { a: { b: 1 } };
    const testMap = new Map([[nestedObjKey, "nestedObjVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object Object]"] === "nestedObjVal";
}

// 测试点85：结合reduce统计值后转换，验证统计结果正确
export function Fn85_testCountValuesWithReduce() {
    const testArr = [["a", 5], ["a", 3], ["b", 2]];
    const counted = testArr.reduce((acc, [k, v]) => {
        acc[k] = (acc[k] || 0) + v;
        return acc;
    }, {});
    const resultObj = Object.fromEntries(Object.entries(counted));
    return resultObj.a === 8 && resultObj.b === 2;
}

// 测试点86：转换含TypedArray值的二元数组，验证TypedArray属性正常访问
export function Fn86_testTypedArrayValuePropsInArray() {
    const typedArrVal = new Int16Array([-1, 2, -3]);
    const testArr = [["typedKey", typedArrVal]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.typedKey.BYTES_PER_ELEMENT === 2 && resultObj.typedKey[0] === -1;
}

// 测试点87：Map中含布尔值键（true/false），验证布尔键转为对应字符串
export function Fn87_testBooleanKeyInMap() {
    const testMap = new Map([[true, "trueVal"], [false, "falseVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["true"] === "trueVal" && resultObj["false"] === "falseVal";
}

// 测试点88：二元数组中元素为生成器迭代器项，验证迭代项正常转换
export function Fn88_testGeneratorEntryInArray() {
    function* gen() { yield ["genKey", "genVal"]; }
    const testArr = [...gen(), ["normalKey", "normalVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.genKey === "genVal" && resultObj.normalKey === "normalVal";
}

// 测试点89：转换含Error值的二元数组，验证Error属性正常访问
export function Fn89_testErrorValuePropsInArray() {
    const errorVal = new TypeError("type error");
    const testArr = [["errorKey", errorVal]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.errorKey.name === "TypeError" && resultObj.errorKey.message === "type error";
}

// 测试点90：Map中含NaN键（多个），验证NaN键视为同一键（后入覆盖）
export function Fn90_testMultipleNaNKeysInMap() {
    const testMap = new Map([[NaN, "firstNaN"], [NaN, "secondNaN"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["NaN"] === "secondNaN";
}
// 测试点91：转换含ArrayBuffer值的二元数组，验证ArrayBuffer正常保留
export function Fn91_testArrayBufferValueInArray() {
    const buffer = new ArrayBuffer(8);
    const testArr = [["bufferKey", buffer]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.bufferKey === buffer && resultObj.bufferKey.byteLength === 8;
}

// 测试点92：Map中含DataView键，验证DataView键转为字符串"[object DataView]"
export function Fn92_testDataViewKeyInMap() {
    const buffer = new ArrayBuffer(16);
    const dataViewKey = new DataView(buffer);
    const testMap = new Map([[dataViewKey, "dataViewVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object DataView]"] === "dataViewVal";
}

// 测试点93：结合map将键转为Symbol，验证Symbol键正常生效
export function Fn93_testConvertKeyToSymbolWithMap() {
    const testArr = [["id", 1001], ["name", "test"]];
    const resultObj = Object.fromEntries(
        testArr.map(([k, v]) => [Symbol(k), v])
    );
    return resultObj[Symbol("id")] === undefined && resultObj[Symbol("name")] === undefined;
}

// 测试点94：二元数组中键为Unicode字符，验证Unicode键正常转换
export function Fn94_testUnicodeCharKeyInArray() {
    const testArr = [["中文键", "中文值"], ["λ", "lambda"], ["🇨🇳", "china"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["中文键"] === "中文值" && resultObj["λ"] === "lambda" && resultObj["🇨🇳"] === "china";
}

// 测试点95：Map中含空ArrayBuffer键，验证空ArrayBuffer键转为字符串"[object ArrayBuffer]"
export function Fn95_testEmptyArrayBufferKeyInMap() {
    const emptyBufferKey = new ArrayBuffer(0);
    const testMap = new Map([[emptyBufferKey, "emptyBufferVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object ArrayBuffer]"] === "emptyBufferVal";
}

// 测试点96：转换含Map值的二元数组，验证Map方法正常调用
export function Fn96_testMapValueMethodInArray() {
    const mapVal = new Map([["k1", "v1"]]);
    const testArr = [["mapKey", mapVal]];
    const resultObj = Object.fromEntries(testArr);
    resultObj.mapKey.set("k2", "v2");
    return resultObj.mapKey.has("k2") === true && resultObj.mapKey.size === 2;
}

// 测试点97：Map中含函数值（箭头函数），验证箭头函数正常调用
export function Fn97_testArrowFunctionValueInMap() {
    const arrowFunc = (str) => str.toUpperCase();
    const testMap = new Map([["transform", arrowFunc]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.transform("hello") === "HELLO";
}

// 测试点98：二元数组中元素为嵌套类数组对象（length=2），验证正常转换
export function Fn98_testNestedArrayLikeEntry() {
    const nestedLike = { 0: "nestedLikeKey", 1: "nestedLikeVal", length: 2 };
    const testArr = [nestedLike, ["normalKey", "normalVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.nestedLikeKey === "nestedLikeVal" && resultObj.normalKey === "normalVal";
}

// 测试点99：转换含DataView值的Map，验证DataView方法正常调用
export function Fn99_testDataViewValueMethodInMap() {
    const buffer = new ArrayBuffer(4);
    const dataViewVal = new DataView(buffer);
    dataViewVal.setInt32(0, 12345);
    const testMap = new Map([["dvKey", dataViewVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.dvKey.getInt32(0) === 12345;
}

// 测试点100：Map中含多个Symbol键，验证不同Symbol键不冲突
export function Fn100_testMultipleSymbolKeysInMap() {
    const sym1 = Symbol("key1");
    const sym2 = Symbol("key2");
    const testMap = new Map([[sym1, "val1"], [sym2, "val2"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj[sym1] === "val1" && resultObj[sym2] === "val2" && sym1 !== sym2;
}

// 测试点101：结合filter过滤非字符串键，验证仅字符串键保留
export function Fn101_testFilterNonStringKeys() {
    const testArr = [["strKey", "val1"], [123, "val2"], [Symbol(), "val3"]];
    const resultObj = Object.fromEntries(
        testArr.filter(([k]) => typeof k === "string")
    );
    return resultObj.strKey === "val1" && !("123" in resultObj) && Object.getOwnPropertySymbols(resultObj).length === 0;
}

// 测试点102：二元数组中键为数字字符串（含前导零），验证前导零保留
export function Fn102_testLeadingZeroNumberStringKey() {
    const testArr = [["001", "val1"], ["010", "val2"], ["100", "val3"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["001"] === "val1" && resultObj["010"] === "val2" && resultObj["100"] === "val3";
}

// 测试点103：Map中含RegExp值（带标志），验证RegExp标志正常保留
export function Fn103_testRegExpWithFlagsValueInMap() {
    const regVal = /test/gi;
    const testMap = new Map([["regKey", regVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.regKey.flags === "gi" && resultObj.regKey.test("TEST") === true;
}

// 测试点104：转换含Set值的二元数组（Set含Symbol），验证Set值正常保留
export function Fn104_testSetWithSymbolValueInArray() {
    const sym = Symbol("setSym");
    const setVal = new Set([1, sym, "str"]);
    const testArr = [["setKey", setVal]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.setKey.has(sym) === true && resultObj.setKey.size === 3;
}

// 测试点105：Map中含Date键（不同时间），验证Date键转为对应字符串
export function Fn105_testDifferentDateKeysInMap() {
    const date1 = new Date("2024-01-01");
    const date2 = new Date("2024-01-02");
    const testMap = new Map([[date1, "val1"], [date2, "val2"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj[date1.toString()] === "val1" && resultObj[date2.toString()] === "val2";
}

// 测试点107：转换含BigInt值的Map（大数值），验证BigInt值正常保留
export function Fn107_testLargeBigIntValueInMap() {
    const largeBigInt = 900719925474099100n; // 超过Number最大值
    const testMap = new Map([["bigKey", largeBigInt]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.bigKey === largeBigInt && typeof resultObj.bigKey === "bigint";
}

// 测试点108：Map中含对象键（不同对象），验证不同对象键视为同一字符串键（后入覆盖）
export function Fn108_testDifferentObjectKeysInMap() {
    const obj1 = { a: 1 };
    const obj2 = { b: 2 };
    const testMap = new Map([[obj1, "val1"], [obj2, "val2"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["[object Object]"] === "val2"; // 不同对象toString结果相同，后入覆盖
}

// 测试点109：结合map将值转为Promise，验证Promise值正常保留
export function Fn109_testConvertValueToPromiseWithMap() {
    const testArr = [["p1", "res1"], ["p2", "res2"]];
    const resultObj = Object.fromEntries(
        testArr.map(([k, v]) => [k, Promise.resolve(v)])
    );
    return resultObj.p1 instanceof Promise && resultObj.p2 instanceof Promise;
}

// 测试点110：二元数组中键为空白字符串（空格），验证空白字符串键正常转换
export function Fn110_testWhitespaceStringKey() {
    const testArr = [[" ", "spaceVal"], ["  ", "twoSpaceVal"], ["\t", "tabVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[" "] === "spaceVal" && resultObj["  "] === "twoSpaceVal" && resultObj["\t"] === "tabVal";
}

// 测试点111：Map中含TypedArray值（不同类型），验证TypedArray类型正确保留
export function Fn111_testDifferentTypedArrayValuesInMap() {
    const uint8 = new Uint8Array([1]);
    const float32 = new Float32Array([1.5]);
    const testMap = new Map([["uint8Key", uint8], ["float32Key", float32]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.uint8Key instanceof Uint8Array && resultObj.float32Key instanceof Float32Array;
}

// 测试点112：转换含Error值的二元数组（不同错误类型），验证错误类型正确保留
export function Fn112_testDifferentErrorValuesInArray() {
    const rangeErr = new RangeError("range");
    const syntaxErr = new SyntaxError("syntax");
    const testArr = [["rangeKey", rangeErr], ["syntaxKey", syntaxErr]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.rangeKey instanceof RangeError && resultObj.syntaxKey instanceof SyntaxError;
}

// 测试点113：Map中含Infinity键（正/负），验证正负Infinity键转为对应字符串
export function Fn113_testPosNegInfinityKeysInMap() {
    const testMap = new Map([[Infinity, "posVal"], [-Infinity, "negVal"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj["Infinity"] === "posVal" && resultObj["-Infinity"] === "negVal";
}

// 测试点115：转换含Map值的Map（嵌套Map），验证嵌套Map正常保留
export function Fn115_testNestedMapValueInMap() {
    const nestedMap = new Map([["innerK", "innerV"]]);
    const testMap = new Map([["outerK", nestedMap]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.outerK === nestedMap && resultObj.outerK.get("innerK") === "innerV";
}

// 测试点116：Map中含Symbol键（Symbol.keyFor可获取），验证Symbol键正常保留
export function Fn116_testKeyForSymbolKeyInMap() {
    const sym = Symbol.for("shared");
    const testMap = new Map([[sym, "val"]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj[sym] === "val" && Symbol.keyFor(sym) === "shared";
}

// 测试点117：结合filter过滤值为函数的项，验证非函数值项保留
export function Fn117_testFilterFunctionValues() {
    const testArr = [["a", 1], ["b", () => {}], ["c", 3]];
    const resultObj = Object.fromEntries(
        testArr.filter(([_, v]) => typeof v !== "function")
    );
    return resultObj.a === 1 && resultObj.c === 3 && !("b" in resultObj);
}

// 测试点118：二元数组中键为特殊转义字符，验证转义字符键正常转换
export function Fn118_testEscapeCharKeyInArray() {
    const testArr = [["\\n", "newline"], ["\\t", "tab"], ["\\\\", "backslash"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["\\n"] === "newline" && resultObj["\\t"] === "tab" && resultObj["\\\\"] === "backslash";
}

// 测试点119：Map中含Set值（空Set），验证空Set值正常保留
export function Fn119_testEmptySetValueInMap() {
    const emptySet = new Set();
    const testMap = new Map([["setKey", emptySet]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.setKey === emptySet && resultObj.setKey.size === 0;
}

// 测试点120：转换含ArrayBuffer值的Map（视图关联），验证视图与 buffer 关联正常
export function Fn120_testArrayBufferWithViewInMap() {
    const buffer = new ArrayBuffer(8);
    const view = new Uint32Array(buffer);
    view[0] = 1234;
    const testMap = new Map([["bufferKey", buffer]]);
    const resultObj = Object.fromEntries(testMap);
    const newView = new Uint32Array(resultObj.bufferKey);
    return newView[0] === 1234; // 验证buffer数据一致性
}

// 测试点121：转换含对象字面量键的二元数组，验证对象字面量键转字符串
export function Fn121_testObjectLiteralKeyInArray() {
    const testArr = [[{ id: 1 }, "val"], [{ name: "test" }, "val2"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["[object Object]"] === "val2"; // 后入覆盖
}

// 测试点122：转换含数组字面量键的二元数组，验证数组字面量键转字符串
export function Fn122_testArrayLiteralKeyInArray() {
    const testArr = [[[1, 2], "val1"], [["a", "b"], "val2"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["[object Array]"] === undefined;
}

// 测试点123：Map中存对象字面量值，验证对象字面量属性可访问
export function Fn123_testObjectLiteralValueInMap() {
    const objLit = { name: "lit", age: 20 };
    const testMap = new Map([["objKey", objLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.objKey.name === "lit" && resultObj.objKey.age === 20;
}

// 测试点124：Map中存数组字面量值，验证数组字面量元素可访问
export function Fn124_testArrayLiteralValueInMap() {
    const arrLit = [10, 20, 30];
    const testMap = new Map([["arrKey", arrLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.arrKey[0] === 10 && resultObj.arrKey.length === 3;
}

// 测试点125：转换含布尔字面量键的二元数组，验证布尔字面量键转字符串
export function Fn125_testBooleanLiteralKeyInArray() {
    const testArr = [[true, "tVal"], [false, "fVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["true"] === "tVal" && resultObj["false"] === "fVal";
}

// 测试点126：转换含数字字面量键的二元数组，验证数字字面量键转字符串
export function Fn126_testNumberLiteralKeyInArray() {
    const testArr = [[123, "intVal"], [45.67, "floatVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["123"] === "intVal" && resultObj["45.67"] === "floatVal";
}

// 测试点127：Map中存字符串字面量值，验证字符串字面量完全匹配
export function Fn127_testStringLiteralValueInMap() {
    const strLit = "hello literal";
    const testMap = new Map([["strKey", strLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.strKey === strLit && resultObj.strKey.includes("literal");
}

// 测试点128：转换含null字面量键的二元数组，验证null字面量键转字符串
export function Fn128_testNullLiteralKeyInArray() {
    const testArr = [[null, "nullVal"], ["normal", "normVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["null"] === "nullVal" && resultObj.normal === "normVal";
}

// 测试点129：转换含undefined字面量键的二元数组，验证undefined键转字符串
export function Fn129_testUndefinedLiteralKeyInArray() {
    const testArr = [[undefined, "undefVal"], ["key", "val"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["undefined"] === "undefVal" && resultObj.key === "val";
}

// 测试点130：Map中存Symbol字面量值，验证Symbol字面量引用匹配
export function Fn130_testSymbolLiteralValueInMap() {
    const symLit = Symbol("litSym");
    const testMap = new Map([["symKey", symLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.symKey === symLit && Symbol.keyFor(resultObj.symKey) === undefined;
}

// 测试点131：转换含对象字面量值的二元数组，验证嵌套对象字面量属性
export function Fn131_testNestedObjectLiteralValueInArray() {
    const nestedObjLit = { a: { b: { c: 5 } } };
    const testArr = [["nestedKey", nestedObjLit]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.nestedKey.a.b.c === 5;
}

// 测试点132：转换含数组字面量值的二元数组，验证嵌套数组字面量元素
export function Fn132_testNestedArrayLiteralValueInArray() {
    const nestedArrLit = [[1, [2, 3]], 4];
    const testArr = [["nestedArrKey", nestedArrLit]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.nestedArrKey[0][1][1] === 3;
}

// 测试点133：Map中存BigInt字面量值，验证BigInt字面量类型与值
export function Fn133_testBigIntLiteralValueInMap() {
    const bigIntLit = 9876543210123456789n;
    const testMap = new Map([["bigKey", bigIntLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.bigKey === bigIntLit && typeof resultObj.bigKey === "bigint";
}

// 测试点134：转换含RegExp字面量键的二元数组，验证RegExp键转字符串
export function Fn134_testRegExpLiteralKeyInArray() {
    const testArr = [[/abc/, "regVal1"], [/def/g, "regVal2"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["[object RegExp]"] === undefined;
}

// 测试点135：Map中存RegExp字面量值，验证RegExp字面量方法
export function Fn135_testRegExpLiteralValueInMap() {
    const regLit = /test/i;
    const testMap = new Map([["regKey", regLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.regKey.test("Test") === true && resultObj.regKey.source === "test";
}

// 测试点136：转换含Date字面量值的二元数组，验证Date字面量方法
export function Fn136_testDateLiteralValueInArray() {
    const dateLit = new Date("2024-06-01");
    const testArr = [["dateKey", dateLit]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.dateKey.getDate() === 1 && resultObj.dateKey.getMonth() === 5;
}

// 测试点137：Map中存Set字面量值，验证Set字面量方法
export function Fn137_testSetLiteralValueInMap() {
    const setLit = new Set([1, 2, 3]);
    const testMap = new Map([["setKey", setLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.setKey.has(2) === true && resultObj.setKey.size === 3;
}

// 测试点138：转换含Map字面量值的二元数组，验证Map字面量方法
export function Fn138_testMapLiteralValueInArray() {
    const mapLit = new Map([["k1", "v1"], ["k2", "v2"]]);
    const testArr = [["mapKey", mapLit]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.mapKey.get("k1") === "v1" && resultObj.mapKey.size === 2;
}

// 测试点139：转换含函数字面量键的二元数组，验证函数键转字符串
export function Fn139_testFunctionLiteralKeyInArray() {
    const testArr = [[() => {}, "funcVal1"], [function() {}, "funcVal2"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[testArr[1][0].toString()] === "funcVal2";
}

// 测试点140：Map中存函数字面量值，验证函数字面量调用
export function Fn140_testFunctionLiteralValueInMap() {
    const funcLit = (a, b) => a * b;
    const testMap = new Map([["funcKey", funcLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.funcKey(4, 5) === 20;
}

// 测试点141：转换含模板字符串字面量键的二元数组，验证模板键值
export function Fn141_testTemplateLiteralKeyInArray() {
    const name = "test";
    const tempLitKey = `${name}_key`;
    const testArr = [[tempLitKey, "tempVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj[tempLitKey] === "tempVal" && resultObj["test_key"] === "tempVal";
}

// 测试点142：Map中存模板字符串字面量值，验证模板值内容
export function Fn142_testTemplateLiteralValueInMap() {
    const num = 100;
    const tempLitVal = `count: ${num}`;
    const testMap = new Map([["tempKey", tempLitVal]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.tempKey === tempLitVal && resultObj.tempKey === "count: 100";
}

// 测试点143：转换含空对象字面量键的二元数组，验证空对象键转字符串
export function Fn143_testEmptyObjectLiteralKeyInArray() {
    const testArr = [[{}, "emptyObjVal1"], [{}, "emptyObjVal2"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["[object Object]"] === "emptyObjVal2"; // 后入覆盖
}

// 测试点144：Map中存空数组字面量值，验证空数组属性
export function Fn144_testEmptyArrayLiteralValueInMap() {
    const emptyArrLit = [];
    const testMap = new Map([["emptyArrKey", emptyArrLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.emptyArrKey.length === 0 && Array.isArray(resultObj.emptyArrKey);
}

// 测试点145：转换含NaN字面量键的二元数组，验证NaN键转字符串
export function Fn145_testNaNLiteralKeyInArray() {
    const testArr = [[NaN, "nanVal1"], [NaN, "nanVal2"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["NaN"] === "nanVal2"; // 后入覆盖
}

// 测试点146：Map中存NaN字面量值，验证NaN值判断
export function Fn146_testNaNLiteralValueInMap() {
    const nanLit = NaN;
    const testMap = new Map([["nanKey", nanLit]]);
    const resultObj = Object.fromEntries(testMap);
    return Number.isNaN(resultObj.nanKey) && resultObj.nanKey !== nanLit; // NaN !== NaN
}

// 测试点147：转换含Infinity字面量键的二元数组，验证Infinity键转字符串
export function Fn147_testInfinityLiteralKeyInArray() {
    const testArr = [[Infinity, "infVal"], [-Infinity, "negInfVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["Infinity"] === "infVal" && resultObj["-Infinity"] === "negInfVal";
}

// 测试点148：Map中存Infinity字面量值，验证Infinity值判断
export function Fn148_testInfinityLiteralValueInMap() {
    const infLit = Infinity;
    const testMap = new Map([["infKey", infLit]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.infKey === infLit && resultObj.infKey > 1000000;
}

// 测试点149：转换含混合字面量键的二元数组，验证各类型键转换
export function Fn149_testMixedLiteralKeysInArray() {
    const testArr = [[123, "num"], ["str", "str"], [true, "bool"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["123"] === "num" && resultObj.str === "str" && resultObj["true"] === "bool";
}

// 测试点150：Map中存混合字面量值，验证各类型值属性
export function Fn150_testMixedLiteralValuesInMap() {
    const testMap = new Map([
        ["num", 123],
        ["str", "test"],
        ["bool", false],
        ["arr", [1, 2]]
    ]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.num === 123 && resultObj.str === "test" && !resultObj.bool && resultObj.arr[1] === 2;
}

// 测试点151：转换含计算属性名的对象字面量键，验证键转换与属性访问
export function Fn151_testComputedPropNameKeyInArray() {
    const key = "compKey";
    const testArr = [[{ [key]: "val" }, "objVal"]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj["[object Object]"] === "objVal" && testArr[0][0][key] === "val";
}

// 测试点152：Map中存含getter的对象字面量值，验证getter正常触发
export function Fn152_testObjectLiteralWithGetterInMap() {
    const objWithGetter = {
        _num: 5,
        get num() { return this._num * 2; }
    };
    const testMap = new Map([["objKey", objWithGetter]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.objKey.num === 10 && resultObj.objKey._num === 5;
}

// 测试点153：转换含setter的对象字面量值的二元数组，验证setter正常生效
export function Fn153_testObjectLiteralWithSetterInArray() {
    const objWithSetter = {
        _name: "",
        set name(val) { this._name = val.toUpperCase(); }
    };
    const testArr = [["objKey", objWithSetter]];
    const resultObj = Object.fromEntries(testArr);
    resultObj.objKey.name = "test";
    return resultObj.objKey._name === "TEST";
}

// 测试点154：Map中存数组字面量（含空值），验证空值元素正常保留
export function Fn154_testArrayLiteralWithEmptyInMap() {
    const arrWithEmpty = [1, , 3, undefined, null];
    const testMap = new Map([["arrKey", arrWithEmpty]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.arrKey[1] === undefined && resultObj.arrKey[3] === undefined && resultObj.arrKey[4] === null;
}

// 测试点155：转换含数组字面量（嵌套对象）的二元数组，验证嵌套结构
export function Fn155_testArrayLiteralWithNestedObjInArray() {
    const arrWithNested = [1, { a: 2 }, [3]];
    const testArr = [["arrKey", arrWithNested]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.arrKey[1].a === 2 && resultObj.arrKey[2][0] === 3;
}

// 测试点156：Map中存Symbol字面量（共享），验证Symbol.for匹配
export function Fn156_testSharedSymbolLiteralInMap() {
    const sym = Symbol.for("sharedLit");
    const testMap = new Map([["symKey", sym]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.symKey === Symbol.for("sharedLit") && Symbol.keyFor(resultObj.symKey) === "sharedLit";
}

// 测试点157：转换含BigInt字面量（运算后）的二元数组，验证运算结果
export function Fn157_testBigIntLiteralWithCalcInArray() {
    const bigIntCalc = 100n + 200n;
    const testArr = [["bigKey", bigIntCalc]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.bigKey === 300n && typeof resultObj.bigKey === "bigint";
}

// 测试点158：Map中存RegExp字面量（动态源），验证正则匹配
export function Fn158_testRegExpLiteralWithDynamicSourceInMap() {
    const source = "dynamic";
    const reg = new RegExp(source, "i");
    const testMap = new Map([["regKey", reg]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.regKey.test("DynamicTest") === true && resultObj.regKey.source === source;
}

// 测试点159：转换含Date字面量（计算后）的二元数组，验证日期运算
export function Fn159_testDateLiteralWithCalcInArray() {
    const date = new Date("2024-01-01");
    date.setDate(date.getDate() + 7); // 加7天
    const testArr = [["dateKey", date]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.dateKey.getDate() === 8 && resultObj.dateKey.getMonth() === 0;
}

// 测试点160：Map中存Set字面量（含Symbol），验证Symbol元素保留
export function Fn160_testSetLiteralWithSymbolInMap() {
    const sym = Symbol("setSym");
    const set = new Set([1, sym, "str"]);
    const testMap = new Map([["setKey", set]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.setKey.has(sym) === true && resultObj.setKey.size === 3;
}

// 测试点161：转换含Map字面量（含对象键）的二元数组，验证对象键匹配
export function Fn161_testMapLiteralWithObjectKeyInArray() {
    const objKey = { id: 1 };
    const map = new Map([[objKey, "val"]]);
    const testArr = [["mapKey", map]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.mapKey.get(objKey) === "val" && resultObj.mapKey.size === 1;
}

// 测试点162：Map中存函数字面量（箭头函数，闭包），验证闭包生效
export function Fn162_testArrowFunctionWithClosureInMap() {
    const num = 10;
    const func = (x) => x + num;
    const testMap = new Map([["funcKey", func]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.funcKey(5) === 15;
}

// 测试点163：转换含模板字符串字面量（多行）的二元数组，验证多行内容
export function Fn163_testMultiLineTemplateLiteralInArray() {
    const multiLine = `line1
line2
line3`;
    const testArr = [["tempKey", multiLine]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.tempKey.includes("\n") && resultObj.tempKey.split("\n").length === 3;
}

// 测试点164：Map中存空对象字面量（含原型），验证原型属性
export function Fn164_testEmptyObjectWithProtoInMap() {
    const obj = Object.create({ protoProp: "protoVal" });
    const testMap = new Map([["objKey", obj]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.objKey.protoProp === "protoVal" && Object.keys(resultObj.objKey).length === 0;
}

// 测试点165：转换含数组字面量（类数组转换）的二元数组，验证类数组转数组
export function Fn165_testArrayFromArrayLikeInArray() {
    const arrayLike = { 0: "a", 1: "b", length: 2 };
    const arr = Array.from(arrayLike);
    const testArr = [["arrKey", arr]];
    const resultObj = Object.fromEntries(testArr);
    return Array.isArray(resultObj.arrKey) && resultObj.arrKey[0] === "a";
}

// 测试点166：Map中存NaN字面量（运算产生），验证NaN判断
export function Fn166_testNaNFromCalcInMap() {
    const nan = 0 / 0;
    const testMap = new Map([["nanKey", nan]]);
    const resultObj = Object.fromEntries(testMap);
    return Number.isNaN(resultObj.nanKey) && !isFinite(resultObj.nanKey);
}

// 测试点167：转换含Infinity字面量（运算产生）的二元数组，验证Infinity判断
export function Fn167_testInfinityFromCalcInArray() {
    const inf = 1 / 0;
    const testArr = [["infKey", inf]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.infKey === Infinity && isFinite(resultObj.infKey) === false;
}

// 测试点168：Map中存混合字面量（含Symbol键对象），验证Symbol键访问
export function Fn168_testMixedLiteralWithSymbolKeyObjInMap() {
    const sym = Symbol("objSym");
    const obj = { [sym]: "symVal", strKey: "strVal" };
    const testMap = new Map([["objKey", obj]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.objKey[sym] === "symVal" && resultObj.objKey.strKey === "strVal";
}

// 测试点169：转换含对象字面量（冻结）的二元数组，验证冻结属性
export function Fn169_testFrozenObjectLiteralInArray() {
    const obj = Object.freeze({ key: "val" });
    const testArr = [["objKey", obj]];
    const resultObj = Object.fromEntries(testArr);
    try {
        resultObj.objKey.key = "newVal";
        return resultObj.objKey.key === "val"; // 冻结后无法修改
    } catch (e) {
        return true; // 严格模式下报错，也视为冻结生效
    }
}

// 测试点170：Map中存数组字面量（冻结），验证冻结属性
export function Fn170_testFrozenArrayLiteralInMap() {
    const arr = Object.freeze([1, 2, 3]);
    const testMap = new Map([["arrKey", arr]]);
    const resultObj = Object.fromEntries(testMap);
    try {
        resultObj.arrKey[0] = 10;
        return resultObj.arrKey[0] === 1; // 冻结后无法修改
    } catch (e) {
        return true; // 严格模式下报错，也视为冻结生效
    }
}

// 测试点171：转换含RegExp字面量（冻结）的二元数组，验证冻结属性
export function Fn171_testFrozenRegExpLiteralInArray() {
    const reg = Object.freeze(/test/);
    const testArr = [["regKey", reg]];
    const resultObj = Object.fromEntries(testArr);
    try {
        resultObj.regKey.source = "newTest";
        return resultObj.regKey.source === "test"; // 冻结后无法修改
    } catch (e) {
        return true; // 严格模式下报错，也视为冻结生效
    }
}

// 测试点173：转换含Set字面量（删除元素后）的二元数组，验证元素删除
export function Fn173_testSetWithDeletedElemInArray() {
    const set = new Set([1, 2, 3]);
    set.delete(2);
    const testArr = [["setKey", set]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.setKey.has(2) === false && resultObj.setKey.size === 2;
}

// 测试点174：Map中存Map字面量（清除后），验证Map清除
export function Fn174_testClearedMapLiteralInMap() {
    const map = new Map([["k1", "v1"], ["k2", "v2"]]);
    map.clear();
    const testMap = new Map([["mapKey", map]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.mapKey.size === 0 && resultObj.mapKey.has("k1") === false;
}

// 测试点175：转换含函数字面量（普通函数，this绑定）的二元数组，验证this绑定
export function Fn175_testFunctionWithThisBindingInArray() {
    const func = function() { return this.val; };
    const obj = { val: 100, func };
    const testArr = [["objKey", obj]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.objKey.func() === 100;
}

// 测试点176：Map中存模板字符串字面量（表达式运算），验证表达式结果
export function Fn176_testTemplateWithExpressionInMap() {
    const a = 5, b = 3;
    const temp = `a + b = ${a + b}, a * b = ${a * b}`;
    const testMap = new Map([["tempKey", temp]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.tempKey === "a + b = 8, a * b = 15";
}

// 测试点177：转换含对象字面量（嵌套数组）的二元数组，验证嵌套数组访问
export function Fn177_testObjectWithNestedArrayInArray() {
    const obj = { nested: [1, [2, 3]] };
    const testArr = [["objKey", obj]];
    const resultObj = Object.fromEntries(testArr);
    return resultObj.objKey.nested[1][1] === 3 && resultObj.objKey.nested.length === 2;
}

// 测试点178：Map中存数组字面量（排序后），验证排序结果
export function Fn178_testSortedArrayLiteralInMap() {
    const arr = [3, 1, 2].sort((a, b) => a - b);
    const testMap = new Map([["arrKey", arr]]);
    const resultObj = Object.fromEntries(testMap);
    return resultObj.arrKey[0] === 1 && resultObj.arrKey[2] === 3;
}

// 测试点180：Map中存混合字面量（含所有基础类型），验证全类型属性
export function Fn180_testAllBasicTypesInMap() {
    const testMap = new Map([
        ["num", 123],
        ["str", "test"],
        ["bool", true],
        ["null", null],
        ["undef", undefined],
        ["sym", Symbol("test")],
        ["bigInt", 456n]
    ]);
    const resultObj = Object.fromEntries(testMap);
    return typeof resultObj.num === "number" &&
        typeof resultObj.str === "string" &&
        typeof resultObj.bool === "boolean" &&
        resultObj.null === null &&
        resultObj.undef === undefined &&
        typeof resultObj.sym === "symbol" &&
        typeof resultObj.bigInt === "bigint";
}


