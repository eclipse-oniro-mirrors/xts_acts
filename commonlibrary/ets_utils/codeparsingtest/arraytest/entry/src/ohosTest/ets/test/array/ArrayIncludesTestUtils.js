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

export const ArrayIncludesTestUtils = {
    /**
     * 001. 检测数组中「存在的数字」
     * 特性：基本类型匹配，数组包含目标数字时返回true
     */
    async test001_IncludesExistsNumber() {
        // 测试数据：包含目标值（6）的数组
        const testArray = [2, 4, 6, 8];
        const target = 6;
        const expected = true;

        // 执行includes调用
        const actual = testArray.includes(target);

        // 结果验证
        if (actual !== expected) {
            throw new Error(`Test001 失败：数组[${testArray}]，检测目标${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesExistsNumberTest001";
    },

    /**
     * 002. 检测数组中「不存在的字符串」
     * 特性：基本类型匹配，数组不含目标字符串时返回false
     */
    async test002_IncludesNotExistsString() {
        // 测试数据：不含目标值（"pear"）的数组
        const testArray = ["apple", "banana", "orange"];
        const target = "pear";
        const expected = false;

        // 执行includes调用
        const actual = testArray.includes(target);

        // 结果验证
        if (actual !== expected) {
            throw new Error(`Test002 失败：数组[${testArray}]，检测目标"${target}"，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesNotExistsStringTest002";
    },

    /**
     * 003. 检测数组中的「NaN」
     * 特性：支持NaN匹配（区别于indexOf，因NaN !== NaN但includes能识别）
     */
    async test003_IncludesSupportsNaN() {
        // 测试数据：包含NaN的数组
        const testArray = [3, NaN, 5, "NaN"];
        const target = NaN;
        const expected = true;

        // 执行includes调用（对比indexOf特性）
        const actual = testArray.includes(target);
        const indexOfResult = testArray.indexOf(target); // 预期-1（indexOf不支持NaN）

        // 结果验证
        if (actual !== expected) {
            throw new Error(`Test003 失败：数组含NaN，includes返回${actual}（预期${expected}），indexOf返回${indexOfResult}（作对比）`);
        }

        return "Test Passed: IncludesSupportsNaNTest003";
    },

    /**
     * 004. 处理「稀疏数组的空槽」
     * 特性：稀疏数组的空槽视为undefined，检测undefined时返回true
     */
    async test004_IncludesSparseArraySlot() {
        // 测试数据：稀疏数组（index1为空槽，无值）
        const testArray = [1, , 3]; // 注意：中间逗号代表空槽，非undefined
        const target = undefined;
        const expected = true;

        // 执行includes调用
        const actual = testArray.includes(target);

        // 结果验证
        if (actual !== expected) {
            throw new Error(`Test004 失败：稀疏数组[${testArray}]（index1为空槽），检测undefined，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesSparseArraySlotTest004";
    },

    /**
     * 005. 使用「正向fromIndex参数」
     * 特性：fromIndex指定起始位置，仅从该位置向后搜索
     */
    async test005_IncludesWithPositiveFromIndex() {
        // 测试数据：含重复值（5）的数组，从index3开始搜索
        const testArray = [5, 2, 3, 5, 4];
        const target = 5;
        const fromIndex = 3; // 起始位置：从index3开始，应匹配到index3的5
        const expected = true;

        // 执行includes调用（带fromIndex）
        const actual = testArray.includes(target, fromIndex);

        // 结果验证
        if (actual !== expected) {
            throw new Error(`Test005 失败：数组[${testArray}]，目标${target}，fromIndex=${fromIndex}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithPositiveFromIndexTest005";
    },

    /**
     * 006. 使用「超出数组长度的fromIndex」
     * 特性：fromIndex >= 数组长度时，无搜索范围，返回false
     */
    async test006_IncludesWithExceedFromIndex() {
        // 测试数据：长度为3的数组，fromIndex=5（超出长度）
        const testArray = [10, 20, 30];
        const target = 20;
        const fromIndex = 5; // 数组长度3，fromIndex=5超出范围
        const expected = false;

        // 执行includes调用
        const actual = testArray.includes(target, fromIndex);

        // 结果验证
        if (actual !== expected) {
            throw new Error(`Test006 失败：数组长度${testArray.length}，fromIndex=${fromIndex}，检测${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithExceedFromIndexTest006";
    },

    /**
     * 007. 使用「负向fromIndex参数」
     * 特性：负索引等价于「数组长度 + fromIndex」，作为起始位置
     */
    async test007_IncludesWithNegativeFromIndex() {
        // 测试数据：长度为5的数组，fromIndex=-2（等价5-2=3）
        const testArray = [2, 4, 6, 8, 10];
        const target = 8;
        const fromIndex = -2; // 实际起始索引：5 + (-2) = 3
        const expected = true;

        // 执行includes调用
        const actual = testArray.includes(target, fromIndex);
        const realStartIndex = testArray.length + fromIndex;

        // 结果验证
        if (actual !== expected) {
            throw new Error(`Test007 失败：数组长度${testArray.length}，fromIndex=${fromIndex}（实际起始${realStartIndex}），检测${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithNegativeFromIndexTest007";
    },

    /**
     * 008. 检测「引用类型（对象）」
     * 特性：引用类型需「严格相等（同一引用）」才返回true，值相同但引用不同返回false
     */
    async test008_IncludesReferenceObject() {
        // 测试数据：包含对象实例的数组
        const obj1 = { name: "test" }; // 数组中的对象
        const obj2 = { name: "test" }; // 新对象（值同但引用不同）
        const testArray = [obj1, 100];
        const expected1 = true; // 检测obj1（同一引用）
        const expected2 = false; // 检测obj2（不同引用）

        // 执行includes调用
        const actual1 = testArray.includes(obj1);
        const actual2 = testArray.includes(obj2);

        // 结果验证
        if (actual1 !== expected1 || actual2 !== expected2) {
            throw new Error(`Test008 失败：检测obj1（同一引用）预期${expected1}实际${actual1}，检测obj2（不同引用）预期${expected2}实际${actual2}`);
        }

        return "Test Passed: IncludesReferenceObjectTest008";
    },

    /**
     * 009. 检测「特殊值（undefined/null/空字符串）」
     * 特性：正确区分undefined、null、空字符串，不混淆
     */
    async test009_IncludesSpecialValues() {
        // 测试数据：包含特殊值的数组
        const testArray = ["", null, undefined, 0];
        const testCases = [
            { target: "", expected: true },
            { target: null, expected: true },
            { target: undefined, expected: true },
            { target: " ", expected: false } // 空格字符串（数组中不存在）
        ];

        // 批量验证
        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test009 失败：检测目标${JSON.stringify(target)}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesSpecialValuesTest009";
    },

    /**
     * 010. 处理「空数组」
     * 特性：空数组无任何元素，检测任何目标均返回false
     */
    async test010_IncludesEmptyArray() {
        // 测试数据：空数组
        const testArray = [];
        // 测试多种目标值
        const testTargets = [0, "a", NaN, null, undefined, {}, []];
        const expected = false;

        // 批量验证
        for (const target of testTargets) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test010 失败：空数组检测${JSON.stringify(target)}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesEmptyArrayTest010";
    },
    /**
     * 011. fromIndex为「0」（从数组开头搜索）
     * 特性：fromIndex=0等价于默认不指定，从第一个元素开始搜索
     */
    async test011_IncludesWithFromIndexZero() {
        const testArray = ["a", "b", "c"];
        const target = "b";
        const fromIndex = 0;
        const expected = true;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test011 失败：数组[${testArray}]，目标"${target}"，fromIndex=${fromIndex}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithFromIndexZeroTest011";
    },

    /**
     * 012. fromIndex为「负数且绝对值超数组长度」（等价于从开头搜索）
     * 特性：fromIndex < -array.length 时，等价于fromIndex=0，从开头搜索
     */
    async test012_IncludesWithFromIndexNegativeExceed() {
        const testArray = [10, 20, 30]; // 长度3
        const target = 10;
        const fromIndex = -5; // 绝对值5>3，等价于0
        const expected = true;

        const actual = testArray.includes(target, fromIndex);
        const realStart = testArray.length + fromIndex < 0 ? 0 : testArray.length + fromIndex;
        if (actual !== expected) {
            throw new Error(`Test012 失败：数组长度${testArray.length}，fromIndex=${fromIndex}（实际起始${realStart}），目标${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithFromIndexNegativeExceedTest012";
    },

    /**
     * 013. 检测「显式undefined（非空槽）」
     * 特性：数组含显式undefined时，includes(undefined)返回true（区别于空槽但结果一致）
     */
    async test013_IncludesExplicitUndefined() {
        const testArray = [5, undefined, 15]; // 显式undefined，非空槽
        const target = undefined;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test013 失败：数组[${testArray}]（含显式undefined），检测undefined，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesExplicitUndefinedTest013";
    },

    /**
     * 014. 检测「数组中不存在的null」
     * 特性：数组不含null时，includes(null)返回false（区分null与undefined）
     */
    async test014_IncludesNotExistsNull() {
        const testArray = [undefined, "", 0]; // 不含null
        const target = null;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test014 失败：数组[${testArray}]（不含null），检测null，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesNotExistsNullTest014";
    },

    /**
     * 015. 检测「嵌套数组（引用不匹配）」
     * 特性：嵌套数组是引用类型，新数组实例与数组内嵌套数组引用不同，返回false
     */
    async test015_IncludesNestedArrayNotMatch() {
        const nestedArr = [1, 2];
        const testArray = [nestedArr, 3, 4];
        const target = [1, 2]; // 新数组，引用不同
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test015 失败：数组含嵌套数组[1,2]，检测新数组[1,2]（引用不同），预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesNestedArrayNotMatchTest015";
    },

    /**
     * 016. 检测「嵌套数组（引用匹配）」
     * 特性：嵌套数组引用相同时，includes返回true
     */
    async test016_IncludesNestedArrayMatch() {
        const nestedArr = [1, 2];
        const testArray = [3, nestedArr, 4];
        const target = nestedArr; // 同一引用
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test016 失败：数组含嵌套数组[1,2]（引用${nestedArr}），检测同一引用，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesNestedArrayMatchTest016";
    },

    /**
     * 017. 区分「布尔值与数字」（true vs 1，false vs 0）
     * 特性：严格匹配，true≠1、false≠0，返回false
     */
    async test017_IncludesBooleanVsNumber() {
        const testArray = [1, 0, "true"];
        const testCases = [
            { target: true, expected: false }, // true≠1
            { target: false, expected: false } // false≠0
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test017 失败：数组[${testArray}]，检测${target}（vs ${typeof target === 'boolean' ? target ? 1 : 0 : ''}），预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesBooleanVsNumberTest017";
    },

    /**
     * 018. 区分「空字符串与空格字符串」
     * 特性：严格匹配，""≠" "，数组含""时检测" "返回false
     */
    async test018_IncludesEmptyStrVsSpace() {
        const testArray = ["", "a", "b"]; // 含空字符串，不含空格
        const target = " "; // 空格字符串
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test018 失败：数组[${JSON.stringify(testArray)}]（含空字符串），检测空格字符串，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesEmptyStrVsSpaceTest018";
    },

    /**
     * 019. fromIndex为「小数（自动取整）」
     * 特性：fromIndex为小数时，自动向下取整（如2.9→2，-2.1→-3）
     */
    async test019_IncludesWithFromIndexDecimal() {
        const testArray = [1, 2, 3, 4, 5];
        const target = 3;
        const fromIndex = 2.9; // 向下取整为2
        const expected = true;
        const floorFromIndex = Math.floor(fromIndex);

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test019 失败：fromIndex=${fromIndex}（自动取整为${floorFromIndex}），目标${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithFromIndexDecimalTest019";
    },

    /**
     * 020. 检测「Symbol类型（引用匹配）」
     * 特性：Symbol是引用类型，同一Symbol实例返回true，新实例返回false
     */
    async test020_IncludesSymbolType() {
        const sym1 = Symbol("test");
        const sym2 = Symbol("test"); // 同描述但不同实例
        const testArray = [sym1, 10, 20];
        const testCases = [
            { target: sym1, expected: true }, // 同一实例
            { target: sym2, expected: false } // 不同实例
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test020 失败：检测Symbol(${target.description})，${expected ? '同一实例' : '不同实例'}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesSymbolTypeTest020";
    },

    /**
     * 021. 检测「BigInt类型（值匹配）」
     * 特性：BigInt是基本类型，值相等则返回true（区别于引用类型）
     */
    async test021_IncludesBigIntType() {
        const big1 = 10n;
        const big2 = 10n; // 新实例但值相同
        const testArray = [big1, 20, 30];
        const target = big2;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test021 失败：数组含${big1}n，检测${big2}n（值相同），预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesBigIntTypeTest021";
    },

    /**
     * 022. fromIndex导致「错过前面的匹配元素」
     * 特性：fromIndex指定位置后，前面的元素不参与搜索，返回false
     */
    async test022_IncludesFromIndexMissFront() {
        const testArray = [5, 5, 5]; // 多个重复元素
        const target = 5;
        const fromIndex = 2; // 从index2开始，前面的index0/1不搜索
        const expected = true; // 但index2仍有5，所以返回true；若fromIndex=3则返回false

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test022 失败：数组[${testArray}]，fromIndex=${fromIndex}（仅搜索index≥2），目标${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesFromIndexMissFrontTest022";
    },

    /**
     * 023. 检测「Date对象（引用匹配）」
     * 特性：Date是引用类型，同一实例返回true，新实例（即使时间相同）返回false
     */
    async test023_IncludesDateObject() {
        const date1 = new Date("2024-01-01");
        const date2 = new Date("2024-01-01"); // 时间相同但实例不同
        const testArray = [date1, "other"];
        const testCases = [
            { target: date1, expected: true }, // 同一实例
            { target: date2, expected: false } // 不同实例
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test023 失败：检测Date(${target.toISOString()})，${expected ? '同一实例' : '不同实例'}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesDateObjectTest023";
    },

    /**
     * 024. 检测「RegExp对象（引用匹配）」
     * 特性：RegExp是引用类型，同一实例返回true，新实例（即使规则相同）返回false
     */
    async test024_IncludesRegExpObject() {
        const reg1 = /test/g;
        const reg2 = /test/g; // 规则相同但实例不同
        const testArray = [reg1, 100];
        const testCases = [
            { target: reg1, expected: true }, // 同一实例
            { target: reg2, expected: false } // 不同实例
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test024 失败：检测RegExp(${target.source})，${expected ? '同一实例' : '不同实例'}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesRegExpObjectTest024";
    },

    /**
     * 025. 数组「仅含空字符串」，检测空字符串
     * 特性：数组全是空字符串时，includes("")返回true
     */
    async test025_IncludesEmptyStrInEmptyStrArray() {
        const testArray = ["", "", ""]; // 仅含空字符串
        const target = "";
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test025 失败：数组[${JSON.stringify(testArray)}]（仅含空字符串），检测空字符串，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesEmptyStrInEmptyStrArrayTest025";
    },

    /**
     * 026. fromIndex为「数组长度-1」（仅搜索最后一个元素）
     * 特性：fromIndex=array.length-1时，仅搜索最后一个元素
     */
    async test026_IncludesFromIndexLastElement() {
        const testArray = [1, 2, 3, 4]; // 长度4，array.length-1=3
        const target = 4; // 最后一个元素
        const fromIndex = testArray.length - 1;
        const expected = true;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test026 失败：fromIndex=${fromIndex}（仅搜索最后一个元素），目标${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesFromIndexLastElementTest026";
    },

    /**
     * 027. 检测「数组中不存在的Symbol」
     * 特性：数组不含目标Symbol实例时，返回false
     */
    async test027_IncludesNotExistsSymbol() {
        const sym = Symbol("not-exists");
        const testArray = [Symbol("a"), Symbol("b")]; // 不含sym
        const target = sym;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test027 失败：数组含2个Symbol，检测Symbol(${target.description})（不存在），预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesNotExistsSymbolTest027";
    },

    /**
     * 028. 检测「BigInt与Number的区分」（10n≠10）
     * 特性：严格匹配，BigInt与Number类型不同，即使值相同也返回false
     */
    async test028_IncludesBigIntVsNumber() {
        const testArray = [10n, 20, 30]; // 含10n，不含10
        const target = 10; // Number类型
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test028 失败：数组含10n（BigInt），检测10（Number），预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesBigIntVsNumberTest028";
    },

    /**
     * 029. 大数组「含目标值」（简单验证性能无关的存在性）
     * 特性：大数组中存在目标值时，includes仍能正确返回true（不关注性能，仅验证逻辑）
     */
    async test029_IncludesInLargeArray() {
        // 创建长度为1000的大数组，最后一个元素为目标值
        const largeArray = Array.from({ length: 1000 }, (_, i) => i);
        const target = 999; // 最后一个元素
        const expected = true;

        const actual = largeArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test029 失败：长度1000的数组，检测最后一个元素${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesInLargeArrayTest029";
    },

    /**
     * 030. 数组「含undefined但无空槽」，检测undefined（与空槽场景结果一致但场景不同）
     * 特性：无论undefined是显式添加还是空槽，includes(undefined)均返回true（场景区分）
     */
    async test030_IncludesUndefinedNoSlot() {
        const testArray = [1, 2, undefined, 3]; // 显式undefined，无空槽
        const target = undefined;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test030 失败：数组[${testArray}]（显式undefined，无空槽），检测undefined，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesUndefinedNoSlotTest030";
    },

    /**
     * 031. fromIndex为「NaN」（自动转为0，从开头搜索）
     * 特性：fromIndex为NaN时，按ToInteger规则转为0，等价于从数组开头搜索
     */
    async test031_IncludesWithFromIndexNaN() {
        const testArray = ["x", "y", "z"];
        const target = "y";
        const fromIndex = NaN; // 转为0
        const expected = true;
        const convertedFromIndex = Number.isNaN(fromIndex) ? 0 : Math.floor(fromIndex);

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test031 失败：fromIndex=${fromIndex}（自动转为${convertedFromIndex}），目标"${target}"，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithFromIndexNaNTes031";
    },

    /**
     * 032. 字符串数组「区分大小写」（"Apple"≠"apple"）
     * 特性：字符串元素严格区分大小写，大小写不同视为不同元素，返回false
     */
    async test032_IncludesStringCaseSensitive() {
        const testArray = ["Apple", "Banana", "Cherry"];
        const target = "apple"; // 小写，与数组中"Apple"大小写不同
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test032 失败：数组[${testArray}]，检测"${target}"（大小写不同），预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesStringCaseSensitiveTest032";
    },

    /**
     * 033. 数组中「含function实例」（引用匹配）
     * 特性：function是引用类型，同一实例返回true，不同实例返回false
     */
    async test033_IncludesFunctionInstance() {
        const func1 = () => console.log("test");
        const func2 = () => console.log("test"); // 不同实例
        const testArray = [func1, 10, 20];
        const testCases = [
            { target: func1, expected: true }, // 同一实例
            { target: func2, expected: false } // 不同实例
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test033 失败：检测function ${expected ? '同一实例' : '不同实例'}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesFunctionInstanceTest033";
    },

    /**
     * 034. 类数组对象「调用includes」（通过Array.prototype.includes.call）
     * 特性：类数组对象（含length和索引属性）可通过call调用includes，正常检测元素
     */
    async test034_IncludesOnArrayLike() {
        // 类数组对象：含length和索引属性，非数组
        const arrayLike = { length: 3, 0: "a", 1: "b", 2: "c" };
        const target = "b";
        const expected = true;

        // 通过Array.prototype.includes.call调用
        const actual = Array.prototype.includes.call(arrayLike, target);
        if (actual !== expected) {
            throw new Error(`Test034 失败：类数组${JSON.stringify(arrayLike)}，检测"${target}"，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesOnArrayLikeTest034";
    },

    /**
     * 035. fromIndex为「字符串类型数字」（自动转为数字）
     * 特性：fromIndex为字符串数字时，按ToInteger规则转为数字（如"2"→2）
     */
    async test035_IncludesWithFromIndexStringNum() {
        const testArray = [1, 2, 3, 4, 5];
        const target = 4;
        const fromIndex = "2"; // 字符串数字，转为2
        const expected = true;
        const convertedFromIndex = parseInt(fromIndex, 10);

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test035 失败：fromIndex="${fromIndex}"（转为${convertedFromIndex}），目标${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithFromIndexStringNumTest035";
    },

    /**
     * 036. 数组中「含Infinity」（检测Infinity返回true，-Infinity返回false）
     * 特性：Infinity是特殊值，严格匹配，数组含Infinity时检测-Infinity返回false
     */
    async test036_IncludesInfinityValue() {
        const testArray = [Infinity, 100, 200];
        const testCases = [
            { target: Infinity, expected: true },
            { target: -Infinity, expected: false }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test036 失败：检测${target}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesInfinityValueTest036";
    },

    /**
     * 037. 检测「undefined但数组仅含null」（undefined≠null）
     * 特性：严格区分undefined与null，数组仅含null时检测undefined返回false
     */
    async test037_IncludesUndefinedInNullArray() {
        const testArray = [null, null, null]; // 仅含null，无undefined
        const target = undefined;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test037 失败：数组[${testArray}]（仅含null），检测undefined，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesUndefinedInNullArrayTest037";
    },

    /**
     * 038. 嵌套对象「引用匹配」（同一嵌套对象返回true，新对象返回false）
     * 特性：嵌套对象是引用类型，同一实例返回true，新对象（值相同）返回false
     */
    async test038_IncludesNestedObject() {
        const nestedObj = { id: 1, value: "nested" };
        const testArray = [10, nestedObj, 20];
        const target1 = nestedObj; // 同一实例
        const target2 = { id: 1, value: "nested" }; // 新对象
        const expected1 = true;
        const expected2 = false;

        const actual1 = testArray.includes(target1);
        const actual2 = testArray.includes(target2);
        if (actual1 !== expected1 || actual2 !== expected2) {
            throw new Error(`Test038 失败：检测同一嵌套对象预期${expected1}实际${actual1}，检测新对象预期${expected2}实际${actual2}`);
        }

        return "Test Passed: IncludesNestedObjectTest038";
    },

    /**
     * 039. 数组长度为「1」（检测存在和不存在的元素）
     * 特性：长度为1的数组，检测唯一元素返回true，其他元素返回false
     */
    async test039_IncludesSingleElementArray() {
        const testArray = ["only-element"]; // 长度1
        const testCases = [
            { target: "only-element", expected: true },
            { target: "other", expected: false }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test039 失败：长度1的数组[${testArray}]，检测"${target}"，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesSingleElementArrayTest039";
    },

    /**
     * 040. fromIndex为「最大安全整数」（超出数组长度返回false）
     * 特性：fromIndex为最大安全整数（2^53-1），远超数组长度时返回false
     */
    async test040_IncludesWithFromIndexMaxSafeInt() {
        const testArray = [1, 2, 3]; // 长度3
        const target = 2;
        const fromIndex = Number.MAX_SAFE_INTEGER; // 9007199254740991
        const expected = false;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test040 失败：fromIndex=${fromIndex}（远超数组长度3），目标${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithFromIndexMaxSafeIntTest040";
    },

    /**
     * 041. 检测「Symbol.for创建的共享Symbol」（同一key返回true）
     * 特性：Symbol.for创建的Symbol按key共享，同一key的Symbol视为同一实例，返回true
     */
    async test041_IncludesSharedSymbol() {
        const sym1 = Symbol.for("shared-key");
        const sym2 = Symbol.for("shared-key"); // 同一key，共享实例
        const testArray = [sym1, 100];
        const target = sym2;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test041 失败：Symbol.for("shared-key")共享实例，检测sym2，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesSharedSymbolTest041";
    },

    /**
     * 042. 数组中「含循环引用对象」（引用匹配，返回true）
     * 特性：循环引用对象仍是引用类型，同一实例返回true，不影响includes判断
     */
    async test042_IncludesCircularObject() {
        // 循环引用对象：obj.self = obj
        const circularObj = { name: "circular" };
        circularObj.self = circularObj;
        const testArray = [circularObj, 200];
        const target = circularObj;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test042 失败：数组含循环引用对象，检测同一对象，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesCircularObjectTest042";
    },

    /**
     * 043. fromIndex为「负数且等于数组长度」（等价于fromIndex=0）
     * 特性：fromIndex=-array.length 时，等价于0，从开头搜索
     */
    async test043_IncludesWithFromIndexNegEqualLength() {
        const testArray = [5, 10, 15, 20]; // 长度4
        const target = 10;
        const fromIndex = -testArray.length; // -4，等价于0
        const expected = true;
        const convertedFromIndex = testArray.length + fromIndex;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test043 失败：fromIndex=${fromIndex}（等价${convertedFromIndex}），目标${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithFromIndexNegEqualLengthTest043";
    },

    /**
     * 044. 检测「BigInt的不同值」（10n≠20n）
     * 特性：BigInt严格匹配值，不同值视为不同元素，返回false
     */
    async test044_IncludesDifferentBigInt() {
        const testArray = [10n, 30n, 40n];
        const target = 20n; // 与数组中BigInt值不同
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test044 失败：数组含[10n,30n,40n]，检测20n，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesDifferentBigIntTest044";
    },

    /**
     * 045. 字符串数组「检测子字符串」（非元素，返回false）
     * 特性：includes检测的是数组元素，而非元素的子字符串，子字符串不匹配返回false
     */
    async test045_IncludesSubstringInArray() {
        const testArray = ["hello-world", "foo-bar"];
        const target = "hello"; // 是"hello-world"的子字符串，非数组元素
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test045 失败：数组[${testArray}]，检测子字符串"${target}"（非元素），预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesSubstringInArrayTest045";
    },

    /**
     * 046. 数组中「含null和undefined」（分别检测返回true）
     * 特性：数组同时含null和undefined时，检测两者均返回true
     */
    async test046_IncludesNullAndUndefined() {
        const testArray = [null, undefined, 10]; // 同时含null和undefined
        const testCases = [
            { target: null, expected: true },
            { target: undefined, expected: true }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test046 失败：数组含null和undefined，检测${target}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesNullAndUndefinedTest046";
    },

    /**
     * 047. fromIndex为「-0」（等价于0，从开头搜索）
     * 特性：-0与0在ToInteger后均为0，fromIndex=-0等价于fromIndex=0
     */
    async test047_IncludesWithFromIndexNegativeZero() {
        const testArray = ["a", "b", "c", "d"];
        const target = "c";
        const fromIndex = -0; // 等价于0
        const expected = true;
        const convertedFromIndex = 0; // -0转为0

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test047 失败：fromIndex=-0（等价${convertedFromIndex}），目标"${target}"，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithFromIndexNegativeZeroTest047";
    },

    /**
     * 048. 检测「数组中的数组元素（值相同引用不同）」（返回false）
     * 特性：数组元素是数组时，值相同但引用不同视为不同元素，返回false
     */
    async test048_IncludesArrayElementDifferentRef() {
        const testArray = [[1, 2], [3, 4]]; // 元素是数组
        const target = [1, 2]; // 新数组，值同引用不同
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test048 失败：数组含[1,2]（引用A），检测[1,2]（引用B），预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesArrayElementDifferentRefTest048";
    },

    /**
     * 049. 类数组对象「length异常（大于实际索引）」（空槽视为undefined）
     * 特性：类数组length大于实际索引时，空索引位置视为空槽（undefined），检测undefined返回true
     */
    async test049_IncludesArrayLikeWithEmptySlot() {
        // 类数组：length=4，但仅0、2有值，1、3为空槽
        const arrayLike = { length: 4, 0: "x", 2: "z" };
        const target = undefined;
        const expected = true;

        const actual = Array.prototype.includes.call(arrayLike, target);
        if (actual !== expected) {
            throw new Error(`Test049 失败：类数组${JSON.stringify(arrayLike)}（含空槽），检测undefined，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesArrayLikeWithEmptySlotTest049";
    },

    /**
     * 050. 数组长度为「2」（检测第一个和第二个元素）
     * 特性：长度为2的数组，检测两个元素分别返回true，其他返回false
     */
    async test050_IncludesTwoElementArray() {
        const testArray = [10, 20]; // 长度2
        const testCases = [
            { target: 10, expected: true },
            { target: 20, expected: true },
            { target: 30, expected: false }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test050 失败：长度2的数组[${testArray}]，检测${target}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesTwoElementArrayTest050";
    },

    /**
     * 051. 检测「-Infinity」（数组含-Infinity时返回true，Infinity返回false）
     * 特性：-Infinity是特殊值，严格匹配，数组含-Infinity时检测Infinity返回false
     */
    async test051_IncludesNegativeInfinity() {
        const testArray = [-Infinity, 50, 60];
        const testCases = [
            { target: -Infinity, expected: true },
            { target: Infinity, expected: false }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test051 失败：检测${target}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesNegativeInfinityTest051";
    },



    /**
     * 053. 数组中「含多个相同引用类型」（检测返回true）
     * 特性：数组含多个相同引用类型实例时，检测该实例返回true
     */
    async test053_IncludesMultipleSameRef() {
        const sharedObj = { value: "shared" };
        const testArray = [sharedObj, 10, sharedObj, 20]; // 含2个sharedObj
        const target = sharedObj;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test053 失败：数组含多个${JSON.stringify(sharedObj)}，检测该对象，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesMultipleSameRefTest053";
    },

    /**
     * 054. 类数组对象「非数字索引」（忽略非数字索引，仅处理数字索引）
     * 特性：类数组的非数字索引不参与includes检测，仅数字索引对应的元素有效
     */
    async test054_IncludesArrayLikeNonNumberKey() {
        // 类数组：含非数字索引"key"，仅0、1为有效数字索引
        const arrayLike = { length: 2, 0: "a", 1: "b", key: "c" };
        const testCases = [
            { target: "b", expected: true }, // 数字索引1的元素
            { target: "c", expected: false } // 非数字索引"key"的元素，忽略
        ];

        for (const { target, expected } of testCases) {
            const actual = Array.prototype.includes.call(arrayLike, target);
            if (actual !== expected) {
                throw new Error(`Test054 失败：类数组${JSON.stringify(arrayLike)}，检测"${target}"，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesArrayLikeNonNumberKeyTest054";
    },

    /**
     * 055. 检测「BigInt的最大值」（值匹配返回true）
     * 特性：BigInt最大值（Number.MAX_SAFE_INTEGER +1n）仍能正确匹配，返回true
     */
    async test055_IncludesBigIntMaxValue() {
        const bigMax = BigInt(Number.MAX_SAFE_INTEGER) + 1n; // 9007199254740992n
        const testArray = [bigMax, 10n, 20n];
        const target = bigMax;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test055 失败：数组含${bigMax}n，检测该BigInt，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesBigIntMaxValueTest055";
    },

    /**
     * 056. fromIndex为「空字符串」（自动转为0）
     * 特性：fromIndex为空字符串时，按ToInteger规则转为0
     */
    async test056_IncludesWithFromIndexEmptyString() {
        const testArray = ["x", "y", "z"];
        const target = "y";
        const fromIndex = ""; // 空字符串，转为0
        const expected = true;
        const convertedFromIndex = 0;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test056 失败：fromIndex="${fromIndex}"（转为${convertedFromIndex}），目标"${target}"，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesWithFromIndexEmptyStringTest056";
    },

    /**
     * 057. 数组中「含undefined但检测null」（undefined≠null，返回false）
     * 特性：严格区分undefined与null，数组含undefined时检测null返回false
     */
    async test057_IncludesNullInUndefinedArray() {
        const testArray = [undefined, undefined, 10]; // 含undefined，无null
        const target = null;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test057 失败：数组[${testArray}]（含undefined），检测null，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesNullInUndefinedArrayTest057";
    },

    /**
     * 058. 检测「function的prototype属性」（非数组元素，返回false）
     * 特性：includes检测数组元素，而非元素的属性，检测function.prototype返回false
     */
    async test058_IncludesFunctionPrototype() {
        const func = () => {};
        const testArray = [func, 100]; // 数组含func，不含func.prototype
        const target = func.prototype;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test058 失败：数组含func，检测func.prototype，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesFunctionPrototypeTest058";
    },

    /**
     * 059. 类数组对象「length为0（空类数组）」（检测任何元素返回false）
     * 特性：空类数组（length=0）无元素，检测任何目标返回false
     */
    async test059_IncludesEmptyArrayLike() {
        const emptyArrayLike = { length: 0 }; // 空类数组
        const target = "any";
        const expected = false;

        const actual = Array.prototype.includes.call(emptyArrayLike, target);
        if (actual !== expected) {
            throw new Error(`Test059 失败：空类数组${JSON.stringify(emptyArrayLike)}，检测"${target}"，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IncludesEmptyArrayLikeTest059";
    },

    /**
     * 060. 数组中「含NaN和Infinity」（分别检测返回true）
     * 特性：数组同时含NaN和Infinity时，检测两者均返回true，检测-Infinity返回false
     */
    async test060_IncludesNaNAndInfinity() {
        const testArray = [NaN, Infinity, 10]; // 含NaN和Infinity
        const testCases = [
            { target: NaN, expected: true },
            { target: Infinity, expected: true },
            { target: -Infinity, expected: false }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test060 失败：数组含NaN和Infinity，检测${target}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IncludesNaNAndInfinityTest060";
    },
    /**
     * 061. fromIndex为「布尔值」（true→1，false→0）
     * 特性：布尔值按ToInteger转为数字，true→1、false→0
     */
    async test061_IncludesWithFromIndexBoolean() {
        const testArray = [10, 20, 30, 40];
        const testCases = [
            { target: 20, fromIndex: true, expected: true, converted: 1 }, // true→1
            { target: 10, fromIndex: false, expected: true, converted: 0 } // false→0
        ];

        for (const { target, fromIndex, expected, converted } of testCases) {
            const actual = testArray.includes(target, fromIndex);
            if (actual !== expected) {
                throw new Error(`Test061 失败：fromIndex=${fromIndex}（转为${converted}），目标${target}，预期${expected}，实际${actual}`);
            }
        }
        return "Test Passed: IncludesWithFromIndexBooleanTest061";
    },

    /**
     * 062. 数组中「含TypedArray实例」（引用匹配，不同实例返回false）
     * 特性：TypedArray是引用类型，同一实例返回true，不同实例（同值）返回false
     */
    async test062_IncludesTypedArrayInstance() {
        const typedArr1 = new Uint8Array([1, 2]);
        const typedArr2 = new Uint8Array([1, 2]); // 同值不同实例
        const testArray = [typedArr1, "other"];
        const testCases = [
            { target: typedArr1, expected: true },
            { target: typedArr2, expected: false }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test062 失败：检测TypedArray ${expected ? '同一实例' : '不同实例'}，预期${expected}，实际${actual}`);
            }
        }
        return "Test Passed: IncludesTypedArrayInstanceTest062";
    },

    /**
     * 063. fromIndex为「普通对象」（转为NaN→0）
     * 特性：非数字/字符串的fromIndex（如对象），按ToInteger转为NaN→0
     */
    async test063_IncludesWithFromIndexObject() {
        const testArray = ["a", "b", "c"];
        const target = "a";
        const fromIndex = { key: "val" }; // 普通对象，转为NaN→0
        const expected = true;
        const converted = 0;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test063 失败：fromIndex=${JSON.stringify(fromIndex)}（转为${converted}），目标"${target}"，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexObjectTest063";
    },

    /**
     * 064. 检测「数组的Symbol.iterator属性」（非元素，返回false）
     * 特性：includes仅检测数组元素，不检测数组自身属性（如Symbol.iterator）
     */
    async test064_IncludesArraySymbolIterator() {
        const testArray = [1, 2, 3];
        const target = Array.prototype[Symbol.iterator]; // 数组的迭代器属性
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test064 失败：检测数组的Symbol.iterator属性（非元素），预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesArraySymbolIteratorTest064";
    },

    /**
     * 065. 数组中「含undefined和空槽的混合场景」（检测undefined返回true）
     * 特性：无论undefined是显式添加还是空槽，检测undefined均返回true
     */
    async test065_IncludesMixedUndefinedSlot() {
        const testArray = [5, , undefined, 15, , 25]; // 空槽+显式undefined
        const target = undefined;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test065 失败：混合空槽和显式undefined的数组[${testArray}]，检测undefined，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesMixedUndefinedSlotTest065";
    },

    /**
     * 066. 区分「null和0」（null≠0，返回false）
     * 特性：严格匹配，null与0类型不同，数组含null时检测0返回false
     */
    async test066_IncludesNullVsZero() {
        const testArray = [null, 10, 20]; // 含null，不含0
        const target = 0;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test066 失败：数组含null，检测0，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesNullVsZeroTest066";
    },

    /**
     * 067. fromIndex为「-1」（仅搜索最后一个元素）
     * 特性：fromIndex=-1等价于array.length-1，仅搜索最后一个元素
     */
    async test067_IncludesWithFromIndexMinusOne() {
        const testArray = [1, 3, 5, 7]; // 长度4，array.length-1=3
        const target = 7; // 最后一个元素
        const fromIndex = -1;
        const expected = true;
        const realStart = testArray.length + fromIndex;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test067 失败：fromIndex=${fromIndex}（实际起始${realStart}），目标${target}，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexMinusOneTest067";
    },

    /**
     * 068. 数组中「含多个NaN」（检测NaN仍返回true）
     * 特性：无论数组含多少个NaN，includes(NaN)均返回true
     */
    async test068_IncludesMultipleNaN() {
        const testArray = [NaN, 10, NaN, 20, NaN]; // 多个NaN
        const target = NaN;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test068 失败：数组含多个NaN，检测NaN，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesMultipleNaNTes068";
    },

    /**
     * 069. 检测「TypedArray的includes方法（对比Array）」（Array包含TypedArray元素）
     * 特性：Array的includes检测TypedArray元素时，按引用匹配，与TypedArray自身的includes无关
     */
    async test069_IncludesTypedArrayInArray() {
        const typedArr = new Float32Array([1.5, 2.5]);
        const testArray = [typedArr, "test"]; // Array包含TypedArray元素
        const target = typedArr;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test069 失败：Array含TypedArray元素，检测同一实例，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesTypedArrayInArrayTest069";
    },

    /**
     * 070. 数组中「含RegExp不同标志的实例」（/abc/g≠/abc/i，返回false）
     * 特性：RegExp标志不同视为不同实例，检测不同标志的RegExp返回false
     */
    async test070_IncludesRegExpDifferentFlags() {
        const regG = /abc/g;
        const regI = /abc/i; // 标志不同
        const testArray = [regG, 100];
        const target = regI;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test070 失败：数组含/abc/g，检测/abc/i（标志不同），预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesRegExpDifferentFlagsTest070";
    },

    /**
     * 071. 验证「Symbol作为fromIndex时抛出TypeError」（符合ES规范）
     * 特性：ES规范要求fromIndex需为可转换为整数的类型（如number/string），Symbol无法转数字，会直接抛出TypeError
     */
    async test071_IncludesWithFromIndexSymbol() {
        const testArray = ["x", "y", "z"];
        const target = "x";
        const invalidFromIndex = Symbol("from-index"); // Symbol类型（无效的fromIndex）
        let errorCaught = false;
        let errorMessage = "";

        // 关键：验证传入Symbol作为fromIndex时，会抛出预期的TypeError
        try {
            // 尝试用Symbol作为fromIndex调用includes（规范要求此处抛出TypeError）
            testArray.includes(target, invalidFromIndex);
        } catch (err) {
            // 验证捕获的错误类型和信息是否符合预期
            if (err instanceof TypeError) {
                errorCaught = true;
                errorMessage = err.message;
                // 验证错误信息包含"Symbol"和"number"（跨环境兼容，不同环境错误信息可能略有差异）
                if (!errorMessage.includes("Symbol") || !errorMessage.includes("number")) {
                    throw new Error(`Test071 失败：捕获的TypeError信息不符合预期，实际信息：${errorMessage}`);
                }
            } else {
                // 若抛出的不是TypeError，测试失败
                throw new Error(`Test071 失败：传入Symbol作为fromIndex时，未抛出TypeError，实际抛出${err.name}`);
            }
        }

        // 验证是否成功捕获预期的TypeError
        if (!errorCaught) {
            throw new Error(`Test071 失败：传入Symbol作为fromIndex时，未抛出TypeError（违背ES规范）`);
        }

        // 补充：验证「有效fromIndex（如0）」的正常调用（确保数组和目标值本身无问题）
        const validResult = testArray.includes(target, 0);
        if (validResult !== true) {
            throw new Error(`Test071 失败：有效fromIndex=0时，检测"${target}"预期true，实际${validResult}`);
        }

        return "Test Passed: IncludesWithFromIndexSymbolTest071";
    },

    /**
     * 072. 验证「引用类型的匹配逻辑」（兼容浏览器/Node.js，用Blob（浏览器）或自定义类（Node.js）实现）
     * 特性：引用类型需同一实例才返回true，不同实例（即使内容/属性相同）返回false；Blob仅浏览器支持，Node.js用自定义类替代
     */
    async test072_IncludesBlobObject() {
        // 1. 跨环境兼容：判断当前环境是否支持Blob（浏览器支持，Node.js默认不支持）
        let RefTypeClass;
        if (typeof Blob !== 'undefined') {
            // 浏览器环境：使用Blob作为引用类型
            RefTypeClass = Blob;
        } else {
            // Node.js环境：用自定义类模拟Blob的引用特性（仅用于验证引用匹配，不依赖Blob功能）
            RefTypeClass = class MockBlob {
                constructor(content) {
                    this.content = content; // 模拟Blob的内容属性
                }
            };
        }

        // 2. 创建引用类型实例（同一内容/属性，不同实例）
        const content = ["test content"]; // 模拟Blob的内容
        const refInstance1 = new RefTypeClass(content); // 实例1
        const refInstance2 = new RefTypeClass(content); // 实例2（同内容/属性，不同引用）
        const testArray = [refInstance1, 200]; // 数组含实例1

        // 3. 核心验证：引用类型的匹配规则（同一实例true，不同实例false）
        const testCases = [
            {
                target: refInstance1,
                expected: true,
                desc: `同一${RefTypeClass.name}实例`
            },
            {
                target: refInstance2,
                expected: false,
                desc: `不同${RefTypeClass.name}实例（同内容/属性）`
            }
        ];

        // 4. 执行验证
        for (const { target, expected, desc } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                // 错误信息明确环境和引用类型，便于定位
                const envInfo = typeof Blob !== 'undefined' ? '浏览器环境' : 'Node.js环境（用MockBlob模拟）';
                throw new Error(`Test072 失败：
                环境：${envInfo}
                测试场景：${desc}
                预期结果：${expected}
                实际结果：${actual}
                原因：引用类型需同一实例才匹配，不同实例即使内容相同也不匹配`);
            }
        }

        // 补充：验证数组不含的实例返回false（进一步确认引用匹配逻辑）
        const refInstance3 = new RefTypeClass(["new content"]);
        if (testArray.includes(refInstance3)) {
            throw new Error(`Test072 失败：数组不含${RefTypeClass.name}实例3，实际返回true`);
        }

        return "Test Passed: IncludesBlobObjectTest072";
    },

    /**
     * 073. 验证「BigInt作为fromIndex时抛出TypeError」（符合ES规范）
     * 特性：ES规范要求fromIndex需为可转换为Number的类型，BigInt无法转为Number，作为fromIndex会直接抛出TypeError
     */
    async test073_IncludesWithFromIndexBigInt() {
        const testArray = [1, 2, 3, 4, 5];
        const target = 4;
        const invalidFromIndex = 2n; // BigInt类型（无效的fromIndex）
        let errorCaught = false;
        let errorMessage = "";

        // 1. 验证BigInt作为fromIndex时，抛出预期的TypeError
        try {
            // 尝试用BigInt作为fromIndex调用includes（规范要求此处抛出TypeError）
            testArray.includes(target, invalidFromIndex);
        } catch (err) {
            // 验证错误类型和信息是否符合预期（跨环境兼容：不同环境错误信息可能略有差异）
            if (err instanceof TypeError) {
                errorCaught = true;
                errorMessage = err.message;
                // 核心验证：错误信息需包含"BigInt"和"number"（确认是BigInt转数字失败）
                if (!errorMessage.includes("BigInt") || !errorMessage.includes("number")) {
                    throw new Error(`Test073 失败：捕获的TypeError信息不符合预期，实际信息：${errorMessage}`);
                }
            } else {
                // 若抛出的不是TypeError，测试失败
                throw new Error(`Test073 失败：传入BigInt作为fromIndex时，未抛出TypeError，实际抛出${err.name}`);
            }
        }

        // 2. 验证是否成功捕获预期的TypeError
        if (!errorCaught) {
            throw new Error(`Test073 失败：传入BigInt作为fromIndex时，未抛出TypeError（违背ES规范）`);
        }

        // 3. 补充：验证「有效fromIndex（如2）」的正常调用（排除数组/目标值本身异常）
        const validFromIndex = 2; // 有效Number类型fromIndex
        const validResult = testArray.includes(target, validFromIndex);
        if (validResult !== true) {
            throw new Error(`Test073 失败：有效fromIndex=${validFromIndex}时，检测目标${target}预期true，实际${validResult}`);
        }

        // 4. 额外验证：BigInt作为数组元素的正常匹配（确保BigInt本身可作为元素，仅fromIndex无效）
        const bigIntArray = [10n, 20n, 30n];
        const bigIntTarget = 20n;
        if (!bigIntArray.includes(bigIntTarget)) {
            throw new Error(`Test073 失败：BigInt作为数组元素时，检测${bigIntTarget}预期true，实际false`);
        }

        return "Test Passed: IncludesWithFromIndexBigIntTest073";
    },

    /**
     * 074. 数组中「含Promise实例」（引用匹配，不同实例返回false）
     * 特性：Promise是引用类型，同一实例返回true，不同实例（同状态）返回false
     */
    async test074_IncludesPromiseInstance() {
        const promise1 = Promise.resolve("done");
        const promise2 = Promise.resolve("done"); // 同状态不同实例
        const testArray = [promise1, "other"];
        const testCases = [
            { target: promise1, expected: true },
            { target: promise2, expected: false }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test074 失败：检测Promise ${expected ? '同一实例' : '不同实例'}，预期${expected}，实际${actual}`);
            }
        }
        return "Test Passed: IncludesPromiseInstanceTest074";
    },

    /**
     * 075. fromIndex为「null」（转为0）
     * 特性：null按ToInteger转为0
     */
    async test075_IncludesWithFromIndexNull() {
        const testArray = [100, 200, 300];
        const target = 100;
        const fromIndex = null; // 转为0
        const expected = true;
        const converted = 0;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test075 失败：fromIndex=null（转为${converted}），目标${target}，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexNullTest075";
    },

    /**
     * 076. 区分「空字符串和0」（""≠0，返回false）
     * 特性：严格匹配，空字符串与0类型不同，数组含空字符串时检测0返回false
     */
    async test076_IncludesEmptyStrVsZero() {
        const testArray = ["", "a", "b"]; // 含空字符串，不含0
        const target = 0;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test076 失败：数组含空字符串，检测0，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesEmptyStrVsZeroTest076";
    },

    /**
     * 077. fromIndex为「-array.length + 1」（等价于1）
     * 特性：fromIndex=-length+1 等价于1，从index1开始搜索
     */
    async test077_IncludesWithFromIndexNegLengthPlus1() {
        const testArray = [5, 15, 25, 35]; // 长度4
        const target = 15; // index1
        const fromIndex = -testArray.length + 1; // -4+1=-3 → 4+(-3)=1
        const expected = true;
        const realStart = testArray.length + fromIndex;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test077 失败：fromIndex=${fromIndex}（实际起始${realStart}），目标${target}，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexNegLengthPlus1Test077";
    },

    /**
     * 078. 数组中「含Map实例」（引用匹配，同一实例返回true）
     * 特性：Map是引用类型，同一实例返回true，不同实例（同键值）返回false
     */
    async test078_IncludesMapInstance() {
        const map1 = new Map([["key1", "val1"]]);
        const map2 = new Map([["key1", "val1"]]); // 同键值不同实例
        const testArray = [map1, 400];
        const testCases = [
            { target: map1, expected: true },
            { target: map2, expected: false }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test078 失败：检测Map ${expected ? '同一实例' : '不同实例'}，预期${expected}，实际${actual}`);
            }
        }
        return "Test Passed: IncludesMapInstanceTest078";
    },

    /**
     * 079. 检测「数组中的数组（嵌套多层）」（引用匹配，返回true）
     * 特性：多层嵌套数组仍按引用匹配，同一实例返回true
     */
    async test079_IncludesNestedMultiArray() {
        const deepArr = [1, [2, [3]]]; // 多层嵌套
        const testArray = ["a", deepArr, "b"];
        const target = deepArr;
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test079 失败：数组含多层嵌套数组${JSON.stringify(deepArr)}，检测同一实例，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesNestedMultiArrayTest079";
    },

    /**
     * 080. fromIndex为「极大正数但小于数组长度」（正常搜索）
     * 特性：fromIndex小于数组长度时，从该位置正常搜索
     */
    async test080_IncludesWithFromIndexLargePositive() {
        const testArray = Array.from({ length: 100 }, (_, i) => i); // 长度100
        const target = 90;
        const fromIndex = 80; // 小于100
        const expected = true;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test080 失败：数组长度100，fromIndex=${fromIndex}，目标${target}，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexLargePositiveTest080";
    },

    /**
     * 081. 数组中「含Set实例」（引用匹配，不同实例返回false）
     * 特性：Set是引用类型，不同实例（同元素）返回false
     */
    async test081_IncludesSetInstance() {
        const set1 = new Set([1, 2]);
        const set2 = new Set([1, 2]); // 同元素不同实例
        const testArray = [set1, 500];
        const target = set2;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test081 失败：数组含Set([1,2])，检测不同实例Set，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesSetInstanceTest081";
    },

    /**
     * 082. fromIndex为「字符串非数字」（转为NaN→0）
     * 特性：非数字字符串的fromIndex转为NaN→0
     */
    async test082_IncludesWithFromIndexNonNumString() {
        const testArray = ["a", "b", "c"];
        const target = "a";
        const fromIndex = "not-a-number"; // 非数字字符串
        const expected = true;
        const converted = 0;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test082 失败：fromIndex="${fromIndex}"（转为${converted}），目标"${target}"，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexNonNumStringTest082";
    },

    /**
     * 083. 区分「Infinity和Number.MAX_VALUE」（Infinity≠MAX_VALUE，返回false）
     * 特性：严格匹配，Infinity与最大数值不同，数组含Infinity时检测MAX_VALUE返回false
     */
    async test083_IncludesInfinityVsMaxValue() {
        const testArray = [Infinity, 10, 20]; // 含Infinity
        const target = Number.MAX_VALUE; // 最大数值
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test083 失败：数组含Infinity，检测Number.MAX_VALUE，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesInfinityVsMaxValueTest083";
    },

    /**
     * 084. 数组中「含Date实例（不同时间）」（返回false）
     * 特性：Date实例时间不同视为不同实例，返回false
     */
    async test084_IncludesDateDifferentTime() {
        const date1 = new Date("2024-01-01");
        const date2 = new Date("2024-01-02"); // 时间不同
        const testArray = [date1, 600];
        const target = date2;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test084 失败：数组含${date1.toDateString()}，检测${date2.toDateString()}（时间不同），预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesDateDifferentTimeTest084";
    },

    /**
     * 085. fromIndex为「-array.length - 1」（等价于0）
     * 特性：fromIndex < -length 时，等价于0
     */
    async test085_IncludesWithFromIndexNegLengthMinus1() {
        const testArray = [5, 10, 15]; // 长度3
        const target = 5;
        const fromIndex = -testArray.length - 1; // -4 < -3 → 0
        const expected = true;
        const converted = 0;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test085 失败：fromIndex=${fromIndex}（转为${converted}），目标${target}，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexNegLengthMinus1Test085";
    },

    /**
     * 086. 检测「数组中的函数（箭头函数vs普通函数）」（不同类型返回false）
     * 特性：箭头函数与普通函数是不同实例，返回false
     */
    async test086_IncludesArrowVsNormalFunc() {
        const normalFunc = function() {};
        const arrowFunc = () => {}; // 不同类型函数
        const testArray = [normalFunc, 700];
        const target = arrowFunc;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test086 失败：数组含普通函数，检测箭头函数，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesArrowVsNormalFuncTest086";
    },

    /**
     * 087. 数组中「含空对象（{}）」（不同实例返回false）
     * 特性：空对象是引用类型，不同实例返回false
     */
    async test087_IncludesEmptyObjectDifferentRef() {
        const testArray = [{}, 800]; // 空对象实例1
        const target = {}; // 空对象实例2（不同引用）
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test087 失败：数组含空对象{}，检测新空对象{}，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesEmptyObjectDifferentRefTest087";
    },

    /**
     * 088. fromIndex为「小数且大于数组长度」（返回false）
     * 特性：小数fromIndex取整后大于数组长度，返回false
     */
    async test088_IncludesWithFromIndexDecimalExceed() {
        const testArray = [1, 2, 3]; // 长度3
        const target = 2;
        const fromIndex = 3.1; // 取整为3 > 3
        const expected = false;
        const converted = Math.floor(fromIndex);

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test088 失败：fromIndex=${fromIndex}（取整${converted}），数组长度3，目标${target}，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexDecimalExceedTest088";
    },

    /**
     * 089. 区分「-0和0」（-0===0，返回true）
     * 特性：严格匹配中-0与0相等，数组含0时检测-0返回true
     */
    async test089_IncludesNegativeZeroVsZero() {
        const testArray = [0, 10, 20]; // 含0
        const target = -0; // -0===0
        const expected = true;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test089 失败：数组含0，检测-0（-0===0），预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesNegativeZeroVsZeroTest089";
    },

    /**
     * 090. 数组中「含RegExp相同标志不同源」（/abc/≠/def/，返回false）
     * 特性：RegExp源不同视为不同实例，返回false
     */
    async test090_IncludesRegExpDifferentSource() {
        const regAbc = /abc/g;
        const regDef = /def/g; // 源不同，标志相同
        const testArray = [regAbc, 900];
        const target = regDef;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test090 失败：数组含/abc/g，检测/def/g（源不同），预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesRegExpDifferentSourceTest090";
    },

    /**
     * 091. fromIndex为「数组长度」（等价于超出范围，返回false）
     * 特性：fromIndex=array.length 时，无搜索范围，返回false
     */
    async test091_IncludesWithFromIndexEqualLength() {
        const testArray = [5, 10, 15]; // 长度3
        const target = 5;
        const fromIndex = testArray.length; // 3
        const expected = false;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test091 失败：fromIndex=${fromIndex}（等于数组长度），目标${target}，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexEqualLengthTest091";
    },

    /**
     * 092. 数组中「含Uint8Array和Uint16Array（同值）」（不同类型返回false）
     * 特性：不同类型TypedArray视为不同实例，返回false
     */
    async test092_IncludesDifferentTypedArrayType() {
        const uint8 = new Uint8Array([255]);
        const uint16 = new Uint16Array([255]); // 同值不同类型
        const testArray = [uint8, 1000];
        const target = uint16;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test092 失败：数组含Uint8Array([255])，检测Uint16Array([255])，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesDifferentTypedArrayTypeTest092";
    },

    /**
     * 093. 检测「数组中的不可枚举元素」（非数组元素，返回false）
     * 特性：includes仅检测数组索引对应的元素，不检测不可枚举属性
     */
    async test093_IncludesNonEnumerableProperty() {
        const testArray = [1, 2, 3];
        // 添加不可枚举属性
        Object.defineProperty(testArray, "nonEnum", {
            value: "hidden",
            enumerable: false
        });
        const target = "hidden";
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test093 失败：检测数组的不可枚举属性值，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesNonEnumerablePropertyTest093";
    },

    /**
     * 094. fromIndex为「-Infinity」（转为0）
     * 特性：-Infinity按ToInteger转为0
     */
    async test094_IncludesWithFromIndexNegativeInfinity() {
        const testArray = ["a", "b", "c"];
        const target = "a";
        const fromIndex = -Infinity; // 转为0
        const expected = true;
        const converted = 0;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test094 失败：fromIndex=-Infinity（转为${converted}），目标"${target}"，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexNegativeInfinityTest094";
    },

    /**
     * 095. 数组中「含NaN和null」（分别检测返回true）
     * 特性：数组含NaN和null时，检测两者均返回true
     */
    async test095_IncludesNaNAndNull() {
        const testArray = [NaN, null, 10]; // 含NaN和null
        const testCases = [
            { target: NaN, expected: true },
            { target: null, expected: true }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test095 失败：检测${target}，预期${expected}，实际${actual}`);
            }
        }
        return "Test Passed: IncludesNaNAndNullTest095";
    },

    /**
     * 096. 区分「字符串"0"和数字0」（"0"≠0，返回false）
     * 特性：严格匹配，字符串"0"与数字0类型不同，返回false
     */
    async test096_IncludesStringZeroVsNumberZero() {
        const testArray = ["0", "a", "b"]; // 含字符串"0"，不含数字0
        const target = 0; // 数字0
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test096 失败：数组含"0"（字符串），检测0（数字），预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesStringZeroVsNumberZeroTest096";
    },

    /**
     * 097. fromIndex为「Infinity」（超出范围，返回false）
     * 特性：Infinity作为fromIndex，远超数组长度，返回false
     */
    async test097_IncludesWithFromIndexInfinity() {
        const testArray = [1, 2, 3];
        const target = 1;
        const fromIndex = Infinity; // 超出范围
        const expected = false;

        const actual = testArray.includes(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test097 失败：fromIndex=Infinity，目标${target}，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesWithFromIndexInfinityTest097";
    },

    /**
     * 098. 数组中「含函数（绑定this后）」（不同实例返回false）
     * 特性：函数bind后生成新实例，与原函数不同，返回false
     */
    async test098_IncludesBoundFunction() {
        const originalFunc = function() {};
        const boundFunc = originalFunc.bind(null); // 绑定this生成新函数
        const testArray = [originalFunc, 1100];
        const target = boundFunc;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test098 失败：数组含原函数，检测bind后的新函数，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesBoundFunctionTest098";
    },

    /**
     * 099. 检测「数组中的Symbol（不同描述）」（返回false）
     * 特性：Symbol描述不同视为不同实例，返回false
     */
    async test099_IncludesSymbolDifferentDesc() {
        const symA = Symbol("a");
        const symB = Symbol("b"); // 描述不同
        const testArray = [symA, 1200];
        const target = symB;
        const expected = false;

        const actual = testArray.includes(target);
        if (actual !== expected) {
            throw new Error(`Test099 失败：数组含Symbol("a")，检测Symbol("b")，预期${expected}，实际${actual}`);
        }
        return "Test Passed: IncludesSymbolDifferentDescTest099";
    },

    /**
     * 100. 综合场景：数组含「基本类型+引用类型+特殊值」，批量检测
     * 特性：综合验证includes对多种类型的匹配逻辑
     */
    async test100_IncludesComprehensiveScene() {
        const obj = { id: 1 };
        const sym = Symbol("test");
        const testArray = [
            10, "20", NaN, null, undefined, obj, sym,
            () => {}, new Date("2024-01-01")
        ];
        const testCases = [
            { target: 10, expected: true },
            { target: "20", expected: true },
            { target: NaN, expected: true },
            { target: null, expected: true },
            { target: undefined, expected: true },
            { target: obj, expected: true },
            { target: sym, expected: true },
            { target: {}, expected: false }, // 新对象
            { target: Symbol("test"), expected: false }, // 新Symbol
            { target: 20, expected: false } // 数字20（非字符串"20"）
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.includes(target);
            if (actual !== expected) {
                throw new Error(`Test100 失败：检测${JSON.stringify(target)}，预期${expected}，实际${actual}`);
            }
        }
        return "Test Passed: IncludesComprehensiveSceneTest100";
    },
    /**
     * 101. 验证「Map Entry对象的引用匹配」（Entry为引用类型，键值相同但实例不同返回false）
     * 特性：Map.prototype.entries()返回的Entry对象（[key, value]结构）是引用类型，同一Entry实例返回true，不同实例（即使键值相同）返回false
     */
    async test101_IncludesMapEntryObject() {
        // 1. 创建Map实例并生成Entry对象（Entry是Map迭代返回的引用类型）
        const testMap = new Map([["name", "test"], ["type", "entry"]]);
        // 获取第一个Entry对象（通过迭代器，确保是真实Entry实例）
        let entry1;
        for (const entry of testMap.entries()) {
            entry1 = entry; // 取第一个Entry：["name", "test"]
            break;
        }
        // 创建键值相同的第二个Entry对象（新实例，引用不同）
        const entry2 = ["name", "test"]; // 结构与entry1一致，但非Map迭代返回的Entry实例，且引用不同
        // 注意：即使通过另一个Map生成相同键值的Entry，也是不同引用（补充验证）
        const anotherMap = new Map([["name", "test"]]);
        let entry3;
        for (const entry of anotherMap.entries()) {
            entry3 = entry; // 另一个Map的Entry，键值同entry1，引用不同
            break;
        }

        // 2. 构建测试数组（含entry1，不含entry2、entry3）
        const testArray = [entry1, "other-element", 123];
        // 定义测试场景：覆盖“同一引用”“键值同但非Entry实例”“键值同但不同Map的Entry”
        const testCases = [
            {
                target: entry1,
                expected: true,
                desc: "同一Map迭代返回的Entry实例（引用相同）"
            },
            {
                target: entry2,
                expected: false,
                desc: "键值相同但非Map Entry的数组（引用不同，类型也不同）"
            },
            {
                target: entry3,
                expected: false,
                desc: "不同Map迭代返回的Entry实例（键值相同，引用不同）"
            }
        ];

        // 3. 执行验证，确保引用匹配逻辑正确
        for (const { target, expected, desc } of testCases) {
            const actual = testArray.includes(target);
            // 补充Entry信息，便于错误定位（Entry的键值+是否为Map Entry）
            const targetInfo = `键值[${target[0]}, ${target[1]}]，是否为Map Entry：${target instanceof Array && testMap.has(target[0]) ? '是（但需验证引用）' : '否'}`;
            if (actual !== expected) {
                throw new Error(`Test101 失败：
                测试场景：${desc}
                目标Entry信息：${targetInfo}
                预期结果：${expected}
                实际结果：${actual}
                原因：Entry是引用类型，仅同一实例匹配，键值相同不代表引用相同`);
            }
        }

        // 4. 补充验证：Entry对象作为元素时，includes不依赖Map本身的状态
        testMap.delete("name"); // 删除Map中的键，不影响已生成的Entry对象引用
        if (!testArray.includes(entry1)) {
            throw new Error(`Test101 失败：删除Map中的键后，已生成的Entry对象引用未变，includes应返回true，实际返回false`);
        }

        return "Test Passed: IncludesMapEntryObjectTest101";
    }
};