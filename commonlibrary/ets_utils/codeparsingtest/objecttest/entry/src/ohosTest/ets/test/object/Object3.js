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

// 1. 测试原型链多级继承
export function Fn1_testMultiLevelInheritance() {
    const grandparent = { age: 60 };
    const parent = Object.create(grandparent);
    const child = Object.create(parent);

    if (child.age !== 60) {
        console.error("Fn1_testMultiLevelInheritance 失败：未实现多级原型继承");
        return false;
    }
    console.log("Fn1_testMultiLevelInheritance 通过");
    return true;
}

// 2. 测试自有属性覆盖原型属性
export function Fn2_testOwnPropOverridesProto() {
    const proto = { name: "原型名" };
    const obj = Object.create(proto);
    obj.name = "自有名"; // 新增自有属性

    if (obj.name !== "自有名") {
        console.error("Fn1_testOwnPropOverridesProto 失败：自有属性未覆盖原型属性");
        return false;
    }
    console.log("Fn1_testOwnPropOverridesProto 通过");
    return true;
}

// 3. 测试 propertiesObject 中 enumerable: false 的属性不可枚举
export function Fn3_testNonEnumerableOwnProp() {
    const obj = Object.create({}, {
        hiddenProp: { value: "隐藏属性", enumerable: false }
    });

    if (Object.keys(obj).includes("hiddenProp")) {
        console.error("Fn1_testNonEnumerableOwnProp 失败：不可枚举属性被枚举");
        return false;
    }
    console.log("Fn1_testNonEnumerableOwnProp 通过");
    return true;
}


// 6. 测试 propertiesObject 接受访问器属性（get/set）
export function Fn6_testAccessorPropInProperties() {
    let internalVal = 0;
    const obj = Object.create({}, {
        count: {
            get() {
                return internalVal;
            },
            set(val) {
                internalVal = val;
            },
            enumerable: true
        }
    });
    obj.count = 10;

    if (obj.count !== 10) {
        console.error("Fn1_testAccessorPropInProperties 失败：访问器属性未生效");
        return false;
    }
    console.log("Fn1_testAccessorPropInProperties 通过");
    return true;
}

// 7. 测试原型对象为冻结对象时仍可继承
export function Fn7_testInheritFromFrozenProto() {
    const frozenProto = Object.freeze({ prop: "冻结属性" });
    const obj = Object.create(frozenProto);

    if (obj.prop !== "冻结属性") {
        console.error("Fn1_testInheritFromFrozenProto 失败：无法继承冻结原型的属性");
        return false;
    }
    console.log("Fn1_testInheritFromFrozenProto 通过");
    return true;
}

// 8. 测试原型对象为密封对象时仍可继承
export function Fn8_testInheritFromSealedProto() {
    const sealedProto = Object.seal({ prop: "密封属性" });
    const obj = Object.create(sealedProto);

    if (obj.prop !== "密封属性") {
        console.error("Fn1_testInheritFromSealedProto 失败：无法继承密封原型的属性");
        return false;
    }
    console.log("Fn1_testInheritFromSealedProto 通过");
    return true;
}

// 9. 测试 Object.create() 创建的对象可添加新自有属性
export function Fn9_testAddNewOwnPropToCreatedObj() {
    const obj = Object.create({ protoProp: "原型" });
    obj.newOwnProp = "新自有属性";

    if (obj.newOwnProp !== "新自有属性") {
        console.error("Fn1_testAddNewOwnPropToCreatedObj 失败：无法添加新自有属性");
        return false;
    }
    console.log("Fn1_testAddNewOwnPropToCreatedObj 通过");
    return true;
}

// 10. 测试 Object.hasOwn() 区分自有属性和原型属性
export function Fn10_testHasOwnDistinguishProp() {
    const proto = { protoProp: "原型" };
    const obj = Object.create(proto, { ownProp: { value: "自有", enumerable: true } });

    if (!Object.hasOwn(obj, "ownProp") || Object.hasOwn(obj, "protoProp")) {
        console.error("Fn1_testHasOwnDistinguishProp 失败：未正确区分自有/原型属性");
        return false;
    }
    console.log("Fn1_testHasOwnDistinguishProp 通过");
    return true;
}


// 12. 测试 propertiesObject 为 undefined 时不添加自有属性
export function Fn12_testPropertiesObjectIsUndefined() {
    const proto = { prop: "原型" };
    const obj = Object.create(proto, undefined); // 第二个参数为 undefined

    if (Object.keys(obj).length !== 0) {
        console.error("Fn1_testPropertiesObjectIsUndefined 失败：propertiesObject 为 undefined 时添加了属性");
        return false;
    }
    console.log("Fn1_testPropertiesObjectIsUndefined 通过");
    return true;
}

// 13. 测试原型为数组时继承数组方法
export function Fn13_testProtoIsArray() {
    const arrProto = [1, 2, 3];
    const obj = Object.create(arrProto);
    obj.push(4); // 继承数组的 push 方法

    if (arrProto.length !== 4 || arrProto[3] !== 4) {
        console.error("Fn1_testProtoIsArray 失败：未继承数组方法");
        return false;
    }
    console.log("Fn1_testProtoIsArray 通过");
    return true;
}

