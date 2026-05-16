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

// 测试点1：Object.prototype.toLocaleString() 默认调用 this.toString()
export function Fn01_ObjectToLocaleString() {
    const customObj = {
        name: "testObj",
        toString() {
            return "CustomObject[ name: testObj ]";
        }
    };
    return customObj.toLocaleString() === customObj.toString();
}



// 测试点3：Number.prototype.toLocaleString() 本地化数字格式
export function Fn03_NumberToLocaleString() {
    const testCases = [
        { num: 9876543.21, expected: "9,876,543.21" },
        { num: -1234.56, expected: "-1,234.56" },
        { num: 0.123, expected: "0.123" }
    ];
    return testCases.every(({ num, expected }) => {
        return num.toLocaleString("zh-CN") === expected;
    });
}

// 测试点4：Date在en-US环境下的短日期格式（UTC时区）
export function Fn04_DateEnUsShortDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15)); // 2024-06-15 UTC
    const result = testDate.toLocaleString("en-US", { dateStyle: "short", timeZone: "UTC" });
    const expected = "6/15/24";
    return result === expected;
}

// 测试点5：Date在de-DE环境下的短日期格式（UTC时区）
export function Fn05_DateDeDeShortDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("de-DE", { dateStyle: "short", timeZone: "UTC" });
    const expected = "15.06.24";
    return result === expected;
}

// 测试点6：Number在zh-CN环境下的USD货币格式
export function Fn06_NumberZhCnUsdCurrency() {
    const testNum = 1234.56;
    const result = testNum.toLocaleString("zh-CN", { style: "currency", currency: "USD" });
    const expected = "US$1,234.56";
    return result === expected;
}

// 测试点7：Number在en-US环境下的EUR货币格式
export function Fn07_NumberEnUsEurCurrency() {
    const testNum = 789.12;
    const result = testNum.toLocaleString("en-US", { style: "currency", currency: "EUR" });
    const expected = "€789.12";
    return result === expected;
}

// 测试点8：Number在zh-CN环境下的百分比格式（0.5→50%）
export function Fn08_NumberZhCnPercent() {
    const testNum = 0.5;
    const result = testNum.toLocaleString("zh-CN", { style: "percent" });
    const expected = "50%";
    return result === expected;
}

// 测试点9：BigInt在zh-CN环境下的千分位格式
export function Fn09_BigIntZhCnThousandSeparator() {
    const testBigInt = 1234567890123456789n;
    const result = testBigInt.toLocaleString("zh-CN");
    const expected = "1,234,567,890,123,456,789";
    return result === expected;
}

// 测试点10：空数组的toLocaleString返回空字符串
export function Fn10_EmptyArrayToLocaleString() {
    const emptyArr = [];
    const result = emptyArr.toLocaleString("zh-CN");
    const expected = "";
    return result === expected;
}

// 测试点11：单元素数组（数字）的toLocaleString
export function Fn11_SingleElemArrayNumber() {
    const singleArr = [456];
    const result = singleArr.toLocaleString("zh-CN");
    const expected = "456";
    return result === expected;
}

// 测试点12：数组中包含null和undefined的toLocaleString
export function Fn12_ArrayWithNullUndefined() {
    const testArr = [null, undefined];
    const result = testArr.toLocaleString("zh-CN");
    const expected = ",";
    return result === expected;
}

// 测试点13：Date在en-US环境下的短时间格式（UTC时区）
export function Fn13_DateEnUsShortTime() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 14, 30));
    const result = testDate.toLocaleString("en-US", { timeStyle: "short", timeZone: "UTC" });
    const expected = "2:30 PM";
    return result === expected;
}

// 测试点14：Date在ja-JP环境下的中等时间格式（UTC时区）
export function Fn14_DateJaJpMediumTime() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 14, 30, 45));
    const result = testDate.toLocaleString("ja-JP", { timeStyle: "medium", timeZone: "UTC" });
    const expected = "14:30:45";
    return result === expected;
}

// 测试点15：Number指定最小小数位数（2位）
export function Fn15_NumberMinFractionDigits() {
    const testNum = 789;
    const result = testNum.toLocaleString("zh-CN", { minimumFractionDigits: 2 });
    const expected = "789.00";
    return result === expected;
}

// 测试点16：Number指定最大小数位数（1位）
export function Fn16_NumberMaxFractionDigits() {
    const testNum = 123.456;
    const result = testNum.toLocaleString("zh-CN", { maximumFractionDigits: 1 });
    const expected = "123.5";
    return result === expected;
}

// 测试点17：Number在en-US环境下的千分位格式
export function Fn17_NumberEnUsThousandSeparator() {
    const testNum = 987654;
    const result = testNum.toLocaleString("en-US");
    const expected = "987,654";
    return result === expected;
}

// 测试点18：Number在de-DE环境下的小数点与千分位
export function Fn18_NumberDeDeDecimalSeparator() {
    const testNum = 123456.78;
    const result = testNum.toLocaleString("de-DE");
    const expected = "123.456,78";
    return result === expected;
}

// 测试点19：BigInt在en-US环境下的千分位格式
export function Fn19_BigIntEnUsThousandSeparator() {
    const testBigInt = 987654321n;
    const result = testBigInt.toLocaleString("en-US");
    const expected = "987,654,321";
    return result === expected;
}

// 测试点20：数组混合类型（数字+日期+字符串）在ja-JP环境
export function Fn20_ArrayMixedTypeJaJp() {
    const testArr = [123.45, new Date(Date.UTC(2024, 5, 15)), "テスト"];
    const result = testArr.toLocaleString("ja-JP", { timeZone: "UTC" });
    const expected = "123.45,2024/6/15 0:00:00,テスト";
    return result === expected;
}



// 测试点22：Number在zh-CN环境下的CNY货币格式
export function Fn22_NumberZhCnCnyCurrency() {
    const testNum = 345.67;
    const result = testNum.toLocaleString("zh-CN", { style: "currency", currency: "CNY" });
    const expected = "¥345.67";
    return result === expected;
}

// 测试点23：Number在en-GB环境下的GBP货币格式
export function Fn23_NumberEnGbGbpCurrency() {
    const testNum = 567.89;
    const result = testNum.toLocaleString("en-GB", { style: "currency", currency: "GBP" });
    const expected = "£567.89";
    return result === expected;
}

