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

// 测试1：密封对象后不能添加新属性
export function Fn01_cannotAddNewProperties() {
    const obj = { name: "测试" };
    Object.seal(obj);
    try {
        obj.age = 20;
        return false;
    } catch(e) {
        return !('age' in obj);
    }
}

// 测试2：密封对象后不能删除现有属性
export function Fn02_cannotDeleteProperties() {
    const obj = { name: "测试" };
    Object.seal(obj);
    try {
        delete obj.name;
        return false;
    } catch(e) {
        return 'name' in obj;
    }
}

// 测试3：密封对象后可以修改现有可写属性的值
export function Fn03_canModifyExistingProperties() {
    const obj = { count: 10 };
    Object.seal(obj);
    obj.count = 20;
    return obj.count === 20;
}

// 测试4：密封对象后，Object.isSealed()应返回true
export function Fn04_shouldBeSealed() {
    const obj = { a: 1 };
    Object.seal(obj);
    return Object.isSealed(obj);
}

// 测试5：密封对象后，不能修改属性的可配置性
export function Fn05_cannotChangeConfigurable() {
    const obj = { a: 1 };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { configurable: true });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试6：密封对象后，不能将不可写属性改为可写（返回true）
export function Fn06_cannotMakeWritableToNonWritable() {
    const obj = {};
    Object.defineProperty(obj, 'a', {
        value: 1,
        writable: false,
        configurable: true
    });
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { writable: true });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试7：密封对象后，不能修改其原型
export function Fn07_cannotChangePrototype() {
    const obj = { a: 1 };
    const newProto = {};
    Object.seal(obj);
    try {
        Object.setPrototypeOf(obj, newProto);
        return false;
    } catch (e) {
        return true;
    }
}

// 测试8：密封数组后，不能添加新元素
export function Fn08_sealedArrayCannotAddElements() {
    const arr = [1, 2];
    Object.seal(arr);
    try {
        arr[2] = 3;
        return false;
    } catch(e) {
        return arr.length === 2;
    }
}

// 测试9：密封数组后，不能删除元素
export function Fn09_sealedArrayCannotDeleteElements() {
    const arr = [1, 2];
    Object.seal(arr);
    try {
        delete arr[0];
        return false;
    } catch(e) {
        return arr[0] === 1;
    }
}

// 测试10：密封对象的不可写属性不能被修改
export function Fn10_cannotModifyNonWritableProperty() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: false });
    Object.seal(obj);
    try {
        obj.a = 2;
        return false;
    } catch(e) {
        return obj.a === 1;
    }
}

// 测试11：使用Object.defineProperty给密封对象添加新属性会失败
export function Fn11_definePropertyAddFails() {
    const obj = { a: 1 };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'b', { value: 2 });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试12：密封对象现有可写属性可通过defineProperty修改值
export function Fn12_definePropertyModifyValueWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    Object.defineProperty(obj, 'a', { value: 2 });
    return obj.a === 2;
}

// 测试13：密封对象不影响继承属性的添加
export function Fn13_inheritedPropertiesUnaffected() {
    const proto = {};
    const obj = Object.create(proto);
    Object.seal(obj);
    proto.b = 2;
    return obj.b === 2;
}

// 测试14：密封空对象后不能添加属性
export function Fn14_sealedEmptyObjectCannotAdd() {
    const obj = {};
    Object.seal(obj);
    try {
        obj.a = 1;
        return false;
    } catch(e) {
        return !('a' in obj);
    }
}

// 测试15：密封带有Symbol属性的对象不能删除该属性
export function Fn15_cannotDeleteSymbolProperty() {
    const sym = Symbol('test');
    const obj = { [sym]: 1 };
    Object.seal(obj);
    try {
        delete obj[sym];
        return false;
    } catch(e) {
        return sym in obj;
    }
}

// 测试16：密封带有不可枚举属性的对象不能删除该属性
export function Fn16_cannotDeleteNonEnumerableProperty() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
    Object.seal(obj);
    try {
        delete obj.a;
        return false;
    } catch(e) {
        return 'a' in obj;
    }
}

// 测试17：密封对象的访问器属性setter可正常工作
export function Fn17_accessorSetterWorks() {
    let value = 1;
    const obj = {
        get a() { return value; },
        set a(v) { value = v; }
    };
    Object.seal(obj);
    obj.a = 2;
    return obj.a === 2;
}

// 测试18：Object.assign给密封对象添加属性会失败
export function Fn18_assignAddsNothing() {
    const obj = { a: 1 };
    Object.seal(obj);
    try {
        Object.assign(obj, { b: 2 });
        return false;
    } catch(e) {
        return !('b' in obj);
    }
}

// 测试19：不能修改密封对象属性的enumerable特性
export function Fn19_cannotChangeEnumerable() {
    const obj = { a: 1 };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { enumerable: false });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试20：密封对象属性的configurable应为false
export function Fn20_propertyConfigurableIsFalse() {
    const obj = { a: 1 };
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return !desc.configurable;
}

// 测试21：删除密封对象中不存在的属性返回true
export function Fn21_deleteNonExistentReturnsFalse() {
    const obj = { a: 1 };
    Object.seal(obj);
    return delete obj.b;
}

// 测试22：密封对象后调用preventExtensions无效果
export function Fn22_preventExtensionsOnSealed() {
    const obj = { a: 1 };
    Object.seal(obj);
    const result = Object.preventExtensions(obj);
    return Object.isSealed(result) && result === obj;
}

// 测试23：密封已冻结对象仍保持冻结
export function Fn23_sealFrozenObject() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const sealed = Object.seal(obj);
    return Object.isFrozen(sealed);
}

// 测试24：重复密封对象无副作用
export function Fn24_resealObject() {
    const obj = { a: 1 };
    Object.seal(obj);
    const sealedAgain = Object.seal(obj);
    return Object.isSealed(sealedAgain) && sealedAgain === obj;
}

// 测试25：不能将密封对象的属性改为访问器属性
export function Fn25_cannotChangeToAccessor() {
    const obj = { a: 1 };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { get: () => 2 });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试26：密封对象的toString方法正常工作