// 15. 测试修改原型对象后，已创建的实例能访问新属性
export function Fn15_testProtoUpdateAffectsInstance() {
    const proto = { oldProp: "旧属性" };
    const obj = Object.create(proto);
    proto.newProp = "新属性"; // 动态修改原型

    if (obj.newProp !== "新属性") {
        console.error("Fn1_testProtoUpdateAffectsInstance 失败：原型更新未影响实例");
        return false;
    }
    console.log("Fn1_testProtoUpdateAffectsInstance 通过");
    return true;
}

// 16. 测试 propertiesObject 中属性描述符缺少 enumerable 时默认不可枚举
export function Fn16_testDefaultEnumerableInProperties() {
    const obj = Object.create({}, {
        defaultProp: { value: "默认", writable: true } // 未指定 enumerable
    });

    if (Object.keys(obj).includes("defaultProp")) {
        console.error("Fn1_testDefaultEnumerableInProperties 失败：默认 enumerable 应为 false");
        return false;
    }
    console.log("Fn1_testDefaultEnumerableInProperties 通过");
    return true;
}

// 22. 测试 propertiesObject 中同一属性重复定义时取最后一个
export function Fn22_testDuplicatePropInProperties() {
    const obj = Object.create({}, {
        dupProp: { value: "第一个", enumerable: true },
        dupProp: { value: "最后一个", enumerable: true } // 重复定义
    });

    if (obj.dupProp !== "最后一个") {
        console.error("Fn1_testDuplicatePropInProperties 失败：重复属性未取最后一个");
        return false;
    }
    console.log("Fn1_testDuplicatePropInProperties 通过");
    return true;
}


// 24. 测试 Object.create() 与 Object.setPrototypeOf() 效果一致（基础场景）
export function Fn24_testCompareWithSetPrototypeOf() {
    const proto = { prop: "原型" };
    const obj1 = Object.create(proto);
    const obj2 = {};
    Object.setPrototypeOf(obj2, proto); // 手动设置原型

    if (Object.getPrototypeOf(obj1) !== Object.getPrototypeOf(obj2) || obj1.prop !== obj2.prop) {
        console.error("Fn1_testCompareWithSetPrototypeOf 失败：与 setPrototypeOf 效果不一致");
        return false;
    }
    console.log("Fn1_testCompareWithSetPrototypeOf 通过");
    return true;
}

// 25. 测试 propertiesObject 中属性描述符为无效格式时抛出 TypeError
export function Fn25_testInvalidPropDescriptorThrows() {
    const invalidDescriptors = [
        { prop: { value: "无效", enumerable: "不是布尔" } }, // enumerable 非布尔
        { prop: { value: "无效", writable: "不是布尔" } }, // writable 非布尔
        { prop: { get: "不是函数" } }// get 非函数
    ];
    let allThrow = true;

    invalidDescriptors.forEach((desc, idx) => {
        try {
            Object.create({}, desc);
            console.error(`Fn1_testInvalidPropDescriptorThrows 失败：第${idx + 1}个无效描述符未抛错`);
            allThrow = false;
        } catch (err) {
            if (!(err instanceof TypeError)) {
                allThrow = false;
            }
        }
    });

    if (allThrow) {
        console.log("Fn1_testInvalidPropDescriptorThrows 通过");
        return true;
    }
    return false;
}

// 测试点26：基础原型继承（仅指定 proto 参数）
export function Fn26_testBasicPrototypeInheritance() {
    const parent = {
        name: "父对象",
        sayHi: function () {
            return `Hi, 来自${this.name}`;
        }
    };
    const child = Object.create(parent);

    if (Object.getPrototypeOf(child) !== parent) {
        console.error("Fn1_测试失败：新对象原型不是 parent");
        return false;
    }
    if (child.name !== "父对象") {
        console.error("Fn1_测试失败：未继承原型的 name 属性");
        return false;
    }
    if (child.sayHi() !== "Hi, 来自父对象") {
        console.error("Fn1_测试失败：未继承原型的 sayHi 方法");
        return false;
    }

    console.log("Fn1_测试（基础原型继承）通过");
    return true;
}

// 测试点27：带属性描述符的对象创建（指定 propertiesObject 参数）
export function Fn27_testWithPropertiesDescriptor() {
    const protoObj = { protoProp: "原型属性" };
    const newObj = Object.create(protoObj, {
        ownProp: {
            value: "自有属性",
            writable: true,
            enumerable: true,
            configurable: true
        }
    });

    newObj.ownProp = "修改后的自有属性";
    if (newObj.ownProp !== "修改后的自有属性") {
        console.error("Fn1_测试失败：自有属性不可写");
        return false;
    }

    const hasOwnProp = Object.keys(newObj).includes("ownProp");
    if (!hasOwnProp) {
        console.error("Fn1_测试失败：自有属性不可枚举");
        return false;
    }

    delete newObj.ownProp;
    if (newObj.ownProp !== undefined) {
        console.error("Fn1_测试失败：自有属性不可删除");
        return false;
    }

    console.log("Fn1_测试（带属性描述符创建）通过");
    return true;
}

