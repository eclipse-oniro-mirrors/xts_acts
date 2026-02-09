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

// 测试点1：普通对象自身可枚举字符串键（按插入顺序）
export function Fn01_testOwnEnumerableObjKeys() {
    const obj = { name: "test", age: 18, gender: "male" };
    const keys = Object.keys(obj);
    return keys.length === 3 && keys[0] === "name" && keys[1] === "age" && keys[2] === "gender";
}

// 测试点2：字符串原始值返回索引键
export function Fn02_testStringPrimitive() {
    const keys = Object.keys("hello");
    return keys.join("") === "01234";
}

// 测试点3：数字原始值返回空数组
export function Fn03_testNumberPrimitive() {
    const keys = Object.keys(123);
    return keys.length === 0;
}

// 测试点4：布尔原始值返回空数组
export function Fn04_testBooleanPrimitive() {
    const keys = Object.keys(true);
    return keys.length === 0;
}

// 测试点5：排除原型链属性
export function Fn05_testExcludePrototypeKeys() {
    const proto = { protoKey: "proto" };
    const obj = Object.create(proto);
    obj.ownKey = "own";
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "ownKey";
}

// 测试点6：空对象返回空数组
export function Fn06_testEmptyObject() {
    const keys = Object.keys({});
    return keys.length === 0;
}

// 测试点7：数组返回索引键（不含length）
export function Fn07_testArrayIndexKeys() {
    const arr = [10, 20, 30];
    const keys = Object.keys(arr);
    return keys.join(",") === "0,1,2";
}

// 测试点8：数组添加自定义可枚举属性，返回索引+自定义属性
export function Fn08_testArrayCustomEnumerableProp() {
    const arr = [10, 20];
    arr.version = "v1.0";
    const keys = Object.keys(arr);
    return keys.join(",") === "0,1,version";
}

// 测试点9：稀疏数组不返回空槽索引
export function Fn09_testSparseArray() {
    const arr = [1, , 3]; // 索引1为空槽
    const keys = Object.keys(arr);
    return keys.join(",") === "0,2";
}

// 测试点10：不可枚举属性不返回
export function Fn10_testNonEnumerableProp() {
    const obj = {};
    Object.defineProperty(obj, "nonEnumKey", { value: "nonEnum", enumerable: false });
    obj.enumKey = "enum";
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "enumKey";
}

// 测试点11：Symbol键不返回
export function Fn11_testSymbolKeyExclude() {
    const symKey = Symbol("sym");
    const obj = { strKey: "str", [symKey]: "sym" };
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "strKey";
}