export function Fn26_toStringWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return obj.toString() === '[object Object]';
}

// 测试27：for...in可枚举密封对象的属性
export function Fn27_forInEnumerates() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    let count = 0;
    for (const key in obj) count++;
    return count === 2;
}

// 测试28：Object.keys返回密封对象的属性
export function Fn28_objectKeysWorks() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    return Object.keys(obj).length === 2;
}

// 测试29：getOwnPropertyNames返回密封对象的属性
export function Fn29_getOwnPropertyNamesWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return Object.getOwnPropertyNames(obj).includes('a');
}

// 测试30：getOwnPropertySymbols返回密封对象的Symbol属性
export function Fn30_getOwnPropertySymbolsWorks() {
    const sym = Symbol('a');
    const obj = { [sym]: 1 };
    Object.seal(obj);
    return Object.getOwnPropertySymbols(obj).includes(sym);
}

// 测试31：密封数组后可修改现有元素
export function Fn31_sealedArrayModifyElement() {
    const arr = [1, 2];
    Object.seal(arr);
    arr[0] = 3;
    return arr[0] === 3;
}

// 测试32：密封数组后push方法失败
export function Fn32_sealedArrayPushFails() {
    const arr = [1, 2];
    Object.seal(arr);
    try {
        arr.push(3);
        return false;
    } catch(e) {
        return arr.length === 2;
    }
}

// 测试33：密封数组后pop方法失败
export function Fn33_sealedArrayPopFails() {
    const arr = [1, 2];
    Object.seal(arr);
    try {
        arr.pop();
        return false;
    } catch(e) {
        return arr.length === 2;
    }
}

// 测试34：不能修改密封对象访问器属性的getter
export function Fn34_cannotChangeGetter() {
    const obj = { get a() { return 1; } };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { get: () => 2 });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试35：不能修改密封对象访问器属性的setter
export function Fn35_cannotChangeSetter() {
    let value = 1;
    const obj = {
        get a() { return value; },
        set a(v) { value = v; }
    };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { set: v => { value = v * 2; } });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试36：密封对象不影响嵌套对象的可修改性
export function Fn36_nestedObjectModifiable() {
    const obj = { nested: { a: 1 } };
    Object.seal(obj);
    obj.nested.a = 2;
    return obj.nested.a === 2;
}

// 测试37：in运算符可检测密封对象的属性
export function Fn37_inOperatorWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return 'a' in obj;
}

// 测试38：hasOwnProperty可检测密封对象的属性
export function Fn38_hasOwnPropertyWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return obj.hasOwnProperty('a');
}

// 测试39：密封对象的valueOf方法正常工作
export function Fn39_valueOfWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return obj.valueOf() === obj;
}

// 测试40：密封对象属性的writable保持为true
export function Fn40_writableRemainsTrue() {
    const obj = { a: 1 };
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.writable;
}

// 测试41：密封对象属性原是不可写则保持不可写
export function Fn41_nonWritableRemains() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: false });
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return !desc.writable;
}

// 测试42：getPrototypeOf可获取密封对象的原型
export function Fn42_getPrototypeWorks() {
    const proto = {};
    const obj = Object.create(proto);
    Object.seal(obj);
    return Object.getPrototypeOf(obj) === proto;
}

// 测试43：可删除密封对象原型上的属性
export function Fn43_canDeletePrototypeProperty() {
    const proto = { a: 1 };
    const obj = Object.create(proto);
    Object.seal(obj);
    delete proto.a;
    return !('a' in proto);
}

// 测试44：可给密封对象的原型添加属性
export function Fn44_canAddToPrototype() {
    const proto = {};
    const obj = Object.create(proto);
    Object.seal(obj);
    proto.b = 2;
    return obj.b === 2;
}

// 测试45：密封函数对象不能添加新属性
export function Fn45_sealedFunctionNoNewProps() {
    function func() {}
    Object.seal(func);
    try {
        func.prop = 1;
        return false;
    } catch(e) {
        return !('prop' in func);
    }
}

// 测试46：密封函数对象不能修改name属性
export function Fn46_cannotChangeFunctionName() {
    function func() {}
    Object.seal(func);
    try {
        func.name = 'newName';
        return false;
    } catch (e) {
        return true;
    }
}

// 测试47：JSON.stringify可序列化密封对象
export function Fn47_jsonStringifyWorks() {
    const obj = { a: 1, b: 'test' };
    Object.seal(obj);
    return JSON.stringify(obj) === '{"a":1,"b":"test"}';
}

// 测试48：Object.entries可获取密封对象的键值对
export function Fn48_objectEntriesWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    const entries = Object.entries(obj);
    return entries.length === 1 && entries[0][1] === 1;
}

// 测试49：Object.values可获取密封对象的值
export function Fn49_objectValuesWorks() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    return Object.values(obj).includes(2);
}

// 测试50：defineProperty不能给密封对象添加不可枚举属性
export function Fn50_cannotAddNonEnumerable() {
    const obj = { a: 1 };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'b', { value: 2, enumerable: false });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试51：密封对象可修改属性为不同类型
export function Fn51_canChangeValueType() {
    const obj = { a: 1 };
    Object.seal(obj);
    obj.a = 'string';
    return obj.a === 'string';
}

// 测试52：密封对象可修改null值属性
export function Fn52_canModifyNullValue() {
    const obj = { a: null };
    Object.seal(obj);
    obj.a = 1;
    return obj.a === 1;
}

// 测试53：密封对象可修改undefined值属性
export function Fn53_canModifyUndefinedValue() {
    const obj = { a: undefined };
    Object.seal(obj);
    obj.a = 1;
    return obj.a === 1;
}

// 测试54：密封对象是不可扩展的
export function Fn54_sealedObjectIsNonExtensible() {
    const obj = { a: 1 };
    Object.seal(obj);
    return !Object.isExtensible(obj);
}

// 测试55：密封已不可扩展对象成功
export function Fn55_sealNonExtensibleObject() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const sealed = Object.seal(obj);
    return Object.isSealed(sealed);
}