// 测试点28：proto 非对象/非 null 时抛出 TypeError
export function Fn28_testInvalidProtoThrowsTypeError() {
    const invalidProtos = [123, "string", true, undefined, Symbol("test")];
    let allPass = true;

    invalidProtos.forEach((invalidProto, index) => {
        try {
            Object.create(invalidProto);
            console.error(`Fn1_测试失败：proto 为 ${typeof invalidProto}（第${index + 1}个参数）时未抛出错误`);
            allPass = false;
        } catch (err) {
            if (!(err instanceof TypeError)) {
                console.error(`Fn1_测试失败：proto 为 ${typeof invalidProto}（第${index +
                    1}个参数）时错误类型不是 TypeError`);
                allPass = false;
            }
        }
    });

    if (allPass) {
        console.log("Fn1_测试（非法 proto 抛错）通过");
        return true;
    } else {
        return false;
    }
}

// 测试点29：创建原型为 null 的对象（无继承链）
export function Fn29_testCreateWithNullProto() {
    const nullProtoObj = Object.create(null);
    nullProtoObj.ownAttr = "无原型的自有属性";

    if (Object.getPrototypeOf(nullProtoObj) !== null) {
        console.error("Fn1_测试失败：原型不是 null");
        return false;
    }
    if (nullProtoObj.ownAttr !== "无原型的自有属性") {
        console.error("Fn1_测试失败：自有属性无法访问");
        return false;
    }

    let hasToStringError = false;
    try {
        nullProtoObj.toString();
    } catch (err) {
        if (err instanceof TypeError) {
            hasToStringError = true;
        }
    }
    if (!hasToStringError) {
        console.error("Fn1_测试失败：原型为 null 的对象不应有 toString 方法");
        return false;
    }

    console.log("Fn1_测试（原型为 null 的对象）通过");
    return true;
}

// 测试点30：模仿 new 运算符行为（无初始化逻辑时）
export function Fn30_testImitateNewOperator() {

    function Person(name) {
        this.name = name;
    }

    Person.prototype.greet = function () {
        return `Hello, ${this.name}`;
    };

    const person1 = new Person("Alice");
    const person2 = Object.create(Person.prototype);
    person2.name = "Bob";

    if (Object.getPrototypeOf(person2) !== Person.prototype) {
        console.error("Fn1_测试失败：原型不匹配");
        return false;
    }
    if (person2.greet() !== "Hello, Bob") {
        console.error("Fn1_测试失败：未继承原型方法");
        return false;
    }
    if (typeof person2 !== typeof person1) {
        console.error("Fn1_测试失败：实例类型不匹配");
        return false;
    }

    console.log("Fn1_测试（模仿 new 运算符）通过");
    return true;
}

// 33. 测试 propertiesObject 中访问器属性的 get 方法绑定原型上下文
export function Fn33_testAccessorGetBindProtoContext() {
    const proto = { base: 10 };
    const obj = Object.create(proto, {
        sum: {
            get() {
                return this.base + 5;
            }, // this 应指向 obj（继承 proto 的 base）
            enumerable: true
        }
    });

    if (obj.sum !== 15) {
        console.error("Fn33_testAccessorGetBindProtoContext 失败：访问器 get 方法未绑定正确上下文");
        return false;
    }
    console.log("Fn33_testAccessorGetBindProtoContext 通过");
    return true;
}

// 34. 测试 propertiesObject 中访问器属性的 set 方法修改原型属性
export function Fn34_testAccessorSetModifyProtoProp() {
    const proto = { count: 0 };
    const obj = Object.create(proto, {
        updateCount: {
            set(val) {
                this.count += val;
            }, // 通过 set 修改原型的 count
            enumerable: true
        }
    });
    obj.updateCount = 5;

    if (obj.count !== 5 || proto.count !== 5) {
        console.error("Fn34_testAccessorSetModifyProtoProp 失败：访问器 set 方法未修改原型属性");
        return false;
    }
    console.log("Fn34_testAccessorSetModifyProtoProp 通过");
    return true;
}

// 35. 测试原型为类实例时继承类的实例方法
export function Fn35_testProtoIsClassInstance() {
    class TestClass {
        testMethod() {
            return "class method";
        }
    }

    const classInst = new TestClass();
    const obj = Object.create(classInst);

    if (obj.testMethod() !== "class method") {
        console.error("Fn35_testProtoIsClassInstance 失败：未继承类实例的方法");
        return false;
    }
    console.log("Fn35_testProtoIsClassInstance 通过");
    return true;
}

// 36. 测试原型为类原型（prototype）时继承类的原型方法
export function Fn36_testProtoIsClassPrototype() {
    class TestClass {
        protoMethod() {
            return "prototype method";
        }
    }

    const obj = Object.create(TestClass.prototype); // 直接以类原型为原型

    if (obj.protoMethod() !== "prototype method") {
        console.error("Fn36_testProtoIsClassPrototype 失败：未继承类原型的方法");
        return false;
    }
    console.log("Fn36_testProtoIsClassPrototype 通过");
    return true;
}

// 37. 测试 propertiesObject 中属性描述符同时包含 value 和 get 时抛出 TypeError
export function Fn37_testValueAndGetInDescriptorThrows() {
    try {
        Object.create({}, {
            invalidProp: {
                value: 10, get() {
                    return 20;
                }
            } // 同时存在 value 和 get，非法
        });
        console.error("Fn37_testValueAndGetInDescriptorThrows 失败：未抛出非法描述符错误");
        return false;
    } catch (err) {
        if (!(err instanceof TypeError)) {
            console.error("Fn37_testValueAndGetInDescriptorThrows 失败：错误类型不是 TypeError");
            return false;
        }
        console.log("Fn37_testValueAndGetInDescriptorThrows 通过");
        return true;
    }
}

