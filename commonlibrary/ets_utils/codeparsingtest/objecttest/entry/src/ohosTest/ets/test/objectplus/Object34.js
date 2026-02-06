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
 * 测试点 1：Object 原型的 valueOf() 方法返回调用对象本身
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn01_testValueOfReturnsSelf() {
    console.log("=== 测试点 1：Object 原型的 valueOf() 返回调用对象本身 ===");
    const plainObj = {}; // 创建普通空对象
    const valueOfResult = plainObj.valueOf(); // 调用对象自身的 valueOf()（继承自 Object 原型）
    const isPassed = valueOfResult === plainObj; // 验证返回值是否与原对象严格相等

    // 打印测试关键信息
    console.log("普通对象引用:", plainObj);
    console.log("valueOf() 返回值引用:", valueOfResult);
    console.log("返回值是否为原对象:", isPassed);
    console.log("测试点 1 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 2：自定义对象重写 valueOf() 后可返回自定义基本类型值
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn02_testCustomValueOfReturnsPrimitive() {
    console.log("=== 测试点 2：自定义对象重写 valueOf() 返回基本类型 ===");

    // 定义自定义类，重写 valueOf() 以返回内部存储的基本类型值（此处为数值）
    class Product {
        constructor(price) {
            this.price = price; // 存储数值类型的价格
        }

        // 重写 valueOf()，返回价格的基本类型值
        valueOf() {
            return this.price;
        }
    }

    const phone = new Product(3999); // 创建自定义类实例
    const valueOfResult = phone.valueOf(); // 调用重写后的 valueOf()
    // 验证返回值是预期数值，且类型为基本类型（number）
    const isPassed = valueOfResult === 3999 && typeof valueOfResult === "number";

    // 打印测试关键信息
    console.log("Product 实例（手机）:", phone);
    console.log("重写后 valueOf() 返回值:", valueOfResult);
    console.log("返回值是否为预期数值类型:", isPassed);
    console.log("测试点 2 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 3：强制数字转换（一元加运算符）优先调用重写的 valueOf()
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn03_testForcedNumberCallsValueOf() {
    console.log("=== 测试点 3：强制数字转换优先调用重写的 valueOf() ===");

    // 复用自定义类 Product，确保 valueOf() 已被重写
    class Product {
        constructor(price) {
            this.price = price;
        }

        valueOf() {
            return this.price;
        }
    }

    const laptop = new Product(5999); // 创建实例，价格为 5999
    const forcedNumber = +laptop; // 一元加强制数字转换（触发类型转换逻辑）
    // 验证转换结果与重写的 valueOf() 返回值一致
    const isPassed = forcedNumber === 5999 && typeof forcedNumber === "number";

    // 打印测试关键信息
    console.log("Product 实例（笔记本）:", laptop);
    console.log("一元加（强制数字转换）结果:", forcedNumber);
    console.log("转换结果是否匹配 valueOf() 返回值:", isPassed);
    console.log("测试点 3 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 4：无自定义 valueOf() 时，强制数字转换 fallback 到 toString()
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn04_testFallbackToToStringWhenNoValueOf() {
    console.log("=== 测试点 4：无自定义 valueOf() 时，强制转换 fallback 到 toString() ===");
    // 创建仅重写 toString() 的对象，不重写 valueOf()（使用 Object 原型的默认实现）
    const scoreObj = {
        score: 88,
        // 重写 toString()，返回可转为数字的字符串
        toString() {
            return String(this.score);
        }
    };
    // 调用 Object 原型的 valueOf()，验证默认返回对象自身
    const protoValueOfResult = Object.prototype.valueOf.call(scoreObj);
    // 强制数字转换：因无自定义 valueOf()，按规则使用 toString() 结果转数字
    const forcedNumber = +scoreObj;
    // 双重验证：默认 valueOf() 返回原对象 + 强制转换结果符合 toString() 转数字后的值
    const isPassed = protoValueOfResult === scoreObj && forcedNumber === 88;

    // 打印测试关键信息
    console.log("仅重写 toString() 的分数对象:", scoreObj);
    console.log("Object 原型 valueOf() 返回值:", protoValueOfResult);
    console.log("强制数字转换结果:", forcedNumber);
    console.log("是否符合 fallback 到 toString() 的逻辑:", isPassed);
    console.log("测试点 4 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 5：Symbol.toPrimitive 方法优先级高于 valueOf()
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn05_testToPrimitivePriorityOverValueOf() {
    console.log("=== 测试点 5：Symbol.toPrimitive 优先级高于 valueOf() ===");
    // 创建同时重写 valueOf() 和 Symbol.toPrimitive 的对象
    const orderObj = {
        amount: 1200,
        // 重写 valueOf()，返回金额（预期会被 Symbol.toPrimitive 覆盖）
        valueOf() {
            return this.amount;
        },
        // 重写 Symbol.toPrimitive，定义自定义类型转换逻辑（优先级最高）
        [Symbol.toPrimitive](hint) {
            // hint 为 "number" 时（强制数字转换），返回金额的 1.1 倍（模拟加税）
            return hint === "number" ? this.amount * 1.1 : this.amount;
        }
    };
    const forcedNumber = +orderObj; // 强制数字转换，触发 hint: "number"
    // 验证转换结果使用 Symbol.toPrimitive 的返回值（1320），而非 valueOf() 的返回值（1200）
    const isPassed = forcedNumber === 1320 && typeof forcedNumber === "number";

    // 打印测试关键信息
    console.log("含 Symbol.toPrimitive 的订单对象:", orderObj);
    console.log("valueOf() 定义的返回值:", orderObj.valueOf());
    console.log("Symbol.toPrimitive（数字转换）返回值:", 1200 * 1.1);
    console.log("强制数字转换实际结果:", forcedNumber);
    console.log("是否优先使用 Symbol.toPrimitive:", isPassed);
    console.log("测试点 5 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 6：数组对象的 valueOf() 返回数组自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn06_testArrayValueOfReturnsSelf() {
    console.log("=== 测试点 6：数组对象的 valueOf() 返回数组自身 ===");
    const testArr = [1, 2, 3];
    const valueOfResult = testArr.valueOf();
    const isPassed = valueOfResult === testArr && Array.isArray(valueOfResult);

    console.log("测试数组:", testArr);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回数组自身:", isPassed);
    console.log("测试点 6 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 7：日期对象的 valueOf() 返回时间戳（毫秒数，基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn07_testDateValueOfReturnsTimestamp() {
    console.log("=== 测试点 7：日期对象的 valueOf() 返回时间戳 ===");
    const testDate = new Date("2024-01-01");
    const valueOfResult = testDate.valueOf();
    const expectedTimestamp = 1704067200000; // 2024-01-01 00:00:00 UTC 时间戳
    const isPassed = valueOfResult === expectedTimestamp && typeof valueOfResult === "number";

    console.log("测试日期对象:", testDate);
    console.log("valueOf() 返回时间戳:", valueOfResult);
    console.log("是否等于预期时间戳:", isPassed);
    console.log("测试点 7 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 8：重写 valueOf() 返回非基本类型时，强制转换 fallback 到 toString()
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn08_testValueOfReturnsObjectFallbackToString() {
    console.log("=== 测试点 8：valueOf() 返回对象时，强制转换 fallback 到 toString() ===");
    const testObj = {
        valueOf() {
            return {}; // 重写但返回对象（非基本类型）
        },
        toString() {
            return "999"; // 可转为数字的字符串
        }
    };
    const forcedNumber = +testObj;
    const isPassed = forcedNumber === 999 && typeof forcedNumber === "number";

    console.log("测试对象:", testObj);
    console.log("valueOf() 返回值（对象）:", testObj.valueOf());
    console.log("强制数字转换结果:", forcedNumber);
    console.log("是否 fallback 到 toString() 结果:", isPassed);
    console.log("测试点 8 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 9：布尔对象的 valueOf() 返回原始布尔值（基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn09_testBooleanObjectValueOfReturnsPrimitive() {
    console.log("=== 测试点 9：布尔对象的 valueOf() 返回原始布尔值 ===");
    const boolObj = new Boolean(true);
    const valueOfResult = boolObj.valueOf();
    const isPassed = valueOfResult === true && typeof valueOfResult === "boolean";

    console.log("布尔对象:", boolObj);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回原始布尔值:", isPassed);
    console.log("测试点 9 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 10：字符串对象的 valueOf() 返回原始字符串（基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn10_testStringObjectValueOfReturnsPrimitive() {
    console.log("=== 测试点 10：字符串对象的 valueOf() 返回原始字符串 ===");
    const strObj = new String("testValueOf");
    const valueOfResult = strObj.valueOf();
    const isPassed = valueOfResult === "testValueOf" && typeof valueOfResult === "string";

    console.log("字符串对象:", strObj);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回原始字符串:", isPassed);
    console.log("测试点 10 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 11：数字对象的 valueOf() 返回原始数字（基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn11_testNumberObjectValueOfReturnsPrimitive() {
    console.log("=== 测试点 11：数字对象的 valueOf() 返回原始数字 ===");
    const numObj = new Number(123.45);
    const valueOfResult = numObj.valueOf();
    const isPassed = valueOfResult === 123.45 && typeof valueOfResult === "number";

    console.log("数字对象:", numObj);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回原始数字:", isPassed);
    console.log("测试点 11 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 12：使用 call 调用 Object 原型的 valueOf() 处理原始值（返回包装对象）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn12_testCallValueOfWithPrimitive() {
    console.log("=== 测试点 12：call 调用 valueOf() 处理原始值返回包装对象 ===");
    const primitiveNum = 456;
    // 用 call 绑定原始值，会先转为包装对象，再调用 valueOf()
    const valueOfResult = Object.prototype.valueOf.call(primitiveNum);
    const isPassed = valueOfResult instanceof Number && valueOfResult.valueOf() === 456;

    console.log("原始数字:", primitiveNum);
    console.log("call 调用 valueOf() 返回值:", valueOfResult);
    console.log("是否返回包装对象:", isPassed);
    console.log("测试点 12 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 13：重写 valueOf() 返回 null 时，强制转换结果为 0
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn13_testValueOfReturnsNullForcedConvert() {
    console.log("=== 测试点 13：valueOf() 返回 null 时强制转换为 0 ===");
    const testObj = {
        valueOf() {
            return null; // 重写返回 null
        }
    };
    const forcedNumber = +testObj;
    const isPassed = forcedNumber === 0 && typeof forcedNumber === "number";

    console.log("测试对象:", testObj);
    console.log("valueOf() 返回值:", testObj.valueOf());
    console.log("强制数字转换结果:", forcedNumber);
    console.log("是否转换为 0:", isPassed);
    console.log("测试点 13 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 14：重写 valueOf() 返回 undefined 时，强制转换结果为 NaN
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn14_testValueOfReturnsUndefinedForcedConvert() {
    console.log("=== 测试点 14：valueOf() 返回 undefined 时强制转换为 NaN ===");
    const testObj = {
        valueOf() {
            return undefined; // 重写返回 undefined
        }
    };
    const forcedNumber = +testObj;
    const isPassed = isNaN(forcedNumber) && typeof forcedNumber === "number";

    console.log("测试对象:", testObj);
    console.log("valueOf() 返回值:", testObj.valueOf());
    console.log("强制数字转换结果:", forcedNumber);
    console.log("是否转换为 NaN:", isPassed);
    console.log("测试点 14 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 15：Map 对象的 valueOf() 返回 Map 自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn15_testMapValueOfReturnsSelf() {
    console.log("=== 测试点 15：Map 对象的 valueOf() 返回自身 ===");
    const testMap = new Map([["key1", "value1"]]);
    const valueOfResult = testMap.valueOf();
    const isPassed = valueOfResult === testMap && valueOfResult instanceof Map;

    console.log("测试 Map:", testMap);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回 Map 自身:", isPassed);
    console.log("测试点 15 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 16：Set 对象的 valueOf() 返回 Set 自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn16_testSetValueOfReturnsSelf() {
    console.log("=== 测试点 16：Set 对象的 valueOf() 返回自身 ===");
    const testSet = new Set([1, 2, 3]);
    const valueOfResult = testSet.valueOf();
    const isPassed = valueOfResult === testSet && valueOfResult instanceof Set;

    console.log("测试 Set:", testSet);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回 Set 自身:", isPassed);
    console.log("测试点 16 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 17：函数对象的 valueOf() 返回函数自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn17_testFunctionValueOfReturnsSelf() {
    console.log("=== 测试点 17：函数对象的 valueOf() 返回自身 ===");

    function testFunc() {
        return "funcResult";
    }

    const valueOfResult = testFunc.valueOf();
    const isPassed = valueOfResult === testFunc && typeof valueOfResult === "function";

    console.log("测试函数:", testFunc);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回函数自身:", isPassed);
    console.log("测试点 17 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 18：重写 valueOf() 实现对象加法运算（返回数值）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn18_testCustomValueOfForAddition() {
    console.log("=== 测试点 18：重写 valueOf() 支持对象加法运算 ===");

    class Counter {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值
        }
    }

    const counter1 = new Counter(10);
    const counter2 = new Counter(20);
    const sum = counter1 + counter2; // 加法运算触发 valueOf()
    const isPassed = sum === 30 && typeof sum === "number";

    console.log("Counter 实例1:", counter1);
    console.log("Counter 实例2:", counter2);
    console.log("实例加法结果:", sum);
    console.log("是否等于预期和:", isPassed);
    console.log("测试点 18 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 19：无重写时，对象与数字比较触发 valueOf()（返回自身，比较引用）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn19_testObjectCompareWithoutValueOf() {
    console.log("=== 测试点 19：无重写时对象与数字比较返回 false ===");
    const testObj = { num: 50 };
    const compareResult = testObj == 50; // 松散比较，无重写 valueOf() 则比较引用与值
    const isPassed = compareResult === false;

    console.log("测试对象:", testObj);
    console.log("对象与 50 松散比较结果:", compareResult);
    console.log("是否返回 false:", isPassed);
    console.log("测试点 19 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 20：重写 valueOf() 后，对象与数字松散比较返回 true
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn20_testCustomValueOfForComparison() {
    console.log("=== 测试点 20：重写 valueOf() 后对象与数字比较返回 true ===");
    const testObj = {
        valueOf() {
            return 60; // 重写返回数值
        }
    };
    const compareResult = testObj == 60; // 松散比较触发 valueOf()
    const isPassed = compareResult === true;

    console.log("测试对象:", testObj);
    console.log("valueOf() 返回值:", testObj.valueOf());
    console.log("对象与 60 松散比较结果:", compareResult);
    console.log("是否返回 true:", isPassed);
    console.log("测试点 20 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 21：Symbol 对象的 valueOf() 返回原始 Symbol（基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
console.log("=== 测试点 21：Symbol 对象的 valueOf() 返回原始 Symbol ===");

export const primitiveSym21 = Symbol("testSym");
const symObj21 = Object(primitiveSym21); // 转为 Symbol 对象

export const valueOfResult21 = symObj21.valueOf();

/**
 * 测试点 22：重写 valueOf() 抛出错误时，强制转换会传播该错误
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn22_testValueOfThrowErrorPropagation() {
    console.log("=== 测试点 22：重写 valueOf() 抛错时强制转换传播错误 ===");
    const errorObj = {
        valueOf() {
            throw new Error("Custom valueOf error"); // 重写时主动抛错
        }
    };
    let errorCaught = false;
    let errorMsgMatch = false;
    try {
        +errorObj; // 强制数字转换触发 valueOf()
    } catch (err) {
        errorCaught = true;
        errorMsgMatch = err.message === "Custom valueOf error"; // 验证错误信息
    }
    const isPassed = errorCaught && errorMsgMatch;

    console.log("测试对象（valueOf 抛错）:", errorObj);
    console.log("是否捕获到错误:", errorCaught);
    console.log("错误信息是否匹配预期:", errorMsgMatch);
    console.log("测试点 22 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 23：通过 Object.create 继承的对象，valueOf() 沿用原型实现（返回自身）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn23_testInheritedObjValueOfFromProto() {
    console.log("=== 测试点 23：继承对象的 valueOf() 沿用原型实现 ===");
    const parentObj = { name: "parent" };
    const childObj = Object.create(parentObj); // 继承自 parentObj
    const valueOfResult = childObj.valueOf(); // 调用继承的 valueOf()
    const isPassed = valueOfResult === childObj && childObj.__proto__ === parentObj;

    console.log("父对象:", parentObj);
    console.log("继承的子对象:", childObj);
    console.log("子对象 valueOf() 返回值:", valueOfResult);
    console.log("是否返回子对象自身:", isPassed);
    console.log("测试点 23 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 24：重写 valueOf() 返回 BigInt 类型，强制转换是否兼容
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn24_testValueOfReturnBigInt() {
    console.log("=== 测试点 24：重写 valueOf() 返回 BigInt 时的强制转换 ===");
    const bigIntObj = {
        valueOf() {
            return 9007199254740991n; // 最大安全整数的 BigInt
        }
    };
    const forcedNumber = +bigIntObj; // BigInt 转数字可能丢失精度
    const isPassed = forcedNumber === 9007199254740991 && typeof forcedNumber === "number";

    console.log("测试对象:", bigIntObj);
    console.log("valueOf() 返回 BigInt:", bigIntObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否为预期安全整数:", isPassed);
    console.log("测试点 24 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 25：Date 对象与数字比较时，自动调用 valueOf()（时间戳对比）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn25_testDateCompareWithNumber() {
    console.log("=== 测试点 25：Date 对象与数字比较调用 valueOf() ===");
    const testDate = new Date("2024-05-01");
    const dateTimestamp = testDate.valueOf(); // Date 的 valueOf() 返回时间戳
    const compareResult = testDate > 1714521600000; // 2024-05-01 00:00:00 UTC 为 1714521600000
    const isPassed = compareResult === (dateTimestamp > 1714521600000);

    console.log("测试 Date 对象:", testDate);
    console.log("Date 的 valueOf() 时间戳:", dateTimestamp);
    console.log("与 1714521600000 比较结果:", compareResult);
    console.log("比较逻辑是否匹配时间戳对比:", isPassed);
    console.log("测试点 25 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 26：空对象的 valueOf() 与自身严格相等
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn26_testEmptyObjValueOfStrictEqual() {
    console.log("=== 测试点 26：空对象的 valueOf() 与自身严格相等 ===");
    const emptyObj = {};
    const valueOfResult = emptyObj.valueOf();
    const isPassed = valueOfResult === emptyObj && valueOfResult !== {}; // 排除不同对象的干扰

    console.log("空对象:", emptyObj);
    console.log("空对象 valueOf() 返回值:", valueOfResult);
    console.log("是否与自身严格相等:", isPassed);
    console.log("测试点 26 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 27：重写 valueOf() 返回空字符串，强制数字转换为 0
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn27_testValueOfReturnEmptyString() {
    console.log("=== 测试点 27：valueOf() 返回空字符串时强制转换为 0 ===");
    const emptyStrObj = {
        valueOf() {
            return ""; // 重写返回空字符串
        }
    };
    const forcedNumber = +emptyStrObj;
    const isPassed = forcedNumber === 0 && typeof forcedNumber === "number";

    console.log("测试对象:", emptyStrObj);
    console.log("valueOf() 返回空字符串:", emptyStrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否转换为 0:", isPassed);
    console.log("测试点 27 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 28：RegExp 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn28_testRegExpValueOfReturnsSelf() {
    console.log("=== 测试点 28：RegExp 对象的 valueOf() 返回自身 ===");
    const testReg = /abc/g; // 正则对象
    const valueOfResult = testReg.valueOf();
    const isPassed = valueOfResult === testReg && valueOfResult instanceof RegExp;

    console.log("测试正则对象:", testReg);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回正则对象自身:", isPassed);
    console.log("测试点 28 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 29：重写 valueOf() 实现对象减法运算（返回数值）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn29_testCustomValueOfForSubtraction() {
    console.log("=== 测试点 29：重写 valueOf() 支持对象减法运算 ===");

    class Quantity {
        constructor(count) {
            this.count = count;
        }

        valueOf() {
            return this.count; // 重写返回数值
        }
    }

    const q1 = new Quantity(50);
    const q2 = new Quantity(20);
    const difference = q1 - q2; // 减法触发 valueOf()
    const isPassed = difference === 30 && typeof difference === "number";

    console.log("Quantity 实例1（50）:", q1);
    console.log("Quantity 实例2（20）:", q2);
    console.log("实例减法结果:", difference);
    console.log("是否等于预期差值:", isPassed);
    console.log("测试点 29 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 30：null 调用 valueOf()（需通过 call 绑定，会报错）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn30_testNullCallValueOf() {
    console.log("=== 测试点 30：null 绑定 valueOf() 会抛出类型错误 ===");
    let errorCaught = false;
    let errorTypeMatch = false;
    try {
        Object.prototype.valueOf.call(null); // 绑定 null 调用 valueOf()
    } catch (err) {
        errorCaught = true;
        errorTypeMatch = err instanceof TypeError; // 验证错误类型
    }
    const isPassed = errorCaught && errorTypeMatch;

    console.log("是否捕获到错误:", errorCaught);
    console.log("错误是否为 TypeError:", errorTypeMatch);
    console.log("测试点 30 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 31：undefined 调用 valueOf()（需通过 call 绑定，会报错）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn31_testUndefinedCallValueOf() {
    console.log("=== 测试点 31：undefined 绑定 valueOf() 会抛出类型错误 ===");
    let errorCaught = false;
    let errorTypeMatch = false;
    try {
        Object.prototype.valueOf.call(undefined); // 绑定 undefined 调用 valueOf()
    } catch (err) {
        errorCaught = true;
        errorTypeMatch = err instanceof TypeError; // 验证错误类型
    }
    const isPassed = errorCaught && errorTypeMatch;

    console.log("是否捕获到错误:", errorCaught);
    console.log("错误是否为 TypeError:", errorTypeMatch);
    console.log("测试点 31 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 32：重写 valueOf() 返回 NaN，强制转换结果仍为 NaN
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn32_testValueOfReturnNaN() {
    console.log("=== 测试点 32：valueOf() 返回 NaN 时强制转换为 NaN ===");
    const nanObj = {
        valueOf() {
            return NaN; // 重写返回 NaN
        }
    };
    const forcedNumber = +nanObj;
    const isPassed = isNaN(forcedNumber) && typeof forcedNumber === "number";

    console.log("测试对象:", nanObj);
    console.log("valueOf() 返回 NaN:", nanObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否为 NaN:", isPassed);
    console.log("测试点 32 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 33：重写 valueOf() 返回 Infinity，强制转换结果为 Infinity
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn33_testValueOfReturnInfinity() {
    console.log("=== 测试点 33：valueOf() 返回 Infinity 时强制转换为 Infinity ===");
    const infObj = {
        valueOf() {
            return Infinity; // 重写返回 Infinity
        }
    };
    const forcedNumber = +infObj;
    const isPassed = forcedNumber === Infinity && typeof forcedNumber === "number";

    console.log("测试对象:", infObj);
    console.log("valueOf() 返回 Infinity:", infObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否为 Infinity:", isPassed);
    console.log("测试点 33 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 34：类的静态方法中调用 valueOf()，返回类自身（非实例）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn34_testClassStaticValueOf() {
    console.log("=== 测试点 34：类静态方法中调用 valueOf() 返回类自身 ===");

    class StaticTest {
        static getValueOf() {
            return this.valueOf(); // this 指向类本身
        }
    }

    const valueOfResult = StaticTest.getValueOf();
    const isPassed = valueOfResult === StaticTest && typeof StaticTest === "function";

    console.log("测试类 StaticTest:", StaticTest);
    console.log("静态方法返回的 valueOf() 结果:", valueOfResult);
    console.log("是否返回类自身:", isPassed);
    console.log("测试点 34 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 35：嵌套对象的 valueOf()，仅当前对象重写时返回自身重写结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn35_testNestedObjValueOf() {
    console.log("=== 测试点 35：嵌套对象的 valueOf() 仅当前对象重写生效 ===");
    const nestedObj = {
        inner: {
            value: 100,
            valueOf() {
                return this.value; // 内部对象重写 valueOf()
            }
        },
        valueOf() {
            return this.inner; // 外部对象重写返回内部对象
        }
    };
    const outerValue = nestedObj.valueOf();
    const innerValue = nestedObj.inner.valueOf();
    const isPassed = outerValue === nestedObj.inner && innerValue === 100;

    console.log("外部嵌套对象:", nestedObj);
    console.log("外部对象 valueOf() 返回值:", outerValue);
    console.log("内部对象 valueOf() 返回值:", innerValue);
    console.log("是否符合嵌套重写逻辑:", isPassed);
    console.log("测试点 35 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 36：重写 valueOf() 后，对象参与乘法运算（返回数值结果）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn36_testCustomValueOfForMultiplication() {
    console.log("=== 测试点 36：重写 valueOf() 支持对象乘法运算 ===");

    class Price {
        constructor(amount) {
            this.amount = amount;
        }

        valueOf() {
            return this.amount; // 重写返回数值
        }
    }

    const price = new Price(20);
    const quantity = 5;
    const total = price * quantity; // 乘法触发 valueOf()
    const isPassed = total === 100 && typeof total === "number";

    console.log("Price 实例（20）:", price);
    console.log("数量:", quantity);
    console.log("乘法运算结果（总价）:", total);
    console.log("是否等于预期总价:", isPassed);
    console.log("测试点 36 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 37：TypedArray（Uint8Array）的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn37_testUint8ArrayValueOfReturnsSelf() {
    console.log("=== 测试点 37：Uint8Array 的 valueOf() 返回自身 ===");
    const uint8Arr = new Uint8Array([10, 20, 30]); // 创建 8 位无符号整型数组
    const valueOfResult = uint8Arr.valueOf();
    const isPassed = valueOfResult === uint8Arr && valueOfResult instanceof Uint8Array;

    console.log("Uint8Array 实例:", uint8Arr);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回数组自身:", isPassed);
    console.log("测试点 37 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 38：TypedArray（Float64Array）的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn38_testFloat64ArrayValueOfReturnsSelf() {
    console.log("=== 测试点 38：Float64Array 的 valueOf() 返回自身 ===");
    const float64Arr = new Float64Array([1.23, 4.56, 7.89]); // 创建 64 位浮点数组
    const valueOfResult = float64Arr.valueOf();
    const isPassed = valueOfResult === float64Arr && valueOfResult instanceof Float64Array;

    console.log("Float64Array 实例:", float64Arr);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回数组自身:", isPassed);
    console.log("测试点 38 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 39：JSON.stringify() 序列化时，不触发 valueOf()（优先用 toJSON()/自身属性）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn39_testJsonStringifyNotTriggerValueOf() {
    console.log("=== 测试点 39：JSON.stringify() 不触发 valueOf() ===");
    const jsonObj = {
        num: 10,
        valueOf() {
            return 99; // 重写 valueOf()，预期不被 JSON.stringify() 使用
        }
    };
    const jsonStr = JSON.stringify(jsonObj);
    const parsedObj = JSON.parse(jsonStr);
    const isPassed = parsedObj.num === 10 && parsedObj.num !== 99;

    console.log("测试对象:", jsonObj);
    console.log("JSON 序列化结果:", jsonStr);
    console.log("反序列化后 num 值:", parsedObj.num);
    console.log("是否未使用 valueOf() 结果:", isPassed);
    console.log("测试点 39 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 40：重写 valueOf() 后，对象参与除法运算（返回数值结果）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn40_testCustomValueOfForDivision() {
    console.log("=== 测试点 40：重写 valueOf() 支持对象除法运算 ===");

    class Weight {
        constructor(kg) {
            this.kg = kg;
        }

        valueOf() {
            return this.kg; // 重写返回重量数值
        }
    }

    const totalWeight = new Weight(10);
    const divisionCount = 2;
    const singleWeight = totalWeight / divisionCount; // 除法触发 valueOf()
    const isPassed = singleWeight === 5 && typeof singleWeight === "number";

    console.log("Weight 实例（10kg）:", totalWeight);
    console.log("除数（份数）:", divisionCount);
    console.log("除法结果（单份重量）:", singleWeight);
    console.log("是否等于预期结果:", isPassed);
    console.log("测试点 40 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 41：修改对象原型的 valueOf()，实例调用时生效
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn41_testModifyProtoValueOf() {
    console.log("=== 测试点 41：修改原型 valueOf() 后实例生效 ===");

    // 定义基础构造函数
    function Fruit(name) {
        this.name = name;
    }

    // 修改原型的 valueOf()
    Fruit.prototype.valueOf = function () {
        return this.name.length; // 返回水果名长度
    };
    const apple = new Fruit("apple"); // 创建实例
    const valueOfResult = apple.valueOf();
    const isPassed = valueOfResult === 5 && typeof valueOfResult === "number";

    console.log("Fruit 实例（apple）:", apple);
    console.log("原型重写后 valueOf() 返回值:", valueOfResult);
    console.log("是否等于水果名长度（5）:", isPassed);
    console.log("测试点 41 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 42：实例自身重写 valueOf()，覆盖原型的实现
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn42_testInstanceValueOfOverrideProto() {
    console.log("=== 测试点 42：实例重写 valueOf() 覆盖原型实现 ===");

    function Fruit(name) {
        this.name = name;
    }

    // 原型的 valueOf() 返回名长度
    Fruit.prototype.valueOf = function () {
        return this.name.length;
    };
    const banana = new Fruit("banana");
    // 实例自身重写 valueOf()，返回名的首字母
    banana.valueOf = function () {
        return this.name[0];
    };
    const valueOfResult = banana.valueOf();
    const isPassed = valueOfResult === "b" && typeof valueOfResult === "string";

    console.log("Fruit 实例（banana）:", banana);
    console.log("实例重写后 valueOf() 返回值:", valueOfResult);
    console.log("是否覆盖原型返回首字母（b）:", isPassed);
    console.log("测试点 42 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 43：重写 valueOf() 返回布尔值，强制数字转换为 1/0
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn43_testValueOfReturnBoolean() {
    console.log("=== 测试点 43：valueOf() 返回布尔值时的强制转换 ===");
    const trueObj = {
        valueOf() {
            return true;
        }
    };
    const falseObj = {
        valueOf() {
            return false;
        }
    };
    const trueToNum = +trueObj;
    const falseToNum = +falseObj;
    const isPassed = trueToNum === 1 && falseToNum === 0;

    console.log("返回 true 的对象 valueOf() 转数字:", trueToNum);
    console.log("返回 false 的对象 valueOf() 转数字:", falseToNum);
    console.log("是否分别转为 1 和 0:", isPassed);
    console.log("测试点 43 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 44：ArrayBuffer 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn44_testArrayBufferValueOfReturnsSelf() {
    console.log("=== 测试点 44：ArrayBuffer 的 valueOf() 返回自身 ===");
    const buffer = new ArrayBuffer(16); // 创建 16 字节的缓冲区
    const valueOfResult = buffer.valueOf();
    const isPassed = valueOfResult === buffer && valueOfResult instanceof ArrayBuffer;

    console.log("ArrayBuffer 实例（16字节）:", buffer);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回缓冲区自身:", isPassed);
    console.log("测试点 44 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 45：重写 valueOf() 后，对象参与取模运算（返回数值结果）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn45_testCustomValueOfForModulo() {
    console.log("=== 测试点 45：重写 valueOf() 支持对象取模运算 ===");

    class NumberWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回包装的数值
        }
    }

    const wrapNum = new NumberWrap(17);
    const moduloBase = 5;
    const moduloResult = wrapNum % moduloBase; // 取模触发 valueOf()
    const isPassed = moduloResult === 2 && typeof moduloResult === "number";

    console.log("NumberWrap 实例（17）:", wrapNum);
    console.log("取模基数:", moduloBase);
    console.log("取模结果:", moduloResult);
    console.log("是否等于预期结果（17%5=2）:", isPassed);
    console.log("测试点 45 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 46：Proxy 代理对象的 valueOf()，触发 get 陷阱后返回目标值
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn46_testProxyValueOfTriggerGet() {
    console.log("=== 测试点 46：Proxy 代理对象的 valueOf() 触发 get 陷阱 ===");
    const targetObj = { value: 100 };
    // 创建 Proxy，监听 get 陷阱（访问 valueOf 方法时触发）
    const proxy = new Proxy(targetObj, {
        get(target, prop) {
            if (prop === "valueOf") {
                return () => target.value; // 代理 valueOf() 返回目标的 value
            }
            return target[prop];
        }
    });
    const valueOfResult = proxy.valueOf();
    const isPassed = valueOfResult === 100 && typeof valueOfResult === "number";

    console.log("Proxy 目标对象:", targetObj);
    console.log("Proxy 实例:", proxy);
    console.log("Proxy valueOf() 返回值:", valueOfResult);
    console.log("是否触发 get 陷阱并返回目标值:", isPassed);
    console.log("测试点 46 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 47：重写 valueOf() 返回字符串 "true"，强制布尔转换为 true
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn47_testValueOfReturnTrueString() {
    console.log("=== 测试点 47：valueOf() 返回 \"true\" 时强制布尔转换 ===");
    const trueStrObj = {
        valueOf() {
            return "true"; // 重写返回字符串 "true"
        }
    };
    const forcedBool = Boolean(trueStrObj); // 强制布尔转换
    const isPassed = forcedBool === true;

    console.log("测试对象:", trueStrObj);
    console.log("valueOf() 返回值:", trueStrObj.valueOf());
    console.log("强制布尔转换结果:", forcedBool);
    console.log("是否转为 true:", isPassed);
    console.log("测试点 47 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 48：重写 valueOf() 返回空对象，强制布尔转换为 true（对象均为真值）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn48_testValueOfReturnEmptyObjForcedBool() {
    console.log("=== 测试点 48：valueOf() 返回空对象时强制布尔转换 ===");
    const emptyObjObj = {
        valueOf() {
            return {}; // 重写返回空对象
        }
    };
    const forcedBool = Boolean(emptyObjObj); // 强制布尔转换（对象本身为真值）
    const isPassed = forcedBool === true;

    console.log("测试对象:", emptyObjObj);
    console.log("valueOf() 返回空对象:", emptyObjObj.valueOf());
    console.log("强制布尔转换结果:", forcedBool);
    console.log("是否转为 true（对象为真值）:", isPassed);
    console.log("测试点 48 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 49：BigInt 对象的 valueOf() 返回原始 BigInt（基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn49_testBigIntObjectValueOfReturnsPrimitive() {
    console.log("=== 测试点 49：BigInt 对象的 valueOf() 返回原始 BigInt ===");
    const primitiveBigInt = 1234567890123456789n;
    const bigIntObj = Object(primitiveBigInt); // 转为 BigInt 对象
    const valueOfResult = bigIntObj.valueOf();
    const isPassed = valueOfResult === primitiveBigInt && typeof valueOfResult === "bigint";

    console.log("BigInt 对象:", bigIntObj);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回原始 BigInt:", isPassed);
    console.log("测试点 49 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 50：重写 valueOf() 后，对象参与位运算（按位与）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn50_testCustomValueOfForBitwiseAnd() {
    console.log("=== 测试点 50：重写 valueOf() 支持对象按位与运算 ===");

    class BitWrap {
        constructor(bitNum) {
            this.bitNum = bitNum;
        }

        valueOf() {
            return this.bitNum; // 重写返回数值（用于位运算）
        }
    }

    const wrap1 = new BitWrap(0b1010); // 10 的二进制
    const wrap2 = new BitWrap(0b1100); // 12 的二进制
    const bitResult = wrap1 & wrap2; // 按位与：0b1000（8）
    const isPassed = bitResult === 8 && typeof bitResult === "number";

    console.log("BitWrap 实例1（0b1010=10）:", wrap1);
    console.log("BitWrap 实例2（0b1100=12）:", wrap2);
    console.log("按位与结果:", bitResult);
    console.log("是否等于预期结果（8）:", isPassed);
    console.log("测试点 50 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 51：重写 valueOf() 后，对象参与位运算（按位或）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn51_testCustomValueOfForBitwiseOr() {
    console.log("=== 测试点 51：重写 valueOf() 支持对象按位或运算 ===");

    class BitContainer {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值，用于位运算
        }
    }

    const bit1 = new BitContainer(0b0101); // 5 的二进制
    const bit2 = new BitContainer(0b1010); // 10 的二进制
    const orResult = bit1 | bit2; // 按位或：0b1111（15）
    const isPassed = orResult === 15 && typeof orResult === "number";

    console.log("BitContainer 实例1（0b0101=5）:", bit1);
    console.log("BitContainer 实例2（0b1010=10）:", bit2);
    console.log("按位或结果:", orResult);
    console.log("是否等于预期结果（15）:", isPassed);
    console.log("测试点 51 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 52：Date 对象与 Date 对象比较，调用 valueOf() 对比时间戳
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn52_testDateCompareWithDate() {
    console.log("=== 测试点 52：Date 对象间比较调用 valueOf() 对比时间戳 ===");
    const date1 = new Date("2024-01-01");
    const date2 = new Date("2024-01-02");
    const compareResult = date1 < date2; // 比较时间戳大小
    const timestamp1 = date1.valueOf();
    const timestamp2 = date2.valueOf();
    const isPassed = compareResult === (timestamp1 < timestamp2);

    console.log("Date1（2024-01-01）时间戳:", timestamp1);
    console.log("Date2（2024-01-02）时间戳:", timestamp2);
    console.log("Date1 < Date2 结果:", compareResult);
    console.log("是否与时间戳比较结果一致:", isPassed);
    console.log("测试点 52 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 53：重写 valueOf() 返回 Symbol 类型，强制数字转换抛出错误
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn53_testValueOfReturnSymbolForcedNumber() {
    console.log("=== 测试点 53：valueOf() 返回 Symbol 时强制数字转换抛错 ===");
    const symObj = {
        valueOf() {
            return Symbol("test"); // 重写返回 Symbol
        }
    };
    let errorCaught = false;
    try {
        +symObj; // Symbol 无法转为数字，会抛错
    } catch (err) {
        errorCaught = err instanceof TypeError;
    }
    const isPassed = errorCaught;

    console.log("测试对象（valueOf 返回 Symbol）:", symObj);
    console.log("强制数字转换是否抛 TypeError:", errorCaught);
    console.log("测试点 53 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 54：DataView 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn54_testDataViewValueOfReturnsSelf() {
    console.log("=== 测试点 54：DataView 的 valueOf() 返回自身 ===");
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer); // 创建 DataView 操作缓冲区
    const valueOfResult = dataView.valueOf();
    const isPassed = valueOfResult === dataView && valueOfResult instanceof DataView;

    console.log("DataView 实例:", dataView);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回 DataView 自身:", isPassed);
    console.log("测试点 54 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 55：重写 valueOf() 实现对象递增运算（++）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn55_testCustomValueOfForIncrement() {
    console.log("=== 测试点 55：重写 valueOf() 支持对象递增运算 ===");

    class Counter {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回当前数值
        }
    }

    const counter = new Counter(5);
    const postIncrement = counter++; // 后置递增：先取值再+1
    const isPassed = postIncrement === 5 && counter.num === 6;

    console.log("Counter 初始值（5）:", counter);
    console.log("后置递增返回值:", postIncrement);
    console.log("递增后 Counter 内部值:", counter.num);
    console.log("是否符合递增逻辑:", isPassed);
    console.log("测试点 55 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 56：重写 valueOf() 实现对象递减运算（--）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn56_testCustomValueOfForDecrement() {
    console.log("=== 测试点 56：重写 valueOf() 支持对象递减运算 ===");

    class Counter {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回当前数值
        }
    }

    const counter = new Counter(10);
    const preDecrement = --counter; // 前置递减：先-1再取值
    const isPassed = preDecrement === 9 && counter.num === 9;

    console.log("Counter 初始值（10）:", counter);
    console.log("前置递减返回值:", preDecrement);
    console.log("递减后 Counter 内部值:", counter.num);
    console.log("是否符合递减逻辑:", isPassed);
    console.log("测试点 56 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 57：原型链断裂的对象（__proto__=null），valueOf() 需显式调用原型方法
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn57_testBrokenProtoObjValueOf() {
    console.log("=== 测试点 57：原型链断裂对象需显式调用 Object 原型的 valueOf() ===");
    const brokenProtoObj = { name: "test" };
    brokenProtoObj.__proto__ = null; // 断裂原型链，无继承的 valueOf()
    let valueOfResult;
    try {
        valueOfResult = Object.prototype.valueOf.call(brokenProtoObj); // 显式调用原型方法
    } catch (err) {
        valueOfResult = null;
    }
    const isPassed = valueOfResult === brokenProtoObj;

    console.log("原型链断裂的对象:", brokenProtoObj);
    console.log("显式调用原型 valueOf() 返回值:", valueOfResult);
    console.log("是否返回对象自身:", isPassed);
    console.log("测试点 57 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 58：重写 valueOf() 返回函数，强制数字转换 fallback 到 toString()
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn58_testValueOfReturnFunctionFallbackToString() {
    console.log("=== 测试点 58：valueOf() 返回函数时 fallback 到 toString() ===");
    const funcObj = {
        valueOf() {
            return () => "testFunc"; // 重写返回函数（非基本类型）
        },
        toString() {
            return "456"; // 可转为数字的字符串
        }
    };
    const forcedNumber = +funcObj;
    const isPassed = forcedNumber === 456 && typeof forcedNumber === "number";

    console.log("测试对象:", funcObj);
    console.log("valueOf() 返回函数:", funcObj.valueOf());
    console.log("强制数字转换结果:", forcedNumber);
    console.log("是否 fallback 到 toString() 结果:", isPassed);
    console.log("测试点 58 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 60：重写 valueOf() 后，对象参与指数运算（**）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn60_testCustomValueOfForExponentiation() {
    console.log("=== 测试点 60：重写 valueOf() 支持对象指数运算 ===");

    class PowerNum {
        constructor(base) {
            this.base = base;
        }

        valueOf() {
            return this.base; // 重写返回基数
        }
    }

    const baseObj = new PowerNum(2);
    const exponent = 3;
    const powerResult = baseObj**exponent; // 指数运算：2^3=8
    const isPassed = powerResult === 8 && typeof powerResult === "number";

    console.log("PowerNum 实例（基数2）:", baseObj);
    console.log("指数:", exponent);
    console.log("指数运算结果:", powerResult);
    console.log("是否等于预期结果（8）:", isPassed);
    console.log("测试点 60 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 61：重写 valueOf() 返回 NaN，对象与 NaN 比较结果为 false
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn61_testValueOfReturnNaNCompare() {
    console.log("=== 测试点 61：valueOf() 返回 NaN 时对象与 NaN 比较 ===");
    const nanObj = {
        valueOf() {
            return NaN; // 重写返回 NaN
        }
    };
    const compareResult = nanObj == NaN; // NaN 与任何值比较都为 false
    const isPassed = compareResult === false;

    console.log("测试对象（valueOf 返回 NaN）:", nanObj);
    console.log("对象与 NaN 松散比较结果:", compareResult);
    console.log("是否返回 false（NaN 特性）:", isPassed);
    console.log("测试点 61 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 63：重写 valueOf() 实现对象与字符串拼接（触发隐式转换）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn63_testCustomValueOfForStringConcat() {
    console.log("=== 测试点 63：重写 valueOf() 支持对象与字符串拼接 ===");

    class StrWrap {
        constructor(str) {
            this.str = str;
        }

        valueOf() {
            return this.str; // 重写返回字符串（基本类型）
        }
    }

    const wrapStr = new StrWrap("world");
    const concatResult = "hello " + wrapStr; // 拼接触发 valueOf()
    const isPassed = concatResult === "hello world" && typeof concatResult === "string";

    console.log("StrWrap 实例（\"world\"）:", wrapStr);
    console.log("字符串拼接结果:", concatResult);
    console.log("是否等于预期字符串:", isPassed);
    console.log("测试点 63 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 64：重写 valueOf() 返回 undefined，对象与 undefined 比较结果为 false
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn64_testValueOfReturnUndefinedCompare() {
    console.log("=== 测试点 64：valueOf() 返回 undefined 时对象与 undefined 比较 ===");
    const undefObj = {
        valueOf() {
            return undefined; // 重写返回 undefined
        }
    };
    const compareResult = undefObj == undefined; // 对象与 undefined 比较：仅 null/undefined 为 true
    const isPassed = compareResult === false;

    console.log("测试对象（valueOf 返回 undefined）:", undefObj);
    console.log("对象与 undefined 松散比较结果:", compareResult);
    console.log("是否返回 false:", isPassed);
    console.log("测试点 64 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 65：重写 valueOf() 返回 null，对象与 null 比较结果为 false
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn65_testValueOfReturnNullCompare() {
    console.log("=== 测试点 65：valueOf() 返回 null 时对象与 null 比较 ===");
    const nullObj = {
        valueOf() {
            return null; // 重写返回 null
        }
    };
    const compareResult = nullObj == null; // 对象与 null 比较：仅原始 null/undefined 为 true
    const isPassed = compareResult === false;

    console.log("测试对象（valueOf 返回 null）:", nullObj);
    console.log("对象与 null 松散比较结果:", compareResult);
    console.log("是否返回 false:", isPassed);
    console.log("测试点 65 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 67：重写 valueOf() 后，对象参与三元运算符的数值判断
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn67_testCustomValueOfForTernary() {
    console.log("=== 测试点 67：重写 valueOf() 支持三元运算符数值判断 ===");

    class Score {
        constructor(score) {
            this.score = score;
        }

        valueOf() {
            return this.score; // 重写返回分数值
        }
    }

    const studentScore = new Score(85);
    const result = studentScore >= 60 ? "及格" : "不及格"; // 三元判断触发 valueOf()
    const isPassed = result === "及格";

    console.log("Score 实例（85分）:", studentScore);
    console.log("三元运算符判断结果:", result);
    console.log("是否判断为及格:", isPassed);
    console.log("测试点 67 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 68：重写 valueOf() 返回数组（非基本类型），强制数字转换 fallback 到 toString()
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn68_testValueOfReturnArrayFallbackToString() {
    console.log("=== 测试点 68：valueOf() 返回数组时 fallback 到 toString() ===");
    const arrObj = {
        valueOf() {
            return [1, 2, 3]; // 重写返回数组（非基本类型）
        },
        toString() {
            return "123"; // 数组 toString() 为 "1,2,3"，此处自定义为 "123"
        }
    };
    const forcedNumber = +arrObj;
    const isPassed = forcedNumber === 123 && typeof forcedNumber === "number";

    console.log("测试对象:", arrObj);
    console.log("valueOf() 返回数组:", arrObj.valueOf());
    console.log("强制数字转换结果:", forcedNumber);
    console.log("是否 fallback 到自定义 toString() 结果:", isPassed);
    console.log("测试点 68 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 69：Intl.DateTimeFormat 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn69_testIntlDateTimeFormatValueOfReturnsSelf() {
    console.log("=== 测试点 69：Intl.DateTimeFormat 的 valueOf() 返回自身 ===");
    const dateFormatter = new Intl.DateTimeFormat("zh-CN", { year: "numeric", month: "long" });
    const valueOfResult = dateFormatter.valueOf();
    const isPassed = valueOfResult === dateFormatter && valueOfResult instanceof Intl.DateTimeFormat;

    console.log("Intl.DateTimeFormat 实例:", dateFormatter);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回格式化器自身:", isPassed);
    console.log("测试点 69 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 70：重写 valueOf() 实现对象参与逻辑与（&&）运算
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn70_testCustomValueOfForLogicalAnd() {
    console.log("=== 测试点 70：重写 valueOf() 支持对象逻辑与运算 ===");

    class BoolWrap {
        constructor(bool) {
            this.bool = bool;
        }

        valueOf() {
            return this.bool; // 重写返回布尔值
        }
    }

    const trueWrap = new BoolWrap(true);
    const falseWrap = new BoolWrap(false);
    const andResult1 = trueWrap && "success"; // 逻辑与：前真返后值
    const andResult2 = falseWrap && "success"; // 逻辑与：前假返前值
    const isPassed = andResult1 === "success" && andResult2 === falseWrap;

    console.log("true 包装对象 && \"success\" 结果:", andResult1);
    console.log("false 包装对象 && \"success\" 结果:", andResult2);
    console.log("是否符合逻辑与规则:", isPassed);
    console.log("测试点 70 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 71：重写 valueOf() 实现对象参与逻辑或（||）运算
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn71_testCustomValueOfForLogicalOr() {
    console.log("=== 测试点 71：重写 valueOf() 支持对象逻辑或运算 ===");

    class BoolWrap {
        constructor(bool) {
            this.bool = bool;
        }

        valueOf() {
            return this.bool; // 重写返回布尔值
        }
    }

    const trueWrap = new BoolWrap(true);
    const falseWrap = new BoolWrap(false);
    const orResult1 = trueWrap || "fallback"; // 逻辑或：前真返前值
    const orResult2 = falseWrap || "fallback"; // 逻辑或：前假返后值
    const isPassed = orResult1 === trueWrap && orResult2 === "fallback";

    console.log("true 包装对象 || \"fallback\" 结果:", orResult1);
    console.log("false 包装对象 || \"fallback\" 结果:", orResult2);
    console.log("是否符合逻辑或规则:", isPassed);
    console.log("测试点 71 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 72：重写 valueOf() 返回正则表达式（非基本类型），强制数字转换为 NaN
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn72_testValueOfReturnRegExpForcedNumber() {
    console.log("=== 测试点 72：valueOf() 返回正则时强制数字转换为 NaN ===");
    const regObj = {
        valueOf() {
            return /\d+/; // 重写返回正则表达式（非基本类型）
        },
        toString() {
            return "/\\d+/"; // 正则默认 toString() 为 "/\\d+/"，无法转为有效数字
        }
    };
    const forcedNumber = +regObj;
    const isPassed = isNaN(forcedNumber) && typeof forcedNumber === "number";

    console.log("测试对象:", regObj);
    console.log("valueOf() 返回正则:", regObj.valueOf());
    console.log("强制数字转换结果:", forcedNumber);
    console.log("是否转为 NaN:", isPassed);
    console.log("测试点 72 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 74：重写 valueOf() 后，对象使用 Number() 函数转换的结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn74_testCustomValueOfForNumberFunction() {
    console.log("=== 测试点 74：重写 valueOf() 后 Number() 函数转换结果 ===");

    class NumWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num * 2; // 重写返回数值的 2 倍
        }
    }

    const wrap = new NumWrap(10);
    const numberResult = Number(wrap); // Number() 转换触发 valueOf()
    const isPassed = numberResult === 20 && typeof numberResult === "number";

    console.log("NumWrap 实例（10）:", wrap);
    console.log("Number() 转换结果:", numberResult);
    console.log("是否等于 valueOf() 返回值（20）:", isPassed);
    console.log("测试点 74 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 75：重写 valueOf() 后，对象使用 String() 函数转换（优先 valueOf() 基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn75_testCustomValueOfForStringFunction() {
    console.log("=== 测试点 75：重写 valueOf() 后 String() 函数转换结果 ===");

    class StrWrap {
        constructor(str) {
            this.str = str;
        }

        valueOf() {
            return this.str.toUpperCase(); // 重写返回大写字符串（基本类型）
        }

        toString() {
            return this.str.toLowerCase(); // 若 valueOf() 非基本类型才用 toString()
        }
    }

    const wrap = new StrWrap("Test");
    const stringResult = String(wrap); // String() 优先用 valueOf() 基本类型
    const isPassed = stringResult === "TEST" && typeof stringResult === "string";

    console.log("StrWrap 实例（\"Test\"）:", wrap);
    console.log("String() 转换结果:", stringResult);
    console.log("是否等于 valueOf() 返回值（\"TEST\"）:", isPassed);
    console.log("测试点 75 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 76：重写 valueOf() 返回 Map（非基本类型），强制数字转换 fallback 到 toString()
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn76_testValueOfReturnMapFallbackToString() {
    console.log("=== 测试点 76：valueOf() 返回 Map 时 fallback 到 toString() ===");
    const map = new Map([["key", "value"]]);
    const mapObj = {
        valueOf() {
            return map; // 重写返回 Map（非基本类型）
        },
        toString() {
            return "789"; // 自定义 toString() 返回可转数字的字符串
        }
    };
    const forcedNumber = +mapObj;
    const isPassed = forcedNumber === 789 && typeof forcedNumber === "number";

    console.log("测试对象:", mapObj);
    console.log("valueOf() 返回 Map:", mapObj.valueOf());
    console.log("强制数字转换结果:", forcedNumber);
    console.log("是否 fallback 到 toString() 结果:", isPassed);
    console.log("测试点 76 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 77：Intl.NumberFormat 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn77_testIntlNumberFormatValueOfReturnsSelf() {
    console.log("=== 测试点 77：Intl.NumberFormat 的 valueOf() 返回自身 ===");
    const numberFormatter = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" });
    const valueOfResult = numberFormatter.valueOf();
    const isPassed = valueOfResult === numberFormatter && valueOfResult instanceof Intl.NumberFormat;

    console.log("Intl.NumberFormat 实例:", numberFormatter);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回格式化器自身:", isPassed);
    console.log("测试点 77 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 78：重写 valueOf() 实现对象参与左移运算（<<）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn78_testCustomValueOfForLeftShift() {
    console.log("=== 测试点 78：重写 valueOf() 支持对象左移运算 ===");

    class BitWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值（用于位运算）
        }
    }

    const wrap = new BitWrap(4); // 4 的二进制：0b100
    const shiftResult = wrap << 2; // 左移 2 位：0b10000（16）
    const isPassed = shiftResult === 16 && typeof shiftResult === "number";

    console.log("BitWrap 实例（4=0b100）:", wrap);
    console.log("左移 2 位结果:", shiftResult);
    console.log("是否等于预期结果（16）:", isPassed);
    console.log("测试点 78 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 79：重写 valueOf() 实现对象参与右移运算（>>）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn79_testCustomValueOfForRightShift() {
    console.log("=== 测试点 79：重写 valueOf() 支持对象右移运算 ===");

    class BitWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值（用于位运算）
        }
    }

    const wrap = new BitWrap(16); // 16 的二进制：0b10000
    const shiftResult = wrap >> 2; // 右移 2 位：0b100（4）
    const isPassed = shiftResult === 4 && typeof shiftResult === "number";

    console.log("BitWrap 实例（16=0b10000）:", wrap);
    console.log("右移 2 位结果:", shiftResult);
    console.log("是否等于预期结果（4）:", isPassed);
    console.log("测试点 79 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 81：重写 valueOf() 返回 BigInt 超出安全整数，强制数字转换丢失精度
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn81_testValueOfReturnBigIntBeyondSafeInt() {
    console.log("=== 测试点 81：valueOf() 返回超安全整数 BigInt 时的强制转换 ===");
    const bigIntObj = {
        valueOf() {
            return 9007199254740993n; // 超出最大安全整数（9007199254740991）的 BigInt
        }
    };
    const forcedNumber = +bigIntObj; // 转换会丢失精度
    const isPassed = forcedNumber === 9007199254740992 && typeof forcedNumber === "number";

    console.log("测试对象:", bigIntObj);
    console.log("valueOf() 返回 BigInt:", bigIntObj.valueOf());
    console.log("强制转换为数字结果（丢失精度）:", forcedNumber);
    console.log("是否符合精度丢失规则:", isPassed);
    console.log("测试点 81 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 82：重写 valueOf() 后，对象使用 Boolean() 函数转换的结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn82_testCustomValueOfForBooleanFunction() {
    console.log("=== 测试点 82：重写 valueOf() 后 Boolean() 函数转换结果 ===");

    class BoolWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值（非零为真，零为假）
        }
    }

    const wrapTrue = new BoolWrap(10);
    const wrapFalse = new BoolWrap(0);
    const boolTrue = Boolean(wrapTrue);
    const boolFalse = Boolean(wrapFalse);
    const isPassed = boolTrue === true && boolFalse === false;

    console.log("BoolWrap 实例1（10）→ Boolean:", boolTrue);
    console.log("BoolWrap 实例2（0）→ Boolean:", boolFalse);
    console.log("是否符合数值转布尔规则:", isPassed);
    console.log("测试点 82 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 83：Intl.Collator 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn83_testIntlCollatorValueOfReturnsSelf() {
    console.log("=== 测试点 83：Intl.Collator 的 valueOf() 返回自身 ===");
    const collator = new Intl.Collator("zh-CN", { sensitivity: "base" }); // 中文排序器
    const valueOfResult = collator.valueOf();
    const isPassed = valueOfResult === collator && valueOfResult instanceof Intl.Collator;

    console.log("Intl.Collator 实例:", collator);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回排序器自身:", isPassed);
    console.log("测试点 83 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 84：重写 valueOf() 返回 Set（非基本类型），强制数字转换 fallback 到 toString()
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn84_testValueOfReturnSetFallbackToString() {
    console.log("=== 测试点 84：valueOf() 返回 Set 时 fallback 到 toString() ===");
    const set = new Set([1, 2, 3]);
    const setObj = {
        valueOf() {
            return set; // 重写返回 Set（非基本类型）
        },
        toString() {
            return "321"; // 自定义 toString() 返回可转数字的字符串
        }
    };
    const forcedNumber = +setObj;
    const isPassed = forcedNumber === 321 && typeof forcedNumber === "number";

    console.log("测试对象:", setObj);
    console.log("valueOf() 返回 Set:", setObj.valueOf());
    console.log("强制数字转换结果:", forcedNumber);
    console.log("是否 fallback 到 toString() 结果:", isPassed);
    console.log("测试点 84 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 85：重写 valueOf() 实现对象参与无符号右移运算（>>>）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn85_testCustomValueOfForUnsignedRightShift() {
    console.log("=== 测试点 85：重写 valueOf() 支持对象无符号右移运算 ===");

    class BitWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值（用于位运算）
        }
    }

    const wrap = new BitWrap(-8); // -8 二进制补码：0xFFFFFFF8
    const shiftResult = wrap >>> 2; // 无符号右移 2 位：0x3FFFFFFE（1073741822）
    const isPassed = shiftResult === 1073741822 && typeof shiftResult === "number";

    console.log("BitWrap 实例（-8）:", wrap);
    console.log("无符号右移 2 位结果:", shiftResult);
    console.log("是否等于预期结果（1073741822）:", isPassed);
    console.log("测试点 85 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 87：重写 valueOf() 返回空字符串，对象与空字符串比较结果为 true
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn87_testValueOfReturnEmptyStringCompare() {
    console.log("=== 测试点 87：valueOf() 返回空字符串时对象与空字符串比较 ===");
    const emptyStrObj = {
        valueOf() {
            return ""; // 重写返回空字符串（基本类型）
        }
    };
    const compareResult = emptyStrObj == ""; // 松散比较：空字符串与空字符串相等
    const isPassed = compareResult === true;

    console.log("测试对象（valueOf 返回空字符串）:", emptyStrObj);
    console.log("对象与空字符串松散比较结果:", compareResult);
    console.log("是否返回 true:", isPassed);
    console.log("测试点 87 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 88：重写 valueOf() 返回 undefined，强制布尔转换为 false
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn88_testValueOfReturnUndefinedForcedBool() {
    console.log("=== 测试点 88：valueOf() 返回 undefined 时强制布尔转换 ===");
    const undefObj = {
        valueOf() {
            return undefined; // 重写返回 undefined
        }
    };
    const forcedBool = Boolean(undefObj.valueOf()); // 直接转换 valueOf() 结果
    const isPassed = forcedBool === false;

    console.log("测试对象:", undefObj);
    console.log("valueOf() 返回 undefined:", undefObj.valueOf());
    console.log("强制布尔转换结果:", forcedBool);
    console.log("是否转为 false（undefined 为假）:", isPassed);
    console.log("测试点 88 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 89：Intl.PluralRules 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn89_testIntlPluralRulesValueOfReturnsSelf() {
    console.log("=== 测试点 89：Intl.PluralRules 的 valueOf() 返回自身 ===");
    const pluralRules = new Intl.PluralRules("en-US", { type: "cardinal" }); // 英文复数规则
    const valueOfResult = pluralRules.valueOf();
    const isPassed = valueOfResult === pluralRules && valueOfResult instanceof Intl.PluralRules;

    console.log("Intl.PluralRules 实例:", pluralRules);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回复数规则对象自身:", isPassed);
    console.log("测试点 89 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 90：重写 valueOf() 实现对象参与按位异或运算（^）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn90_testCustomValueOfForBitwiseXor() {
    console.log("=== 测试点 90：重写 valueOf() 支持对象按位异或运算 ===");

    class BitWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值（用于位运算）
        }
    }

    const wrap1 = new BitWrap(0b1010); // 10 的二进制
    const wrap2 = new BitWrap(0b1100); // 12 的二进制
    const xorResult = wrap1 ^ wrap2; // 按位异或：0b0110（6）
    const isPassed = xorResult === 6 && typeof xorResult === "number";

    console.log("BitWrap 实例1（0b1010=10）:", wrap1);
    console.log("BitWrap 实例2（0b1100=12）:", wrap2);
    console.log("按位异或结果:", xorResult);
    console.log("是否等于预期结果（6）:", isPassed);
    console.log("测试点 90 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 91：重写 valueOf() 返回 null，强制布尔转换为 false
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn91_testValueOfReturnNullForcedBool() {
    console.log("=== 测试点 91：valueOf() 返回 null 时强制布尔转换 ===");
    const nullObj = {
        valueOf() {
            return null; // 重写返回 null
        }
    };
    const forcedBool = Boolean(nullObj.valueOf()); // 直接转换 valueOf() 结果
    const isPassed = forcedBool === false;

    console.log("测试对象:", nullObj);
    console.log("valueOf() 返回 null:", nullObj.valueOf());
    console.log("强制布尔转换结果:", forcedBool);
    console.log("是否转为 false（null 为假）:", isPassed);
    console.log("测试点 91 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 93：重写 valueOf() 后，对象参与逗号运算符的数值处理
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn93_testCustomValueOfForCommaOperator() {
    console.log("=== 测试点 93：重写 valueOf() 支持逗号运算符数值处理 ===");

    class NumWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值
        }
    }

    const wrap1 = new NumWrap(5);
    const wrap2 = new NumWrap(10);
    const commaResult = (wrap1 + 3, wrap2 * 2); // 逗号运算符：返回最后表达式结果
    const isPassed = commaResult === 20 && typeof commaResult === "number";

    console.log("逗号运算符表达式: (wrap1+3, wrap2*2)");
    console.log("表达式结果:", commaResult);
    console.log("是否等于预期结果（20）:", isPassed);
    console.log("测试点 93 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 94：Intl.RelativeTimeFormat 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn94_testIntlRelativeTimeFormatValueOfReturnsSelf() {
    console.log("=== 测试点 94：Intl.RelativeTimeFormat 的 valueOf() 返回自身 ===");
    const timeFormatter = new Intl.RelativeTimeFormat("zh-CN", { style: "short" });
    const valueOfResult = timeFormatter.valueOf();
    const isPassed = valueOfResult === timeFormatter && valueOfResult instanceof Intl.RelativeTimeFormat;

    console.log("Intl.RelativeTimeFormat 实例:", timeFormatter);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回相对时间格式化器自身:", isPassed);
    console.log("测试点 94 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 95：重写 valueOf() 返回字符串 "0"，强制数字转换为 0
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn95_testValueOfReturnZeroString() {
    console.log("=== 测试点 95：valueOf() 返回 \"0\" 时强制数字转换 ===");
    const zeroStrObj = {
        valueOf() {
            return "0"; // 重写返回字符串 "0"
        }
    };
    const forcedNumber = +zeroStrObj;
    const isPassed = forcedNumber === 0 && typeof forcedNumber === "number";

    console.log("测试对象:", zeroStrObj);
    console.log("valueOf() 返回字符串 \"0\":", zeroStrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否转为 0:", isPassed);
    console.log("测试点 95 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 96：重写 valueOf() 返回字符串 "123abc"，强制数字转换为 123（字符串前导数字）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn96_testValueOfReturnMixedString() {
    console.log("=== 测试点 96：valueOf() 返回 \"123abc\" 时强制数字转换 ===");
    const mixedStrObj = {
        valueOf() {
            return "123abc"; // 重写返回混合字符串（前导数字）
        }
    };
    const forcedNumber = +mixedStrObj;
    const isPassed = forcedNumber === 123 && typeof forcedNumber === "number";

    console.log("测试对象:", mixedStrObj);
    console.log("valueOf() 返回字符串 \"123abc\":", mixedStrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否提取前导数字转为 123:", isPassed);
    console.log("测试点 96 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 97：Intl.Locale 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn97_testIntlLocaleValueOfReturnsSelf() {
    console.log("=== 测试点 97：Intl.Locale 的 valueOf() 返回自身 ===");
    const locale = new Intl.Locale("zh-CN", { calendar: "gregory" });
    const valueOfResult = locale.valueOf();
    const isPassed = valueOfResult === locale && valueOfResult instanceof Intl.Locale;

    console.log("Intl.Locale 实例:", locale);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回区域设置对象自身:", isPassed);
    console.log("测试点 97 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 98：重写 valueOf() 实现对象参与一元加运算（+obj）返回数值
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn98_testCustomValueOfForUnaryPlus() {
    console.log("=== 测试点 98：重写 valueOf() 支持一元加运算 ===");

    class UnaryWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值
        }
    }

    const wrap = new UnaryWrap(-5);
    const unaryResult = +wrap; // 一元加：等同于强制数字转换
    const isPassed = unaryResult === -5 && typeof unaryResult === "number";

    console.log("UnaryWrap 实例（-5）:", wrap);
    console.log("一元加运算结果（+wrap）:", unaryResult);
    console.log("是否等于预期数值（-5）:", isPassed);
    console.log("测试点 98 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 99：重写 valueOf() 实现对象参与一元减运算（-obj）返回数值
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn99_testCustomValueOfForUnaryMinus() {
    console.log("=== 测试点 99：重写 valueOf() 支持一元减运算 ===");

    class UnaryWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值
        }
    }

    const wrap = new UnaryWrap(8);
    const unaryResult = -wrap; // 一元减：对 valueOf() 结果取反
    const isPassed = unaryResult === -8 && typeof unaryResult === "number";

    console.log("UnaryWrap 实例（8）:", wrap);
    console.log("一元减运算结果（-wrap）:", unaryResult);
    console.log("是否等于预期数值（-8）:", isPassed);
    console.log("测试点 99 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 100：重写 valueOf() 返回字符串 "Infinity"，强制数字转换为 Infinity
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn100_testValueOfReturnInfinityString() {
    console.log("=== 测试点 100：valueOf() 返回 \"Infinity\" 时强制数字转换 ===");
    const infStrObj = {
        valueOf() {
            return "Infinity"; // 重写返回字符串 "Infinity"
        }
    };
    const forcedNumber = +infStrObj;
    const isPassed = forcedNumber === Infinity && typeof forcedNumber === "number";

    console.log("测试对象:", infStrObj);
    console.log("valueOf() 返回字符串 \"Infinity\":", infStrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否转为 Infinity:", isPassed);
    console.log("测试点 100 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 101：Intl.DisplayNames 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn101_testIntlDisplayNamesValueOfReturnsSelf() {
    console.log("=== 测试点 101：Intl.DisplayNames 的 valueOf() 返回自身 ===");
    const displayNames = new Intl.DisplayNames("zh-CN", { type: "region" });
    const valueOfResult = displayNames.valueOf();
    const isPassed = valueOfResult === displayNames && valueOfResult instanceof Intl.DisplayNames;

    console.log("Intl.DisplayNames 实例:", displayNames);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回显示名称对象自身:", isPassed);
    console.log("测试点 101 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 102：重写 valueOf() 返回数组 [1]，强制数字转换 fallback 到 toString() 为 "1"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn102_testValueOfReturnSingleElemArray() {
    console.log("=== 测试点 102：valueOf() 返回 [1] 时强制数字转换 ===");
    const arrObj = {
        valueOf() {
            return [1]; // 重写返回单元素数组（非基本类型）
        }
    };
    // 数组 toString() 为 "1"，强制转换为数字 1
    const forcedNumber = +arrObj;
    const isPassed = forcedNumber === 1 && typeof forcedNumber === "number";

    console.log("测试对象:", arrObj);
    console.log("valueOf() 返回数组 [1]:", arrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否转为 1:", isPassed);
    console.log("测试点 102 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 103：重写 valueOf() 返回数组 [1,2]，强制数字转换 fallback 到 toString() 为 "1,2"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn103_testValueOfReturnMultiElemArray() {
    console.log("=== 测试点 103：valueOf() 返回 [1,2] 时强制数字转换 ===");
    const arrObj = {
        valueOf() {
            return [1, 2]; // 重写返回多元素数组（非基本类型）
        }
    };
    // 数组 toString() 为 "1,2"，无法转为有效数字，结果为 NaN
    const forcedNumber = +arrObj;
    const isPassed = isNaN(forcedNumber) && typeof forcedNumber === "number";

    console.log("测试对象:", arrObj);
    console.log("valueOf() 返回数组 [1,2]:", arrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否转为 NaN:", isPassed);
    console.log("测试点 103 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 104：Intl.DateTimeFormat 实例的 valueOf() 与自身严格相等
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn104_testIntlDateTimeFormatValueOfStrictEqual() {
    console.log("=== 测试点 104：Intl.DateTimeFormat 实例 valueOf() 与自身严格相等 ===");
    const formatter = new Intl.DateTimeFormat("en-US");
    const valueOfResult = formatter.valueOf();
    const isPassed = valueOfResult === formatter;

    console.log("Intl.DateTimeFormat 实例:", formatter);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否与自身严格相等:", isPassed);
    console.log("测试点 104 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 105：重写 valueOf() 返回函数，对象与函数比较结果为 false
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn105_testValueOfReturnFunctionCompare() {
    console.log("=== 测试点 105：valueOf() 返回函数时对象与函数比较 ===");
    const testFunc = () => "test";
    const funcObj = {
        valueOf() {
            return testFunc; // 重写返回函数
        }
    };
    const compareResult = funcObj == testFunc; // 对象与函数引用不同，结果为 false
    const isPassed = compareResult === false;

    console.log("测试对象:", funcObj);
    console.log("比较目标函数:", testFunc);
    console.log("对象与函数松散比较结果:", compareResult);
    console.log("是否返回 false:", isPassed);
    console.log("测试点 105 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 106：重写 valueOf() 后，对象使用 parseInt() 函数转换的结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn106_testCustomValueOfForParseInt() {
    console.log("=== 测试点 106：重写 valueOf() 后 parseInt() 转换结果 ===");

    class ParseWrap {
        constructor(str) {
            this.str = str;
        }

        valueOf() {
            return this.str; // 重写返回字符串（供 parseInt 解析）
        }
    }

    const wrap = new ParseWrap("123abc");
    const parseResult = parseInt(wrap, 10); // parseInt 优先用 valueOf() 结果，提取前导数字
    const isPassed = parseResult === 123 && typeof parseResult === "number";

    console.log("ParseWrap 实例（\"123abc\"）:", wrap);
    console.log("parseInt() 转换结果:", parseResult);
    console.log("是否提取前导数字转为 123:", isPassed);
    console.log("测试点 106 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 107：重写 valueOf() 后，对象使用 parseFloat() 函数转换的结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn107_testCustomValueOfForParseFloat() {
    console.log("=== 测试点 107：重写 valueOf() 后 parseFloat() 转换结果 ===");

    class ParseFloatWrap {
        constructor(str) {
            this.str = str;
        }

        valueOf() {
            return this.str; // 重写返回带小数的字符串
        }
    }

    const wrap = new ParseFloatWrap("3.1415abc");
    const parseResult = parseFloat(wrap); // parseFloat 解析 valueOf() 结果中的浮点数
    const isPassed = parseResult === 3.1415 && typeof parseResult === "number";

    console.log("ParseFloatWrap 实例（\"3.1415abc\"）:", wrap);
    console.log("parseFloat() 转换结果:", parseResult);
    console.log("是否解析浮点数为 3.1415:", isPassed);
    console.log("测试点 107 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 109：重写 valueOf() 返回字符串 "false"，强制布尔转换为 true（非空字符串为真）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn109_testValueOfReturnFalseStringForcedBool() {
    console.log("=== 测试点 109：valueOf() 返回 \"false\" 时强制布尔转换 ===");
    const falseStrObj = {
        valueOf() {
            return "false"; // 重写返回字符串 "false"
        }
    };
    const forcedBool = Boolean(falseStrObj.valueOf()); // 转换 valueOf() 结果（非空字符串）
    const isPassed = forcedBool === true;

    console.log("测试对象:", falseStrObj);
    console.log("valueOf() 返回字符串 \"false\":", falseStrObj.valueOf());
    console.log("强制布尔转换结果:", forcedBool);
    console.log("是否转为 true（非空字符串为真）:", isPassed);
    console.log("测试点 109 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 110：Intl.NumberFormat 实例的 valueOf() 与另一个实例不相等
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn110_testIntlNumberFormatValueOfNotEqual() {
    console.log("=== 测试点 110：Intl.NumberFormat 不同实例 valueOf() 不相等 ===");
    const formatter1 = new Intl.NumberFormat("en-US");
    const formatter2 = new Intl.NumberFormat("en-US"); // 同配置不同实例
    const valueOf1 = formatter1.valueOf();
    const valueOf2 = formatter2.valueOf();
    const isPassed = valueOf1 !== valueOf2;

    console.log("Intl.NumberFormat 实例1:", formatter1);
    console.log("Intl.NumberFormat 实例2:", formatter2);
    console.log("实例1 valueOf() 结果:", valueOf1);
    console.log("实例2 valueOf() 结果:", valueOf2);
    console.log("不同实例 valueOf() 是否不相等:", isPassed);
    console.log("测试点 110 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 111：重写 valueOf() 返回 Symbol.iterator，强制数字转换抛出 TypeError
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn111_testValueOfReturnSymbolIterator() {
    console.log("=== 测试点 111：valueOf() 返回 Symbol.iterator 时强制数字转换抛错 ===");
    const iterSymObj = {
        valueOf() {
            return Symbol.iterator; // 重写返回内置 Symbol
        }
    };
    let errorCaught = false;
    try {
        +iterSymObj; // Symbol 无法转为数字，触发 TypeError
    } catch (err) {
        errorCaught = err instanceof TypeError;
    }
    const isPassed = errorCaught;

    console.log("测试对象（valueOf 返回 Symbol.iterator）:", iterSymObj);
    console.log("强制数字转换是否抛 TypeError:", errorCaught);
    console.log("测试点 111 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 112：Storage 对象（localStorage）的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn112_testLocalStorageValueOfReturnsSelf() {
    console.log("=== 测试点 112：localStorage 的 valueOf() 返回自身 ===");
    let storageObj;
    try {
        storageObj = window.localStorage; // 浏览器环境获取 localStorage
    } catch (err) {
        // 非浏览器环境或隐私模式下模拟对象
        storageObj = { __proto__: { constructor: { name: "Storage" } } };
    }
    const valueOfResult = storageObj.valueOf();
    const isPassed = valueOfResult === storageObj &&
        (storageObj instanceof Storage || storageObj.__proto__.constructor.name === "Storage");

    console.log("localStorage 实例:", storageObj);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回 localStorage 自身:", isPassed);
    console.log("测试点 112 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 113：重写 valueOf() 实现对象参与减法运算（负数场景）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn113_testCustomValueOfForNegativeSubtraction() {
    console.log("=== 测试点 113：重写 valueOf() 支持负数减法运算 ===");

    class NegativeNum {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回负数
        }
    }

    const num1 = new NegativeNum(-10);
    const num2 = new NegativeNum(-5);
    const subResult = num1 - num2; // 负数减法：-10 - (-5) = -5
    const isPassed = subResult === -5 && typeof subResult === "number";

    console.log("NegativeNum 实例1（-10）:", num1);
    console.log("NegativeNum 实例2（-5）:", num2);
    console.log("减法结果:", subResult);
    console.log("是否等于预期结果（-5）:", isPassed);
    console.log("测试点 113 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 114：Intl.Collator 实例的 valueOf() 与自身严格相等
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn114_testIntlCollatorValueOfStrictEqual() {
    console.log("=== 测试点 114：Intl.Collator 实例 valueOf() 与自身严格相等 ===");
    const collator = new Intl.Collator("ja-JP"); // 日语排序器
    const valueOfResult = collator.valueOf();
    const isPassed = valueOfResult === collator;

    console.log("Intl.Collator 实例:", collator);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否与自身严格相等:", isPassed);
    console.log("测试点 114 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 115：重写 valueOf() 返回字符串 " 123 "（含空格），强制数字转换为 123（忽略空格）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn115_testValueOfReturnSpacedString() {
    console.log("=== 测试点 115：valueOf() 返回 \" 123 \" 时强制数字转换 ===");
    const spacedStrObj = {
        valueOf() {
            return " 123 "; // 重写返回前后带空格的字符串
        }
    };
    const forcedNumber = +spacedStrObj; // 强制转换会忽略字符串前后空格
    const isPassed = forcedNumber === 123 && typeof forcedNumber === "number";

    console.log("测试对象:", spacedStrObj);
    console.log("valueOf() 返回字符串 \" 123 \":", spacedStrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否忽略空格转为 123:", isPassed);
    console.log("测试点 115 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 116：重写 valueOf() 后，对象在 if 条件判断中按 valueOf() 结果生效
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn116_testCustomValueOfForIfCondition() {
    console.log("=== 测试点 116：重写 valueOf() 影响 if 条件判断 ===");

    class ConditionWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值（非零为真，零为假）
        }
    }

    const trueWrap = new ConditionWrap(5);
    const falseWrap = new ConditionWrap(0);
    let ifResult1 = false, ifResult2 = true;

    if (trueWrap) {
        ifResult1 = true;
    } // 非零数值为真，条件成立
    if (falseWrap) {
        ifResult2 = false;
    } // 零数值为假，条件不成立

    const isPassed = ifResult1 === true && ifResult2 === true;

    console.log("if (trueWrap) 结果:", ifResult1);
    console.log("if (falseWrap) 结果（预期不进入）:", ifResult2);
    console.log("是否符合 valueOf() 结果判断:", isPassed);
    console.log("测试点 116 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 117：Navigator 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn117_testNavigatorValueOfReturnsSelf() {
    console.log("=== 测试点 117：Navigator 对象的 valueOf() 返回自身 ===");
    let navigatorObj;
    try {
        navigatorObj = window.navigator; // 浏览器环境获取 Navigator
    } catch (err) {
        // 非浏览器环境模拟对象
        navigatorObj = { __proto__: { constructor: { name: "Navigator" } } };
    }
    const valueOfResult = navigatorObj.valueOf();
    const isPassed = valueOfResult === navigatorObj &&
        (navigatorObj instanceof Navigator || navigatorObj.__proto__.constructor.name === "Navigator");

    console.log("Navigator 实例:", navigatorObj);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回 Navigator 自身:", isPassed);
    console.log("测试点 117 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 118：重写 valueOf() 返回 BigInt 负数，强制数字转换丢失精度
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn118_testValueOfReturnNegativeBigInt() {
    console.log("=== 测试点 118：valueOf() 返回负数 BigInt 时强制转换 ===");
    const negativeBigIntObj = {
        valueOf() {
            return -9007199254740993n; // 负数超安全整数 BigInt
        }
    };
    const forcedNumber = +negativeBigIntObj; // 转换丢失精度
    const isPassed = forcedNumber === -9007199254740992 && typeof forcedNumber === "number";

    console.log("测试对象:", negativeBigIntObj);
    console.log("valueOf() 返回 BigInt:", negativeBigIntObj.valueOf());
    console.log("强制转换为数字结果（丢失精度）:", forcedNumber);
    console.log("是否符合精度丢失规则:", isPassed);
    console.log("测试点 118 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 119：重写 valueOf() 实现对象参与乘法运算（小数场景）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn119_testCustomValueOfForDecimalMultiplication() {
    console.log("=== 测试点 119：重写 valueOf() 支持小数乘法运算 ===");

    class DecimalNum {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回小数数值
        }
    }

    const num1 = new DecimalNum(2.5);
    const num2 = new DecimalNum(3.2);
    const multiResult = num1 * num2; // 小数乘法：2.5 * 3.2 = 8
    const isPassed = Math.abs(multiResult - 8) < 0.0001 && typeof multiResult === "number"; // 处理浮点精度

    console.log("DecimalNum 实例1（2.5）:", num1);
    console.log("DecimalNum 实例2（3.2）:", num2);
    console.log("乘法结果:", multiResult);
    console.log("是否接近预期结果（8）:", isPassed);
    console.log("测试点 119 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 121：重写 valueOf() 返回字符串 "NaN"，强制数字转换为 NaN
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn121_testValueOfReturnNaNString() {
    console.log("=== 测试点 121：valueOf() 返回 \"NaN\" 时强制数字转换 ===");
    const nanStrObj = {
        valueOf() {
            return "NaN"; // 重写返回字符串 "NaN"
        }
    };
    const forcedNumber = +nanStrObj;
    const isPassed = isNaN(forcedNumber) && typeof forcedNumber === "number";

    console.log("测试对象:", nanStrObj);
    console.log("valueOf() 返回字符串 \"NaN\":", nanStrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否转为 NaN:", isPassed);
    console.log("测试点 121 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 122：Intl.PluralRules 实例的 valueOf() 与另一个实例不相等
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn122_testIntlPluralRulesValueOfNotEqual() {
    console.log("=== 测试点 122：Intl.PluralRules 不同实例 valueOf() 不相等 ===");
    const plural1 = new Intl.PluralRules("fr-FR"); // 法语复数规则
    const plural2 = new Intl.PluralRules("fr-FR"); // 同配置不同实例
    const valueOf1 = plural1.valueOf();
    const valueOf2 = plural2.valueOf();
    const isPassed = valueOf1 !== valueOf2;

    console.log("Intl.PluralRules 实例1:", plural1);
    console.log("Intl.PluralRules 实例2:", plural2);
    console.log("实例1 valueOf() 结果:", valueOf1);
    console.log("实例2 valueOf() 结果:", valueOf2);
    console.log("不同实例 valueOf() 是否不相等:", isPassed);
    console.log("测试点 122 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 123：重写 valueOf() 后，对象使用 isNaN() 函数判断的结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn123_testCustomValueOfForIsNaN() {
    console.log("=== 测试点 123：重写 valueOf() 后 isNaN() 判断结果 ===");

    class NaNWrap {
        valueOf() {
            return NaN; // 重写返回 NaN
        }
    }

    const wrap = new NaNWrap();
    const isNaNResult = isNaN(wrap); // isNaN() 会触发 valueOf() 并判断
    const isPassed = isNaNResult === true;

    console.log("NaNWrap 实例:", wrap);
    console.log("isNaN(wrap) 结果:", isNaNResult);
    console.log("是否判断为 NaN:", isPassed);
    console.log("测试点 123 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 124：CanvasRenderingContext2D 对象的 valueOf() 返回自身（非基本类型）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn124_testCanvasContextValueOfReturnsSelf() {
    console.log("=== 测试点 124：CanvasRenderingContext2D 的 valueOf() 返回自身 ===");
    let ctx;
    try {
        const canvas = document.createElement("canvas");
        ctx = canvas.getContext("2d"); // 获取 Canvas 2D 上下文
    } catch (err) {
        // 非浏览器环境模拟对象
        ctx = { __proto__: { constructor: { name: "CanvasRenderingContext2D" } } };
    }
    const valueOfResult = ctx.valueOf();
    const isPassed = valueOfResult === ctx &&
        (ctx instanceof CanvasRenderingContext2D ||
            ctx.__proto__.constructor.name === "CanvasRenderingContext2D");

    console.log("CanvasRenderingContext2D 实例:", ctx);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否返回 Canvas 上下文自身:", isPassed);
    console.log("测试点 124 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 125：重写 valueOf() 返回数组 [NaN]，强制数字转换为 NaN
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn125_testValueOfReturnNaNArray() {
    console.log("=== 测试点 125：valueOf() 返回 [NaN] 时强制数字转换 ===");
    const nanArrObj = {
        valueOf() {
            return [NaN]; // 重写返回含 NaN 的数组（非基本类型）
        }
    };
    // 数组 toString() 为 "NaN"，强制转换为数字 NaN
    const forcedNumber = +nanArrObj;
    const isPassed = isNaN(forcedNumber) && typeof forcedNumber === "number";

    console.log("测试对象:", nanArrObj);
    console.log("valueOf() 返回数组 [NaN]:", nanArrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否转为 NaN:", isPassed);
    console.log("测试点 125 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 126：重写 valueOf() 实现对象参与加法运算（字符串+数字）返回拼接结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn126_testCustomValueOfForStringNumberConcat() {
    console.log("=== 测试点 126：重写 valueOf() 支持字符串+数字拼接 ===");

    class MixWrap {
        constructor(data) {
            this.data = data;
        }

        valueOf() {
            return this.data; // 重写返回字符串（触发拼接而非加法）
        }
    }

    const strWrap = new MixWrap("age: ");
    const num = 25;
    const concatResult = strWrap + num; // 字符串+数字 → 拼接："age: 25"
    const isPassed = concatResult === "age: 25" && typeof concatResult === "string";

    console.log("MixWrap 实例（\"age: \"）:", strWrap);
    console.log("加法表达式: strWrap + 25");
    console.log("结果:", concatResult);
    console.log("是否为预期拼接字符串:", isPassed);
    console.log("测试点 126 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 127：Intl.DisplayNames 实例的 valueOf() 与自身严格相等
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn127_testIntlDisplayNamesValueOfStrictEqual() {
    console.log("=== 测试点 127：Intl.DisplayNames 实例 valueOf() 与自身严格相等 ===");
    const displayNames = new Intl.DisplayNames("de-DE", { type: "language" }); // 德语语言名称
    const valueOfResult = displayNames.valueOf();
    const isPassed = valueOfResult === displayNames;

    console.log("Intl.DisplayNames 实例:", displayNames);
    console.log("valueOf() 返回值:", valueOfResult);
    console.log("是否与自身严格相等:", isPassed);
    console.log("测试点 127 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 128：重写 valueOf() 返回函数，对象使用 typeof 检测仍为 "object"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn128_testValueOfReturnFunctionTypeof() {
    console.log("=== 测试点 128：valueOf() 返回函数时 typeof 检测结果 ===");
    const funcObj = {
        valueOf() {
            return () => "test"; // 重写返回函数
        }
    };
    const typeResult = typeof funcObj; // typeof 检测对象本身，与 valueOf() 无关
    const isPassed = typeResult === "object";

    console.log("测试对象:", funcObj);
    console.log("typeof funcObj 结果:", typeResult);
    console.log("是否为 \"object\":", isPassed);
    console.log("测试点 128 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 130：重写 valueOf() 后，对象参与比较运算（>=）返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn130_testCustomValueOfForGreaterOrEqual() {
    console.log("=== 测试点 130：重写 valueOf() 支持 >= 比较运算 ===");

    class CompareWrap {
        constructor(num) {
            this.num = num;
        }

        valueOf() {
            return this.num; // 重写返回数值用于比较
        }
    }

    const wrap1 = new CompareWrap(30);
    const wrap2 = new CompareWrap(25);
    const compareResult1 = wrap1 >= wrap2; // 30 >= 25 → true
    const compareResult2 = wrap2 >= wrap1; // 25 >= 30 → false
    const isPassed = compareResult1 === true && compareResult2 === false;

    console.log("CompareWrap 实例1（30）:", wrap1);
    console.log("CompareWrap 实例2（25）:", wrap2);
    console.log("wrap1 >= wrap2 结果:", compareResult1);
    console.log("wrap2 >= wrap1 结果:", compareResult2);
    console.log("是否符合比较规则:", isPassed);
    console.log("测试点 130 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 131：重写 valueOf() 返回字符串 "1e3"（科学计数法），强制数字转换为 1000
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn131_testValueOfReturnSciNotationString() {
    console.log("=== 测试点 131：valueOf() 返回 \"1e3\" 时强制数字转换 ===");
    const sciStrObj = {
        valueOf() {
            return "1e3"; // 重写返回科学计数法字符串
        }
    };
    const forcedNumber = +sciStrObj; // 支持科学计数法转换：1e3 = 1000
    const isPassed = forcedNumber === 1000 && typeof forcedNumber === "number";

    console.log("测试对象:", sciStrObj);
    console.log("valueOf() 返回字符串 \"1e3\":", sciStrObj.valueOf());
    console.log("强制转换为数字结果:", forcedNumber);
    console.log("是否转为 1000:", isPassed);
    console.log("测试点 131 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}