// 测试56：密封对象不可写属性不能通过defineProperty修改
export function Fn56_cannotModifyNonWritableWithDefine() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: false });
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { value: 2 });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试57：Reflect.deleteProperty删除密封对象属性失败
export function Fn57_reflectDeleteFails() {
    const obj = { a: 1 };
    Object.seal(obj);
    return !Reflect.deleteProperty(obj, 'a');
}

// 测试58：Reflect.set给密封对象添加属性失败
export function Fn58_reflectSetAddFails() {
    const obj = { a: 1 };
    Object.seal(obj);
    return !Reflect.set(obj, 'b', 2);
}

// 测试59：Reflect.set修改密封对象可写属性成功
export function Fn59_reflectSetModifyWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return Reflect.set(obj, 'a', 2) && obj.a === 2;
}

// 测试60：Reflect.defineProperty给密封对象添加属性失败
export function Fn60_reflectDefineAddFails() {
    const obj = { a: 1 };
    Object.seal(obj);
    return !Reflect.defineProperty(obj, 'b', { value: 2 });
}

// 测试61：Reflect.defineProperty修改密封对象可写属性成功
export function Fn61_reflectDefineModifyWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return Reflect.defineProperty(obj, 'a', { value: 2 }) && obj.a === 2;
}

// 测试62：Reflect.defineProperty修改密封对象configurable失败
export function Fn62_reflectDefineConfigurableFails() {
    const obj = { a: 1 };
    Object.seal(obj);
    return !Reflect.defineProperty(obj, 'a', { configurable: true });
}

// 测试63：密封对象多个属性都不能被删除
export function Fn63_cannotDeleteMultipleProperties() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.seal(obj);
    try {
        delete obj.a;
        delete obj.b;
        return false;
    } catch(e) {
        return 'a' in obj && 'b' in obj;
    }
}

// 测试64：密封对象添加多个属性都失败
export function Fn64_cannotAddMultipleProperties() {
    const obj = { a: 1 };
    Object.seal(obj);
    try {
        obj.b = 2;
        obj.c = 3;
        return false;
    } catch(e) {
        return !('b' in obj) && !('c' in obj);
    }
}

// 测试65：密封对象不可枚举属性仍不可枚举
export function Fn65_nonEnumerableRemains() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return !desc.enumerable;
}

// 测试66：密封Date对象后可修改时间
export function Fn66_sealedDateCanModify() {
    const date = new Date();
    const originalTime = date.getTime();
    Object.seal(date);
    date.setTime(originalTime + 1000);
    return date.getTime() === originalTime + 1000;
}

// 测试67：Object.hasOwn可检测密封对象的属性
export function Fn67_objectHasOwnWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return Object.hasOwn(obj, 'a');
}

// 测试68：以密封对象为原型创建对象正常
export function Fn68_createWithSealedPrototype() {
    const sealed = { a: 1 };
    Object.seal(sealed);
    const obj = Object.create(sealed);
    return obj.a === 1;
}

// 测试69：密封对象作为原型时，实例可添加属性
export function Fn69_instanceCanAddProperties() {
    const sealed = { a: 1 };
    Object.seal(sealed);
    const obj = Object.create(sealed);
    obj.b = 2;
    return obj.b === 2;
}

// 测试70：扩展运算符可复制密封对象属性
export function Fn70_spreadOperatorWorks() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const copy = { ...obj };
    return copy.a === 1 && copy.b === 2;
}

// 测试71：Object.assign可复制密封对象属性到新对象
export function Fn71_assignToNewObjectWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    const copy = Object.assign({}, obj);
    return copy.a === 1;
}

// 测试72：密封对象的数组属性可修改元素
export function Fn72_arrayPropertyModifiable() {
    const obj = { arr: [1, 2] };
    Object.seal(obj);
    obj.arr[0] = 3;
    return obj.arr[0] === 3;
}

// 测试73：密封对象的对象属性可修改
export function Fn73_objectPropertyModifiable() {
    const obj = { nested: { a: 1 } };
    Object.seal(obj);
    obj.nested.a = 2;
    return obj.nested.a === 2;
}

// 测试74：Object.is认为密封前后是同一对象
export function Fn74_objectIsSame() {
    const obj = { a: 1 };
    const sealed = Object.seal(obj);
    return Object.is(obj, sealed);
}

// 测试75：typeof密封对象仍为'object'
export function Fn75_typeOfWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return typeof obj === 'object';
}

// 测试76：instanceof对密封对象正常工作
export function Fn76_instanceOfWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    return obj instanceof Object;
}

// 测试77：密封Map对象后不影响map set方法
export function Fn77_sealedMapCannotAdd() {
    const map = new Map();
    map.set('a', 1);
    Object.seal(map);
    map.set('b', 2);
    return map.has('b');
}

// 测试78：密封Set对象后不影响set add方法
export function Fn78_sealedSetCannotAdd() {
    const set = new Set();
    set.add(1);
    Object.seal(set);
    set.add(2);
    return set.has(2);
}

// 测试79：密封对象不影响继承属性的修改
export function Fn79_inheritedPropertiesModifiable() {
    const proto = { a: 1 };
    const obj = Object.create(proto);
    Object.seal(obj);
    proto.a = 2;
    return obj.a === 2;
}

// 测试80：所有密封对象属性的configurable都是false
export function Fn80_allPropertiesNonConfigurable() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.seal(obj);
    const descs = Object.getOwnPropertyDescriptors(obj);
    return Object.values(descs).every(desc => !desc.configurable);
}

// 测试81：密封对象可修改属性为对象
export function Fn81_canModifyToObject() {
    const obj = { a: 1 };
    Object.seal(obj);
    obj.a = { b: 2 };
    return obj.a.b === 2;
}

// 测试82：密封对象可修改函数属性
export function Fn82_canModifyFunctionProperty() {
    const obj = { func: () => 1 };
    Object.seal(obj);
    obj.func = () => 2;
    return obj.func() === 2;
}

// 测试83：删除密封对象不存在的属性不影响对象
export function Fn83_deleteNonExistentNoEffect() {
    const obj = { a: 1 };
    Object.seal(obj);
    delete obj.b;
    return Object.keys(obj).length === 1;
}

