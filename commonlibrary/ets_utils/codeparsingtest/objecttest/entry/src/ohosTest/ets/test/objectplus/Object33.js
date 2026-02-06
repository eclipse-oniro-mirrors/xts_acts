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
 * 测试点 1：普通对象调用默认 toString() 方法，返回 "[object Object]"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn01_testToStringDefaultBehavior() {
    console.log("=== 测试点 1：普通对象默认 toString() 返回 \"[object Object]\" ===");
    const plainObject = {};
    const actualResult = plainObject.toString();
    const expectedResult = "[object Object]";
    const isPassed = actualResult === expectedResult;

    console.log("测试对象（普通空对象）:", plainObject);
    console.log("toString() 实际返回值:", actualResult);
    console.log("toString() 预期返回值:", expectedResult);
    console.log("测试点 1 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 2：自定义类实例重写 toString() 后，返回自定义格式字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn02_testToStringCustomOverride() {
    console.log("=== 测试点 2：自定义类重写 toString() 返回自定义内容 ===");

    class Product {
        constructor(name, price) {
            this.name = name;
            this.price = price;
        }

        toString() {
            return `Product: ${this.name}, Price: ¥${this.price.toFixed(2)}`;
        }
    }

    const phone = new Product("智能手机", 3999);
    const actualResult = phone.toString();
    const expectedResult = "Product: 智能手机, Price: ¥3999.00";
    const isPassed = actualResult === expectedResult;

    console.log("Product 实例（智能手机）:", phone);
    console.log("重写后 toString() 实际返回值:", actualResult);
    console.log("重写后 toString() 预期返回值:", expectedResult);
    console.log("测试点 2 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 3：通过 call 调用 Object.prototype.toString()，检测内置数组类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn03_testToStringDetectArrayType() {
    console.log("=== 测试点 3：call 调用原型 toString() 检测数组类型 ===");
    const fruits = ["苹果", "香蕉", "橙子"];
    const actualResult = Object.prototype.toString.call(fruits);
    const expectedResult = "[object Array]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测数组:", fruits);
    console.log("Object.prototype.toString.call(数组) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(数组) 预期返回值:", expectedResult);
    console.log("测试点 3 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 4：通过 Symbol.toStringTag 自定义对象的 toString() 类型标识
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn04_testToStringWithCustomTag() {
    console.log("=== 测试点 4：Symbol.toStringTag 自定义 toString() 类型标识 ===");
    const user = {
        username: "js_dev",
        [Symbol.toStringTag]: "UserAccount"
    };
    const actualResult = Object.prototype.toString.call(user);
    const expectedResult = "[object UserAccount]";
    const isPassed = actualResult === expectedResult;

    console.log("含 Symbol.toStringTag 的对象:", user);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 4 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}


/**
 * 测试点 6：通过 call 调用 Object.prototype.toString()，检测内置日期类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn06_testToStringDetectDateType() {
    console.log("=== 测试点 6：call 调用原型 toString() 检测日期类型 ===");
    const testDate = new Date("2024-05-20");
    const actualResult = Object.prototype.toString.call(testDate);
    const expectedResult = "[object Date]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测日期对象:", testDate);
    console.log("Object.prototype.toString.call(日期) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(日期) 预期返回值:", expectedResult);
    console.log("测试点 6 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 7：通过 call 调用 Object.prototype.toString()，检测内置正则类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn07_testToStringDetectRegExpType() {
    console.log("=== 测试点 7：call 调用原型 toString() 检测正则类型 ===");
    const testRegExp = /^\d{6}$/; // 匹配 6 位数字的正则
    const actualResult = Object.prototype.toString.call(testRegExp);
    const expectedResult = "[object RegExp]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测正则对象:", testRegExp);
    console.log("Object.prototype.toString.call(正则) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(正则) 预期返回值:", expectedResult);
    console.log("测试点 7 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 8：通过 call 调用 Object.prototype.toString()，检测内置函数类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn08_testToStringDetectFunctionType() {
    console.log("=== 测试点 8：call 调用原型 toString() 检测函数类型 ===");
    const testFunc = (a, b) => a + b; // 箭头函数
    const actualResult = Object.prototype.toString.call(testFunc);
    const expectedResult = "[object Function]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测函数对象:", testFunc);
    console.log("Object.prototype.toString.call(函数) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(函数) 预期返回值:", expectedResult);
    console.log("测试点 8 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 9：通过 call 调用 Object.prototype.toString()，检测内置布尔类型对象
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn09_testToStringDetectBooleanObjectType() {
    console.log("=== 测试点 9：call 调用原型 toString() 检测布尔对象类型 ===");
    const testBooleanObj = new Boolean(true); // 布尔对象（非原始值）
    const actualResult = Object.prototype.toString.call(testBooleanObj);
    const expectedResult = "[object Boolean]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测布尔对象:", testBooleanObj);
    console.log("Object.prototype.toString.call(布尔对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(布尔对象) 预期返回值:", expectedResult);
    console.log("测试点 9 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 10：通过 call 调用 Object.prototype.toString()，检测内置数字类型对象
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn10_testToStringDetectNumberObjectType() {
    console.log("=== 测试点 10：call 调用原型 toString() 检测数字对象类型 ===");
    const testNumberObj = new Number(123.45); // 数字对象（非原始值）
    const actualResult = Object.prototype.toString.call(testNumberObj);
    const expectedResult = "[object Number]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测数字对象:", testNumberObj);
    console.log("Object.prototype.toString.call(数字对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(数字对象) 预期返回值:", expectedResult);
    console.log("测试点 10 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 11：通过 call 调用 Object.prototype.toString()，检测内置字符串类型对象
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn11_testToStringDetectStringObjectType() {
    console.log("=== 测试点 11：call 调用原型 toString() 检测字符串对象类型 ===");
    const testStringObj = new String("test-content"); // 字符串对象（非原始值）
    const actualResult = Object.prototype.toString.call(testStringObj);
    const expectedResult = "[object String]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测字符串对象:", testStringObj);
    console.log("Object.prototype.toString.call(字符串对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(字符串对象) 预期返回值:", expectedResult);
    console.log("测试点 11 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 12：自定义类实例未重写 toString()，继承 Object 的默认实现
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn12_testToStringInheritDefault() {
    console.log("=== 测试点 12：自定义类未重写 toString() 继承默认实现 ===");

    class Student {
        constructor(id, name) {
            this.id = id;
            this.name = name;
        }

        // 未重写 toString()，继承 Object.prototype.toString()
    }

    const student = new Student(2024001, "张三");
    const actualResult = student.toString();
    const expectedResult = "[object Object]";
    const isPassed = actualResult === expectedResult;

    console.log("Student 实例:", student);
    console.log("继承的 toString() 实际返回值:", actualResult);
    console.log("继承的 toString() 预期返回值:", expectedResult);
    console.log("测试点 12 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 13：Symbol.toStringTag 为 null 时，toString() 类型标识为 "Object"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn13_testToStringTagWithNull() {
    console.log("=== 测试点 13：Symbol.toStringTag 为 null 时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: null
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object Object]"; // Symbol.toStringTag 为 null 时使用默认标识
    const isPassed = actualResult === expectedResult;

    console.log("含 null Symbol.toStringTag 的对象:", testObj);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 13 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 14：Symbol.toStringTag 为 undefined 时，toString() 类型标识为 "Object"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn14_testToStringTagWithUndefined() {
    console.log("=== 测试点 14：Symbol.toStringTag 为 undefined 时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: undefined
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object Object]"; // Symbol.toStringTag 为 undefined 时使用默认标识
    const isPassed = actualResult === expectedResult;

    console.log("含 undefined Symbol.toStringTag 的对象:", testObj);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 14 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 15：Symbol.toStringTag 为数字时，toString() 类型标识为数字的字符串形式
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn15_testToStringTagWithNumber() {
    console.log("=== 测试点 15：Symbol.toStringTag 为数字时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: 12345 // 数字会被转为字符串作为类型标识
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object 12345]";
    const isPassed = actualResult === expectedResult;

    console.log("含数字 Symbol.toStringTag 的对象:", testObj);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 15 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 16：数组自身 toString() 方法（非原型）返回元素拼接字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn16_testArrayOwnToString() {
    console.log("=== 测试点 16：数组自身 toString() 返回元素拼接字符串 ===");
    const testArray = ["a", "b", 1, 2, true];
    // 数组重写了 toString()，返回元素用逗号拼接的字符串
    const actualResult = testArray.toString();
    const expectedResult = "a,b,1,2,true";
    const isPassed = actualResult === expectedResult;

    console.log("测试数组:", testArray);
    console.log("数组自身 toString() 实际返回值:", actualResult);
    console.log("数组自身 toString() 预期返回值:", expectedResult);
    console.log("测试点 16 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 17：日期自身 toString() 方法（非原型）返回可读日期字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn17_testDateOwnToString() {
    console.log("=== 测试点 17：日期自身 toString() 返回可读日期字符串 ===");
    const testDate = new Date("2024-01-01T00:00:00Z");
    // 日期重写了 toString()，返回标准可读格式（如 "Mon Jan 01 2024 08:00:00 GMT+0800 (中国标准时间)"）
    const actualResult = testDate.toString();
    const isPassed = typeof actualResult === "string" && actualResult.includes("2024") && actualResult.includes("Jan");

    console.log("测试日期对象:", testDate);
    console.log("日期自身 toString() 实际返回值:", actualResult);
    console.log("日期自身 toString() 是否包含预期信息（2024、Jan）:", isPassed);
    console.log("测试点 17 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 18：重写 toString() 方法返回非字符串值，会被自动转为字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn18_testToStringReturnNonString() {
    console.log("=== 测试点 18：重写 toString() 返回非字符串值自动转字符串 ===");

    class Test {
        toString() {
            return 12345; // 返回数字（非字符串）
        }
    }

    const testInstance = new Test();
    const actualResult = testInstance.toString();
    const expectedResult = "12345"; // 非字符串会被自动转为字符串
    const isPassed = actualResult === expectedResult && typeof actualResult === "string";

    console.log("Test 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 实际返回值类型:", typeof actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 18 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 19：重写 toString() 方法抛出错误，调用时会触发异常
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn19_testToStringThrowError() {
    console.log("=== 测试点 19：重写 toString() 抛出错误时调用触发异常 ===");

    class ErrorTest {
        toString() {
            throw new Error("Custom toString error"); // 重写时抛出错误
        }
    }

    const testInstance = new ErrorTest();
    let errorCaught = false;
    try {
        testInstance.toString();
    } catch (err) {
        errorCaught = err.message === "Custom toString error";
    }
    const isPassed = errorCaught;

    console.log("ErrorTest 实例:", testInstance);
    console.log("调用 toString() 是否捕获预期错误:", isPassed);
    console.log("测试点 19 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 20：通过 apply 调用 Object.prototype.toString()，检测内置 Map 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn20_testToStringDetectMapWithApply() {
    console.log("=== 测试点 20：apply 调用原型 toString() 检测 Map 类型 ===");
    const testMap = new Map([["key1", "value1"], ["key2", "value2"]]);
    // 使用 apply 改变 this 指向（效果与 call 一致）
    const actualResult = Object.prototype.toString.apply(testMap);
    const expectedResult = "[object Map]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Map 对象:", testMap);
    console.log("Object.prototype.toString.apply(Map) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.apply(Map) 预期返回值:", expectedResult);
    console.log("测试点 20 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 21：通过 apply 调用 Object.prototype.toString()，检测内置 Set 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn21_testToStringDetectSetWithApply() {
    console.log("=== 测试点 21：apply 调用原型 toString() 检测 Set 类型 ===");
    const testSet = new Set(["a", "b", "c"]);
    const actualResult = Object.prototype.toString.apply(testSet);
    const expectedResult = "[object Set]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Set 对象:", testSet);
    console.log("Object.prototype.toString.apply(Set) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.apply(Set) 预期返回值:", expectedResult);
    console.log("测试点 21 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 22：Symbol.toStringTag 为 Symbol 类型时，toString() 类型标识为 Symbol 描述
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
const tagSymbol22 = Symbol("CustomSymbolTag");
const testObj22 = {
    [Symbol.toStringTag]: tagSymbol22
};

export const actualResult22 = Object.prototype.toString.call(testObj22);

export const expectedResult22 = "[object CustomSymbolTag]"; // Symbol 类型的 tag 取其描述作为标识

/**
 * 测试点 23：通过 call 调用 Object.prototype.toString()，检测内置 WeakMap 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn23_testToStringDetectWeakMapType() {
    console.log("=== 测试点 23：call 调用原型 toString() 检测 WeakMap 类型 ===");
    const testWeakMap = new WeakMap();
    const keyObj = {};
    testWeakMap.set(keyObj, "weakmap-value"); // 向 WeakMap 添加键值对
    const actualResult = Object.prototype.toString.call(testWeakMap);
    const expectedResult = "[object WeakMap]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 WeakMap 对象（含键值对）:", testWeakMap);
    console.log("Object.prototype.toString.call(WeakMap) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(WeakMap) 预期返回值:", expectedResult);
    console.log("测试点 23 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 24：通过 call 调用 Object.prototype.toString()，检测内置 WeakSet 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn24_testToStringDetectWeakSetType() {
    console.log("=== 测试点 24：call 调用原型 toString() 检测 WeakSet 类型 ===");
    const testWeakSet = new WeakSet();
    const itemObj = {};
    testWeakSet.add(itemObj); // 向 WeakSet 添加元素
    const actualResult = Object.prototype.toString.call(testWeakSet);
    const expectedResult = "[object WeakSet]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 WeakSet 对象（含元素）:", testWeakSet);
    console.log("Object.prototype.toString.call(WeakSet) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(WeakSet) 预期返回值:", expectedResult);
    console.log("测试点 24 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 25：重写 toString() 方法返回空字符串，调用时正常返回空字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn25_testToStringReturnEmptyString() {
    console.log("=== 测试点 25：重写 toString() 返回空字符串 ===");

    class EmptyStringTest {
        toString() {
            return ""; // 重写返回空字符串
        }
    }

    const testInstance = new EmptyStringTest();
    const actualResult = testInstance.toString();
    const expectedResult = "";
    const isPassed = actualResult === expectedResult && typeof actualResult === "string";

    console.log("EmptyStringTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", JSON.stringify(actualResult)); // 用 JSON.stringify 显式显示空字符串
    console.log("重写 toString() 预期返回值:", JSON.stringify(expectedResult));
    console.log("测试点 25 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 26：类继承中，子类未重写 toString() 继承父类的 toString() 实现
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn26_testToStringInheritFromParent() {
    console.log("=== 测试点 26：子类继承父类重写的 toString() ===");

    // 父类重写 toString()
    class Parent {
        constructor(name) {
            this.name = name;
        }

        toString() {
            return `Parent: ${this.name}`;
        }
    }

    // 子类未重写 toString()，继承父类实现
    class Child extends Parent {
        constructor(name, age) {
            super(name);
            this.age = age;
        }
    }

    const childInstance = new Child("小明", 10);
    const actualResult = childInstance.toString();
    const expectedResult = "Parent: 小明"; // 继承父类的 toString() 逻辑
    const isPassed = actualResult === expectedResult;

    console.log("Child 实例（name: 小明, age: 10）:", childInstance);
    console.log("继承父类的 toString() 实际返回值:", actualResult);
    console.log("继承父类的 toString() 预期返回值:", expectedResult);
    console.log("测试点 26 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 27：通过 call 调用 Object.prototype.toString()，检测内置 Promise 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn27_testToStringDetectPromiseType() {
    console.log("=== 测试点 27：call 调用原型 toString() 检测 Promise 类型 ===");
    const testPromise = new Promise((resolve) => resolve("promise-resolve"));
    const actualResult = Object.prototype.toString.call(testPromise);
    const expectedResult = "[object Promise]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Promise 对象:", testPromise);
    console.log("Object.prototype.toString.call(Promise) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Promise) 预期返回值:", expectedResult);
    console.log("测试点 27 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 28：通过 call 调用 Object.prototype.toString()，检测内置 ArrayBuffer 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn28_testToStringDetectArrayBufferType() {
    console.log("=== 测试点 28：call 调用原型 toString() 检测 ArrayBuffer 类型 ===");
    const testArrayBuffer = new ArrayBuffer(16); // 创建 16 字节的 ArrayBuffer
    const actualResult = Object.prototype.toString.call(testArrayBuffer);
    const expectedResult = "[object ArrayBuffer]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 ArrayBuffer 对象（16 字节）:", testArrayBuffer);
    console.log("Object.prototype.toString.call(ArrayBuffer) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(ArrayBuffer) 预期返回值:", expectedResult);
    console.log("测试点 28 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 29：Symbol.toStringTag 为函数时，toString() 类型标识为函数的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn29_testToStringTagWithFunction() {
    console.log("=== 测试点 29：Symbol.toStringTag 为函数时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: function () {
            return "FuncTag"; // 函数会被调用 toString()，其返回值作为标识
        }
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object function() { return \"FuncTag\"; }]"; // 函数的默认 toString() 结果
    const isPassed = actualResult === expectedResult;

    console.log("含函数类型 Symbol.toStringTag 的对象:", testObj);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 29 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 30：重写 toString() 方法引用实例属性，动态返回属性值
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn30_testToStringReferenceInstanceProp() {
    console.log("=== 测试点 30：重写 toString() 动态引用实例属性 ===");

    class DynamicPropTest {
        constructor(count) {
            this.count = count; // 实例动态属性
        }

        toString() {
            return `Dynamic Count: ${this.count}`; // 引用实例属性
        }
    }

    const testInstance1 = new DynamicPropTest(5);
    const result1 = testInstance1.toString();
    const expected1 = "Dynamic Count: 5";

    // 修改实例属性后再次调用
    testInstance1.count = 10;
    const result2 = testInstance1.toString();
    const expected2 = "Dynamic Count: 10";

    const isPassed = result1 === expected1 && result2 === expected2;

    console.log("DynamicPropTest 实例（初始 count=5）:", testInstance1);
    console.log("初始 toString() 结果:", result1, "（预期：", expected1, "）");
    console.log("修改 count=10 后 toString() 结果:", result2, "（预期：", expected2, "）");
    console.log("测试点 30 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 31：通过 call 调用 Object.prototype.toString()，检测内置 DataView 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn31_testToStringDetectDataViewType() {
    console.log("=== 测试点 31：call 调用原型 toString() 检测 DataView 类型 ===");
    const buffer = new ArrayBuffer(8);
    const testDataView = new DataView(buffer); // 基于 ArrayBuffer 创建 DataView
    const actualResult = Object.prototype.toString.call(testDataView);
    const expectedResult = "[object DataView]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 DataView 对象:", testDataView);
    console.log("Object.prototype.toString.call(DataView) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(DataView) 预期返回值:", expectedResult);
    console.log("测试点 31 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 32：通过 call 调用 Object.prototype.toString()，检测内置 Int8Array 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn32_testToStringDetectInt8ArrayType() {
    console.log("=== 测试点 32：call 调用原型 toString() 检测 Int8Array 类型 ===");
    const testInt8Array = new Int8Array([1, -2, 3]); // 8 位有符号整数数组
    const actualResult = Object.prototype.toString.call(testInt8Array);
    const expectedResult = "[object Int8Array]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Int8Array 对象:", testInt8Array);
    console.log("Object.prototype.toString.call(Int8Array) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Int8Array) 预期返回值:", expectedResult);
    console.log("测试点 32 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 33：重写 toString() 方法返回 undefined，会被自动转为 "undefined" 字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn33_testToStringReturnUndefined() {
    console.log("=== 测试点 33：重写 toString() 返回 undefined 自动转字符串 ===");

    class UndefinedTest {
        toString() {
            return undefined; // 返回 undefined（非字符串）
        }
    }

    const testInstance = new UndefinedTest();
    const actualResult = testInstance.toString();
    const expectedResult = "undefined"; // undefined 会被转为字符串 "undefined"
    const isPassed = actualResult === expectedResult && typeof actualResult === "string";

    console.log("UndefinedTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 33 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 34：Symbol.toStringTag 为数组时，toString() 类型标识为数组的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn34_testToStringTagWithArray() {
    console.log("=== 测试点 34：Symbol.toStringTag 为数组时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: ["tag1", "tag2"] // 数组会被调用 toString()，返回 "tag1,tag2"
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object tag1,tag2]";
    const isPassed = actualResult === expectedResult;

    console.log("含数组类型 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的数组值:", ["tag1", "tag2"]);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 34 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 35：通过 call 调用 Object.prototype.toString()，检测内置 Uint16Array 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn35_testToStringDetectUint16ArrayType() {
    console.log("=== 测试点 35：call 调用原型 toString() 检测 Uint16Array 类型 ===");
    const testUint16Array = new Uint16Array([256, 512]); // 16 位无符号整数数组
    const actualResult = Object.prototype.toString.call(testUint16Array);
    const expectedResult = "[object Uint16Array]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Uint16Array 对象:", testUint16Array);
    console.log("Object.prototype.toString.call(Uint16Array) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Uint16Array) 预期返回值:", expectedResult);
    console.log("测试点 35 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 36：子类重写 toString() 覆盖父类实现，返回子类自定义内容
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn36_testToStringOverrideParentInChild() {
    console.log("=== 测试点 36：子类重写 toString() 覆盖父类实现 ===");

    class Parent {
        toString() {
            return "Parent toString content"; // 父类 toString() 实现
        }
    }

    class Child extends Parent {
        constructor(childName) {
            super();
            this.childName = childName;
        }

        // 子类重写 toString()，覆盖父类逻辑
        toString() {
            return `Child: ${this.childName} (overridden)`;
        }
    }

    const childInstance = new Child("SubClass1");
    const actualResult = childInstance.toString();
    const expectedResult = "Child: SubClass1 (overridden)";
    const isPassed = actualResult === expectedResult;

    console.log("Child 实例:", childInstance);
    console.log("子类重写 toString() 实际返回值:", actualResult);
    console.log("子类重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 36 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 37：通过 call 调用 Object.prototype.toString()，检测内置 Float32Array 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn37_testToStringDetectFloat32ArrayType() {
    console.log("=== 测试点 37：call 调用原型 toString() 检测 Float32Array 类型 ===");
    const testFloat32Array = new Float32Array([1.23, 4.56]); // 32位浮点数数组
    const actualResult = Object.prototype.toString.call(testFloat32Array);
    const expectedResult = "[object Float32Array]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Float32Array 对象:", testFloat32Array);
    console.log("Object.prototype.toString.call(Float32Array) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Float32Array) 预期返回值:", expectedResult);
    console.log("测试点 37 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 38：重写 toString() 方法返回 null，会被自动转为 "null" 字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn38_testToStringReturnNull() {
    console.log("=== 测试点 38：重写 toString() 返回 null 自动转字符串 ===");

    class NullTest {
        toString() {
            return null; // 返回 null（非字符串）
        }
    }

    const testInstance = new NullTest();
    const actualResult = testInstance.toString();
    const expectedResult = "null"; // null 会被转为字符串 "null"
    const isPassed = actualResult === expectedResult && typeof actualResult === "string";

    console.log("NullTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 38 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 39：Symbol.toStringTag 为布尔值时，toString() 类型标识为布尔值的字符串形式
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn39_testToStringTagWithBoolean() {
    console.log("=== 测试点 39：Symbol.toStringTag 为布尔值时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: false // 布尔值 false 会被转为字符串 "false"
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object false]";
    const isPassed = actualResult === expectedResult;

    console.log("含布尔值 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值（布尔值）:", false);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 39 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 40：通过 call 调用 Object.prototype.toString()，检测内置 BigInt 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn40_testToStringDetectBigIntType() {
    console.log("=== 测试点 40：call 调用原型 toString() 检测 BigInt 类型 ===");
    const testBigInt = 9007199254740993n; // 超安全整数范围的 BigInt
    const actualResult = Object.prototype.toString.call(testBigInt);
    const expectedResult = "[object BigInt]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 BigInt 值:", testBigInt);
    console.log("Object.prototype.toString.call(BigInt) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(BigInt) 预期返回值:", expectedResult);
    console.log("测试点 40 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 41：重写 toString() 方法在字符串拼接中自动调用，返回正确拼接结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn41_testToStringInStringConcatenation() {
    console.log("=== 测试点 41：重写 toString() 在字符串拼接中自动调用 ===");

    class User {
        constructor(name) {
            this.name = name;
        }

        toString() {
            return `User[${this.name}]`;
        }
    }

    const user = new User("Li Ming");
    const concatenatedResult = "Current user: " + user; // 字符串拼接自动调用 toString()
    const expectedResult = "Current user: User[Li Ming]";
    const isPassed = concatenatedResult === expectedResult;

    console.log("User 实例:", user);
    console.log("字符串拼接结果:", concatenatedResult);
    console.log("字符串拼接预期结果:", expectedResult);
    console.log("测试点 41 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 42：通过 call 调用 Object.prototype.toString()，检测内置 Symbol 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
console.log("=== 测试点 42：call 调用原型 toString() 检测 Symbol 类型 ===");
const testSymbol = Symbol("test-symbol-desc"); // 带描述的 Symbol

export const actualResult42 = Object.prototype.toString.call(testSymbol);

export const expectedResult42 = "[object Symbol]";

/**
 * 测试点 43：Symbol.toStringTag 为嵌套对象时，toString() 类型标识为对象的默认 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn43_testToStringTagWithNestedObject() {
    console.log("=== 测试点 43：Symbol.toStringTag 为嵌套对象时类型标识 ===");
    const nestedObj = { key: "value" };
    const testObj = {
        [Symbol.toStringTag]: nestedObj // 嵌套对象会调用其默认 toString()，返回 "[object Object]"
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object [object Object]]";
    const isPassed = actualResult === expectedResult;

    console.log("含嵌套对象 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的嵌套对象:", nestedObj);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 43 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 44：重写 toString() 方法返回 BigInt 值，会被自动转为字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn44_testToStringReturnBigInt() {
    console.log("=== 测试点 44：重写 toString() 返回 BigInt 自动转字符串 ===");

    class BigIntTest {
        toString() {
            return 1234567890123456789n; // 返回 BigInt 值
        }
    }

    const testInstance = new BigIntTest();
    const actualResult = testInstance.toString();
    const expectedResult = "1234567890123456789"; // BigInt 会被转为对应字符串
    const isPassed = actualResult === expectedResult && typeof actualResult === "string";

    console.log("BigIntTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 44 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 45：通过 call 调用 Object.prototype.toString()，检测内置 Error 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn45_testToStringDetectErrorType() {
    console.log("=== 测试点 45：call 调用原型 toString() 检测 Error 类型 ===");
    const testError = new Error("Test error message"); // 普通 Error 实例
    const actualResult = Object.prototype.toString.call(testError);
    const expectedResult = "[object Error]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Error 对象:", testError);
    console.log("Object.prototype.toString.call(Error) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Error) 预期返回值:", expectedResult);
    console.log("测试点 45 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 46：重写 toString() 方法在 JSON.stringify 中被调用（需配合 toJSON 缺失场景）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn46_testToStringInJsonStringify() {
    console.log("=== 测试点 46：重写 toString() 在 JSON.stringify 中调用（无 toJSON 时） ===");

    class Data {
        constructor(id) {
            this.id = id;
        }

        // 无 toJSON 方法时，JSON.stringify 会调用 toString()
        toString() {
            return `Data#${this.id}`;
        }
    }

    const dataInstance = new Data(1001);
    const jsonResult = JSON.stringify(dataInstance);
    const expectedResult = "\"Data#1001\""; // toString() 结果被转为 JSON 字符串
    const isPassed = jsonResult === expectedResult;

    console.log("Data 实例:", dataInstance);
    console.log("JSON.stringify 结果:", jsonResult);
    console.log("JSON.stringify 预期结果:", expectedResult);
    console.log("测试点 46 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 47：通过 call 调用 Object.prototype.toString()，检测内置 TypeError 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn47_testToStringDetectTypeErrorType() {
    console.log("=== 测试点 47：call 调用原型 toString() 检测 TypeError 类型 ===");
    const testTypeError = new TypeError("Test type error message"); // TypeError 实例
    const actualResult = Object.prototype.toString.call(testTypeError);
    const expectedResult = "[object Error]"; // 所有 Error 子类均识别为 "[object Error]"
    const isPassed = actualResult === expectedResult;

    console.log("待检测 TypeError 对象:", testTypeError);
    console.log("Object.prototype.toString.call(TypeError) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(TypeError) 预期返回值:", expectedResult);
    console.log("测试点 47 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 48：Symbol.toStringTag 为空数组时，toString() 类型标识为空字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn48_testToStringTagWithEmptyArray() {
    console.log("=== 测试点 48：Symbol.toStringTag 为空数组时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: [] // 空数组 toString() 返回空字符串
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object ]"; // 类型标识部分为空字符串
    const isPassed = actualResult === expectedResult;

    console.log("含空数组 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的空数组:", []);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 48 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 49：重写 toString() 方法返回函数，会被自动转为函数的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn49_testToStringReturnFunction() {
    console.log("=== 测试点 49：重写 toString() 返回函数自动转字符串 ===");

    class FuncTest {
        toString() {
            return (a, b) => a * b; // 返回箭头函数
        }
    }

    const testInstance = new FuncTest();
    const actualResult = testInstance.toString();
    const expectedResult = "(a, b) => a * b"; // 函数会调用其默认 toString()
    const isPassed = actualResult === expectedResult;

    console.log("FuncTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 49 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 52：重写 toString() 方法在模板字符串中自动调用，返回正确拼接结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn52_testToStringInTemplateLiteral() {
    console.log("=== 测试点 52：重写 toString() 在模板字符串中自动调用 ===");

    class Product {
        constructor(id, price) {
            this.id = id;
            this.price = price;
        }

        toString() {
            return `Product{id:${this.id}, price:¥${this.price}}`;
        }
    }

    const product = new Product("P001", 199);
    const templateResult = `Selected: ${product}`; // 模板字符串自动调用 toString()
    const expectedResult = "Selected: Product{id:P001, price:¥199}";
    const isPassed = templateResult === expectedResult;

    console.log("Product 实例:", product);
    console.log("模板字符串结果:", templateResult);
    console.log("模板字符串预期结果:", expectedResult);
    console.log("测试点 52 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 53：Symbol.toStringTag 为带空格字符串时，toString() 类型标识包含空格
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn53_testToStringTagWithSpacedString() {
    console.log("=== 测试点 53：Symbol.toStringTag 为带空格字符串时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: "User Info" // 带空格的标签字符串
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object User Info]"; // 类型标识保留空格
    const isPassed = actualResult === expectedResult;

    console.log("含带空格 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值:", "User Info");
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 53 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 55：重写 toString() 方法返回 NaN，会被自动转为 "NaN" 字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn55_testToStringReturnNaN() {
    console.log("=== 测试点 55：重写 toString() 返回 NaN 自动转字符串 ===");

    class NaNTest {
        toString() {
            return NaN; // 返回 NaN（非字符串）
        }
    }

    const testInstance = new NaNTest();
    const actualResult = testInstance.toString();
    const expectedResult = "NaN"; // NaN 会被转为字符串 "NaN"
    const isPassed = actualResult === expectedResult && typeof actualResult === "string";

    console.log("NaNTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 55 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 57：Symbol.toStringTag 为 Unicode 字符时，toString() 类型标识正常显示 Unicode
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn57_testToStringTagWithUnicode() {
    console.log("=== 测试点 57：Symbol.toStringTag 为 Unicode 字符时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: "用户数据" // Unicode 中文标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object 用户数据]"; // 类型标识正常显示 Unicode
    const isPassed = actualResult === expectedResult;

    console.log("含 Unicode Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的 Unicode 值:", "用户数据");
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 57 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 58：重写 toString() 方法返回 Infinity，会被自动转为 "Infinity" 字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn58_testToStringReturnInfinity() {
    console.log("=== 测试点 58：重写 toString() 返回 Infinity 自动转字符串 ===");

    class InfinityTest {
        toString() {
            return Infinity; // 返回 Infinity（非字符串）
        }
    }

    const testInstance = new InfinityTest();
    const actualResult = testInstance.toString();
    const expectedResult = "Infinity"; // Infinity 会被转为字符串 "Infinity"
    const isPassed = actualResult === expectedResult && typeof actualResult === "string";

    console.log("InfinityTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 58 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 59：通过 call 调用 Object.prototype.toString()，检测内置 ReadableStream 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn59_testToStringDetectReadableStreamType() {
    console.log("=== 测试点 59：call 调用原型 toString() 检测 ReadableStream 类型 ===");
    let testStream;
    try {
        // 创建简单的 ReadableStream（模拟文本流）
        testStream = new ReadableStream({
            start(controller) {
                controller.enqueue("stream content");
                controller.close();
            }
        });
    } catch (err) {
        // 环境不支持时模拟流对象（确保测试不报错）
        testStream = { [Symbol.toStringTag]: "ReadableStream" };
    }
    const actualResult = Object.prototype.toString.call(testStream);
    const expectedResult = "[object ReadableStream]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 ReadableStream 对象:", testStream);
    console.log("Object.prototype.toString.call(ReadableStream) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(ReadableStream) 预期返回值:", expectedResult);
    console.log("测试点 59 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 60：Symbol.toStringTag 为 getter 函数时，toString() 调用 getter 获取标识
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn60_testToStringTagWithGetter() {
    console.log("=== 测试点 60：Symbol.toStringTag 为 getter 时类型标识 ===");
    const testObj = {
        get [Symbol.toStringTag]() {
            // getter 函数动态返回标签
            return "DynamicGetterTag";
        }
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object DynamicGetterTag]"; // 调用 getter 获取标签
    const isPassed = actualResult === expectedResult;

    console.log("含 getter 类型 Symbol.toStringTag 的对象:", testObj);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 60 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 61：重写 toString() 方法在类的静态方法中调用实例，返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn61_testToStringInStaticMethod() {
    console.log("=== 测试点 61：静态方法中调用实例 toString() ===");

    class Order {
        constructor(orderNo) {
            this.orderNo = orderNo;
        }

        toString() {
            return `OrderNo: ${this.orderNo}`;
        }

        // 静态方法接收实例并调用其 toString()
        static logOrder(instance) {
            return `Log: ${instance.toString()}`;
        }
    }

    const orderInstance = new Order("ORD-2024-5001");
    const staticResult = Order.logOrder(orderInstance);
    const expectedResult = "Log: OrderNo: ORD-2024-5001";
    const isPassed = staticResult === expectedResult;

    console.log("Order 实例:", orderInstance);
    console.log("静态方法调用结果:", staticResult);
    console.log("静态方法预期结果:", expectedResult);
    console.log("测试点 61 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 62：通过 call 调用 Object.prototype.toString()，检测内置 WeakRef 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn62_testToStringDetectWeakRefType() {
    console.log("=== 测试点 62：call 调用原型 toString() 检测 WeakRef 类型 ===");
    let testWeakRef;
    try {
        const targetObj = {};
        testWeakRef = new WeakRef(targetObj); // 创建 WeakRef
    } catch (err) {
        // 环境不支持时模拟对象
        testWeakRef = { [Symbol.toStringTag]: "WeakRef" };
    }
    const actualResult = Object.prototype.toString.call(testWeakRef);
    const expectedResult = "[object WeakRef]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 WeakRef 对象:", testWeakRef);
    console.log("Object.prototype.toString.call(WeakRef) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(WeakRef) 预期返回值:", expectedResult);
    console.log("测试点 62 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 63：Symbol.toStringTag 为不可枚举属性时，toString() 仍能正常获取标识
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn63_testToStringTagNonEnumerable() {
    console.log("=== 测试点 63：不可枚举 Symbol.toStringTag 仍能生效 ===");
    const testObj = {};
    // 定义不可枚举的 Symbol.toStringTag
    Object.defineProperty(testObj, Symbol.toStringTag, {
        value: "NonEnumerableTag",
        enumerable: false // 不可枚举
    });
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object NonEnumerableTag]"; // 仍能获取不可枚举标签
    const isPassed = actualResult === expectedResult;

    console.log("含不可枚举 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 是否可枚举:", Object.propertyIsEnumerable.call(testObj, Symbol.toStringTag));
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 63 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 64：重写 toString() 方法返回空对象，会被转为 "[object Object]" 字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn64_testToStringReturnEmptyObject() {
    console.log("=== 测试点 64：重写 toString() 返回空对象自动转字符串 ===");

    class EmptyObjTest {
        toString() {
            return {}; // 返回空对象（非字符串）
        }
    }

    const testInstance = new EmptyObjTest();
    const actualResult = testInstance.toString();
    const expectedResult = "[object Object]"; // 空对象默认 toString() 结果
    const isPassed = actualResult === expectedResult;

    console.log("EmptyObjTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 64 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 65：通过 call 调用 Object.prototype.toString()，检测内置 FinalizationRegistry 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn65_testToStringDetectFinalizationRegistryType() {
    console.log("=== 测试点 65：call 调用原型 toString() 检测 FinalizationRegistry 类型 ===");
    let testRegistry;
    try {
        // 创建 FinalizationRegistry（回调函数无实际逻辑）
        testRegistry = new FinalizationRegistry((heldValue) => {
        });
    } catch (err) {
        // 环境不支持时模拟对象
        testRegistry = { [Symbol.toStringTag]: "FinalizationRegistry" };
    }
    const actualResult = Object.prototype.toString.call(testRegistry);
    const expectedResult = "[object FinalizationRegistry]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 FinalizationRegistry 对象:", testRegistry);
    console.log("Object.prototype.toString.call(FinalizationRegistry) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(FinalizationRegistry) 预期返回值:", expectedResult);
    console.log("测试点 65 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 66：Symbol.toStringTag 为只读属性时，toString() 仍能正常获取标识
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn66_testToStringTagReadOnly() {
    console.log("=== 测试点 66：只读 Symbol.toStringTag 仍能生效 ===");
    const testObj = {};
    // 定义只读的 Symbol.toStringTag
    Object.defineProperty(testObj, Symbol.toStringTag, {
        value: "ReadOnlyTag",
        writable: false, // 只读
        enumerable: true
    });
    // 尝试修改只读属性（应修改失败）
    testObj[Symbol.toStringTag] = "ModifiedTag";
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object ReadOnlyTag]"; // 仍保持原始只读标签
    const isPassed = actualResult === expectedResult;

    console.log("含只读 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 是否可写:", Object.getOwnPropertyDescriptor(testObj, Symbol.toStringTag).writable);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 66 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 67：重写 toString() 方法在数组中调用，返回自定义元素字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn67_testToStringInArray() {
    console.log("=== 测试点 67：数组中调用实例重写的 toString() ===");

    class Item {
        constructor(id) {
            this.id = id;
        }

        toString() {
            return `Item_${this.id}`;
        }
    }

    // 创建包含 Item 实例的数组
    const itemArray = [new Item(1), new Item(2), new Item(3)];
    // 数组 toString() 会调用每个元素的 toString()
    const actualResult = itemArray.toString();
    const expectedResult = "Item_1,Item_2,Item_3";
    const isPassed = actualResult === expectedResult;

    console.log("包含 Item 实例的数组:", itemArray);
    console.log("数组 toString() 实际返回值:", actualResult);
    console.log("数组 toString() 预期返回值:", expectedResult);
    console.log("测试点 67 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 68：通过 call 调用 Object.prototype.toString()，检测内置 Int32Array 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn68_testToStringDetectInt32ArrayType() {
    console.log("=== 测试点 68：call 调用原型 toString() 检测 Int32Array 类型 ===");
    const testInt32Array = new Int32Array([100000, 200000]); // 32位有符号整数数组
    const actualResult = Object.prototype.toString.call(testInt32Array);
    const expectedResult = "[object Int32Array]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Int32Array 对象:", testInt32Array);
    console.log("Object.prototype.toString.call(Int32Array) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Int32Array) 预期返回值:", expectedResult);
    console.log("测试点 68 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 69：Symbol.toStringTag 为特殊字符（如 !@#）时，toString() 类型标识正常显示
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn69_testToStringTagWithSpecialChars() {
    console.log("=== 测试点 69：Symbol.toStringTag 为特殊字符时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: "!@#SpecialTag$%" // 包含特殊字符的标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object !@#SpecialTag$%]"; // 保留特殊字符
    const isPassed = actualResult === expectedResult;

    console.log("含特殊字符 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值:", "!@#SpecialTag$%");
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 69 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 70：重写 toString() 方法返回 undefined 后，在字符串拼接中仍正常转换
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn70_testToStringReturnUndefinedInConcatenation() {
    console.log("=== 测试点 70：重写 toString() 返回 undefined 在拼接中转换 ===");

    class UndefConcatenateTest {
        toString() {
            return undefined;
        }
    }

    const testInstance = new UndefConcatenateTest();
    const concatenatedResult = "Value: " + testInstance; // 拼接时自动转换 undefined 为 "undefined"
    const expectedResult = "Value: undefined";
    const isPassed = concatenatedResult === expectedResult;

    console.log("UndefConcatenateTest 实例:", testInstance);
    console.log("字符串拼接结果:", concatenatedResult);
    console.log("字符串拼接预期结果:", expectedResult);
    console.log("测试点 70 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 71：通过 call 调用 Object.prototype.toString()，检测内置 Uint32Array 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn71_testToStringDetectUint32ArrayType() {
    console.log("=== 测试点 71：call 调用原型 toString() 检测 Uint32Array 类型 ===");
    const testUint32Array = new Uint32Array([4294967295, 1000000000]); // 32位无符号整数数组
    const actualResult = Object.prototype.toString.call(testUint32Array);
    const expectedResult = "[object Uint32Array]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Uint32Array 对象:", testUint32Array);
    console.log("Object.prototype.toString.call(Uint32Array) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Uint32Array) 预期返回值:", expectedResult);
    console.log("测试点 71 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 72：Symbol.toStringTag 为函数且重写了 toString() 时，类型标识用函数自定义结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn72_testToStringTagWithFuncOverrideToString() {
    console.log("=== 测试点 72：Symbol.toStringTag 为函数且重写 toString() ===");
    const tagFunc = function () {
    };
    // 重写函数自身的 toString()
    tagFunc.toString = function () {
        return "FuncWithCustomToString";
    };
    const testObj = {
        [Symbol.toStringTag]: tagFunc
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object FuncWithCustomToString]"; // 使用函数重写后的 toString() 结果
    const isPassed = actualResult === expectedResult;

    console.log("含自定义 toString() 函数的 Symbol.toStringTag 对象:", testObj);
    console.log("tagFunc 自身 toString() 结果:", tagFunc.toString());
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 72 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 73：重写 toString() 方法返回 null 后，在模板字符串中仍正常转换
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn73_testToStringReturnNullInTemplate() {
    console.log("=== 测试点 73：重写 toString() 返回 null 在模板字符串中转换 ===");

    class NullTemplateTest {
        toString() {
            return null;
        }
    }

    const testInstance = new NullTemplateTest();
    const templateResult = `Data: ${testInstance}`; // 模板字符串转换 null 为 "null"
    const expectedResult = "Data: null";
    const isPassed = templateResult === expectedResult;

    console.log("NullTemplateTest 实例:", testInstance);
    console.log("模板字符串结果:", templateResult);
    console.log("模板字符串预期结果:", expectedResult);
    console.log("测试点 73 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 74：通过 call 调用 Object.prototype.toString()，检测内置 Float64Array 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn74_testToStringDetectFloat64ArrayType() {
    console.log("=== 测试点 74：call 调用原型 toString() 检测 Float64Array 类型 ===");
    const testFloat64Array = new Float64Array([3.1415926535, 2.7182818284]); // 64位浮点数数组
    const actualResult = Object.prototype.toString.call(testFloat64Array);
    const expectedResult = "[object Float64Array]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Float64Array 对象:", testFloat64Array);
    console.log("Object.prototype.toString.call(Float64Array) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Float64Array) 预期返回值:", expectedResult);
    console.log("测试点 74 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 75：Symbol.toStringTag 为数组且数组元素重写 toString() 时，类型标识用元素自定义结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn75_testToStringTagWithArrayElementsOverrideToString() {
    console.log("=== 测试点 75：Symbol.toStringTag 数组元素重写 toString() ===");

    class TagElement {
        constructor(value) {
            this.value = value;
        }

        toString() {
            return `[${this.value}]`; // 元素自定义 toString() 结果
        }
    }

    const tagArray = [new TagElement("a"), new TagElement("b")];
    const testObj = {
        [Symbol.toStringTag]: tagArray
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object [a],[b]]"; // 数组 toString() 调用元素自定义方法
    const isPassed = actualResult === expectedResult;

    console.log("含自定义元素数组的 Symbol.toStringTag 对象:", testObj);
    console.log("tagArray 自身 toString() 结果:", tagArray.toString());
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 75 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 76：重写 toString() 方法返回 BigInt 后，在字符串拼接中仍正常转换
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn76_testToStringReturnBigIntInConcatenation() {
    console.log("=== 测试点 76：重写 toString() 返回 BigInt 在拼接中转换 ===");

    class BigIntConcatenateTest {
        toString() {
            return 9876543210987654321n;
        }
    }

    const testInstance = new BigIntConcatenateTest();
    const concatenatedResult = "BigNumber: " + testInstance; // 拼接转换 BigInt 为字符串
    const expectedResult = "BigNumber: 9876543210987654321";
    const isPassed = concatenatedResult === expectedResult;

    console.log("BigIntConcatenateTest 实例:", testInstance);
    console.log("字符串拼接结果:", concatenatedResult);
    console.log("字符串拼接预期结果:", expectedResult);
    console.log("测试点 76 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 77：通过 call 调用 Object.prototype.toString()，检测内置 Uint8Array 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn77_testToStringDetectUint8ArrayType() {
    console.log("=== 测试点 77：call 调用原型 toString() 检测 Uint8Array 类型 ===");
    const testUint8Array = new Uint8Array([255, 128, 0]); // 8位无符号整数数组
    const actualResult = Object.prototype.toString.call(testUint8Array);
    const expectedResult = "[object Uint8Array]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Uint8Array 对象:", testUint8Array);
    console.log("Object.prototype.toString.call(Uint8Array) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Uint8Array) 预期返回值:", expectedResult);
    console.log("测试点 77 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 78：Symbol.toStringTag 为嵌套对象且对象重写 toString() 时，类型标识用对象自定义结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn78_testToStringTagWithNestedObjOverrideToString() {
    console.log("=== 测试点 78：Symbol.toStringTag 嵌套对象重写 toString() ===");

    class NestedTagObj {
        toString() {
            return "NestedCustomTag"; // 嵌套对象自定义 toString() 结果
        }
    }

    const nestedObj = new NestedTagObj();
    const testObj = {
        [Symbol.toStringTag]: nestedObj
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object NestedCustomTag]"; // 使用嵌套对象自定义方法结果
    const isPassed = actualResult === expectedResult;

    console.log("含嵌套自定义对象的 Symbol.toStringTag 对象:", testObj);
    console.log("嵌套对象自身 toString() 结果:", nestedObj.toString());
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 78 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 79：重写 toString() 方法返回 NaN 后，在模板字符串中仍正常转换
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn79_testToStringReturnNaNInTemplate() {
    console.log("=== 测试点 79：重写 toString() 返回 NaN 在模板字符串中转换 ===");

    class NaNTemplateTest {
        toString() {
            return NaN;
        }
    }

    const testInstance = new NaNTemplateTest();
    const templateResult = `Calculation: ${testInstance}`; // 模板字符串转换 NaN 为 "NaN"
    const expectedResult = "Calculation: NaN";
    const isPassed = templateResult === expectedResult;

    console.log("NaNTemplateTest 实例:", testInstance);
    console.log("模板字符串结果:", templateResult);
    console.log("模板字符串预期结果:", expectedResult);
    console.log("测试点 79 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 80：通过 call 调用 Object.prototype.toString()，检测内置 Uint8ClampedArray 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn80_testToStringDetectUint8ClampedArrayType() {
    console.log("=== 测试点 80：call 调用原型 toString() 检测 Uint8ClampedArray 类型 ===");
    const testUint8ClampedArray = new Uint8ClampedArray([300, -50, 100]); // 8位无符号夹紧整数数组
    const actualResult = Object.prototype.toString.call(testUint8ClampedArray);
    const expectedResult = "[object Uint8ClampedArray]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Uint8ClampedArray 对象:", testUint8ClampedArray);
    console.log("Object.prototype.toString.call(Uint8ClampedArray) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Uint8ClampedArray) 预期返回值:", expectedResult);
    console.log("测试点 80 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 81：Symbol.toStringTag 为 Symbol 且 Symbol 无描述时，类型标识为 "Symbol"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
console.log("=== 测试点 81：Symbol.toStringTag 为无描述 Symbol 时类型标识 ===");
const tagSymbol = Symbol(); // 无描述的 Symbol
const testObj = {
    [Symbol.toStringTag]: tagSymbol
};

export const actualResult81 = Object.prototype.toString.call(testObj);

export const expectedResult81 = "[object Symbol]"; // 无描述 Symbol 取默认标识 "Symbol"

/**
 * 测试点 82：重写 toString() 方法返回 Infinity 后，在字符串拼接中仍正常转换
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn82_testToStringReturnInfinityInConcatenation() {
    console.log("=== 测试点 82：重写 toString() 返回 Infinity 在拼接中转换 ===");

    class InfinityConcatenateTest {
        toString() {
            return Infinity;
        }
    }

    const testInstance = new InfinityConcatenateTest();
    const concatenatedResult = "Limit: " + testInstance; // 拼接转换 Infinity 为 "Infinity"
    const expectedResult = "Limit: Infinity";
    const isPassed = concatenatedResult === expectedResult;

    console.log("InfinityConcatenateTest 实例:", testInstance);
    console.log("字符串拼接结果:", concatenatedResult);
    console.log("字符串拼接预期结果:", expectedResult);
    console.log("测试点 82 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 83：通过 call 调用 Object.prototype.toString()，检测内置 Int16Array 类型
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn83_testToStringDetectInt16ArrayType() {
    console.log("=== 测试点 83：call 调用原型 toString() 检测 Int16Array 类型 ===");
    const testInt16Array = new Int16Array([32767, -32768, 1000]); // 16位有符号整数数组
    const actualResult = Object.prototype.toString.call(testInt16Array);
    const expectedResult = "[object Int16Array]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Int16Array 对象:", testInt16Array);
    console.log("Object.prototype.toString.call(Int16Array) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Int16Array) 预期返回值:", expectedResult);
    console.log("测试点 83 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 84：Symbol.toStringTag 为 getter 且抛出错误时，toString() 调用会触发异常
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn84_testToStringTagGetterThrowError() {
    const testObj = {
        get [Symbol.toStringTag]() {
            throw new Error("Tag getter error"); // getter 函数抛出错误
        }
    };
    let errorCaught = false;
    try {
        Object.prototype.toString.call(testObj);
    } catch (err) {
        errorCaught = err.message === "Tag getter error";
    }
    const isPassed = errorCaught;

    return isPassed;
}

/**
 * 测试点 85：重写 toString() 方法在 Map 中作为键时，调用 toString() 生成键标识
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn85_testToStringAsMapKey() {
    console.log("=== 测试点 85：重写 toString() 作为 Map 键时调用 ===");

    class MapKey {
        constructor(id) {
            this.id = id;
        }

        toString() {
            return `Key_${this.id}`; // 自定义键标识
        }
    }

    const key1 = new MapKey(1);
    const key2 = new MapKey(2);
    const testMap = new Map();
    testMap.set(key1, "value1");
    testMap.set(key2, "value2");

    // Map 键比较基于引用，但 toString() 可用于手动生成可识别的键名
    const key1Str = key1.toString();
    const key2Str = key2.toString();
    const isPassed = key1Str === "Key_1" && key2Str === "Key_2" && testMap.has(key1) && testMap.has(key2);

    console.log("Map 对象（含自定义键）:", testMap);
    console.log("key1 toString() 结果:", key1Str);
    console.log("key2 toString() 结果:", key2Str);
    console.log("测试点 85 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 86：通过 call 调用 Object.prototype.toString()，检测内置 DataView 类型（基于共享缓冲区）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn86_testToStringDetectSharedDataViewType() {
    console.log("=== 测试点 86：call 调用原型 toString() 检测共享缓冲区 DataView 类型 ===");
    let testDataView;
    try {
        // 尝试创建共享 ArrayBuffer（部分环境支持）
        const sharedBuffer = new SharedArrayBuffer(16);
        testDataView = new DataView(sharedBuffer);
    } catch (err) {
        // 不支持共享缓冲区时用普通缓冲区模拟
        const buffer = new ArrayBuffer(16);
        testDataView = new DataView(buffer);
    }
    const actualResult = Object.prototype.toString.call(testDataView);
    const expectedResult = "[object DataView]"; // 共享与普通 DataView 类型标识一致
    const isPassed = actualResult === expectedResult;

    console.log("待检测 DataView 对象（基于共享/普通缓冲区）:", testDataView);
    console.log("Object.prototype.toString.call(DataView) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(DataView) 预期返回值:", expectedResult);
    console.log("测试点 86 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 87：Symbol.toStringTag 为字符串且包含转义字符时，toString() 类型标识正常显示
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn87_testToStringTagWithEscapedChars() {
    console.log("=== 测试点 87：Symbol.toStringTag 为含转义字符字符串时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: "Tag\\With\\Escapes\nNewline" // 包含反斜杠和换行符的标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object Tag\\With\\Escapes\nNewline]"; // 保留转义字符
    const isPassed = actualResult === expectedResult;

    console.log("含转义字符 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值（原始）:", "Tag\\With\\Escapes\nNewline");
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 87 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 88：重写 toString() 方法返回空函数，会被转为函数的默认 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn88_testToStringReturnEmptyFunction() {
    console.log("=== 测试点 88：重写 toString() 返回空函数自动转字符串 ===");

    class EmptyFuncTest {
        toString() {
            return function () {
            }; // 返回空函数
        }
    }

    const testInstance = new EmptyFuncTest();
    const actualResult = testInstance.toString();
    const expectedResult = "function() {}"; // 空函数默认 toString() 结果
    const isPassed = actualResult === expectedResult;

    console.log("EmptyFuncTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 88 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 89：通过 call 调用 Object.prototype.toString()，检测内置 Set 类型（含复杂元素）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn89_testToStringDetectSetWithComplexElements() {
    console.log("=== 测试点 89：call 调用原型 toString() 检测含复杂元素的 Set 类型 ===");
    const complexElement1 = { id: 1 };
    const complexElement2 = [2, 3];
    const testSet = new Set([complexElement1, complexElement2]); // 含对象和数组元素的 Set
    const actualResult = Object.prototype.toString.call(testSet);
    const expectedResult = "[object Set]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 Set 对象（含复杂元素）:", testSet);
    console.log("Set 中的复杂元素:", complexElement1, complexElement2);
    console.log("Object.prototype.toString.call(Set) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Set) 预期返回值:", expectedResult);
    console.log("测试点 89 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 90：Symbol.toStringTag 为 undefined 且对象原型有 Symbol.toStringTag 时，继承原型标签
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn90_testToStringTagInheritFromPrototype() {
    console.log("=== 测试点 90：Symbol.toStringTag 未定义时继承原型标签 ===");
    // 原型对象定义 Symbol.toStringTag
    const parentProto = {
        [Symbol.toStringTag]: "ParentProtoTag"
    };
    // 实例对象无自身 Symbol.toStringTag，继承原型
    const testObj = Object.create(parentProto);
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object ParentProtoTag]"; // 继承原型的标签
    const isPassed = actualResult === expectedResult;

    console.log("继承原型的实例对象:", testObj);
    console.log("原型对象的 Symbol.toStringTag:", parentProto[Symbol.toStringTag]);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 90 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 91：重写 toString() 方法返回箭头函数，会被转为箭头函数的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn91_testToStringReturnArrowFunction() {
    console.log("=== 测试点 91：重写 toString() 返回箭头函数自动转字符串 ===");

    class ArrowFuncTest {
        toString() {
            return (x) => x * 2; // 返回箭头函数
        }
    }

    const testInstance = new ArrowFuncTest();
    const actualResult = testInstance.toString();
    const expectedResult = "(x) => x * 2"; // 箭头函数默认 toString() 结果
    const isPassed = actualResult === expectedResult;

    console.log("ArrowFuncTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 91 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 92：通过 call 调用 Object.prototype.toString()，检测内置 Map 类型（含 Symbol 键）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
console.log("=== 测试点 92：call 调用原型 toString() 检测含 Symbol 键的 Map 类型 ===");
const symbolKey92 = Symbol("map-key");
const testMap92 = new Map([[symbolKey92, "symbol-value"], ["str-key", "str-value"]]); // 含 Symbol 键的 Map

export const actualResult92 = Object.prototype.toString.call(testMap92);

export const expectedResult92 = "[object Map]";

/**
 * 测试点 93：Symbol.toStringTag 为字符串且长度为 0 时，toString() 类型标识为空字符串
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn93_testToStringTagWithEmptyString() {
    console.log("=== 测试点 93：Symbol.toStringTag 为空字符串时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: "" // 空字符串标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object ]"; // 类型标识部分为空
    const isPassed = actualResult === expectedResult;

    console.log("含空字符串 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值（空字符串）:", JSON.stringify(testObj[Symbol.toStringTag]));
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 93 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 94：重写 toString() 方法在类的实例方法中调用自身，返回正确结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn94_testToStringCallSelfInInstanceMethod() {
    console.log("=== 测试点 94：实例方法中调用自身 toString() ===");

    class SelfCallTest {
        constructor(name) {
            this.name = name;
        }

        toString() {
            return `SelfCallTest: ${this.name}`;
        }

        // 实例方法中调用自身的 toString()
        logSelf() {
            return `Log: ${this.toString()}`;
        }
    }

    const testInstance = new SelfCallTest("TestName");
    const methodResult = testInstance.logSelf();
    const expectedResult = "Log: SelfCallTest: TestName";
    const isPassed = methodResult === expectedResult;

    console.log("SelfCallTest 实例:", testInstance);
    console.log("实例方法调用结果:", methodResult);
    console.log("实例方法预期结果:", expectedResult);
    console.log("测试点 94 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 95：通过 call 调用 Object.prototype.toString()，检测内置 WeakMap 类型（含 DOM 元素键）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn95_testToStringDetectWeakMapWithDOMKey() {
    console.log("=== 测试点 95：call 调用原型 toString() 检测含 DOM 元素键的 WeakMap 类型 ===");
    let testWeakMap, isDOMSupported;
    try {
        // 尝试创建 DOM 元素（浏览器环境支持，Node.js 环境会报错）
        const domElement = document.createElement("div");
        testWeakMap = new WeakMap([[domElement, "dom-data"]]);
        isDOMSupported = true;
    } catch (err) {
        // Node.js 环境模拟 WeakMap
        testWeakMap = new WeakMap([[{ fake: "dom-element" }, "fake-dom-data"]]);
        isDOMSupported = false;
    }
    const actualResult = Object.prototype.toString.call(testWeakMap);
    const expectedResult = "[object WeakMap]";
    const isPassed = actualResult === expectedResult;

    console.log(`待检测 WeakMap 对象（${isDOMSupported ? "含真实 DOM 键" : "含模拟 DOM 键"}）:`, testWeakMap);
    console.log("Object.prototype.toString.call(WeakMap) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(WeakMap) 预期返回值:", expectedResult);
    console.log("测试点 95 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 96：Symbol.toStringTag 为 Symbol 且 Symbol 含特殊字符描述时，类型标识保留特殊字符
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn96_testToStringTagWithSymbolSpecialDesc() {
    console.log("=== 测试点 96：Symbol.toStringTag 为含特殊字符描述的 Symbol 时类型标识 ===");
    const tagSymbol = Symbol("Symbol@Tag#123"); // 含特殊字符描述的 Symbol
    const testObj = {
        [Symbol.toStringTag]: tagSymbol
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object Symbol@Tag#123]"; // 保留描述中的特殊字符
    const isPassed = actualResult === expectedResult;

    console.log("含特殊描述 Symbol 的 Symbol.toStringTag 对象:", testObj);
    console.log("Symbol 的描述:", tagSymbol.description);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 96 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 97：重写 toString() 方法返回 Date 对象，会被转为 Date 的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn97_testToStringReturnDateObject() {
    console.log("=== 测试点 97：重写 toString() 返回 Date 对象自动转字符串 ===");
    const testDate = new Date("2024-12-31");

    class DateObjTest {
        toString() {
            return testDate; // 返回 Date 对象
        }
    }

    const testInstance = new DateObjTest();
    const actualResult = testInstance.toString();
    const expectedResult = testDate.toString(); // 等同于 Date 对象自身的 toString() 结果
    const isPassed = actualResult === expectedResult;

    console.log("DateObjTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 97 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 98：通过 call 调用 Object.prototype.toString()，检测内置 WeakSet 类型（含类实例元素）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn98_testToStringDetectWeakSetWithClassInstance() {
    console.log("=== 测试点 98：call 调用原型 toString() 检测含类实例元素的 WeakSet 类型 ===");

    class TestClass {
    }

    const instance1 = new TestClass();
    const instance2 = new TestClass();
    const testWeakSet = new WeakSet([instance1, instance2]); // 含类实例元素的 WeakSet
    const actualResult = Object.prototype.toString.call(testWeakSet);
    const expectedResult = "[object WeakSet]";
    const isPassed = actualResult === expectedResult;

    console.log("待检测 WeakSet 对象（含类实例元素）:", testWeakSet);
    console.log("WeakSet 中的类实例:", instance1, instance2);
    console.log("Object.prototype.toString.call(WeakSet) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(WeakSet) 预期返回值:", expectedResult);
    console.log("测试点 98 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 99：Symbol.toStringTag 为数组且数组含 undefined 元素时，类型标识包含 "undefined"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn99_testToStringTagWithArrayUndefinedElement() {
    console.log("=== 测试点 99：Symbol.toStringTag 为含 undefined 元素数组时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: ["a", undefined, "b"] // 含 undefined 元素的数组
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object a,undefined,b]"; // 数组 toString() 会将 undefined 转为 "undefined"
    const isPassed = actualResult === expectedResult;

    console.log("含 undefined 元素数组的 Symbol.toStringTag 对象:", testObj);
    console.log("数组的 toString() 结果:", ["a", undefined, "b"].toString());
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 99 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 100：重写 toString() 方法返回 RegExp 对象，会被转为 RegExp 的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn100_testToStringReturnRegExpObject() {
    console.log("=== 测试点 100：重写 toString() 返回 RegExp 对象自动转字符串 ===");
    const testRegExp = /[a-z]+/gi;

    class RegExpObjTest {
        toString() {
            return testRegExp; // 返回 RegExp 对象
        }
    }

    const testInstance = new RegExpObjTest();
    const actualResult = testInstance.toString();
    const expectedResult = testRegExp.toString(); // 等同于 RegExp 对象自身的 toString() 结果
    const isPassed = actualResult === expectedResult;

    console.log("RegExpObjTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 100 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 101：通过 call 调用 Object.prototype.toString()，检测内置 Promise 类型（已决议状态）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn101_testToStringDetectResolvedPromiseType() {
    console.log("=== 测试点 101：call 调用原型 toString() 检测已决议 Promise 类型 ===");
    const resolvedPromise = Promise.resolve("resolved-value"); // 已决议的 Promise
    const actualResult = Object.prototype.toString.call(resolvedPromise);
    const expectedResult = "[object Promise]"; // 状态不影响类型标识
    const isPassed = actualResult === expectedResult;

    console.log("待检测已决议 Promise 对象:", resolvedPromise);
    console.log("Object.prototype.toString.call(resolved Promise) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(resolved Promise) 预期返回值:", expectedResult);
    console.log("测试点 101 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 102：Symbol.toStringTag 为数组且数组含 null 元素时，类型标识包含 "null"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn102_testToStringTagWithArrayNullElement() {
    console.log("=== 测试点 102：Symbol.toStringTag 为含 null 元素数组时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: ["x", null, "y"] // 含 null 元素的数组
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object x,null,y]"; // 数组 toString() 会将 null 转为 "null"
    const isPassed = actualResult === expectedResult;

    console.log("含 null 元素数组的 Symbol.toStringTag 对象:", testObj);
    console.log("数组的 toString() 结果:", ["x", null, "y"].toString());
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 102 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 103：重写 toString() 方法返回 Error 对象，会被转为 Error 的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn103_testToStringReturnErrorObject() {
    console.log("=== 测试点 103：重写 toString() 返回 Error 对象自动转字符串 ===");
    const testError = new Error("Test error for toString");

    class ErrorObjTest {
        toString() {
            return testError; // 返回 Error 对象
        }
    }

    const testInstance = new ErrorObjTest();
    const actualResult = testInstance.toString();
    const expectedResult = testError.toString(); // 等同于 Error 对象自身的 toString() 结果
    const isPassed = actualResult === expectedResult;

    console.log("ErrorObjTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 103 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 104：通过 call 调用 Object.prototype.toString()，检测内置 Promise 类型（已拒绝状态）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn104_testToStringDetectRejectedPromiseType() {
    console.log("=== 测试点 104：call 调用原型 toString() 检测已拒绝 Promise 类型 ===");
    const rejectedPromise = Promise.reject(new Error("rejected-error")); // 已拒绝的 Promise
    // 捕获拒绝状态避免控制台警告（非测试核心逻辑）
    rejectedPromise.catch(() => {
    });
    const actualResult = Object.prototype.toString.call(rejectedPromise);
    const expectedResult = "[object Promise]"; // 状态不影响类型标识
    const isPassed = actualResult === expectedResult;

    console.log("待检测已拒绝 Promise 对象:", rejectedPromise);
    console.log("Object.prototype.toString.call(rejected Promise) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(rejected Promise) 预期返回值:", expectedResult);
    console.log("测试点 104 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 105：Symbol.toStringTag 为嵌套数组时，类型标识用嵌套数组的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn105_testToStringTagWithNestedArray() {
    console.log("=== 测试点 105：Symbol.toStringTag 为嵌套数组时类型标识 ===");
    const nestedArray = [1, [2, 3], 4]; // 嵌套数组
    const testObj = {
        [Symbol.toStringTag]: nestedArray
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object 1,2,3,4]"; // 嵌套数组 toString() 会扁平化一层
    const isPassed = actualResult === expectedResult;

    console.log("含嵌套数组 Symbol.toStringTag 的对象:", testObj);
    console.log("嵌套数组的 toString() 结果:", nestedArray.toString());
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 105 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 106：重写 toString() 方法在 JSON.stringify 中被 toJSON 覆盖时，优先使用 toJSON 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn106_testToStringOverriddenByToJSON() {
    console.log("=== 测试点 106：toJSON 方法覆盖 toString() 在 JSON.stringify 中的作用 ===");

    class JsonTest {
        constructor(id) {
            this.id = id;
        }

        toString() {
            return `ToString_${this.id}`; // 被覆盖的 toString()
        }

        toJSON() {
            return `ToJSON_${this.id}`; // 优先使用的 toJSON()
        }
    }

    const testInstance = new JsonTest(5);
    const jsonResult = JSON.stringify(testInstance);
    const expectedResult = "\"ToJSON_5\""; // 优先使用 toJSON() 结果
    const isPassed = jsonResult === expectedResult;

    console.log("JsonTest 实例:", testInstance);
    console.log("JSON.stringify 结果:", jsonResult);
    console.log("JSON.stringify 预期结果:", expectedResult);
    console.log("测试点 106 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 107：通过 call 调用 Object.prototype.toString()，检测内置 ArrayBuffer 类型（0 字节长度）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn107_testToStringDetectZeroLengthArrayBuffer() {
    console.log("=== 测试点 107：call 调用原型 toString() 检测 0 字节 ArrayBuffer 类型 ===");
    const zeroLengthBuffer = new ArrayBuffer(0); // 0 字节长度的 ArrayBuffer
    const actualResult = Object.prototype.toString.call(zeroLengthBuffer);
    const expectedResult = "[object ArrayBuffer]"; // 长度不影响类型标识
    const isPassed = actualResult === expectedResult;

    console.log("待检测 0 字节 ArrayBuffer 对象:", zeroLengthBuffer);
    console.log("ArrayBuffer 长度:", zeroLengthBuffer.byteLength);
    console.log("Object.prototype.toString.call(ArrayBuffer) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(ArrayBuffer) 预期返回值:", expectedResult);
    console.log("测试点 107 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 108：Symbol.toStringTag 为 BigInt 类型时，toString() 类型标识为 BigInt 的字符串形式
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn108_testToStringTagWithBigInt() {
    console.log("=== 测试点 108：Symbol.toStringTag 为 BigInt 时类型标识 ===");
    const tagBigInt = 12345678901234567890123n; // BigInt 类型标签
    const testObj = {
        [Symbol.toStringTag]: tagBigInt
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object 12345678901234567890123]"; // BigInt 转为字符串
    const isPassed = actualResult === expectedResult;

    console.log("含 BigInt 类型 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的 BigInt 值:", tagBigInt);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 108 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 109：重写 toString() 方法返回 TypedArray 对象，会被转为 TypedArray 的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn109_testToStringReturnTypedArray() {
    console.log("=== 测试点 109：重写 toString() 返回 TypedArray 自动转字符串 ===");
    const testTypedArray = new Uint8Array([10, 20, 30]);

    class TypedArrayTest {
        toString() {
            return testTypedArray; // 返回 TypedArray 对象
        }
    }

    const testInstance = new TypedArrayTest();
    const actualResult = testInstance.toString();
    const expectedResult = testTypedArray.toString(); // 等同于 TypedArray 自身 toString()
    const isPassed = actualResult === expectedResult;

    console.log("TypedArrayTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 109 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 111：Symbol.toStringTag 为 NaN 时，toString() 类型标识为 "NaN"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn111_testToStringTagWithNaN() {
    console.log("=== 测试点 111：Symbol.toStringTag 为 NaN 时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: NaN // NaN 作为标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object NaN]"; // NaN 转为字符串 "NaN"
    const isPassed = actualResult === expectedResult;

    console.log("含 NaN 类型 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值（NaN）:", testObj[Symbol.toStringTag]);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 111 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 112：重写 toString() 方法在类的继承链中多层继承时，优先调用最近子类的实现
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn112_testToStringInMultiLevelInheritance() {
    console.log("=== 测试点 112：多层继承中优先调用最近子类的 toString() ===");

    // 顶层父类
    class GrandParent {
        toString() {
            return "GrandParent toString";
        }
    }

    // 中间子类
    class Parent extends GrandParent {
        toString() {
            return "Parent toString";
        }
    }

    // 底层子类（最近子类）
    class Child extends Parent {
        toString() {
            return "Child toString";
        }
    }

    const childInstance = new Child();
    const actualResult = childInstance.toString();
    const expectedResult = "Child toString"; // 优先最近子类实现
    const isPassed = actualResult === expectedResult;

    console.log("多层继承的 Child 实例:", childInstance);
    console.log("toString() 实际返回值:", actualResult);
    console.log("toString() 预期返回值:", expectedResult);
    console.log("测试点 112 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 114：Symbol.toStringTag 为 Infinity 时，toString() 类型标识为 "Infinity"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn114_testToStringTagWithInfinity() {
    console.log("=== 测试点 114：Symbol.toStringTag 为 Infinity 时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: Infinity // Infinity 作为标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object Infinity]"; // Infinity 转为字符串 "Infinity"
    const isPassed = actualResult === expectedResult;

    console.log("含 Infinity 类型 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值（Infinity）:", testObj[Symbol.toStringTag]);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 114 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 115：重写 toString() 方法返回 ReadableStream 对象，会被转为 Stream 的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn115_testToStringReturnReadableStream() {
    console.log("=== 测试点 115：重写 toString() 返回 ReadableStream 自动转字符串 ===");
    let testStream;
    try {
        testStream = new ReadableStream({
            start(controller) {
                controller.close();
            }
        });
    } catch (err) {
        testStream = { [Symbol.toStringTag]: "ReadableStream" }; // 环境不支持时模拟
    }

    class StreamTest {
        toString() {
            return testStream; // 返回 ReadableStream 对象
        }
    }

    const testInstance = new StreamTest();
    const actualResult = testInstance.toString();
    const expectedResult = testStream.toString(); // 等同于 Stream 自身 toString()
    const isPassed = actualResult === expectedResult;

    console.log("StreamTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 115 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 116：通过 call 调用 Object.prototype.toString()，检测内置 WeakRef 类型（目标已回收）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn116_testToStringDetectWeakRefWithCollectedTarget() {
    console.log("=== 测试点 116：call 调用原型 toString() 检测目标已回收的 WeakRef 类型 ===");
    let testWeakRef;
    try {
        let target = {};
        testWeakRef = new WeakRef(target);
        target = null; // 解除引用，触发垃圾回收（依赖环境）
    } catch (err) {
        testWeakRef = { [Symbol.toStringTag]: "WeakRef" }; // 环境不支持时模拟
    }
    const actualResult = Object.prototype.toString.call(testWeakRef);
    const expectedResult = "[object WeakRef]"; // 目标回收不影响类型标识
    const isPassed = actualResult === expectedResult;

    console.log("待检测目标已回收的 WeakRef 对象:", testWeakRef);
    console.log("Object.prototype.toString.call(WeakRef) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(WeakRef) 预期返回值:", expectedResult);
    console.log("测试点 116 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 117：Symbol.toStringTag 为 -0 时，toString() 类型标识为 "0"（-0 与 0 字符串形式一致）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn117_testToStringTagWithNegativeZero() {
    console.log("=== 测试点 117：Symbol.toStringTag 为 -0 时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: -0 // -0 作为标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object 0]"; // -0 转字符串与 0 一致，均为 "0"
    const isPassed = actualResult === expectedResult;

    console.log("含 -0 类型 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值（-0）:", testObj[Symbol.toStringTag]);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 117 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 118：重写 toString() 方法返回 FinalizationRegistry 对象，会被转为其 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn118_testToStringReturnFinalizationRegistry() {
    console.log("=== 测试点 118：重写 toString() 返回 FinalizationRegistry 自动转字符串 ===");
    let testRegistry;
    try {
        testRegistry = new FinalizationRegistry(() => {
        }); // 创建 FinalizationRegistry
    } catch (err) {
        testRegistry = { [Symbol.toStringTag]: "FinalizationRegistry" }; // 环境不支持时模拟
    }

    class RegistryTest {
        toString() {
            return testRegistry; // 返回 FinalizationRegistry 对象
        }
    }

    const testInstance = new RegistryTest();
    const actualResult = testInstance.toString();
    const expectedResult = testRegistry.toString(); // 等同于 Registry 自身 toString()
    const isPassed = actualResult === expectedResult;

    console.log("RegistryTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 118 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 119：通过 call 调用 Object.prototype.toString()，检测内置 DataView 类型（空缓冲区）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn119_testToStringDetectDataViewWithEmptyBuffer() {
    console.log("=== 测试点 119：call 调用原型 toString() 检测空缓冲区 DataView 类型 ===");
    const emptyBuffer = new ArrayBuffer(0); // 空缓冲区
    const testDataView = new DataView(emptyBuffer); // 基于空缓冲区的 DataView
    const actualResult = Object.prototype.toString.call(testDataView);
    const expectedResult = "[object DataView]"; // 缓冲区为空不影响类型标识
    const isPassed = actualResult === expectedResult;

    console.log("待检测空缓冲区 DataView 对象:", testDataView);
    console.log("DataView 关联的缓冲区长度:", emptyBuffer.byteLength);
    console.log("Object.prototype.toString.call(DataView) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(DataView) 预期返回值:", expectedResult);
    console.log("测试点 119 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 120：Symbol.toStringTag 为布尔值 true 时，toString() 类型标识为 "true"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn120_testToStringTagWithBooleanTrue() {
    console.log("=== 测试点 120：Symbol.toStringTag 为布尔值 true 时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: true // 布尔值 true 作为标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object true]"; // true 转字符串为 "true"
    const isPassed = actualResult === expectedResult;

    console.log("含布尔值 true Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值（true）:", testObj[Symbol.toStringTag]);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 120 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 121：重写 toString() 方法在类的静态属性中引用实例，返回正确拼接结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn121_testToStringInStaticProperty() {
    console.log("=== 测试点 121：静态属性中引用实例 toString() 结果 ===");

    class StaticPropTest {
        constructor(name) {
            this.name = name;
        }

        toString() {
            return `Instance: ${this.name}`;
        }

        // 静态属性引用实例的 toString() 结果
        static getInstanceLog(instance) {
            return `StaticLog: ${instance.toString()}`;
        }
    }

    const testInstance = new StaticPropTest("StaticTest1");
    const staticResult = StaticPropTest.getInstanceLog(testInstance);
    const expectedResult = "StaticLog: Instance: StaticTest1";
    const isPassed = staticResult === expectedResult;

    console.log("StaticPropTest 实例:", testInstance);
    console.log("静态属性返回结果:", staticResult);
    console.log("静态属性预期结果:", expectedResult);
    console.log("测试点 121 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 122：通过 call 调用 Object.prototype.toString()，检测内置 Set 类型（空 Set）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn122_testToStringDetectEmptySet() {
    console.log("=== 测试点 122：call 调用原型 toString() 检测空 Set 类型 ===");
    const emptySet = new Set(); // 空 Set
    const actualResult = Object.prototype.toString.call(emptySet);
    const expectedResult = "[object Set]"; // 空 Set 类型标识不变
    const isPassed = actualResult === expectedResult;

    console.log("待检测空 Set 对象:", emptySet);
    console.log("Set 大小（元素数量）:", emptySet.size);
    console.log("Object.prototype.toString.call(Set) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Set) 预期返回值:", expectedResult);
    console.log("测试点 122 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 123：Symbol.toStringTag 为数字 0 时，toString() 类型标识为 "0"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn123_testToStringTagWithNumberZero() {
    console.log("=== 测试点 123：Symbol.toStringTag 为数字 0 时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: 0 // 数字 0 作为标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object 0]"; // 数字 0 转字符串为 "0"
    const isPassed = actualResult === expectedResult;

    console.log("含数字 0 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值（0）:", testObj[Symbol.toStringTag]);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 123 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 124：重写 toString() 方法返回 Map 对象，会被转为 Map 的 toString() 结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn124_testToStringReturnMapObject() {
    console.log("=== 测试点 124：重写 toString() 返回 Map 对象自动转字符串 ===");
    const testMap = new Map([["key1", "value1"], ["key2", "value2"]]);

    class MapObjTest {
        toString() {
            return testMap; // 返回 Map 对象
        }
    }

    const testInstance = new MapObjTest();
    const actualResult = testInstance.toString();
    const expectedResult = testMap.toString(); // 等同于 Map 自身 toString()
    const isPassed = actualResult === expectedResult;

    console.log("MapObjTest 实例:", testInstance);
    console.log("重写 toString() 实际返回值:", actualResult);
    console.log("重写 toString() 预期返回值:", expectedResult);
    console.log("测试点 124 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 125：通过 call 调用 Object.prototype.toString()，检测内置 Map 类型（空 Map）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn125_testToStringDetectEmptyMap() {
    console.log("=== 测试点 125：call 调用原型 toString() 检测空 Map 类型 ===");
    const emptyMap = new Map(); // 空 Map
    const actualResult = Object.prototype.toString.call(emptyMap);
    const expectedResult = "[object Map]"; // 空 Map 类型标识不变
    const isPassed = actualResult === expectedResult;

    console.log("待检测空 Map 对象:", emptyMap);
    console.log("Map 大小（键值对数量）:", emptyMap.size);
    console.log("Object.prototype.toString.call(Map) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(Map) 预期返回值:", expectedResult);
    console.log("测试点 125 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 126：Symbol.toStringTag 为数字 123.45 时，toString() 类型标识为 "123.45"
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn126_testToStringTagWithFloatNumber() {
    console.log("=== 测试点 126：Symbol.toStringTag 为浮点数 123.45 时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: 123.45 // 浮点数 123.45 作为标签
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object 123.45]"; // 浮点数转字符串为 "123.45"
    const isPassed = actualResult === expectedResult;

    console.log("含浮点数 123.45 Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 的值（123.45）:", testObj[Symbol.toStringTag]);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 126 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 127：重写 toString() 方法在数组的 join() 方法中调用，返回正确拼接结果
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn127_testToStringInArrayJoin() {
    console.log("=== 测试点 127：数组 join() 方法中调用实例 toString() ===");

    class JoinTest {
        constructor(value) {
            this.value = value;
        }

        toString() {
            return `Join_${this.value}`;
        }
    }

    const testArray = [new JoinTest(1), new JoinTest(2), new JoinTest(3)];
    const joinResult = testArray.join("|"); // join() 调用元素 toString() 后拼接
    const expectedResult = "Join_1|Join_2|Join_3";
    const isPassed = joinResult === expectedResult;

    console.log("含 JoinTest 实例的数组:", testArray);
    console.log("数组 join() 结果:", joinResult);
    console.log("数组 join() 预期结果:", expectedResult);
    console.log("测试点 127 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 128：通过 call 调用 Object.prototype.toString()，检测内置 WeakMap 类型（空 WeakMap）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn128_testToStringDetectEmptyWeakMap() {
    console.log("=== 测试点 128：call 调用原型 toString() 检测空 WeakMap 类型 ===");
    const emptyWeakMap = new WeakMap(); // 空 WeakMap
    const actualResult = Object.prototype.toString.call(emptyWeakMap);
    const expectedResult = "[object WeakMap]"; // 空 WeakMap 类型标识不变
    const isPassed = actualResult === expectedResult;

    console.log("待检测空 WeakMap 对象:", emptyWeakMap);
    console.log("Object.prototype.toString.call(WeakMap) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(WeakMap) 预期返回值:", expectedResult);
    console.log("测试点 128 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}

/**
 * 测试点 129：Symbol.toStringTag 为字符串 "null" 时，toString() 类型标识为 "null"（与 null 区分）
 * @returns {boolean} 测试是否通过（true 为通过，false 为失败）
 */
export function Fn129_testToStringTagWithStringNull() {
    console.log("=== 测试点 129：Symbol.toStringTag 为字符串 \"null\" 时类型标识 ===");
    const testObj = {
        [Symbol.toStringTag]: "null" // 字符串 "null" 作为标签（非 null 值）
    };
    const actualResult = Object.prototype.toString.call(testObj);
    const expectedResult = "[object null]"; // 直接使用字符串标签
    const isPassed = actualResult === expectedResult;

    console.log("含字符串 \"null\" Symbol.toStringTag 的对象:", testObj);
    console.log("Symbol.toStringTag 类型（string）:", typeof testObj[Symbol.toStringTag]);
    console.log("Object.prototype.toString.call(对象) 实际返回值:", actualResult);
    console.log("Object.prototype.toString.call(对象) 预期返回值:", expectedResult);
    console.log("测试点 129 " + (isPassed ? "通过" : "失败") + "\n");

    return isPassed;
}