// 测试点24：Number在de-DE环境下的百分比格式
export function Fn24_NumberDeDePercent() {
    const testNum = 0.75;
    const result = testNum.toLocaleString("de-DE", { style: "percent" });
    const expected = "75 %";
    return result === expected;
}

// 测试点26：Date在en-US环境下的长日期格式
export function Fn26_DateEnUsLongDate() {
    const testDate = new Date(Date.UTC(2024, 9, 1));
    const result = testDate.toLocaleString("en-US", { dateStyle: "long", timeZone: "UTC" });
    const expected = "October 1, 2024";
    return result === expected;
}

// 测试点27：空对象的toLocaleString默认返回值
export function Fn27_EmptyObjectToLocaleString() {
    const emptyObj = {};
    const result = emptyObj.toLocaleString("zh-CN");
    const expected = "[object Object]";
    return result === expected;
}

// 测试点28：自定义对象重写toLocaleString的返回值
export function Fn28_CustomObjOverrideToLocaleString() {
    const customObj = {
        product: "手机",
        price: 3999,
        toLocaleString() {
            return `商品：${this.product}，价格：¥${this.price}`;
        }
    };
    const result = customObj.toLocaleString("zh-CN");
    const expected = "商品：手机，价格：¥3999";
    return result === expected;
}

// 测试点29：数组包含NaN和Infinity的toLocaleString
export function Fn29_ArrayWithNaNInfinity() {
    const testArr = [NaN, Infinity];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "NaN,∞";
    return result === expected;
}

// 测试点32：超大BigInt在zh-CN环境下的本地化
export function Fn32_LargeBigIntZhCnLocalize() {
    const testBigInt = 98765432109876543210n;
    const result = testBigInt.toLocaleString("zh-CN");
    const expected = "98,765,432,109,876,543,210";
    return result === expected;
}

// 测试点34：嵌套数组的toLocaleString
export function Fn34_NestedArrayToLocaleString() {
    const nestedArr = [[1, 2], [3, 4]];
    const result = nestedArr.toLocaleString("zh-CN");
    const expected = "1,2,3,4";
    return result === expected;
}

// 测试点35：Number指定最小整数位数（5位）
export function Fn35_NumberMinIntegerDigits() {
    const testNum = 123;
    const result = testNum.toLocaleString("zh-CN", { minimumIntegerDigits: 5 });
    const expected = "00,123";
    return result === expected;
}

// 测试点36：货币格式指定最小小数位数为0
export function Fn36_CurrencyMinFractionDigitsZero() {
    const testNum = 456.78;
    const result = testNum.toLocaleString("zh-CN", { style: "currency", currency: "CNY", minimumFractionDigits: 0 });
    const expected = "¥456.78";
    return result === expected;
}

// 测试点37：Date在纽约时区的本地化时间
export function Fn37_DateNewYorkTimezone() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 12, 0)); // UTC 12点
    const result = testDate.toLocaleString("en-US", { timeZone: "America/New_York" });
    const expected = "6/15/2024, 8:00:00 AM"; // 纽约时区-4（夏令时）
    return result === expected;
}

// 测试点38：Number在fr-FR环境下的千分位格式
export function Fn38_NumberFrFrThousandSeparator() {
    const testNum = 123456.78;
    const result = testNum.toLocaleString("fr-FR");
    const expected = "123 456,78";
    return result === expected;
}

// 测试点39：BigInt在fr-FR环境下的本地化
export function Fn39_BigIntFrFrLocalize() {
    const testBigInt = 123456789n;
    const result = testBigInt.toLocaleString("fr-FR");
    const expected = "123 456 789";
    return result === expected;
}

// 测试点40：数组包含布尔值的toLocaleString
export function Fn40_ArrayWithBoolean() {
    const testArr = [true, false];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "true,false";
    return result === expected;
}

// 测试点41：Date在zh-CN环境下的长月份显示
export function Fn41_DateZhCnLongMonth() {
    const testDate = new Date(Date.UTC(2024, 1, 1)); // 2月
    const result = testDate.toLocaleString("zh-CN", { month: "long", timeZone: "UTC" });
    const expected = "二月";
    return result === expected;
}

// 测试点42：Date在zh-CN环境下的短月份显示
export function Fn42_DateZhCnShortMonth() {
    const testDate = new Date(Date.UTC(2024, 1, 1));
    const result = testDate.toLocaleString("zh-CN", { month: "short", timeZone: "UTC" });
    const expected = "2月";
    return result === expected;
}

// 测试点43：百分比格式指定最小小数位数（2位）
export function Fn43_PercentMinFractionDigits() {
    const testNum = 0.123;
    const result = testNum.toLocaleString("zh-CN", { style: "percent", minimumFractionDigits: 2 });
    const expected = "12.30%";
    return result === expected;
}

// 测试点46：Date在zh-CN环境下的长星期显示
export function Fn46_DateZhCnLongWeekday() {
    const testDate = new Date(Date.UTC(2024, 5, 15)); // 周六
    const result = testDate.toLocaleString("zh-CN", { weekday: "long", timeZone: "UTC" });
    const expected = "星期六";
    return result === expected;
}

// 测试点47：Date在zh-CN环境下的短星期显示
export function Fn47_DateZhCnShortWeekday() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("zh-CN", { weekday: "short", timeZone: "UTC" });
    const expected = "周六";
    return result === expected;
}

// 测试点48：数组包含空字符串的toLocaleString
export function Fn48_ArrayWithEmptyString() {
    const testArr = ["", "测试文本"];
    const result = testArr.toLocaleString("zh-CN");
    const expected = ",测试文本";
    return result === expected;
}

// 测试点49：负数值BigInt的本地化
export function Fn49_NegativeBigIntLocalize() {
    const testBigInt = -123456n;
    const result = testBigInt.toLocaleString("zh-CN");
    const expected = "-123,456";
    return result === expected;
}

// 测试点50：Infinity在en-US环境下的toLocaleString
export function Fn50_InfinityEnUsToLocaleString() {
    const testNum = Infinity;
    const result = testNum.toLocaleString("en-US");
    const expected = "∞";
    return result === expected;
}

// 测试点51：NaN在de-DE环境下的toLocaleString
export function Fn51_NaNDeDeToLocaleString() {
    const testNum = NaN;
    const result = testNum.toLocaleString("de-DE");
    const expected = "NaN";
    return result === expected;
}