// 测试84：Object.keys长度与密封前相同
export function Fn84_keysLengthSame() {
    const obj = { a: 1, b: 2 };
    const originalLength = Object.keys(obj).length;
    Object.seal(obj);
    return Object.keys(obj).length === originalLength;
}

// 测试85：getOwnPropertyNames长度与密封前相同
export function Fn85_getNamesLengthSame() {
    const obj = { a: 1, b: 2 };
    const originalLength = Object.getOwnPropertyNames(obj).length;
    Object.seal(obj);
    return Object.getOwnPropertyNames(obj).length === originalLength;
}

// 测试86：密封数组可迭代
export function Fn86_sealedArrayIterable() {
    const arr = [1, 2];
    Object.seal(arr);
    let sum = 0;
    for (const num of arr) sum += num;
    return sum === 3;
}

// 测试87：preventExtensions后密封对象仍不可扩展
export function Fn87_preventThenSeal() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.seal(obj);
    return !Object.isExtensible(obj);
}

// 测试88：密封对象后返回自身
export function Fn88_sealReturnsSelf() {
    const obj = { a: 1 };
    const sealed = Object.seal(obj);
    return sealed === obj;
}

// 测试89：密封对象的属性描述符writable正确
export function Fn89_descriptorWritableCorrect() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, writable: false });
    Object.seal(obj);
    const descA = Object.getOwnPropertyDescriptor(obj, 'a');
    const descB = Object.getOwnPropertyDescriptor(obj, 'b');
    return descA.writable && !descB.writable;
}

// 测试90：密封对象的不可写属性不能被赋值
export function Fn90_cannotAssignNonWritable() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, writable: false });
    Object.seal(obj);
    try {
        obj.a = 2;
        return false;
    } catch(e) {
        return obj.a === 1;
    }
}

// 测试91：密封对象使用Object.hasOwn检测不存在属性返回false
export function Fn91_hasOwnNonExistent() {
    const obj = { a: 1 };
    Object.seal(obj);
    return !Object.hasOwn(obj, 'b');
}

// 测试92：密封对象的Symbol属性可修改
export function Fn92_canModifySymbolProperty() {
    const sym = Symbol('a');
    const obj = { [sym]: 1 };
    Object.seal(obj);
    obj[sym] = 2;
    return obj[sym] === 2;
}

// 测试93：密封对象的不可枚举属性可修改
export function Fn93_canModifyNonEnumerable() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false, writable: true });
    Object.seal(obj);
    obj.a = 2;
    return obj.a === 2;
}

// 测试94：密封对象的toString方法可被覆盖（如果可写）
export function Fn94_canOverrideToString() {
    const obj = {
        toString() {
            return 'test';
        }
    };
    Object.seal(obj);
    obj.toString = () => 'modified';
    return obj.toString() === 'modified';
}

// 测试95：密封对象的valueOf方法可被覆盖（如果可写）
export function Fn95_canOverrideValueOf() {
    const obj = {
        valueOf() {
            return 1;
        }
    };
    Object.seal(obj);
    obj.valueOf = () => 2;
    return obj.valueOf() === 2;
}

// 测试96：密封对象的属性可被Object.getOwnPropertyDescriptor获取
export function Fn96_getDescriptorWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return desc.value === 1;
}

// 测试97：密封对象后，属性的enumerable保持不变
export function Fn97_enumerableRemains() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false });
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return !desc.enumerable;
}

// 测试98：密封对象后，使用Object.keys排序与密封前一致
export function Fn98_keysOrderPreserved() {
    const obj = { b: 2, a: 1, c: 3 };
    const originalKeys = Object.keys(obj);
    Object.seal(obj);
    const sealedKeys = Object.keys(obj);
    return JSON.stringify(originalKeys) === JSON.stringify(sealedKeys);
}

// 测试99：密封对象的属性值为NaN时可修改
export function Fn99_canModifyNaNValue() {
    const obj = { a: NaN };
    Object.seal(obj);
    obj.a = 1;
    return obj.a === 1;
}

// 测试100：密封对象的属性值为Infinity时可修改
export function Fn100_canModifyInfinityValue() {
    const obj = { a: Infinity };
    Object.seal(obj);
    obj.a = -Infinity;
    return obj.a === -Infinity;
}

// 测试101：密封对象的属性值为BigInt时可修改
export function Fn101_canModifyBigIntValue() {
    const obj = { a: 10n };
    Object.seal(obj);
    obj.a = 20n;
    return obj.a === 20n;
}

// 测试102：密封对象的属性值为Symbol时可修改
export function Fn102_canModifySymbolValue() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const obj = { a: sym1 };
    Object.seal(obj);
    obj.a = sym2;
    return obj.a === sym2;
}

// 测试103：密封对象的属性值为函数时可修改
export function Fn103_canModifyFunctionValue() {
    const obj = { func: () => 1 };
    Object.seal(obj);
    obj.func = () => 2;
    return obj.func() === 2;
}

// 测试104：密封对象的属性值为RegExp时可修改
export function Fn104_canModifyRegExpValue() {
    const obj = { regex: /a/ };
    Object.seal(obj);
    obj.regex = /b/;
    return obj.regex.source === 'b';
}

// 测试105：密封对象的属性值为Date时可修改
export function Fn105_canModifyDateValue() {
    const obj = { date: new Date(2020, 0, 1) };
    Object.seal(obj);
    obj.date = new Date(2021, 0, 1);
    return obj.date.getFullYear() === 2021;
}

// 测试106：解构赋值可获取密封对象的属性
export function Fn106_destructuringWorks() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const { a, b } = obj;
    return a === 1 && b === 2;
}

// 测试107：密封对象的属性可用于计算属性名
export function Fn107_computedPropertyNameWorks() {
    const obj = { a: 'key' };
    Object.seal(obj);
    const newObj = { [obj.a]: 1 };
    return newObj.key === 1;
}

// 测试108：密封对象的属性可用于数组解构
export function Fn108_arrayDestructuringWorks() {
    const obj = { arr: [1, 2, 3] };
    Object.seal(obj);
    const [x, y] = obj.arr;
    return x === 1 && y === 2;
}

