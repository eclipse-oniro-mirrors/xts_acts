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

export const ArrayIndexOfTestUtils = {
    /**
     * 001. 检测数组中「存在的数字」，返回正确索引
     * 特性：基本类型（数字）匹配，返回目标元素首次出现的索引
     */
    async test001_IndexOfExistsNumber() {
        const testArray = [2, 5, 8, 11, 14]; // 目标8在索引2
        const target = 8;
        const expected = 2;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test001 失败：数组[${testArray}]，检测目标${target}，预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfExistsNumberTest001";
    },

    /**
     * 002. 检测数组中「不存在的字符串」，返回-1
     * 特性：数组不含目标值时，返回-1（区别于includes返回false）
     */
    async test002_IndexOfNotExistsString() {
        const testArray = ["apple", "banana", "orange", "mango"]; // 不含"grape"
        const target = "grape";
        const expected = -1;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test002 失败：数组[${testArray}]，检测目标"${target}"，预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfNotExistsStringTest002";
    },

    /**
     * 003. 检测数组中的「NaN」，返回-1（不支持NaN匹配，区别于includes）
     * 特性：indexOf用「===」匹配，NaN !== NaN，故无法识别NaN，返回-1
     */
    async test003_IndexOfNotSupportNaN() {
        const testArray = [10, NaN, 20, "NaN", 30]; // 含NaN
        const target = NaN;
        const expected = -1;

        const actual = testArray.indexOf(target);
        // 对比includes的差异（仅作特性说明，不影响测试结果）
        const includesResult = testArray.includes(target); // 预期true

        if (actual !== expected) {
            throw new Error(`Test003 失败：数组含NaN，indexOf返回${actual}（预期${expected}），includes返回${includesResult}（作对比，支持NaN）`);
        }

        return "Test Passed: IndexOfNotSupportNaNTes003";
    },

    /**
     * 004. 处理「稀疏数组的空槽」，检测undefined返回-1（空槽≠显式undefined）
     * 特性：稀疏数组的空槽不视为显式undefined，indexOf(undefined)无法匹配空槽，返回-1（区别于includes）
     */
    async test004_IndexOfSparseArraySlot() {
        const testArray = [5, , 15, 20]; // index1为空槽（非显式undefined）
        const target = undefined;
        const expected = -1;

        const actual = testArray.indexOf(target);
        // 对比includes的差异（空槽视为undefined，返回true）
        const includesResult = testArray.includes(target);

        if (actual !== expected) {
            throw new Error(`Test004 失败：稀疏数组[${testArray}]（index1为空槽），检测undefined，indexOf返回${actual}（预期${expected}），includes返回${includesResult}（作对比）`);
        }

        return "Test Passed: IndexOfSparseArraySlotTest004";
    },

    /**
     * 005. 使用「正向fromIndex」，从指定位置向后搜索首次匹配的索引
     * 特性：fromIndex指定起始位置，仅搜索索引≥fromIndex的元素，返回首次匹配的索引
     */
    async test005_IndexOfWithFromIndexPositive() {
        const testArray = [1, 2, 3, 2, 4]; // 2分别在索引1和3
        const target = 2;
        const fromIndex = 2; // 从索引2开始，首次匹配在索引3
        const expected = 3;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test005 失败：数组[${testArray}]，目标${target}，fromIndex=${fromIndex}，预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfWithFromIndexPositiveTest005";
    },

    /**
     * 006. 使用「超出数组长度的fromIndex」，返回-1
     * 特性：fromIndex ≥ 数组长度时，无搜索范围，直接返回-1
     */
    async test006_IndexOfWithFromIndexExceed() {
        const testArray = [100, 200, 300, 400]; // 长度4
        const target = 200;
        const fromIndex = 5; // 5 ≥ 4，超出范围
        const expected = -1;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test006 失败：数组长度${testArray.length}，fromIndex=${fromIndex}，检测${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfWithFromIndexExceedTest006";
    },

    /**
     * 007. 使用「负向fromIndex」，从后向前计算起始位置（等价于array.length + fromIndex）
     * 特性：负fromIndex转换为「数组长度 + fromIndex」，作为起始位置，搜索首次匹配的索引
     */
    async test007_IndexOfWithFromIndexNegative() {
        const testArray = [1, 3, 5, 7, 9]; // 长度5
        const target = 7;
        const fromIndex = -2; // 等价于5 + (-2) = 3，从索引3开始搜索
        const expected = 3;

        const actual = testArray.indexOf(target, fromIndex);
        const realStartIndex = testArray.length + fromIndex;

        if (actual !== expected) {
            throw new Error(`Test007 失败：数组长度${testArray.length}，fromIndex=${fromIndex}（实际起始${realStartIndex}），检测${target}，预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfWithFromIndexNegativeTest007";
    },

    /**
     * 008. 检测「引用类型（对象）」，仅同一引用返回正确索引，不同引用返回-1
     * 特性：引用类型需严格相等（===，同一引用），否则返回-1
     */
    async test008_IndexOfReferenceTypeObject() {
        const obj1 = { id: 1, value: "test" };
        const obj2 = { id: 1, value: "test" }; // 同值不同引用
        const testArray = [obj1, 10, "str"]; // obj1在索引0

        // 检测同一引用（obj1），预期返回0
        const actual1 = testArray.indexOf(obj1);
        // 检测不同引用（obj2），预期返回-1
        const actual2 = testArray.indexOf(obj2);

        if (actual1 !== 0 || actual2 !== -1) {
            throw new Error(`Test008 失败：检测obj1（同一引用）预期0实际${actual1}，检测obj2（不同引用）预期-1实际${actual2}`);
        }

        return "Test Passed: IndexOfReferenceTypeObjectTest008";
    },

    /**
     * 009. 区分「字符串数字与数字」，返回-1（严格类型匹配）
     * 特性：indexOf用「===」匹配，类型不同即使值相同也不匹配，返回-1
     */
    async test009_IndexOfDistinguishStringNum() {
        const testArray = ["5", 10, 15, "20"]; // 含字符串"5"，不含数字5
        const target = 5; // 数字类型，与"5"类型不同
        const expected = -1;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test009 失败：数组含"5"（字符串），检测5（数字），预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfDistinguishStringNumTest009";
    },

    /**
     * 010. 处理「空数组」，任何目标均返回-1
     * 特性：空数组无元素，检测任何目标值均返回-1（区别于includes返回false）
     */
    async test010_IndexOfEmptyArray() {
        const testArray = []; // 空数组
        const testTargets = [0, "test", NaN, null, undefined, {}, []]; // 多种目标
        const expected = -1;

        for (const target of testTargets) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test010 失败：空数组检测${JSON.stringify(target)}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfEmptyArrayTest010";
    },

    /**
     * 011. fromIndex为「0」（从数组开头搜索，返回首次匹配索引）
     * 特性：fromIndex=0等价于默认不指定，从第一个元素开始搜索，返回首次匹配的索引
     */
    async test011_IndexOfWithFromIndexZero() {
        const testArray = ["a", "b", "c", "b"]; // "b"首次在索引1
        const target = "b";
        const fromIndex = 0;
        const expected = 1;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test011 失败：数组[${testArray}]，目标"${target}"，fromIndex=${fromIndex}，预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfWithFromIndexZeroTest011";
    },

    /**
     * 012. 数组中「含重复元素」，返回首次匹配的索引
     * 特性：indexOf仅返回目标元素在数组中「首次出现」的索引，后续重复元素不影响
     */
    async test012_IndexOfDuplicateElements() {
        const testArray = [5, 3, 5, 7, 5]; // 5分别在索引0、2、4，首次在0
        const target = 5;
        const expected = 0;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test012 失败：数组[${testArray}]（含重复${target}），预期首次索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfDuplicateElementsTest012";
    },

    /**
     * 013. 检测「显式undefined」（非空槽），返回正确索引
     * 特性：数组含显式undefined时，indexOf(undefined)返回其索引（区别于稀疏数组的空槽）
     */
    async test013_IndexOfExplicitUndefined() {
        const testArray = [10, undefined, 20, undefined, 30]; // 显式undefined在索引1、3
        const target = undefined;
        const expected = 1; // 首次出现的索引

        const actual = testArray.indexOf(target);
        // 对比稀疏数组：若数组是[10,,20]，indexOf(undefined)返回-1（空槽≠显式undefined）
        const sparseArray = [10, , 20];
        const sparseResult = sparseArray.indexOf(undefined);

        if (actual !== expected) {
            throw new Error(`Test013 失败：
                显式undefined数组[${testArray}]，检测undefined预期索引${expected}，实际${actual}；
                稀疏数组[${sparseArray}]检测undefined返回${sparseResult}（作对比）`);
        }

        return "Test Passed: IndexOfExplicitUndefinedTest013";
    },

    /**
     * 014. fromIndex为「负数且绝对值超数组长度」（等价于0，从开头搜索）
     * 特性：fromIndex < -array.length 时，自动转为0，返回首次匹配的索引
     */
    async test014_IndexOfFromIndexNegExceedLength() {
        const testArray = [2, 4, 6, 8]; // 长度4，fromIndex=-5 < -4
        const target = 6;
        const fromIndex = -5;
        const expected = 2;
        const realStart = Math.max(testArray.length + fromIndex, 0); // 4-5=-1→0

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test014 失败：
                数组长度${testArray.length}，fromIndex=${fromIndex}（实际起始${realStart}）；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNegExceedLengthTest014";
    },

    /**
     * 015. 检测「数组中的null」，返回正确索引（区分null与undefined）
     * 特性：indexOf严格区分null与undefined，数组含null时找null返回索引，找undefined返回-1
     */
    async test015_IndexOfNullValue() {
        const testArray = [null, "a", null, "b"]; // null在索引0、2，首次在0
        const testCases = [
            { target: null, expected: 0 },
            { target: undefined, expected: -1 } // 数组不含undefined
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test015 失败：数组[${testArray}]，检测${target}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfNullValueTest015";
    },

    /**
     * 016. fromIndex为「小数」（自动向下取整，按整数索引搜索）
     * 特性：fromIndex为小数时，按ToInteger规则向下取整（如3.9→3，2.1→2）
     */
    async test016_IndexOfFromIndexDecimal() {
        const testArray = [1, 3, 5, 7, 9]; // 7在索引3
        const target = 7;
        const fromIndex = 3.9; // 向下取整为3
        const expected = 3;
        const convertedFromIndex = Math.floor(fromIndex);

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test016 失败：
                fromIndex=${fromIndex}（自动向下取整为${convertedFromIndex}）；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexDecimalTest016";
    },

    /**
     * 017. 检测「嵌套数组（引用不同）」，返回-1
     * 特性：嵌套数组是引用类型，新数组实例与数组内嵌套数组引用不同，返回-1
     */
    async test017_IndexOfNestedArrayDifferentRef() {
        const nestedArr = [10, 20];
        const testArray = [nestedArr, 30, 40]; // 含nestedArr（索引0）
        const target = [10, 20]; // 新数组实例，引用不同

        const actual = testArray.indexOf(target);
        const expected = -1;
        // 对比：检测同一引用的nestedArr，返回0
        const sameRefResult = testArray.indexOf(nestedArr);

        if (actual !== expected) {
            throw new Error(`Test017 失败：
                检测新嵌套数组[10,20]（引用不同）预期${expected}，实际${actual}；
                检测同一引用nestedArr返回${sameRefResult}（作对比）`);
        }

        return "Test Passed: IndexOfNestedArrayDifferentRefTest017";
    },

    /**
     * 018. 区分「布尔值与数字」（true≠1，false≠0），返回-1
     * 特性：indexOf用「===」匹配，布尔值与数字类型不同，即使值对应也返回-1
     */
    async test018_IndexOfBooleanVsNumber() {
        const testArray = [1, 0, "true", "false"]; // 含1、0，不含true、false
        const testCases = [
            { target: true, expected: -1 }, // true !== 1
            { target: false, expected: -1 } // false !== 0
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test018 失败：数组[${testArray}]，检测${target}（vs ${target ? 1 : 0}），预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfBooleanVsNumberTest018";
    },

    /**
     * 019. fromIndex为「字符串类型数字」（自动转为数字，按整数索引搜索）
     * 特性：fromIndex为字符串数字时，按ToInteger规则转为数字（如"2"→2）
     */
    async test019_IndexOfFromIndexStringNum() {
        const testArray = [5, 10, 15, 20, 25]; // 20在索引3
        const target = 20;
        const fromIndex = "3"; // 转为数字3
        const expected = 3;
        const convertedFromIndex = parseInt(fromIndex, 10);

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test019 失败：
                fromIndex="${fromIndex}"（自动转为${convertedFromIndex}）；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexStringNumTest019";
    },

    /**
     * 020. 检测「Symbol实例」（同一实例返回索引，不同实例返回-1）
     * 特性：Symbol是引用类型，同一实例返回索引，不同实例（同描述）返回-1
     */
    async test020_IndexOfSymbolInstance() {
        const sym1 = Symbol("test");
        const sym2 = Symbol("test"); // 同描述不同实例
        const testArray = [sym1, 100, 200]; // sym1在索引0

        const testCases = [
            { target: sym1, expected: 0 },
            { target: sym2, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test020 失败：
                    检测Symbol("${target.description}")，${expected === 0 ? '同一实例' : '不同实例'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfSymbolInstanceTest020";
    },

    /**
     * 021. 检测「Infinity」，返回正确索引（区分Infinity与-Infinity）
     * 特性：Infinity是特殊值，严格匹配，数组含Infinity时找-Infinity返回-1
     */
    async test021_IndexOfInfinityValue() {
        const testArray = [Infinity, 50, Infinity, 60]; // Infinity在索引0、2
        const testCases = [
            { target: Infinity, expected: 0 },
            { target: -Infinity, expected: -1 } // 数组不含-Infinity
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test021 失败：数组[${testArray}]，检测${target}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfInfinityValueTest021";
    },

    /**
     * 022. fromIndex为「布尔值」（true→1，false→0）
     * 特性：布尔值作为fromIndex时，按ToInteger转为数字（true→1，false→0）
     */
    async test022_IndexOfFromIndexBoolean() {
        const testArray = ["x", "y", "z", "y"]; // "y"在索引1、3
        const testCases = [
            { target: "y", fromIndex: true, expected: 1, converted: 1 }, // true→1
            { target: "y", fromIndex: false, expected: 1, converted: 0 } // false→0，首次在1
        ];

        for (const { target, fromIndex, expected, converted } of testCases) {
            const actual = testArray.indexOf(target, fromIndex);
            if (actual !== expected) {
                throw new Error(`Test022 失败：
                    fromIndex=${fromIndex}（转为${converted}）；
                    目标"${target}"预期索引${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfFromIndexBooleanTest022";
    },

    /**
     * 023. 检测「Date实例」（同一实例返回索引，不同实例返回-1）
     * 特性：Date是引用类型，同一实例返回索引，不同实例（同时间）返回-1
     */
    async test023_IndexOfDateInstance() {
        const date1 = new Date("2024-01-01");
        const date2 = new Date("2024-01-01"); // 同时间不同实例
        const testArray = [date1, "other", 100]; // date1在索引0

        const testCases = [
            { target: date1, expected: 0 },
            { target: date2, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test023 失败：
                    检测Date(${target.toISOString()})，${expected === 0 ? '同一实例' : '不同实例'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfDateInstanceTest023";
    },

    /**
     * 024. fromIndex为「普通对象」（转为NaN→0，从开头搜索）
     * 特性：非数字/字符串的fromIndex（如对象），按ToInteger转为NaN→0
     */
    async test024_IndexOfFromIndexObject() {
        const testArray = [3, 6, 9, 12]; // 9在索引2
        const target = 9;
        const fromIndex = { key: "val" }; // 普通对象，转为NaN→0
        const expected = 2;
        const convertedFromIndex = 0;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test024 失败：
                fromIndex=${JSON.stringify(fromIndex)}（转为${convertedFromIndex}）；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexObjectTest024";
    },

    /**
     * 025. 区分「BigInt与数字」（10n≠10），返回-1
     * 特性：BigInt与Number类型不同，即使值相同，indexOf也返回-1
     */
    async test025_IndexOfBigIntVsNumber() {
        const testArray = [10n, 20, 30n]; // 含10n，不含10（数字）
        const target = 10; // 数字类型
        const expected = -1;

        const actual = testArray.indexOf(target);
        // 对比：检测10n（BigInt）返回0
        const bigIntResult = testArray.indexOf(10n);

        if (actual !== expected) {
            throw new Error(`Test025 失败：
                数组含10n（BigInt），检测10（Number）预期${expected}，实际${actual}；
                检测10n返回${bigIntResult}（作对比）`);
        }

        return "Test Passed: IndexOfBigIntVsNumberTest025";
    },

    /**
     * 026. 类数组对象「调用indexOf」（通过Array.prototype.indexOf.call）
     * 特性：类数组对象（含length和数字索引）可通过call调用indexOf，返回正确索引
     */
    async test026_IndexOfOnArrayLike() {
        // 类数组对象：length=4，数字索引0-3对应元素
        const arrayLike = { length: 4, 0: "a", 1: "b", 2: "c", 3: "b" };
        const target = "b"; // 首次在索引1
        const expected = 1;

        // 通过call调用数组的indexOf方法
        const actual = Array.prototype.indexOf.call(arrayLike, target);
        if (actual !== expected) {
            throw new Error(`Test026 失败：
                类数组${JSON.stringify(arrayLike)}，检测"${target}"；
                预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfOnArrayLikeTest026";
    },

    /**
     * 027. fromIndex为「-Infinity」（转为0，从开头搜索）
     * 特性：-Infinity作为fromIndex，按ToInteger转为0，返回首次匹配索引
     */
    async test027_IndexOfFromIndexNegativeInfinity() {
        const testArray = [100, 200, 300, 400]; // 300在索引2
        const target = 300;
        const fromIndex = -Infinity;
        const expected = 2;
        const convertedFromIndex = 0;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test027 失败：
                fromIndex=${fromIndex}（转为${convertedFromIndex}）；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNegativeInfinityTest027";
    },

    /**
     * 028. 数组中「含多个undefined」，返回首次出现的索引
     * 特性：数组含多个显式undefined时，indexOf返回第一个undefined的索引
     */
    async test028_IndexOfMultipleUndefined() {
        const testArray = [undefined, 5, undefined, 10, undefined]; // undefined在0、2、4
        const target = undefined;
        const expected = 0;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test028 失败：
                数组[${testArray}]（含多个undefined）；
                预期首次索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfMultipleUndefinedTest028";
    },

    /**
     * 029. fromIndex为「字符串非数字」（转为NaN→0，从开头搜索）
     * 特性：非数字字符串的fromIndex（如"abc"），按ToInteger转为NaN→0
     */
    async test029_IndexOfFromIndexNonNumString() {
        const testArray = ["cat", "dog", "bird", "fish"]; // "bird"在索引2
        const target = "bird";
        const fromIndex = "not-a-number"; // 非数字字符串，转为NaN→0
        const expected = 2;
        const convertedFromIndex = 0;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test029 失败：
                fromIndex="${fromIndex}"（转为${convertedFromIndex}）；
                目标"${target}"预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNonNumStringTest029";
    },

    /**
     * 030. 检测「数组的prototype属性」（非元素），返回-1
     * 特性：indexOf仅检测数组的索引元素，不检测数组自身的prototype属性
     */
    async test030_IndexOfArrayPrototypeProperty() {
        const testArray = [1, 2, 3];
        // 给Array.prototype添加自定义属性（模拟非元素属性）
        Array.prototype.customProp = "test-prop";
        const target = "test-prop";
        const expected = -1;

        const actual = testArray.indexOf(target);
        // 清理：删除添加的prototype属性，避免影响其他测试
        delete Array.prototype.customProp;

        if (actual !== expected) {
            throw new Error(`Test030 失败：
                检测数组prototype的customProp="${target}"（非元素）；
                预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfArrayPrototypePropertyTest030";
    },

    /**
     * 031. fromIndex为「-0」（等价于0，从开头搜索返回首次索引）
     * 特性：-0与0在ToInteger转换后均为0，fromIndex=-0等价于fromIndex=0
     */
    async test031_IndexOfFromIndexNegativeZero() {
        const testArray = ["a", "b", "c", "a"]; // "a"首次在索引0
        const target = "a";
        const fromIndex = -0; // 等价于0
        const expected = 0;
        const convertedFromIndex = 0; // -0→0

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test031 失败：
                fromIndex=-0（转为${convertedFromIndex}）；
                目标"${target}"预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNegativeZeroTest031";
    },

    /**
     * 032. 检测「RegExp实例」（同一实例返回索引，不同实例返回-1）
     * 特性：RegExp是引用类型，同一实例返回索引，不同实例（即使规则/标志相同）返回-1
     */
    async test032_IndexOfRegExpInstance() {
        const reg1 = /test/g;
        const reg2 = /test/g; // 同规则/标志，不同实例
        const reg3 = /test/i; // 不同标志，不同实例
        const testArray = [reg1, 10, 20]; // reg1在索引0

        const testCases = [
            { target: reg1, expected: 0 },
            { target: reg2, expected: -1 },
            { target: reg3, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test032 失败：
                    检测RegExp(${target.source}, ${target.flags})，${expected === 0 ? '同一实例' : '不同实例'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfRegExpInstanceTest032";
    },

    /**
     * 033. 检测「数组中的空字符串」，返回首次出现的索引
     * 特性：空字符串作为目标时，indexOf返回其首次出现的索引，区分空字符串与非空字符串
     */
    async test033_IndexOfEmptyString() {
        const testArray = ["", "a", "", "b", ""]; // 空字符串在索引0、2、4
        const target = "";
        const expected = 0;

        const actual = testArray.indexOf(target);
        // 对比：检测非空字符串"a"返回1
        const nonEmptyResult = testArray.indexOf("a");

        if (actual !== expected) {
            throw new Error(`Test033 失败：
                数组[${JSON.stringify(testArray)}]（含多个空字符串）；
                检测空字符串预期索引${expected}，实际${actual}；
                检测"a"返回${nonEmptyResult}（作对比）`);
        }

        return "Test Passed: IndexOfEmptyStringTest033";
    },

    /**
     * 034. fromIndex为「数组长度-1」（仅搜索最后一个元素）
     * 特性：fromIndex=array.length-1时，仅搜索最后一个元素，存在则返回该索引，不存在返回-1
     */
    async test034_IndexOfFromIndexLastElement() {
        const testArray = [1, 3, 5, 7]; // 长度4，length-1=3
        const testCases = [
            { target: 7, fromIndex: 3, expected: 3 }, // 最后一个元素存在
            { target: 5, fromIndex: 3, expected: -1 } // 最后一个元素不存在目标
        ];

        for (const { target, fromIndex, expected } of testCases) {
            const actual = testArray.indexOf(target, fromIndex);
            if (actual !== expected) {
                throw new Error(`Test034 失败：
                    数组长度${testArray.length}，fromIndex=${fromIndex}（仅搜索最后一个元素）；
                    检测${target}预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfFromIndexLastElementTest034";
    },

    /**
     * 035. 检测「绑定this后的函数」（新实例返回-1，原函数返回索引）
     * 特性：函数bind后生成新实例，与原函数引用不同，indexOf返回-1
     */
    async test035_IndexOfBoundFunction() {
        const originalFunc = () => console.log("test");
        const boundFunc = originalFunc.bind(null); // 新实例，引用不同
        const testArray = [originalFunc, "str", 100]; // originalFunc在索引0

        const testCases = [
            { target: originalFunc, expected: 0 },
            { target: boundFunc, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test035 失败：
                    检测${expected === 0 ? '原函数' : 'bind后新函数'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfBoundFunctionTest035";
    },

    /**
     * 036. 检测「不同值的BigInt」（10n≠20n，返回-1）
     * 特性：BigInt严格匹配值，不同值的BigInt视为不同元素，indexOf返回-1
     */
    async test036_IndexOfDifferentBigInt() {
        const testArray = [10n, 30n, 40n]; // 含10n，不含20n
        const target = 20n;
        const expected = -1;

        const actual = testArray.indexOf(target);
        // 对比：检测10n返回0
        const sameBigIntResult = testArray.indexOf(10n);

        if (actual !== expected) {
            throw new Error(`Test036 失败：
                数组含[10n,30n,40n]，检测20n预期${expected}，实际${actual}；
                检测10n返回${sameBigIntResult}（作对比）`);
        }

        return "Test Passed: IndexOfDifferentBigIntTest036";
    },

    /**
     * 037. 类数组对象「含空槽」（空槽≠显式undefined，indexOf(undefined)返回-1）
     * 特性：类数组的空槽与数组空槽一致，不视为显式undefined，检测undefined返回-1
     */
    async test037_IndexOfArrayLikeWithEmptySlot() {
        // 类数组：length=4，索引0、2有值，1、3为空槽
        const arrayLike = { length: 4, 0: "x", 2: "z" };
        const target = undefined;
        const expected = -1;

        const actual = Array.prototype.indexOf.call(arrayLike, target);
        // 对比：检测显式undefined的类数组，返回对应索引
        const arrayLikeWithUndefined = { length: 4, 0: "x", 1: undefined, 2: "z" };
        const definedResult = Array.prototype.indexOf.call(arrayLikeWithUndefined, undefined);

        if (actual !== expected) {
            throw new Error(`Test037 失败：
                含空槽的类数组${JSON.stringify(arrayLike)}，检测undefined预期${expected}，实际${actual}；
                含显式undefined的类数组检测返回${definedResult}（作对比）`);
        }

        return "Test Passed: IndexOfArrayLikeWithEmptySlotTest037";
    },

    /**
     * 038. fromIndex为「NaN」（转为0，从开头搜索返回首次索引）
     * 特性：NaN作为fromIndex时，按ToInteger转为0，返回首次匹配的索引
     */
    async test038_IndexOfFromIndexNaN() {
        const testArray = [2, 4, 6, 8, 6]; // 6首次在索引2
        const target = 6;
        const fromIndex = NaN;
        const expected = 2;
        const convertedFromIndex = 0;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test038 失败：
                fromIndex=${fromIndex}（转为${convertedFromIndex}）；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNaNTes038";
    },

    /**
     * 039. 检测「数组中的-Infinity」，返回正确索引（区分-Infinity与Infinity）
     * 特性：-Infinity严格匹配，数组含-Infinity时找Infinity返回-1
     */
    async test039_IndexOfNegativeInfinity() {
        const testArray = [-Infinity, 10, -Infinity, 20]; // -Infinity在索引0、2
        const testCases = [
            { target: -Infinity, expected: 0 },
            { target: Infinity, expected: -1 } // 数组不含Infinity
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test039 失败：
                    数组[${testArray}]，检测${target}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfNegativeInfinityTest039";
    },

    /**
     * 040. 字符串「区分大小写」，返回-1（"Apple"≠"apple"）
     * 特性：indexOf检测字符串时严格区分大小写，大小写不同视为不同元素
     */
    async test040_IndexOfStringCaseSensitive() {
        const testArray = ["Apple", "Banana", "Cherry"]; // 含"Apple"，不含"apple"
        const target = "apple";
        const expected = -1;

        const actual = testArray.indexOf(target);
        // 对比：检测"Apple"返回0
        const sameCaseResult = testArray.indexOf("Apple");

        if (actual !== expected) {
            throw new Error(`Test040 失败：
                数组含"Apple"，检测"${target}"（大小写不同）预期${expected}，实际${actual}；
                检测"Apple"返回${sameCaseResult}（作对比）`);
        }

        return "Test Passed: IndexOfStringCaseSensitiveTest040";
    },

    /**
     * 041. 数组中「含多个相同引用对象」，返回首次出现的索引
     * 特性：多个相同引用的对象，indexOf返回第一个对象的索引
     */
    async test041_IndexOfMultipleSameRefObject() {
        const sharedObj = { id: 1, value: "shared" };
        const testArray = [sharedObj, 10, sharedObj, 20, sharedObj]; // sharedObj在0、2、4
        const target = sharedObj;
        const expected = 0;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test041 失败：
                数组含多个相同引用的${JSON.stringify(sharedObj)}；
                预期首次索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfMultipleSameRefObjectTest041";
    },

    /**
     * 042. 检测「数组中的数组元素（同一引用）」，返回正确索引
     * 特性：数组元素为数组时，同一引用返回索引，不同引用返回-1
     */
    async test042_IndexOfArrayElementSameRef() {
        const nestedArr = [1, 2, 3];
        const testArray = ["a", nestedArr, "b", [1, 2, 3]]; // nestedArr在索引1，新数组在3
        const testCases = [
            { target: nestedArr, expected: 1 }, // 同一引用
            { target: [1, 2, 3], expected: -1 } // 不同引用
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test042 失败：
                    检测数组${JSON.stringify(target)}，${expected === 1 ? '同一引用' : '不同引用'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfArrayElementSameRefTest042";
    },

    /**
     * 043. Symbol作为「fromIndex」，抛出TypeError（无法转为数字）
     * 特性：Symbol无法转换为数字，作为fromIndex时indexOf抛出TypeError（符合ES规范）
     */
    async test043_IndexOfFromIndexSymbol() {
        const testArray = [1, 2, 3];
        const target = 2;
        const invalidFromIndex = Symbol("from-index");
        let errorCaught = false;

        try {
            testArray.indexOf(target, invalidFromIndex);
        } catch (err) {
            if (err instanceof TypeError && err.message.includes("Symbol") && err.message.includes("number")) {
                errorCaught = true;
            } else {
                throw new Error(`Test043 失败：
                    捕获的错误不符合预期，实际错误类型${err.name}，信息：${err.message}`);
            }
        }

        if (!errorCaught) {
            throw new Error(`Test043 失败：
                Symbol作为fromIndex时未抛出TypeError（违背ES规范）`);
        }

        return "Test Passed: IndexOfFromIndexSymbolTest043";
    },

    /**
     * 044. BigInt作为「fromIndex」，抛出TypeError（无法转为数字）
     * 特性：BigInt无法转换为Number，作为fromIndex时indexOf抛出TypeError（符合ES规范）
     */
    async test044_IndexOfFromIndexBigInt() {
        const testArray = [4, 5, 6];
        const target = 5;
        const invalidFromIndex = 1n; // BigInt类型
        let errorCaught = false;

        try {
            testArray.indexOf(target, invalidFromIndex);
        } catch (err) {
            if (err instanceof TypeError && err.message.includes("BigInt") && err.message.includes("number")) {
                errorCaught = true;
            } else {
                throw new Error(`Test044 失败：
                    捕获的错误不符合预期，实际错误类型${err.name}，信息：${err.message}`);
            }
        }

        if (!errorCaught) {
            throw new Error(`Test044 失败：
                BigInt作为fromIndex时未抛出TypeError（违背ES规范）`);
        }

        return "Test Passed: IndexOfFromIndexBigIntTest044";
    },

    /**
     * 045. 区分「空字符串与空格字符串」（""≠" "，返回-1）
     * 特性：空字符串与空格字符串是不同元素，indexOf严格匹配，返回对应结果
     */
    async test045_IndexOfEmptyStrVsSpace() {
        const testArray = ["", "a", " ", "b"]; // 空字符串在0，空格在2
        const testCases = [
            { target: "", expected: 0 },
            { target: " ", expected: 2 },
            { target: "empty", expected: -1 } // 不存在
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test045 失败：
                    数组[${JSON.stringify(testArray)}]，检测"${target}"；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfEmptyStrVsSpaceTest045";
    },

    /**
     * 046. fromIndex为「最大安全整数」（超出数组长度返回-1）
     * 特性：fromIndex=Number.MAX_SAFE_INTEGER（9007199254740991）远超数组长度，返回-1
     */
    async test046_IndexOfFromIndexMaxSafeInt() {
        const testArray = [10, 20, 30]; // 长度3
        const target = 20;
        const fromIndex = Number.MAX_SAFE_INTEGER;
        const expected = -1;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test046 失败：
                数组长度${testArray.length}，fromIndex=${fromIndex}（远超长度）；
                检测${target}预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexMaxSafeIntTest046";
    },

    /**
     * 047. 检测「循环引用对象」（同一引用返回索引，不受循环引用影响）
     * 特性：循环引用对象仍是引用类型，同一实例返回索引，不同实例返回-1
     */
    async test047_IndexOfCircularObject() {
        // 创建循环引用对象：obj.self = obj
        const circularObj = { name: "circular" };
        circularObj.self = circularObj;
        const testArray = [circularObj, 50, 60]; // circularObj在索引0
        const otherCircularObj = { name: "circular" }; // 不同实例，也循环引用
        otherCircularObj.self = otherCircularObj;

        const testCases = [
            { target: circularObj, expected: 0 },
            { target: otherCircularObj, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test047 失败：
                    检测循环引用对象，${expected === 0 ? '同一实例' : '不同实例'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfCircularObjectTest047";
    },

    /**
     * 048. 检测「函数的prototype属性」（非元素），返回-1
     * 特性：indexOf仅检测数组元素，不检测函数的prototype属性
     */
    async test048_IndexOfFunctionPrototype() {
        const func = () => {};
        const testArray = [func, 100, 200]; // 含func，不含func.prototype
        const target = func.prototype;
        const expected = -1;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test048 失败：
                数组含func，检测func.prototype（非元素）；
                预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFunctionPrototypeTest048";
    },

    /**
     * 049. 类数组对象「含非数字索引」（忽略非数字索引，仅检测数字索引元素）
     * 特性：类数组的非数字索引不参与indexOf检测，仅数字索引对应的元素有效
     */
    async test049_IndexOfArrayLikeNonNumberKey() {
        // 类数组：数字索引0、1有效，非数字索引"key"忽略
        const arrayLike = { length: 2, 0: "a", 1: "b", key: "c" };
        const testCases = [
            { target: "b", expected: 1 }, // 数字索引1的元素
            { target: "c", expected: -1 } // 非数字索引"key"的元素，忽略
        ];

        for (const { target, expected } of testCases) {
            const actual = Array.prototype.indexOf.call(arrayLike, target);
            if (actual !== expected) {
                throw new Error(`Test049 失败：
                    类数组${JSON.stringify(arrayLike)}，检测"${target}"；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfArrayLikeNonNumberKeyTest049";
    },

    /**
     * 050. 综合场景：数组含「基本类型+引用类型+特殊值」，批量检测
     * 特性：综合验证indexOf对多种类型的匹配逻辑，突出与includes的差异（如NaN返回-1）
     */
    async test050_IndexOfComprehensiveScene() {
        const obj = { id: 2 };
        const sym = Symbol("comprehensive");
        const testArray = [
            5, "10", NaN, null, undefined, obj, sym,
            () => {}, new Date("2024-02-01")
        ];

        const testCases = [
            { target: 5, expected: 0 },
            { target: "10", expected: 1 },
            { target: NaN, expected: -1 }, // indexOf不支持NaN
            { target: null, expected: 3 },
            { target: undefined, expected: 4 },
            { target: obj, expected: 5 },
            { target: sym, expected: 6 },
            { target: {}, expected: -1 }, // 新对象
            { target: Symbol("comprehensive"), expected: -1 }, // 新Symbol
            { target: 10, expected: -1 } // 数字10≠字符串"10"
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test050 失败：
                    检测${JSON.stringify(target)}，预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfComprehensiveSceneTest050";
    },

    /**
     * 051. fromIndex为「负小数」（向下取整，如-2.5→-3，计算实际起始索引）
     * 特性：负小数fromIndex按ToInteger规则向下取整，再通过「数组长度+取整结果」得到实际起始索引
     */
    async test051_IndexOfFromIndexNegativeDecimal() {
        const testArray = [1, 2, 3, 4, 5]; // 长度5
        const target = 3; // 索引2，需在搜索范围内
        const fromIndex = -2.5; // 负小数→向下取整为-3
        const expected = 2;
        const floorFromIndex = Math.floor(fromIndex); // -3
        const realStart = testArray.length + floorFromIndex; // 5-3=2

        const actual = testArray.indexOf(target, realStart);
        if (actual !== expected) {
            throw new Error(`Test051 失败：
                fromIndex=${fromIndex}→向下取整${floorFromIndex}→实际起始${realStart}；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNegativeDecimalTest051";
    },

    /**
     * 052. 区分「0和-0」（0===-0，返回0的索引）
     * 特性：严格相等中0与-0等价，数组含0时检测-0返回0的索引，含-0时检测0返回-0的索引
     */
    async test052_IndexOfZeroVsNegativeZero() {
        const testArrayWithZero = [0, 10, 20]; // 含0（索引0）
        const testArrayWithNegZero = [-0, 30, 40]; // 含-0（索引0）
        const testCases = [
            { array: testArrayWithZero, target: -0, expected: 0 }, // 0===-0
            { array: testArrayWithNegZero, target: 0, expected: 0 }, // -0===0
            { array: [5, 6], target: 0, expected: -1 } // 不含0/-0
        ];

        for (const { array, target, expected } of testCases) {
            const actual = array.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test052 失败：
                    数组[${array}]检测${target}（${target === 0 ? '0' : '-0'}）；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfZeroVsNegativeZeroTest052";
    },

    /**
     * 053. 检测「数组末尾的undefined」（显式undefined，返回正确索引）
     * 特性：显式undefined在数组末尾时，indexOf仍能正确定位其索引，不遗漏末尾元素
     */
    async test053_IndexOfUndefinedAtEnd() {
        const testArray = [100, 200, 300, undefined]; // undefined在索引3（末尾）
        const target = undefined;
        const expected = 3;

        const actual = testArray.indexOf(target);
        // 对比：稀疏数组末尾空槽，检测undefined返回-1
        const sparseArray = [100, 200, 300, ,];
        const sparseResult = sparseArray.indexOf(undefined);

        if (actual !== expected) {
            throw new Error(`Test053 失败：
                显式undefined在末尾的数组[${testArray}]，检测undefined预期${expected}，实际${actual}；
                稀疏数组末尾空槽检测返回${sparseResult}（作对比）`);
        }

        return "Test Passed: IndexOfUndefinedAtEndTest053";
    },

    /**
     * 054. 检测「Set实例」（同一实例返回索引，不同实例返回-1）
     * 特性：Set是引用类型，同一实例返回索引，不同实例（即使元素相同）返回-1
     */
    async test054_IndexOfSetInstance() {
        const set1 = new Set([1, 2, 3]);
        const set2 = new Set([1, 2, 3]); // 同元素不同实例
        const testArray = [set1, "other", 500]; // set1在索引0

        const testCases = [
            { target: set1, expected: 0 },
            { target: set2, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test054 失败：
                    检测Set${Array.from(target)}，${expected === 0 ? '同一实例' : '不同实例'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfSetInstanceTest054";
    },

    /**
     * 055. 类数组对象「长度为0（空类数组）」，任何目标返回-1
     * 特性：空类数组（length=0）无有效元素，检测任何目标均返回-1，与空数组逻辑一致
     */
    async test055_IndexOfEmptyArrayLike() {
        const emptyArrayLike = { length: 0 }; // 空类数组
        const testTargets = [1, "test", null, undefined, {}, []]; // 多种目标
        const expected = -1;

        for (const target of testTargets) {
            const actual = Array.prototype.indexOf.call(emptyArrayLike, target);
            if (actual !== expected) {
                throw new Error(`Test055 失败：
                    空类数组${JSON.stringify(emptyArrayLike)}检测${JSON.stringify(target)}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfEmptyArrayLikeTest055";
    },

    /**
     * 056. fromIndex为「带小数的字符串数字」（转为整数，如"2.8"→2）
     * 特性：字符串数字含小数时，按ToInteger规则转为整数（忽略小数部分），再作为起始索引
     */
    async test056_IndexOfFromIndexStringDecimal() {
        const testArray = [5, 10, 15, 20, 25]; // 15在索引2，20在索引3
        const target = 20;
        const fromIndex = "2.8"; // 字符串小数→转为2
        const expected = 3;
        const convertedFromIndex = Math.floor(parseFloat(fromIndex)); // 2

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test056 失败：
                fromIndex="${fromIndex}"→转为${convertedFromIndex}；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexStringDecimalTest056";
    },

    /**
     * 057. 检测「数组中的子字符串」（非完整元素，返回-1）
     * 特性：indexOf匹配完整元素，若目标是数组元素的子字符串（非完全一致），返回-1
     */
    async test057_IndexOfSubstring() {
        const testArray = ["apple", "banana", "cherry"]; // 含"apple"，不含"app"
        const target = "app"; // 子字符串，非完整元素
        const expected = -1;

        const actual = testArray.indexOf(target);
        // 对比：检测完整元素"apple"返回0
        const fullStrResult = testArray.indexOf("apple");

        if (actual !== expected) {
            throw new Error(`Test057 失败：
                数组含"apple"，检测子字符串"${target}"预期${expected}，实际${actual}；
                检测完整元素"apple"返回${fullStrResult}（作对比）`);
        }

        return "Test Passed: IndexOfSubstringTest057";
    },

    /**
     * 058. fromIndex为「-1.3」（向下取整为-2，计算实际起始索引）
     * 特性：负小数fromIndex向下取整（-1.3→-2），确保符合ToInteger规范，不向零取整
     */
    async test058_IndexOfFromIndexNegativeDecimalSmall() {
        const testArray = [10, 20, 30, 40]; // 长度4
        const target = 30; // 索引2
        const fromIndex = -1.3; // 向下取整为-2
        const expected = 2;
        const floorFromIndex = Math.floor(fromIndex); // -2
        const realStart = testArray.length + floorFromIndex; // 4-2=2

        const actual = testArray.indexOf(target, realStart);
        if (actual !== expected) {
            throw new Error(`Test058 失败：
                fromIndex=${fromIndex}→向下取整${floorFromIndex}→实际起始${realStart}；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNegativeDecimalSmallTest058";
    },

    /**
     * 059. 检测「数组中的箭头函数与普通函数」（不同类型返回-1）
     * 特性：箭头函数与普通函数是不同引用类型，即使功能相同，indexOf也返回-1
     */
    async test059_IndexOfArrowVsNormalFunc() {
        const normalFunc = function() { return "test"; };
        const arrowFunc = () => "test"; // 功能相同，类型不同
        const testArray = [normalFunc, 600, 700]; // normalFunc在索引0

        const testCases = [
            { target: normalFunc, expected: 0 },
            { target: arrowFunc, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test059 失败：
                    检测${expected === 0 ? '普通函数' : '箭头函数'}，功能相同但类型不同；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfArrowVsNormalFuncTest059";
    },

    /**
     * 060. 类数组对象「含NaN」，检测NaN返回-1（与数组逻辑一致）
     * 特性：类数组含NaN时，indexOf不支持NaN匹配（NaN !== NaN），返回-1，与数组行为一致
     */
    async test060_IndexOfArrayLikeWithNaN() {
        const arrayLikeWithNaN = { length: 3, 0: 10, 1: NaN, 2: 20 }; // 含NaN（索引1）
        const target = NaN;
        const expected = -1;

        const actual = Array.prototype.indexOf.call(arrayLikeWithNaN, target);
        // 对比：includes检测类数组NaN返回true（indexOf与includes差异）
        const includesResult = Array.prototype.includes.call(arrayLikeWithNaN, target);

        if (actual !== expected) {
            throw new Error(`Test060 失败：
                含NaN的类数组${JSON.stringify(arrayLikeWithNaN)}检测NaN；
                indexOf预期${expected}实际${actual}，includes返回${includesResult}（作对比）`);
        }

        return "Test Passed: IndexOfArrayLikeWithNaNTes060";
    },

    /**
     * 061. fromIndex为「Infinity」（远超数组长度，返回-1）
     * 特性：Infinity作为fromIndex时，远超任何数组长度，无搜索范围，返回-1
     */
    async test061_IndexOfFromIndexInfinity() {
        const testArray = [1, 2, 3, 4];
        const target = 2;
        const fromIndex = Infinity;
        const expected = -1;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test061 失败：
                fromIndex=${fromIndex}（远超数组长度${testArray.length}）；
                检测${target}预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexInfinityTest061";
    },

    /**
     * 062. 检测「数组的Symbol.iterator属性」（非元素，返回-1）
     * 特性：indexOf仅检测数组的索引元素，不检测数组自身的内置属性（如Symbol.iterator）
     */
    async test062_IndexOfArraySymbolIterator() {
        const testArray = [5, 6, 7];
        const target = Array.prototype[Symbol.iterator]; // 数组的内置迭代器属性
        const expected = -1;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test062 失败：
                检测数组的Symbol.iterator属性（非元素）；
                预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfArraySymbolIteratorTest062";
    },

    /**
     * 063. 数组中「含多个相同Date实例（同一引用）」，返回首次索引
     * 特性：同一Date实例在数组中重复出现时，indexOf返回首次出现的索引
     */
    async test063_IndexOfMultipleSameDate() {
        const sharedDate = new Date("2024-03-01");
        const testArray = [sharedDate, 800, sharedDate, 900, sharedDate]; // 首次在索引0
        const target = sharedDate;
        const expected = 0;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test063 失败：
                数组含多个相同引用的Date(${sharedDate.toDateString()})；
                预期首次索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfMultipleSameDateTest063";
    },

    /**
     * 064. 类数组对象「显式undefined」，检测返回正确索引
     * 特性：类数组含显式undefined时，indexOf返回其索引，区别于空槽的-1
     */
    async test064_IndexOfArrayLikeWithExplicitUndefined() {
        const arrayLikeWithUndefined = { length: 4, 0: "a", 1: undefined, 2: "b", 3: undefined };
        const target = undefined;
        const expected = 1; // 首次显式undefined的索引

        const actual = Array.prototype.indexOf.call(arrayLikeWithUndefined, target);
        if (actual !== expected) {
            throw new Error(`Test064 失败：
                含显式undefined的类数组${JSON.stringify(arrayLikeWithUndefined)}；
                检测undefined预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfArrayLikeWithExplicitUndefinedTest064";
    },

    /**
     * 065. fromIndex为「字符串数字带负号」（如"-1"，转为-1后计算起始索引）
     * 特性：字符串负数字（如"-1"）按ToInteger转为对应负数，再计算实际起始索引
     */
    async test065_IndexOfFromIndexStringNegativeNum() {
        const testArray = [10, 20, 30, 40, 50]; // 长度5
        const target = 40; // 索引3
        const fromIndex = "-2"; // 字符串负数字→转为-2
        const expected = 3;
        const convertedFromIndex = parseInt(fromIndex, 10); // -2
        const realStart = testArray.length + convertedFromIndex; // 5-2=3

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test065 失败：
                fromIndex="${fromIndex}"→转为${convertedFromIndex}→实际起始${realStart}；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexStringNegativeNumTest065";
    },

    /**
     * 066. 检测「数组中的空对象」（不同实例返回-1，同一实例返回索引）
     * 特性：空对象是引用类型，不同实例（即使结构相同）返回-1，同一实例返回索引
     */
    async test066_IndexOfEmptyObject() {
        const emptyObj1 = {};
        const emptyObj2 = {}; // 不同实例
        const testArray = [emptyObj1, 1000, 1100]; // emptyObj1在索引0

        const testCases = [
            { target: emptyObj1, expected: 0 },
            { target: emptyObj2, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test066 失败：
                    检测空对象${JSON.stringify(target)}，${expected === 0 ? '同一实例' : '不同实例'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfEmptyObjectTest066";
    },

    /**
     * 067. 类数组对象「长度为1」，检测唯一元素返回0
     * 特性：类数组长度为1且含唯一元素时，indexOf检测该元素返回0，与数组逻辑一致
     */
    async test067_IndexOfArrayLikeLengthOne() {
        const arrayLikeLengthOne = { length: 1, 0: "test-value" }; // 唯一元素在索引0
        const target = "test-value";
        const expected = 0;

        const actual = Array.prototype.indexOf.call(arrayLikeLengthOne, target);
        if (actual !== expected) {
            throw new Error(`Test067 失败：
                长度为1的类数组${JSON.stringify(arrayLikeLengthOne)}；
                检测唯一元素"${target}"预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfArrayLikeLengthOneTest067";
    },

    /**
     * 068. fromIndex为「-array.length」（转为0，从开头搜索返回首次索引）
     * 特性：fromIndex=-array.length时，计算后起始索引为0，返回首次匹配的索引
     */
    async test068_IndexOfFromIndexNegativeLength() {
        const testArray = [3, 6, 9, 12]; // 长度4，fromIndex=-4
        const target = 6; // 索引1
        const fromIndex = -testArray.length; // -4
        const expected = 1;
        const realStart = testArray.length + fromIndex; // 4-4=0

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test068 失败：
                数组长度${testArray.length}，fromIndex=${fromIndex}→实际起始${realStart}；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNegativeLengthTest068";
    },

    /**
     * 069. 检测「Number.MAX_VALUE和Number.MIN_VALUE」（严格匹配，返回正确索引）
     * 特性：Number极值（MAX_VALUE/MIN_VALUE）作为元素时，indexOf严格匹配返回对应索引
     */
    async test069_IndexOfNumberExtremes() {
        const maxVal = Number.MAX_VALUE;
        const minVal = Number.MIN_VALUE;
        const testArray = [maxVal, 10, minVal, 20]; // maxVal在0，minVal在2
        const testCases = [
            { target: maxVal, expected: 0 },
            { target: minVal, expected: 2 },
            { target: Number.MAX_SAFE_INTEGER, expected: -1 } // 非极值，不存在
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test069 失败：
                    检测${target === maxVal ? 'Number.MAX_VALUE' : target === minVal ? 'Number.MIN_VALUE' : 'Number.MAX_SAFE_INTEGER'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfNumberExtremesTest069";
    },

    /**
     * 070. 综合场景：混合「类数组、引用类型、负小数fromIndex」批量检测
     * 特性：综合验证类数组处理、引用类型匹配、负小数fromIndex转换的核心逻辑
     */
    async test070_IndexOfComprehensiveMixed() {
        // 准备测试数据
        const sharedMap = new Map([["key", "val"]]);
        const arrayLike = { length: 5, 0: sharedMap, 1: 100, 2: NaN, 3: undefined, 4: sharedMap };
        const testCases = [
            // 类数组检测引用类型（同一实例）
            { target: sharedMap, fromIndex: "0", expected: 0 },
            // 类数组检测NaN（返回-1）
            { target: NaN, fromIndex: 0, expected: -1 },
            // 数组检测显式undefined（负小数fromIndex）
            { array: [5, undefined, 15], target: undefined, fromIndex: -2.2, expected: 1 },
            // 类数组检测非存在元素
            { target: 200, fromIndex: 0, expected: -1 }
        ];

        for (const { array = arrayLike, target, fromIndex, expected } of testCases) {
            const actual = Array.prototype.indexOf.call(array, target, fromIndex);
            if (actual !== expected) {
                throw new Error(`Test070 失败：
                    数据源${Array.isArray(array) ? '数组' : '类数组'}${JSON.stringify(array)}；
                    检测${JSON.stringify(target)}，fromIndex=${fromIndex}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfComprehensiveMixedTest070";
    },

    /**
     * 071. fromIndex为「null」（转为0，从开头搜索返回首次索引）
     * 特性：ES规范中ToInteger(null)===0，fromIndex=null等价于fromIndex=0
     */
    async test071_IndexOfFromIndexNull() {
        const testArray = ["apple", "banana", "cherry"]; // "banana"在索引1
        const target = "banana";
        const fromIndex = null;
        const expected = 1;
        const convertedFromIndex = 0; // null→0

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test071 失败：
                fromIndex=null（转为${convertedFromIndex}）；
                目标"${target}"预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNullTest071";
    },

    /**
     * 072. 数组实例「含不可枚举属性」（不影响indexOf，仅检测索引元素）
     * 特性：indexOf仅遍历数组索引对应的元素，忽略实例自身的不可枚举属性
     */
    async test072_IndexOfArrayWithNonEnumerableProp() {
        const testArray = [10, 20, 30];
        // 给数组实例添加不可枚举属性（非索引元素）
        Object.defineProperty(testArray, "hiddenProp", {
            value: 40,
            enumerable: false
        });
        const target = 40; // 不可枚举属性的值，非元素
        const expected = -1;

        const actual = testArray.indexOf(target);
        // 验证：检测正常元素20返回1（确保数组本身无问题）
        const normalResult = testArray.indexOf(20);

        if (actual !== expected || normalResult !== 1) {
            throw new Error(`Test072 失败：
                数组含不可枚举属性hiddenProp=40，检测40预期${expected}实际${actual}；
                检测正常元素20预期1实际${normalResult}`);
        }

        return "Test Passed: IndexOfArrayWithNonEnumerablePropTest072";
    },

    /**
     * 073. 检测「多层嵌套数组的内层引用」（同一内层数组返回索引，不同返回-1）
     * 特性：多层嵌套数组仍按引用匹配，同一内层实例返回索引，不同实例返回-1
     */
    async test073_IndexOfDeepNestedArray() {
        const innerArr = [2, [3]]; // 内层数组（2层嵌套）
        const testArray = [1, innerArr, 4, [2, [3]]]; // innerArr在索引1，新内层数组在3
        const testCases = [
            { target: innerArr, expected: 1 }, // 同一内层引用
            { target: [2, [3]], expected: -1 } // 不同内层引用
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test073 失败：
                    检测多层嵌套数组${JSON.stringify(target)}，${expected === 1 ? '同一引用' : '不同引用'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfDeepNestedArrayTest073";
    },

    /**
     * 074. fromIndex为「undefined」（转为0，从开头搜索返回首次索引）
     * 特性：ES规范中ToInteger(undefined)===0，fromIndex=undefined等价于默认无参数
     */
    async test074_IndexOfFromIndexUndefined() {
        const testArray = [5, 15, 25, 35]; // 25在索引2
        const target = 25;
        const fromIndex = undefined;
        const expected = 2;
        const convertedFromIndex = 0; // undefined→0

        const actual = testArray.indexOf(target, fromIndex);
        // 对比：无fromIndex参数时返回相同结果
        const noFromIndexResult = testArray.indexOf(target);

        if (actual !== expected || noFromIndexResult !== expected) {
            throw new Error(`Test074 失败：
                fromIndex=undefined（转为${convertedFromIndex}），检测25预期${expected}实际${actual}；
                无fromIndex参数时预期${expected}实际${noFromIndexResult}`);
        }

        return "Test Passed: IndexOfFromIndexUndefinedTest074";
    },

    /**
     * 075. 检测「含转义字符的字符串元素」（严格匹配，转义字符不同视为不同元素）
     * 特性：字符串中的转义字符（如"\n"）参与严格匹配，与普通字符区分
     */
    async test075_IndexOfStringWithEscapeChar() {
        const testArray = ["line1\nline2", "line1line2", "line1\tline2"]; // 含换行符的字符串在索引0
        const testCases = [
            { target: "line1\nline2", expected: 0 }, // 匹配转义字符
            { target: "line1line2", expected: 1 }, // 无转义字符
            { target: "line1\nline3", expected: -1 } // 转义后内容不同
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test075 失败：
                    检测含转义字符的字符串"${target.replace(/\n/g, '\\n').replace(/\t/g, '\\t')}"；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfStringWithEscapeCharTest075";
    },

    /**
     * 076. 检测「箭头函数bind后的实例」（箭头函数bind仍生成新引用，返回-1）
     * 特性：箭头函数无prototype，但bind后仍创建新函数实例，与原函数引用不同
     */
    async test076_IndexOfArrowFuncBind() {
        const arrowFunc = () => "arrow-test";
        const boundArrowFunc = arrowFunc.bind(null); // 箭头函数bind生成新实例
        const testArray = [arrowFunc, 100, 200]; // arrowFunc在索引0

        const testCases = [
            { target: arrowFunc, expected: 0 },
            { target: boundArrowFunc, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test076 失败：
                    检测${expected === 0 ? '原箭头函数' : 'bind后箭头函数'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfArrowFuncBindTest076";
    },

    /**
     * 077. 类数组对象「length为字符串类型」（ToUint32转为数字，检测有效元素）
     * 特性：类数组length为字符串时，按ToUint32转为数字（如"5"→5），仅检测0~length-1的索引
     */
    async test077_IndexOfArrayLikeStringLength() {
        // 类数组：length="5"→ToUint32转为5，索引0、2、4有值
        const arrayLike = { length: "5", 0: "a", 2: "c", 4: "e" };
        const testCases = [
            { target: "c", expected: 2 }, // 索引2在0~4范围内
            { target: "f", expected: -1 }, // 不存在
            { target: "a", expected: 0 } // 索引0有效
        ];

        for (const { target, expected } of testCases) {
            const actual = Array.prototype.indexOf.call(arrayLike, target);
            if (actual !== expected) {
                throw new Error(`Test077 失败：
                    类数组length="5"（转为5），检测"${target}"；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfArrayLikeStringLengthTest077";
    },

    /**
     * 078. 检测「Symbol.for创建的共享Symbol」（同一key的Symbol引用相同，返回索引）
     * 特性：Symbol.for(key)创建的Symbol全局共享，同一key的Symbol引用相同，不同key不同
     */
    async test078_IndexOfSharedSymbol() {
        const sharedSym1 = Symbol.for("shared-key");
        const sharedSym2 = Symbol.for("shared-key"); // 同一key，引用相同
        const sharedSym3 = Symbol.for("other-key"); // 不同key，引用不同
        const testArray = [sharedSym1, 300, 400]; // sharedSym1在索引0

        const testCases = [
            { target: sharedSym2, expected: 0 }, // 同一key，引用相同
            { target: sharedSym3, expected: -1 } // 不同key，引用不同
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test078 失败：
                    检测Symbol.for("${Symbol.keyFor(target)}")，${expected === 0 ? '同一key共享引用' : '不同key'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfSharedSymbolTest078";
    },

    /**
     * 079. fromIndex为「极大负数（-1000）」（数组长度小，转为0，返回首次索引）
     * 特性：fromIndex绝对值远超数组长度时，转为0，从开头搜索返回首次匹配索引
     */
    async test079_IndexOfFromIndexExtremeNegative() {
        const testArray = [2, 4, 6]; // 长度3，fromIndex=-1000 < -3
        const target = 4; // 索引1
        const fromIndex = -1000;
        const expected = 1;
        const realStart = Math.max(testArray.length + fromIndex, 0); // 3-1000=-997→0

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test079 失败：
                数组长度${testArray.length}，fromIndex=${fromIndex}→实际起始${realStart}；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexExtremeNegativeTest079";
    },

    /**
     * 080. 同一Date实例「修改时间后」（引用不变，仍返回原索引）
     * 特性：Date实例修改时间后，引用未变，indexOf仍识别为同一实例，返回原索引
     */
    async test080_IndexOfDateModifyTime() {
        const dateInstance = new Date("2024-01-01");
        const testArray = [dateInstance, 500, 600]; // dateInstance在索引0
        // 修改Date实例的时间（引用不变）
        dateInstance.setDate(2); // 改为2024-01-02

        const actual = testArray.indexOf(dateInstance);
        const expected = 0;

        if (actual !== expected) {
            throw new Error(`Test080 失败：
                Date实例修改时间后（引用不变），检测该实例；
                预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfDateModifyTimeTest080";
    },

    /**
     * 081. 类数组对象「索引不连续」（跳过空槽，仅检测存在的索引元素）
     * 特性：类数组索引不连续时，空槽视为不存在元素，indexOf跳过空槽检测有效元素
     */
    async test081_IndexOfArrayLikeDiscontinuousKeys() {
        // 类数组：length=5，索引0、3有值，1、2、4为空槽
        const arrayLike = { length: 5, 0: "x", 3: "y" };
        const testCases = [
            { target: "y", expected: 3 }, // 索引3存在
            { target: "z", expected: -1 }, // 不存在
            { target: "x", expected: 0 } // 索引0存在
        ];

        for (const { target, expected } of testCases) {
            const actual = Array.prototype.indexOf.call(arrayLike, target);
            if (actual !== expected) {
                throw new Error(`Test081 失败：
                    索引不连续的类数组${JSON.stringify(arrayLike)}，检测"${target}"；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfArrayLikeDiscontinuousKeysTest081";
    },

    /**
     * 082. fromIndex为「字符串"0"」（转为0，数组长度1时返回0）
     * 特性：字符串"0"按ToInteger转为0，数组长度1时检测唯一元素返回0
     */
    async test082_IndexOfFromIndexStringZero() {
        const testArray = ["only-element"]; // 长度1，唯一元素在索引0
        const target = "only-element";
        const fromIndex = "0"; // 转为0
        const expected = 0;
        const convertedFromIndex = parseInt(fromIndex, 10); // 0

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test082 失败：
                fromIndex="${fromIndex}"（转为${convertedFromIndex}），数组长度1；
                检测"${target}"预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexStringZeroTest082";
    },

    /**
     * 083. 数组中「含重复BigInt元素」（返回首次出现的BigInt索引）
     * 特性：BigInt作为元素重复时，indexOf返回首次出现的索引，后续重复不影响
     */
    async test083_IndexOfDuplicateBigInt() {
        const testArray = [10n, 20n, 10n, 30n, 10n]; // 10n首次在索引0
        const target = 10n;
        const expected = 0;

        const actual = testArray.indexOf(target);
        // 对比：检测20n返回1（确保BigInt检测正常）
        const otherBigIntResult = testArray.indexOf(20n);

        if (actual !== expected || otherBigIntResult !== 1) {
            throw new Error(`Test083 失败：
                数组含重复10n，检测10n预期${expected}实际${actual}；
                检测20n预期1实际${otherBigIntResult}`);
        }

        return "Test Passed: IndexOfDuplicateBigIntTest083";
    },

    /**
     * 084. fromIndex为「true且数组长度1」（true→1，超出长度返回-1）
     * 特性：fromIndex=true→1，数组长度1时1≥1，无搜索范围，返回-1
     */
    async test084_IndexOfFromIndexTrueLengthOne() {
        const testArray = [10]; // 长度1
        const target = 10;
        const fromIndex = true; // 转为1
        const expected = -1;
        const convertedFromIndex = 1;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test084 失败：
                fromIndex=${fromIndex}（转为${convertedFromIndex}），数组长度1；
                检测${target}预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexTrueLengthOneTest084";
    },

    /**
     * 085. 区分「空字符串和"undefined"字符串」（严格匹配，返回对应索引）
     * 特性：""与"undefined"是不同元素，indexOf严格匹配，返回各自索引
     */
    async test085_IndexOfEmptyStrVsUndefinedStr() {
        const testArray = ["", "undefined", "null", ""]; // ""在0、3；"undefined"在1
        const testCases = [
            { target: "", expected: 0 },
            { target: "undefined", expected: 1 },
            { target: undefined, expected: -1 } // 数组不含undefined
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test085 失败：
                    数组[${JSON.stringify(testArray)}]，检测${JSON.stringify(target)}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfEmptyStrVsUndefinedStrTest085";
    },

    /**
     * 086. 类数组对象「含显式undefined和空槽」（仅检测显式undefined，返回对应索引）
     * 特性：类数组的显式undefined≠空槽，indexOf仅检测显式undefined，空槽返回-1
     */
    async test086_IndexOfArrayLikeWithUndefinedAndSlot() {
        // 类数组：索引1显式undefined，索引2空槽，索引4显式undefined
        const arrayLike = { length: 5, 0: "a", 1: undefined, 3: "d", 4: undefined };
        const target = undefined;
        const expected = 1; // 首次显式undefined的索引

        const actual = Array.prototype.indexOf.call(arrayLike, target);
        // 对比：检测索引2空槽（无值），返回-1
        const emptySlotResult = Array.prototype.indexOf.call(arrayLike, "empty-slot");

        if (actual !== expected || emptySlotResult !== -1) {
            throw new Error(`Test086 失败：
                类数组含显式undefined（索引1、4），检测undefined预期${expected}实际${actual}；
                检测空槽预期-1实际${emptySlotResult}`);
        }

        return "Test Passed: IndexOfArrayLikeWithUndefinedAndSlotTest086";
    },

    /**
     * 087. RegExp实例「修改flags后」（引用不变，仍返回原索引）
     * 特性：RegExp实例修改flags后，引用未变，indexOf仍识别为同一实例
     */
    async test087_IndexOfRegExpModifyFlags() {
        const regInstance = /test/; // 初始无flags
        const testArray = [regInstance, 700, 800]; // regInstance在索引0
        // 修改RegExp实例的flags（非标准方法，部分环境支持，此处验证引用）
        if (Object.defineProperty) {
            Object.defineProperty(regInstance, "flags", { value: "g" });
        }

        const actual = testArray.indexOf(regInstance);
        const expected = 0;

        if (actual !== expected) {
            throw new Error(`Test087 失败：
                RegExp实例修改flags后（引用不变），检测该实例；
                预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfRegExpModifyFlagsTest087";
    },

    /**
     * 088. 空数组「fromIndex为NaN」（转为0，但空数组无元素，返回-1）
     * 特性：空数组即使fromIndex转为0，因无元素，检测任何目标均返回-1
     */
    async test088_IndexOfEmptyArrayFromIndexNaN() {
        const testArray = []; // 空数组
        const target = "any-value";
        const fromIndex = NaN; // 转为0
        const expected = -1;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test088 失败：
                空数组fromIndex=${fromIndex}（转为0），检测"${target}"；
                预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfEmptyArrayFromIndexNaNTes088";
    },

    /**
     * 089. 数组中「含多个相同RegExp实例（同一引用）」（返回首次出现的索引）
     * 特性：同一RegExp实例在数组中重复时，indexOf返回首次出现的索引
     */
    async test089_IndexOfDuplicateRegExp() {
        const regShared = /shared/gi;
        const testArray = [regShared, 900, regShared, 1000, regShared]; // 首次在索引0
        const target = regShared;
        const expected = 0;

        const actual = testArray.indexOf(target);
        if (actual !== expected) {
            throw new Error(`Test089 失败：
                数组含多个相同引用的RegExp${regShared}；
                检测该实例预期首次索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfDuplicateRegExpTest089";
    },

    /**
     * 090. 综合场景：混合「不可枚举属性、嵌套数组、转义字符字符串」批量检测
     * 特性：综合验证indexOf对不可枚举属性忽略、嵌套引用匹配、特殊字符严格匹配的逻辑
     */
    async test090_IndexOfComprehensiveComplex() {
        // 准备测试数据
        const nested = [1, "\t"]; // 含转义字符的嵌套数组
        const testArray = [nested, "line\nbreak", 500];
        // 添加不可枚举属性
        Object.defineProperty(testArray, "hidden", { value: "ignore", enumerable: false });

        const testCases = [
            { target: nested, expected: 0 }, // 嵌套数组引用匹配
            { target: "line\nbreak", expected: 1 }, // 转义字符字符串匹配
            { target: "ignore", expected: -1 }, // 不可枚举属性忽略
            { target: [1, "\t"], expected: -1 }, // 不同嵌套引用
            { target: 500, expected: 2 } // 普通数字匹配
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test090 失败：
                    检测${JSON.stringify(target).replace(/\n/g, '\\n').replace(/\t/g, '\\t')}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfComprehensiveComplexTest090";
    },
    /**
     * 091. fromIndex为「非整数负数字符串」（如"-2.5"，先转数字再向下取整为-3）
     * 特性：非整数负数字符串按ToInteger规则：先转数字（-2.5）→向下取整（-3）→计算实际起始索引
     */
    async test091_IndexOfFromIndexNonIntNegString() {
        const testArray = [1, 2, 3, 4, 5, 6]; // 长度6
        const target = 4; // 索引3
        const fromIndex = "-2.5"; // 非整数负数字符串
        const expected = 3;
        // 转换步骤："-2.5"→-2.5（Number）→-3（Math.floor）→6-3=3（实际起始）
        const numFromIndex = Number(fromIndex);
        const floorFromIndex = Math.floor(numFromIndex);
        const realStart = testArray.length + floorFromIndex;

        const actual = testArray.indexOf(target, realStart);
        if (actual !== expected) {
            throw new Error(`Test091 失败：
                fromIndex="${fromIndex}"→${numFromIndex}→向下取整${floorFromIndex}→实际起始${realStart}；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexNonIntNegStringTest091";
    },

    /**
     * 092. 检测「Buffer/Uint8Array实例」（跨环境引用匹配：Node.js用Buffer，浏览器用Uint8Array）
     * 特性：Buffer/Uint8Array是引用类型，同一实例返回索引，不同实例（即使内容相同）返回-1
     */
    async test092_IndexOfBufferOrUint8Array() {
        // 跨环境适配：Node.js用Buffer，浏览器用Uint8Array
        let BinaryClass;
        let binaryInstance1, binaryInstance2;
        if (typeof Buffer !== 'undefined') {
            // Node.js环境
            BinaryClass = Buffer;
            binaryInstance1 = Buffer.from([0x01, 0x02, 0x03]);
            binaryInstance2 = Buffer.from([0x01, 0x02, 0x03]); // 同内容不同实例
        } else {
            // 浏览器环境
            BinaryClass = Uint8Array;
            binaryInstance1 = new Uint8Array([1, 2, 3]);
            binaryInstance2 = new Uint8Array([1, 2, 3]); // 同内容不同实例
        }

        const testArray = [binaryInstance1, "other", 100]; // binaryInstance1在索引0
        const testCases = [
            { target: binaryInstance1, expected: 0, desc: `同一${BinaryClass.name}实例` },
            { target: binaryInstance2, expected: -1, desc: `不同${BinaryClass.name}实例（同内容）` }
        ];

        for (const { target, expected, desc } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test092 失败：
                    环境：${typeof Buffer !== 'undefined' ? 'Node.js' : '浏览器'}
                    测试场景：${desc}
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfBufferOrUint8ArrayTest092";
    },

    /**
     * 093. fromIndex为「数组长度的一半（非整数）」（如长度5→2.5，向下取整为2）
     * 特性：fromIndex为非整数时向下取整，从计算后的起始索引搜索，返回首次匹配索引
     */
    async test093_IndexOfFromIndexHalfLength() {
        const testArray = [10, 20, 30, 40, 50]; // 长度5，一半为2.5
        const target = 40; // 索引3
        const fromIndex = testArray.length / 2; // 2.5
        const expected = 3;
        const floorFromIndex = Math.floor(fromIndex); // 2
        const realStart = floorFromIndex;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test093 失败：
                数组长度${testArray.length}，fromIndex=${fromIndex}→向下取整${floorFromIndex}→实际起始${realStart}；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexHalfLengthTest093";
    },

    /**
     * 094. 检测「Unicode表情字符」（严格匹配，不同编码的相似表情视为不同元素）
     * 特性：Unicode字符按编码严格匹配，即使视觉相似（如😂与😹），编码不同则返回-1
     */
    async test094_IndexOfUnicodeEmoji() {
        const testArray = ["😂", "🚀", "🌈", "😹"]; // 含"😂"（U+1F602），不含"😀"（U+1F600）
        const testCases = [
            { target: "😂", expected: 0 }, // 完全匹配
            { target: "😀", expected: -1 }, // 视觉相似但编码不同
            { target: "🚀", expected: 1 } // 其他表情匹配
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test094 失败：
                    检测Unicode表情"${target}"（编码U+${target.codePointAt(0).toString(16).toUpperCase()}）；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfUnicodeEmojiTest094";
    },

    /**
     * 095. 类数组对象「length=0但含索引属性」（忽略索引属性，任何目标返回-1）
     * 特性：类数组length=0时，即使有索引属性（如0:"a"），也无有效元素，返回-1
     */
    async test095_IndexOfArrayLikeZeroLengthWithProps() {
        // 类数组：length=0，索引0有值但无效
        const arrayLike = { length: 0, 0: "a", 1: "b" };
        const testTargets = ["a", "b", 10];
        const expected = -1;

        for (const target of testTargets) {
            const actual = Array.prototype.indexOf.call(arrayLike, target);
            if (actual !== expected) {
                throw new Error(`Test095 失败：
                    类数组${JSON.stringify(arrayLike)}（length=0）检测"${target}"；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfArrayLikeZeroLengthWithPropsTest095";
    },

    /**
     * 096. fromIndex为「null且数组为空」（null→0，但空数组无元素，返回-1）
     * 特性：fromIndex=null转为0，但空数组无搜索范围，任何目标返回-1
     */
    async test096_IndexOfEmptyArrayFromIndexNull() {
        const testArray = []; // 空数组
        const target = "any";
        const fromIndex = null;
        const expected = -1;
        const convertedFromIndex = 0; // null→0

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test096 失败：
                空数组fromIndex=${fromIndex}（转为${convertedFromIndex}），检测"${target}"；
                预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfEmptyArrayFromIndexNullTest096";
    },

    /**
     * 097. 检测「同名不同参数的函数」（函数参数不同视为不同引用，返回-1）
     * 特性：函数的参数列表是函数标识的一部分，即使名字相同，参数不同也是不同引用
     */
    async test097_IndexOfSameNameDiffParamFunc() {
        // 同名函数，参数不同
        function func(a) { return a; }
        function func(a, b) { return a + b; }
        const testArray = [func, 200, 300]; // 存储的是第二个func（带两个参数）

        const testCases = [
            { target: func, expected: 0 }, // 匹配第二个func（同一引用）
            { target: function func(a) { return a; }, expected: -1 } // 第一个func（不同引用）
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test097 失败：
                    检测${expected === 0 ? '带两个参数的func' : '带一个参数的func'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfSameNameDiffParamFuncTest097";
    },



    /**
     * 099. fromIndex为「Infinity且数组非空」（远超数组长度，返回-1）
     * 特性：Infinity作为fromIndex时，无论数组长度多大，均超出范围，返回-1
     */
    async test099_IndexOfFromIndexInfinityNonEmpty() {
        const testArray = [1, 2, 3, 4, 5, 6, 7]; // 非空数组，长度7
        const target = 4;
        const fromIndex = Infinity;
        const expected = -1;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test099 失败：
                非空数组长度${testArray.length}，fromIndex=${fromIndex}（远超长度）；
                检测${target}预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexInfinityNonEmptyTest099";
    },

    /**
     * 100. 区分「数组中的NaN和字符串"NaN"」（严格匹配，返回对应索引或-1）
     * 特性：NaN（数字类型）与"NaN"（字符串类型）是不同元素，indexOf严格区分
     */
    async test100_IndexOfNaNVsStringNaN() {
        const testArray = [NaN, "NaN", 10, NaN, "nan"]; // NaN在0/3，"NaN"在1
        const testCases = [
            { target: NaN, expected: -1 }, // indexOf不支持NaN匹配
            { target: "NaN", expected: 1 }, // 匹配字符串"NaN"
            { target: "nan", expected: 4 }, // 匹配小写"nan"
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test100 失败：
                    数组[${testArray.map(item => isNaN(item) ? 'NaN' : item)}]检测${typeof target === 'string' ? `"${target}"` : target}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfNaNVsStringNaNTest100";
    },

    /**
     * 101. fromIndex为「字符串"-0"」（转为-0→0，从开头搜索返回首次索引）
     * 特性：字符串"-0"转为数字-0，ToInteger后仍为-0，等价于0，从开头搜索
     */
    async test101_IndexOfFromIndexStringNegativeZero() {
        const testArray = ["a", "b", "c"]; // "b"在索引1
        const target = "b";
        const fromIndex = "-0"; // 字符串"-0"
        const expected = 1;
        const numFromIndex = Number(fromIndex); // -0
        const convertedFromIndex = 0; // -0等价于0

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test101 失败：
                fromIndex="${fromIndex}"→${numFromIndex}→等价于${convertedFromIndex}；
                目标"${target}"预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexStringNegativeZeroTest101";
    },

    /**
     * 102. 类数组对象「length为极大值（1e5）但仅含少量元素」（检测存在元素返回索引，不存在返回-1）
     * 特性：类数组length极大时，仅遍历0~length-1内的存在元素，不影响检测效率和结果
     */
    async test102_IndexOfArrayLikeLargeLength() {
        // 类数组：length=1e5（极大），仅索引100、200有值
        const arrayLike = { length: 100000 };
        arrayLike[100] = "target-val";
        arrayLike[200] = "other-val";

        const testCases = [
            { target: "target-val", expected: 100 }, // 存在元素
            { target: "missing-val", expected: -1 }, // 不存在元素
            { target: "other-val", expected: 200 } // 其他存在元素
        ];

        for (const { target, expected } of testCases) {
            const actual = Array.prototype.indexOf.call(arrayLike, target);
            if (actual !== expected) {
                throw new Error(`Test102 失败：
                    类数组length=1e5，检测"${target}"；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfArrayLikeLargeLengthTest102";
    },

    /**
     * 103. 检测「时间相同但实例不同的Date」（引用不同，返回-1）
     * 特性：Date实例即使时间相同（毫秒数一致），也是不同引用，indexOf返回-1
     */
    async test103_IndexOfSameTimeDiffDate() {
        const timeMs = Date.now(); // 同一时间戳
        const date1 = new Date(timeMs);
        const date2 = new Date(timeMs); // 时间相同，实例不同
        const testArray = [date1, 400, 500]; // date1在索引0

        const testCases = [
            { target: date1, expected: 0 },
            { target: date2, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test103 失败：
                    检测Date(${target.toISOString()})，${expected === 0 ? '同一实例' : '时间相同不同实例'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfSameTimeDiffDateTest103";
    },

    /**
     * 104. fromIndex为「字符串"NaN"」（转为NaN→0，从开头搜索返回首次索引）
     * 特性：字符串"NaN"转为数字NaN，ToInteger后为0，从开头搜索
     */
    async test104_IndexOfFromIndexStringNaN() {
        const testArray = [5, 15, 25]; // 15在索引1
        const target = 15;
        const fromIndex = "NaN"; // 字符串"NaN"
        const expected = 1;
        const numFromIndex = Number(fromIndex); // NaN
        const convertedFromIndex = 0; // NaN→0

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test104 失败：
                fromIndex="${fromIndex}"→${numFromIndex}→转为${convertedFromIndex}；
                目标${target}预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexStringNaNTes104";
    },

    /**
     * 105. 类数组对象「length=1且含显式undefined」（检测undefined返回0）
     * 特性：类数组length=1且索引0为显式undefined时，indexOf检测undefined返回0
     */
    async test105_IndexOfArrayLikeLengthOneUndefined() {
        const arrayLike = { length: 1, 0: undefined }; // 显式undefined在索引0
        const target = undefined;
        const expected = 0;

        const actual = Array.prototype.indexOf.call(arrayLike, target);
        if (actual !== expected) {
            throw new Error(`Test105 失败：
                类数组${JSON.stringify(arrayLike)}（length=1，显式undefined）；
                检测undefined预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfArrayLikeLengthOneUndefinedTest105";
    },

    /**
     * 106. 检测「添加元素后的Set实例」（Set添加元素后引用不变，仍返回原索引）
     * 特性：Set实例添加元素后，引用未变，indexOf仍识别为同一实例，返回原索引
     */
    async test106_IndexOfSetAfterAdd() {
        const setInstance = new Set([1, 2]);
        const testArray = [setInstance, 600, 700]; // setInstance在索引0
        // 给Set添加元素（引用不变）
        setInstance.add(3);

        const actual = testArray.indexOf(setInstance);
        const expected = 0;

        if (actual !== expected) {
            throw new Error(`Test106 失败：
                Set实例添加元素后（引用不变），检测该实例；
                预期索引${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfSetAfterAddTest106";
    },

    /**
     * 107. fromIndex为「数组长度+1」（超出范围，返回-1）
     * 特性：fromIndex=array.length+1时，无搜索范围，任何目标返回-1
     */
    async test107_IndexOfFromIndexLengthPlusOne() {
        const testArray = [10, 20, 30]; // 长度3，length+1=4
        const target = 20;
        const fromIndex = testArray.length + 1;
        const expected = -1;

        const actual = testArray.indexOf(target, fromIndex);
        if (actual !== expected) {
            throw new Error(`Test107 失败：
                数组长度${testArray.length}，fromIndex=${fromIndex}（length+1）；
                检测${target}预期${expected}，实际${actual}`);
        }

        return "Test Passed: IndexOfFromIndexLengthPlusOneTest107";
    },

    /**
     * 108. 类数组对象「含非整数索引属性」（忽略非整数索引，仅检测整数索引元素）
     * 特性：类数组仅处理整数索引（如1、2），非整数索引（如1.5、2.3）视为非元素，忽略
     */
    async test108_IndexOfArrayLikeWithNonIntKeys() {
        // 类数组：length=3，整数索引1有值，非整数索引1.5有值（忽略）
        const arrayLike = { length: 3, 1: "valid", 1.5: "invalid", 2: "other" };
        const testCases = [
            { target: "valid", expected: 1 }, // 整数索引（有效）
            { target: "invalid", expected: -1 }, // 非整数索引（忽略）
            { target: "other", expected: 2 } // 其他整数索引（有效）
        ];

        for (const { target, expected } of testCases) {
            const actual = Array.prototype.indexOf.call(arrayLike, target);
            if (actual !== expected) {
                throw new Error(`Test108 失败：
                    类数组${JSON.stringify(arrayLike)}（含非整数索引）检测"${target}"；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfArrayLikeWithNonIntKeysTest108";
    },

    /**
     * 109. 检测「Symbol.keyFor相同但实例不同的Symbol」（引用不同，返回-1）
     * 特性：Symbol.keyFor仅获取Symbol的key，不同实例即使key相同，也是不同引用
     */
    async test109_IndexOfSameKeyDiffSymbol() {
        const sym1 = Symbol("test-key");
        const sym2 = Symbol("test-key"); // 同key，不同实例
        // Symbol.keyFor(sym1) === Symbol.keyFor(sym2) → true，但实例不同
        const testArray = [sym1, 800, 900]; // sym1在索引0

        const testCases = [
            { target: sym1, expected: 0 },
            { target: sym2, expected: -1 }
        ];

        for (const { target, expected } of testCases) {
            const actual = testArray.indexOf(target);
            if (actual !== expected) {
                throw new Error(`Test109 失败：
                    检测Symbol("${Symbol.keyFor(target)}")，${expected === 0 ? '同一实例' : '同key不同实例'}；
                    预期${expected}，实际${actual}`);
            }
        }

        return "Test Passed: IndexOfSameKeyDiffSymbolTest109";
    },

};