// 38. 测试原型为 null 时，对象无 constructor 属性
export function Fn38_testNullProtoHasNoConstructor() {
    const obj = Object.create(null);

    if (obj.constructor !== undefined) {
        console.error("Fn38_testNullProtoHasNoConstructor 失败：原型为 null 的对象不应有 constructor");
        return false;
    }
    console.log("Fn38_testNullProtoHasNoConstructor 通过");
    return true;
}

// 39. 测试原型对象的 constructor 被修改后，实例的 constructor 同步变化
export function Fn39_testProtoConstructorChangeAffectsInstance() {

    function OldCtor() {
    }

    function NewCtor() {
    }

    const proto = new OldCtor();
    const obj = Object.create(proto);
    proto.constructor = NewCtor; // 修改原型的 constructor

    if (obj.constructor !== NewCtor) {
        console.error("Fn39_testProtoConstructorChangeAffectsInstance 失败：原型 constructor 修改未同步到实例");
        return false;
    }
    console.log("Fn39_testProtoConstructorChangeAffectsInstance 通过");
    return true;
}

// 40. 测试 propertiesObject 为空对象时，新对象无自有属性
export function Fn40_testEmptyPropertiesObject() {
    const proto = { prop: "原型" };
    const obj = Object.create(proto, {}); // 第二个参数为空对象

    if (Object.keys(obj).length !== 0) {
        console.error("Fn40_testEmptyPropertiesObject 失败：空 propertiesObject 导致新增自有属性");
        return false;
    }
    console.log("Fn40_testEmptyPropertiesObject 通过");
    return true;
}


// 42. 测试 Object.create() 创建的对象可通过 Object.defineProperty 添加属性
export function Fn42_testDefinePropOnCreatedObj() {
    const obj = Object.create({ protoProp: "原型" });
    Object.defineProperty(obj, "newProp", {
        value: "通过 defineProperty 添加",
        enumerable: true
    });

    if (obj.newProp !== "通过 defineProperty 添加") {
        console.error("Fn42_testDefinePropOnCreatedObj 失败：无法通过 defineProperty 新增属性");
        return false;
    }
    console.log("Fn42_testDefinePropOnCreatedObj 通过");
    return true;
}

// 43. 测试原型对象的原型被修改后，多级继承的实例能访问新属性
export function Fn43_testDeepProtoUpdateAffectsInstance() {
    const grandparent = { gProp: "祖父属性" };
    const parent = Object.create(grandparent);
    const child = Object.create(parent);
    grandparent.newGProp = "新祖父属性"; // 修改祖父原型

    if (child.newGProp !== "新祖父属性") {
        console.error("Fn43_testDeepProtoUpdateAffectsInstance 失败：深层原型更新未影响实例");
        return false;
    }
    console.log("Fn43_testDeepProtoUpdateAffectsInstance 通过");
    return true;
}

// 44. 测试 propertiesObject 中属性的 enumerable 为 true 时，for...in 能遍历到
export function Fn44_testEnumerablePropInForIn() {
    const obj = Object.create({ protoProp: "原型" }, {
        ownEnumerableProp: { value: "可枚举自有属性", enumerable: true }
    });
    let hasOwnProp = false;

    for (const key in obj) {
        if (key === "ownEnumerableProp") {
            hasOwnProp = true;
        }
    }

    if (!hasOwnProp) {
        console.error("Fn44_testEnumerablePropInForIn 失败：可枚举自有属性未出现在 for...in 中");
        return false;
    }
    console.log("Fn44_testEnumerablePropInForIn 通过");
    return true;
}

// 45. 测试 propertiesObject 中属性的 enumerable 为 false 时，for...in 遍历不到
export function Fn45_testNonEnumerablePropNotInForIn() {
    const obj = Object.create({ protoProp: "原型" }, {
        ownNonEnumerableProp: { value: "不可枚举自有属性", enumerable: false }
    });
    let hasNonEnumProp = false;

    for (const key in obj) {
        if (key === "ownNonEnumerableProp") {
            hasNonEnumProp = true;
        }
    }

    if (hasNonEnumProp) {
        console.error("Fn45_testNonEnumerablePropNotInForIn 失败：不可枚举自有属性出现在 for...in 中");
        return false;
    }
    console.log("Fn45_testNonEnumerablePropNotInForIn 通过");
    return true;
}

// 47. 测试 Object.create() 与 Object.getPrototypeOf() 配合验证原型链
export function Fn47_testCreateAndGetPrototypeOf() {
    const proto1 = { p1: "proto1" };
    const proto2 = Object.create(proto1);
    const obj = Object.create(proto2);

    const protoChain = [
        Object.getPrototypeOf(obj) === proto2,
        Object.getPrototypeOf(proto2) === proto1,
        Object.getPrototypeOf(proto1) === Object.prototype
    ];

    if (!protoChain.every(res => res)) {
        console.error("Fn47_testCreateAndGetPrototypeOf 失败：原型链验证不通过");
        return false;
    }
    console.log("Fn47_testCreateAndGetPrototypeOf 通过");
    return true;
}