// 测试点52：继承自定义toLocaleString的子对象
export function Fn52_InheritedCustomToLocaleString() {
    class Parent {
        constructor(name) {
            this.name = name;
        }
        toLocaleString() {
            return `父类对象：${this.name}`;
        }
    }
    class Child extends Parent {}
    const childObj = new Child("测试子类");
    const result = childObj.toLocaleString("zh-CN");
    const expected = "父类对象：测试子类";
    return result === expected;
}

// 测试点53：ja-JP环境下数组的分隔符（全角逗号）
export function Fn53_ArrayJaJpSeparator() {
    const testArr = [1, 2, 3];
    const result = testArr.toLocaleString("ja-JP");
    const expected = "1,2,3";
    return result === expected;
}

// 测试点54：Date在en-US环境下的12小时制时间格式
export function Fn54_DateEnUsHour12Format() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 14, 30));
    const result = testDate.toLocaleString("en-US", { timeStyle: "short", hour12: true, timeZone: "UTC" });
    const expected = "2:30 PM";
    return result === expected;
}

// 测试点55：Number在zh-CN环境下的紧凑格式
export function Fn55_NumberZhCnCompactFormat() {
    const testNum = 1234567;
    const result = testNum.toLocaleString("zh-CN", { notation: "compact", compactDisplay: "short" });
    const expected = "123万";
    return result === expected;
}

// 测试点56：BigInt在en-GB环境下的本地化
export function Fn56_BigIntEnGbLocalize() {
    const testBigInt = 123456789n;
    const result = testBigInt.toLocaleString("en-GB");
    const expected = "123,456,789";
    return result === expected;
}

// 测试点57：闰年2月29日的本地化日期
export function Fn57_DateLeapYearFeb29() {
    const testDate = new Date(Date.UTC(2024, 1, 29)); // 2024年是闰年
    const result = testDate.toLocaleString("zh-CN", { dateStyle: "short", timeZone: "UTC" });
    const expected = "2024/2/29";
    return result === expected;
}

// 测试点58：负无穷大在zh-CN环境下的本地化
export function Fn58_NumberNegativeInfinityLocalize() {
    const testNum = -Infinity;
    const result = testNum.toLocaleString("zh-CN");
    const expected = "-∞";
    return result === expected;
}

// 测试点59：包含自定义对象的数组toLocaleString
export function Fn59_ArrayWithCustomObjects() {
    const obj1 = { toLocaleString: () => "对象1" };
    const obj2 = { toLocaleString: () => "对象2" };
    const testArr = [obj1, obj2];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "对象1,对象2";
    return result === expected;
}



// 测试点61：fr-FR环境下的EUR货币格式
export function Fn61_NumberEurFrFrCurrency() {
    const testNum = 1234.56;
    const result = testNum.toLocaleString("fr-FR", { style: "currency", currency: "EUR" });
    const expected = "1 234,56 €";
    return result === expected;
}

// 测试点62：零值BigInt在多语言环境下的本地化
export function Fn62_BigIntZeroLocalize() {
    const testBigInt = 0n;
    const resultZh = testBigInt.toLocaleString("zh-CN");
    const resultEn = testBigInt.toLocaleString("en-US");
    return resultZh === "0" && resultEn === "0";
}

// 测试点63：en-GB环境下的日期顺序（日/月/年）
export function Fn63_DateEnGbDateOrder() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("en-GB", { dateStyle: "short", timeZone: "UTC" });
    const expected = "15/06/2024";
    return result === expected;
}

// 测试点64：Number指定3位有效数字
export function Fn64_NumberSignificantDigits() {
    const testNum = 1234.56;
    const result = testNum.toLocaleString("en-US", { minimumSignificantDigits: 3, maximumSignificantDigits: 3 });
    const expected = "1,230";
    return result === expected;
}

// 测试点65：包含嵌套自定义对象的数组toLocaleString
export function Fn65_ArrayWithNestedCustomObjects() {
    const nestedObj = {
        value: 123,
        toLocaleString: function() { return `嵌套[${this.value}]`; }
    };
    const testArr = [1, nestedObj, 3];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "1,嵌套[123],3";
    return result === expected;
}

// 测试点66：带短时区名称的日期时间
export function Fn66_DateTimeZoneNameShort() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 12, 0));
    const result = testDate.toLocaleString("en-US", {
        timeZone: "UTC",
        timeZoneName: "short"
    });
    const expected = "6/15/2024, 12:00:00 PM UTC";
    return result === expected;
}

// 测试点67：ja-JP环境下的JPY货币格式
export function Fn67_NumberJpyJaJpCurrency() {
    const testNum = 12345;
    const result = testNum.toLocaleString("ja-JP", { style: "currency", currency: "JPY" });
    const expected = "￥12,345";
    return result === expected;
}

// 测试点68：fr-FR环境下的负BigInt本地化
export function Fn68_BigIntNegativeFrFr() {
    const testBigInt = -987654321n;
    const result = testBigInt.toLocaleString("fr-FR");
    const expected = "-987 654 321";
    return result === expected;
}

// 测试点69：en-US环境下的月-年显示格式
export function Fn69_DateMonthYearDisplay() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("en-US", {
        month: "long",
        year: "numeric",
        timeZone: "UTC"
    });
    const expected = "June 2024";
    return result === expected;
}

// 测试点70：百分比格式最大小数位数为0
export function Fn70_NumberPercentMaxFractionZero() {
    const testNum = 0.1234;
    const result = testNum.toLocaleString("en-US", { style: "percent", maximumFractionDigits: 0 });
    const expected = "12%";
    return result === expected;
}

// 测试点71：包含Symbol和Boolean的数组toLocaleString
export function Fn71_ArrayWithSymbolBoolean() {
    const sym = Symbol("test");
    const testArr = [sym, true, false];
    const result = testArr.toLocaleString("en-US");
    const expected = "Symbol(test),true,false";
    return result === expected;
}

// 测试点72：Europe/London时区的日期时间
export function Fn72_DateEuropeLondonTimezone() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 12, 0)); // UTC 12:00
    const result = testDate.toLocaleString("en-GB", { timeZone: "Europe/London" });
    const expected = "15/06/2024, 13:00:00"; // 夏令时+1
    return result === expected;
}

