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
// 测试点1：验证返回对象所有自有属性（含不可枚举，不含Symbol属性）

export function Fn01_testAllOwnProperties() {
    const testObj = { a: 1 };
    Object.defineProperty(testObj, 'b', { value: 2, enumerable: false });
    testObj[Symbol('c')] = 3;

    const result = Object.getOwnPropertyNames(testObj);
    return result.includes('a') && result.includes('b') && result.length === 2;
}

// 测试点2：验证非负整数键优先按升序排列，字符串键按插入顺序排列
export function Fn02_testPropertyOrder() {
    const testObj = {
        '2': 'two',
        '0': 'zero',
        '1': 'one',
        'name': 'test'
    };

    const result = Object.getOwnPropertyNames(testObj);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'name']);
}

// 测试点3：验证ES2015+中非对象参数会被强制转换为对象（测试数字类型）
export function Fn03_testPrimitiveCoercion() {
    const num = 123;
    const result = Object.getOwnPropertyNames(num);

    return result.includes('constructor') && result.length > 0;
}

// 测试点4：验证数组对象返回索引及length属性
export function Fn04_testArrayProperties() {
    const testArr = ['a', 'b', 'c'];
    const result = Object.getOwnPropertyNames(testArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点5：验证空对象返回空数组
export function Fn05_testEmptyObject() {
    const emptyObj = {};
    const result = Object.getOwnPropertyNames(emptyObj);
    return result.length === 0 && Array.isArray(result);
}

// 测试点6：验证函数对象返回内置自有属性（如name、length）
export function Fn06_testFunctionProperties() {

    function testFunc(a, b) {
        return a + b;
    }

    const result = Object.getOwnPropertyNames(testFunc);
    return result.includes('name') && result.includes('length') && result.includes('prototype');
}

// 测试点7：验证Date对象返回其自有属性
export function Fn07_testDateProperties() {
    const testDate = new Date();
    const result = Object.getOwnPropertyNames(testDate);
    return result.includes('constructor') && !result.includes('getFullYear'); // getFullYear是原型方法
}

// 测试点8：验证自定义类实例返回实例自有属性（不含原型属性）
export function Fn08_testClassInstance() {
    class TestClass {
        constructor() {
            this.instanceProp = 'test';
        }

        protoMethod() {
        }
    }

    const instance = new TestClass();
    const result = Object.getOwnPropertyNames(instance);
    return result.includes('instanceProp') && !result.includes('protoMethod');
}

// 测试点9：验证不可扩展对象仍能正确返回自有属性
export function Fn09_testNonExtensibleObject() {
    const testObj = { x: 10 };
    Object.preventExtensions(testObj);
    const result = Object.getOwnPropertyNames(testObj);
    return result.includes('x') && result.length === 1;
}

// 测试点10：验证密封对象能返回所有自有属性（含不可配置）
export function Fn10_testSealedObject() {
    const testObj = { y: 20 };
    Object.seal(testObj);
    const result = Object.getOwnPropertyNames(testObj);
    return result.includes('y') && Object.getOwnPropertyDescriptor(testObj, 'y').configurable === false;
}

// 测试点11：验证冻结对象能正确返回自有属性
export function Fn11_testFrozenObject() {
    const testObj = { z: 30 };
    Object.freeze(testObj);
    const result = Object.getOwnPropertyNames(testObj);
    return result.includes('z') && Object.getOwnPropertyDescriptor(testObj, 'z').writable === false;
}

// 测试点12：验证字符串包装对象返回索引及length属性
export function Fn12_testStringWrapper() {
    const str = new String('hello');
    const result = Object.getOwnPropertyNames(str);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', '4', 'length']);
}

// 测试点13：验证布尔包装对象返回自有属性
export function Fn13_testBooleanWrapper() {
    const bool = new Boolean(true);
    const result = Object.getOwnPropertyNames(bool);
    return result.includes('constructor') && result.length > 0;
}

// 测试点14：验证null/undefined强制转换为对象时的处理（ES2015+）
export function Fn14_testNullUndefinedCoercion() {
    try {
        Object.getOwnPropertyNames(null);
        Object.getOwnPropertyNames(undefined);
        return true;
    } catch (e) {
        return false;
    }
}

// 测试点16：验证嵌套对象仅返回当前对象自有属性（不递归）
export function Fn16_testNestedObject() {
    const nestedObj = { a: 1, b: { c: 2 } };
    const result = Object.getOwnPropertyNames(nestedObj);
    return result.includes('a') && result.includes('b') && !result.includes('c');
}

// 测试点17：验证Math对象（内置对象）返回其自有属性
export function Fn17_testMathObject() {
    const result = Object.getOwnPropertyNames(Math);
    return result.includes('PI') && result.includes('max') && result.includes('min');
}

// 测试点18：验证RegExp对象返回其自有属性（如source、flags）
export function Fn18_testRegExpObject() {
    const reg = /abc/g;
    const result = Object.getOwnPropertyNames(reg);
    return result.includes('source') && result.includes('flags') && result.includes('lastIndex');
}

// 测试点19：验证Map实例仅返回对象自有属性（不含Map原型方法/属性）
export function Fn19_testMapInstance() {
    const map = new Map([['key1', 'val1']]);
    const result = Object.getOwnPropertyNames(map);
    return result.includes('constructor') && !result.includes('set') && !result.includes('get');
}

// 测试点20：验证Set实例仅返回对象自有属性（不含Set原型方法/属性）
export function Fn20_testSetInstance() {
    const set = new Set(['val1', 'val2']);
    const result = Object.getOwnPropertyNames(set);
    return result.includes('constructor') && !result.includes('add') && !result.includes('has');
}

// 测试点21：验证数组空槽场景下仍返回正确索引与length
export function Fn21_testArrayHoles() {
    const arrWithHoles = [1, , 3]; // 中间存在空槽
    const result = Object.getOwnPropertyNames(arrWithHoles);
    return JSON.stringify(result) === JSON.stringify(['0', '2', 'length']);
}

// 测试点22：验证自定义getter/setter属性会被返回
export function Fn22_testGetterSetterProperty() {
    const obj = {
        get foo() {
            return 'bar';
        },
        set foo(val) { /* 空实现 */
        }
    };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('foo');
}

// 测试点23：验证Error对象返回自有属性（如message、stack）
export function Fn23_testErrorObject() {
    const err = new Error('test error');
    const result = Object.getOwnPropertyNames(err);
    return result.includes('message') && result.includes('stack');
}

// 测试点24：验证Promise实例返回自有属性（不含原型方法）
export function Fn24_testPromiseInstance() {
    const promise = Promise.resolve(123);
    const result = Object.getOwnPropertyNames(promise);
    return result.includes('constructor') && !result.includes('then');
}

// 测试点25：验证数字包装对象的自有属性不包含原型方法
export function Fn25_testNumberWrapperNoProto() {
    const numWrapper = new Number(456);
    const result = Object.getOwnPropertyNames(numWrapper);
    return result.includes('constructor') && !result.includes('toFixed');
}

// 测试点26：验证对象属性键含特殊字符时仍能正确返回
export function Fn26_testSpecialCharKeys() {
    const obj = { 'a-b': 1, 'c_d': 2, 'e f': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('a-b') && result.includes('c_d') && result.includes('e f');
}

// 测试点27：验证类静态属性会被返回（需挂载在类自身）
export function Fn27_testClassStaticProperty() {
    class Test {
        static staticProp = 'staticVal';
    }

    const result = Object.getOwnPropertyNames(Test);
    return result.includes('staticProp') && result.includes('prototype');
}

// 测试点28：验证TypedArray（如Uint8Array）返回索引与length
export function Fn28_testTypedArray() {
    const typedArr = new Uint8Array([10, 20]);
    const result = Object.getOwnPropertyNames(typedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', 'length']);
}

// 测试点29：验证空数组返回['length']
export function Fn29_testEmptyArray() {
    const emptyArr = [];
    const result = Object.getOwnPropertyNames(emptyArr);
    return JSON.stringify(result) === JSON.stringify(['length']);
}

// 测试点30：验证对象属性被delete后不再返回
export function Fn30_testDeletedProperty() {
    const obj = { x: 1, y: 2 };
    delete obj.y;
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('x') && !result.includes('y') && result.length === 1;
}

// 测试点31：验证RegExp带捕获组时仍返回核心自有属性
export function Fn31_testRegExpCaptureGroup() {
    const reg = /(a)(b)/;
    reg.exec('ab'); // 触发捕获组匹配
    const result = Object.getOwnPropertyNames(reg);
    return result.includes('source') && result.includes('1') && result.includes('2');
}

// 测试点32：验证WeakMap实例仅返回构造函数相关自有属性
export function Fn32_testWeakMapInstance() {
    const weakMap = new WeakMap();
    const result = Object.getOwnPropertyNames(weakMap);
    return result.includes('constructor') && result.length === 1;
}

// 测试点33：验证WeakSet实例仅返回构造函数相关自有属性
export function Fn33_testWeakSetInstance() {
    const weakSet = new WeakSet();
    const result = Object.getOwnPropertyNames(weakSet);
    return result.includes('constructor') && result.length === 1;
}

// 测试点35：验证对象属性值为undefined时仍返回键名
export function Fn35_testUndefinedValueProperty() {
    const obj = { a: undefined, b: null };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('a') && result.includes('b');
}

// 测试点36：验证数组修改length后返回新索引与length
export function Fn36_testArrayLengthChange() {
    const arr = [1, 2];
    arr.length = 4; // 扩展length
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', 'length']);
}

// 测试点37：验证类实例原型重写后仍返回实例自有属性
export function Fn37_testInstanceProtoOverride() {
    class Test {
        constructor() {
            this.ownProp = 'test';
        }
    }

    const instance = new Test();
    Object.setPrototypeOf(instance, {}); // 重写实例原型
    const result = Object.getOwnPropertyNames(instance);
    return result.includes('ownProp');
}

// 测试点38：验证DataView对象返回自有属性（如buffer）
export function Fn38_testDataView() {
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    const result = Object.getOwnPropertyNames(dataView);
    return result.includes('buffer') && result.includes('byteLength');
}

// 测试点39：验证对象使用Object.assign添加属性后能返回
export function Fn39_testAssignAddedProperty() {
    const obj = { a: 1 };
    Object.assign(obj, { b: 2, c: 3 });
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('a') && result.includes('b') && result.includes('c');
}

// 测试点40：验证Generator函数实例返回自有属性
export function Fn40_testGeneratorInstance() {

    function* gen() {
        yield 1;
    }

    const genInstance = gen();
    const result = Object.getOwnPropertyNames(genInstance);
    return result.includes('constructor') && !result.includes('next');
}

// 测试点41：验证对象键为极长数字字符串时按数字升序排列
export function Fn41_testLongNumberStringKeys() {
    const obj = { '100': 'a', '20': 'b', '5': 'c' };
    const result = Object.getOwnPropertyNames(obj);
    return JSON.stringify(result) === JSON.stringify(['5', '20', '100']);
}

// 测试点42：验证空函数对象返回核心自有属性
export function Fn42_testEmptyFunction() {
    const emptyFunc = () => {
    };
    const result = Object.getOwnPropertyNames(emptyFunc);
    return result.includes('name') && result.includes('length') && result.includes('prototype');
}

// 测试点44：验证对象属性可配置性不影响返回结果
export function Fn44_testNonConfigurableProperty() {
    const obj = {};
    Object.defineProperty(obj, 'nonConfig', { value: 1, configurable: false });
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('nonConfig');
}

// 测试点45：验证数组使用push添加元素后返回新索引
export function Fn45_testArrayPush() {
    const arr = [1];
    arr.push(2, 3);
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点46：验证Symbol作为对象键时不被返回
export function Fn46_testSymbolKeyExcluded() {
    const sym1 = Symbol('sym1');
    const sym2 = Symbol('sym2');
    const obj = { [sym1]: 1, [sym2]: 2, strKey: 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('strKey') && !result.includes(sym1) && !result.includes(sym2);
}

// 测试点47：验证类getter静态属性会被返回
export function Fn47_testClassStaticGetter() {
    class Test {
        static get staticGetter() {
            return 'val';
        }
    }

    const result = Object.getOwnPropertyNames(Test);
    return result.includes('staticGetter');
}

// 测试点48：验证ArrayBuffer对象返回自有属性（如byteLength）
export function Fn48_testArrayBuffer() {
    const buffer = new ArrayBuffer(16);
    const result = Object.getOwnPropertyNames(buffer);
    return result.includes('byteLength') && result.includes('constructor');
}

// 测试点49：验证对象嵌套数组时仅返回当前对象自有属性
export function Fn49_testObjectWithNestedArray() {
    const obj = { nestedArr: [1, 2, 3], ownKey: 'val' };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('nestedArr') && result.includes('ownKey') && !result.includes('0');
}

// 测试点51：验证数组使用unshift添加元素后返回新索引
export function Fn51_testArrayUnshift() {
    const arr = [2, 3];
    arr.unshift(0, 1);
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', 'length']);
}

// 测试点52：验证Error子类（如TypeError）返回自有属性
export function Fn52_testErrorSubclass() {
    const typeErr = new TypeError('type error');
    const result = Object.getOwnPropertyNames(typeErr);
    return result.includes('message') && result.includes('stack');
}

// 测试点53：验证对象键为纯数字字符串与非数字字符串混合时的排序
export function Fn53_testMixedKeyOrder() {
    const obj = { '5': 'num', 'test': 'str', '2': 'num2' };
    const result = Object.getOwnPropertyNames(obj);
    return JSON.stringify(result) === JSON.stringify(['2', '5', 'test']);
}

// 测试点54：验证Set实例添加元素后仍仅返回自有属性
export function Fn54_testSetWithElements() {
    const set = new Set([1, 2, 3]);
    const result = Object.getOwnPropertyNames(set);
    return result.includes('constructor') && !result.includes('size');
}

// 测试点55：验证Map实例添加键值对后仍仅返回自有属性
export function Fn55_testMapWithEntries() {
    const map = new Map([['k1', 'v1'], ['k2', 'v2']]);
    const result = Object.getOwnPropertyNames(map);
    return result.includes('constructor') && !result.includes('size');
}

// 测试点56：验证BigInt原始值强制转换为对象后返回自有属性
export function Fn56_testBigIntPrimitiveCoercion() {
    const bigInt = 9007199254740991n;
    const result = Object.getOwnPropertyNames(bigInt);
    return result.includes('constructor') && result.length > 0;
}

// 测试点58：验证对象使用defineProperties批量添加属性后返回
export function Fn58_testDefineProperties() {
    const obj = {};
    Object.defineProperties(obj, {
        x: { value: 10 },
        y: { value: 20, enumerable: false }
    });
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('x') && result.includes('y');
}

// 测试点59：验证空TypedArray返回['length']
export function Fn59_testEmptyTypedArray() {
    const emptyTypedArr = new Uint8Array(0);
    const result = Object.getOwnPropertyNames(emptyTypedArr);
    return JSON.stringify(result) === JSON.stringify(['length']);
}

// 测试点60：验证对象属性值为函数时仍返回键名
export function Fn60_testFunctionValueProperty() {
    const obj = {
        func1: () => {
        }, func2: function () {
        }
    };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('func1') && result.includes('func2');
}

// 测试点61：验证数组使用splice添加元素后返回新索引
export function Fn61_testArraySpliceAdd() {
    const arr = [1, 4];
    arr.splice(1, 0, 2, 3); // 插入元素
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', 'length']);
}

// 测试点62：验证ReadonlyArray类型对象返回正确属性
export function Fn62_testReadonlyArray() {
    const readonlyArr = Object.freeze(['a', 'b']); // 模拟ReadonlyArray
    const result = Object.getOwnPropertyNames(readonlyArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', 'length']);
}

// 测试点63：验证对象键为中文时正确返回
export function Fn63_testChineseKey() {
    const obj = { '姓名': '张三', '年龄': 20 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('姓名') && result.includes('年龄');
}

// 测试点64：验证Promise.reject实例返回自有属性
export function Fn64_testPromiseReject() {
    const rejectedPromise = Promise.reject(new Error('err'));
    const result = Object.getOwnPropertyNames(rejectedPromise);
    return result.includes('constructor') && !result.includes('catch');
}

// 测试点65：验证Array.from创建的数组返回正确属性
export function Fn65_testArrayFrom() {
    const arrFrom = Array.from([1, 2, 3]);
    const result = Object.getOwnPropertyNames(arrFrom);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点66：验证对象使用Object.create(null)创建时返回空数组
export function Fn66_testObjectCreateNull() {
    const obj = Object.create(null); // 无原型对象
    const result = Object.getOwnPropertyNames(obj);
    return result.length === 0;
}

// 测试点67：验证TypedArray使用set方法填充后返回索引
export function Fn67_testTypedArraySet() {
    const typedArr = new Int16Array(3);
    typedArr.set([10, 20, 30]);
    const result = Object.getOwnPropertyNames(typedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点68：验证对象属性为嵌套对象时仅返回当前键
export function Fn68_testNestedObjValue() {
    const obj = { nested: { a: 1, b: 2 }, flat: 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('nested') && result.includes('flat') && !result.includes('a');
}

// 测试点69：验证Generator函数原型对象返回自有属性
export function Fn69_testGeneratorPrototype() {

    function* gen() {
    }

    const genProto = Object.getPrototypeOf(gen());
    const result = Object.getOwnPropertyNames(genProto);
    return result.includes('next') && result.includes('throw');
}

// 测试点70：验证对象键为特殊符号（如!@#）时正确返回
export function Fn70_testSpecialSymbolKeys() {
    const obj = { '!': 1, '@': 2, '#': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('!') && result.includes('@') && result.includes('#');
}

// 测试点71：验证ArrayBuffer切片（slice）后返回自有属性
export function Fn71_testArrayBufferSlice() {
    const buffer = new ArrayBuffer(8);
    const slicedBuffer = buffer.slice(2, 6);
    const result = Object.getOwnPropertyNames(slicedBuffer);
    return result.includes('byteLength') && result.includes('constructor');
}

// 测试点72：验证对象使用hasOwnProperty判断后与返回结果一致
export function Fn72_testHasOwnPropertyMatch() {
    const obj = { a: 1, b: 2 };
    const props = Object.getOwnPropertyNames(obj);
    return props.every(prop => obj.hasOwnProperty(prop)) && obj.hasOwnProperty('a') && obj.hasOwnProperty('b');
}

// 测试点73：验证空DataView对象返回自有属性
export function Fn73_testEmptyDataView() {
    const buffer = new ArrayBuffer(0);
    const emptyDataView = new DataView(buffer);
    const result = Object.getOwnPropertyNames(emptyDataView);
    return result.includes('buffer') && result.includes('byteLength');
}

// 测试点74：验证对象键为数字0字符串与非0数字字符串的排序
export function Fn74_testZeroAndNonZeroKeys() {
    const obj = { '0': 'zero', '10': 'ten', '5': 'five' };
    const result = Object.getOwnPropertyNames(obj);
    return JSON.stringify(result) === JSON.stringify(['0', '5', '10']);
}

// 测试点75：验证类继承中父类静态属性不影响子类实例结果
export function Fn75_testClassInheritanceStatic() {
    class Parent {
        static parentStatic = 'val';
    }

    class Child extends Parent {
        constructor() {
            super();
            this.childOwn = 'test';
        }
    }

    const childInst = new Child();
    const result = Object.getOwnPropertyNames(childInst);
    return result.includes('childOwn') && !result.includes('parentStatic');
}

// 测试点76：验证数组使用fill填充后返回索引
export function Fn76_testArrayFill() {
    const arr = new Array(3).fill('a');
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点80：验证空Generator实例返回自有属性
export function Fn80_testEmptyGenerator() {

    function* emptyGen() {
    }

    const genInst = emptyGen();
    const result = Object.getOwnPropertyNames(genInst);
    return result.includes('constructor') && !result.includes('next');
}

// 测试点81：验证数组使用pop删除元素后返回剩余索引与length
export function Fn81_testArrayPop() {
    const arr = [1, 2, 3, 4];
    arr.pop();
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点82：验证Error对象stack属性（不可枚举）被返回
export function Fn82_testErrorStackProperty() {
    const err = new Error('stack test');
    const result = Object.getOwnPropertyNames(err);
    return result.includes('stack') && !Object.prototype.propertyIsEnumerable.call(err, 'stack');
}

// 测试点83：验证对象键为长字符串（含空格）时正确返回
export function Fn83_testLongStringKey() {
    const obj = { 'long key with spaces': 'value', 'another-long-key': 'val' };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('long key with spaces') && result.includes('another-long-key');
}

// 测试点84：验证Promise.all返回的Promise实例仅返回自有属性
export function Fn84_testPromiseAllInstance() {
    const allPromise = Promise.all([Promise.resolve(1), Promise.resolve(2)]);
    const result = Object.getOwnPropertyNames(allPromise);
    return result.includes('constructor') && !result.includes('then');
}

// 测试点85：验证TypedArray截取（subarray）后返回索引与length
export function Fn85_testTypedArraySubarray() {
    const typedArr = new Uint32Array([1, 2, 3, 4]);
    const subArr = typedArr.subarray(1, 3);
    const result = Object.getOwnPropertyNames(subArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', 'length']);
}

// 测试点87：验证空WeakMap实例返回仅含constructor的数组
export function Fn87_testEmptyWeakMap() {
    const weakMap = new WeakMap();
    const result = Object.getOwnPropertyNames(weakMap);
    return JSON.stringify(result) === JSON.stringify(['constructor']);
}

// 测试点88：验证空WeakSet实例返回仅含constructor的数组
export function Fn88_testEmptyWeakSet() {
    const weakSet = new WeakSet();
    const result = Object.getOwnPropertyNames(weakSet);
    return JSON.stringify(result) === JSON.stringify(['constructor']);
}

// 测试点89：验证数组使用shift删除元素后返回剩余索引与length
export function Fn89_testArrayShift() {
    const arr = [1, 2, 3, 4];
    arr.shift();
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点90：验证对象属性为Date实例时仍返回键名
export function Fn90_testDateValueProperty() {
    const obj = { today: new Date(), tomorrow: new Date(Date.now() + 86400000) };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('today') && result.includes('tomorrow');
}

// 测试点92：验证类实例方法（原型方法）不被返回
export function Fn92_testClassProtoMethodExcluded() {
    class Test {
        constructor() {
            this.own = 'val';
        }

        protoMethod() {
        }
    }

    const inst = new Test();
    const result = Object.getOwnPropertyNames(inst);
    return result.includes('own') && !result.includes('protoMethod');
}

// 测试点93：验证数组使用reverse反转后返回索引与length
export function Fn93_testArrayReverse() {
    const arr = [1, 2, 3];
    arr.reverse();
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点94：验证对象键为数字字符串（含前导零）时按字符串排序
export function Fn94_testLeadingZeroNumberKeys() {
    const obj = { '001': 'a', '02': 'b', '3': 'c' }; // 前导零使其非有效数字键
    const result = Object.getOwnPropertyNames(obj);
    return JSON.stringify(result) === JSON.stringify(['001', '02', '3']);
}

// 测试点95：验证DataView修改值后仍返回自有属性
export function Fn95_testDataViewModify() {
    const buffer = new ArrayBuffer(4);
    const dv = new DataView(buffer);
    dv.setInt32(0, 12345);
    const result = Object.getOwnPropertyNames(dv);
    return result.includes('buffer') && result.includes('byteOffset');
}

// 测试点97：验证Promise.race返回的Promise实例仅返回自有属性
export function Fn97_testPromiseRaceInstance() {
    const racePromise = Promise.race([Promise.resolve(1), new Promise(() => {
    })]);
    const result = Object.getOwnPropertyNames(racePromise);
    return result.includes('constructor') && !result.includes('catch');
}

// 测试点98：验证数组使用sort排序后返回索引与length
export function Fn98_testArraySort() {
    const arr = [3, 1, 2];
    arr.sort();
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点99：验证对象键为Emoji时正确返回
export function Fn99_testEmojiKey() {
    const obj = { '😊': 'smile', '❤️': 'heart', '🔥': 'fire' };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('😊') && result.includes('❤️') && result.includes('🔥');
}

// 测试点100：验证ArrayBuffer复制（slice）后byteLength属性被返回
export function Fn100_testArrayBufferCopy() {
    const buffer = new ArrayBuffer(10);
    const copyBuffer = buffer.slice(0);
    const result = Object.getOwnPropertyNames(copyBuffer);
    return result.includes('byteLength') && copyBuffer.byteLength === 10;
}

// 测试点101：验证对象属性为Map实例时仍返回键名
export function Fn101_testMapValueProperty() {
    const obj = { map1: new Map([['k', 'v']]), map2: new Map() };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('map1') && result.includes('map2');
}

// 测试点102：验证对象属性为Set实例时仍返回键名
export function Fn102_testSetValueProperty() {
    const obj = { set1: new Set([1, 2]), set2: new Set() };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('set1') && result.includes('set2');
}

// 测试点104：验证数组使用concat合并后返回新索引与length
export function Fn104_testArrayConcat() {
    const arr1 = [1, 2];
    const arr2 = [3, 4];
    const concatArr = arr1.concat(arr2);
    const result = Object.getOwnPropertyNames(concatArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', 'length']);
}

// 测试点105：验证对象键为特殊Unicode字符时正确返回
export function Fn105_testUnicodeKey() {
    const obj = { 'ñ': 'n-tilde', 'ü': 'u-umlaut', 'é': 'e-acute' };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('ñ') && result.includes('ü') && result.includes('é');
}

// 测试点106：验证Generator函数执行next()后实例仍返回自有属性
export function Fn106_testGeneratorNext() {

    function* gen() {
        yield 'a';
        yield 'b';
    }

    const genInst = gen();
    genInst.next(); // 执行一次迭代
    const result = Object.getOwnPropertyNames(genInst);
    return result.includes('constructor') && !result.includes('value');
}

// 测试点107：验证对象使用Object.defineProperties添加不可枚举属性后被返回
export function Fn107_testDefineNonEnumerableProperty() {
    const obj = {};
    Object.defineProperties(obj, {
        enumProp: { value: 'enum', enumerable: true },
        nonEnumProp: { value: 'non-enum', enumerable: false }
    });
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('enumProp') && result.includes('nonEnumProp');
}

// 测试点108：验证空Promise实例（pending状态）返回自有属性
export function Fn108_testPendingPromise() {
    const pendingPromise = new Promise(() => {
    });
    const result = Object.getOwnPropertyNames(pendingPromise);
    return result.includes('constructor') && !result.includes('then');
}

// 测试点109：验证数组使用filter过滤后返回新索引与length
export function Fn109_testArrayFilter() {
    const arr = [1, 2, 3, 4];
    const filteredArr = arr.filter(item => item % 2 === 0);
    const result = Object.getOwnPropertyNames(filteredArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', 'length']);
}

// 测试点110：验证对象键为数字字符串与中文混合时的排序
export function Fn110_testMixedKeyTypeOrder() {
    const obj = { '2': 'num', '中文键': 'cn', '1': 'num1' };
    const result = Object.getOwnPropertyNames(obj);
    return JSON.stringify(result) === JSON.stringify(['1', '2', '中文键']);
}

// 测试点111：验证数组使用map映射后返回新索引与length
export function Fn111_testArrayMap() {
    const arr = [1, 2, 3];
    const mappedArr = arr.map(item => item * 2);
    const result = Object.getOwnPropertyNames(mappedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点112：验证对象键为带连字符的长数字字符串时按字符串排序
export function Fn112_testHyphenatedNumberKeys() {
    const obj = { '123-45': 'a', '67-8': 'b', '9': 'c' };
    const result = Object.getOwnPropertyNames(obj);
    return JSON.stringify(result) === JSON.stringify(['123-45', '67-8', '9']);
}

// 测试点114：验证对象属性为Error实例时仍返回键名
export function Fn114_testErrorValueProperty() {
    const obj = { err1: new Error('err1'), err2: new TypeError('err2') };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('err1') && result.includes('err2');
}

// 测试点115：验证TypedArray使用subarray截取后length属性正确
export function Fn115_testTypedArraySubarrayLength() {
    const typedArr = new Int8Array([1, 2, 3, 4]);
    const subArr = typedArr.subarray(1, 3);
    const result = Object.getOwnPropertyNames(subArr);
    return result.includes('length') && subArr.length === 2;
}

// 测试点116：验证对象使用Object.create创建（含原型属性）时仅返回自有属性
export function Fn116_testObjectCreateWithProto() {
    const proto = { protoProp: 'proto' };
    const obj = Object.create(proto, { ownProp: { value: 'own' } });
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('ownProp') && !result.includes('protoProp');
}

// 测试点118：验证数组使用reduce计算后原数组属性不变
export function Fn118_testArrayReduce() {
    const arr = [1, 2, 3];
    arr.reduce((acc, curr) => acc + curr, 0); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点119：验证对象键为特殊符号与字母混合时正确返回
export function Fn119_testMixedSymbolLetterKeys() {
    const obj = { 'a!b': 1, 'c@d': 2, 'e#f': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('a!b') && result.includes('c@d') && result.includes('e#f');
}

// 测试点120：验证Promise.resolve带对象参数时实例仍返回自有属性
export function Fn120_testPromiseResolveObj() {
    const promise = Promise.resolve({ key: 'val' });
    const result = Object.getOwnPropertyNames(promise);
    return result.includes('constructor') && !result.includes('key');
}

// 测试点121：验证DataView读取值后仍返回自有属性
export function Fn121_testDataViewRead() {
    const buffer = new ArrayBuffer(4);
    const dv = new DataView(buffer);
    dv.setUint32(0, 9876);
    dv.getUint32(0); // 读取值
    const result = Object.getOwnPropertyNames(dv);
    return result.includes('buffer') && result.includes('byteLength');
}

// 测试点122：验证对象属性为BigInt实例时仍返回键名
export function Fn122_testBigIntValueProperty() {
    const obj = { big1: 1234567890123456789n, big2: 9876543210987654321n };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('big1') && result.includes('big2');
}

// 测试点123：验证数组使用splice删除元素后返回剩余索引与length
export function Fn123_testArraySpliceDelete() {
    const arr = [1, 2, 3, 4];
    arr.splice(1, 2); // 删除2个元素
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', 'length']);
}

// 测试点125：验证对象键为数字字符串（含小数）时按字符串排序
export function Fn125_testDecimalStringKeys() {
    const obj = { '1.23': 'a', '4.5': 'b', '6': 'c' };
    const result = Object.getOwnPropertyNames(obj);
    return JSON.stringify(result) === JSON.stringify(['1.23', '4.5', '6']);
}

// 测试点127：验证对象使用Object.preventExtensions后修改现有属性值仍返回键名
export function Fn127_testPreventExtensionsModifyValue() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    obj.a = 100; // 允许修改值
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('a') && obj.a === 100;
}

// 测试点128：验证数组使用every判断后原数组属性不变
export function Fn128_testArrayEvery() {
    const arr = [2, 4, 6];
    arr.every(item => item % 2 === 0); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点129：验证对象键为Unicode表情符号组合时正确返回
export function Fn129_testCombinedEmojiKeys() {
    const obj = { '🇨🇳': 'china', '🏴󠁧󠁢󠁥󠁮󠁧󠁿': 'uk', '🇺🇸': 'usa' };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('🇨🇳') && result.includes('🏴󠁧󠁢󠁥󠁮󠁧󠁿') && result.includes('🇺🇸');
}

// 测试点132：验证TypedArray使用fill填充后返回索引与length
export function Fn132_testTypedArrayFill() {
    const typedArr = new Uint16Array(3);
    typedArr.fill(5);
    const result = Object.getOwnPropertyNames(typedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点133：验证对象使用Object.seal后修改属性值仍返回键名
export function Fn133_testSealedObjectModifyValue() {
    const obj = { b: 2 };
    Object.seal(obj);
    obj.b = 200; // 允许修改值
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('b') && obj.b === 200;
}

// 测试点134：验证数组使用some判断后原数组属性不变
export function Fn134_testArraySome() {
    const arr = [1, 3, 5];
    arr.some(item => item % 2 === 0); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点135：验证对象键为带下划线的数字字符串时正确返回
export function Fn135_testUnderscoredNumberKeys() {
    const obj = { '1_000': 'a', '200_000': 'b', '3_500': 'c' };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('1_000') && result.includes('200_000') && result.includes('3_500');
}

// 测试点138：验证数组使用flat扁平化后返回新索引与length
export function Fn138_testArrayFlat() {
    const arr = [1, [2, 3], [4, [5]]];
    const flatArr = arr.flat(2);
    const result = Object.getOwnPropertyNames(flatArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', '4', 'length']);
}

// 测试点139：验证对象键为特殊控制字符（如\n）时正确返回
export function Fn139_testControlCharKeys() {
    const obj = { '\n': 'newline', '\t': 'tab', '\r': 'carriage' };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('\n') && result.includes('\t') && result.includes('\r');
}

// 测试点140：验证Promise.reject带Error实例时返回自有属性
export function Fn140_testPromiseRejectError() {
    const promise = Promise.reject(new Error('reject err'));
    const result = Object.getOwnPropertyNames(promise);
    return result.includes('constructor') && !result.includes('message');
}
// 测试点141：验证数组使用flatMap映射扁平化后返回新索引与length
export function Fn141_testArrayFlatMap() {
    const arr = [1, 2, 3];
    const flatMapArr = arr.flatMap(item => [item, item * 2]);
    const result = Object.getOwnPropertyNames(flatMapArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', '4', '5', 'length']);
}

// 测试点142：验证对象键为带括号的字符串时正确返回
export function Fn142_testParenthesesKeys() {
    const obj = { '(key1)': 1, 'key(2)': 2, 'key(3)val': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('(key1)') && result.includes('key(2)') && result.includes('key(3)val');
}

// 测试点145：验证TypedArray使用copyWithin复制后返回索引与length
export function Fn145_testTypedArrayCopyWithin() {
    const typedArr = new Uint8Array([1, 2, 3, 4, 5]);
    typedArr.copyWithin(0, 3);
    const result = Object.getOwnPropertyNames(typedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', '4', 'length']);
}

// 测试点146：验证对象使用Object.create(null)添加属性后返回该属性
export function Fn146_testObjectCreateNullAddProp() {
    const obj = Object.create(null);
    obj.ownProp = 'test';
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('ownProp') && result.length === 1;
}

// 测试点148：验证数组使用find查找后原数组属性不变
export function Fn148_testArrayFind() {
    const arr = [10, 20, 30];
    arr.find(item => item > 15); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点149：验证对象键为带斜杠的字符串时正确返回
export function Fn149_testSlashInKeys() {
    const obj = { 'key/1': 1, 'key/2/val': 2, '/key3': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key/1') && result.includes('key/2/val') && result.includes('/key3');
}

// 测试点150：验证Promise.allSettled返回的Promise实例仅返回自有属性
export function Fn150_testPromiseAllSettled() {
    const promise = Promise.allSettled([Promise.resolve(1), Promise.reject(2)]);
    const result = Object.getOwnPropertyNames(promise);
    return result.includes('constructor') && !result.includes('then');
}

// 测试点151：验证DataView使用不同字节偏移读取后仍返回自有属性
export function Fn151_testDataViewByteOffset() {
    const buffer = new ArrayBuffer(8);
    const dv = new DataView(buffer, 2); // 字节偏移2
    dv.setInt16(0, 123);
    const result = Object.getOwnPropertyNames(dv);
    return result.includes('buffer') && result.includes('byteOffset');
}

// 测试点152：验证对象属性为RegExp实例时仍返回键名
export function Fn152_testRegExpValueProperty() {
    const obj = { reg1: /abc/, reg2: /def/gim };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('reg1') && result.includes('reg2');
}

// 测试点153：验证数组使用findIndex查找后原数组属性不变
export function Fn153_testArrayFindIndex() {
    const arr = [5, 10, 15];
    arr.findIndex(item => item === 10); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点155：验证对象键为带冒号的字符串时正确返回
export function Fn155_testColonInKeys() {
    const obj = { 'key:1': 1, 'type:json': 2, 'user:name': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key:1') && result.includes('type:json') && result.includes('user:name');
}

// 测试点158：验证数组使用forEach遍历后原数组属性不变
export function Fn158_testArrayForEach() {
    const arr = [1, 2, 3];
    const temp = [];
    arr.forEach(item => temp.push(item)); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点159：验证对象键为带引号的字符串时正确返回
export function Fn159_testQuotesInKeys() {
    const obj = { '"key1"': 1, 'key"2"': 2, 'key"3"val': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('"key1"') && result.includes('key"2"') && result.includes('key"3"val');
}

// 测试点160：验证ArrayBuffer使用slice指定偏移和长度后返回自有属性
export function Fn160_testArrayBufferSliceOffsetLength() {
    const buffer = new ArrayBuffer(10);
    const sliced = buffer.slice(2, 6); // 偏移2，长度4
    const result = Object.getOwnPropertyNames(sliced);
    return result.includes('byteLength') && sliced.byteLength === 4;
}

// 测试点162：验证TypedArray使用reverse反转后返回索引与length
export function Fn162_testTypedArrayReverse() {
    const typedArr = new Int32Array([1, 2, 3]);
    typedArr.reverse();
    const result = Object.getOwnPropertyNames(typedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点164：验证数组使用join拼接后原数组属性不变
export function Fn164_testArrayJoin() {
    const arr = ['a', 'b', 'c'];
    arr.join('-'); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点165：验证对象键为带星号的字符串时正确返回
export function Fn165_testAsteriskInKeys() {
    const obj = { '*key': 1, 'key*': 2, 'key*val': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('*key') && result.includes('key*') && result.includes('key*val');
}

// 测试点168：验证数组使用slice截取后返回新索引与length
export function Fn168_testArraySlice() {
    const arr = [1, 2, 3, 4];
    const slicedArr = arr.slice(1, 3);
    const result = Object.getOwnPropertyNames(slicedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', 'length']);
}

// 测试点169：验证对象键为带等号的字符串时正确返回
export function Fn169_testEqualsInKeys() {
    const obj = { 'key=1': 1, 'key=val': 2, 'a=b=c': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key=1') && result.includes('key=val') && result.includes('a=b=c');
}

// 测试点170：验证Promise.any返回的Promise实例仅返回自有属性
export function Fn170_testPromiseAny() {
    const promise = Promise.any([Promise.reject(1), Promise.resolve(2)]);
    const result = Object.getOwnPropertyNames(promise);
    return result.includes('constructor') && !result.includes('catch');
}

// 测试点171：验证数组使用toReversed反转后返回新数组属性
export function Fn171_testArrayToReversed() {
    const arr = [1, 2, 3];
    const reversedArr = arr.toReversed(); // 不修改原数组的反转方法
    const result = Object.getOwnPropertyNames(reversedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点172：验证对象键为带百分号的字符串时正确返回
export function Fn172_testPercentInKeys() {
    const obj = { 'key%1': 1, '%key2': 2, 'key%val': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key%1') && result.includes('%key2') && result.includes('key%val');
}

// 测试点175：验证TypedArray使用toSorted排序后返回新数组属性
export function Fn175_testTypedArrayToSorted() {
    const typedArr = new Uint16Array([3, 1, 2]);
    const sortedArr = typedArr.toSorted();
    const result = Object.getOwnPropertyNames(sortedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点178：验证数组使用toSpliced删除元素后返回新数组属性
export function Fn178_testArrayToSpliced() {
    const arr = [1, 2, 3, 4];
    const splicedArr = arr.toSpliced(1, 2); // 不修改原数组的splice
    const result = Object.getOwnPropertyNames(splicedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', 'length']);
}

// 测试点179：验证对象键为带ampersand（&）的字符串时正确返回
export function Fn179_testAmpersandInKeys() {
    const obj = { 'key&1': 1, 'a&b': 2, 'key&val': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key&1') && result.includes('a&b') && result.includes('key&val');
}

// 测试点181：验证DataView使用toLocaleString后仍返回自有属性
export function Fn181_testDataViewToLocaleString() {
    const buffer = new ArrayBuffer(4);
    const dv = new DataView(buffer);
    dv.setInt32(0, 1234);
    dv.toLocaleString(); // 调用实例方法
    const result = Object.getOwnPropertyNames(dv);
    return result.includes('buffer') && result.includes('byteLength');
}

// 测试点183：验证数组使用with修改元素后返回新数组属性
export function Fn183_testArrayWith() {
    const arr = [1, 2, 3];
    const newArr = arr.with(1, 99); // 不修改原数组的修改方法
    const result = Object.getOwnPropertyNames(newArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点185：验证对象键为带plus（+）的字符串时正确返回
export function Fn185_testPlusInKeys() {
    const obj = { 'key+1': 1, 'a+b': 2, '+key': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key+1') && result.includes('a+b') && result.includes('+key');
}

// 测试点187：验证对象使用Object.defineProperties添加getter后返回该属性
export function Fn187_testDefineGetterProperty() {
    const obj = {};
    Object.defineProperties(obj, {
        getVal: { get() { return 10; }, enumerable: true }
    });
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('getVal');
}

// 测试点188：验证数组使用entries遍历后原数组属性不变
export function Fn188_testArrayEntries() {
    const arr = [1, 2, 3];
    [...arr.entries()]; // 遍历entries
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点189：验证对象键为带question（?）的字符串时正确返回
export function Fn189_testQuestionInKeys() {
    const obj = { 'key?1': 1, 'isValid?': 2, '?key': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key?1') && result.includes('isValid?') && result.includes('?key');
}

// 测试点190：验证ArrayBuffer使用toLocaleString后仍返回自有属性
export function Fn190_testArrayBufferToLocaleString() {
    const buffer = new ArrayBuffer(8);
    buffer.toLocaleString(); // 调用实例方法
    const result = Object.getOwnPropertyNames(buffer);
    return result.includes('byteLength') && result.includes('constructor');
}

// 测试点191：验证对象属性为ArrayBuffer实例时仍返回键名
export function Fn191_testArrayBufferValueProp() {
    const obj = { buf1: new ArrayBuffer(4), buf2: new ArrayBuffer(8) };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('buf1') && result.includes('buf2');
}

// 测试点192：验证TypedArray使用with修改元素后返回新数组属性
export function Fn192_testTypedArrayWith() {
    const typedArr = new Int8Array([1, 2, 3]);
    const newTypedArr = typedArr.with(2, 99);
    const result = Object.getOwnPropertyNames(newTypedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点194：验证数组使用keys遍历后原数组属性不变
export function Fn194_testArrayKeys() {
    const arr = [10, 20, 30];
    [...arr.keys()]; // 遍历keys
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点195：验证对象键为带exclamation（!）的字符串时正确返回
export function Fn195_testExclamationInKeys() {
    const obj = { 'key!1': 1, '!key': 2, 'valid!': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key!1') && result.includes('!key') && result.includes('valid!');
}

// 测试点197：验证对象属性为DataView实例时仍返回键名
export function Fn197_testDataViewValueProp() {
    const buffer = new ArrayBuffer(4);
    const obj = { dv1: new DataView(buffer), dv2: new DataView(buffer, 1) };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('dv1') && result.includes('dv2');
}

// 测试点198：验证数组使用values遍历后原数组属性不变
export function Fn198_testArrayValues() {
    const arr = ['a', 'b', 'c'];
    [...arr.values()]; // 遍历values
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', 'length']);
}

// 测试点199：验证对象键为带underscore（_）的中文键时正确返回
export function Fn199_testUnderscoreChineseKeys() {
    const obj = { '姓名_1': '张三', '年龄_2': 20, '_地址': '北京' };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('姓名_1') && result.includes('年龄_2') && result.includes('_地址');
}

// 测试点200：验证Promise实例调用finally后仍返回自有属性
export function Fn200_testPromiseFinally() {
    const promise = Promise.resolve(123).finally(() => {});
    const result = Object.getOwnPropertyNames(promise);
    return result.includes('constructor') && !result.includes('finally');
}

// 测试点201：验证数组使用flatMap嵌套映射后返回新索引与length
export function Fn201_testArrayNestedFlatMap() {
    const arr = [[1], [2, 3], [4, 5, 6]];
    const flatMapArr = arr.flatMap(item => item.map(num => num * 2));
    const result = Object.getOwnPropertyNames(flatMapArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', '4', '5', 'length']);
}

// 测试点202：验证对象键为带方括号的字符串时正确返回
export function Fn202_testBracketsInKeys() {
    const obj = { 'key[1]': 1, 'arr[0]': 2, '[key]': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key[1]') && result.includes('arr[0]') && result.includes('[key]');
}

// 测试点205：验证TypedArray使用copyWithin跨位置复制后返回索引与length
export function Fn205_testTypedArrayCrossCopyWithin() {
    const typedArr = new Uint32Array([1, 2, 3, 4, 5]);
    typedArr.copyWithin(2, 0, 2); // 从索引0复制2个元素到索引2
    const result = Object.getOwnPropertyNames(typedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', '4', 'length']);
}

// 测试点206：验证对象使用Object.preventExtensions后修改Symbol属性值不影响返回结果
export function Fn206_testPreventExtensionsModifySymbol() {
    const sym = Symbol('test');
    const obj = { a: 1, [sym]: 2 };
    Object.preventExtensions(obj);
    obj[sym] = 3; // 修改Symbol属性值
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('a') && result.length === 1;
}

// 测试点208：验证数组使用findLast查找后原数组属性不变
export function Fn208_testArrayFindLast() {
    const arr = [10, 20, 30, 40];
    arr.findLast(item => item > 25); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', 'length']);
}

// 测试点209：验证对象键为带花括号的字符串时正确返回
export function Fn209_testBracesInKeys() {
    const obj = { 'key{1}': 1, '{key}': 2, 'obj{prop}': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('key{1}') && result.includes('{key}') && result.includes('obj{prop}');
}

// 测试点210：验证Promise.resolve带Promise实例时返回的Promise仍仅含自有属性
export function Fn210_testPromiseResolvePromise() {
    const innerPromise = Promise.resolve(5);
    const outerPromise = Promise.resolve(innerPromise);
    const result = Object.getOwnPropertyNames(outerPromise);
    return result.includes('constructor') && !result.includes('then');
}

// 测试点211：验证DataView使用不同数据类型写入后仍返回自有属性
export function Fn211_testDataViewMultiTypeWrite() {
    const buffer = new ArrayBuffer(8);
    const dv = new DataView(buffer);
    dv.setInt8(0, 127);
    dv.setFloat32(4, 3.14);
    const result = Object.getOwnPropertyNames(dv);
    return result.includes('buffer') && result.includes('byteLength');
}

// 测试点212：验证对象属性为Generator实例时仍返回键名
export function Fn212_testGeneratorValueProperty() {
    function* gen1() { yield 1; }
    function* gen2() { yield* [2, 3]; }
    const obj = { genA: gen1(), genB: gen2() };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('genA') && result.includes('genB');
}

// 测试点213：验证数组使用findLastIndex查找后原数组属性不变
export function Fn213_testArrayFindLastIndex() {
    const arr = [5, 10, 15, 20];
    arr.findLastIndex(item => item % 10 === 0); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', 'length']);
}

// 测试点215：验证对象键为带at符号（@）的中文时正确返回
export function Fn215_testAtSymbolChineseKeys() {
    const obj = { '@姓名': '李四', '邮箱@': 'test@example.com', '用户@ID': 123 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('@姓名') && result.includes('邮箱@') && result.includes('用户@ID');
}

// 测试点217：验证对象使用Object.defineProperties添加setter后返回该属性
export function Fn217_testDefineSetterProperty() {
    let val = 0;
    const obj = {};
    Object.defineProperties(obj, {
        setVal: { set(v) { val = v; }, enumerable: false }
    });
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('setVal');
}

// 测试点218：验证数组使用reduceRight计算后原数组属性不变
export function Fn218_testArrayReduceRight() {
    const arr = [1, 2, 3, 4];
    arr.reduceRight((acc, curr) => acc - curr, 0); // 不修改原数组
    const result = Object.getOwnPropertyNames(arr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', 'length']);
}

// 测试点219：验证对象键为带美元符号（$）的字符串时正确返回
export function Fn219_testDollarInKeys() {
    const obj = { '$key': 1, 'key$': 2, 'user$id': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('$key') && result.includes('key$') && result.includes('user$id');
}

// 测试点221：验证对象属性为WeakMap实例时仍返回键名
export function Fn221_testWeakMapValueProperty() {
    const obj = { wm1: new WeakMap([[{ key1: 1 }, 'val1']]), wm2: new WeakMap() };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('wm1') && result.includes('wm2');
}

// 测试点222：验证TypedArray使用sort排序后返回索引与length
export function Fn222_testTypedArraySort() {
    const typedArr = new Int16Array([5, 2, 8, 1]);
    typedArr.sort();
    const result = Object.getOwnPropertyNames(typedArr);
    return JSON.stringify(result) === JSON.stringify(['0', '1', '2', '3', 'length']);
}

// 测试点224：验证数组使用some判断空数组后属性不变
export function Fn224_testArraySomeEmpty() {
    const emptyArr = [];
    emptyArr.some(item => item > 0); // 空数组返回false，不修改数组
    const result = Object.getOwnPropertyNames(emptyArr);
    return JSON.stringify(result) === JSON.stringify(['length']);
}

// 测试点225：验证对象键为带井号（#）的字符串时正确返回
export function Fn225_testHashInKeys() {
    const obj = { '#key': 1, 'key#tag': 2, 'tag#1': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('#key') && result.includes('key#tag') && result.includes('tag#1');
}

// 测试点227：验证对象属性为WeakSet实例时仍返回键名
export function Fn227_testWeakSetValueProperty() {
    const obj = { ws1: new WeakSet([{ val: 1 }, { val: 2 }]), ws2: new WeakSet() };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('ws1') && result.includes('ws2');
}

// 测试点228：验证数组使用filter过滤空数组后返回空数组属性
export function Fn228_testArrayFilterEmpty() {
    const emptyArr = [];
    const filteredArr = emptyArr.filter(item => item);
    const result = Object.getOwnPropertyNames(filteredArr);
    return JSON.stringify(result) === JSON.stringify(['length']);
}

// 测试点229：验证对象键为带波浪号（~）的字符串时正确返回
export function Fn229_testTildeInKeys() {
    const obj = { '~key': 1, 'key~val': 2, 'val~1': 3 };
    const result = Object.getOwnPropertyNames(obj);
    return result.includes('~key') && result.includes('key~val') && result.includes('val~1');
}

// 测试点230：验证Promise.reject带非Error值时返回的Promise仍仅含自有属性
export function Fn230_testPromiseRejectNonError() {
    const promise = Promise.reject('non-error message');
    const result = Object.getOwnPropertyNames(promise);
    return result.includes('constructor') && !result.includes('catch');
}

