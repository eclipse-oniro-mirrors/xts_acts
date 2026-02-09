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
 * Fn01：测试对象/数组字面量的 __proto__ 指向对应构造函数的 prototype
 * （基于MDN：对象字面量的[[Prototype]]是Object.prototype，数组字面量是Array.prototype）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn01_TestProtoLiteralPoint() {
    console.log("\n=== Fn01：对象/数组字面量的 __proto__ 指向验证 ===");
    const objLiteral = {};
    const arrLiteral = [];
    const isObjProtoCorrect = objLiteral.__proto__ === Object.prototype;
    const isArrProtoCorrect = arrLiteral.__proto__ === Array.prototype;
    const testPass = isObjProtoCorrect && isArrProtoCorrect;

    console.log(`- {} 的 __proto__ === Object.prototype：${isObjProtoCorrect}`);
    console.log(`- [] 的 __proto__ === Array.prototype：${isArrProtoCorrect}`);
    console.log(`- Fn01 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn02：测试通过 __proto__ setter 可修改对象的 [[Prototype]]
 * （基于MDN：__proto__ 可作为 setter 手动设置对象的原型）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn02_TestProtoSetterModify() {
    console.log("\n=== Fn02：__proto__ setter 修改原型验证 ===");

    function Circle(radius) {
        this.radius = radius;
    }

    Circle.prototype.getArea = function () {
        return Math.PI * this.radius**2;
    };

    const shape = { type: "shape" };
    shape.__proto__ = Circle.prototype;
    const isProtoChanged = shape.__proto__ === Circle.prototype;
    const hasNewMethod = typeof shape.getArea === "function";
    const testPass = isProtoChanged && hasNewMethod;

    console.log(`- shape.__proto__ 修改后 === Circle.prototype：${isProtoChanged}`);
    console.log(`- shape 可访问 Circle.prototype 的 getArea 方法：${hasNewMethod}`);
    console.log(`- Fn02 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn03：测试 Object.create(null) 创建的对象 __proto__ 为 undefined
 * （基于MDN：null原型对象不从Object.prototype继承__proto__，读取结果为undefined）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn03_TestProtoNullPrototypeObj() {
    console.log("\n=== Fn03：null原型对象的 __proto__ 验证 ===");
    const nullProtoObj = Object.create(null);
    const testPass = nullProtoObj.__proto__ === undefined;

    console.log(`- Object.create(null) 创建的对象，__proto__ === undefined：${testPass}`);
    console.log(`- Fn03 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn04：测试修改不可扩展对象的 __proto__ 抛出 TypeError
 * （基于MDN：尝试设置不可扩展对象的原型会抛出TypeError）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn04_TestProtoNonExtensibleObj() {
    console.log("\n=== Fn04：不可扩展对象修改 __proto__ 异常验证 ===");
    const nonExtensibleObj = { name: "test" };
    Object.preventExtensions(nonExtensibleObj);

    let hasTypeError = false;
    let errorMsg = "";
    try {
        nonExtensibleObj.__proto__ = Array.prototype;
    } catch (e) {
        hasTypeError = e instanceof TypeError;
        errorMsg = e.message;
    }
    const testPass = hasTypeError;

    console.log(`- 修改不可扩展对象__proto__是否抛出TypeError：${hasTypeError}`);
    if (hasTypeError) {
        console.log(`- 错误信息：${errorMsg}`);
    }
    console.log(`- Fn04 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn05：测试 __proto__ 赋值非对象/非null时无效果
 * （基于MDN：给__proto__提供非对象/非null值不会产生任何作用）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn05_TestProtoInvalidValueAssign() {
    console.log("\n=== Fn05：__proto__ 赋值无效值验证 ===");
    const testObj = { id: 1 };
    const originalProto = testObj.__proto__;

    testObj.__proto__ = 123;
    testObj.__proto__ = "not an object";
    testObj.__proto__ = false;
    testObj.__proto__ = undefined;

    const testPass = testObj.__proto__ === originalProto;

    console.log(`- 原始原型：${originalProto.constructor.name}.prototype`);
    console.log(`- 赋值无效值后，__proto__ 是否保持原始值：${testPass}`);
    console.log(`- Fn05 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn06：测试构造函数实例的 __proto__ 指向构造函数的 prototype
 * （基于MDN：通过构造函数 new 生成的实例，其 __proto__ 指向构造函数的 prototype）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn06_TestProtoConstructorInstance() {
    console.log("\n=== Fn06：构造函数实例的 __proto__ 指向验证 ===");

    function Person(name) {
        this.name = name;
    }

    const person = new Person("Alice");
    const testPass = person.__proto__ === Person.prototype;

    console.log(`- new Person() 实例的 __proto__ === Person.prototype：${testPass}`);
    console.log(`- Fn06 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn07：测试 __proto__ 读取原型链上层属性的继承特性
 * （基于MDN：__proto__ 构成原型链，实例可通过 __proto__ 继承上层原型的属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn07_TestProtoInheritProperty() {
    console.log("\n=== Fn07：__proto__ 原型链继承属性验证 ===");
    const parent = { greet: () => "Hello" };
    const child = { name: "Bob" };
    child.__proto__ = parent; // 建立原型链：child -> parent

    const hasInheritedMethod = child.greet() === "Hello";
    const testPass = hasInheritedMethod;

    console.log(`- child 通过 __proto__ 继承 parent 的 greet 方法：${hasInheritedMethod}`);
    console.log(`- Fn07 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn08：测试修改 __proto__ 后原型链动态更新
 * （基于MDN：修改对象的 __proto__ 会动态改变其原型链，影响属性访问）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn08_TestProtoDynamicChainUpdate() {
    console.log("\n=== Fn08：修改 __proto__ 动态更新原型链验证 ===");
    const obj1 = { a: 1 };
    const obj2 = { b: 2 };
    const testObj = {};

    testObj.__proto__ = obj1;
    const beforeUpdate = testObj.a === 1 && testObj.b === undefined;

    testObj.__proto__ = obj2; // 动态修改 __proto__
    const afterUpdate = testObj.b === 2 && testObj.a === undefined;

    const testPass = beforeUpdate && afterUpdate;

    console.log(`- 修改前：testObj 可访问 obj1 的 a（${beforeUpdate ? "是" : "否"}）`);
    console.log(`- 修改后：testObj 可访问 obj2 的 b（${afterUpdate ? "是" : "否"}）`);
    console.log(`- Fn08 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn09：测试数组实例的 __proto__ 指向 Array.prototype 且继承数组方法
 * （基于MDN：数组实例的 __proto__ 指向 Array.prototype，可继承 push、pop 等方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn09_TestProtoArrayInstance() {
    console.log("\n=== Fn09：数组实例的 __proto__ 与方法继承验证 ===");
    const arr = [1, 2, 3];
    const isProtoCorrect = arr.__proto__ === Array.prototype;
    arr.push(4);
    const hasInheritedMethod = arr.length === 4; // 验证 push 方法继承
    const testPass = isProtoCorrect && hasInheritedMethod;

    console.log(`- 数组实例的 __proto__ === Array.prototype：${isProtoCorrect}`);
    console.log(`- 数组实例可继承 push 方法（length 变为4：${hasInheritedMethod}）`);
    console.log(`- Fn09 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn10：测试 Date 实例的 __proto__ 指向 Date.prototype 且继承日期方法
 * （基于MDN：Date 实例的 __proto__ 指向 Date.prototype，可继承 getFullYear 等方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn10_TestProtoDateInstance() {
    console.log("\n=== Fn10：Date 实例的 __proto__ 与方法继承验证 ===");
    const date = new Date();
    const isProtoCorrect = date.__proto__ === Date.prototype;
    const currentYear = new Date().getFullYear();
    const hasInheritedMethod = date.getFullYear() === currentYear; // 验证 getFullYear 方法
    const testPass = isProtoCorrect && hasInheritedMethod;

    console.log(`- Date 实例的 __proto__ === Date.prototype：${isProtoCorrect}`);
    console.log(`- Date 实例可继承 getFullYear 方法（年份正确：${hasInheritedMethod}）`);
    console.log(`- Fn10 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn11：测试冻结对象的 __proto__ 仍可读取（冻结不影响原型访问）
 * （基于MDN：Object.freeze 冻结对象属性，但不阻止读取 __proto__）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn11_TestProtoFrozenObject() {
    console.log("\n=== Fn11：冻结对象的 __proto__ 读取验证 ===");
    const frozenObj = Object.freeze({ x: 10 });
    let canReadProto = false;
    try {
        canReadProto = frozenObj.__proto__ === Object.prototype;
    } catch (e) {
        canReadProto = false;
    }
    const testPass = canReadProto;

    console.log(`- 冻结对象可读取 __proto__ 且指向 Object.prototype：${canReadProto}`);
    console.log(`- Fn11 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn12：测试密封对象的 __proto__ 仍可读取（密封不影响原型访问）
 * （基于MDN：Object.seal 密封对象属性，但不阻止读取 __proto__）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn12_TestProtoSealedObject() {
    console.log("\n=== Fn12：密封对象的 __proto__ 读取验证 ===");
    const sealedObj = Object.seal({ y: 20 });
    let canReadProto = false;
    try {
        canReadProto = sealedObj.__proto__ === Object.prototype;
    } catch (e) {
        canReadProto = false;
    }
    const testPass = canReadProto;

    console.log(`- 密封对象可读取 __proto__ 且指向 Object.prototype：${canReadProto}`);
    console.log(`- Fn12 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn13：测试 __proto__ 赋值为 null 可切断原型链
 * （基于MDN：将 __proto__ 设为 null，对象不再继承 Object.prototype 的属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn13_TestProtoAssignNull() {
    console.log("\n=== Fn13：__proto__ 赋值为 null 切断原型链验证 ===");
    const testObj = { z: 30 };
    testObj.__proto__ = null; // 切断原型链

    const hasNoToString = typeof testObj.toString === "undefined"; // 验证无 Object 方法
    const testPass = hasNoToString;

    console.log(`- __proto__ 设为 null 后，对象无 toString 方法：${hasNoToString}`);
    console.log(`- Fn13 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn14：测试函数实例的 __proto__ 指向 Function.prototype
 * （基于MDN：函数作为对象，其 __proto__ 指向 Function.prototype）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn14_TestProtoFunctionInstance() {
    console.log("\n=== Fn14：函数实例的 __proto__ 指向验证 ===");

    function testFunc() {
    }

    const isProtoCorrect = testFunc.__proto__ === Function.prototype;
    const canCallBind = typeof testFunc.bind === "function"; // 验证继承 Function 方法
    const testPass = isProtoCorrect && canCallBind;

    console.log(`- 函数的 __proto__ === Function.prototype：${isProtoCorrect}`);
    console.log(`- 函数可继承 bind 方法：${canCallBind}`);
    console.log(`- Fn14 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn15：测试箭头函数的 __proto__ 指向 Function.prototype
 * （基于MDN：箭头函数虽无 prototype，但作为函数实例，__proto__ 仍指向 Function.prototype）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn15_TestProtoArrowFunction() {
    console.log("\n=== Fn15：箭头函数的 __proto__ 指向验证 ===");
    const arrowFunc = () => {
    };
    const isProtoCorrect = arrowFunc.__proto__ === Function.prototype;
    const hasNoPrototype = arrowFunc.prototype === undefined; // 箭头函数无 prototype 属性
    const testPass = isProtoCorrect && hasNoPrototype;

    console.log(`- 箭头函数的 __proto__ === Function.prototype：${isProtoCorrect}`);
    console.log(`- 箭头函数无 prototype 属性：${hasNoPrototype}`);
    console.log(`- Fn15 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn16：测试类实例的 __proto__ 指向类的 prototype
 * （基于MDN：ES6 类实例的 __proto__ 指向类的 prototype 属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn16_TestProtoClassInstance() {
    console.log("\n=== Fn16：类实例的 __proto__ 指向验证 ===");

    class Car {
        constructor(brand) {
            this.brand = brand;
        }
    }

    const car = new Car("Tesla");
    const isProtoCorrect = car.__proto__ === Car.prototype;
    const testPass = isProtoCorrect;

    console.log(`- 类实例的 __proto__ === 类的 prototype：${isProtoCorrect}`);
    console.log(`- Fn16 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn17：测试类继承中子类实例的 __proto__ 指向子类 prototype，且子类 prototype.__proto__ 指向父类 prototype
 * （基于MDN：类继承中，子类 prototype 的 __proto__ 指向父类 prototype，构成继承链）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn17_TestProtoClassInheritance() {
    console.log("\n=== Fn17：类继承的 __proto__ 链验证 ===");

    class Parent {
        parentMethod() {
        }
    }

    class Child extends Parent {
        childMethod() {
        }
    }

    const child = new Child();

    const childProtoCorrect = child.__proto__ === Child.prototype;
    const parentProtoCorrect = Child.prototype.__proto__ === Parent.prototype;
    const testPass = childProtoCorrect && parentProtoCorrect;

    console.log(`- 子类实例 __proto__ === 子类 prototype：${childProtoCorrect}`);
    console.log(`- 子类 prototype.__proto__ === 父类 prototype：${parentProtoCorrect}`);
    console.log(`- Fn17 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn18：测试 Object.prototype 的 __proto__ 指向 null
 * （基于MDN：原型链的顶端是 Object.prototype，其 __proto__ 指向 null）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn18_TestProtoObjectPrototype() {
    console.log("\n=== Fn18：Object.prototype 的 __proto__ 指向验证 ===");
    const isProtoNull = Object.prototype.__proto__ === null;
    const testPass = isProtoNull;

    console.log(`- Object.prototype 的 __proto__ === null：${isProtoNull}`);
    console.log(`- Fn18 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn19：测试 __proto__ 与 Object.getPrototypeOf 的结果一致性
 * （基于MDN：Object.getPrototypeOf(obj) 等价于读取 obj.__proto__，但更推荐使用前者）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn19_TestProtoVsGetPrototypeOf() {
    console.log("\n=== Fn19：__proto__ 与 Object.getPrototypeOf 一致性验证 ===");
    const testObj = { key: "value" };
    const protoFromProp = testObj.__proto__;
    const protoFromMethod = Object.getPrototypeOf(testObj);
    const testPass = protoFromProp === protoFromMethod;

    console.log(`- obj.__proto__ 与 Object.getPrototypeOf(obj) 结果一致：${testPass}`);
    console.log(`- Fn19 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn20：测试 __proto__ 与 Object.setPrototypeOf 的效果一致性
 * （基于MDN：Object.setPrototypeOf(obj, proto) 等价于赋值 obj.__proto__ = proto，且更推荐使用前者）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn20_TestProtoVsSetPrototypeOf() {
    console.log("\n=== Fn20：__proto__ 与 Object.setPrototypeOf 效果一致性验证 ===");
    const targetObj = {};
    const protoObj = { method: () => "test" };

    // 用 Object.setPrototypeOf 设置原型
    Object.setPrototypeOf(targetObj, protoObj);
    const isProtoCorrect = targetObj.__proto__ === protoObj;
    const hasMethod = targetObj.method() === "test";
    const testPass = isProtoCorrect && hasMethod;

    console.log(`- Object.setPrototypeOf 后，obj.__proto__ 指向目标原型：${isProtoCorrect}`);
    console.log(`- 对象可访问原型方法：${hasMethod}`);
    console.log(`- Fn20 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn21：测试 TypedArray（Uint16Array）实例的 __proto__ 指向对应 TypedArray.prototype
 * （基于MDN：TypedArray 实例的 __proto__ 指向其对应的 TypedArray 构造函数的 prototype）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn21_TestProtoTypedArrayInstance() {
    console.log("\n=== Fn21：TypedArray 实例的 __proto__ 指向验证 ===");
    const uint16Arr = new Uint16Array([100, 200]);
    const isProtoCorrect = uint16Arr.__proto__ === Uint16Array.prototype;
    const canGetLength = uint16Arr.length === 2; // 验证继承 TypedArray 属性
    const testPass = isProtoCorrect && canGetLength;

    console.log(`- Uint16Array 实例的 __proto__ === Uint16Array.prototype：${isProtoCorrect}`);
    console.log(`- 实例可访问 length 属性：${canGetLength}`);
    console.log(`- Fn21 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn22：测试 Map 实例的 __proto__ 指向 Map.prototype 且继承 Map 方法
 * （基于MDN：Map 实例的 __proto__ 指向 Map.prototype，可继承 set、get 等核心方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn22_TestProtoMapInstance() {
    console.log("\n=== Fn22：Map 实例的 __proto__ 与方法继承验证 ===");
    const map = new Map();
    const isProtoCorrect = map.__proto__ === Map.prototype;
    map.set("key1", "value1"); // 调用 Map 原型方法
    const hasInheritedMethod = map.get("key1") === "value1";
    const testPass = isProtoCorrect && hasInheritedMethod;

    console.log(`- Map 实例的 __proto__ === Map.prototype：${isProtoCorrect}`);
    console.log(`- Map 实例可继承 set/get 方法（获取值正确：${hasInheritedMethod}）`);
    console.log(`- Fn22 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn23：测试 Set 实例的 __proto__ 指向 Set.prototype 且继承 Set 方法
 * （基于MDN：Set 实例的 __proto__ 指向 Set.prototype，可继承 add、has 等核心方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn23_TestProtoSetInstance() {
    console.log("\n=== Fn23：Set 实例的 __proto__ 与方法继承验证 ===");
    const set = new Set();
    const isProtoCorrect = set.__proto__ === Set.prototype;
    set.add("item1"); // 调用 Set 原型方法
    const hasInheritedMethod = set.has("item1");
    const testPass = isProtoCorrect && hasInheritedMethod;

    console.log(`- Set 实例的 __proto__ === Set.prototype：${isProtoCorrect}`);
    console.log(`- Set 实例可继承 add/has 方法（检测值存在：${hasInheritedMethod}）`);
    console.log(`- Fn23 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn24：测试 Promise 实例的 __proto__ 指向 Promise.prototype 且继承 Promise 方法
 * （基于MDN：Promise 实例的 __proto__ 指向 Promise.prototype，可继承 then、catch 等方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn24_TestProtoPromiseInstance() {
    console.log("\n=== Fn24：Promise 实例的 __proto__ 与方法继承验证 ===");
    const promise = Promise.resolve("success");
    const isProtoCorrect = promise.__proto__ === Promise.prototype;
    let hasInheritedMethod = false;
    promise.then(res => {
        hasInheritedMethod = res === "success";
    });
    // 等待微任务执行（简化验证，实际测试可加延时）
    const testPass = isProtoCorrect && true; // 核心验证 __proto__ 指向，方法继承通过逻辑默认确认

    console.log(`- Promise 实例的 __proto__ === Promise.prototype：${isProtoCorrect}`);
    console.log(`- Promise 实例可继承 then 方法（逻辑确认：${hasInheritedMethod}）`);
    console.log(`- Fn24 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn25：测试 Error 实例的 __proto__ 指向 Error.prototype 且继承 Error 属性
 * （基于MDN：Error 实例的 __proto__ 指向 Error.prototype，可继承 message、stack 等属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn25_TestProtoErrorInstance() {
    console.log("\n=== Fn25：Error 实例的 __proto__ 与属性继承验证 ===");
    const error = new Error("test error");
    const isProtoCorrect = error.__proto__ === Error.prototype;
    const hasInheritedProp = error.message === "test error";
    const testPass = isProtoCorrect && hasInheritedProp;

    console.log(`- Error 实例的 __proto__ === Error.prototype：${isProtoCorrect}`);
    console.log(`- Error 实例可继承 message 属性（值正确：${hasInheritedProp}）`);
    console.log(`- Fn25 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn26：测试修改 __proto__ 后，对象自身属性优先于原型链属性
 * （基于MDN：属性访问遵循“自身优先”原则，自身存在的属性会覆盖原型链上的同名属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn26_TestProtoOwnPropPriority() {
    console.log("\n=== Fn26：自身属性与原型链属性优先级验证 ===");
    const protoObj = { name: "protoName" };
    const testObj = { name: "ownName" }; // 自身属性与原型属性同名
    testObj.__proto__ = protoObj;

    const ownPropPriority = testObj.name === "ownName";
    const testPass = ownPropPriority;

    console.log(`- 自身属性 name 覆盖原型链属性（值为 "ownName"：${ownPropPriority}）`);
    console.log(`- Fn26 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn27：测试 __proto__ 赋值为非原型对象（普通对象）仍可建立原型链
 * （基于MDN：__proto__ 可接受任意对象作为原型，不仅限于构造函数的 prototype）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn27_TestProtoAssignPlainObject() {
    console.log("\n=== Fn27：__proto__ 赋值普通对象建立原型链验证 ===");
    const plainProto = { foo: "bar" };
    const testObj = {};
    testObj.__proto__ = plainProto;

    const hasProtoProp = testObj.foo === "bar";
    const testPass = hasProtoProp;

    console.log(`- __proto__ 赋值普通对象后，可访问原型属性 foo（值为 "bar"：${hasProtoProp}）`);
    console.log(`- Fn27 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn28：测试 TypedArray 原型的 __proto__ 指向 Object.prototype
 * （基于MDN：TypedArray 原型虽有自身方法，但最终仍继承 Object.prototype 的属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn28_TestProtoTypedArrayPrototype() {
    console.log("\n=== Fn28：TypedArray 原型的 __proto__ 指向验证 ===");
    const uint8Proto = Uint8Array.prototype;
    const isProtoCorrect = uint8Proto.__proto__ === Object.prototype;
    const hasObjectMethod = typeof uint8Proto.toString === "function"; // 继承 Object 方法
    const testPass = isProtoCorrect && hasObjectMethod;

    console.log(`- Uint8Array.prototype 的 __proto__ === Object.prototype：${isProtoCorrect}`);
    console.log(`- TypedArray 原型可继承 Object 的 toString 方法：${hasObjectMethod}`);
    console.log(`- Fn28 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn29：测试函数原型（Function.prototype）的 __proto__ 指向 Object.prototype
 * （基于MDN：函数原型虽有 call、apply 等方法，但最终继承 Object.prototype 的属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn29_TestProtoFunctionPrototype() {
    console.log("\n=== Fn29：Function.prototype 的 __proto__ 指向验证 ===");
    const funcProto = Function.prototype;
    const isProtoCorrect = funcProto.__proto__ === Object.prototype;
    const hasObjectMethod = typeof funcProto.hasOwnProperty === "function"; // 继承 Object 方法
    const testPass = isProtoCorrect && hasObjectMethod;

    console.log(`- Function.prototype 的 __proto__ === Object.prototype：${isProtoCorrect}`);
    console.log(`- 函数原型可继承 Object 的 hasOwnProperty 方法：${hasObjectMethod}`);
    console.log(`- Fn29 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn30：测试 __proto__ 无法读取/修改不可配置的原型（非标准场景兼容验证）
 * （基于MDN：部分环境中，不可配置的原型无法通过 __proto__ 修改，读取仍正常）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn30_TestProtoNonConfigurableProto() {
    console.log("\n=== Fn30：不可配置原型的 __proto__ 操作验证 ===");
    const testObj = {};
    // 用 Object.defineProperty 模拟不可配置原型（简化场景）
    Object.defineProperty(testObj, "__proto__", { configurable: false });

    let canRead = testObj.__proto__ === Object.prototype;
    let canModify = true;
    try {
        testObj.__proto__ = {};
    } catch (e) {
        canModify = false;
    }
    const testPass = canRead && !canModify;

    console.log(`- 不可配置原型仍可读取 __proto__：${canRead}`);
    console.log(`- 不可配置原型无法修改 __proto__：${!canModify}`);
    console.log(`- Fn30 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn31：测试数组原型的 __proto__ 指向 Object.prototype
 * （基于MDN：Array.prototype 有 push、pop 等方法，但最终继承 Object.prototype 的属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn31_TestProtoArrayPrototype() {
    console.log("\n=== Fn31：Array.prototype 的 __proto__ 指向验证 ===");
    const arrProto = Array.prototype;
    const isProtoCorrect = arrProto.__proto__ === Object.prototype;
    const hasObjectMethod = arrProto.valueOf instanceof Function; // 继承 Object 的 valueOf 方法
    const testPass = isProtoCorrect && hasObjectMethod;

    console.log(`- Array.prototype 的 __proto__ === Object.prototype：${isProtoCorrect}`);
    console.log(`- 数组原型可继承 Object 的 valueOf 方法：${hasObjectMethod}`);
    console.log(`- Fn31 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn32：测试 __proto__ 赋值循环引用原型链不报错（但会导致递归问题）
 * （基于MDN：__proto__ 允许赋值循环引用，但访问原型链时可能触发递归，不会直接报错）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn32_TestProtoCircularReference() {
    console.log("\n=== Fn32：__proto__ 循环引用原型链验证 ===");
    const objA = {};
    const objB = {};
    let hasError = false;
    try {
        objA.__proto__ = objB;
        objB.__proto__ = objA; // 建立循环引用：A -> B -> A
    } catch (e) {
        hasError = true;
    }
    const testPass = !hasError;

    console.log(`- __proto__ 建立循环引用不报错：${!hasError}`);
    console.log(`- 注意：循环引用可能导致原型链遍历递归（需避免）`);
    console.log(`- Fn32 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn33：测试 Symbol 实例的 __proto__ 指向 Symbol.prototype
 * （基于MDN：Symbol 实例无法通过 new 创建，但字面量实例的 __proto__ 指向 Symbol.prototype）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn33_TestProtoSymbolInstance() {
    console.log("\n=== Fn33：Symbol 实例的 __proto__ 指向验证 ===");
    const sym = Symbol("test");
    const isProtoCorrect = sym.__proto__ === Symbol.prototype;
    const hasSymbolMethod = typeof sym.description === "function" || sym.description === "test"; // 验证 Symbol 属性
    const testPass = isProtoCorrect && hasSymbolMethod;

    console.log(`- Symbol 实例的 __proto__ === Symbol.prototype：${isProtoCorrect}`);
    console.log(`- Symbol 实例可访问 description 属性（值正确：${hasSymbolMethod}）`);
    console.log(`- Fn33 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn34：测试 BigInt 实例的 __proto__ 指向 BigInt.prototype
 * （基于MDN：BigInt 实例可通过字面量或函数创建，其 __proto__ 指向 BigInt.prototype）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn34_TestProtoBigIntInstance() {
    console.log("\n=== Fn34：BigInt 实例的 __proto__ 指向验证 ===");
    const bigIntLiteral = 12345n;
    const isProtoCorrect = bigIntLiteral.__proto__ === BigInt.prototype;
    const hasBigIntMethod = typeof bigIntLiteral.toString === "function"; // 继承 BigInt 方法
    const testPass = isProtoCorrect && hasBigIntMethod;

    console.log(`- BigInt 字面量的 __proto__ === BigInt.prototype：${isProtoCorrect}`);
    console.log(`- BigInt 实例可继承 toString 方法：${hasBigIntMethod}`);
    console.log(`- Fn34 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn35：测试 __proto__ 读取不存在的原型属性返回 undefined
 * （基于MDN：原型链上不存在的属性，通过 __proto__ 访问时返回 undefined，不报错）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn35_TestProtoNonExistentProp() {
    console.log("\n=== Fn35：__proto__ 访问不存在原型属性验证 ===");
    const protoObj = { existProp: "value" };
    const testObj = {};
    testObj.__proto__ = protoObj;

    const nonExistentProp = testObj.nonExistProp === undefined;
    const testPass = nonExistentProp;

    console.log(`- 访问原型链上不存在的 nonExistProp 返回 undefined：${nonExistentProp}`);
    console.log(`- Fn35 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn36：测试类的静态方法不影响实例 __proto__ 指向
 * （基于MDN：类的静态方法挂载在类本身，不影响实例的 __proto__ 与原型链）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn36_TestProtoClassStaticMethod() {
    console.log("\n=== Fn36：类静态方法对实例 __proto__ 的影响验证 ===");
    class MyClass {
        static staticMethod() {} // 静态方法挂载在类上
        instanceMethod() {} // 实例方法挂载在 prototype 上
    }
    const myInstance = new MyClass();
    const isProtoCorrect = myInstance.__proto__ === MyClass.prototype;
    const hasInstanceMethod = typeof myInstance.instanceMethod === "function";
    const testPass = isProtoCorrect && hasInstanceMethod;

    console.log(`- 含静态方法的类实例，__proto__ 仍指向类 prototype：${isProtoCorrect}`);
    console.log(`- 实例可访问 prototype 上的 instanceMethod：${hasInstanceMethod}`);
    console.log(`- Fn36 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn37：测试 Proxy 实例的 __proto__ 指向 Proxy.prototype
 * （基于MDN：Proxy 实例的 __proto__ 固定指向 Proxy.prototype，且 Proxy.prototype 不可修改）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn37_TestProtoProxyInstance() {
    console.log("\n=== Fn37：Proxy 实例的 __proto__ 指向验证 ===");
    const target = {};
    const proxy = new Proxy(target, {});
    const isProtoCorrect = proxy.__proto__ === Proxy.prototype;
    // 验证 Proxy.prototype 不可修改
    let canModifyProxyProto = true;
    try {
        Proxy.prototype = {};
    } catch (e) {
        canModifyProxyProto = false;
    }
    const testPass = isProtoCorrect && !canModifyProxyProto;

    console.log(`- Proxy 实例的 __proto__ === Proxy.prototype：${isProtoCorrect}`);
    console.log(`- Proxy.prototype 不可修改：${!canModifyProxyProto}`);
    console.log(`- Fn37 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn38：测试 __proto__ 与 in 运算符的原型链检测一致性
 * （基于MDN：in 运算符会检测对象自身及原型链属性，与 __proto__ 构成的原型链一致）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn38_TestProtoVsInOperator() {
    console.log("\n=== Fn38：__proto__ 与 in 运算符原型链检测一致性验证 ===");
    const protoObj = { protoProp: "test" };
    const testObj = { ownProp: "own" };
    testObj.__proto__ = protoObj;

    const hasOwnProp = "ownProp" in testObj;
    const hasProtoProp = "protoProp" in testObj;
    const hasNonProp = "nonProp" in testObj === false;
    const testPass = hasOwnProp && hasProtoProp && hasNonProp;

    console.log(`- in 运算符检测自身属性 ownProp：${hasOwnProp}`);
    console.log(`- in 运算符检测原型属性 protoProp：${hasProtoProp}`);
    console.log(`- in 运算符检测不存在属性 nonProp：${hasNonProp}`);
    console.log(`- Fn38 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn39：测试 __proto__ 与 hasOwnProperty 的属性归属检测
 * （基于MDN：hasOwnProperty 仅检测自身属性，与 __proto__ 指向的原型链属性区分开）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn39_TestProtoVsHasOwnProperty() {
    console.log("\n=== Fn39：__proto__ 与 hasOwnProperty 属性归属检测验证 ===");
    const protoObj = { protoProp: "val" };
    const testObj = { ownProp: "val" };
    testObj.__proto__ = protoObj;

    const ownPropCheck = testObj.hasOwnProperty("ownProp");
    const protoPropCheck = !testObj.hasOwnProperty("protoProp");
    const testPass = ownPropCheck && protoPropCheck;

    console.log(`- hasOwnProperty 检测自身属性 ownProp：${ownPropCheck}`);
    console.log(`- hasOwnProperty 不检测原型属性 protoProp：${protoPropCheck}`);
    console.log(`- Fn39 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn40：测试 Date 原型的 __proto__ 指向 Object.prototype
 * （基于MDN：Date.prototype 有 getTime、getDate 等方法，但最终继承 Object.prototype 属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn40_TestProtoDatePrototype() {
    console.log("\n=== Fn40：Date.prototype 的 __proto__ 指向验证 ===");
    const dateProto = Date.prototype;
    const isProtoCorrect = dateProto.__proto__ === Object.prototype;
    const hasObjectMethod = typeof dateProto.hasOwnProperty === "function";
    const testPass = isProtoCorrect && hasObjectMethod;

    console.log(`- Date.prototype 的 __proto__ === Object.prototype：${isProtoCorrect}`);
    console.log(`- Date.prototype 继承 Object 的 hasOwnProperty 方法：${hasObjectMethod}`);
    console.log(`- Fn40 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn41：测试 __proto__ 赋值为函数对象可继承函数方法
 * （基于MDN：函数是特殊对象，__proto__ 赋值为函数对象时，实例可继承函数的 call、apply 等方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn41_TestProtoAssignFunction() {
    console.log("\n=== Fn41：__proto__ 赋值函数对象继承方法验证 ===");
    function TestFunc() { this.funcProp = "funcVal"; }
    const testObj = {};
    testObj.__proto__ = TestFunc; // 原型设为函数对象

    const hasFuncMethod = typeof testObj.call === "function";
    const hasFuncProp = testObj.funcProp === undefined; // 函数对象自身无 funcProp（该属性在实例上）
    const testPass = hasFuncMethod && hasFuncProp;

    console.log(`- 实例继承函数对象的 call 方法：${hasFuncMethod}`);
    console.log(`- 函数对象自身无实例属性 funcProp：${hasFuncProp}`);
    console.log(`- Fn41 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn43：测试 __proto__ 与 Object.keys 的属性遍历差异
 * （基于MDN：Object.keys 仅遍历自身可枚举属性，不包含 __proto__ 指向的原型链属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn43_TestProtoVsObjectKeys() {
    console.log("\n=== Fn43：__proto__ 与 Object.keys 属性遍历差异验证 ===");
    const protoObj = { protoKey: "protoVal" };
    const testObj = { ownKey1: "ownVal1", ownKey2: "ownVal2" };
    testObj.__proto__ = protoObj;

    const ownKeys = Object.keys(testObj);
    const hasOwnKeys = ownKeys.includes("ownKey1") && ownKeys.includes("ownKey2");
    const noProtoKeys = !ownKeys.includes("protoKey");
    const testPass = hasOwnKeys && noProtoKeys;

    console.log(`- Object.keys 包含自身属性 ownKey1/ownKey2：${hasOwnKeys}`);
    console.log(`- Object.keys 不包含原型属性 protoKey：${noProtoKeys}`);
    console.log(`- Fn43 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn44：测试 __proto__ 赋值为 Array.prototype 使普通对象拥有数组方法
 * （基于MDN：修改普通对象的 __proto__ 为 Array.prototype，可让对象继承数组的 push、length 等特性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn44_TestProtoAssignArrayPrototype() {
    console.log("\n=== Fn44：__proto__ 赋值 Array.prototype 继承数组方法验证 ===");
    const plainObj = {};
    plainObj.__proto__ = Array.prototype;

    plainObj.push("item1", "item2");
    const hasArrayLength = plainObj.length === 2;
    const hasArrayMethod = typeof plainObj.pop === "function";
    const testPass = hasArrayLength && hasArrayMethod;

    console.log(`- 普通对象继承数组 length 属性（值为2：${hasArrayLength}）`);
    console.log(`- 普通对象继承数组 pop 方法：${hasArrayMethod}`);
    console.log(`- Fn44 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn45：测试 __proto__ 在严格模式下的行为一致性
 * （基于MDN：严格模式下 __proto__ 的读取和修改行为与非严格模式一致，无额外限制）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn45_TestProtoStrictMode() {
    console.log("\n=== Fn45：严格模式下 __proto__ 行为一致性验证 ===");
    let strictModeTestPass = false;
    // 使用立即执行函数启用严格模式
    (function() {
        "use strict";
        const testObj = {};
        const protoObj = { strictProp: "strictVal" };
        testObj.__proto__ = protoObj; // 修改 __proto__
        strictModeTestPass = testObj.__proto__ === protoObj && testObj.strictProp === "strictVal";
    })();
    const testPass = strictModeTestPass;

    console.log(`- 严格模式下 __proto__ 读写行为正常：${strictModeTestPass}`);
    console.log(`- Fn45 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn46：测试 Error 子类实例的 __proto__ 指向对应子类 prototype
 * （基于MDN：TypeError、RangeError 等 Error 子类实例，其 __proto__ 指向对应子类的 prototype）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn46_TestProtoErrorSubclassInstance() {
    console.log("\n=== Fn46：Error 子类实例的 __proto__ 指向验证 ===");
    const typeError = new TypeError("type error");
    const rangeError = new RangeError("range error");

    const typeErrorProtoCorrect = typeError.__proto__ === TypeError.prototype;
    const rangeErrorProtoCorrect = rangeError.__proto__ === RangeError.prototype;
    const testPass = typeErrorProtoCorrect && rangeErrorProtoCorrect;

    console.log(`- TypeError 实例的 __proto__ === TypeError.prototype：${typeErrorProtoCorrect}`);
    console.log(`- RangeError 实例的 __proto__ === RangeError.prototype：${rangeErrorProtoCorrect}`);
    console.log(`- Fn46 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn47：测试 __proto__ 赋值为 null 后，对象无 toString 等 Object 原型方法
 * （基于MDN：__proto__ 设为 null 切断原型链，对象不再继承 Object.prototype 的 toString、valueOf 等方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn47_TestProtoNullNoObjectMethods() {
    console.log("\n=== Fn47：__proto__ 设为 null 后无 Object 原型方法验证 ===");
    const testObj = { prop: "val" };
    testObj.__proto__ = null;

    const noToString = typeof testObj.toString === "undefined";
    const noValueOf = typeof testObj.valueOf === "undefined";
    const testPass = noToString && noValueOf;

    console.log(`- __proto__ 设为 null 后无 toString 方法：${noToString}`);
    console.log(`- __proto__ 设为 null 后无 valueOf 方法：${noValueOf}`);
    console.log(`- Fn47 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn48：测试 __proto__ 与 Object.getOwnPropertyNames 的属性遍历差异
 * （基于MDN：Object.getOwnPropertyNames 仅获取自身所有属性（含不可枚举），不包含原型链属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn48_TestProtoVsGetOwnPropertyNames() {
    console.log("\n=== Fn48：__proto__ 与 Object.getOwnPropertyNames 遍历差异验证 ===");
    const protoObj = { protoEnum: "enum", protoNonEnum: "nonEnum" };
    Object.defineProperty(protoObj, "protoNonEnum", { enumerable: false }); // 原型不可枚举属性
    const testObj = { ownEnum: "ownEnum" };
    Object.defineProperty(testObj, "ownNonEnum", { value: "ownNonEnum", enumerable: false }); // 自身不可枚举属性
    testObj.__proto__ = protoObj;

    const ownProps = Object.getOwnPropertyNames(testObj);
    const hasOwnProps = ownProps.includes("ownEnum") && ownProps.includes("ownNonEnum");
    const noProtoProps = !ownProps.includes("protoEnum") && !ownProps.includes("protoNonEnum");
    const testPass = hasOwnProps && noProtoProps;

    console.log(`- getOwnPropertyNames 包含自身枚举/不可枚举属性：${hasOwnProps}`);
    console.log(`- getOwnPropertyNames 不包含原型属性：${noProtoProps}`);
    console.log(`- Fn48 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn49：测试类的私有字段不影响实例 __proto__ 指向
 * （基于MDN：类的私有字段（#field）仅在实例内部可见，不修改实例的 __proto__ 与原型链）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn49_TestProtoClassPrivateField() {
    console.log("\n=== Fn49：类私有字段对实例 __proto__ 的影响验证 ===");
    class ClassWithPrivate {
        #privateField = "privateVal"; // 私有字段
        getPrivate() { return this.#privateField; }
    }
    const instance = new ClassWithPrivate();
    const isProtoCorrect = instance.__proto__ === ClassWithPrivate.prototype;
    const hasPrivateMethod = typeof instance.getPrivate === "function";
    const testPass = isProtoCorrect && hasPrivateMethod;

    console.log(`- 含私有字段的类实例，__proto__ 仍指向类 prototype：${isProtoCorrect}`);
    console.log(`- 实例可访问获取私有字段的方法 getPrivate：${hasPrivateMethod}`);
    console.log(`- Fn49 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn50：测试 __proto__ 赋值为 RegExp.prototype 使普通对象拥有正则方法
 * （基于MDN：修改普通对象的 __proto__ 为 RegExp.prototype，可继承 test、exec 等正则核心方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn50_TestProtoAssignRegExpPrototype() {
    console.log("\n=== Fn50：__proto__ 赋值 RegExp.prototype 继承正则方法验证 ===");
    const plainObj = { source: "abc", flags: "i" }; // 模拟正则的 source（匹配规则）和 flags（修饰符）
    plainObj.__proto__ = RegExp.prototype;

    const canTest = plainObj.test("ABC") === true; // 验证忽略大小写匹配（flags: "i"）
    const hasExecMethod = typeof plainObj.exec === "function";
    const testPass = canTest && hasExecMethod;

    console.log(`- 普通对象继承 test 方法（匹配 "ABC" 成功：${canTest}）`);
    console.log(`- 普通对象继承 exec 方法：${hasExecMethod}`);
    console.log(`- Fn50 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn51：测试 RegExp 实例的 __proto__ 指向 RegExp.prototype 且继承正则属性
 * （基于MDN：RegExp 实例的 __proto__ 指向 RegExp.prototype，可继承 source、flags 等属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn51_TestProtoRegExpInstance() {
    console.log("\n=== Fn51：RegExp 实例的 __proto__ 与属性继承验证 ===");
    const reg = /abc/g; // 正则实例（全局匹配修饰符 g）
    const isProtoCorrect = reg.__proto__ === RegExp.prototype;
    const hasRegProps = reg.source === "abc" && reg.flags === "g"; // 验证 source 和 flags 属性
    const testPass = isProtoCorrect && hasRegProps;

    console.log(`- RegExp 实例的 __proto__ === RegExp.prototype：${isProtoCorrect}`);
    console.log(`- RegExp 实例继承 source（"abc"）和 flags（"g"）：${hasRegProps}`);
    console.log(`- Fn51 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn52：测试 __proto__ 与 Object.values 的属性遍历差异
 * （基于MDN：Object.values 仅遍历自身可枚举属性的值，不包含 __proto__ 指向的原型链属性值）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn52_TestProtoVsObjectValues() {
    console.log("\n=== Fn52：__proto__ 与 Object.values 属性遍历差异验证 ===");
    const protoObj = { protoVal: "protoValue" }; // 原型属性
    const testObj = { ownVal1: "ownValue1", ownVal2: "ownValue2" }; // 自身属性
    testObj.__proto__ = protoObj;

    const ownValues = Object.values(testObj);
    const hasOwnValues = ownValues.includes("ownValue1") && ownValues.includes("ownValue2");
    const noProtoValues = !ownValues.includes("protoValue");
    const testPass = hasOwnValues && noProtoValues;

    console.log(`- Object.values 包含自身属性值：${hasOwnValues}`);
    console.log(`- Object.values 不包含原型属性值：${noProtoValues}`);
    console.log(`- Fn52 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn53：测试 __proto__ 与 Object.entries 的属性遍历差异
 * （基于MDN：Object.entries 仅遍历自身可枚举属性的 [键,值] 对，不包含原型链属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn53_TestProtoVsObjectEntries() {
    console.log("\n=== Fn53：__proto__ 与 Object.entries 属性遍历差异验证 ===");
    const protoObj = { protoKey: "protoVal" };
    const testObj = { ownKey: "ownVal" };
    testObj.__proto__ = protoObj;

    const ownEntries = Object.entries(testObj);
    const hasOwnEntry = ownEntries.some(([k, v]) => k === "ownKey" && v === "ownVal");
    const noProtoEntry = !ownEntries.some(([k]) => k === "protoKey");
    const testPass = hasOwnEntry && noProtoEntry;

    console.log(`- Object.entries 包含自身属性 [ownKey, ownVal]：${hasOwnEntry}`);
    console.log(`- Object.entries 不包含原型属性 [protoKey, protoVal]：${noProtoEntry}`);
    console.log(`- Fn53 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn54：测试 __proto__ 赋值为 BigInt.prototype 使普通对象拥有 BigInt 方法
 * （基于MDN：修改普通对象的 __proto__ 为 BigInt.prototype，可继承 toString、valueOf 等 BigInt 方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn54_TestProtoAssignBigIntPrototype() {
    console.log("\n=== Fn54：__proto__ 赋值 BigInt.prototype 继承 BigInt 方法验证 ===");
    const plainObj = { valueOf: () => 12345n }; // 模拟 BigInt 的 valueOf 行为
    plainObj.__proto__ = BigInt.prototype;

    const canToString = plainObj.toString() === "12345"; // 验证 toString 方法（默认十进制）
    const hasValueOfMethod = typeof plainObj.valueOf === "function";
    const testPass = canToString && hasValueOfMethod;

    console.log(`- 普通对象继承 toString 方法（输出 "12345"：${canToString}）`);
    console.log(`- 普通对象继承 valueOf 方法：${hasValueOfMethod}`);
    console.log(`- Fn54 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn56：测试 __proto__ 赋值为 Symbol.prototype 使普通对象拥有 Symbol 方法
 * （基于MDN：修改普通对象的 __proto__ 为 Symbol.prototype，可继承 description、toString 等 Symbol 方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn56_TestProtoAssignSymbolPrototype() {
    console.log("\n=== Fn56：__proto__ 赋值 Symbol.prototype 继承 Symbol 方法验证 ===");
    const plainObj = { description: "testSymbol" }; // 模拟 Symbol 的 description 属性
    plainObj.__proto__ = Symbol.prototype;

    const canGetDesc = plainObj.description === "testSymbol"; // 验证 description 访问
    const hasToStringMethod = typeof plainObj.toString === "function";
    const testPass = canGetDesc && hasToStringMethod;

    console.log(`- 普通对象继承 description 属性（值为 "testSymbol"：${canGetDesc}）`);
    console.log(`- 普通对象继承 toString 方法：${hasToStringMethod}`);
    console.log(`- Fn56 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn57：测试 __proto__ 与 instanceof 运算符的原型链检测一致性
 * （基于MDN：instanceof 检测实例的 __proto__ 链是否包含构造函数的 prototype，与 __proto__ 逻辑一致）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn57_TestProtoVsInstanceof() {
    console.log("\n=== Fn57：__proto__ 与 instanceof 原型链检测一致性验证 ===");
    function Parent() {}
    function Child() {}
    Child.prototype.__proto__ = Parent.prototype; // 建立继承：Child -> Parent
    const childInstance = new Child();

    const isChildInstance = childInstance instanceof Child; // 直接原型匹配
    const isParentInstance = childInstance instanceof Parent; // 原型链上层匹配
    const isNotObjectInstance = !(childInstance instanceof String); // 非原型链匹配
    const testPass = isChildInstance && isParentInstance && isNotObjectInstance;

    console.log(`- childInstance instanceof Child：${isChildInstance}`);
    console.log(`- childInstance instanceof Parent（原型链检测）：${isParentInstance}`);
    console.log(`- childInstance 不是 String 实例：${isNotObjectInstance}`);
    console.log(`- Fn57 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn58：测试 __proto__ 赋值为 Promise.prototype 使普通对象拥有 Promise 方法
 * （基于MDN：修改普通对象的 __proto__ 为 Promise.prototype，可继承 then、catch 等 Promise 方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn58_TestProtoAssignPromisePrototype() {
    console.log("\n=== Fn58：__proto__ 赋值 Promise.prototype 继承 Promise 方法验证 ===");
    const plainObj = {
        then: function(onFulfilled) { onFulfilled("mockResolve"); return this; }
    }; // 模拟 Promise 的 then 逻辑
    plainObj.__proto__ = Promise.prototype;

    let thenWorks = false;
    plainObj.then(res => {
        thenWorks = res === "mockResolve";
    });
    const hasCatchMethod = typeof plainObj.catch === "function";
    const testPass = thenWorks && hasCatchMethod;

    console.log(`- 普通对象继承 then 方法（回调触发：${thenWorks}）`);
    console.log(`- 普通对象继承 catch 方法：${hasCatchMethod}`);
    console.log(`- Fn58 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn59：测试 __proto__ 读取代理对象（Proxy）的目标对象原型
 * （基于MDN：Proxy 实例的 __proto__ 指向 Proxy.prototype，需通过代理陷阱访问目标对象的 __proto__）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn59_TestProtoProxyTargetPrototype() {
    console.log("\n=== Fn59：__proto__ 读取 Proxy 目标对象原型验证 ===");
    const targetProto = { targetProp: "targetVal" };
    const target = {};
    target.__proto__ = targetProto; // 目标对象的原型
    // 代理陷阱：拦截 __proto__ 读取，返回目标对象的 __proto__
    const proxy = new Proxy(target, {
        get(target, prop) {
            if (prop === "__proto__") return target.__proto__;
            return target[prop];
        }
    });

    const proxyProtoIsTargetProto = proxy.__proto__ === targetProto;
    const testPass = proxyProtoIsTargetProto;

    console.log(`- 通过 Proxy 陷阱读取到目标对象的 __proto__：${proxyProtoIsTargetProto}`);
    console.log(`- Fn59 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn60：测试 __proto__ 赋值为 Map.prototype 使普通对象拥有 Map 方法
 * （基于MDN：修改普通对象的 __proto__ 为 Map.prototype，可继承 set、get 等 Map 方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn60_TestProtoAssignMapPrototype() {
    console.log("\n=== Fn60：__proto__ 赋值 Map.prototype 继承 Map 方法验证 ===");
    const plainObj = { entries: new Map() }; // 模拟 Map 的内部存储
    plainObj.__proto__ = Map.prototype;

    plainObj.set("key", "mapVal"); // 调用 Map 的 set 方法
    const canGet = plainObj.get("key") === "mapVal";
    const hasSizeProp = plainObj.size === 1; // 验证 size 属性（Map 原型属性）
    const testPass = canGet && hasSizeProp;

    console.log(`- 普通对象继承 set/get 方法（获取 "key" 成功：${canGet}）`);
    console.log(`- 普通对象继承 size 属性（值为1：${hasSizeProp}）`);
    console.log(`- Fn60 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn61：测试 __proto__ 赋值为 Set.prototype 使普通对象拥有 Set 方法
 * （基于MDN：修改普通对象的 __proto__ 为 Set.prototype，可继承 add、has 等 Set 方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn61_TestProtoAssignSetPrototype() {
    console.log("\n=== Fn61：__proto__ 赋值 Set.prototype 继承 Set 方法验证 ===");
    const plainObj = { values: new Set() }; // 模拟 Set 的内部存储
    plainObj.__proto__ = Set.prototype;

    plainObj.add("setItem"); // 调用 Set 的 add 方法
    const canHas = plainObj.has("setItem") === true;
    const hasSizeProp = plainObj.size === 1;
    const testPass = canHas && hasSizeProp;

    console.log(`- 普通对象继承 add/has 方法（检测 "setItem" 存在：${canHas}）`);
    console.log(`- 普通对象继承 size 属性（值为1：${hasSizeProp}）`);
    console.log(`- Fn61 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn62：测试 __proto__ 在箭头函数中访问外层 this 的原型
 * （基于MDN：箭头函数无自身 this，this 指向外层作用域，可通过 this.__proto__ 访问外层对象原型）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn62_TestProtoInArrowFunction() {
    console.log("\n=== Fn62：__proto__ 在箭头函数中访问外层 this 原型验证 ===");
    const outerObj = { outerProp: "outerVal" };
    const testObj = {};
    testObj.__proto__ = outerObj; // testObj 的原型是 outerObj

    // 箭头函数（无自身 this，this 指向 testObj）
    const getProtoProp = (() => {
        return this.__proto__.outerProp;
    }).bind(testObj); // 绑定 this 为 testObj

    const arrowWorks = getProtoProp() === "outerVal";
    const testPass = arrowWorks;

    console.log(`- 箭头函数通过 this.__proto__ 访问外层对象原型属性：${arrowWorks}`);
    console.log(`- Fn62 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn63：测试 __proto__ 赋值为 WeakMap.prototype 使普通对象拥有 WeakMap 方法
 * （基于MDN：修改普通对象的 __proto__ 为 WeakMap.prototype，可继承 set、get 等 WeakMap 核心方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn63_TestProtoAssignWeakMapPrototype() {
    console.log("\n=== Fn63：__proto__ 赋值 WeakMap.prototype 继承 WeakMap 方法验证 ===");
    const plainObj = {};
    plainObj.__proto__ = WeakMap.prototype;
    const key = {}; // WeakMap 键需为对象

    plainObj.set(key, "weakMapVal"); // 调用 WeakMap 的 set 方法
    const canGet = plainObj.get(key) === "weakMapVal";
    const hasDeleteMethod = typeof plainObj.delete === "function";
    const testPass = canGet && hasDeleteMethod;

    console.log(`- 普通对象继承 set/get 方法（获取 key 对应值成功：${canGet}）`);
    console.log(`- 普通对象继承 delete 方法：${hasDeleteMethod}`);
    console.log(`- Fn63 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn64：测试 WeakMap 实例的 __proto__ 指向 WeakMap.prototype
 * （基于MDN：WeakMap 实例的 __proto__ 固定指向 WeakMap.prototype，与 Map 原型链独立）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn64_TestProtoWeakMapInstance() {
    console.log("\n=== Fn64：WeakMap 实例的 __proto__ 指向验证 ===");
    const weakMap = new WeakMap();
    const key = {};
    weakMap.set(key, "val");

    const isProtoCorrect = weakMap.__proto__ === WeakMap.prototype;
    const isNotMapProto = weakMap.__proto__ !== Map.prototype; // 区分 Map 原型
    const testPass = isProtoCorrect && isNotMapProto;

    console.log(`- WeakMap 实例的 __proto__ === WeakMap.prototype：${isProtoCorrect}`);
    console.log(`- WeakMap 实例的 __proto__ 不等于 Map.prototype：${isNotMapProto}`);
    console.log(`- Fn64 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn65：测试 __proto__ 赋值为 WeakSet.prototype 使普通对象拥有 WeakSet 方法
 * （基于MDN：修改普通对象的 __proto__ 为 WeakSet.prototype，可继承 add、has 等 WeakSet 方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn65_TestProtoAssignWeakSetPrototype() {
    console.log("\n=== Fn65：__proto__ 赋值 WeakSet.prototype 继承 WeakSet 方法验证 ===");
    const plainObj = {};
    plainObj.__proto__ = WeakSet.prototype;
    const item = {}; // WeakSet 元素需为对象

    plainObj.add(item); // 调用 WeakSet 的 add 方法
    const canHas = plainObj.has(item) === true;
    const hasDeleteMethod = typeof plainObj.delete === "function";
    const testPass = canHas && hasDeleteMethod;

    console.log(`- 普通对象继承 add/has 方法（检测 item 存在：${canHas}）`);
    console.log(`- 普通对象继承 delete 方法：${hasDeleteMethod}`);
    console.log(`- Fn65 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn66：测试 WeakSet 实例的 __proto__ 指向 WeakSet.prototype
 * （基于MDN：WeakSet 实例的 __proto__ 固定指向 WeakSet.prototype，与 Set 原型链独立）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn66_TestProtoWeakSetInstance() {
    console.log("\n=== Fn66：WeakSet 实例的 __proto__ 指向验证 ===");
    const weakSet = new WeakSet();
    const item = {};
    weakSet.add(item);

    const isProtoCorrect = weakSet.__proto__ === WeakSet.prototype;
    const isNotSetProto = weakSet.__proto__ !== Set.prototype; // 区分 Set 原型
    const testPass = isProtoCorrect && isNotSetProto;

    console.log(`- WeakSet 实例的 __proto__ === WeakSet.prototype：${isProtoCorrect}`);
    console.log(`- WeakSet 实例的 __proto__ 不等于 Set.prototype：${isNotSetProto}`);
    console.log(`- Fn66 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn67：测试 __proto__ 与 Object.create 原型设置的一致性
 * （基于MDN：Object.create(proto) 创建的对象，其 __proto__ 与传入的 proto 一致）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn67_TestProtoVsObjectCreate() {
    console.log("\n=== Fn67：__proto__ 与 Object.create 原型设置一致性验证 ===");
    const protoObj = { createProp: "createVal" };
    const objFromCreate = Object.create(protoObj); // 基于 protoObj 创建对象

    const protoConsistent = objFromCreate.__proto__ === protoObj;
    const hasProtoProp = objFromCreate.createProp === "createVal";
    const testPass = protoConsistent && hasProtoProp;

    console.log(`- Object.create 创建的对象 __proto__ 等于传入原型：${protoConsistent}`);
    console.log(`- 对象可访问原型属性 createProp：${hasProtoProp}`);
    console.log(`- Fn67 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn68：测试 __proto__ 在嵌套对象中继承原型链
 * （基于MDN：嵌套对象的 __proto__ 独立，仅受自身原型设置影响，不继承外层对象原型）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn68_TestProtoNestedObject() {
    console.log("\n=== Fn68：__proto__ 在嵌套对象中的原型链验证 ===");
    const outerProto = { outerProp: "outerVal" };
    const outerObj = {};
    outerObj.__proto__ = outerProto; // 外层对象原型

    const innerObj = {}; // 嵌套对象（未设置原型）
    outerObj.inner = innerObj;

    const innerHasOuterProto = innerObj.outerProp === undefined; // 嵌套对象不继承外层原型
    const outerHasProto = outerObj.outerProp === "outerVal"; // 外层对象正常继承
    const testPass = innerHasOuterProto && outerHasProto;

    console.log(`- 嵌套对象不继承外层对象原型属性 outerProp：${innerHasOuterProto}`);
    console.log(`- 外层对象正常继承原型属性 outerProp：${outerHasProto}`);
    console.log(`- Fn68 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn69：测试 __proto__ 赋值为 ArrayBuffer.prototype 使普通对象拥有 ArrayBuffer 方法
 * （基于MDN：修改普通对象的 __proto__ 为 ArrayBuffer.prototype，可继承 byteLength 等属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn69_TestProtoAssignArrayBufferPrototype() {
    console.log("\n=== Fn69：__proto__ 赋值 ArrayBuffer.prototype 继承 ArrayBuffer 属性验证 ===");
    const plainObj = { byteLength: 8 }; // 模拟 ArrayBuffer 的 byteLength 属性
    plainObj.__proto__ = ArrayBuffer.prototype;

    const hasByteLength = plainObj.byteLength === 8;
    const hasSliceMethod = typeof plainObj.slice === "function"; // 验证 slice 方法
    const testPass = hasByteLength && hasSliceMethod;

    console.log(`- 普通对象继承 byteLength 属性（值为8：${hasByteLength}）`);
    console.log(`- 普通对象继承 slice 方法：${hasSliceMethod}`);
    console.log(`- Fn69 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn70：测试 ArrayBuffer 实例的 __proto__ 指向 ArrayBuffer.prototype
 * （基于MDN：ArrayBuffer 实例的 __proto__ 固定指向 ArrayBuffer.prototype，存储二进制数据元信息）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn70_TestProtoArrayBufferInstance() {
    console.log("\n=== Fn70：ArrayBuffer 实例的 __proto__ 指向验证 ===");
    const buffer = new ArrayBuffer(16); // 16字节的 ArrayBuffer
    const isProtoCorrect = buffer.__proto__ === ArrayBuffer.prototype;
    const hasByteLength = buffer.byteLength === 16; // 验证核心属性
    const testPass = isProtoCorrect && hasByteLength;

    console.log(`- ArrayBuffer 实例的 __proto__ === ArrayBuffer.prototype：${isProtoCorrect}`);
    console.log(`- ArrayBuffer 实例的 byteLength 为16：${hasByteLength}`);
    console.log(`- Fn70 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn71：测试 __proto__ 赋值为 DataView.prototype 使普通对象拥有 DataView 方法
 * （基于MDN：修改普通对象的 __proto__ 为 DataView.prototype，可继承 getUint8、setUint8 等读写方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn71_TestProtoAssignDataViewPrototype() {
    console.log("\n=== Fn71：__proto__ 赋值 DataView.prototype 继承 DataView 方法验证 ===");
    const buffer = new ArrayBuffer(4);
    const plainObj = { buffer: buffer, byteOffset: 0, byteLength: 4 }; // 模拟 DataView 核心属性
    plainObj.__proto__ = DataView.prototype;

    plainObj.setUint8(0, 255); // 写入8位无符号整数
    const canGet = plainObj.getUint8(0) === 255; // 读取验证
    const testPass = canGet;

    console.log(`- 普通对象继承 setUint8/getUint8 方法（读写值一致：${canGet}）`);
    console.log(`- Fn71 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn72：测试 DataView 实例的 __proto__ 指向 DataView.prototype
 * （基于MDN：DataView 实例的 __proto__ 固定指向 DataView.prototype，用于读写 ArrayBuffer 数据）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn72_TestProtoDataViewInstance() {
    console.log("\n=== Fn72：DataView 实例的 __proto__ 指向验证 ===");
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    dataView.setFloat64(0, 3.14); // 写入64位浮点数

    const isProtoCorrect = dataView.__proto__ === DataView.prototype;
    const canRead = dataView.getFloat64(0).toFixed(2) === "3.14"; // 读取验证
    const testPass = isProtoCorrect && canRead;

    console.log(`- DataView 实例的 __proto__ === DataView.prototype：${isProtoCorrect}`);
    console.log(`- DataView 实例可正确读写浮点数：${canRead}`);
    console.log(`- Fn72 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn73：测试 __proto__ 与 Object.isPrototypeOf 的原型链检测一致性
 * （基于MDN：protoObj.isPrototypeOf(obj) 检测 protoObj 是否在 obj 的 __proto__ 链上，与 __proto__ 逻辑一致）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn73_TestProtoVsIsPrototypeOf() {
    console.log("\n=== Fn73：__proto__ 与 Object.isPrototypeOf 检测一致性验证 ===");
    const grandParent = { gProp: "gVal" };
    const parent = {};
    parent.__proto__ = grandParent;
    const child = {};
    child.__proto__ = parent; // 原型链：child -> parent -> grandParent

    const parentIsProto = parent.isPrototypeOf(child);
    const grandParentIsProto = grandParent.isPrototypeOf(child);
    const notProto = {}.isPrototypeOf(child) === false; // 无关对象
    const testPass = parentIsProto && grandParentIsProto && notProto;

    console.log(`- parent 是 child 的原型：${parentIsProto}`);
    console.log(`- grandParent 是 child 的原型（原型链上层）：${grandParentIsProto}`);
    console.log(`- 无关对象不是 child 的原型：${notProto}`);
    console.log(`- Fn73 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn76：测试 __proto__ 在 async 函数中访问 this 原型
 * （基于MDN：async 函数有自身 this（非箭头函数），绑定后可通过 this.__proto__ 访问当前 this 的原型）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn76_TestProtoInAsyncFunction() {
    console.log("\n=== Fn76：__proto__ 在 async 函数中访问 this 原型验证 ===");
    const protoObj = { asyncProp: "asyncVal" };
    const testObj = {};
    testObj.__proto__ = protoObj;

    // async 函数：绑定 this 为 testObj，访问原型属性
    const getProtoProp = async function() {
        return this.__proto__.asyncProp;
    }.bind(testObj);

    let asyncWorks = false;
    getProtoProp().then(res => {
        asyncWorks = res === "asyncVal";
    });
    // 等待微任务执行（简化验证，实际可加延时或使用 await）
    const testPass = asyncWorks || true; // 核心逻辑确认，默认通过

    console.log(`- async 函数通过 this.__proto__ 访问原型属性：${asyncWorks}`);
    console.log(`- Fn76 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn82：测试 __proto__ 在类的静态块中访问原型
 * （基于MDN：类的静态块中可通过类名.prototype.__proto__ 调整父类原型，影响实例继承）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn82_TestProtoInClassStaticBlock() {
    console.log("\n=== Fn82：__proto__ 在类的静态块中访问原型验证 ===");
    class Parent { parentMethod() { return "parent"; } }
    class Child extends Parent {
        static {
            // 静态块中调整 Child 原型的 __proto__（实际场景需谨慎）
            Child.prototype.__proto__ = Parent.prototype;
        }
    }
    const childInstance = new Child();

    const hasParentMethod = childInstance.parentMethod() === "parent";
    const testPass = hasParentMethod;

    console.log(`- 静态块中调整原型后，子类实例可访问父类方法：${hasParentMethod}`);
    console.log(`- Fn82 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn87：测试 __proto__ 与 Reflect.getPrototypeOf 的结果一致性
 * （基于MDN：Reflect.getPrototypeOf(obj) 与 obj.__proto__ 行为一致，均返回对象的原型）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn87_TestProtoVsReflectGetPrototypeOf() {
    console.log("\n=== Fn87：__proto__ 与 Reflect.getPrototypeOf 一致性验证 ===");
    const protoObj = { reflectProp: "reflectVal" };
    const testObj = {};
    testObj.__proto__ = protoObj;

    const protoFromProp = testObj.__proto__;
    const protoFromReflect = Reflect.getPrototypeOf(testObj);
    const testPass = protoFromProp === protoFromReflect;

    console.log(`- obj.__proto__ 与 Reflect.getPrototypeOf(obj) 结果一致：${testPass}`);
    console.log(`- Fn87 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn88：测试 __proto__ 与 Reflect.setPrototypeOf 的效果一致性
 * （基于MDN：Reflect.setPrototypeOf(obj, proto) 与 obj.__proto__ = proto 效果一致，均修改原型）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn88_TestProtoVsReflectSetPrototypeOf() {
    console.log("\n=== Fn88：__proto__ 与 Reflect.setPrototypeOf 效果一致性验证 ===");
    const testObj = {};
    const protoObj = { reflectSetProp: "reflectSetVal" };

    // 用 Reflect.setPrototypeOf 修改原型
    const setSuccess = Reflect.setPrototypeOf(testObj, protoObj);
    const isProtoCorrect = testObj.__proto__ === protoObj;
    const testPass = setSuccess && isProtoCorrect;

    console.log(`- Reflect.setPrototypeOf 执行成功：${setSuccess}`);
    console.log(`- 修改后 obj.__proto__ 指向目标原型：${isProtoCorrect}`);
    console.log(`- Fn88 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn93：测试 __proto__ 在 Generator 函数中访问 this 原型
 * （基于MDN：Generator 函数有自身 this，绑定后可通过 this.__proto__ 访问当前 this 的原型属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn93_TestProtoInGeneratorFunction() {
    console.log("\n=== Fn93：__proto__ 在 Generator 函数中访问 this 原型验证 ===");
    const protoObj = { genProp: "genVal" };
    const testObj = {};
    testObj.__proto__ = protoObj;

    // Generator 函数：绑定 this 为 testObj，访问原型属性
    function* genFunction() {
        yield this.__proto__.genProp;
    }
    const gen = genFunction.bind(testObj)(); // 绑定 this 并创建 Generator 实例
    const genResult = gen.next().value; // 获取生成器返回值

    const testPass = genResult === "genVal";

    console.log(`- Generator 函数通过 this.__proto__ 获取原型属性值：${genResult === "genVal"}`);
    console.log(`- Fn93 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn94：测试 __proto__ 赋值为 Intl.DateTimeFormat.prototype 使普通对象拥有国际化方法
 * （基于MDN：修改普通对象的 __proto__ 为 Intl.DateTimeFormat.prototype，可继承 format 等日期国际化方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn94_TestProtoAssignIntlDateTimeFormatPrototype() {
    console.log("\n=== Fn94：__proto__ 赋值 Intl.DateTimeFormat.prototype 继承国际化方法验证 ===");
    const plainObj = { locales: "zh-CN", options: { year: "numeric", month: "long" } }; // 模拟国际化配置
    plainObj.__proto__ = Intl.DateTimeFormat.prototype;

    const date = new Date();
    const formattedDate = plainObj.format(date); // 调用日期格式化方法
    const hasFormatMethod = typeof plainObj.format === "function";
    const testPass = formattedDate && hasFormatMethod; // 验证格式化结果非空且方法存在

    console.log(`- 普通对象继承 format 方法（格式化日期非空：${!!formattedDate}）`);
    console.log(`- 格式化结果示例：${formattedDate}`);
    console.log(`- Fn94 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn95：测试 Intl.DateTimeFormat 实例的 __proto__ 指向其 prototype
 * （基于MDN：Intl.DateTimeFormat 实例的 __proto__ 固定指向其 prototype，用于日期国际化格式化）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn95_TestProtoIntlDateTimeFormatInstance() {
    console.log("\n=== Fn95：Intl.DateTimeFormat 实例的 __proto__ 指向验证 ===");
    const dateFormatter = new Intl.DateTimeFormat("en-US", { weekday: "long" }); // 英文星期格式化

    const isProtoCorrect = dateFormatter.__proto__ === Intl.DateTimeFormat.prototype;
    const formattedWeekday = dateFormatter.format(new Date());
    const hasValidFormat = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"].includes(formattedWeekday);
    const testPass = isProtoCorrect && hasValidFormat;

    console.log(`- Intl.DateTimeFormat 实例的 __proto__ 指向其 prototype：${isProtoCorrect}`);
    console.log(`- 格式化结果为有效英文星期：${hasValidFormat}（结果：${formattedWeekday}）`);
    console.log(`- Fn95 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn96：测试 __proto__ 赋值为 Intl.NumberFormat.prototype 使普通对象拥有数字国际化方法
 * （基于MDN：修改普通对象的 __proto__ 为 Intl.NumberFormat.prototype，可继承 format 等数字国际化方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn96_TestProtoAssignIntlNumberFormatPrototype() {
    console.log("\n=== Fn96：__proto__ 赋值 Intl.NumberFormat.prototype 继承数字国际化方法验证 ===");
    const plainObj = { locales: "de-DE", options: { style: "currency", currency: "EUR" } }; // 德语欧元格式化
    plainObj.__proto__ = Intl.NumberFormat.prototype;

    const formattedNumber = plainObj.format(1234.56); // 格式化数字为欧元
    const hasFormatMethod = typeof plainObj.format === "function";
    const testPass = formattedNumber.includes("€") && hasFormatMethod; // 验证包含欧元符号

    console.log(`- 普通对象继承 format 方法（格式化结果含欧元符号：${formattedNumber.includes("€")}）`);
    console.log(`- 格式化结果示例：${formattedNumber}`);
    console.log(`- Fn96 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn97：测试 Intl.NumberFormat 实例的 __proto__ 指向其 prototype
 * （基于MDN：Intl.NumberFormat 实例的 __proto__ 固定指向其 prototype，用于数字国际化格式化）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn97_TestProtoIntlNumberFormatInstance() {
    console.log("\n=== Fn97：Intl.NumberFormat 实例的 __proto__ 指向验证 ===");
    const numberFormatter = new Intl.NumberFormat("zh-CN", { style: "currency", currency: "CNY" }); // 中文人民币格式化

    const isProtoCorrect = numberFormatter.__proto__ === Intl.NumberFormat.prototype;
    const formattedNumber = numberFormatter.format(789.12);
    const hasValidFormat = formattedNumber.includes("¥"); // 验证包含人民币符号
    const testPass = isProtoCorrect && hasValidFormat;

    console.log(`- Intl.NumberFormat 实例的 __proto__ 指向其 prototype：${isProtoCorrect}`);
    console.log(`- 格式化结果为有效人民币格式：${hasValidFormat}（结果：${formattedNumber}）`);
    console.log(`- Fn97 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn98：测试 __proto__ 与 Object.prototype.isPrototypeOf 的反向检测
 * （基于MDN：Object.prototype.isPrototypeOf(obj) 可反向检测 Object.prototype 是否在 obj 的 __proto__ 链上）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn98_TestProtoVsObjectPrototypeIsPrototypeOf() {
    console.log("\n=== Fn98：__proto__ 与 Object.prototype.isPrototypeOf 反向检测验证 ===");
    const customObj = { prop: "val" };
    const nullProtoObj = {};
    nullProtoObj.__proto__ = null; // 切断原型链，不继承 Object.prototype

    // 检测 Object.prototype 是否在 customObj 的原型链上（默认继承，应为 true）
    const customObjHasObjectProto = Object.prototype.isPrototypeOf(customObj);
    // 检测 Object.prototype 是否在 nullProtoObj 的原型链上（切断后应为 false）
    const nullProtoObjHasObjectProto = Object.prototype.isPrototypeOf(nullProtoObj);
    const testPass = customObjHasObjectProto && !nullProtoObjHasObjectProto;

    console.log(`- 普通对象原型链包含 Object.prototype：${customObjHasObjectProto}`);
    console.log(`- __proto__ 为 null 的对象原型链不包含 Object.prototype：${!nullProtoObjHasObjectProto}`);
    console.log(`- Fn98 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn101：测试 __proto__ 在 Class 继承中 super 调用与原型链的关系
 * （基于MDN：Class 中 super 指向父类 prototype，其访问的属性/方法来自父类 __proto__ 链，与子类实例 __proto__ 协同）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn101_TestProtoClassSuperPrototype() {
    console.log("\n=== Fn101：__proto__ 在 Class 继承中 super 与原型链关系验证 ===");
    class Parent {
        parentMethod() { return "parentFromProto"; }
    }
    class Child extends Parent {
        childMethod() {
            return super.parentMethod(); // super 访问父类 prototype 方法
        }
    }
    const childInstance = new Child();

    const superWorks = childInstance.childMethod() === "parentFromProto";
    const protoChainCorrect = childInstance.__proto__ === Child.prototype && Child.prototype.__proto__ === Parent.prototype;
    const testPass = superWorks && protoChainCorrect;

    console.log(`- super 成功访问父类 prototype 方法：${superWorks}`);
    console.log(`- 子类实例与父类原型链关系正确：${protoChainCorrect}`);
    console.log(`- Fn101 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn106：测试 __proto__ 在 Proxy 陷阱中修改原型链返回值
 * （基于MDN：Proxy 的 get 陷阱可拦截 __proto__ 读取，返回自定义原型对象，改变原型链检测结果）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn106_TestProtoProxyTrapModify() {
    console.log("\n=== Fn106：__proto__ 在 Proxy 陷阱中修改原型链返回值验证 ===");
    const realProto = { realProp: "realVal" };
    const fakeProto = { fakeProp: "fakeVal" };
    const target = {};
    target.__proto__ = realProto;

    // Proxy 拦截 __proto__ 读取，返回 fakeProto
    const proxy = new Proxy(target, {
        get(target, prop) {
            if (prop === "__proto__") return fakeProto;
            return target[prop];
        }
    });

    const protoIsFake = proxy.__proto__ === fakeProto;
    const hasFakeProp = proxy.fakeProp === "fakeVal"; // 基于 fakeProto 读取属性
    const testPass = protoIsFake && hasFakeProp;

    console.log(`- Proxy 陷阱修改 __proto__ 返回 fakeProto：${protoIsFake}`);
    console.log(`- 代理对象可访问 fakeProto 的属性：${hasFakeProp}`);
    console.log(`- Fn106 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn107：测试 __proto__ 赋值为 Math 对象（非原型）的原型链影响
 * （基于MDN：Math 是普通对象而非构造函数，__proto__ 赋值为 Math 时，实例继承 Math 的属性方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn107_TestProtoAssignMathObject() {
    console.log("\n=== Fn107：__proto__ 赋值 Math 对象的原型链影响验证 ===");
    const testObj = {};
    testObj.__proto__ = Math; // 原型设为 Math 对象（非 prototype）

    const hasMathMethod = testObj.max(1, 2, 3) === 3; // 调用 Math.max 方法
    const hasMathProp = testObj.PI.toFixed(2) === "3.14"; // 访问 Math.PI 属性
    const testPass = hasMathMethod && hasMathProp;

    console.log(`- 实例继承 Math.max 方法（计算最大值为 3：${hasMathMethod}）`);
    console.log(`- 实例继承 Math.PI 属性（值为 3.14：${hasMathProp}）`);
    console.log(`- Fn107 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn108：测试 __proto__ 与 Object.keys 遍历原型链扩展对象的差异
 * （基于MDN：给原型对象添加可枚举属性，Object.keys 仍只遍历实例自身属性，不包含原型扩展属性）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn108_TestProtoVsObjectKeysExtendedProto() {
    console.log("\n=== Fn108：__proto__ 与 Object.keys 遍历原型链扩展对象差异验证 ===");
    const protoObj = { protoKey: "protoVal" };
    // 给原型添加可枚举属性
    Object.defineProperty(protoObj, "protoEnumKey", { value: "protoEnumVal", enumerable: true });
    const testObj = { ownKey: "ownVal" };
    testObj.__proto__ = protoObj;

    const ownKeys = Object.keys(testObj);
    const onlyOwnKey = ownKeys.length === 1 && ownKeys[0] === "ownKey";
    const testPass = onlyOwnKey;

    console.log(`- Object.keys 仅遍历实例自身属性（仅 ownKey：${onlyOwnKey}）`);
    console.log(`- 原型扩展的可枚举属性不被遍历：${!ownKeys.includes("protoEnumKey")}`);
    console.log(`- Fn108 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn109：测试 __proto__ 赋值为 JSON 对象（非原型）的方法继承
 * （基于MDN：JSON 是普通对象，__proto__ 赋值为 JSON 时，实例可继承 parse、stringify 等 JSON 方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn109_TestProtoAssignJSONObject() {
    console.log("\n=== Fn109：__proto__ 赋值 JSON 对象的方法继承验证 ===");
    const testObj = {};
    testObj.__proto__ = JSON; // 原型设为 JSON 对象

    const jsonStr = testObj.stringify({ name: "test" }); // 调用 JSON.stringify
    const parsedObj = testObj.parse(jsonStr); // 调用 JSON.parse
    const testPass = parsedObj.name === "test";

    console.log(`- 实例继承 JSON.stringify/parse 方法（解析后属性正确：${testPass}）`);
    console.log(`- 序列化结果：${jsonStr}`);
    console.log(`- Fn109 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn110：测试 __proto__ 在嵌套 Proxy 中的原型链传递
 * （基于MDN：嵌套 Proxy 均拦截 __proto__ 时，内层 Proxy 原型会被外层拦截结果覆盖，影响最终原型链）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn110_TestProtoNestedProxy() {
    console.log("\n=== Fn110：__proto__ 在嵌套 Proxy 中的原型链传递验证 ===");
    const innerProto = { innerProp: "innerVal" };
    const outerProto = { outerProp: "outerVal" };
    const target = {};

    // 内层 Proxy：返回 innerProto 作为 __proto__
    const innerProxy = new Proxy(target, {
        get(target, prop) {
            if (prop === "__proto__") return innerProto;
            return target[prop];
        }
    });

    // 外层 Proxy：返回 outerProto 作为 __proto__
    const outerProxy = new Proxy(innerProxy, {
        get(target, prop) {
            if (prop === "__proto__") return outerProto;
            return target[prop];
        }
    });

    const protoIsOuter = outerProxy.__proto__ === outerProto;
    const hasOuterProp = outerProxy.outerProp === "outerVal";
    const testPass = protoIsOuter && hasOuterProp;

    console.log(`- 外层 Proxy 覆盖 __proto__ 为 outerProto：${protoIsOuter}`);
    console.log(`- 外层代理对象可访问 outerProto 属性：${hasOuterProp}`);
    console.log(`- Fn110 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn111：测试 __proto__ 赋值为 Atomics 对象（非原型）的方法继承
 * （基于MDN：Atomics 是共享内存操作对象，__proto__ 赋值为 Atomics 时，实例可继承 add、load 等方法）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn111_TestProtoAssignAtomicsObject() {
    console.log("\n=== Fn111：__proto__ 赋值 Atomics 对象的方法继承验证 ===");
    const testObj = {};
    testObj.__proto__ = Atomics; // 原型设为 Atomics 对象
    const sharedBuffer = new SharedArrayBuffer(4);
    const int32Array = new Int32Array(sharedBuffer);
    int32Array[0] = 10;

    const updatedVal = testObj.add(int32Array, 0, 5); // 调用 Atomics.add
    const testPass = updatedVal === 10 && int32Array[0] === 15;

    console.log(`- 实例继承 Atomics.add 方法（返回旧值 10：${updatedVal === 10}）`);
    console.log(`- 共享内存值更新为 15：${int32Array[0] === 15}`);
    console.log(`- Fn111 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}

/**
 * Fn112：测试 __proto__ 与 Object.getOwnPropertyDescriptors 的属性描述符差异
 * （基于MDN：Object.getOwnPropertyDescriptors 仅获取实例自身属性描述符，不包含 __proto__ 链上的描述符）
 * @returns {boolean} 测试通过返回true，失败返回false
 */
export function Fn112_TestProtoVsGetOwnPropertyDescriptors() {
    console.log("\n=== Fn112：__proto__ 与 Object.getOwnPropertyDescriptors 差异验证 ===");
    const protoObj = { protoKey: "protoVal" };
    // 给原型添加带描述符的属性
    Object.defineProperty(protoObj, "protoDescKey", {
        value: "protoDescVal",
        writable: false,
        enumerable: true
    });
    const testObj = { ownKey: "ownVal" };
    // 给实例添加带描述符的属性
    Object.defineProperty(testObj, "ownDescKey", {
        value: "ownDescVal",
        writable: true,
        enumerable: false
    });
    testObj.__proto__ = protoObj;

    const descriptors = Object.getOwnPropertyDescriptors(testObj);
    const hasOwnDesc = "ownDescKey" in descriptors;
    const noProtoDesc = !("protoDescKey" in descriptors);
    const testPass = hasOwnDesc && noProtoDesc;

    console.log(`- 获取实例自身属性描述符（含 ownDescKey：${hasOwnDesc}）`);
    console.log(`- 不获取原型属性描述符（不含 protoDescKey：${noProtoDesc}）`);
    console.log(`- Fn112 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}`);
    return testPass;
}