// 测试点73：带窄货币符号的USD格式
export function Fn73_NumberCurrencyNarrowSymbol() {
    const testNum = 123.45;
    const result = testNum.toLocaleString("en-US", {
        style: "currency",
        currency: "USD",
        currencyDisplay: "narrowSymbol"
    });
    const expected = "$123.45";
    return result === expected;
}

// 测试点74：en-US环境下的超大BigInt本地化
export function Fn74_BigIntLargeValueEnUs() {
    const testBigInt = 1234567890123456789012345n;
    const result = testBigInt.toLocaleString("en-US");
    const expected = "1,234,567,890,123,456,789,012,345";
    return result === expected;
}

// 测试点75：zh-CN环境下的星期-日期组合格式
export function Fn75_DateWeekdayDateCombination() {
    const testDate = new Date(Date.UTC(2024, 5, 15)); // 周六
    const result = testDate.toLocaleString("zh-CN", {
        weekday: "long",
        month: "long",
        day: "numeric",
        timeZone: "UTC"
    });
    const expected = "6月15日星期六";
    return result === expected;
}

// 测试点76：科学计数法最小指数位数为2
export function Fn76_NumberScientificMinExponent() {
    const testNum = 123;
    const result = testNum.toLocaleString("en-US", {
        notation: "scientific",
        minimumExponentDigits: 2
    });
    const expected = "1.23E2";
    return result === expected;
}

// 测试点78：带长时区名称的日期时间
export function Fn78_DateTimeZoneNameLong() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 12, 0));
    const result = testDate.toLocaleString("en-US", {
        timeZone: "UTC",
        timeZoneName: "long"
    });
    const expected = "6/15/2024, 12:00:00 PM Coordinated Universal Time";
    return result === expected;
}

// 测试点79：KWD货币最小小数位数为3
export function Fn79_NumberCurrencyMinFractionThree() {
    const testNum = 123.4;
    const result = testNum.toLocaleString("en-US", {
        style: "currency",
        currency: "KWD", // 科威特第纳尔默认3位小数
        minimumFractionDigits: 3
    });
    const expected = "KWD 123.400";
    return result === expected;
}

// 测试点80：de-DE环境下的BigInt本地化
export function Fn80_BigIntDeDeLocalize() {
    const testBigInt = 123456789n;
    const result = testBigInt.toLocaleString("de-DE");
    const expected = "123.456.789";
    return result === expected;
}

// 测试点81：公元1年1月1日的本地化日期
export function Fn81_DateEdgeDate0001() {
    const testDate = new Date(Date.UTC(1, 0, 1)); // 公元1年1月1日
    const result = testDate.toLocaleString("en-US", {
        dateStyle: "long",
        timeZone: "UTC"
    });
    const expected = "January 1, 1901";
    return result === expected;
}

// 测试点82：ja-JP环境下的百分比格式
export function Fn82_NumberPercentJaJp() {
    const testNum = 0.75;
    const result = testNum.toLocaleString("ja-JP", { style: "percent" });
    const expected = "75%";
    return result === expected;
}

// 测试点83：包含null、布尔值和字符串的数组
export function Fn83_ArrayWithNullBooleanMixed() {
    const testArr = [null, true, false, "文本"];
    const result = testArr.toLocaleString("ja-JP");
    const expected = ",true,false,文本";
    return result === expected;
}

// 测试点86：de-DE环境下的负BigInt本地化
export function Fn86_BigIntNegativeDeDe() {
    const testBigInt = -987654321n;
    const result = testBigInt.toLocaleString("de-DE");
    const expected = "-987.654.321";
    return result === expected;
}

// 测试点88：en-US环境下的紧凑格式
export function Fn88_NumberCompactEnUs() {
    const testNum = 1234567;
    const result = testNum.toLocaleString("en-US", { notation: "compact", compactDisplay: "long" });
    const expected = "1.2 million";
    return result === expected;
}



// 测试点90：America/Los_Angeles时区的日期时间
export function Fn90_DatePacificNewYorkTimezone() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 12, 0)); // UTC 12:00
    const result = testDate.toLocaleString("en-US", { timeZone: "America/Los_Angeles" });
    const expected = "6/15/2024, 5:00:00 AM"; // 夏令时-7
    return result === expected;
}

// 测试点91：zh-CN环境下的负百分比
export function Fn91_NumberNegativePercentZhCn() {
    const testNum = -0.123;
    const result = testNum.toLocaleString("zh-CN", { style: "percent" });
    const expected = "-12%";
    return result === expected;
}

// 测试点92：zh-CN环境下的超大BigInt本地化
export function Fn92_BigIntLargeValueZhCn() {
    const testBigInt = 987654321098765432109876543210n;
    const result = testBigInt.toLocaleString("zh-CN");
    const expected = "987,654,321,098,765,432,109,876,543,210";
    return result === expected;
}

// 测试点93：en-US环境下的完整月份名称
export function Fn93_DateMonthNameEnUs() {
    const testDate = new Date(Date.UTC(2024, 1, 15)); // 2月
    const result = testDate.toLocaleString("en-US", {
        month: "long",
        timeZone: "UTC"
    });
    const expected = "February";
    return result === expected;
}

// 测试点94：en-US环境下科学计数法最大指数位数
export function Fn94_NumberScientificEnUs() {
    const testNum = 12345;
    const result = testNum.toLocaleString("en-US", {
        notation: "scientific",
        maximumExponentDigits: 1
    });
    const expected = "1.235E4";
    return result === expected;
}

// 测试点95：包含多个自定义对象的数组
export function Fn95_ArrayWithMultipleCustomObjects() {
    const product1 = { name: "手机", price: 3999, toLocaleString: function() { return `商品:${this.name}`; } };
    const product2 = { amount: 5, toLocaleString: function() { return `数量:${this.amount}`; } };
    const testArr = [product1, product2];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "商品:手机,数量:5";
    return result === expected;
}

// 测试点97：fr-FR环境下的GBP货币格式
export function Fn97_NumberCurrencyFrFr() {
    const testNum = 123.45;
    const result = testNum.toLocaleString("fr-FR", { style: "currency", currency: "GBP" });
    const expected = "123,45 £GB";
    return result === expected;
}

// 测试点98：ja-JP环境下的正BigInt本地化
export function Fn98_BigIntPositiveJaJp() {
    const testBigInt = 987654321n;
    const result = testBigInt.toLocaleString("ja-JP");
    const expected = "987,654,321";
    return result === expected;
}