// 测试点12：传入null抛出TypeError
export function Fn12_testNullThrowError() {
    try {
        Object.keys(null);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// 测试点13：传入undefined抛出TypeError
export function Fn13_testUndefinedThrowError() {
    try {
        Object.keys(undefined);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// 测试点14：ES6类实例返回自身可枚举属性（排除原型方法）
export function Fn14_testClassInstanceOwnProp() {
    class MyClass {
        constructor() {
            this.instanceProp = "inst";
        }

        protoMethod() {
        }
    }

    const inst = new MyClass();
    const keys = Object.keys(inst);
    return keys.length === 1 && keys[0] === "instanceProp";
}

// 测试点15：类实例排除私有属性
export function Fn15_testClassPrivatePropExclude() {
    class MyClass {
        #privateProp = "priv";

        constructor() {
            this.publicProp = "pub";
        }
    }

    const inst = new MyClass();
    const keys = Object.keys(inst);
    return keys.length === 1 && keys[0] === "publicProp";
}

// 测试点16：类的静态可枚举属性返回
export function Fn16_testClassStaticEnumerableProp() {
    class MyClass {
        static staticProp = "stat";
    }

    const keys = Object.keys(MyClass);
    return keys.length === 1 && keys[0] === "staticProp";
}

// 测试点17：Date对象默认无自身可枚举属性（返回空数组）
export function Fn17_testDateObjectDefault() {
    const date = new Date();
    const keys = Object.keys(date);
    return keys.length === 0;
}

// 测试点18：Date对象添加自定义可枚举属性返回
export function Fn18_testDateObjectOwnProp() {
    const date = new Date();
    date.dateProp = "dateVal";
    const keys = Object.keys(date);
    return keys.length === 1 && keys[0] === "dateProp";
}

// 测试点19：RegExp对象默认无自身可枚举属性（返回空数组）
export function Fn19_testRegExpObjectDefault() {
    const reg = /abc/g;
    const keys = Object.keys(reg);
    return keys.length === 0;
}

// 测试点20：RegExp对象添加自定义可枚举属性返回
export function Fn20_testRegExpObjectOwnProp() {
    const reg = /abc/g;
    reg.regProp = "regVal";
    const keys = Object.keys(reg);
    return keys.length === 1 && keys[0] === "regProp";
}

// 测试点21：Math对象默认无自身可枚举属性（返回空数组）
export function Fn21_testMathObjectDefault() {
    const keys = Object.keys(Math);
    return keys.length === 0;
}

// 测试点22：Math对象添加自定义可枚举属性返回
export function Fn22_testMathObjectOwnProp() {
    Math.mathProp = "mathVal";
    const keys = Object.keys(Math);
    delete Math.mathProp; // 清理环境
    return keys.length === 1 && keys[0] === "mathProp";
}

// 测试点23：Error对象默认无自身可枚举属性（返回空数组）
export function Fn23_testErrorObjectDefault() {
    const err = new Error("msg");
    const keys = Object.keys(err);
    return keys.length === 0;
}

// 测试点24：Error对象添加自定义可枚举属性返回
export function Fn24_testErrorObjectOwnProp() {
    const err = new Error("msg");
    err.errProp = "errVal";
    const keys = Object.keys(err);
    return keys.length === 1 && keys[0] === "errProp";
}

// 测试点25：普通函数添加自定义可枚举属性返回
export function Fn25_testFunctionObjectOwnProp() {

    function fn() {
    }

    fn.fnProp = "fnVal";
    const keys = Object.keys(fn);
    return keys.length === 1 && keys[0] === "fnProp";
}

// 测试点26：箭头函数添加自定义可枚举属性返回
export function Fn26_testArrowFunctionOwnProp() {
    const arrowFn = () => {
    };
    arrowFn.arrowProp = "arrowVal";
    const keys = Object.keys(arrowFn);
    return keys.length === 1 && keys[0] === "arrowProp";
}

// 测试点27：生成器函数添加自定义可枚举属性返回
export function Fn27_testGeneratorFunctionOwnProp() {

    function* genFn() {
    }

    genFn.genProp = "genVal";
    const keys = Object.keys(genFn);
    return keys.length === 1 && keys[0] === "genProp";
}

// 测试点28：异步函数添加自定义可枚举属性返回
export function Fn28_testAsyncFunctionOwnProp() {

    async function asyncFn() {
    }

    asyncFn.asyncProp = "asyncVal";
    const keys = Object.keys(asyncFn);
    return keys.length === 1 && keys[0] === "asyncProp";
}

// 测试点29：Map对象默认无自身可枚举属性（返回空数组）
export function Fn29_testMapObjectDefault() {
    const map = new Map([["k1", "v1"]]);
    const keys = Object.keys(map);
    return keys.length === 0;
}

// 测试点30：Map对象添加自定义可枚举属性返回
export function Fn30_testMapObjectOwnProp() {
    const map = new Map([["k1", "v1"]]);
    map.mapProp = "mapVal";
    const keys = Object.keys(map);
    return keys.length === 1 && keys[0] === "mapProp";
}

// 测试点31：Set对象默认无自身可枚举属性（返回空数组）
export function Fn31_testSetObjectDefault() {
    const set = new Set([1, 2]);
    const keys = Object.keys(set);
    return keys.length === 0;
}

// 测试点32：Set对象添加自定义可枚举属性返回
export function Fn32_testSetObjectOwnProp() {
    const set = new Set([1, 2]);
    set.setProp = "setVal";
    const keys = Object.keys(set);
    return keys.length === 1 && keys[0] === "setProp";
}

// 测试点33：WeakMap对象添加自定义可枚举属性返回
export function Fn33_testWeakMapObjectOwnProp() {
    const wm = new WeakMap();
    wm.wmProp = "wmVal";
    const keys = Object.keys(wm);
    return keys.length === 1 && keys[0] === "wmProp";
}

// 测试点34：WeakSet对象添加自定义可枚举属性返回
export function Fn34_testWeakSetObjectOwnProp() {
    const ws = new WeakSet();
    ws.wsProp = "wsVal";
    const keys = Object.keys(ws);
    return keys.length === 1 && keys[0] === "wsProp";
}

// 测试点35：类数组对象返回索引+length+自定义属性
export function Fn35_testArrayLikeObject() {
    const arrLike = {
        0: "a",
        1: "b",
        length: 2,
        likeProp: "likeVal"
    };
    const keys = Object.keys(arrLike);
    return keys.sort().join(",") === "0,1,length,likeProp";
}

// 测试点36：类数组length小于索引，仍返回所有索引键
export function Fn36_testArrayLikeLengthLessIndex() {
    const arrLike = {
        0: "a",
        1: "b",
        2: "c",
        length: 2
    };
    const keys = Object.keys(arrLike);
    return keys.includes("2");
}

// 测试点37：冻结对象返回自身可枚举属性
export function Fn37_testFrozenObject() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    const keys = Object.keys(obj);
    return keys.join(",") === "a,b";
}

// 测试点38：密封对象返回自身可枚举属性
export function Fn38_testSealedObject() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const keys = Object.keys(obj);
    return keys.join(",") === "a,b";
}

// 测试点39：不可扩展对象返回自身可枚举属性
export function Fn39_testNonExtensibleObject() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    const keys = Object.keys(obj);
    return keys.join(",") === "a,b";
}

// 测试点40：多层继承（爷爷->爸爸->儿子）只返回儿子自身属性
export function Fn40_testMultiLevelInheritance() {
    const grand = { grandKey: "grand" };
    const parent = Object.create(grand);
    parent.parentKey = "parent";
    const child = Object.create(parent);
    child.childKey = "child";
    const keys = Object.keys(child);
    return keys.length === 1 && keys[0] === "childKey";
}

// 测试点41：原型上的可枚举属性不返回
export function Fn41_testPrototypeEnumerablePropExclude() {
    Object.prototype.protoEnumKey = "protoEnum";
    const obj = { ownKey: "own" };
    const keys = Object.keys(obj);
    delete Object.prototype.protoEnumKey; // 清理环境
    return keys.length === 1 && keys[0] === "ownKey";
}

// 测试点42：数字字符串键按升序排列
export function Fn42_testNumberStringKeysOrder() {
    const obj = { "3": "c", "1": "a", "2": "b" };
    const keys = Object.keys(obj);
    return keys.join(",") === "1,2,3";
}

// 测试点43：数字键+字符串键混合（数字升序在前，字符串插入顺序在后）
export function Fn43_testMixedKeysOrder() {
    const obj = {
        "b": "b",
        "1": "a",
        "d": "d",
        "2": "c",
        "a": "a"
    };
    const keys = Object.keys(obj);
    return keys.join(",") === "1,2,b,d,a";
}

// 测试点44：属性名为空字符串，正确返回
export function Fn44_testEmptyStringKey() {
    const obj = { "": "emptyVal" };
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "";
}

// 测试点45：Unicode字符属性名，正确返回
export function Fn45_testUnicodeCharKey() {
    const obj = { "ñ": "n", "ü": "u" };
    const keys = Object.keys(obj);
    return keys.sort().join(",") === "ñ,ü";
}

// 测试点46：中文字符属性名，正确返回
export function Fn46_testChineseCharKey() {
    const obj = { "姓名": "张三", "年龄": 20 };
    const keys = Object.keys(obj);
    return keys.join(",") === "姓名,年龄";
}

// 测试点47：特殊字符（空格/@/_）属性名，正确返回
export function Fn47_testSpecialCharKey() {
    const obj = { "user name": "test", "@email": "test@xxx.com", "user_id": 1001 };
    const keys = Object.keys(obj);
    return keys.join(",") === "user name,@email,user_id";
}

// 测试点48：数字开头的非数字字符串属性名（如'123abc'），正确返回
export function Fn48_testNumberStartKey() {
    const obj = { "123abc": "val1", "456def": "val2" };
    const keys = Object.keys(obj);
    return keys.join(",") === "123abc,456def";
}

// 测试点49：动态添加属性后，正确返回新属性
export function Fn49_testDynamicAddProp() {
    const obj = { a: 1 };
    obj.b = 2;
    obj.c = 3;
    const keys = Object.keys(obj);
    return keys.join(",") === "a,b,c";
}

// 测试点50：删除属性后，不返回已删除属性
export function Fn50_testDeleteProp() {
    const obj = { a: 1, b: 2, c: 3 };
    delete obj.b;
    const keys = Object.keys(obj);
    return keys.join(",") === "a,c";
}

// 测试点51：嵌套对象只返回外层自身属性
export function Fn51_testNestedObjectOwnProp() {
    const obj = { nest: { a: 1, b: 2 }, own: 3 };
    const keys = Object.keys(obj);
    return keys.join(",") === "nest,own";
}

// 测试点52：属性值为undefined，仍返回属性名
export function Fn52_testObjPropValueUndefined() {
    const obj = { a: undefined, b: 2 };
    const keys = Object.keys(obj);
    return keys.join(",") === "a,b";
}

// 测试点53：属性值为null，仍返回属性名
export function Fn53_testObjPropValueNull() {
    const obj = { a: null, b: 2 };
    const keys = Object.keys(obj);
    return keys.join(",") === "a,b";
}

// 测试点54：属性值为函数，仍返回属性名
export function Fn54_testObjPropValueFunction() {
    const obj = {
        func: () => {
        }, b: 2
    };
    const keys = Object.keys(obj);
    return keys.join(",") === "func,b";
}

// 测试点55：属性值为数组，仍返回属性名
export function Fn55_testObjPropValueArray() {
    const obj = { arr: [1, 2], b: 3 };
    const keys = Object.keys(obj);
    return keys.join(",") === "arr,b";
}

// 测试点56：属性值为对象，仍返回属性名
export function Fn56_testObjPropValueObject() {
    const obj = { obj: { a: 1 }, b: 3 };
    const keys = Object.keys(obj);
    return keys.join(",") === "obj,b";
}

// 测试点57：数组元素为对象，仍返回索引键
export function Fn57_testArrayPropValueObject() {
    const arr = [{ a: 1 }, { b: 2 }];
    const keys = Object.keys(arr);
    return keys.join(",") === "0,1";
}

// 测试点58：代理对象（无拦截）返回目标对象自身可枚举属性
export function Fn58_testProxyNoInterceptor() {
    const target = { a: 1, b: 2 };
    const proxy = new Proxy(target, {});
    const keys = Object.keys(proxy);
    return keys.join(",") === "a,b";
}

// 测试点59：代理对象（拦截ownKeys）返回拦截指定的字符串键
export function Fn59_testProxyOwnKeysInterceptor() {
    const proxy = new Proxy({}, { ownKeys: () => ["x", "y", "z"] });
    const keys = Object.keys(proxy);
    return keys.join(",") === "";
}

// 测试点60：10个属性的对象，返回所有属性名且顺序正确
export function Fn60_testBigObject10Props() {
    const obj = {
        p1: 1,
        p2: 2,
        p3: 3,
        p4: 4,
        p5: 5,
        p6: 6,
        p7: 7,
        p8: 8,
        p9: 9,
        p10: 10
    };
    const keys = Object.keys(obj);
    return keys.length === 10 && keys[9] === "p10";
}

// 测试点61：20个属性的对象，返回所有属性名且数量正确
export function Fn61_testBigObject20Props() {
    const obj = {
        p1: 1,
        p2: 2,
        p3: 3,
        p4: 4,
        p5: 5,
        p6: 6,
        p7: 7,
        p8: 8,
        p9: 9,
        p10: 10,
        p11: 11,
        p12: 12,
        p13: 13,
        p14: 14,
        p15: 15,
        p16: 16,
        p17: 17,
        p18: 18,
        p19: 19,
        p20: 20
    };
    const keys = Object.keys(obj);
    return keys.length === 20;
}

// 测试点62：数组修改length后，返回现有索引键
export function Fn62_testArrayModifyLength() {
    const arr = [1, 2, 3, 4];
    arr.length = 2;
    const keys = Object.keys(arr);
    return keys.join(",") === "0,1";
}

// 测试点63：数组length设为0，返回空数组
export function Fn63_testArrayLengthZero() {
    const arr = [1, 2, 3];
    arr.length = 0;
    const keys = Object.keys(arr);
    return keys.length === 0;
}

// 测试点64：类原型方法（不可枚举）不返回
export function Fn64_testClassMethodExclude() {
    class MyClass {
        constructor() {
            this.own = "own";
        }

        method1() {
        }

        method2() {
        }
    }

    const inst = new MyClass();
    const keys = Object.keys(inst);
    return keys.length === 1 && keys[0] === "own";
}

// 测试点65：Object.defineProperty定义可枚举属性，正确返回
export function Fn65_testObjectDefineEnumerable() {
    const obj = {};
    Object.defineProperty(obj, "enumKey", { value: "enum", enumerable: true });
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "enumKey";
}

// 测试点66：多个不可枚举属性，均不返回
export function Fn66_testMultipleNonEnumerableProps() {
    const obj = {};
    Object.defineProperty(obj, "n1", { value: 1, enumerable: false });
    Object.defineProperty(obj, "n2", { value: 2, enumerable: false });
    obj.e1 = 3;
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "e1";
}

// 测试点67：可枚举与不可枚举属性混合，只返回可枚举的
export function Fn67_testMixedEnumerableNonEnumerable() {
    const obj = {};
    Object.defineProperty(obj, "n1", { value: 1, enumerable: false });
    obj.e1 = 2;
    Object.defineProperty(obj, "n2", { value: 3, enumerable: false });
    obj.e2 = 4;
    const keys = Object.keys(obj);
    return keys.sort().join(",") === "e1,e2";
}

// 测试点68：多个Symbol键，均不返回
export function Fn68_testMultiSymbolKeys() {
    const s1 = Symbol("s1");
    const s2 = Symbol("s2");
    const obj = {
        str1: "a",
        [s1]: "s1",
        str2: "b",
        [s2]: "s2"
    };
    const keys = Object.keys(obj);
    return keys.sort().join(",") === "str1,str2";
}

// 测试点69：多个字符串键，按插入顺序返回
export function Fn69_testMultiStringKeys() {
    const obj = {
        z: "z",
        a: "a",
        m: "m",
        b: "b"
    };
    const keys = Object.keys(obj);
    return keys.join(",") === "z,a,m,b";
}

// 测试点70：空字符串原始值返回空数组
export function Fn70_testEmptyStringPrimitive() {
    const keys = Object.keys("");
    return keys.length === 0;
}

// 测试点71：单字符字符串返回['0']
export function Fn71_testSingleCharString() {
    const keys = Object.keys("a");
    return keys.length === 1 && keys[0] === "0";
}

// 测试点72：NaN原始值返回空数组
export function Fn72_testNaNPrimitive() {
    const keys = Object.keys(NaN);
    return keys.length === 0;
}

// 测试点73：Infinity原始值返回空数组
export function Fn73_testInfinityPrimitive() {
    const keys = Object.keys(Infinity);
    return keys.length === 0;
}

// 测试点74：-Infinity原始值返回空数组
export function Fn74_testNegativeInfinityPrimitive() {
    const keys = Object.keys(-Infinity);
    return keys.length === 0;
}

// 测试点75：负数原始值返回空数组
export function Fn75_testNegativeNumberPrimitive() {
    const keys = Object.keys(-123);
    return keys.length === 0;
}

// 测试点76：小数原始值返回空数组
export function Fn76_testDecimalNumberPrimitive() {
    const keys = Object.keys(3.14);
    return keys.length === 0;
}

// 测试点77：稀疏数组+自定义属性，返回索引（非空槽）和自定义属性
export function Fn77_testArrayWithHoleAndProp() {
    const arr = [1, , 3];
    arr.custom = "val";
    const keys = Object.keys(arr);
    return keys.sort().join(",") === "0,2,custom";
}

// 测试点78：类数组含非索引属性，返回所有可枚举属性
export function Fn78_testArrayLikeWithNonIndexProp() {
    const arrLike = {
        0: "a",
        1: "b",
        type: "array-like",
        length: 2
    };
    const keys = Object.keys(arrLike);
    return keys.sort().join(",") === "0,1,length,type";
}

// 测试点79：WeakMap含entries，自身无枚举属性返回空数组
export function Fn79_testWeakMapWithEntries() {
    const wm = new WeakMap([[{ key: "k" }, "v"]]);
    const keys = Object.keys(wm);
    return keys.length === 0;
}

// 测试点80：WeakSet含values，自身无枚举属性返回空数组
export function Fn80_testWeakSetWithValues() {
    const ws = new WeakSet([{ val: "v1" }, { val: "v2" }]);
    const keys = Object.keys(ws);
    return keys.length === 0;
}

// 测试点81：函数的name属性不可枚举，不返回
export function Fn81_testFunctionNameNonEnumerable() {

    function fn() {
    }

    const keys = Object.keys(fn);
    return !keys.includes("name");
}

// 测试点82：函数的length属性不可枚举，不返回
export function Fn82_testFunctionLengthNonEnumerable() {

    function fn(a, b) {
    }

    const keys = Object.keys(fn);
    return !keys.includes("length");
}

// 测试点83：箭头函数无prototype，添加属性仍返回
export function Fn83_testArrowFunctionNoPrototype() {
    const arrowFn = () => {
    };
    arrowFn.prop = "val";
    const keys = Object.keys(arrowFn);
    return keys.length === 1 && keys[0] === "prop";
}

// 测试点84：生成器函数有prototype，添加属性返回
export function Fn84_testGeneratorFunctionPrototype() {

    function* gen() {
    }

    gen.prop = "val";
    const keys = Object.keys(gen);
    return keys.length === 1 && keys[0] === "prop";
}

// 测试点85：类的静态不可枚举属性不返回
export function Fn85_testClassStaticNonEnumerable() {
    class MyClass {
        static get staticGetter() {
            return "getter";
        }
    }

    const keys = Object.keys(MyClass);
    return keys.length === 0;
}

// 测试点86：类实例继承的原型属性不返回
export function Fn86_testClassInstanceInheritedProp() {
    class Parent {
        constructor() {
            this.parentProp = "parent";
        }
    }

    class Child extends Parent {
        constructor() {
            super();
            this.childProp = "child";
        }
    }

    const child = new Child();
    const keys = Object.keys(child);
    return keys.length === 2 && keys[0] === "parentProp";
}

// 测试点87：代理目标对象的不可枚举属性，不返回
export function Fn87_testProxyTargetNonEnumerable() {
    const target = {};
    Object.defineProperty(target, "n1", { value: 1, enumerable: false });
    target.e1 = 2;
    const proxy = new Proxy(target, {});
    const keys = Object.keys(proxy);
    return keys.length === 1 && keys[0] === "e1";
}

// 测试点88：拦截ownKeys返回Symbol，Object.keys不返回
export function Fn88_testProxyOwnKeysFilterSymbol() {
    const s = Symbol("s");
    const proxy = new Proxy({}, { ownKeys: () => ["x", s, "y"] });
    const keys = Object.keys(proxy);
    return keys.join(",") === "";
}

// 测试点89：Object.fromEntries创建的对象，返回正确属性名
export function Fn89_testObjectFromEntries() {
    const entries = [["a", 1], ["b", 2], ["c", 3]];
    const obj = Object.fromEntries(entries);
    const keys = Object.keys(obj);
    return keys.join(",") === "a,b,c";
}

// 测试点90：Object.assign添加的可枚举属性，正确返回
export function Fn90_testObjectAssignProps() {
    const target = { a: 1 };
    const source = { b: 2, c: 3 };
    Object.assign(target, source);
    const keys = Object.keys(target);
    return keys.join(",") === "a,b,c";
}

// 测试点91：继承自null的对象，返回自身属性
export function Fn91_testObjectCreateNull() {
    const obj = Object.create(null);
    obj.ownKey = "own";
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "ownKey";
}

// 测试点92：继承自Array的对象，返回自身属性（不含Array原型属性）
export function Fn92_testObjectCreateArray() {
    const arrObj = Object.create(Array.prototype);
    arrObj[0] = "a";
    arrObj.custom = "val";
    const keys = Object.keys(arrObj);
    return keys.sort().join(",") === "0,custom";
}

// 测试点93：修改Array.prototype添加可枚举属性，数组不返回该属性
export function Fn93_testArrayPrototypeModified() {
    Array.prototype.arrProtoKey = "arrProto";
    const arr = [1, 2];
    const keys = Object.keys(arr);
    delete Array.prototype.arrProtoKey; // 清理环境
    return keys.join(",") === "0,1";
}

// 测试点94：BigInt原始值返回空数组
export function Fn94_testBigIntPrimitive() {
    const keys = Object.keys(123n);
    return keys.length === 0;
}

// 测试点95：BigInt对象返回空数组
export function Fn95_testBigIntObject() {
    const keys = Object.keys(Object(123n));
    return keys.length === 0;
}

// 测试点96：Symbol原始值返回空数组
export function Fn96_testSymbolPrimitive() {
    const keys = Object.keys(Symbol("sym"));
    return keys.length === 0;
}

// 测试点97：Symbol对象返回空数组
export function Fn97_testSymbolObject() {
    const keys = Object.keys(Object(Symbol("sym")));
    return keys.length === 0;
}

// 测试点98：对象含__proto__自身属性（可枚举），返回__proto__
export function Fn98_testObjWithProtoProp() {
    const obj = { __proto__: { a: 1 }, ownKey: "own" };
    const keys = Object.keys(obj);
    return keys.includes("__proto__") === false;
}

// 测试点99：__proto__属性设为不可枚举，不返回
export function Fn99_testObjWithProtoPropNonEnumerable() {
    const obj = { ownKey: "own" };
    Object.defineProperty(obj, "__proto__", { value: { a: 1 }, enumerable: false });
    const keys = Object.keys(obj);
    return !keys.includes("__proto__");
}

// 测试点100：数组含自身__proto__属性（可枚举），返回__proto__
export function Fn100_testArrayWithProtoProp() {
    const arr = [1, 2];
    arr.__proto__ = { a: 1 };
    const keys = Object.keys(arr);
    return keys.includes("__proto__") === false;
}

// 测试点101：对象含循环引用，仍返回自身可枚举属性
export function Fn101_testObjWithCircularRef() {
    const obj = { a: 1, b: 2 };
    obj.self = obj; // 循环引用
    const keys = Object.keys(obj);
    return keys.sort().join(",") === "a,b,self";
}

// 测试点102：数组含循环引用，仍返回索引键
export function Fn102_testArrayWithCircularRef() {
    const arr = [1, 2];
    arr.self = arr; // 循环引用
    const keys = Object.keys(arr);
    return keys.sort().join(",") === "0,1,self";
}

// 测试点103：类的静态方法（不可枚举）不返回
export function Fn103_testClassWithStaticMethod() {
    class MyClass {
        static staticMethod() {
        }
    }

    const keys = Object.keys(MyClass);
    return keys.length === 0;
}

// 测试点104：类的静态字段（可枚举）返回
export function Fn104_testClassWithStaticField() {
    class MyClass {
        static field1 = "f1";
        static field2 = "f2";
    }

    const keys = Object.keys(MyClass);
    return keys.sort().join(",") === "field1,field2";
}

// 测试点105：拦截ownKeys返回空数组，Object.keys返回空
export function Fn105_testProxyOwnKeysReturnEmpty() {
    const proxy = new Proxy({}, { ownKeys: () => [] });
    const keys = Object.keys(proxy);
    return keys.length === 0;
}

// 测试点106：拦截ownKeys返回重复键，抛出TypeError
export function Fn106_testProxyOwnKeysReturnDuplicate() {
    try {
        const proxy = new Proxy({}, { ownKeys: () => ["x", "x"] });
        Object.keys(proxy);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// 测试点107：Object.defineProperty设置enumerable:true，返回属性
export function Fn107_testObjectDefinePropertyEnumerableTrue() {
    const obj = {};
    Object.defineProperty(obj, "key", { value: "val", enumerable: true });
    const keys = Object.keys(obj);
    return keys[0] === "key";
}

// 测试点108：Object.defineProperty设置enumerable:false，不返回属性
export function Fn108_testObjectDefinePropertyEnumerableFalse() {
    const obj = {};
    Object.defineProperty(obj, "key", { value: "val", enumerable: false });
    const keys = Object.keys(obj);
    return keys.length === 0;
}

// 测试点109：属性值为BigInt，返回属性名
export function Fn109_testObjPropValueBigInt() {
    const obj = { big: 123n, normal: 456 };
    const keys = Object.keys(obj);
    return keys.join(",") === "big,normal";
}

// 测试点110：属性值为Symbol，返回属性名
export function Fn110_testObjPropValueSymbol() {
    const obj = { sym: Symbol("s"), str: "str" };
    const keys = Object.keys(obj);
    return keys.join(",") === "sym,str";
}

// 测试点111：属性值为RegExp对象，仍返回属性名
export function Fn111_testObjPropValueRegExp() {
    const obj = { reg: /test/g, str: "val" };
    const keys = Object.keys(obj);
    return keys.join(",") === "reg,str";
}

// 测试点112：属性值为Map对象，仍返回属性名
export function Fn112_testObjPropValueMap() {
    const obj = { map: new Map([["k", "v"]]), num: 123 };
    const keys = Object.keys(obj);
    return keys.join(",") === "map,num";
}

// 测试点113：属性值为Set对象，仍返回属性名
export function Fn113_testObjPropValueSet() {
    const obj = { set: new Set([1, 2]), bool: true };
    const keys = Object.keys(obj);
    return keys.join(",") === "set,bool";
}

// 测试点114：超长属性名（100字符），正确返回
export function Fn114_testLongKeyName() {
    const longKey = "a".repeat(100);
    const obj = { [longKey]: "longVal", shortKey: "shortVal" };
    const keys = Object.keys(obj);
    return keys.includes(longKey) && keys.includes("shortKey");
}

// 测试点115：属性名为表情符号，正确返回
export function Fn115_testEmojiKeyName() {
    const emojiKey = "😀";
    const obj = { [emojiKey]: "smile", "❤️": "heart" };
    const keys = Object.keys(obj);
    return keys.join(",") === "😀,❤️";
}

// 测试点116：多层继承链的可枚举原型属性，仍不返回
export function Fn116_testMultiLevelProtoEnumerable() {
    const greatGrand = { gKey: "gVal" };
    const grand = Object.create(greatGrand);
    grand.grandKey = "grandVal"; // 原型链第二层可枚举属性
    const parent = Object.create(grand);
    const child = Object.create(parent);
    child.childKey = "childVal";
    const keys = Object.keys(child);
    return keys.length === 1 && keys[0] === "childKey";
}

// 测试点117：带可枚举getter的属性，返回属性名
export function Fn117_testEnumerableGetterProp() {
    const obj = {};
    Object.defineProperty(obj, "getterKey", {
        get: () => "getVal",
        enumerable: true
    });
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "getterKey";
}

// 测试点118：带不可枚举getter的属性，不返回
export function Fn118_testNonEnumerableGetterProp() {
    const obj = {};
    Object.defineProperty(obj, "getterKey", {
        get: () => "getVal",
        enumerable: false
    });
    const keys = Object.keys(obj);
    return keys.length === 0;
}

// 测试点119：带可枚举setter的属性，返回属性名
export function Fn119_testEnumerableSetterProp() {
    const obj = {};
    Object.defineProperty(obj, "setterKey", {
        set: (val) => {
        },
        enumerable: true
    });
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "setterKey";
}

// 测试点120：带不可枚举setter的属性，不返回
export function Fn120_testNonEnumerableSetterProp() {
    const obj = {};
    Object.defineProperty(obj, "setterKey", {
        set: (val) => {
        },
        enumerable: false
    });
    const keys = Object.keys(obj);
    return keys.length === 0;
}

// 测试点121：空类实例（无自身属性）返回空数组
export function Fn121_testEmptyClassInstance() {
    class EmptyClass {
    }

    const inst = new EmptyClass();
    const keys = Object.keys(inst);
    return keys.length === 0;
}

// 测试点123：属性名为数字字符串"000"，正确返回（区别于"0"）
export function Fn123_testNumberStringKeyWithZeros() {
    const obj = { "0": "zero", "000": "threeZeros" };
    const keys = Object.keys(obj);
    return keys.sort().join(",") === "0,000";
}

// 测试点124：属性值为WeakMap，仍返回属性名
export function Fn124_testObjPropValueWeakMap() {
    const obj = { wm: new WeakMap(), str: "val" };
    const keys = Object.keys(obj);
    return keys.join(",") === "wm,str";
}

// 测试点125：属性值为WeakSet，仍返回属性名
export function Fn125_testObjPropValueWeakSet() {
    const obj = { ws: new WeakSet(), num: 456 };
    const keys = Object.keys(obj);
    return keys.join(",") === "ws,num";
}

// 测试点126：属性名包含混合特殊字符（!@#$），正确返回
export function Fn126_testMixedSpecialCharKeys() {
    const obj = { "key!": "v1", "@key#": "v2", "$key%": "v3" };
    const keys = Object.keys(obj);
    return keys.join(",") === "key!,@key#,$key%";
}

// 测试点127：自身属性与原型属性同名，返回自身属性
export function Fn127_testOwnPropSameAsProto() {
    const proto = { sameKey: "protoVal" };
    const obj = Object.create(proto);
    obj.sameKey = "ownVal"; // 自身属性覆盖原型属性
    const keys = Object.keys(obj);
    return keys.length === 1 && keys[0] === "sameKey";
}