// 48. 测试 propertiesObject 中属性的 configurable 为 false 时，无法修改描述符
export function Fn48_testNonConfigurablePropCannotModifyDesc() {
    const obj = Object.create({}, {
        nonConfigProp: { value: "不可配置", configurable: false, enumerable: true }
    });

    try {
        Object.defineProperty(obj, "nonConfigProp", { enumerable: false }); // 尝试修改描述符
        console.error("Fn48_testNonConfigurablePropCannotModifyDesc 失败：不可配置属性可修改描述符");
        return false;
    } catch (err) {
        if (err instanceof TypeError) {
            console.log("Fn48_testNonConfigurablePropCannotModifyDesc 通过");
            return true;
        }
        return false;
    }
}

// 49. 测试原型为 Error 实例时继承 Error 的属性（如 message）
export function Fn49_testProtoIsError() {
    const errorProto = new Error("测试错误");
    const obj = Object.create(errorProto);

    if (obj.message !== "测试错误" || !(obj instanceof Error)) {
        console.error("Fn49_testProtoIsError 失败：未继承 Error 实例的属性或类型不对");
        return false;
    }
    console.log("Fn49_testProtoIsError 通过");
    return true;
}

// 50. 测试 Object.create() 批量创建对象时，原型引用一致
export function Fn50_testBatchCreateSameProto() {
    const sharedProto = { shared: "共享原型属性" };
    const obj1 = Object.create(sharedProto);
    const obj2 = Object.create(sharedProto);
    sharedProto.updated = "更新的共享属性"; // 修改共享原型

    if (obj1.updated !== "更新的共享属性" || obj2.updated !== "更新的共享属性") {
        console.error("Fn50_testBatchCreateSameProto 失败：批量创建的对象原型引用不一致");
        return false;
    }
    console.log("Fn50_testBatchCreateSameProto 通过");
    return true;
}

// 53. 测试 propertiesObject 中访问器属性的 get 方法依赖自有属性
export function Fn53_testAccessorGetDependsOwnProp() {
    const obj = Object.create({}, {
        ownNum: { value: 5, writable: true, enumerable: true },
        doubleNum: {
            get() {
                return this.ownNum * 2;
            }, // 依赖自有属性 ownNum
            enumerable: true
        }
    });
    obj.ownNum = 8;

    if (obj.doubleNum !== 16) {
        console.error("Fn53_testAccessorGetDependsOwnProp 失败：访问器 get 未依赖自有属性更新");
        return false;
    }
    console.log("Fn53_testAccessorGetDependsOwnProp 通过");
    return true;
}

// 54. 测试 propertiesObject 中访问器属性的 set 方法校验输入
export function Fn54_testAccessorSetValidateInput() {
    const obj = Object.create({}, {
        age: {
            get() {
                return this._age || 0;
            },
            set(val) {
                this._age = val > 0 ? val : 0;
            }, // 校验：年龄不能为负
            enumerable: true
        }
    });
    obj.age = -5; // 输入非法值

    if (obj.age !== 0) {
        console.error("Fn54_testAccessorSetValidateInput 失败：访问器 set 未校验输入");
        return false;
    }
    console.log("Fn54_testAccessorSetValidateInput 通过");
    return true;
}

// 57. 测试 propertiesObject 中属性描述符的 value 为 undefined 时正常生效
export function Fn57_testDescriptorValueIsUndefined() {
    const obj = Object.create({}, {
        undefProp: { value: undefined, enumerable: true }
    });

    if (obj.undefProp !== undefined || !Object.hasOwn(obj, "undefProp")) {
        console.error("Fn57_testDescriptorValueIsUndefined 失败：value 为 undefined 的属性未正常创建");
        return false;
    }
    console.log("Fn57_testDescriptorValueIsUndefined 通过");
    return true;
}

// 58. 测试 propertiesObject 中属性描述符的 value 为 null 时正常生效
export function Fn58_testDescriptorValueIsNull() {
    const obj = Object.create({}, {
        nullProp: { value: null, enumerable: true }
    });

    if (obj.nullProp !== null || !Object.hasOwn(obj, "nullProp")) {
        console.error("Fn58_testDescriptorValueIsNull 失败：value 为 null 的属性未正常创建");
        return false;
    }
    console.log("Fn58_testDescriptorValueIsNull 通过");
    return true;
}

// 59. 测试原型对象被冻结后，无法修改原型的自有属性
export function Fn59_testFrozenProtoCannotModifyOwnProp() {
    const proto = { prop: "可修改" };
    Object.freeze(proto); // 冻结原型
    const obj = Object.create(proto);

    try {
        proto.prop = "修改后"; // 冻结后修改应失败（严格模式抛错，非严格模式静默失败）
    } catch (e) {
    }

    if (proto.prop !== "可修改" && obj.prop !== "可修改") {
        console.error("Fn59_testFrozenProtoCannotModifyOwnProp 失败：冻结的原型属性被修改");
        return false;
    }
    console.log("Fn59_testFrozenProtoCannotModifyOwnProp 通过");
    return true;
}