// 测试点99：多语言环境下的仅年份显示
export function Fn99_DateYearOnlyDisplay() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const resultEn = testDate.toLocaleString("en-US", { year: "numeric", timeZone: "UTC" });
    const resultZh = testDate.toLocaleString("zh-CN", { year: "numeric", timeZone: "UTC" });
    return resultEn === "2024" && resultZh === "2024年";
}

// 测试点100：自定义Date子类的toLocaleString
export function Fn100_CustomDateSubclassToLocaleString() {
    class MyDate extends Date {
        toLocaleString(locales, options) {
            // 自定义格式：年份后加"年"
            const year = this.getUTCFullYear();
            const month = this.getUTCMonth() + 1;
            const day = this.getUTCDate();
            return `${year}年${month}月${day}日`;
        }
    }
    const testDate = new MyDate(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("zh-CN");
    const expected = "2024年6月15日";
    return result === expected;
}

// 测试点101：es-ES环境下的短日期格式
export function Fn101_DateEsEsShortDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("es-ES", { dateStyle: "short", timeZone: "UTC" });
    const expected = "15/6/24";
    return result === expected;
}

// 测试点102：ru-RU环境下的数字千分位格式
export function Fn102_NumberRuRuThousandSeparator() {
    const testNum = 123456.78;
    const result = testNum.toLocaleString("ru-RU");
    const expected = "123 456,78";
    return result === expected;
}

// 测试点103：包含RegExp对象的数组toLocaleString
export function Fn103_ArrayWithRegExp() {
    const testArr = [/pattern/, /test/i];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "/pattern/,/test/i";
    return result === expected;
}

// 测试点104：ar-EG环境下的长日期格式
export function Fn104_DateArEgLongDate() {
    const testDate = new Date(Date.UTC(2024, 9, 1));
    const result = testDate.toLocaleString("ar-EG", { dateStyle: "long", timeZone: "UTC" });
    const expected = "١ أكتوبر، ٢٠٢٤";
    return result === expected;
}

// 测试点105：pt-BR环境下的BRL货币格式
export function Fn105_NumberPtBrBrlCurrency() {
    const testNum = 789.12;
    const result = testNum.toLocaleString("pt-BR", { style: "currency", currency: "BRL" });
    const expected = "R$ 789,12";
    return result === expected;
}

// 测试点106：es-ES环境下的BigInt本地化
export function Fn106_BigIntEsEsLocalize() {
    const testBigInt = 123456789n;
    const result = testBigInt.toLocaleString("es-ES");
    const expected = "123.456.789";
    return result === expected;
}

// 测试点107：en-GB环境下的24小时制时间
export function Fn107_DateEnGb24hTime() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 14, 30));
    const result = testDate.toLocaleString("en-GB", { timeStyle: "short", timeZone: "UTC" });
    const expected = "14:30";
    return result === expected;
}

// 测试点108：指定4位有效数字的Number格式化
export function Fn108_Number4SignificantDigits() {
    const testNum = 123.456;
    const result = testNum.toLocaleString("zh-CN", { minimumSignificantDigits: 4, maximumSignificantDigits: 4 });
    const expected = "123.5";
    return result === expected;
}

// 测试点109：包含Map对象的数组toLocaleString
export function Fn109_ArrayWithMap() {
    const testMap = new Map([["key", "value"]]);
    const testArr = [testMap];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "[object Map]";
    return result === expected;
}

// 测试点110：zh-TW环境下的短日期格式
export function Fn110_DateZhTwShortDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("zh-TW", { dateStyle: "short", timeZone: "UTC" });
    const expected = "2024/6/15";
    return result === expected;
}

// 测试点111：ar-SA环境下的数字格式（阿拉伯数字）
export function Fn111_NumberArSaDigits() {
    const testNum = 1234.56;
    const result = testNum.toLocaleString("ar-SA");
    const expected = "١٬٢٣٤٫٥٦";
    return result === expected;
}

// 测试点112：空Map的toLocaleString
export function Fn112_EmptyMapToLocaleString() {
    const emptyMap = new Map();
    const result = emptyMap.toLocaleString("zh-CN");
    const expected = "[object Map]";
    return result === expected;
}

// 测试点113：fr-CA环境下的日期时间格式
export function Fn113_DateFrCaDateTime() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 9, 30));
    const result = testDate.toLocaleString("fr-CA", { timeZone: "UTC" });
    const expected = "2024-06-15 09:30:00";
    return result === expected;
}

// 测试点114：en-AU环境下的AUD货币格式
export function Fn114_NumberEnAuAudCurrency() {
    const testNum = 456.78;
    const result = testNum.toLocaleString("en-AU", { style: "currency", currency: "AUD" });
    const expected = "$456.78";
    return result === expected;
}

// 测试点115：Set对象的toLocaleString
export function Fn115_SetToLocaleString() {
    const testSet = new Set([1, 2, 3]);
    const result = testSet.toLocaleString("zh-CN");
    const expected = "[object Set]";
    return result === expected;
}

// 测试点116：de-AT环境下的中等日期格式
export function Fn116_DateDeAtMediumDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("de-AT", { dateStyle: "medium", timeZone: "UTC" });
    const expected = "15.06.2024";
    return result === expected;
}

// 测试点117：zh-HK环境下的HKD货币格式
export function Fn117_NumberZhHkHkdCurrency() {
    const testNum = 890.12;
    const result = testNum.toLocaleString("zh-HK", { style: "currency", currency: "HKD" });
    const expected = "HK$890.12";
    return result === expected;
}

// 测试点118：混合Date和RegExp的数组toLocaleString
export function Fn118_ArrayDateRegExpMixed() {
    const testArr = [new Date(Date.UTC(2024, 5, 15)), /regex/];
    const result = testArr.toLocaleString("en-US", { timeZone: "UTC" });
    const expected = "6/15/2024, 12:00:00 AM,/regex/";
    return result === expected;
}

// 测试点119：it-IT环境下的长时间格式
export function Fn119_DateItItLongTime() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 16, 45, 30));
    const result = testDate.toLocaleString("it-IT", { timeStyle: "long", timeZone: "UTC" });
    const expected = "16:45:30 UTC";
    return result === expected;
}

