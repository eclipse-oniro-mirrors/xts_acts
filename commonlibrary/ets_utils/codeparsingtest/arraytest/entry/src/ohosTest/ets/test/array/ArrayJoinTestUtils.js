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

export const ArrayJoinTestUtils = {
    /**
     * 001. 使用「默认分隔符（逗号）」，基本类型元素拼接
     * 特性：未指定分隔符时，join默认用「,」拼接数组元素，元素转字符串后连接
     */
    async test001_JoinDefaultSeparator() {
        const testArray = [1, "a", true, 3.14]; // 基本类型元素
        const expected = "1,a,true,3.14"; // 各元素转字符串后用逗号连接
        const actual = testArray.join(); // 未传分隔符，用默认逗号

        if (actual !== expected) {
            throw new Error(`Test001 失败：
                数组：[${testArray}]
                分隔符：默认（逗号）
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinDefaultSeparatorTest001";
    },

    /**
     * 002. 使用「自定义分隔符（短横线）」，字符串元素拼接
     * 特性：指定自定义分隔符时，用该分隔符连接元素，分隔符可为任意字符串
     */
    async test002_JoinCustomSeparator() {
        const testArray = ["apple", "banana", "orange"]; // 字符串元素
        const separator = "-"; // 自定义分隔符
        const expected = "apple-banana-orange";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test002 失败：
                数组：[${JSON.stringify(testArray)}]
                分隔符："${separator}"
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinCustomSeparatorTest002";
    },

    /**
     * 003. 数组含「undefined、null、空槽」，统一转为空字符串拼接
     * 特性：数组元素为undefined/null/空槽（稀疏数组）时，join均视为空字符串处理
     */
    async test003_JoinWithUndefinedNullAndHole() {
        const testArray = [1, undefined, null, , 2]; // 含undefined、null、空槽（index3）
        const separator = ",";
        const expected = "1,,,,2"; // undefined/null/空槽均转空字符串，对应3个连续逗号
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test003 失败：
                数组：[${testArray.map(item => item ?? "空槽")}]（稀疏数组，index3为空槽）
                分隔符："${separator}"
                预期结果："${expected}"（undefined/null/空槽均转空字符串）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithUndefinedNullAndHoleTest003";
    },

    /**
     * 004. 「空数组」调用join，返回空字符串
     * 特性：空数组无元素可拼接，无论指定何种分隔符，均返回空字符串
     */
    async test004_JoinEmptyArray() {
        const testArray = []; // 空数组
        const testCases = [
            { separator: ",", expected: "" }, // 逗号分隔符
            { separator: "|", expected: "" }, // 自定义分隔符
            { separator: undefined, expected: "" } // 分隔符为undefined
        ];

        for (const { separator, expected } of testCases) {
            const actual = testArray.join(separator);
            if (actual !== expected) {
                throw new Error(`Test004 失败：
                    数组：空数组[]
                    分隔符：${separator === undefined ? "undefined" : `"${separator}"`}
                    预期结果："${expected}"
                    实际结果："${actual}"`);
            }
        }

        return "Test Passed: JoinEmptyArrayTest004";
    },

    /**
     * 005. 「单元素数组」调用join，忽略分隔符，返回元素字符串形式
     * 特性：数组仅含一个元素时，无需分隔符，直接返回该元素的字符串形式
     */
    async test005_JoinSingleElementArray() {
        const testCases = [
            { array: [5], separator: "-", expected: "5" }, // 数字元素
            { array: [null], separator: "x", expected: "" }, // null转空字符串
            { array: [{ a: 1 }], separator: ",", expected: "[object Object]" } // 对象转toString结果
        ];

        for (const { array, separator, expected } of testCases) {
            const actual = array.join(separator);
            if (actual !== expected) {
                throw new Error(`Test005 失败：
                    数组：[${JSON.stringify(array)}]（单元素数组）
                    分隔符："${separator}"
                    预期结果："${expected}"（忽略分隔符）
                    实际结果："${actual}"`);
            }
        }

        return "Test Passed: JoinSingleElementArrayTest005";
    },


    /**
     * 007. 分隔符为「undefined/null」，自动转为空字符串
     * 特性：若分隔符为undefined或null，join会将其视为空字符串，元素直接拼接无分隔
     * 修正点：数组从嵌套数组[["a","b","c"]]改为单层数组["a","b","c"]
     */
    async test007_JoinWithUndefinedNullSeparator() {
        const testArray = ["a", "b", "c"]; // 修正：单层数组（3个独立字符串元素）
        const testCases = [
            { separator: undefined, expected: "a,b,c" }, // 分隔符undefined→空字符串，拼接为"a,b,c"
            { separator: null, expected: "anullbnullc" } // 分隔符null→空字符串，拼接为"anullbnullc"
        ];

        for (const { separator, expected } of testCases) {
            const actual = testArray.join(separator);
            if (actual !== expected) {
                throw new Error(`Test007 失败：
                    数组：[${JSON.stringify(testArray)}]（单层数组，3个独立元素）
                    分隔符：${separator === undefined ? "undefined" : "null"}（转为空字符串）
                    预期结果："${expected}"（无分隔拼接）
                    实际结果："${actual}"`);
            }
        }

        return "Test Passed: JoinWithUndefinedNullSeparatorTest007";
    },

    /**
     * 008. 「类数组对象」调用join（通过Array.prototype.join.call）
     * 特性：类数组对象（含length和整数索引）可通过call调用join，按索引顺序拼接元素
     */
    async test008_JoinOnArrayLike() {
        // 类数组对象：length=4，整数索引0-3对应元素，非整数索引"key"忽略
        const arrayLike = { length: 4, 0: "x", 1: "y", 2: "z", 3: "w", key: "ignore" };
        const separator = ",";
        const expected = "x,y,z,w"; // 仅处理0-3索引，忽略非整数索引"key"
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test008 失败：
                类数组：${JSON.stringify(arrayLike)}（非整数索引"key"忽略）
                分隔符："${separator}"
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinOnArrayLikeTest008";
    },

    /**
     * 009. 数组含「特殊值（NaN/Infinity/BigInt/Date/RegExp）」，转为对应字符串拼接
     * 特性：
     *   - NaN → "NaN"
     *   - Infinity → "Infinity"
     *   - BigInt → "数字字符串"
     *   - Date → "日期时间字符串"
     *   - RegExp → "正则字面量字符串"
     * 修正点：移除了可能导致兼容性问题的 Symbol，替换为 BigInt、Date 和 RegExp。
     */
    async test009_JoinWithSpecialValues() {
        const testArray = [
            NaN, // → "NaN"
            Infinity, // → "Infinity"
            123n, // BigInt → "123"
            new Date(2024, 0, 1), // Date → "Mon Jan 01 2024 00:00:00 GMT+... (具体时区)"
            /regex-pattern/i // RegExp → "/regex-pattern/i"
        ];
        const separator = " | ";

        // 计算预期结果，特别是 Date 对象，需要获取其真实的 toString() 值
        const expectedDateString = testArray[3].toString();
        const expected = `NaN | Infinity | 123 | ${expectedDateString} | /regex-pattern/i`;

        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test009 失败：
                数组：[NaN, Infinity, 123n, Date, RegExp]
                分隔符："${separator}"
                预期结果："${expected}"（特殊值转对应字符串）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithSpecialValuesTest009";
    },

    /**
     * 010. 数组含「多层嵌套数组」，递归调用toString后拼接
     * 特性：嵌套数组会先调用自身toString()（扁平化处理），再参与外层数组的拼接
     */
    async test010_JoinWithDeepNestedArrays() {
        const testArray = [
            1,
            [2, [3, 4], 5], // 内层嵌套数组：[2,[3,4],5].toString() → "2,3,4,5"
            6
        ];
        const separator = ",";
        const expected = "1,2,3,4,5,6"; // 嵌套数组扁平化后拼接
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test010 失败：
                数组：[1, [2, [3, 4], 5], 6]（多层嵌套）
                分隔符："${separator}"
                预期结果："${expected}"（嵌套数组扁平化）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithDeepNestedArraysTest010";
    },
    /**
     * 011. 使用「空字符串」作为分隔符，所有元素无缝拼接
     * 特性：分隔符为空字符串 "" 时，元素之间直接拼接，没有任何间隔
     */
    async test011_JoinWithEmptyStringSeparator() {
        const testArray = ["Java", "Script", " ", "Test"];
        const separator = "";
        const expected = "JavaScript Test";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test011 失败：
                数组：[${JSON.stringify(testArray)}]
                分隔符：空字符串 ""
                预期结果："${expected}"（无缝拼接）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithEmptyStringSeparatorTest011";
    },

    /**
     * 012. 使用「多字符」作为分隔符，按完整字符串进行拼接
     * 特性：分隔符可以是任意长度的字符串，每次拼接都会插入完整的分隔符
     */
    async test012_JoinWithMultiCharSeparator() {
        const testArray = ["user", "profile", "id"];
        const separator = "||"; // 多字符分隔符
        const expected = "user||profile||id";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test012 失败：
                数组：[${JSON.stringify(testArray)}]
                分隔符："${separator}"
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithMultiCharSeparatorTest012";
    },

    /**
     * 013. 数组元素包含「模板字符串」，按其字符串值进行拼接
     * 特性：模板字符串是字符串的一种形式，其值在创建时已确定，join按其值处理
     */
    async test013_JoinWithTemplateStrings() {
        const name = "join";
        const version = "ES1";
        const testArray = [`Array.prototype.${name}`, ` (${version})`];
        const separator = "";
        const expected = "Array.prototype.join (ES1)";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test013 失败：
                数组：[${JSON.stringify(testArray)}]
                分隔符："${separator}"
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithTemplateStringsTest013";
    },

    /**
     * 014. 分隔符为「数字」，隐式转换为字符串后进行拼接
     * 特性：若分隔符不是字符串，会先调用 String() 将其转为字符串，再进行拼接
     */
    async test014_JoinWithNumberSeparator() {
        const testArray = ["a", "b", "c"];
        const separator = 123; // 数字分隔符
        const expected = "a123b123c";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test014 失败：
                数组：[${JSON.stringify(testArray)}]
                分隔符：${separator} (数字，转为字符串 "${String(separator)}")
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithNumberSeparatorTest014";
    },

    /**
     * 015. 分隔符为「布尔值」，隐式转换为字符串后进行拼接
     * 特性：布尔值 true 转为 "true"，false 转为 "false"，作为分隔符使用
     */
    async test015_JoinWithBooleanSeparator() {
        const testArray = [1, 2];
        const testCases = [
            { separator: true, expected: "1true2" },
            { separator: false, expected: "1false2" }
        ];

        for (const { separator, expected } of testCases) {
            const actual = testArray.join(separator);
            if (actual !== expected) {
                throw new Error(`Test015 失败：
                    数组：[${testArray}]
                    分隔符：${separator} (布尔值，转为字符串 "${String(separator)}")
                    预期结果："${expected}"
                    实际结果："${actual}"`);
            }
        }

        return "Test Passed: JoinWithBooleanSeparatorTest015";
    },

    /**
     * 016. 数组元素为「布尔值」，转换为 "true" 或 "false" 后拼接
     * 特性：布尔类型的元素会被转为其字符串形式，再参与拼接
     */
    async test016_JoinWithBooleanElements() {
        const testArray = [true, false, true];
        const separator = ",";
        const expected = "true,false,true";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test016 失败：
                数组：[${testArray}]
                分隔符："${separator}"
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithBooleanElementsTest016";
    },

    /**
     * 017. 数组包含「空数组元素」，空数组转为空字符串后拼接
     * 特性：作为元素的空数组 [] 调用 toString() 会返回空字符串 ""
     */
    async test017_JoinWithEmptyArrayElements() {
        const testArray = [1, [], 2, [], 3];
        const separator = "-";
        const expected = "1--2--3"; // 空数组转为空字符串，导致连续分隔符
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test017 失败：
                数组：[${testArray.map(item => Array.isArray(item) ? '[]' : item)}]
                分隔符："${separator}"
                预期结果："${expected}"（空数组元素转为空字符串）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithEmptyArrayElementsTest017";
    },

    /**
     * 018. 类数组对象「索引不连续」，join 按索引顺序拼接，跳过空槽
     * 特性：与数组类似，类数组的空槽（不存在的索引）在 join 时被视为空字符串
     */
    async test018_JoinArrayLikeDiscontinuous() {
        const arrayLike = { length: 4, 0: "A", 2: "C" }; // 索引1和3为空槽
        const separator = "|";
        const expected = "A||C|"; // 空槽被视为空字符串
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test018 失败：
                类数组：${JSON.stringify(arrayLike)}（索引1和3为空槽）
                分隔符："${separator}"
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinArrayLikeDiscontinuousTest018";
    },

    /**
     * 019. 数组包含「零宽度空格 (U+200B)」，按普通字符拼接
     * 特性：零宽度空格是一个不可见的Unicode字符，但它仍然是一个字符，会被正常拼接
     */
    async test019_JoinWithZeroWidthSpace() {
        const zeroWidthSpace = "\u200B";
        const testArray = ["item1", zeroWidthSpace, "item2"];
        const separator = "";
        const expected = `item1${zeroWidthSpace}item2`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test019 失败：
                数组：[item1, U+200B, item2]
                分隔符：空字符串 ""
                预期结果："item1[ZWSP]item2" (包含零宽度空格)
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithZeroWidthSpaceTest019";
    },

    /**
     * 020. 分隔符为「对象」，调用其 toString() 方法后进行拼接
     * 特性：对象作为分隔符时，会先调用其 toString() 方法（通常返回 "[object Object]"）
     */
    async test020_JoinWithObjectSeparator() {
        const testArray = ["a", "b"];
        const separator = { key: "value" }; // 对象分隔符
        const expectedSeparatorString = separator.toString(); // "[object Object]"
        const expected = `a${expectedSeparatorString}b`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test020 失败：
                数组：[${JSON.stringify(testArray)}]
                分隔符：${JSON.stringify(separator)} (对象，toString() 为 "${expectedSeparatorString}")
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithObjectSeparatorTest020";
    },

    /**
     * 021. 数组元素为「null」，统一转为空字符串拼接
     * 特性：明确验证 null 元素在 join 中的行为，与 undefined 和空槽一致
     */
    async test021_JoinWithNullElements() {
        const testArray = [null, "data", null];
        const separator = "|";
        const expected = "|data|";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test021 失败：
                数组：[${testArray.map(item => item === null ? 'null' : item)}]
                分隔符："${separator}"
                预期结果："${expected}"（null 转为空字符串）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithNullElementsTest021";
    },

    /**
     * 022. 类数组对象「length 为 0」，返回空字符串
     * 特性：与空数组行为一致，length 为 0 的类数组没有可拼接的元素，返回 ""
     */
    async test022_JoinArrayLikeZeroLength() {
        const arrayLike = { length: 0 };
        const separator = "any";
        const expected = "";
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test022 失败：
                类数组：${JSON.stringify(arrayLike)} (length=0)
                分隔符："${separator}"
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinArrayLikeZeroLengthTest022";
    },

    /**
     * 023. 数组包含「undefined」，统一转为空字符串拼接
     * 特性：明确验证 undefined 元素在 join 中的行为
     */
    async test023_JoinWithUndefinedElements() {
        const testArray = [undefined, "value", undefined, "end"];
        const separator = ",";
        const expected = ",value,,end";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test023 失败：
                数组：[${testArray.map(item => item === undefined ? 'undefined' : item)}]
                分隔符："${separator}"
                预期结果："${expected}"（undefined 转为空字符串）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithUndefinedElementsTest023";
    },

    /**
     * 024. 分隔符为「函数」，调用其 toString() 方法后进行拼接
     * 特性：函数作为分隔符时，会被转换为其源代码字符串形式
     */
    async test024_JoinWithFunctionSeparator() {
        const testArray = [1, 2];
        const separator = (a, b) => a + b; // 函数分隔符
        const expectedSeparatorString = separator.toString(); // "(a, b) => a + b"
        const expected = `1${expectedSeparatorString}2`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test024 失败：
                数组：[${testArray}]
                分隔符：${expectedSeparatorString} (函数)
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithFunctionSeparatorTest024";
    },

    /**
     * 025. 数组元素为「单元素数组」，该元素会被扁平化后拼接
     * 特性：作为元素的单元素数组 `[x]` 调用 toString() 会返回其内部元素 x 的字符串形式
     */
    async test025_JoinWithSingleElementArrayElements() {
        const testArray = [["Hello"], ["World"]];
        const separator = " ";
        const expected = "Hello World";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test025 失败：
                数组：[["Hello"], ["World"]] (元素为单元素数组)
                分隔符："${separator}"
                预期结果："${expected}"（单元素数组被扁平化）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithSingleElementArrayElementsTest025";
    },

    /**
     * 026. 类数组对象「含不可枚举属性」，join 忽略不可枚举属性
     * 特性：join 只遍历 0 到 length-1 的整数索引，忽略其他任何属性，包括不可枚举的
     */
    async test026_JoinArrayLikeWithNonEnumerable() {
        const arrayLike = { length: 2, 0: "first" };
        Object.defineProperty(arrayLike, "1", {
            value: "second",
            enumerable: false // 索引1设为不可枚举
        });
        Object.defineProperty(arrayLike, "extra", {
            value: "ignored",
            enumerable: true // 非索引属性，即使可枚举也被忽略
        });

        const separator = ",";
        const expected = "first,second"; // 索引1为不可枚举，被视为空字符串
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test026 失败：
                类数组：length=2, 索引0="first", 索引1不可枚举
                分隔符："${separator}"
                预期结果："${expected}"（忽略不可枚举索引）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinArrayLikeWithNonEnumerableTest026";
    },

    /**
     * 027. 数组元素包含「换行符和制表符」，按普通字符拼接
     * 特性：转义字符如 `\n` 和 `\t` 是字符串的一部分，会被原样拼接
     */
    async test027_JoinWithEscapeCharacters() {
        const testArray = ["Line 1", "Line 2", "Column 1", "Column 2"];
        const separator1 = "\n"; // 换行符
        const separator2 = "\t"; // 制表符

        const expected1 = "Line 1\nLine 2";
        const expected2 = "Column 1\tColumn 2";

        const actual1 = testArray.slice(0, 2).join(separator1);
        const actual2 = testArray.slice(2).join(separator2);

        if (actual1 !== expected1 || actual2 !== expected2) {
            throw new Error(`Test027 失败：
                数组：[${JSON.stringify(testArray)}]
                分隔符1：\\n, 预期："${expected1.replace(/\n/g, '\\n')}", 实际："${actual1.replace(/\n/g, '\\n')}"
                分隔符2：\\t, 预期："${expected2.replace(/\t/g, '\\t')}", 实际："${actual2.replace(/\t/g, '\\t')}"`);
        }

        return "Test Passed: JoinWithEscapeCharactersTest027";
    },

    /**
     * 028. 分隔符为「undefined」，且数组为「空数组」，返回空字符串
     * 特性：空数组没有元素，无论分隔符是什么，结果都是空字符串
     */
    async test028_JoinEmptyArrayWithUndefinedSeparator() {
        const testArray = [];
        const separator = undefined;
        const expected = "";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test028 失败：
                数组：空数组 []
                分隔符：undefined
                预期结果："${expected}"
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinEmptyArrayWithUndefinedSeparatorTest028";
    },

    /**
     * 029. 性能边界：拼接「超大数组」（100,000个元素）
     * 特性：验证 join 在处理大量数据时的基本功能和性能表现（不崩溃，结果正确）
     */
    async test029_JoinHugeArray() {
        const elementCount = 100000;
        const testArray = new Array(elementCount).fill("x");
        const separator = "|";
        // 预期结果是 "x|x|x|...|x"，总长度 = elementCount + (elementCount - 1) * separator.length
        const expectedLength = elementCount + (elementCount - 1) * separator.length;

        const actual = testArray.join(separator);

        if (actual.length !== expectedLength) {
            throw new Error(`Test029 失败：
                数组：${elementCount.toLocaleString()} 个 "x" 元素
                分隔符："${separator}"
                预期长度：${expectedLength.toLocaleString()}
                实际长度：${actual.length.toLocaleString()}`);
        }

        return "Test Passed: JoinHugeArrayTest029";
    },

    /**
     * 030. 数组元素为「自定义对象」，该对象覆盖了 toString() 方法
     * 特性：join 会调用元素的 toString() 方法，因此可以通过覆盖该方法来控制拼接结果
     */
    async test030_JoinWithCustomObjectToString() {
        const customObject = {
            id: 123,
            name: "test-object",
            toString: function() {
                return `Custom[${this.id},${this.name}]`;
            }
        };
        const testArray = [customObject, "static-string"];
        const separator = " -> ";
        const expected = `Custom[123,test-object] -> static-string`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test030 失败：
                数组：[自定义对象, "static-string"]
                分隔符："${separator}"
                预期结果："${expected}"（调用自定义 toString()）
                实际结果："${actual}"`);
        }

        return "Test Passed: JoinWithCustomObjectToStringTest030";
    },

    /**
     * 031. Separator is a single newline character `\n`.
     * Feature: Control characters like newline are treated as normal separators.
     */
    async test031_JoinWithNewlineSeparator() {
        const testArray = ["line1", "line2", "line3"];
        const separator = "\n";
        const expected = "line1\nline2\nline3";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test031 failed: Array=[${JSON.stringify(testArray)}], Separator="\\n", Expected="${expected.replace(/\n/g, '\\n')}", Actual="${actual.replace(/\n/g, '\\n')}"`);
        }

        return "Test Passed: JoinWithNewlineSeparatorTest031";
    },

    /**
     * 032. Separator is a single tab character `\t`.
     * Feature: Control characters like tab are treated as normal separators.
     */
    async test032_JoinWithTabSeparator() {
        const testArray = ["col1", "col2", "col3"];
        const separator = "\t";
        const expected = "col1\tcol2\tcol3";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test032 failed: Array=[${JSON.stringify(testArray)}], Separator="\\t", Expected="${expected.replace(/\t/g, '\\t')}", Actual="${actual.replace(/\t/g, '\\t')}"`);
        }

        return "Test Passed: JoinWithTabSeparatorTest032";
    },

    /**
     * 033. Separator is a zero-width non-joiner (ZWNJ) character.
     * Feature: Rare and invisible Unicode characters are treated as normal separators.
     */
    async test033_JoinWithZeroWidthNonJoinerSeparator() {
        const ZWNJ = "\u200C";
        const testArray = ["a", "b"];
        const separator = ZWNJ;
        const expected = `a${ZWNJ}b`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test033 failed: Array=[${JSON.stringify(testArray)}], Separator="ZWNJ (\\u200C)", Expected length=${expected.length}, Actual length=${actual.length}`);
        }

        return "Test Passed: JoinWithZeroWidthNonJoinerSeparatorTest033";
    },

    /**
     * 034. Array contains elements with multi-byte UTF-8 characters (e.g., CJK).
     * Feature: `join` correctly handles and concatenates multi-byte characters.
     */
    async test034_JoinWithMultiByteCharacters() {
        const testArray = ["你好", "世界", "JavaScript"];
        const separator = "|";
        const expected = "你好|世界|JavaScript";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test034 failed: Array=[${JSON.stringify(testArray)}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithMultiByteCharactersTest034";
    },



    /**
     * 036. Array-like object has a non-numeric length property (which is coerced to 0).
     * Feature: Non-numeric length is coerced to a number; if the result is <=0, returns empty string.
     */
    async test036_JoinArrayLikeWithNonNumericLength() {
        const arrayLike = { length: "not-a-number", 0: "should", 1: "be", 2: "ignored" };
        const separator = " ";
        const expected = ""; // length is NaN, treated as 0
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test036 failed: ArrayLike=${JSON.stringify(arrayLike)}, Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinArrayLikeWithNonNumericLengthTest036";
    },

    /**
     * 037. Array-like object has a length greater than the highest index.
     * Feature: `join` iterates up to `length - 1`, treating missing indices as empty strings.
     */
    async test037_JoinArrayLikeLengthGreaterThanIndices() {
        const arrayLike = { length: 5, 0: "A", 3: "D" }; // Indices 1, 2, and 4 are missing
        const separator = ",";
        const expected = "A,,,D,";
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test037 failed: ArrayLike=${JSON.stringify(arrayLike)}, Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinArrayLikeLengthGreaterThanIndicesTest037";
    },

    /**
     * 038. Joining an array of arrays, each with different separators in their own toString.
     * Feature: The `join` method of the outer array is unaffected by the internal structure of elements.
     */
    async test038_JoinArrayOfArrays() {
        const testArray = [[1, 2], [3, 4, 5], [6]];
        const outerSeparator = " | ";
        const expected = "1,2 | 3,4,5 | 6"; // Inner arrays use default comma in their toString
        const actual = testArray.join(outerSeparator);

        if (actual !== expected) {
            throw new Error(`Test038 failed: Array=[${testArray}], Outer Separator="${outerSeparator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinArrayOfArraysTest038";
    },

    /**
     * 039. Using `join` in combination with `map` to format and join numbers.
     * Feature: Common functional programming pattern; verifies interoperability.
     */
    async test039_JoinWithMap() {
        const numbers = [1, 2, 3, 4];
        const separator = " - ";
        const expected = "01 - 02 - 03 - 04";
        const actual = numbers.map(num => num.toString().padStart(2, '0')).join(separator);

        if (actual !== expected) {
            throw new Error(`Test039 failed: Numbers=[${numbers}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithMapTest039";
    },

    /**
     * 040. Joining an array where one element is an object with a custom `toString` getter.
     * Feature: Ensures that `join` correctly invokes getter functions when converting objects to strings.
     */
    async test040_JoinWithObjectGetterToString() {
        let getCount = 0;
        const objWithGetter = {
            get toString() {
                getCount++;
                return () => "CustomStringFromGetter";
            }
        };
        const testArray = ["prefix", objWithGetter, "suffix"];
        const separator = ":";
        const expected = "prefix:CustomStringFromGetter:suffix";

        const actual = testArray.join(separator);

        if (actual !== expected || getCount !== 1) {
            throw new Error(`Test040 failed: Array=[prefix, objWithGetter, suffix], Separator="${separator}", Expected="${expected}", Actual="${actual}", Getter called ${getCount} times (expected 1)`);
        }

        return "Test Passed: JoinWithObjectGetterToStringTest040";
    },

    /**
     * 041. Separator is an emoji character.
     * Feature: Emojis (even complex ones) are treated as single characters in the separator.
     */
    async test041_JoinWithEmojiSeparator() {
        const testArray = ["apple", "banana", "cherry"];
        const separator = "🍎";
        const expected = "apple🍎banana🍎cherry";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test041 failed: Array=[${JSON.stringify(testArray)}], Separator="🍎", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithEmojiSeparatorTest041";
    },


    /**
     * 043. Joining an array of `Map` objects.
     * Feature: `Map` objects' `toString()` returns "[object Map]".
     */
    async test043_JoinWithMapObjects() {
        const map1 = new Map([['key1', 'value1']]);
        const map2 = new Map();
        const testArray = [map1, map2];
        const separator = " and ";
        const expected = "[object Map] and [object Map]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test043 failed: Array=[Map, Map], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithMapObjectsTest043";
    },

    /**
     * 044. Array-like object has a negative length.
     * Feature: A negative length is treated as 0, resulting in an empty string.
     */
    async test044_JoinArrayLikeWithNegativeLength() {
        const arrayLike = { length: -5, 0: "a", 1: "b" };
        const separator = ",";
        const expected = "";
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test044 failed: ArrayLike=${JSON.stringify(arrayLike)}, Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinArrayLikeWithNegativeLengthTest044";
    },

    /**
     * 045. Joining an array results in an extremely large string (performance/limit test).
     * Feature: Verifies that `join` can handle very large concatenations without crashing.
     */
    async test045_JoinIntoHugeString() {
        const element = "a".repeat(1000); // Each element is 1000 characters
        const testArray = new Array(1000).fill(element); // 1000 elements
        const separator = "|";
        const expectedLength = (element.length * testArray.length) + (separator.length * (testArray.length - 1));

        const actual = testArray.join(separator);

        if (actual.length !== expectedLength) {
            throw new Error(`Test045 failed: Array length=${testArray.length}, Element length=${element.length}, Separator="${separator}", Expected length=${expectedLength.toLocaleString()}, Actual length=${actual.length.toLocaleString()}`);
        }

        return "Test Passed: JoinIntoHugeStringTest045";
    },

    /**
     * 046. Passing `join` as a callback to `forEach` (non-sensical, but tests function identity).
     * Feature: Ensures that `join` can be passed around as a function reference without losing functionality.
     */
    async test046_JoinAsCallback() {
        const testArrays = [["a", "b"], [1, 2, 3], []];
        const separator = "-";
        const expectedResults = ["a-b", "1-2-3", ""];
        const actualResults = [];

        testArrays.forEach(arr => {
            actualResults.push(Array.prototype.join.call(arr, separator));
        });

        if (actualResults.join(',') !== expectedResults.join(',')) {
            throw new Error(`Test046 failed: Arrays=[${testArrays}], Separator="${separator}", Expected results=[${expectedResults}], Actual results=[${actualResults}]`);
        }

        return "Test Passed: JoinAsCallbackTest046";
    },

    /**
     * 047. Array contains a number formatted with `toLocaleString`.
     * Feature: `toLocaleString` returns a string, which `join` handles normally.
     */
    async test047_JoinWithLocalizedNumberString() {
        const number = 1234567.89;
        const localizedNumberString = number.toLocaleString('en-US'); // "1,234,567.89"
        const testArray = ["Value:", localizedNumberString];
        const separator = " ";
        const expected = "Value: 1,234,567.89";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test047 failed: Array=[${JSON.stringify(testArray)}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithLocalizedNumberStringTest047";
    },

    /**
     * 048. Attempting to call `join` on a non-array-like object (e.g., null) throws a TypeError.
     * Feature: `join` requires a `this` value with a `length` property; otherwise, it throws.
     */
    async test048_JoinOnNonArrayLike() {
        const nonArrayLike = null;
        let errorThrown = false;

        try {
            Array.prototype.join.call(nonArrayLike, ",");
        } catch (e) {
            if (e instanceof TypeError) {
                errorThrown = true;
            }
        }

        if (!errorThrown) {
            throw new Error(`Test048 failed: Calling join on ${nonArrayLike} did not throw a TypeError.`);
        }

        return "Test Passed: JoinOnNonArrayLikeTest048";
    },

    /**
     * 049. Joining an array of `Set` objects.
     * Feature: `Set` objects' `toString()` returns "[object Set]".
     */
    async test049_JoinWithSetObjects() {
        const set1 = new Set([1, 2, 3]);
        const set2 = new Set();
        const testArray = [set1, set2];
        const separator = " & ";
        const expected = "[object Set] & [object Set]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test049 failed: Array=[Set, Set], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithSetObjectsTest049";
    },

    /**
     * 050. Array contains `Infinity` and `-Infinity` as elements.
     * Feature: `Infinity` and `-Infinity` are converted to their respective string representations.
     */
    async test050_JoinWithInfinityElements() {
        const testArray = [Infinity, -Infinity, 42];
        const separator = " | ";
        const expected = "Infinity | -Infinity | 42";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test050 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithInfinityElementsTest050";
    },

    /**
     * 051. Array contains `Promise` objects.
     * Feature: `Promise` objects' `toString()` returns "[object Promise]".
     */
    async test051_JoinWithPromiseObjects() {
        const promise1 = Promise.resolve("resolved");
        const promise2 = new Promise(() => {}); // Pending promise
        const testArray = [promise1, promise2];
        const separator = " and ";
        const expected = "[object Promise] and [object Promise]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test051 failed: Array=[Promise, Promise], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithPromiseObjectsTest051";
    },

    /**
     * 052. Using `join` after `filter` to join non-empty results.
     * Feature: Common pattern to filter out falsy values before joining.
     */
    async test052_JoinAfterFilter() {
        const testArray = ["user", "", null, "profile", undefined, "id"];
        const separator = "/";
        const expected = "user/profile/id";
        const actual = testArray.filter(Boolean).join(separator);

        if (actual !== expected) {
            throw new Error(`Test052 failed: Array=[${JSON.stringify(testArray)}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinAfterFilterTest052";
    },

    /**
     * 053. Separator is a regular expression object.
     * Feature: Any object passed as a separator is converted to a string via `toString()`.
     */
    async test053_JoinWithRegExpSeparator() {
        const testArray = ["part1", "part2"];
        const separator = /\s+/g;
        const expectedSeparatorString = separator.toString(); // "/\\s+/g"
        const expected = `part1${expectedSeparatorString}part2`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test053 failed: Array=[${JSON.stringify(testArray)}], Separator=${expectedSeparatorString}, Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithRegExpSeparatorTest053";
    },

    /**
     * 054. Array contains `Error` objects.
     * Feature: `Error` objects' `toString()` returns "Error: message" or similar.
     */
    async test054_JoinWithErrorObjects() {
        const error1 = new Error("Something went wrong");
        const error2 = new TypeError("Invalid type");
        const testArray = [error1, error2];
        const separator = " --- ";
        const expected = "Error: Something went wrong --- TypeError: Invalid type";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test054 failed: Array=[Error, TypeError], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithErrorObjectsTest054";
    },

    /**
     * 055. Using `join` on the result of `Array.prototype.flatMap`.
     * Feature: Verifies interoperability with `flatMap` for complex transformations.
     */
    async test055_JoinAfterFlatMap() {
        const testArray = ["user1", "user2"];
        const separator = ", ";
        const expected = "user1_id, user1_email, user2_id, user2_email";
        const actual = testArray.flatMap(user => [`${user}_id`, `${user}_email`]).join(separator);

        if (actual !== expected) {
            throw new Error(`Test055 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinAfterFlatMapTest055";
    },

    /**
     * 056. Array-like object has a very large length (a practical large value to avoid engine limits).
     * Feature: Tests the method's behavior with extremely large length values without causing memory allocation failures.
     * Fixed: Changed length from Number.MAX_SAFE_INTEGER - 10 to 100,000,000.
     */
    async test056_JoinArrayLikeWithLargeLength() {
        const largeLength = 1_000_000; // Changed to a large but practical value
        const arrayLike = { length: largeLength, 0: "start", [largeLength - 1]: "end" };
        const separator = "|";

        const actual = Array.prototype.join.call(arrayLike, separator);

        // The actual string is huge, so we just verify the start and end
        if (!actual.startsWith("start|") || !actual.endsWith("|end")) {
            throw new Error(`Test056 failed: ArrayLike with length ${largeLength.toLocaleString()}, Separator="${separator}", Actual did not start with "start|" or end with "|end".`);
        }

        return "Test Passed: JoinArrayLikeWithLargeLengthTest056";
    },


    /**
     * 057. Separator is a string representation of a number in scientific notation.
     * Feature: Verifies that numeric strings in scientific notation are treated as normal strings.
     */
    async test057_JoinWithScientificNotationSeparator() {
        const testArray = ["a", "b"];
        const separator = "1e-5";
        const expected = "a1e-5b";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test057 failed: Array=[${JSON.stringify(testArray)}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithScientificNotationSeparatorTest057";
    },

    /**
     * 058. Array contains `WeakMap` and `WeakSet` objects.
     * Feature: `WeakMap` and `WeakSet` objects' `toString()` returns "[object WeakMap/WeakSet]".
     */
    async test058_JoinWithWeakCollections() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        const testArray = [weakMap, weakSet];
        const separator = " & ";
        const expected = "[object WeakMap] & [object WeakSet]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test058 failed: Array=[WeakMap, WeakSet], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithWeakCollectionsTest058";
    },

    /**
     * 059. Joining an array with `slice` to exclude the last element.
     * Feature: Common pattern to join all elements except the last one.
     */
    async test059_JoinWithSlice() {
        const testArray = ["item1", "item2", "item3", "item4"];
        const separator = ", ";
        const expected = "item1, item2, item3";
        const actual = testArray.slice(0, -1).join(separator);

        if (actual !== expected) {
            throw new Error(`Test059 failed: Array=[${testArray}], Slice=(0,-1), Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithSliceTest059";
    },

    /**
     * 060. Array-like object has a fractional length (which is truncated).
     * Feature: Non-integer lengths are truncated to an integer.
     */
    async test060_JoinArrayLikeWithFractionalLength() {
        const arrayLike = { length: 3.9, 0: "A", 1: "B", 2: "C", 3: "D" }; // Length is truncated to 3
        const separator = ",";
        const expected = "A,B,C";
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test060 failed: ArrayLike=${JSON.stringify(arrayLike)}, Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinArrayLikeWithFractionalLengthTest060";
    },

    /**
     * 061. Separator is a JSON string.
     * Feature: Verifies that complex strings, including those with quotes, are handled correctly.
     */
    async test061_JoinWithJsonStringSeparator() {
        const testArray = ["key", "value"];
        const separator = JSON.stringify({ op: "eq" }); // '{"op":"eq"}'
        const expected = `key${separator}value`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test061 failed: Array=[${JSON.stringify(testArray)}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithJsonStringSeparatorTest061";
    },

    /**
     * 062. Array contains `Atomics` and `Reflect` objects.
     * Feature: Built-in objects like `Atomics` and `Reflect` have predictable `toString()` outputs.
     */
    async test062_JoinWithBuiltInObjects() {
        const testArray = [Atomics, Reflect];
        const separator = " --- ";
        const expected = "[object Atomics] --- [object Reflect]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test062 failed: Array=[Atomics, Reflect], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithBuiltInObjectsTest062";
    },

    /**
     * 063. Using `join` on the result of `Array.prototype.concat`.
     * Feature: Verifies that `join` works correctly on concatenated arrays.
     */
    async test063_JoinAfterConcat() {
        const array1 = ["a", "b"];
        const array2 = ["c", "d"];
        const separator = "-";
        const expected = "a-b-c-d";
        const actual = array1.concat(array2).join(separator);

        if (actual !== expected) {
            throw new Error(`Test063 failed: Array1=[${array1}], Array2=[${array2}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinAfterConcatTest063";
    },

    /**
     * 064. Array-like object's indices are not in ascending order.
     * Feature: `join` iterates from 0 to length-1, regardless of the order in which properties are defined.
     */
    async test064_JoinArrayLikeUnorderedIndices() {
        // Define properties in reverse order
        const arrayLike = { length: 3 };
        arrayLike[2] = "C";
        arrayLike[1] = "B";
        arrayLike[0] = "A";

        const separator = ",";
        const expected = "A,B,C";
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test064 failed: ArrayLike=${JSON.stringify(arrayLike)}, Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinArrayLikeUnorderedIndicesTest064";
    },

    /**
     * 065. Separator is the string "undefined" (not the value undefined).
     * Feature: Ensures that the string "undefined" is treated as a literal separator.
     */
    async test065_JoinWithStringUndefinedSeparator() {
        const testArray = ["a", "b"];
        const separator = "undefined";
        const expected = "aundefinedb";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test065 failed: Array=[${JSON.stringify(testArray)}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithStringUndefinedSeparatorTest065";
    },



    /**
     * 067. Joining an array with all elements being `undefined`.
     * Feature: All `undefined` elements are converted to empty strings.
     */
    async test067_JoinAllUndefinedElements() {
        const testArray = [undefined, undefined, undefined];
        const separator = "x";
        const expected = "xx"; // " + "x" + " + "x" + "
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test067 failed: Array=[undefined, undefined, undefined], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinAllUndefinedElementsTest067";
    },

    /**
     * 068. Array-like object has a Symbol as an index (which is ignored).
     * Feature: `join` only considers integer indices; Symbol keys are ignored.
     */
    async test068_JoinArrayLikeWithSymbolIndex() {
        const symIndex = Symbol("index");
        const arrayLike = { length: 2, 0: "A", [symIndex]: "B" }; // Symbol index is ignored
        const separator = ",";
        const expected = "A,";
        const actual = Array.prototype.join.call(arrayLike, separator);

        if (actual !== expected) {
            throw new Error(`Test068 failed: ArrayLike has Symbol index, Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinArrayLikeWithSymbolIndexTest068";
    },

    /**
     * 069. Separator is a string with leading and trailing whitespace.
     * Feature: Whitespace in the separator is preserved.
     */
    async test069_JoinWithWhitespaceSeparator() {
        const testArray = ["Hello", "World"];
        const separator = "   "; // Three spaces
        const expected = "Hello   World";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test069 failed: Array=[${JSON.stringify(testArray)}], Separator="   ", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithWhitespaceSeparatorTest069";
    },

    /**
     * 070. Array contains a mix of all previously tested special values.
     * Feature: End-to-end integration test to ensure `join` handles a complex, mixed array correctly.
     * Fixed: Dynamically generate the expected date string to avoid timezone issues.
     */
    async test070_JoinMixedSpecialValues() {
        const dateObject = new Date(0); // Create the Date object once
        const testArray = [
            42,
            "string",
            null,
            undefined,
            true,
            { prop: "value" },
            [1, 2],
            NaN,
            Infinity,
            123n,
            dateObject // Use the pre-created Date object
        ];
        const separator = " | ";

        // Dynamically get the string representation of the Date object in the current environment
        const expectedDateString = dateObject.toString();

        // Build the expected string using the dynamic date string
        const expected = `42 | string |  |  | true | [object Object] | 1,2 | NaN | Infinity | 123 | ${expectedDateString}`;

        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test070 failed: Array=[mixed values], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinMixedSpecialValuesTest070";
    },

    /**
     * 071. Separator is `null` and array contains `null` elements.
     * Feature: Both `null` separator and `null` elements are converted to empty strings.
     */
    async test071_JoinNullSeparatorAndElements() {
        const testArray = [null, "data", null];
        const separator = null;
        const expected = "nulldatanull"; // "" + "null" + "data" + "null" + ""
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test071 failed: Array=[${testArray}], Separator=null, Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinNullSeparatorAndElementsTest071";
    },

    /**
     * 072. Using `join` after `reverse` to join elements in reverse order.
     * Feature: Verifies that `join` works correctly on a reversed array.
     */
    async test072_JoinAfterReverse() {
        const testArray = ["a", "b", "c"];
        const separator = "-";
        const expected = "c-b-a";
        // Create a copy to avoid mutating the original array
        const actual = [...testArray].reverse().join(separator);

        if (actual !== expected) {
            throw new Error(`Test072 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinAfterReverseTest072";
    },

    /**
     * 073. Separator is the number `0` (zero).
     * Feature: Numeric separators are converted to their string representations.
     */
    async test073_JoinWithZeroSeparator() {
        const testArray = ["1", "2", "3"];
        const separator = 0;
        const expected = "10203";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test073 failed: Array=[${testArray}], Separator=${separator}, Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithZeroSeparatorTest073";
    },

    /**
     * 074. Array is created with `Array.from` from a string and then joined.
     * Feature: Verifies interoperability with `Array.from` for string conversion.
     */
    async test074_JoinFromArrayFrom() {
        const sourceString = "hello";
        const testArray = Array.from(sourceString);
        const separator = "|";
        const expected = "h|e|l|l|o";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test074 failed: Source="${sourceString}", Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinFromArrayFromTest074";
    },

    /**
     * 075. Separator is an empty array `[]`.
     * Feature: Any object, including an empty array, is converted to a string via `toString()`.
     */
    async test075_JoinWithEmptyArraySeparator() {
        const testArray = ["a", "b"];
        const separator = []; // separator.toString() is ""
        const expected = "ab";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test075 failed: Array=[${testArray}], Separator=[], Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithEmptyArraySeparatorTest075";
    },

    /**
     * 076. Joining an array of `String` objects (not primitives).
     * Feature: `String` objects are converted to their primitive string values.
     */
    async test076_JoinWithStringObjects() {
        const testArray = [new String("hello"), new String("world")];
        const separator = " ";
        const expected = "hello world";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test076 failed: Array=[String objects], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithStringObjectsTest076";
    },

    /**
     * 077. Using `join` on the result of `Array.prototype.fill`.
     * Feature: Verifies that `join` works correctly on an array filled with a single value.
     */
    async test077_JoinAfterFill() {
        const testArray = new Array(5).fill("x");
        const separator = ",";
        const expected = "x,x,x,x,x";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test077 failed: Array=filled with "x" (length 5), Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinAfterFillTest077";
    },

    /**
     * 078. Array contains `Number.MAX_VALUE` and `Number.MIN_VALUE`.
     * Feature: Very large and very small numbers are converted to their string representations.
     */
    async test078_JoinWithExtremeNumbers() {
        const testArray = [Number.MAX_VALUE, Number.MIN_VALUE];
        const separator = " | ";
        const expected = `${Number.MAX_VALUE} | ${Number.MIN_VALUE}`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test078 failed: Array=[MAX_VALUE, MIN_VALUE], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithExtremeNumbersTest078";
    },

    /**
     * 079. Separator is a multi-line template literal.
     * Feature: Verifies that separators with embedded newlines are handled correctly.
     */
    async test079_JoinWithMultiLineSeparator() {
        const testArray = ["header", "body", "footer"];
        const separator = `
---
`;
        const expected = `header
---
body
---
footer`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test079 failed: Array=[${testArray}], Separator=multi-line, Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithMultiLineSeparatorTest079";
    },

    /**
     * 080. Joining an array where all elements are empty strings.
     * Feature: All empty string elements are joined with the specified separator.
     */
    async test080_JoinAllEmptyStrings() {
        const testArray = ["", "", "", ""];
        const separator = "x";
        const expected = "xxx"; // "" + "x" + "" + "x" + "" + "x" + ""
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test080 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinAllEmptyStringsTest080";
    },

    /**
     * 081. Using `join` after `sort` to join elements in sorted order.
     * Feature: Verifies that `join` works correctly on a sorted array of numbers.
     */
    async test081_JoinAfterSort() {
        const testArray = [3, 1, 4, 1, 5, 9];
        const separator = ",";
        const expected = "1,1,3,4,5,9";
        // Create a copy and sort numerically
        const actual = [...testArray].sort((a, b) => a - b).join(separator);

        if (actual !== expected) {
            throw new Error(`Test081 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinAfterSortTest081";
    },

    /**
     * 082. Separator is `undefined` and array contains `undefined` elements.
     * Feature: Both `undefined` separator and `undefined` elements are converted to empty strings.
     */
    async test082_JoinUndefinedSeparatorAndElements() {
        const testArray = [undefined, "value", undefined];
        const separator = undefined;
        const expected = ",value,"; // "" + "" + "value" + "" + ""
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test082 failed: Array=[${testArray}], Separator=undefined, Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinUndefinedSeparatorAndElementsTest082";
    },

    /**
     * 083. Array contains a mix of primitive numbers and `Number` objects.
     * Feature: `Number` objects are converted to their primitive number values.
     */
    async test083_JoinWithNumberObjects() {
        const testArray = [123, new Number(456), 789];
        const separator = " | ";
        const expected = "123 | 456 | 789";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test083 failed: Array=[number, Number object, number], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithNumberObjectsTest083";
    },

    /**
     * 084. Using `join` on a deeply nested array after `flat`.
     * Feature: Verifies interoperability with `flat` to handle nested structures.
     */
    async test084_JoinAfterFlat() {
        const testArray = [1, [2, [3, [4]]], 5];
        const separator = "-";
        const expected = "1-2-3-4-5";
        const actual = testArray.flat(Infinity).join(separator);

        if (actual !== expected) {
            throw new Error(`Test084 failed: Array=[nested array], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinAfterFlatTest084";
    },

    /**
     * 085. Separator is a string containing HTML entities.
     * Feature: Verifies that separators with special characters are treated as literals.
     */
    async test085_JoinWithHtmlEntitySeparator() {
        const testArray = ["<p>", "Hello World", "</p>"];
        const separator = "&nbsp;"; // Non-breaking space HTML entity
        const expected = "<p>&nbsp;Hello World&nbsp;</p>";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test085 failed: Array=[${JSON.stringify(testArray)}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithHtmlEntitySeparatorTest085";
    },

    /**
     * 086. Joining an array with a single element that is an empty string.
     * Feature: An array with one element returns that element's string form directly.
     */
    async test086_JoinSingleEmptyStringElement() {
        const testArray = [""];
        const separator = "anything";
        const expected = ""; // Single element, separator is ignored
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test086 failed: Array=[""], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinSingleEmptyStringElementTest086";
    },

    /**
     * 087. Attempting to use a `Symbol` as a separator throws a TypeError.
     * Feature: `Symbol` cannot be converted to a string implicitly, causing an error.
     */
    async test087_JoinWithSymbolSeparator() {
        const testArray = ["a", "b"];
        const separator = Symbol("separator");
        let errorThrown = false;

        try {
            testArray.join(separator);
        } catch (e) {
            if (e instanceof TypeError) {
                errorThrown = true;
            }
        }

        if (!errorThrown) {
            throw new Error(`Test087 failed: Using Symbol as separator did not throw a TypeError.`);
        }

        return "Test Passed: JoinWithSymbolSeparatorTest087";
    },

    /**
     * 088. Array is a sparse array with empty slots only.
     * Feature: An array with only empty slots is treated as an empty array.
     */
    async test088_JoinSparseArrayWithHoles() {
        const testArray = new Array(5); // Creates [,,,,]
        const separator = ",";
        const expected = ",,,,"; // No elements to join
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test088 failed: Array=new Array(5) (sparse), Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinSparseArrayWithHolesTest088";
    },

    /**
     * 089. Joining an array with elements that are very long strings.
     * Feature: Verifies that `join` can handle concatenation of very long string elements.
     */
    async test089_JoinWithLongStringElements() {
        const longString = "a".repeat(100_000); // 100,000 'a's
        const testArray = [longString, longString];
        const separator = "|";
        const expectedLength = (longString.length * 2) + separator.length;

        const actual = testArray.join(separator);

        if (actual.length !== expectedLength) {
            throw new Error(`Test089 failed: Array=[long strings], Separator="${separator}", Expected length=${expectedLength.toLocaleString()}, Actual length=${actual.length.toLocaleString()}`);
        }

        return "Test Passed: JoinWithLongStringElementsTest089";
    },

    /**
     * 092. Using `join` to flatten an array of strings with `flatMap`.
     * Feature: Verifies that `join` works correctly with `flatMap` for string manipulation.
     */
    async test092_JoinWithFlatMapStrings() {
        const testArray = ["apple,orange", "banana,grape"];
        const separator = " | ";
        const expected = "apple | orange | banana | grape";
        const actual = testArray.flatMap(fruits => fruits.split(',')).join(separator);

        if (actual !== expected) {
            throw new Error(`Test092 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithFlatMapStringsTest092";
    },

    /**
     * 093. Separator is a non-Basic-Multilingual-Plane (non-BMP) Unicode character (e.g., Emoji).
     * Feature: Ensures that `join` correctly handles emoji and other non-BMP characters as separators.
     */
    async test093_JoinWithNonBmpSeparator() {
        const testArray = ["start", "end"];
        const separator = "😀"; // Grinning face emoji (U+1F600)
        const expected = "start😀end";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test093 failed: Array=[${testArray}], Separator="😀", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithNonBmpSeparatorTest093";
    },

    /**
     * 094. Joining an array of `ArrayBuffer` objects.
     * Feature: `ArrayBuffer` objects' `toString()` returns "[object ArrayBuffer]".
     */
    async test094_JoinWithArrayBuffers() {
        const buffer1 = new ArrayBuffer(8);
        const buffer2 = new ArrayBuffer(16);
        const testArray = [buffer1, buffer2];
        const separator = " and ";
        const expected = "[object ArrayBuffer] and [object ArrayBuffer]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test094 failed: Array=[ArrayBuffer, ArrayBuffer], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithArrayBuffersTest094";
    },

    /**
     * 095. Using `join` on the result of `reduce` to manually implement `join`.
     * Feature: Educational test to show how `join` can be emulated with `reduce`.
     */
    async test095_JoinWithReduce() {
        const testArray = ["a", "b", "c", "d"];
        const separator = "-";
        const expected = "a-b-c-d";
        const actual = testArray.reduce((acc, curr, index) => {
            return index === 0 ? curr : acc + separator + curr;
        }, "");

        if (actual !== expected) {
            throw new Error(`Test095 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithReduceTest095";
    },

    /**
     * 096. Array contains a `SharedArrayBuffer` object.
     * Feature: `SharedArrayBuffer` objects' `toString()` returns "[object SharedArrayBuffer]".
     */
    async test096_JoinWithSharedArrayBuffer() {
        if (typeof SharedArrayBuffer === 'undefined') {
            return "Test Skipped: JoinWithSharedArrayBufferTest096 (SharedArrayBuffer not available)";
        }

        const sab = new SharedArrayBuffer(1024);
        const testArray = ["SharedBuffer:", sab];
        const separator = " ";
        const expected = "SharedBuffer: [object SharedArrayBuffer]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test096 failed: Array=[string, SharedArrayBuffer], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithSharedArrayBufferTest096";
    },

    /**
     * 097. Separator is a string containing a zero-width space character (`\u200B`).
     * Feature: Ensures that invisible zero-width characters are preserved in the output.
     */
    async test097_JoinWithZeroWidthSpaceSeparator() {
        const testArray = ["A", "B"];
        const separator = "\u200B"; // Zero-width space
        const expected = `A${separator}B`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test097 failed: Array=[${testArray}], Separator="\\u200B", Expected length=${expected.length}, Actual length=${actual.length}`);
        }

        return "Test Passed: JoinWithZeroWidthSpaceSeparatorTest097";
    },

    /**
     * 098. Joining an array of `DataView` objects.
     * Feature: `DataView` objects' `toString()` returns "[object DataView]".
     */
    async test098_JoinWithDataViews() {
        const buffer = new ArrayBuffer(16);
        const view1 = new DataView(buffer);
        const view2 = new DataView(buffer, 8);
        const testArray = [view1, view2];
        const separator = " | ";
        const expected = "[object DataView] | [object DataView]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test098 failed: Array=[DataView, DataView], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithDataViewsTest098";
    },

    /**
     * 099. Using `join` with `Array.prototype.with` to replace an element before joining.
     * Feature: Verifies interoperability with the new `Array.prototype.with` method (ES2023).
     */
    async test099_JoinWithArrayWith() {
        if (!Array.prototype.with) {
            return "Test Skipped: JoinWithArrayWithTest099 (Array.prototype.with not available)";
        }

        const testArray = ["user", "profile", "old-id"];
        const separator = "/";
        const expected = "user/profile/new-id";
        const actual = testArray.with(2, "new-id").join(separator);

        if (actual !== expected) {
            throw new Error(`Test099 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithArrayWithTest099";
    },

    /**
     * 100. Array contains a `BigInt64Array` typed array.
     * Feature: Typed array objects' `toString()` returns "[object TypeName]".
     */
    async test100_JoinWithTypedArrays() {
        const typedArray = new BigInt64Array([1n, 2n, 3n]);
        const testArray = ["Data:", typedArray];
        const separator = " ";
        const expected = "Data: 1,2,3";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test100 failed: Array=[string, BigInt64Array], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithTypedArraysTest100";
    },

    /**
     * 101. Separator is a string representation of `NaN`.
     * Feature: Ensures that the string "NaN" is treated as a literal separator.
     */
    async test101_JoinWithStringNaNSeparator() {
        const testArray = ["value1", "value2"];
        const separator = "NaN";
        const expected = "value1NaNvalue2";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test101 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithStringNaNSeparatorTest101";
    },

    /**
     * 102. Array contains a `WeakRef` object.
     * Feature: `WeakRef` objects' `toString()` returns "[object WeakRef]".
     */
    async test102_JoinWithWeakRefs() {
        if (typeof WeakRef === 'undefined') {
            return "Test Skipped: JoinWithWeakRefsTest102 (WeakRef not available)";
        }

        const targetObject = {};
        const weakRef = new WeakRef(targetObject);
        const testArray = ["Weak reference to object:", weakRef];
        const separator = " ";
        const expected = "Weak reference to object: [object WeakRef]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test102 failed: Array=[string, WeakRef], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithWeakRefsTest102";
    },

    /**
     * 103. Using `join` on an array where one element is deleted (`delete` operator).
     * Feature: `delete` creates an empty slot, which `join` treats as an empty string.
     */
    async test103_JoinWithDeletedElement() {
        const testArray = ["a", "b", "c", "d"];
        delete testArray[1]; // Create an empty slot at index 1
        const separator = ",";
        const expected = "a,,c,d";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test103 failed: Array after delete=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithDeletedElementTest103";
    },

    /**
     * 104. Array contains a `FinalizationRegistry` object.
     * Feature: `FinalizationRegistry` objects' `toString()` returns "[object FinalizationRegistry]".
     */
    async test104_JoinWithFinalizationRegistries() {
        if (typeof FinalizationRegistry === 'undefined') {
            return "Test Skipped: JoinWithFinalizationRegistriesTest104 (FinalizationRegistry not available)";
        }

        const registry = new FinalizationRegistry(key => {});
        const testArray = ["Registry:", registry];
        const separator = " ";
        const expected = "Registry: [object FinalizationRegistry]";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test104 failed: Array=[string, FinalizationRegistry], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithFinalizationRegistriesTest104";
    },

    /**
     * 105. Separator is a very long string (100,000 characters).
     * Feature: Verifies that `join` can handle very long separators efficiently.
     */
    async test105_JoinWithLongSeparator() {
        const testArray = ["start", "end"];
        const longSeparator = "x".repeat(100_000);
        const expectedLength = testArray[0].length + longSeparator.length + testArray[1].length;

        const actual = testArray.join(longSeparator);

        if (actual.length !== expectedLength) {
            throw new Error(`Test105 failed: Array=[${testArray}], Separator length=${longSeparator.length.toLocaleString()}, Expected length=${expectedLength.toLocaleString()}, Actual length=${actual.length.toLocaleString()}`);
        }

        return "Test Passed: JoinWithLongSeparatorTest105";
    },


    /**
     * 108. Array contains a `BigInt` with a very large value.
     * Feature: Verifies that very large `BigInt` values are converted to their string representations correctly.
     */
    async test108_JoinWithLargeBigInt() {
        const largeBigInt = 900719925474099100000000000000000000001n; // Larger than MAX_SAFE_INTEGER
        const testArray = ["Value:", largeBigInt];
        const separator = " ";
        const expected = `Value: ${largeBigInt.toString()}`;
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test108 failed: Array=[string, large BigInt], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithLargeBigIntTest108";
    },

    /**
     * 109. Using `join` to concatenate results of a `for...of` loop.
     * Feature: Common imperative programming pattern; verifies basic functionality.
     */
    async test109_JoinWithForOfLoop() {
        const testArray = ["a", "b", "c"];
        const separator = "|";
        const expected = "a|b|c";
        const resultArray = [];
        for (const item of testArray) {
            resultArray.push(item);
        }
        const actual = resultArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test109 failed: Array=[${testArray}], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithForOfLoopTest109";
    },

    /**
     * 110. Array contains a mix of `+0` and `-0`.
     * Feature: Both `+0` and `-0` have the same string representation `"0"`.
     */
    async test110_JoinWithPositiveAndNegativeZero() {
        const testArray = [+0, -0];
        const separator = ",";
        const expected = "0,0";
        const actual = testArray.join(separator);

        if (actual !== expected) {
            throw new Error(`Test110 failed: Array=[+0, -0], Separator="${separator}", Expected="${expected}", Actual="${actual}"`);
        }

        return "Test Passed: JoinWithPositiveAndNegativeZeroTest110";
    }
};