// 60. 测试原型对象被密封后，无法删除原型的自有属性
export function Fn60_testSealedProtoCannotDeleteOwnProp() {
    const proto = { prop: "不可删" };
    Object.seal(proto); // 密封原型
    const obj = Object.create(proto);

    try {
        delete proto.prop; // 密封后删除应失败
    } catch (e) {
    }

    if (proto.prop === undefined || obj.prop === undefined) {
        console.error("Fn60_testSealedProtoCannotDeleteOwnProp 失败：密封的原型属性被删除");
        return false;
    }
    console.log("Fn60_testSealedProtoCannotDeleteOwnProp 通过");
    return true;
}

// 61. 测试 Object.create() 创建的对象可通过 Object.assign 添加属性
export function Fn61_testAssignPropToCreatedObj() {
    const obj = Object.create({ protoProp: "原型" });
    Object.assign(obj, { assignProp: "通过 assign 添加" }); // 批量添加自有属性

    if (obj.assignProp !== "通过 assign 添加") {
        console.error("Fn61_testAssignPropToCreatedObj 失败：无法通过 Object.assign 新增属性");
        return false;
    }
    console.log("Fn61_testAssignPropToCreatedObj 通过");
    return true;
}

// 64. 测试 propertiesObject 中属性的 enumerable 为 false 时，可修改为可枚举
export function Fn64_testNonEnumerablePropCanBecomeEnumerable() {
    const obj = Object.create({}, {
        nonEnumProp: { value: "隐藏值", enumerable: false, configurable: true }
    });
    Object.defineProperty(obj, "nonEnumProp", { enumerable: true }); // 修改为可枚举

    if (!Object.keys(obj).includes("nonEnumProp")) {
        console.error("Fn64_testNonEnumerablePropCanBecomeEnumerable 失败：不可枚举属性无法改为可枚举");
        return false;
    }
    console.log("Fn64_testNonEnumerablePropCanBecomeEnumerable 通过");
    return true;
}

// 65. 测试原型为类的静态属性时，实例无法直接继承静态属性
export function Fn65_testProtoCannotInheritStaticProp() {
    class TestClass {
        static staticProp = "静态属性"; // 静态属性属于类，不属于原型
    }

    const obj = Object.create(TestClass.prototype); // 以类原型为原型

    if (obj.staticProp !== undefined) {
        console.error("Fn65_testProtoCannotInheritStaticProp 失败：实例错误继承类的静态属性");
        return false;
    }
    console.log("Fn65_testProtoCannotInheritStaticProp 通过");
    return true;
}

// 66. 测试 Object.create() 创建的对象可作为其他对象的原型
export function Fn66_testCreatedObjAsProto() {
    const parentObj = Object.create({ grandProp: "祖父属性" }, { parentProp: { value: "父属性" } });
    const childObj = Object.create(parentObj); // 以创建的对象为原型

    if (childObj.parentProp !== "父属性" || childObj.grandProp !== "祖父属性") {
        console.error("Fn66_testCreatedObjAsProto 失败：Object.create() 创建的对象无法作为原型");
        return false;
    }
    console.log("Fn66_testCreatedObjAsProto 通过");
    return true;
}

// 67. 测试原型为 Error 子类实例时继承子类属性（如 HttpError 的 status）
export function Fn67_testProtoIsErrorSubclass() {
    class HttpError extends Error {
        constructor(message, status) {
            super(message);
            this.status = status;
        }
    }

    const errorProto = new HttpError("Not Found", 404);
    const obj = Object.create(errorProto);

    if (obj.message !== "Not Found" || obj.status !== 404) {
        console.error("Fn67_testProtoIsErrorSubclass 失败：未继承 Error 子类实例的属性");
        return false;
    }
    console.log("Fn67_testProtoIsErrorSubclass 通过");
    return true;
}

// 68. 测试 propertiesObject 中属性描述符的 configurable 为 true 时，可删除后重新定义
export function Fn68_testConfigurablePropCanRedefine() {
    const obj = Object.create({}, {
        configProp: { value: "初始", configurable: true }
    });
    delete obj.configProp; // 删除属性
    Object.defineProperty(obj, "configProp", { value: "重新定义" }); // 重新定义

    if (obj.configProp !== "重新定义") {
        console.error("Fn68_testConfigurablePropCanRedefine 失败：可配置属性删除后无法重新定义");
        return false;
    }
    console.log("Fn68_testConfigurablePropCanRedefine 通过");
    return true;
}

// 71. 测试 Object.create() 创建的对象可使用 Object.keys() 获取自有属性
export function Fn71_testCreatedObjOwnPropInKeys() {
    const obj = Object.create({ protoProp: "原型" }, {
        ownProp1: { value: "1", enumerable: true },
        ownProp2: { value: "2", enumerable: true },
        ownProp3: { value: "3", enumerable: false } // 不可枚举，不应该出现在 keys 中
    });
    const ownKeys = Object.keys(obj);

    if (ownKeys.length !== 2 || !ownKeys.includes("ownProp1") || !ownKeys.includes("ownProp2")) {
        console.error("Fn71_testCreatedObjOwnPropInKeys 失败：Object.keys() 未正确获取自有属性");
        return false;
    }
    console.log("Fn71_testCreatedObjOwnPropInKeys 通过");
    return true;
}