// 测试点120：nl-NL环境下的百分比格式
export function Fn120_NumberNlNlPercent() {
    const testNum = 0.333;
    const result = testNum.toLocaleString("nl-NL", { style: "percent", maximumFractionDigits: 1 });
    const expected = "33,3%";
    return result === expected;
}

// 测试点121：WeakMap的toLocaleString
export function Fn121_WeakMapToLocaleString() {
    const weakMap = new WeakMap();
    const obj = {};
    weakMap.set(obj, "value");
    const result = weakMap.toLocaleString("zh-CN");
    const expected = "[object WeakMap]";
    return result === expected;
}

// 测试点123：sv-SE环境下的SEK货币格式
export function Fn123_NumberSvSeSekCurrency() {
    const testNum = 1234.56;
    const result = testNum.toLocaleString("sv-SE", { style: "currency", currency: "SEK" });
    const expected = "1 234,56 kr";
    return result === expected;
}

// 测试点124：包含Set和Map的数组toLocaleString
export function Fn124_ArraySetMapMixed() {
    const testArr = [new Set([1, 2]), new Map([["a", 1]])];
    const result = testArr.toLocaleString("en-US");
    const expected = "[object Set],[object Map]";
    return result === expected;
}

// 测试点125：pl-PL环境下的长日期格式
export function Fn125_DatePlPlLongDate() {
    const testDate = new Date(Date.UTC(2024, 9, 5));
    const result = testDate.toLocaleString("pl-PL", { dateStyle: "long", timeZone: "UTC" });
    const expected = "5 października 2024";
    return result === expected;
}

// 测试点126：tr-TR环境下的数字千分位格式
export function Fn126_NumberTrTrThousandSeparator() {
    const testNum = 9876543.21;
    const result = testNum.toLocaleString("tr-TR");
    const expected = "9.876.543,21";
    return result === expected;
}

// 测试点127：DateTimeFormat与toLocaleString的一致性
export function Fn127_DateTimeFormatConsistency() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const directResult = testDate.toLocaleString("fr-FR", { timeZone: "UTC" });
    const formatter = new Intl.DateTimeFormat("fr-FR", { timeZone: "UTC" });
    const formatResult = formatter.format(testDate);
    return directResult !== formatResult;
}

// 测试点128：hi-IN环境下的短日期格式
export function Fn128_DateHiInShortDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("hi-IN", { dateStyle: "short", timeZone: "UTC" });
    const expected = "15/6/24";
    return result === expected;
}

// 测试点129：en-CA环境下的CAD货币格式
export function Fn129_NumberEnCaCadCurrency() {
    const testNum = 345.67;
    const result = testNum.toLocaleString("en-CA", { style: "currency", currency: "CAD" });
    const expected = "$345.67";
    return result === expected;
}

// 测试点130：包含Error对象的数组toLocaleString
export function Fn130_ArrayWithError() {
    const testArr = [new Error("测试错误"), new TypeError("类型错误")];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "Error: 测试错误,TypeError: 类型错误";
    return result === expected;
}

// 测试点131：th-TH环境下的佛教纪年日期
export function Fn131_DateThThBuddhistEra() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("th-TH", { dateStyle: "short", timeZone: "UTC", calendar: "buddhist" });
    const expected = "15/6/67";
    return result === expected;
}

// 测试点132：cs-CZ环境下的CZK货币格式
export function Fn132_NumberCsCzCzkCurrency() {
    const testNum = 678.90;
    const result = testNum.toLocaleString("cs-CZ", { style: "currency", currency: "CZK" });
    const expected = "678,90 Kč";
    return result === expected;
}

// 测试点133：自定义类数组对象的toLocaleString
export function Fn133_ArrayLikeToLocaleString() {
    const arrayLike = {
        0: "a",
        1: "b",
        length: 2,
        toLocaleString() {
            return Array.from(this).join("|");
        }
    };
    const result = arrayLike.toLocaleString("zh-CN");
    const expected = "a|b";
    return result === expected;
}

// 测试点135：da-DK环境下的百分比格式
export function Fn135_NumberDaDkPercent() {
    const testNum = 0.99;
    const result = testNum.toLocaleString("da-DK", { style: "percent" });
    const expected = "99 %";
    return result === expected;
}

// 测试点136：嵌套数组包含多种类型的toLocaleString
export function Fn136_NestedArrayMixedTypes() {
    const nestedArr = [[123, new Date(Date.UTC(2024, 5, 15))], [null, "text"]];
    const result = nestedArr.toLocaleString("en-GB", { timeZone: "UTC" });
    const expected = "123,15/06/2024, 00:00:00,,text";
    return result === expected;
}

// 测试点137：ar-SA环境下的伊斯兰历法日期
export function Fn137_DateArSaIslamicCalendar() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("ar-SA", { dateStyle: "long", timeZone: "UTC", calendar: "islamic" });
    const expected = "٩ ذو الحجة ١٤٤٥ هـ";
    return result === expected;
}

// 测试点138：he-IL环境下的ILS货币格式
export function Fn138_NumberHeIlIlsCurrency() {
    const testNum = 543.21;
    const result = testNum.toLocaleString("he-IL", { style: "currency", currency: "ILS" });
    const expected = "‏543.21 ‏₪";
    return result === expected;
}

// 测试点139：Proxy对象的toLocaleString
export function Fn139_ProxyToLocaleString() {
    const target = { toLocaleString() { return "代理目标"; } };
    const proxy = new Proxy(target, {});
    const result = proxy.toLocaleString("zh-CN");
    const expected = "代理目标";
    return result === expected;
}

// 测试点140：hu-HU环境下的短时间格式
export function Fn140_DateHuHuShortTime() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 18, 45));
    const result = testDate.toLocaleString("hu-HU", { timeStyle: "short", timeZone: "UTC" });
    const expected = "18:45";
    return result === expected;
}

// 测试点141：ro-RO环境下的数字千分位格式
export function Fn141_NumberRoRoThousandSeparator() {
    const testNum = 8765432.10;
    const result = testNum.toLocaleString("ro-RO");
    const expected = "8.765.432,1";
    return result === expected;
}

// 测试点142：包含Symbol值的数组toLocaleString
export function Fn142_ArrayWithSymbols() {
    const sym1 = Symbol("sym1");
    const sym2 = Symbol.for("sym2");
    const testArr = [sym1, sym2];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "Symbol(sym1),Symbol(sym2)";
    return result === expected;
}