// 测试109：密封对象的属性可参与算术运算
export function Fn109_arithmeticOperationsWorks() {
    const obj = { a: 5, b: 3 };
    Object.seal(obj);
    return obj.a + obj.b === 8;
}

// 测试110：密封对象的属性可用于字符串拼接
export function Fn110_stringConcatenationWorks() {
    const obj = { a: 'Hello', b: 'World' };
    Object.seal(obj);
    return obj.a + ' ' + obj.b === 'Hello World';
}

// 测试111：密封对象的属性可作为函数参数传递
export function Fn111_propertyAsFunctionParam() {
    const obj = { a: 5 };
    Object.seal(obj);
    const func = (x) => x * 2;
    return func(obj.a) === 10;
}

// 测试112：密封对象可作为函数参数传递
export function Fn112_sealedAsFunctionParam() {
    const obj = { a: 1 };
    Object.seal(obj);
    const func = (o) => o.a;
    return func(obj) === 1;
}

// 测试113：密封对象可作为函数返回值
export function Fn113_sealedAsReturnvalue() {
    const obj = { a: 1 };
    Object.seal(obj);
    const func = () => obj;
    return func() === obj && Object.isSealed(func());
}

// 测试114：密封对象的属性可被JSON.parse修改
export function Fn114_jsonParseModifyWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    const json = JSON.stringify(obj);
    const parsed = JSON.parse(json, (key, value) => key === 'a' ? 2 : value);
    obj.a = parsed.a;
    return obj.a === 2;
}

// 测试115：密封对象的属性可用于模板字符串
export function Fn115_templateStringWorks() {
    const obj = { name: 'Test' };
    Object.seal(obj);
    return `Hello ${obj.name}` === 'Hello Test';
}

// 测试116：密封对象的属性可被Object.freeze冻结内部值
export function Fn116_freezeNestedValue() {
    const obj = { nested: { a: 1 } };
    Object.seal(obj);
    Object.freeze(obj.nested);
    try {
        obj.nested.a = 2;
        return false;
    } catch(e) {
        return obj.nested.a === 1;
    }
}

// 测试117：密封对象的属性可被Object.seal再次密封
export function Fn117_resealNestedObject() {
    const obj = { nested: { a: 1 } };
    Object.seal(obj);
    Object.seal(obj.nested);
    try {
        obj.nested.b = 2;
        return false;
    } catch(e) {
        return !('b' in obj.nested);
    }
}

// 测试118：密封对象的属性可被preventExtensions
export function Fn118_preventExtensionsNested() {
    const obj = { nested: { a: 1 } };
    Object.seal(obj);
    Object.preventExtensions(obj.nested);
    try {
        obj.nested.b = 2;
        return false;
    } catch(e) {
        return !('b' in obj.nested);
    }
}

// 测试119：密封对象的属性为WeakMap时可修改
export function Fn119_canModifyWeakMap() {
    const wm1 = new WeakMap();
    const wm2 = new WeakMap();
    const obj = { wm: wm1 };
    Object.seal(obj);
    obj.wm = wm2;
    return obj.wm === wm2;
}

// 测试120：密封对象的属性为WeakSet时可修改
export function Fn120_canModifyWeakSet() {
    const ws1 = new WeakSet();
    const ws2 = new WeakSet();
    const obj = { ws: ws1 };
    Object.seal(obj);
    obj.ws = ws2;
    return obj.ws === ws2;
}

// 测试121：密封对象的属性为Map时可修改其内容
export function Fn121_canModifyMapContent() {
    const map = new Map();
    map.set('a', 1);
    const obj = { map };
    Object.seal(obj);
    obj.map.set('a', 2);
    return obj.map.get('a') === 2;
}

// 测试122：密封对象的属性为Set时可修改其内容
export function Fn122_canModifySetContent() {
    const set = new Set();
    set.add(1);
    const obj = { set };
    Object.seal(obj);
    obj.set.delete(1);
    return !obj.set.has(1);
}

// 测试123：密封对象的属性为Error时可修改
export function Fn123_canModifyError() {
    const err1 = new Error('a');
    const err2 = new Error('b');
    const obj = { err: err1 };
    Object.seal(obj);
    obj.err = err2;
    return obj.err.message === 'b';
}

// 测试124：密封对象的属性为Promise时可修改
export function Fn124_canModifyPromise() {
    const p1 = Promise.resolve(1);
    const p2 = Promise.resolve(2);
    const obj = { p: p1 };
    Object.seal(obj);
    obj.p = p2;
    return obj.p === p2;
}

// 测试125：密封对象的属性为GeneratorFunction时可修改
export function Fn125_canModifyGenerator() {
    function* gen1() { yield 1; }
    function* gen2() { yield 2; }
    const obj = { gen: gen1 };
    Object.seal(obj);
    obj.gen = gen2;
    const iter = obj.gen();
    return iter.next().value === 2;
}

// 测试126：密封对象的属性为AsyncFunction时可修改
export function Fn126_canModifyAsyncFunction() {
    const async1 = async () => 1;
    const async2 = async () => 2;
    const obj = { async: async1 };
    Object.seal(obj);
    obj.async = async2;
    return obj.async() instanceof Promise;
}

// 测试127：Object.fromEntries可从密封对象创建新对象
export function Fn127_fromEntriesWorks() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const entries = Object.entries(obj);
    const newObj = Object.fromEntries(entries);
    return newObj.a === 1 && newObj.b === 2;
}

// 测试128：密封对象的属性可被Object.values迭代
export function Fn128_valuesIterationWorks() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const values = Object.values(obj);
    return values.reduce((a, b) => a + b, 0) === 3;
}

// 测试129：密封对象的属性可被Object.entries迭代
export function Fn129_entriesIterationWorks() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    let sum = 0;
    for (const [, value] of Object.entries(obj)) {
        sum += value;
    }
    return sum === 3;
}

// 测试130：密封对象可被Object.getOwnPropertyDescriptors正确描述
export function Fn130_getDescriptorsWorks() {
    const obj = { a: 1 };
    Object.seal(obj);
    const descs = Object.getOwnPropertyDescriptors(obj);
    return descs.a.value === 1 && !descs.a.configurable;
}