// 73. 测试 propertiesObject 中访问器属性与数据属性同名时，访问器属性生效
export function Fn73_testAccessorOverridesDataProp() {
    const obj = Object.create({}, {
        sameName: { value: "数据属性", enumerable: true }, // 先定义数据属性
        sameName: {
            // 后定义访问器属性，覆盖前者
            get() {
                return "访问器属性";
            },
            enumerable: true
        }
    });

    if (obj.sameName !== "访问器属性") {
        console.error("Fn73_testAccessorOverridesDataProp 失败：访问器属性未覆盖同名数据属性");
        return false;
    }
    console.log("Fn73_testAccessorOverridesDataProp 通过");
    return true;
}

// 74. 测试原型对象的原型为 null 时，实例的原型链终止于 null
export function Fn74_testProtoChainEndsWithNull() {
    const proto = Object.create(null, { prop: { value: "终止链属性" } });
    const obj = Object.create(proto);

    if (Object.getPrototypeOf(proto) !== null || Object.getPrototypeOf(obj) !== proto) {
        console.error("Fn74_testProtoChainEndsWithNull 失败：原型链未正确终止于 null");
        return false;
    }
    console.log("Fn74_testProtoChainEndsWithNull 通过");
    return true;
}

// 75. 测试 Object.create() 创建的对象可通过解构赋值获取自有属性
export function Fn75_testDestructureOwnPropFromCreatedObj() {
    const obj = Object.create({ protoProp: "原型" }, {
        name: { value: "Alice", enumerable: true },
        age: { value: 25, enumerable: true }
    });
    const { name, age } = obj; // 解构自有属性

    if (name !== "Alice" || age !== 25) {
        console.error("Fn75_testDestructureOwnPropFromCreatedObj 失败：无法解构获取自有属性");
        return false;
    }
    console.log("Fn75_testDestructureOwnPropFromCreatedObj 通过");
    return true;
}

// 77. 测试 propertiesObject 中属性描述符的 configurable 为 false 时，无法修改为可配置
export function Fn77_testNonConfigurableCannotBecomeConfigurable() {
    const obj = Object.create({}, {
        nonConfigProp: { value: "固定", configurable: false }
    });

    try {
        Object.defineProperty(obj, "nonConfigProp", { configurable: true }); // 尝试修改
        console.error("Fn77_testNonConfigurableCannotBecomeConfigurable 失败：不可配置属性改为可配置");
        return false;
    } catch (err) {
        if (err instanceof TypeError) {
            console.log("Fn77_testNonConfigurableCannotBecomeConfigurable 通过");
            return true;
        }
        return false;
    }
}

// 78. 测试原型为自定义对象字面量时，实例可修改原型的引用类型属性
export function Fn78_testModifyProtoReferenceProp() {
    const proto = { list: [1, 2] }; // 引用类型属性（数组）
    const obj = Object.create(proto);
    obj.list.push(3); // 修改原型的引用类型属性

    if (proto.list.length !== 3 || obj.list[2] !== 3) {
        console.error("Fn78_testModifyProtoReferenceProp 失败：无法修改原型的引用类型属性");
        return false;
    }
    console.log("Fn78_testModifyProtoReferenceProp 通过");
    return true;
}

// 79. 测试 Object.create() 创建的对象可使用 Object.values() 获取自有属性值
export function Fn79_testCreatedObjOwnPropInValues() {
    const obj = Object.create({ protoProp: "原型" }, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: true },
        c: { value: 3, enumerable: false }
    });
    const ownValues = Object.values(obj);

    if (ownValues.length !== 2 || !ownValues.includes(1) || !ownValues.includes(2)) {
        console.error("Fn79_testCreatedObjOwnPropInValues 失败：Object.values() 未正确获取自有属性值");
        return false;
    }
    console.log("Fn79_testCreatedObjOwnPropInValues 通过");
    return true;
}

// 83. 测试 propertiesObject 中属性描述符同时含 set 和 value 时抛出 TypeError
export function Fn83_testSetAndValueInDescriptorThrows() {
    try {
        Object.create({}, {
            invalidProp: {
                value: "test", set() {
                }
            } // 同时存在 value 和 set，非法
        });
        console.error("Fn83_testSetAndValueInDescriptorThrows 失败：未抛出非法描述符错误");
        return false;
    } catch (err) {
        if (!(err instanceof TypeError)) {
            console.error("Fn83_testSetAndValueInDescriptorThrows 失败：错误类型不是 TypeError");
            return false;
        }
        console.log("Fn83_testSetAndValueInDescriptorThrows 通过");
        return true;
    }
}

// 85. 测试 Object.create() 创建的对象可通过 Object.entries() 获取自有属性键值对
export function Fn85_testCreatedObjOwnPropInEntries() {
    const obj = Object.create({ proto: "proto-val" }, {
        x: { value: 10, enumerable: true },
        y: { value: 20, enumerable: true },
        z: { value: 30, enumerable: false }
    });
    const entries = Object.entries(obj);
    const expectedEntries = [["x", 10], ["y", 20]];

    if (entries.length !== expectedEntries.length ||
        !entries.every(([k, v]) => expectedEntries.some(([ek, ev]) => ek === k && ev === v))) {
        console.error("Fn85_testCreatedObjOwnPropInEntries 失败：Object.entries() 未正确获取键值对");
        return false;
    }
    console.log("Fn85_testCreatedObjOwnPropInEntries 通过");
    return true;
}