// 测试点143：vi-VN环境下的长日期格式
export function Fn143_DateViVnLongDate() {
    const testDate = new Date(Date.UTC(2024, 9, 10));
    const result = testDate.toLocaleString("vi-VN", { dateStyle: "long", timeZone: "UTC" });
    const expected = "10 tháng 10, 2024";
    return result === expected;
}

// 测试点144：id-ID环境下的IDR货币格式
export function Fn144_NumberIdIdIdrCurrency() {
    const testNum = 1234567;
    const result = testNum.toLocaleString("id-ID", { style: "currency", currency: "IDR" });
    const expected = "Rp 1.234.567,00";
    return result === expected;
}

// 测试点145：类数组对象的默认toLocaleString
export function Fn145_ArrayLikeDefaultToLocaleString() {
    const arrayLike = { 0: 123, 1: 456, length: 2 };
    const result = Array.prototype.toLocaleString.call(arrayLike, "zh-CN");
    const expected = "123,456";
    return result === expected;
}

// 测试点146：fa-IR环境下的波斯历法日期
export function Fn146_DateFaIrPersianCalendar() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("fa-IR", { dateStyle: "short", timeZone: "UTC", calendar: "persian" });
    const expected = "۱۴۰۳/۳/۲۶";
    return result === expected;
}

// 测试点148：ca-ES环境下的短日期格式
export function Fn148_DateCaEsShortDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("ca-ES", { dateStyle: "short", timeZone: "UTC" });
    const expected = "15/6/24";
    return result === expected;
}

// 测试点149：bg-BG环境下的数字格式
export function Fn149_NumberBgBgFormat() {
    const testNum = 12345.67;
    const result = testNum.toLocaleString("bg-BG");
    const expected = "12 345,67";
    return result === expected;
}

// 测试点150：包含WeakSet的数组toLocaleString
export function Fn150_ArrayWithWeakSet() {
    const ws = new WeakSet();
    const obj = {};
    ws.add(obj);
    const testArr = [ws];
    const result = testArr.toLocaleString("en-US");
    const expected = "[object WeakSet]";
    return result === expected;
}

// 测试点151：nl-NL环境下的长日期格式
export function Fn151_DateNlNlLongDate() {
    const testDate = new Date(Date.UTC(2024, 11, 25));
    const result = testDate.toLocaleString("nl-NL", { dateStyle: "long", timeZone: "UTC" });
    const expected = "25 december 2024";
    return result === expected;
}

// 测试点152：sk-SK环境下的EUR货币格式
export function Fn152_NumberSkSkEurCurrency() {
    const testNum = 345.67;
    const result = testNum.toLocaleString("sk-SK", { style: "currency", currency: "EUR" });
    const expected = "345,67 €";
    return result === expected;
}

// 测试点153：TypedArray的toLocaleString
export function Fn153_TypedArrayToLocaleString() {
    const typedArr = new Int8Array([10, 20, 30]);
    const result = typedArr.toLocaleString("de-DE");
    const expected = "10,20,30";
    return result === expected;
}

// 测试点156：包含DataView的数组toLocaleString
export function Fn156_ArrayWithDataView() {
    const buffer = new ArrayBuffer(16);
    const view = new DataView(buffer);
    const testArr = [view];
    const result = testArr.toLocaleString("zh-CN");
    const expected = "[object DataView]";
    return result === expected;
}

// 测试点157：ar-SA环境下的时间格式
export function Fn157_DateArSaTimeFormat() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 10, 30));
    const result = testDate.toLocaleString("ar-SA", { timeStyle: "short", timeZone: "UTC" });
    const expected = "١٠:٣٠ ص";
    return result === expected;
}

// 测试点158：sl-SI环境下的百分比格式
export function Fn158_NumberSlSiPercent() {
    const testNum = 0.45;
    const result = testNum.toLocaleString("sl-SI", { style: "percent" });
    const expected = "45 %";
    return result === expected;
}

// 测试点159：SharedArrayBuffer的toLocaleString
export function Fn159_SharedArrayBufferToLocaleString() {
    const sab = new SharedArrayBuffer(1024);
    const result = sab.toLocaleString("en-US");
    const expected = "[object SharedArrayBuffer]";
    return result === expected;
}


// 测试点161：hr-HR环境下的数字格式
export function Fn161_NumberHrHrFormat() {
    const testNum = 98765.43;
    const result = testNum.toLocaleString("hr-HR");
    const expected = "98.765,43";
    return result === expected;
}


// 测试点163：es-MX环境下的长日期格式
export function Fn163_DateEsMxLongDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("es-MX", { dateStyle: "long", timeZone: "UTC" });
    const expected = "15 de junio de 2024";
    return result === expected;
}

// 测试点164：lt-LT环境下的EUR货币格式
export function Fn164_NumberLtLtEurCurrency() {
    const testNum = 456.78;
    const result = testNum.toLocaleString("lt-LT", { style: "currency", currency: "EUR" });
    const expected = "456,78 €";
    return result === expected;
}

// 测试点165：自定义Error子类的toLocaleString
export function Fn165_CustomErrorToLocaleString() {
    class CustomError extends Error {
        toLocaleString() {
            return `自定义错误: ${this.message}`;
        }
    }
    const error = new CustomError("测试信息");
    const result = error.toLocaleString("zh-CN");
    const expected = "自定义错误: 测试信息";
    return result === expected;
}

// 测试点166：ms-MY环境下的日期格式
export function Fn166_DateMsMyDateFormat() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("ms-MY", { dateStyle: "medium", timeZone: "UTC" });
    const expected = "15 Jun 2024";
    return result === expected;
}

// 测试点167：lv-LV环境下的数字格式
export function Fn167_NumberLvLvFormat() {
    const testNum = 123456.78;
    const result = testNum.toLocaleString("lv-LV");
    const expected = "123 456,78";
    return result === expected;
}



// 测试点169：fr-CH环境下的日期时间格式
export function Fn169_DateFrChDateTime() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 16, 45));
    const result = testDate.toLocaleString("fr-CH", { timeZone: "UTC" });
    const expected = "15.06.2024 16:45:00";
    return result === expected;
}

// 测试点170：et-EE环境下的百分比格式
export function Fn170_NumberEtEePercent() {
    const testNum = 0.67;
    const result = testNum.toLocaleString("et-EE", { style: "percent" });
    const expected = "67%";
    return result === expected;
}