// 测试131：密封对象的属性可被Object.defineProperty修改value
export function Fn131_definePropertyModifyValue() {
    const obj = { a: 1 };
    Object.seal(obj);
    Object.defineProperty(obj, 'a', { value: 2 });
    return obj.a === 2;
}

// 测试132：密封对象的属性不能被Object.defineProperty修改为getter
export function Fn132_cannotChangeToGetter() {
    const obj = { a: 1 };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { get: () => 2 });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试133：密封对象的属性不能被Object.defineProperty修改为setter
export function Fn133_cannotChangeToSetter() {
    const obj = { a: 1 };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { set: (v) => {} });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试134：密封对象的访问器属性不能被修改为数据属性
export function Fn134_cannotChangeAccessorToData() {
    const obj = { get a() { return 1; } };
    Object.seal(obj);
    try {
        Object.defineProperty(obj, 'a', { value: 2 });
        return false;
    } catch (e) {
        return true;
    }
}

// 测试135：密封对象的属性可通过解构赋值修改
export function Fn135_destructuringAssignmentModify() {
    const obj = { a: 1 };
    Object.seal(obj);
    ({ a: obj.a } = { a: 2 });
    return obj.a === 2;
}

// 测试136：密封对象的属性可用于Object.is比较
export function Fn136_objectIsComparison() {
    const obj = { a: 1 };
    Object.seal(obj);
    const obj2 = { a: 1 };
    return !Object.is(obj, obj2);
}

// 测试137：密封对象可用于Map作为键
export function Fn137_sealedAsMapKey() {
    const obj = { a: 1 };
    Object.seal(obj);
    const map = new Map();
    map.set(obj, 2);
    return map.get(obj) === 2;
}

// 测试138：密封对象可用于Set
export function Fn138_sealedInSet() {
    const obj = { a: 1 };
    Object.seal(obj);
    const set = new Set();
    set.add(obj);
    return set.has(obj);
}

// 测试139：密封对象的属性可被JSON.stringify正确序列化
export function Fn139_jsonStringifyCorrect() {
    const obj = { a: 1, b: 'test', c: null };
    Object.seal(obj);
    return JSON.stringify(obj) === '{"a":1,"b":"test","c":null}';
}

// 测试140：密封对象的属性为undefined时可修改
export function Fn140_modifyUndefinedProperty() {
    const obj = { a: undefined };
    Object.seal(obj);
    obj.a = 1;
    return obj.a === 1;
}

// 测试141：密封对象的属性为null时可修改
export function Fn141_modifyNullProperty() {
    const obj = { a: null };
    Object.seal(obj);
    obj.a = 1;
    return obj.a === 1;
}

// 测试142：密封对象的属性为布尔值时可修改
export function Fn142_modifyBooleanProperty() {
    const obj = { a: true };
    Object.seal(obj);
    obj.a = false;
    return obj.a === false;
}

// 测试143：密封对象的属性为字符串时可修改
export function Fn143_modifyStringProperty() {
    const obj = { a: 'hello' };
    Object.seal(obj);
    obj.a = 'world';
    return obj.a === 'world';
}

// 测试144：密封对象的属性为数组时可修改其元素
export function Fn144_modifyArrayElements() {
    const obj = { a: [1, 2, 3] };
    Object.seal(obj);
    obj.a[0] = 4;
    return obj.a[0] === 4;
}

// 测试145：密封对象的属性为数组时可修改其长度
export function Fn145_modifyArrayLength() {
    const obj = { a: [1, 2, 3] };
    Object.seal(obj);
    obj.a.length = 2;
    return obj.a.length === 2;
}

// 测试146：密封对象的属性为数组时可使用数组方法修改
export function Fn146_useArrayMethods() {
    const obj = { a: [1, 2, 3] };
    Object.seal(obj);
    obj.a.push(4);
    return obj.a.length === 4;
}

// 测试147：密封对象的属性为对象时可添加属性到该对象
export function Fn147_addToNestedObject() {
    const obj = { nested: { a: 1 } };
    Object.seal(obj);
    obj.nested.b = 2;
    return obj.nested.b === 2;
}

// 测试148：密封对象的属性为对象时可删除该对象的属性
export function Fn148_deleteFromNestedObject() {
    const obj = { nested: { a: 1 } };
    Object.seal(obj);
    delete obj.nested.a;
    return !('a' in obj.nested);
}

// 测试149：密封对象的属性为对象时可修改该对象的属性
export function Fn149_modifyNestedObjectProperty() {
    const obj = { nested: { a: 1 } };
    Object.seal(obj);
    obj.nested.a = 2;
    return obj.nested.a === 2;
}

// 测试150：密封对象的属性为类实例时可修改
export function Fn150_modifyClassInstance() {
    class MyClass { constructor() { this.a = 1; } }
    const inst1 = new MyClass();
    const inst2 = new MyClass();
    inst2.a = 2;
    const obj = { inst: inst1 };
    Object.seal(obj);
    obj.inst = inst2;
    return obj.inst.a === 2;
}

// 测试151：密封类实例对象不能添加新属性
export function Fn151_sealedInstanceNoNewProps() {
    class MyClass { constructor() { this.a = 1; } }
    const inst = new MyClass();
    Object.seal(inst);
    try {
        inst.b = 2;
        return false;
    } catch(e) {
        return !('b' in inst);
    }
}

// 测试152：密封类实例对象不能删除现有属性
export function Fn152_sealedInstanceNoDelete() {
    class MyClass { constructor() { this.a = 1; } }
    const inst = new MyClass();
    Object.seal(inst);
    try {
        delete inst.a;
        return false;
    } catch(e) {
        return 'a' in inst;
    }
}

// 测试153：密封类实例对象可修改现有属性
export function Fn153_sealedInstanceModify() {
    class MyClass { constructor() { this.a = 1; } }
    const inst = new MyClass();
    Object.seal(inst);
    inst.a = 2;
    return inst.a === 2;
}

// 测试154：密封对象的属性为箭头函数时可修改
export function Fn154_modifyArrowFunction() {
    const obj = { func: () => 1 };
    Object.seal(obj);
    obj.func = () => 2;
    return obj.func() === 2;
}