// 86. 测试原型为 Error 原型（Error.prototype）时继承错误方法（如 toString）
export function Fn86_testProtoIsErrorPrototype() {
    const obj = Object.create(Error.prototype);
    obj.message = "custom error"; // 设置错误消息
    const errStr = obj.toString(); // 继承 Error.prototype 的 toString 方法

    if (!errStr.includes("custom error")) {
        console.error("Fn86_testProtoIsErrorPrototype 失败：未继承 Error.prototype 的方法");
        return false;
    }
    console.log("Fn86_testProtoIsErrorPrototype 通过");
    return true;
}

// 87. 测试 propertiesObject 中属性的 get 方法为箭头函数时绑定全局上下文（非实例）
export function Fn87_testArrowFuncGetBindsGlobal() {
    const globalThisRef = globalThis; // 保存全局上下文引用
    const obj = Object.create({}, {
        testProp: {
            get: () => this === globalThisRef, // 箭头函数 this 绑定全局
            enumerable: true
        }
    });

    if (!obj.testProp) {
        console.error("Fn87_testArrowFuncGetBindsGlobal 失败：箭头函数 get 未绑定全局上下文");
        return false;
    }
    console.log("Fn87_testArrowFuncGetBindsGlobal 通过");
    return true;
}


// 91. 测试 propertiesObject 中属性描述符的 configurable 为 true 时，可修改 value
export function Fn91_testConfigurablePropCanModifyValue() {
    const obj = Object.create({}, {
        configProp: { value: "old", configurable: true, writable: false }
    });
    Object.defineProperty(obj, "configProp", { value: "new" }); // 可配置时允许修改 value

    if (obj.configProp !== "new") {
        console.error("Fn91_testConfigurablePropCanModifyValue 失败：可配置属性无法修改 value");
        return false;
    }
    console.log("Fn91_testConfigurablePropCanModifyValue 通过");
    return true;
}

// 93. 测试 Object.create() 创建的对象与字面量对象的原型链差异
export function Fn93_testProtoChainDiffWithLiteralObj() {
    const createObj = Object.create(Object.prototype); // 显式指定原型为 Object.prototype
    const literalObj = {}; // 隐式原型为 Object.prototype

    const createChain = Object.getPrototypeOf(createObj) === Object.prototype &&
        Object.getPrototypeOf(Object.prototype) === null;
    const literalChain = Object.getPrototypeOf(literalObj) === Object.prototype &&
        Object.getPrototypeOf(Object.prototype) === null;

    if (!createChain || !literalChain) {
        console.error("Fn93_testProtoChainDiffWithLiteralObj 失败：创建对象与字面量对象原型链不一致");
        return false;
    }
    console.log("Fn93_testProtoChainDiffWithLiteralObj 通过");
    return true;
}

// 95. 测试 propertiesObject 中属性的 enumerable 为 true 时，可通过 for...of 遍历（需实现迭代器）
export function Fn95_testEnumerablePropForOfTraversal() {
    const obj = Object.create({}, {
        0: { value: "a", enumerable: true },
        1: { value: "b", enumerable: true },
        length: { value: 2, enumerable: false },
        [Symbol.iterator]: {
            value: function* () {
                for (let i = 0; i < this.length; i++) {
                    yield this[i];
                }
            },
            enumerable: false
        }
    });
    const traversed = [];
    for (const val of obj) {
        traversed.push(val);
    } // 遍历对象

    if (traversed.join(",") !== "a,b") {
        console.error("Fn95_testEnumerablePropForOfTraversal 失败：可枚举属性无法通过 for...of 遍历");
        return false;
    }
    console.log("Fn95_testEnumerablePropForOfTraversal 通过");
    return true;
}

// 97. 测试 Object.create() 创建的对象可通过 Object.getOwnPropertyDescriptors() 获取描述符
export function Fn97_testGetOwnDescriptorsOnCreatedObj() {
    const obj = Object.create({ proto: "val" }, {
        testProp: {
            value: "test",
            writable: false,
            enumerable: true,
            configurable: true
        }
    });
    const descriptors = Object.getOwnPropertyDescriptors(obj);

    if (!descriptors.testProp || descriptors.testProp.value !== "test" || descriptors.testProp.writable !== false) {
        console.error("Fn97_testGetOwnDescriptorsOnCreatedObj 失败：无法正确获取自有属性描述符");
        return false;
    }
    console.log("Fn97_testGetOwnDescriptorsOnCreatedObj 通过");
    return true;
}


// 99. 测试 propertiesObject 中属性的 set 方法为箭头函数时绑定全局上下文
export function Fn99_testArrowFuncSetBindsGlobal() {
    let globalBound = false;
    const globalThisRef = globalThis;
    const obj = Object.create({}, {
        testProp: {
            set: (val) => {
                globalBound = this === globalThisRef && val === "test";
            },
            enumerable: true
        }
    });
    obj.testProp = "test"; // 触发 set 方法

    if (!globalBound) {
        console.error("Fn99_testArrowFuncSetBindsGlobal 失败：箭头函数 set 未绑定全局上下文");
        return false;
    }
    console.log("Fn99_testArrowFuncSetBindsGlobal 通过");
    return true;
}