// 测试点171：Promise对象的toLocaleString
export function Fn171_PromiseToLocaleString() {
    const promise = Promise.resolve();
    const result = promise.toLocaleString("zh-CN");
    const expected = "[object Promise]";
    return result === expected;
}



// 测试点173：bn-BD环境下的数字格式
export function Fn173_NumberBnBdFormat() {
    const testNum = 12345.67;
    const result = testNum.toLocaleString("bn-BD");
    const expected = "১২,৩৪৫.৬৭";
    return result === expected;
}


// 测试点175：de-CH环境下的时间格式
export function Fn175_DateDeChTimeFormat() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 18, 30));
    const result = testDate.toLocaleString("de-CH", { timeStyle: "medium", timeZone: "UTC" });
    const expected = "18:30:00";
    return result === expected;
}

// 测试点176：km-KH环境下的百分比格式
export function Fn176_NumberKmKhPercent() {
    const testNum = 0.25;
    const result = testNum.toLocaleString("km-KH", { style: "percent" });
    const expected = "25%";
    return result === expected;
}

// 测试点179：ta-IN环境下的数字格式
export function Fn179_NumberTaInFormat() {
    const testNum = 1234567.89;
    const result = testNum.toLocaleString("ta-IN");
    const expected = "12,34,567.89";
    return result === expected;
}

// 测试点181：hu-HU环境下的长日期格式
export function Fn181_DateHuHuLongDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("hu-HU", { dateStyle: "long", timeZone: "UTC" });
    const expected = "2024. június 15.";
    return result === expected;
}

// 测试点182：ml-IN环境下的INR货币格式
export function Fn182_NumberMlInInrCurrency() {
    const testNum = 12345.67;
    const result = testNum.toLocaleString("ml-IN", { style: "currency", currency: "INR" });
    const expected = "₹12,345.67";
    return result === expected;
}

// 测试点183：自定义Map子类的toLocaleString
export function Fn183_CustomMapToLocaleString() {
    class CustomMap extends Map {
        toLocaleString() {
            return `CustomMap(${this.size} entries)`;
        }
    }
    const map = new CustomMap([["a", 1]]);
    const result = map.toLocaleString("zh-CN");
    const expected = "CustomMap(1 entries)";
    return result === expected;
}

// 测试点184：hy-AM环境下的日期格式
export function Fn184_DateHyAmDateFormat() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("hy-AM", { dateStyle: "medium", timeZone: "UTC" });
    const expected = "15 հնս, 2024 թ.";
    return result === expected;
}


// 测试点186：包含WeakRef的数组toLocaleString
export function Fn186_ArrayWithWeakRef() {
    const obj = {};
    const weakRef = new WeakRef(obj);
    const testArr = [weakRef];
    const result = testArr.toLocaleString("en-US");
    const expected = "[object WeakRef]";
    return result === expected;
}

// 测试点187：ka-GE环境下的时间格式
export function Fn187_DateKaGeTimeFormat() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 10, 15));
    const result = testDate.toLocaleString("ka-GE", { timeStyle: "short", timeZone: "UTC" });
    const expected = "10:15";
    return result === expected;
}

// 测试点188：ne-NP环境下的NPR货币格式
export function Fn188_NumberNeNpNprCurrency() {
    const testNum = 789.01;
    const result = testNum.toLocaleString("ne-NP", { style: "currency", currency: "NPR" });
    const expected = "नेरू ७८९.०१";
    return result === expected;
}

// 测试点189：FinalizationRegistry的toLocaleString
export function Fn189_FinalizationRegistryToLocaleString() {
    const registry = new FinalizationRegistry(() => {});
    const result = registry.toLocaleString("zh-CN");
    const expected = "[object FinalizationRegistry]";
    return result === expected;
}


// 测试点192：包含ArrayBuffer的数组toLocaleString
export function Fn192_ArrayWithArrayBuffer() {
    const buffer = new ArrayBuffer(8);
    const testArr = [buffer];
    const result = testArr.toLocaleString("en-US");
    const expected = "[object ArrayBuffer]";
    return result === expected;
}

// 测试点193：tr-TR环境下的长日期格式
export function Fn193_DateTrTrLongDate() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("tr-TR", { dateStyle: "long", timeZone: "UTC" });
    const expected = "15 Haziran 2024";
    return result === expected;
}

// 测试点195：自定义Set子类的toLocaleString
export function Fn195_CustomSetToLocaleString() {
    class CustomSet extends Set {
        toLocaleString() {
            return `CustomSet(${this.size} items)`;
        }
    }
    const set = new CustomSet([1, 2, 3]);
    const result = set.toLocaleString("zh-CN");
    const expected = "CustomSet(3 items)";
    return result === expected;
}

// 测试点196：ur-PK环境下的日期格式
export function Fn196_DateUrPkDateFormat() {
    const testDate = new Date(Date.UTC(2024, 5, 15));
    const result = testDate.toLocaleString("ur-PK", { dateStyle: "medium", timeZone: "UTC" });
    const expected = "15 جون، 2024";
    return result === expected;
}

// 测试点197：mn-MN环境下的数字格式
export function Fn197_NumberMnMnFormat() {
    const testNum = 12345.67;
    const result = testNum.toLocaleString("mn-MN");
    const expected = "12,345.67";
    return result === expected;
}

// 测试点198：包含JSON对象的数组toLocaleString
export function Fn198_ArrayWithJson() {
    const testArr = [JSON];
    const result = testArr.toLocaleString("en-US");
    const expected = "[object JSON]";
    return result === expected;
}

// 测试点199：fa-IR环境下的时间格式
export function Fn199_DateFaIrTimeFormat() {
    const testDate = new Date(Date.UTC(2024, 5, 15, 14, 30));
    const result = testDate.toLocaleString("fa-IR", { timeStyle: "medium", timeZone: "UTC" });
    const expected = "۱۴:۳۰:۰۰";
    return result === expected;
}

// 测试点200：si-LK环境下的LKR货币格式
export function Fn200_NumberSiLkLkrCurrency() {
    const testNum = 7890.12;
    const result = testNum.toLocaleString("si-LK", { style: "currency", currency: "LKR" });
    const expected = "රු. 7,890.12";
    return result === expected;
}
