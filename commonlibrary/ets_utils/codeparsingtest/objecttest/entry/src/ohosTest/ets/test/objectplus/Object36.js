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
 * Fn01：测试对象/数组字面量的 constructor 指向对应构造函数（Object/Array）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn01_TestLiteralConstructor() {
    console.log("=== Fn01：测试字面量对象的 constructor 指向 ===");
    const plainObj = {};
    const arrObj = [];
    const isPlainObjCorrect = plainObj.constructor === Object;
    const isArrObjCorrect = arrObj.constructor === Array;
    const testPass = isPlainObjCorrect && isArrObjCorrect;
    console.log(`- {} 的 constructor === Object：${isPlainObjCorrect}`);
    console.log(`- [] 的 constructor === Array：${isArrObjCorrect}`);
    console.log(`- Fn01 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn02：测试自定义构造函数创建的实例，constructor 指向该构造函数
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn02_TestCustomConstructor() {
    console.log("=== Fn02：测试自定义构造函数实例的 constructor 指向 ===");

    function Car(brand) {
        this.brand = brand;
    }

    const myCar = new Car("Tesla");
    const testPass = myCar.constructor === Car;
    console.log(`- new Car('Tesla') 的 constructor === Car：${testPass}`);
    console.log(`- Fn02 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn03：测试直接修改实例的 constructor，原型上的 constructor 保持不变
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn03_TestInstancePrototypeIsolation() {
    console.log("=== Fn03：测试实例与原型 constructor 的独立性 ===");

    function Book(title) {
        this.title = title;
    }

    const myBook = new Book("JavaScript 高级程序设计");
    myBook.constructor = function FakeBook() {
    };
    const protoConstructor = Object.getPrototypeOf(myBook).constructor;
    const testPass = protoConstructor === Book;
    console.log(`- 实例自定义 constructor 后，原型 constructor === Book：${testPass}`);
    console.log(`- Fn03 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn04：测试重写子构造函数 prototype 后，子实例 constructor 指向父构造函数
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn04_TestPrototypeOverride() {
    console.log("=== Fn04：测试重写原型后 constructor 的指向 ===");

    function Animal() {
    }

    function Dog() {
    }

    Dog.prototype = new Animal();
    const myDog = new Dog();
    const testPass = myDog.constructor === Animal;
    console.log(`- Dog.prototype 重写后，new Dog() 的 constructor === Animal：${testPass}`);
    console.log(`- Fn04 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn05：测试手动设置子构造函数原型的 constructor，恢复指向子构造函数
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn05_TestFixPrototypeConstructor() {
    console.log("=== Fn05：测试修复原型 constructor 后的指向 ===");

    function Animal() {
    }

    function Dog() {
    }

    Dog.prototype = new Animal();
    const myDog = new Dog();
    Object.defineProperty(Dog.prototype, "constructor", {
        value: Dog,
        enumerable: false,
        writable: true,
        configurable: true
    });
    const testPass = myDog.constructor === Dog;
    console.log(`- 修复后，new Dog() 的 constructor === Dog：${testPass}`);
    console.log(`- Fn05 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn06：测试 null/undefined 无 constructor 属性（访问会报错）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn06_TestNullUndefinedConstructor() {
    console.log("=== Fn06：测试 null/undefined 的 constructor 访问 ===");
    let hasErrorForNull = false;
    let hasErrorForUndefined = false;
    try {
        null.constructor;
    } catch (e) {
        hasErrorForNull = true;
    }
    try {
        undefined.constructor;
    } catch (e) {
        hasErrorForUndefined = true;
    }
    const testPass = hasErrorForNull && hasErrorForUndefined;
    console.log(`- 访问 null.constructor 报错：${hasErrorForNull}`);
    console.log(`- 访问 undefined.constructor 报错：${hasErrorForUndefined}`);
    console.log(`- Fn06 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn07：测试字符串字面量与 String 对象的 constructor 一致性
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn07_TestStringConstructor() {
    console.log("=== Fn07：测试字符串的 constructor 指向 ===");
    const strLiteral = "test";
    const strObj = new String("test");
    const isLiteralCorrect = strLiteral.constructor === String;
    const isObjCorrect = strObj.constructor === String;
    const testPass = isLiteralCorrect && isObjCorrect;
    console.log(`- "test" 字面量的 constructor === String：${isLiteralCorrect}`);
    console.log(`- new String("test") 的 constructor === String：${isObjCorrect}`);
    console.log(`- Fn07 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn08：测试数字字面量与 Number 对象的 constructor 一致性
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn08_TestNumberConstructor() {
    console.log("=== Fn08：测试数字的 constructor 指向 ===");
    const numLiteral = 123;
    const numObj = new Number(123);
    const isLiteralCorrect = numLiteral.constructor === Number;
    const isObjCorrect = numObj.constructor === Number;
    const testPass = isLiteralCorrect && isObjCorrect;
    console.log(`- 123 字面量的 constructor === Number：${isLiteralCorrect}`);
    console.log(`- new Number(123) 的 constructor === Number：${isObjCorrect}`);
    console.log(`- Fn08 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn09：测试布尔值字面量与 Boolean 对象的 constructor 一致性
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn09_TestBooleanConstructor() {
    console.log("=== Fn09：测试布尔值的 constructor 指向 ===");
    const boolLiteral = true;
    const boolObj = new Boolean(true);
    const isLiteralCorrect = boolLiteral.constructor === Boolean;
    const isObjCorrect = boolObj.constructor === Boolean;
    const testPass = isLiteralCorrect && isObjCorrect;
    console.log(`- true 字面量的 constructor === Boolean：${isLiteralCorrect}`);
    console.log(`- new Boolean(true) 的 constructor === Boolean：${isObjCorrect}`);
    console.log(`- Fn09 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn10：测试 Date 对象的 constructor 指向 Date
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn10_TestDateConstructor() {
    console.log("=== Fn10：测试 Date 对象的 constructor 指向 ===");
    const dateObj = new Date();
    const testPass = dateObj.constructor === Date;
    console.log(`- new Date() 的 constructor === Date：${testPass}`);
    console.log(`- Fn10 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn11：测试 RegExp 对象的 constructor 指向 RegExp
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn11_TestRegExpConstructor() {
    console.log("=== Fn11：测试 RegExp 对象的 constructor 指向 ===");
    const regLiteral = /abc/;
    const regObj = new RegExp("abc");
    const isLiteralCorrect = regLiteral.constructor === RegExp;
    const isObjCorrect = regObj.constructor === RegExp;
    const testPass = isLiteralCorrect && isObjCorrect;
    console.log(`- /abc/ 字面量的 constructor === RegExp：${isLiteralCorrect}`);
    console.log(`- new RegExp("abc") 的 constructor === RegExp：${isObjCorrect}`);
    console.log(`- Fn11 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn13：测试箭头函数的 constructor 指向 Function
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn13_TestArrowFunctionConstructor() {
    console.log("=== Fn13：测试箭头函数的 constructor 指向 ===");
    const arrowFunc = () => {
    };
    const testPass = arrowFunc.constructor === Function;
    console.log(`- () => {} 箭头函数的 constructor === Function：${testPass}`);
    console.log(`- Fn13 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn14：测试类实例的 constructor 指向类本身
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn14_TestClassInstanceConstructor() {
    console.log("=== Fn14：测试类实例的 constructor 指向 ===");

    class Person {
        constructor(name) {
            this.name = name;
        }
    }

    const person = new Person("Alice");
    const testPass = person.constructor === Person;
    console.log(`- new Person("Alice") 的 constructor === Person：${testPass}`);
    console.log(`- Fn14 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn15：测试类继承中子类实例的 constructor 指向子类
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn15_TestClassInheritanceConstructor() {
    console.log("=== Fn15：测试类继承的 constructor 指向 ===");

    class Parent {
        constructor() {
        }
    }

    class Child extends Parent {
        constructor() {
            super();
        }
    }

    const child = new Child();
    const testPass = child.constructor === Child;
    console.log(`- 子类 Child 实例的 constructor === Child：${testPass}`);
    console.log(`- Fn15 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn16：测试 Object.create(null) 创建的对象无 constructor 属性
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn16_TestObjectCreateNullConstructor() {
    console.log("=== Fn16：测试 Object.create(null) 的 constructor 存在性 ===");
    const obj = Object.create(null);
    const testPass = obj.constructor === undefined;
    console.log(`- Object.create(null) 创建的对象 constructor === undefined：${testPass}`);
    console.log(`- Fn16 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn17：测试 Object.create 基于原型创建对象的 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn17_TestObjectCreatePrototypeConstructor() {
    console.log("=== Fn17：测试 Object.create(原型) 的 constructor 指向 ===");
    const protoObj = { name: "proto" };
    const newObj = Object.create(protoObj);
    const testPass = newObj.constructor === Object;
    console.log(`- 基于 {name:"proto"} 创建的对象 constructor === Object：${testPass}`);
    console.log(`- Fn17 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn18：测试修改原型对象的 constructor 影响实例
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn18_TestModifyProtoConstructorAffectInstance() {
    console.log("=== Fn18：修改原型 constructor 对实例的影响 ===");

    function Fruit() {
    }
    function FakeFruit() {
    };
    const apple = new Fruit();
    // 修改原型的 constructor
    Fruit.prototype.constructor = FakeFruit;
    const testPass = apple.constructor === FakeFruit;
    console.log(`- 原型 constructor 修改后，实例 constructor === FakeFruit：${testPass}`);
    console.log(`- Fn18 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn19：测试密封对象（Object.seal）的 constructor 可访问性
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn19_TestSealedObjectConstructor() {
    console.log("=== Fn19：测试密封对象的 constructor 访问 ===");
    const obj = { a: 1 };
    Object.seal(obj);
    let canAccessConstructor = true;
    try {
        const constr = obj.constructor;
    } catch (e) {
        canAccessConstructor = false;
    }
    const testPass = canAccessConstructor && obj.constructor === Object;
    console.log(`- 密封对象可访问 constructor：${canAccessConstructor}`);
    console.log(`- 密封对象 constructor === Object：${obj.constructor === Object}`);
    console.log(`- Fn19 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn20：测试冻结对象（Object.freeze）的 constructor 可访问性
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn20_TestFrozenObjectConstructor() {
    console.log("=== Fn20：测试冻结对象的 constructor 访问 ===");
    const obj = { b: 2 };
    Object.freeze(obj);
    let canAccessConstructor = true;
    try {
        const constr = obj.constructor;
    } catch (e) {
        canAccessConstructor = false;
    }
    const testPass = canAccessConstructor && obj.constructor === Object;
    console.log(`- 冻结对象可访问 constructor：${canAccessConstructor}`);
    console.log(`- 冻结对象 constructor === Object：${obj.constructor === Object}`);
    console.log(`- Fn20 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn21：测试数组构造函数创建的数组 constructor 指向 Array
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn21_TestArrayConstructorCreate() {
    console.log("=== Fn21：测试数组构造函数创建数组的 constructor 指向 ===");
    const arr1 = new Array(3);
    const arr2 = new Array(1, 2, 3);
    const isArr1Correct = arr1.constructor === Array;
    const isArr2Correct = arr2.constructor === Array;
    const testPass = isArr1Correct && isArr2Correct;
    console.log(`- new Array(3) 的 constructor === Array：${isArr1Correct}`);
    console.log(`- new Array(1,2,3) 的 constructor === Array：${isArr2Correct}`);
    console.log(`- Fn21 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn22：测试 TypedArray（Uint8Array）的 constructor 指向对应类型
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn22_TestTypedArrayConstructor() {
    console.log("=== Fn22：测试 Uint8Array 的 constructor 指向 ===");
    const uint8Arr = new Uint8Array([1, 2, 3]);
    const testPass = uint8Arr.constructor === Uint8Array;
    console.log(`- new Uint8Array([1,2,3]) 的 constructor === Uint8Array：${testPass}`);
    console.log(`- Fn22 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn23：测试 Map 对象的 constructor 指向 Map
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn23_TestMapConstructor() {
    console.log("=== Fn23：测试 Map 对象的 constructor 指向 ===");
    const map = new Map([["key1", "value1"]]);
    const testPass = map.constructor === Map;
    console.log(`- new Map([["key1","value1"]]) 的 constructor === Map：${testPass}`);
    console.log(`- Fn23 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn24：测试 Set 对象的 constructor 指向 Set
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn24_TestSetConstructor() {
    console.log("=== Fn24：测试 Set 对象的 constructor 指向 ===");
    const set = new Set([1, 2, 3]);
    const testPass = set.constructor === Set;
    console.log(`- new Set([1,2,3]) 的 constructor === Set：${testPass}`);
    console.log(`- Fn24 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn25：测试 WeakMap 对象的 constructor 指向 WeakMap
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn25_TestWeakMapConstructor() {
    console.log("=== Fn25：测试 WeakMap 对象的 constructor 指向 ===");
    const weakMap = new WeakMap([[{ key: "a" }, "value1"]]);
    const testPass = weakMap.constructor === WeakMap;
    console.log(`- new WeakMap([[{key:"a"},"value1"]]) 的 constructor === WeakMap：${testPass}`);
    console.log(`- Fn25 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn26：测试 WeakSet 对象的 constructor 指向 WeakSet
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn26_TestWeakSetConstructor() {
    console.log("=== Fn26：测试 WeakSet 对象的 constructor 指向 ===");
    const weakSet = new WeakSet([{ id: 1 }, { id: 2 }]);
    const testPass = weakSet.constructor === WeakSet;
    console.log(`- new WeakSet([{id:1}, {id:2}]) 的 constructor === WeakSet：${testPass}`);
    console.log(`- Fn26 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn27：测试 Promise 对象的 constructor 指向 Promise
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn27_TestPromiseConstructor() {
    console.log("=== Fn27：测试 Promise 对象的 constructor 指向 ===");
    const promise = new Promise((resolve) => resolve());
    const testPass = promise.constructor === Promise;
    console.log(`- new Promise(resolve => resolve()) 的 constructor === Promise：${testPass}`);
    console.log(`- Fn27 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn28：测试 Generator 函数实例的 constructor 指向 GeneratorFunction
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn28_TestGeneratorConstructor() {
    console.log("=== Fn28：测试 Generator 函数实例的 constructor 指向 ===");

    function* GeneratorFunc() {
        yield 1;
    }

    const generator = GeneratorFunc();
    const testPass = generator.constructor === GeneratorFunc;
    console.log(`- Generator 实例的 constructor === GeneratorFunction：${testPass}`);
    console.log(`- Fn28 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn29：测试 Proxy 对象的 constructor 指向 Proxy
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn29_TestProxyConstructor() {
    console.log("=== Fn29：测试 Proxy 对象的 constructor 指向 ===");
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    const testPass = proxy.constructor === Proxy;
    console.log(`- new Proxy({a:1}, {}) 的 constructor === Proxy：${testPass}`);
    console.log(`- Fn29 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn30：测试 Symbol 的 constructor 指向 Symbol（不可通过 new 创建）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn30_TestSymbolConstructor() {
    console.log("=== Fn30：测试 Symbol 的 constructor 指向 ===");
    const sym = Symbol("test");
    const isConstrCorrect = sym.constructor === Symbol;
    let canNewSymbol = true;
    try {
        new Symbol("test");
    } catch (e) {
        canNewSymbol = false;
    }
    const testPass = isConstrCorrect && !canNewSymbol;
    console.log(`- Symbol("test") 的 constructor === Symbol：${isConstrCorrect}`);
    console.log(`- new Symbol() 会报错（不可通过 new 创建）：${!canNewSymbol}`);
    console.log(`- Fn30 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn31：测试 BigInt 的 constructor 指向 BigInt（区分字面量与函数创建）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn31_TestBigIntConstructor() {
    console.log("=== Fn31：测试 BigInt 的 constructor 指向 ===");
    const bigIntLiteral = 123n;
    const bigIntFunc = BigInt("456");
    const isLiteralCorrect = bigIntLiteral.constructor === BigInt;
    const isFuncCorrect = bigIntFunc.constructor === BigInt;
    const testPass = isLiteralCorrect && isFuncCorrect;
    console.log(`- 123n 字面量的 constructor === BigInt：${isLiteralCorrect}`);
    console.log(`- BigInt("456") 的 constructor === BigInt：${isFuncCorrect}`);
    console.log(`- Fn31 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn32：测试修改实例 constructor 为非函数类型仍可访问
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn32_TestModifyConstructorToNonFunction() {
    console.log("=== Fn32：测试实例 constructor 设为非函数类型 ===");
    const obj = {};
    obj.constructor = "not a function";
    const testPass = obj.constructor === "not a function";
    console.log(`- 将 obj.constructor 设为 "not a function" 后，值为 "not a function"：${testPass}`);
    console.log(`- Fn32 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn33：测试原型链断裂后实例的 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn33_TestBrokenPrototypeChainConstructor() {
    console.log("=== Fn33：测试原型链断裂后的 constructor 指向 ===");
    const obj = {};
    Object.setPrototypeOf(obj, null); // 断裂原型链
    const testPass = obj.constructor === undefined;
    console.log(`- 原型链断裂后，obj.constructor === undefined：${testPass}`);
    console.log(`- Fn33 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn34：测试类的静态方法不影响实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn34_TestClassStaticMethodConstructor() {
    console.log("=== Fn34：测试类静态方法对实例 constructor 的影响 ===");

    class Product {
        constructor(id) {
            this.id = id;
        }

        static getType() {
            return "product";
        }
    }

    const product = new Product(101);
    const testPass = product.constructor === Product;
    console.log(`- 含静态方法的类实例，constructor === 类本身：${testPass}`);
    console.log(`- Fn34 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn35：测试继承 Array 的类实例 constructor 指向子类
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn35_TestInheritArrayClassConstructor() {
    console.log("=== Fn35：测试继承 Array 的类实例 constructor 指向 ===");

    class MyArray extends Array {
        getFirst() {
            return this[0];
        }
    }

    const myArr = new MyArray(1, 2, 3);
    const testPass = myArr.constructor === MyArray;
    console.log(`- 继承 Array 的 MyArray 实例，constructor === MyArray：${testPass}`);
    console.log(`- Fn35 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn36：测试通过 Object.assign 创建的对象 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn36_TestObjectAssignConstructor() {
    console.log("=== Fn36：测试 Object.assign 创建对象的 constructor 指向 ===");
    const source = { name: "test" };
    const assignedObj = Object.assign({}, source);
    const testPass = assignedObj.constructor === Object;
    console.log(`- Object.assign({}, {name:"test"}) 创建的对象，constructor === Object：${testPass}`);
    console.log(`- Fn36 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn37：测试数组扩展运算符创建的数组 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn37_TestArraySpreadConstructor() {
    console.log("=== Fn37：测试数组扩展运算符创建数组的 constructor 指向 ===");
    const originalArr = [1, 2, 3];
    const spreadArr = [...originalArr];
    const testPass = spreadArr.constructor === Array;
    console.log(`- [...[1,2,3]] 创建的数组，constructor === Array：${testPass}`);
    console.log(`- Fn37 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn38：测试对象扩展运算符创建的对象 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn38_TestObjectSpreadConstructor() {
    console.log("=== Fn38：测试对象扩展运算符创建对象的 constructor 指向 ===");
    const originalObj = { a: 1 };
    const spreadObj = { ...originalObj };
    const testPass = spreadObj.constructor === Object;
    console.log(`- {...{a:1}} 创建的对象，constructor === Object：${testPass}`);
    console.log(`- Fn38 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn39：测试 JSON.parse 解析对象的 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn39_TestJsonParseConstructor() {
    console.log("=== Fn39：测试 JSON.parse 解析对象的 constructor 指向 ===");
    const jsonStr = '{"key": "value"}';
    const parsedObj = JSON.parse(jsonStr);
    const testPass = parsedObj.constructor === Object;
    console.log(`- JSON.parse('{"key":"value"}') 解析的对象，constructor === Object：${testPass}`);
    console.log(`- Fn39 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn40：测试 JSON.stringify 序列化不影响 constructor（反序列化后恢复）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn40_TestJsonStringifyConstructor() {
    console.log("=== Fn40：测试 JSON.stringify 对 constructor 的影响 ===");
    const obj = { x: 10 };
    const jsonStr = JSON.stringify(obj);
    const parsedObj = JSON.parse(jsonStr);
    const testPass = parsedObj.constructor === Object;
    console.log(`- 对象序列化再反序列化后，constructor === Object：${testPass}`);
    console.log(`- Fn40 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn41：测试 Function.prototype.bind 创建的函数 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn41_TestBoundFunctionConstructor() {
    console.log("=== Fn41：测试 bind 创建的函数 constructor 指向 ===");

    function originalFunc() {
    }

    const boundFunc = originalFunc.bind(null);
    const testPass = boundFunc.constructor === Function;
    console.log(`- bind 创建的绑定函数，constructor === Function：${testPass}`);
    console.log(`- Fn41 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn42：测试类的 getter/setter 不影响实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn42_TestClassGetterSetterConstructor() {
    console.log("=== Fn42：测试类 getter/setter 对实例 constructor 的影响 ===");

    class User {
        constructor(name) {
            this._name = name;
        }

        get name() {
            return this._name;
        }

        set name(newName) {
            this._name = newName;
        }
    }

    const user = new User("Bob");
    const testPass = user.constructor === User;
    console.log(`- 含 getter/setter 的类实例，constructor === User：${testPass}`);
    console.log(`- Fn42 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn43：测试空对象字面量与非空对象字面量 constructor 一致性
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn43_TestEmptyNonEmptyObjConstructor() {
    console.log("=== Fn43：测试空/非空对象字面量的 constructor 一致性 ===");
    const emptyObj = {};
    const nonEmptyObj = { prop: "value" };
    const testPass = emptyObj.constructor === nonEmptyObj.constructor && emptyObj.constructor === Object;
    console.log(`- {} 与 {prop:"value"} 的 constructor 均为 Object：${testPass}`);
    console.log(`- Fn43 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn44：测试继承自 null 的类实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn44_TestClassInheritNullConstructor() {
    console.log("=== Fn44：测试继承自 null 的类实例 constructor 指向 ===");

    class NullInheritClass extends null {
        constructor() {
            super();
        }
    }

    const instance = new NullInheritClass();
    const testPass = instance.constructor === NullInheritClass;
    console.log(`- 继承自 null 的类实例，constructor === 类本身：${testPass}`);
    console.log(`- Fn44 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn45：测试通过 Reflect.construct 创建的实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn45_TestReflectConstructConstructor() {
    console.log("=== Fn45：测试 Reflect.construct 创建实例的 constructor 指向 ===");

    function Person(name) {
        this.name = name;
    }

    const instance = Reflect.construct(Person, ["Charlie"]);
    const testPass = instance.constructor === Person;
    console.log(`- Reflect.construct(Person, ["Charlie"]) 创建的实例，constructor === Person：${testPass}`);
    console.log(`- Fn45 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn48：测试 ArrayBuffer 对象的 constructor 指向 ArrayBuffer
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn48_TestArrayBufferConstructor() {
    console.log("=== Fn48：测试 ArrayBuffer 对象的 constructor 指向 ===");
    const buffer = new ArrayBuffer(16); // 16字节缓冲区
    const testPass = buffer.constructor === ArrayBuffer;
    console.log(`- new ArrayBuffer(16) 的 constructor === ArrayBuffer：${testPass}`);
    console.log(`- Fn48 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn49：测试 DataView 对象的 constructor 指向 DataView
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn49_TestDataViewConstructor() {
    console.log("=== Fn49：测试 DataView 对象的 constructor 指向 ===");
    const buffer = new ArrayBuffer(16);
    const dataView = new DataView(buffer);
    const testPass = dataView.constructor === DataView;
    console.log(`- new DataView(ArrayBuffer) 的 constructor === DataView：${testPass}`);
    console.log(`- Fn49 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn50：测试 Int32Array 对象的 constructor 指向 Int32Array
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn50_TestInt32ArrayConstructor() {
    console.log("=== Fn50：测试 Int32Array 对象的 constructor 指向 ===");
    const int32Arr = new Int32Array([10, 20, 30]);
    const testPass = int32Arr.constructor === Int32Array;
    console.log(`- new Int32Array([10,20,30]) 的 constructor === Int32Array：${testPass}`);
    console.log(`- Fn50 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn51：测试类的私有属性不影响实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn51_TestClassPrivatePropConstructor() {
    console.log("=== Fn51：测试类私有属性对实例 constructor 的影响 ===");

    class BankAccount {
        #balance = 0; // 私有属性

        constructor(initBalance) {
            this.#balance = initBalance;
        }
    }

    const account = new BankAccount(1000);
    const testPass = account.constructor === BankAccount;
    console.log(`- 含私有属性的类实例，constructor === BankAccount：${testPass}`);
    console.log(`- Fn51 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn52：测试通过 Object.create 基于类原型创建对象的 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn52_TestObjectCreateClassProtoConstructor() {
    console.log("=== Fn52：测试 Object.create(类原型) 的 constructor 指向 ===");

    class Animal {
        constructor(type) {
            this.type = type;
        }
    }

    const animalProto = Animal.prototype;
    const newAnimal = Object.create(animalProto);
    newAnimal.type = "cat"; // 手动设置属性
    const testPass = newAnimal.constructor === Animal;
    console.log(`- 基于 Animal.prototype 创建的对象，constructor === Animal：${testPass}`);
    console.log(`- Fn52 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn53：测试修改类原型的 constructor 影响实例指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn53_TestModifyClassProtoConstructor() {
    console.log("=== Fn53：测试修改类原型 constructor 对实例的影响 ===");

    class Fruit {
        constructor(name) {
            this.name = name;
        }
    }

    class FakeFruit {
        constructor() {
        }
    }

    // 修改类原型的 constructor
    Fruit.prototype.constructor = FakeFruit;
    const apple = new Fruit("apple");
    const testPass = apple.constructor === FakeFruit;
    console.log(`- 修改 Fruit.prototype.constructor 后，实例 constructor === FakeFruit：${testPass}`);
    console.log(`- Fn53 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn54：测试箭头函数作为构造函数时 constructor 指向（箭头函数不可 new）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn54_TestArrowFuncAsConstructor() {
    console.log("=== Fn54：测试箭头函数作为构造函数的 constructor 特性 ===");
    const ArrowFunc = () => {
    };
    let canNewArrow = true;
    try {
        new ArrowFunc(); // 箭头函数无 prototype，不可 new
    } catch (e) {
        canNewArrow = false;
    }
    const constrPoint = ArrowFunc.constructor === Function;
    const testPass = !canNewArrow && constrPoint;
    console.log(`- 箭头函数不可通过 new 创建：${!canNewArrow}`);
    console.log(`- 箭头函数自身的 constructor === Function：${constrPoint}`);
    console.log(`- Fn54 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn55：测试 Promise.resolve 创建的 Promise 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn55_TestPromiseResolveConstructor() {
    console.log("=== Fn55：测试 Promise.resolve 创建实例的 constructor 指向 ===");
    const resolvedPromise = Promise.resolve("success");
    const testPass = resolvedPromise.constructor === Promise;
    console.log(`- Promise.resolve("success") 的 constructor === Promise：${testPass}`);
    console.log(`- Fn55 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn56：测试 Promise.reject 创建的 Promise 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn56_TestPromiseRejectConstructor() {
    console.log("=== Fn56：测试 Promise.reject 创建实例的 constructor 指向 ===");
    const rejectedPromise = Promise.reject(new Error("fail"));
    const testPass = rejectedPromise.constructor === Promise;
    console.log(`- Promise.reject(Error) 的 constructor === Promise：${testPass}`);
    console.log(`- Fn56 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn57：测试 Promise.all 创建的 Promise 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn57_TestPromiseAllConstructor() {
    console.log("=== Fn57：测试 Promise.all 创建实例的 constructor 指向 ===");
    const promiseArr = [Promise.resolve(1), Promise.resolve(2)];
    const allPromise = Promise.all(promiseArr);
    const testPass = allPromise.constructor === Promise;
    console.log(`- Promise.all([Promise.resolve(1), Promise.resolve(2)]) 的 constructor === Promise：${testPass}`);
    console.log(`- Fn57 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn63：测试 Error 对象的 constructor 指向 Error
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn63_TestErrorConstructor() {
    console.log("=== Fn63：测试 Error 对象的 constructor 指向 ===");
    const error = new Error("test error");
    const testPass = error.constructor === Error;
    console.log(`- new Error("test error") 的 constructor === Error：${testPass}`);
    console.log(`- Fn63 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn64：测试 TypeError 对象的 constructor 指向 TypeError
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn64_TestTypeErrorConstructor() {
    console.log("=== Fn64：测试 TypeError 对象的 constructor 指向 ===");
    const typeError = new TypeError("type mismatch");
    const testPass = typeError.constructor === TypeError;
    console.log(`- new TypeError("type mismatch") 的 constructor === TypeError：${testPass}`);
    console.log(`- Fn64 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn65：测试 RangeError 对象的 constructor 指向 RangeError
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn65_TestRangeErrorConstructor() {
    console.log("=== Fn65：测试 RangeError 对象的 constructor 指向 ===");
    const rangeError = new RangeError("value out of range");
    const testPass = rangeError.constructor === RangeError;
    console.log(`- new RangeError("value out of range") 的 constructor === RangeError：${testPass}`);
    console.log(`- Fn65 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn66：测试 ReferenceError 对象的 constructor 指向 ReferenceError
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn66_TestReferenceErrorConstructor() {
    console.log("=== Fn66：测试 ReferenceError 对象的 constructor 指向 ===");
    const refError = new ReferenceError("variable is not defined");
    const testPass = refError.constructor === ReferenceError;
    console.log(`- new ReferenceError("variable is not defined") 的 constructor === ReferenceError：${testPass}`);
    console.log(`- Fn66 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn67：测试 SyntaxError 对象的 constructor 指向 SyntaxError
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn67_TestSyntaxErrorConstructor() {
    console.log("=== Fn67：测试 SyntaxError 对象的 constructor 指向 ===");
    const syntaxError = new SyntaxError("invalid syntax");
    const testPass = syntaxError.constructor === SyntaxError;
    console.log(`- new SyntaxError("invalid syntax") 的 constructor === SyntaxError：${testPass}`);
    console.log(`- Fn67 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn68：测试 EvalError 对象的 constructor 指向 EvalError
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn68_TestEvalErrorConstructor() {
    console.log("=== Fn68：测试 EvalError 对象的 constructor 指向 ===");
    const evalError = new EvalError("eval function error");
    const testPass = evalError.constructor === EvalError;
    console.log(`- new EvalError("eval function error") 的 constructor === EvalError：${testPass}`);
    console.log(`- Fn68 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn69：测试 URIError 对象的 constructor 指向 URIError
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn69_TestURIErrorConstructor() {
    console.log("=== Fn69：测试 URIError 对象的 constructor 指向 ===");
    const uriError = new URIError("invalid URI");
    const testPass = uriError.constructor === URIError;
    console.log(`- new URIError("invalid URI") 的 constructor === URIError：${testPass}`);
    console.log(`- Fn69 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn70：测试 Intl.DateTimeFormat 对象的 constructor 指向 Intl.DateTimeFormat
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn70_TestIntlDateTimeFormatConstructor() {
    console.log("=== Fn70：测试 Intl.DateTimeFormat 对象的 constructor 指向 ===");
    const dateFormatter = new Intl.DateTimeFormat("zh-CN");
    const testPass = dateFormatter.constructor === Intl.DateTimeFormat;
    console.log(`- new Intl.DateTimeFormat("zh-CN") 的 constructor === Intl.DateTimeFormat：${testPass}`);
    console.log(`- Fn70 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn71：测试 Intl.NumberFormat 对象的 constructor 指向 Intl.NumberFormat
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn71_TestIntlNumberFormatConstructor() {
    console.log("=== Fn71：测试 Intl.NumberFormat 对象的 constructor 指向 ===");
    const numberFormatter = new Intl.NumberFormat("en-US");
    const testPass = numberFormatter.constructor === Intl.NumberFormat;
    console.log(`- new Intl.NumberFormat("en-US") 的 constructor === Intl.NumberFormat：${testPass}`);
    console.log(`- Fn71 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn72：测试 Intl.Collator 对象的 constructor 指向 Intl.Collator
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn72_TestIntlCollatorConstructor() {
    console.log("=== Fn72：测试 Intl.Collator 对象的 constructor 指向 ===");
    const collator = new Intl.Collator("fr-FR");
    const testPass = collator.constructor === Intl.Collator;
    console.log(`- new Intl.Collator("fr-FR") 的 constructor === Intl.Collator：${testPass}`);
    console.log(`- Fn72 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn73：测试 Intl.PluralRules 对象的 constructor 指向 Intl.PluralRules
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn73_TestIntlPluralRulesConstructor() {
    console.log("=== Fn73：测试 Intl.PluralRules 对象的 constructor 指向 ===");
    const pluralRules = new Intl.PluralRules("es-ES");
    const testPass = pluralRules.constructor === Intl.PluralRules;
    console.log(`- new Intl.PluralRules("es-ES") 的 constructor === Intl.PluralRules：${testPass}`);
    console.log(`- Fn73 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn74：测试 Intl.RelativeTimeFormat 对象的 constructor 指向 Intl.RelativeTimeFormat
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn74_TestIntlRelativeTimeFormatConstructor() {
    console.log("=== Fn74：测试 Intl.RelativeTimeFormat 对象的 constructor 指向 ===");
    const relativeTimeFormat = new Intl.RelativeTimeFormat("de-DE");
    const testPass = relativeTimeFormat.constructor === Intl.RelativeTimeFormat;
    console.log(`- new Intl.RelativeTimeFormat("de-DE") 的 constructor === Intl.RelativeTimeFormat：${testPass}`);
    console.log(`- Fn74 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn76：测试 Atomics 对象的 constructor 指向 Function（Atomics 为静态对象）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn76_TestAtomicsConstructor() {
    console.log("=== Fn76：测试 Atomics 对象的 constructor 指向 ===");
    const testPass = Atomics.constructor === Function;
    console.log(`- 静态对象 Atomics 的 constructor === Function：${testPass}`);
    console.log(`- Fn76 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn77：测试 Math 对象的 constructor 指向 Function（Math 为静态对象）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn77_TestMathConstructor() {
    console.log("=== Fn77：测试 Math 对象的 constructor 指向 ===");
    const testPass = Math.constructor === Function;
    console.log(`- 静态对象 Math 的 constructor === Function：${testPass}`);
    console.log(`- Fn77 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn78：测试 Reflect 对象的 constructor 指向 Function（Reflect 为静态对象）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn78_TestReflectConstructor() {
    console.log("=== Fn78：测试 Reflect 对象的 constructor 指向 ===");
    const testPass = Reflect.constructor === Function;
    console.log(`- 静态对象 Reflect 的 constructor === Function：${testPass}`);
    console.log(`- Fn78 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn79：测试 Intl 对象的 constructor 指向 Function（Intl 为静态对象）
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn79_TestIntlConstructor() {
    console.log("=== Fn79：测试 Intl 对象的 constructor 指向 ===");
    const testPass = Intl.constructor === Function;
    console.log(`- 静态对象 Intl 的 constructor === Function：${testPass}`);
    console.log(`- Fn79 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn80：测试通过 Object.keys 创建的数组 constructor 指向 Array
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn80_TestObjectKeysConstructor() {
    console.log("=== Fn80：测试 Object.keys 创建数组的 constructor 指向 ===");
    const obj = { a: 1, b: 2 };
    const keysArr = Object.keys(obj);
    const testPass = keysArr.constructor === Array;
    console.log(`- Object.keys({a:1,b:2}) 创建的数组，constructor === Array：${testPass}`);
    console.log(`- Fn80 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn81：测试通过 Object.values 创建的数组 constructor 指向 Array
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn81_TestObjectValuesConstructor() {
    console.log("=== Fn81：测试 Object.values 创建数组的 constructor 指向 ===");
    const obj = { x: 10, y: 20 };
    const valuesArr = Object.values(obj);
    const testPass = valuesArr.constructor === Array;
    console.log(`- Object.values({x:10,y:20}) 创建的数组，constructor === Array：${testPass}`);
    console.log(`- Fn81 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn82：测试通过 Object.entries 创建的数组 constructor 指向 Array
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn82_TestObjectEntriesConstructor() {
    console.log("=== Fn82：测试 Object.entries 创建数组的 constructor 指向 ===");
    const obj = { m: "a", n: "b" };
    const entriesArr = Object.entries(obj);
    const testPass = entriesArr.constructor === Array;
    console.log(`- Object.entries({m:"a",n:"b"}) 创建的数组，constructor === Array：${testPass}`);
    console.log(`- Fn82 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn83：测试通过 Array.from 创建的数组 constructor 指向 Array
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn83_TestArrayFromConstructor() {
    console.log("=== Fn83：测试 Array.from 创建数组的 constructor 指向 ===");
    const iterable = "hello";
    const fromArr = Array.from(iterable);
    const testPass = fromArr.constructor === Array;
    console.log(`- Array.from("hello") 创建的数组，constructor === Array：${testPass}`);
    console.log(`- Fn83 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn84：测试通过 Array.of 创建的数组 constructor 指向 Array
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn84_TestArrayOfConstructor() {
    console.log("=== Fn84：测试 Array.of 创建数组的 constructor 指向 ===");
    const ofArr = Array.of(5, 6, 7);
    const testPass = ofArr.constructor === Array;
    console.log(`- Array.of(5,6,7) 创建的数组，constructor === Array：${testPass}`);
    console.log(`- Fn84 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn85：测试通过 String.fromCharCode 创建的字符串 constructor 指向 String
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn85_TestStringFromCharCodeConstructor() {
    console.log("=== Fn85：测试 String.fromCharCode 创建字符串的 constructor 指向 ===");
    const str = String.fromCharCode(65, 66, 67); // "ABC"
    const testPass = str.constructor === String;
    console.log(`- String.fromCharCode(65,66,67) 创建的字符串，constructor === String：${testPass}`);
    console.log(`- Fn85 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn86：测试 String.fromCodePoint 创建的字符串 constructor 指向 String
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn86_TestStringFromCodePointConstructor() {
    console.log("=== Fn86：测试 String.fromCodePoint 创建字符串的 constructor 指向 ===");
    const str = String.fromCodePoint(9731, 9733); // "★♥"
    const testPass = str.constructor === String;
    console.log(`- String.fromCodePoint(9731,9733) 创建的字符串，constructor === String：${testPass}`);
    console.log(`- Fn86 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn87：测试 Number.isFinite 工具函数不影响 Number 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn87_TestNumberIsFiniteConstructor() {
    console.log("=== Fn87：测试 Number.isFinite 对实例 constructor 的影响 ===");
    const num = 123.45;
    const isFinite = Number.isFinite(num);
    const testPass = num.constructor === Number && isFinite;
    console.log(`- 123.45 的 constructor === Number：${num.constructor === Number}`);
    console.log(`- Number.isFinite(123.45) 返回 true：${isFinite}`);
    console.log(`- Fn87 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn88：测试 Number.isInteger 工具函数不影响 Number 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn88_TestNumberIsIntegerConstructor() {
    console.log("=== Fn88：测试 Number.isInteger 对实例 constructor 的影响 ===");
    const num = 456;
    const isInteger = Number.isInteger(num);
    const testPass = num.constructor === Number && isInteger;
    console.log(`- 456 的 constructor === Number：${num.constructor === Number}`);
    console.log(`- Number.isInteger(456) 返回 true：${isInteger}`);
    console.log(`- Fn88 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn89：测试 Boolean 对象与布尔值字面量的 constructor 一致性
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn89_TestBooleanObjLiteralConstructor() {
    console.log("=== Fn89：测试 Boolean 对象与字面量的 constructor 一致性 ===");
    const boolLiteral = false;
    const boolObj = new Boolean(false);
    const testPass = boolLiteral.constructor === Boolean && boolObj.constructor === Boolean;
    console.log(`- false 字面量的 constructor === Boolean：${boolLiteral.constructor === Boolean}`);
    console.log(`- new Boolean(false) 的 constructor === Boolean：${boolObj.constructor === Boolean}`);
    console.log(`- Fn89 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn90：测试通过 Map.prototype.entries 创建的迭代器 constructor 指向 Map Iterator
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn90_TestMapEntriesIteratorConstructor() {
    console.log("=== Fn90：测试 Map 迭代器的 constructor 指向 ===");
    const map = new Map([["k1", "v1"]]);
    const entriesIter = map.entries();
    const testPass = entriesIter.constructor.name === "Map Iterator";
    console.log(`- map.entries() 创建的迭代器，constructor.name === "Map Iterator"：${testPass}`);
    console.log(`- Fn90 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn91：测试通过 Set.prototype.values 创建的迭代器 constructor 指向 Set Iterator
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn91_TestSetValuesIteratorConstructor() {
    console.log("=== Fn91：测试 Set 迭代器的 constructor 指向 ===");
    const set = new Set([1, 2]);
    const valuesIter = set.values();
    const testPass = valuesIter.constructor.name === "Set Iterator";
    console.log(`- set.values() 创建的迭代器，constructor.name === "Set Iterator"：${testPass}`);
    console.log(`- Fn91 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn92：测试通过 Array.prototype.keys 创建的迭代器 constructor 指向 Array Iterator
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn92_TestArrayKeysIteratorConstructor() {
    console.log("=== Fn92：测试 Array 迭代器的 constructor 指向 ===");
    const arr = [10, 20];
    const keysIter = arr.keys();
    const testPass = keysIter.constructor.name === "Array Iterator";
    console.log(`- arr.keys() 创建的迭代器，constructor.name === "Array Iterator"：${testPass}`);
    console.log(`- Fn92 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn97：测试通过 Object.setPrototypeOf 修改原型后实例的 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn97_TestSetProtoConstructor() {
    console.log("=== Fn97：测试 Object.setPrototypeOf 修改原型后的 constructor 指向 ===");

    function OldProto() {
        this.old = "old";
    }

    function NewProto() {
        this.new = "new";
    }

    const obj = new OldProto();
    Object.setPrototypeOf(obj, NewProto.prototype);
    const testPass = obj.constructor === NewProto;
    console.log(`- 修改原型为 NewProto.prototype 后，obj.constructor === NewProto：${testPass}`);
    console.log(`- Fn97 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn98：测试类的静态属性不影响实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn98_TestClassStaticPropConstructor() {
    console.log("=== Fn98：测试类静态属性对实例 constructor 的影响 ===");

    class Tool {
        static version = "1.0.0"; // 静态属性

        constructor(name) {
            this.name = name;
        }
    }

    const tool = new Tool("hammer");
    const testPass = tool.constructor === Tool;
    console.log(`- 含静态属性的类实例，constructor === Tool：${testPass}`);
    console.log(`- Fn98 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn99：测试空类实例的 constructor 指向类本身
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn99_TestEmptyClassInstanceConstructor() {
    console.log("=== Fn99：测试空类实例的 constructor 指向 ===");

    class EmptyClass {
    } // 空类（无构造函数、无属性方法）
    const emptyInstance = new EmptyClass();
    const testPass = emptyInstance.constructor === EmptyClass;
    console.log(`- 空类 EmptyClass 的实例，constructor === EmptyClass：${testPass}`);
    console.log(`- Fn99 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn100：测试继承 Error 的自定义错误类实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn100_TestInheritErrorConstructor() {
    console.log("=== Fn100：测试继承 Error 的自定义错误类 constructor 指向 ===");

    class CustomError extends Error {
        constructor(message) {
            super(message);
            this.name = "CustomError";
        }
    }

    const customErr = new CustomError("custom error");
    const testPass = customErr.constructor === CustomError;
    console.log(`- 自定义错误类实例，constructor === CustomError：${testPass}`);
    console.log(`- Fn100 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn101：测试通过 Promise.prototype.then 返回的 Promise 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn101_TestPromiseThenConstructor() {
    console.log("=== Fn101：测试 Promise.then 返回实例的 constructor 指向 ===");
    const originalPromise = Promise.resolve(1);
    const thenPromise = originalPromise.then(res => res + 1);
    const testPass = thenPromise.constructor === Promise;
    console.log(`- Promise.then 返回的实例，constructor === Promise：${testPass}`);
    console.log(`- Fn101 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn102：测试通过 Promise.prototype.catch 返回的 Promise 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn102_TestPromiseCatchConstructor() {
    console.log("=== Fn102：测试 Promise.catch 返回实例的 constructor 指向 ===");
    const originalPromise = Promise.reject(new Error("err"));
    const catchPromise = originalPromise.catch(err => err);
    const testPass = catchPromise.constructor === Promise;
    console.log(`- Promise.catch 返回的实例，constructor === Promise：${testPass}`);
    console.log(`- Fn102 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn103：测试通过 Promise.prototype.finally 返回的 Promise 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn103_TestPromiseFinallyConstructor() {
    console.log("=== Fn103：测试 Promise.finally 返回实例的 constructor 指向 ===");
    const originalPromise = Promise.resolve(3);
    const finallyPromise = originalPromise.finally(() => {
    });
    const testPass = finallyPromise.constructor === Promise;
    console.log(`- Promise.finally 返回的实例，constructor === Promise：${testPass}`);
    console.log(`- Fn103 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn104：测试通过 Promise.allSettled 返回的 Promise 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn104_TestPromiseAllSettledConstructor() {
    console.log("=== Fn104：测试 Promise.allSettled 返回实例的 constructor 指向 ===");
    const promiseArr = [Promise.resolve(4), Promise.reject(5)];
    const allSettledPromise = Promise.allSettled(promiseArr);
    const testPass = allSettledPromise.constructor === Promise;
    console.log(`- Promise.allSettled 返回的实例，constructor === Promise：${testPass}`);
    console.log(`- Fn104 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}

/**
 * Fn105：测试通过 Promise.race 返回的 Promise 实例 constructor 指向
 * @returns {boolean} 测试通过返回 true，失败返回 false
 */
export function Fn105_TestPromiseRaceConstructor() {
    console.log("=== Fn105：测试 Promise.race 返回实例的 constructor 指向 ===");
    const promiseArr = [Promise.resolve(6), new Promise(resolve => setTimeout(resolve, 100))];
    const racePromise = Promise.race(promiseArr);
    const testPass = racePromise.constructor === Promise;
    console.log(`- Promise.race 返回的实例，constructor === Promise：${testPass}`);
    console.log(`- Fn105 测试结果：${testPass ? "✅ 通过" : "❌ 失败"}\n`);
    return testPass;
}