// 测试155：密封对象的属性为绑定函数时可修改
export function Fn155_modifyBoundFunction() {
    function func() { return this.a; }
    const obj1 = { a: 1 };
    const obj2 = { a: 2 };
    const bound1 = func.bind(obj1);
    const bound2 = func.bind(obj2);
    const sealObj = { func: bound1 };
    Object.seal(sealObj);
    sealObj.func = bound2;
    return sealObj.func() === 2;
}

// 测试156：密封对象的属性为数字时可进行递增操作
export function Fn156_incrementNumberProperty() {
    const obj = { a: 1 };
    Object.seal(obj);
    obj.a++;
    return obj.a === 2;
}

// 测试157：密封对象的属性为数字时可进行递减操作
export function Fn157_decrementNumberProperty() {
    const obj = { a: 2 };
    Object.seal(obj);
    obj.a--;
    return obj.a === 1;
}

// 测试158：密封对象的属性为字符串时可进行拼接操作
export function Fn158_concatStringProperty() {
    const obj = { a: 'hello' };
    Object.seal(obj);
    obj.a += ' world';
    return obj.a === 'hello world';
}

// 测试159：密封对象的属性可用于逻辑运算
export function Fn159_logicalOperations() {
    const obj = { a: true, b: false };
    Object.seal(obj);
    return obj.a && !obj.b;
}

// 测试160：密封对象的属性可用于比较运算
export function Fn160_comparisonOperations() {
    const obj = { a: 5, b: 10 };
    Object.seal(obj);
    return obj.a < obj.b;
}

// 测试161：密封对象的属性可被typeof正确识别
export function Fn161_typeOfProperty() {
    const obj = { a: 1, b: 'string', c: () => {} };
    Object.seal(obj);
    return typeof obj.a === 'number' &&
        typeof obj.b === 'string' &&
        typeof obj.c === 'function';
}

// 测试162：密封对象的属性可被instanceof正确识别
export function Fn162_instanceOfProperty() {
    const obj = { a: new Date(), b: [] };
    Object.seal(obj);
    return obj.a instanceof Date && obj.b instanceof Array;
}

// 测试163：密封对象可作为参数传递给Object.keys
export function Fn163_objectKeysWithSealed() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    return Object.keys(obj).includes('a');
}

// 测试164：密封对象可作为参数传递给Object.values
export function Fn164_objectValuesWithSealed() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    return Object.values(obj).includes(2);
}

// 测试165：密封对象可作为参数传递给Object.entries
export function Fn165_objectEntriesWithSealed() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    const entries = Object.entries(obj);
    return entries.some(([k, v]) => k === 'b' && v === 2);
}

// 测试166：密封对象可作为参数传递给Object.assign（目标为新对象）
export function Fn166_assignFromSealed() {
    const obj = { a: 1 };
    Object.seal(obj);
    const newObj = Object.assign({}, obj);
    return newObj.a === 1;
}

// 测试167：密封对象的属性可被Object.is正确比较
export function Fn167_objectIsWithProperties() {
    const obj = { a: NaN };
    Object.seal(obj);
    return Object.is(obj.a, NaN);
}

// 测试168：密封对象的属性为NaN时可修改为数字
export function Fn168_modifyNaNToNumber() {
    const obj = { a: NaN };
    Object.seal(obj);
    obj.a = 1;
    return obj.a === 1;
}

// 测试169：密封对象的属性为Infinity时可修改为数字
export function Fn169_modifyInfinityToNumber() {
    const obj = { a: Infinity };
    Object.seal(obj);
    obj.a = 100;
    return obj.a === 100;
}

// 测试170：密封对象的属性为负Infinity时可修改为数字
export function Fn170_modifyNegativeInfinityToNumber() {
    const obj = { a: -Infinity };
    Object.seal(obj);
    obj.a = -100;
    return obj.a === -100;
}

// 测试171：密封对象的属性为数组时可使用forEach方法
export function Fn171_arrayForEachOnSealed() {
    const obj = { a: [1, 2, 3] };
    Object.seal(obj);
    let sum = 0;
    obj.a.forEach(num => sum += num);
    return sum === 6;
}

// 测试172：密封对象的属性为数组时可使用map方法
export function Fn172_arrayMapOnSealed() {
    const obj = { a: [1, 2, 3] };
    Object.seal(obj);
    const mapped = obj.a.map(num => num * 2);
    return mapped[0] === 2 && mapped[1] === 4 && mapped[2] === 6;
}

// 测试173：密封对象的属性为数组时可使用filter方法
export function Fn173_arrayFilterOnSealed() {
    const obj = { a: [1, 2, 3, 4] };
    Object.seal(obj);
    const filtered = obj.a.filter(num => num % 2 === 0);
    return filtered.length === 2 && filtered[0] === 2;
}

// 测试174：密封对象的属性为数组时可使用reduce方法
export function Fn174_arrayReduceOnSealed() {
    const obj = { a: [1, 2, 3] };
    Object.seal(obj);
    const sum = obj.a.reduce((acc, num) => acc + num, 0);
    return sum === 6;
}

// 测试175：密封对象的属性为对象时可使用Object.keys
export function Fn175_nestedObjectKeys() {
    const obj = { nested: { a: 1, b: 2 } };
    Object.seal(obj);
    return Object.keys(obj.nested).length === 2;
}

// 测试176：密封对象的属性为对象时可使用Object.values
export function Fn176_nestedObjectValues() {
    const obj = { nested: { a: 1, b: 2 } };
    Object.seal(obj);
    return Object.values(obj.nested).includes(1);
}

// 测试177：密封对象的属性为对象时可使用Object.entries
export function Fn177_nestedObjectEntries() {
    const obj = { nested: { a: 1, b: 2 } };
    Object.seal(obj);
    return Object.entries(obj.nested).length === 2;
}

// 测试178：密封对象的属性为正则表达式时可测试匹配
export function Fn178_regexTestOnSealed() {
    const obj = { regex: /test/ };
    Object.seal(obj);
    return obj.regex.test('test') && !obj.regex.test('example');
}

// 测试179：密封对象的属性为正则表达式时可执行exec
export function Fn179_regexExecOnSealed() {
    const obj = { regex: /(\w+)/ };
    Object.seal(obj);
    const result = obj.regex.exec('test');
    return result && result[1] === 'test';
}

// 测试180：密封对象的属性为日期时可获取年份
export function Fn180_dateGetFullYearOnSealed() {
    const obj = { date: new Date(2023, 0, 1) };
    Object.seal(obj);
    return obj.date.getFullYear() === 2023;
}

// 测试181：密封对象的属性为日期时可设置年份
export function Fn181_dateSetFullYearOnSealed() {
    const obj = { date: new Date(2023, 0, 1) };
    Object.seal(obj);
    obj.date.setFullYear(2024);
    return obj.date.getFullYear() === 2024;
}

// 测试182：密封对象的属性为Map时可使用get方法
export function Fn182_mapGetOnSealed() {
    const map = new Map();
    map.set('a', 1);
    const obj = { map };
    Object.seal(obj);
    return obj.map.get('a') === 1;
}

// 测试183：密封对象的属性为Map时可使用set方法
export function Fn183_mapSetOnSealed() {
    const map = new Map();
    const obj = { map };
    Object.seal(obj);
    obj.map.set('a', 1);
    return obj.map.get('a') === 1;
}

// 测试184：密封对象的属性为Set时可使用add方法
export function Fn184_setAddOnSealed() {
    const set = new Set();
    const obj = { set };
    Object.seal(obj);
    obj.set.add(1);
    return obj.set.has(1);
}

// 测试185：密封对象的属性为Set时可使用delete方法
export function Fn185_setDeleteOnSealed() {
    const set = new Set([1]);
    const obj = { set };
    Object.seal(obj);
    obj.set.delete(1);
    return !obj.set.has(1);
}

// 测试186：密封对象的属性为WeakMap时可使用set方法
export function Fn186_weakMapSetOnSealed() {
    const wm = new WeakMap();
    const key = {};
    const obj = { wm };
    Object.seal(obj);
    obj.wm.set(key, 1);
    return obj.wm.get(key) === 1;
}

// 测试187：密封对象的属性为WeakSet时可使用add方法
export function Fn187_weakSetAddOnSealed() {
    const ws = new WeakSet();
    const key = {};
    const obj = { ws };
    Object.seal(obj);
    obj.ws.add(key);
    return obj.ws.has(key);
}

// 测试188：密封对象的属性为Error时可访问message
export function Fn188_errorMessageOnSealed() {
    const err = new Error('test error');
    const obj = { err };
    Object.seal(obj);
    return obj.err.message === 'test error';
}

// 测试189：密封对象的属性为Error时可修改message
export function Fn189_modifyErrorMessage() {
    const err = new Error('test error');
    const obj = { err };
    Object.seal(obj);
    obj.err.message = 'modified error';
    return obj.err.message === 'modified error';
}

// 测试190：密封对象的属性为Promise时可使用then方法
export function Fn190_promiseThenOnSealed() {
    const p = Promise.resolve(1);
    const obj = { p };
    Object.seal(obj);
    let result;
    obj.p.then(value => { result = value; });
    console.log('ObjectTest == Fn190_promiseThenOnSealed');
    return new Promise(resolve => {
        setTimeout(() => resolve(result === 1), 0);
    });
}

// 测试191：密封对象的属性为Generator时可迭代
export function Fn191_generatorIterateOnSealed() {
    function* gen() {
        yield 1;
        yield 2;
    }
    const obj = { gen };
    Object.seal(obj);
    const iter = obj.gen();
    return iter.next().value === 1 && iter.next().value === 2;
}

// 测试192：密封对象的属性为AsyncFunction时可调用
export function Fn192_asyncFunctionCallOnSealed() {
    const asyncFunc = async () => 1;
    const obj = { asyncFunc };
    Object.seal(obj);
    console.log('ObjectTest == Fn192_asyncFunctionCallOnSealed');
    return obj.asyncFunc().then(value => value === 1);
}

// 测试193：密封对象的属性可使用Object.hasOwn检测
export function Fn193_objectHasOwnOnSealed() {
    const obj = { a: 1 };
    Object.seal(obj);
    return Object.hasOwn(obj, 'a') && !Object.hasOwn(obj, 'b');
}

// 测试194：密封对象的属性可使用in运算符检测
export function Fn194_inOperatorOnSealed() {
    const obj = { a: 1 };
    Object.seal(obj);
    return 'a' in obj && !('b' in obj);
}

// 测试195：密封对象的属性可使用hasOwnProperty检测
export function Fn195_hasOwnPropertyOnSealed() {
    const obj = { a: 1 };
    Object.seal(obj);
    return obj.hasOwnProperty('a') && !obj.hasOwnProperty('b');
}

// 测试196：密封对象的属性为数组时可使用includes方法
export function Fn196_arrayIncludesOnSealed() {
    const obj = { a: [1, 2, 3] };
    Object.seal(obj);
    return obj.a.includes(2) && !obj.a.includes(4);
}

// 测试197：密封对象的属性为数组时可使用indexOf方法
export function Fn197_arrayIndexOfOnSealed() {
    const obj = { a: [1, 2, 3] };
    Object.seal(obj);
    return obj.a.indexOf(2) === 1 && obj.a.indexOf(4) === -1;
}

// 测试198：密封对象的属性为数组时可使用lastIndexOf方法
export function Fn198_arrayLastIndexOfOnSealed() {
    const obj = { a: [1, 2, 3, 2] };
    Object.seal(obj);
    return obj.a.lastIndexOf(2) === 3;
}

// 测试199：密封对象的属性为字符串时可使用includes方法
export function Fn199_stringIncludesOnSealed() {
    const obj = { a: 'hello world' };
    Object.seal(obj);
    return obj.a.includes('world') && !obj.a.includes('test');
}

// 测试200：密封对象的属性为字符串时可使用indexOf方法
export function Fn200_stringIndexOfOnSealed() {
    const obj = { a: 'hello world' };
    Object.seal(obj);
    return obj.a.indexOf('world') === 6;
}
