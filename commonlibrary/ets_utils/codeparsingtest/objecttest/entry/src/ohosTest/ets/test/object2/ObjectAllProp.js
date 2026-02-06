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
function listAllProperties(o) {
    let objectToInspect;
    const result = [];

    for (
        objectToInspect = o;
        objectToInspect !== null;
        objectToInspect = Object.getPrototypeOf(objectToInspect)
    ) {
        result.push(...Object.getOwnPropertyNames(objectToInspect));
    }

    return result;
}

function uniqueArray(arr) {
    return [...new Set(arr)];
}

const baseProto = { baseProp: 'base', baseMethod() {} };
const subProto = Object.create(baseProto);
subProto.subProp = 'sub';
Object.defineProperty(subProto, 'subNonEnum', {
    value: 'sub non-enumerable',
    enumerable: false
});

class BaseClass {
    baseClassProp = 'base class';
    baseClassMethod() {}
}

class SubClass extends BaseClass {
    subClassProp = 'sub class';
    subClassMethod() {}
}

export function objectSetProto(){
    const obj = { a: 1 };
    const proto = { b: 2 };
    Object.setPrototypeOf(obj, proto);
    return obj;
}

export function objectAllPropTest0100(){
    const obj = objectSetProto();

    const enumerated = [];
    for (const prop in obj) {
        enumerated.push(prop);
    }
    return enumerated;
}

export function objectAllPropTest0300(){
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', {
        value: 2,
        enumerable: false
    });

    return obj;
}

export function objectAllPropTest0400(){
    const obj = {};
    obj.enumProp = 'enumerable';

    Object.defineProperty(obj, 'nonEnumProp', {
        value: 'non-enumerable',
        enumerable: false
    });

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);
    return [obj, forInProps];
}

export function objectAllPropTest0500(){
    const obj = {};

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);
    return [obj, forInProps];
}

export function objectAllPropTest0600(){
    const obj = { test: 'value' };

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);
    return [obj, forInProps];
}

export function objectAllPropTest0800(){
    const sym1 = Symbol('sym1');
    const sym2 = Symbol('sym2');
    const obj = { [sym1]: 'value1' };
    Object.defineProperty(obj, sym2, {
        value: 'value2',
        enumerable: false
    });

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);
    return [obj, forInProps];
}

export function objectAllPropTest0900(){
    const obj = {
        method1() {},
        method2: () => {}
    };
    return obj;
}

export function objectAllPropTest1000(){
    const obj = { a: 1 };

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);
    return forInProps;
}
export function objectAllPropTest1001(){
    const obj = { a: 1 };
    const keys = Object.keys(obj);
    return keys;
}
export function objectAllPropTest1002(){
    const obj = { a: 1 };

    const ownNames = Object.getOwnPropertyNames(obj);
    return ownNames;
}
export function objectAllPropTest1100(){
    const proto = { b: 2 };
    const obj = Object.create(proto);
    obj.a = 1;

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);

    return [obj, forInProps];
}
export function objectAllPropTest1200(){
    const grandparent = { c: 3 };
    const parent = Object.create(grandparent);
    parent.b = 2;
    const child = Object.create(parent);
    child.a = 1;

    const forInProps = [];
    for (const prop in child) forInProps.push(prop);
    return forInProps;
}
export function objectAllPropTest1300(){
    const proto = {};
    Object.defineProperty(proto, 'nonEnum', {
        value: 'value',
        enumerable: false
    });
    proto.enumProp = 'enumerable';
    const obj = Object.create(proto);

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);
    return forInProps;
}
export function objectAllPropTest1400(){
    const proto = { prop: 'from proto' };
    const obj = Object.create(proto);
    obj.prop = 'from obj';

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);
    return [obj, forInProps];
}
export function objectAllPropTest1500(){
    const instance = new SubClass();

    const forInProps = [];
    for (const prop in instance) forInProps.push(prop);
    return forInProps;
}
export function objectAllPropTest1600(){
    class Test {
        publicProp = 'public';
        privateProp = 'private';
        protectedProp = 'protected';
    }

    const instance = new Test();

    const forInProps = [];
    for (const prop in instance) forInProps.push(prop);
    return forInProps;
}
export function objectAllPropTest1700(){
    const obj = {};

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);
    return forInProps;
}
export function objectAllPropTest1800(){
    const proto = { b: 2 };
    const obj = Object.create(proto);
    obj.a = 1;

    const ownProps = [];
    for (const prop in obj) {
        if (obj.hasOwnProperty(prop)) {
            ownProps.push(prop);
        }
    }
    return ownProps;
}
export function objectAllPropTest1900(){
    let current = null;
    for (let i = 10; i >= 0; i--) {
        current = Object.create(current);
        current[`prop${i}`] = i;
    }

    const forInProps = [];
    for (const prop in current) forInProps.push(prop);
    return forInProps;
}
export function objectAllPropTest2000(){
    const obj = { a: 1 };
    const proto1 = { b: 2 };
    const proto2 = { c: 3 };

    Object.setPrototypeOf(obj, proto1);
    const props1 = [];
    for (const prop in obj) props1.push(prop);

    Object.setPrototypeOf(obj, proto2);
    const props2 = [];
    for (const prop in obj) props2.push(prop);
    return [props1, props2];
}
export function objectAllPropTest2100(arr){
    arr.customProp = 'custom';

    const forInProps = [];
    for (const prop in arr) forInProps.push(prop);
    return [arr, forInProps];
}
export function objectAllPropTest2200(){
    function testFunc() {}
    testFunc.customProp = 'custom';

    const forInProps = [];
    for (const prop in testFunc) forInProps.push(prop);
    return [testFunc, forInProps, Object.getOwnPropertyNames(testFunc)];
}
export function objectAllPropTest2300(date){
    const forInProps = [];
    for (const prop in date) forInProps.push(prop);
    return [date, forInProps, Object.getOwnPropertyNames(date)];
}
export function objectAllPropTest2400(regex){
    const forInProps = [];
    for (const prop in regex) forInProps.push(prop);
    return [regex, forInProps, Object.getOwnPropertyNames(regex)];
}
export function objectAllPropTest2500(map){
    map.set('key', 'value');
    map.customProp = 'custom';

    const forInProps = [];
    for (const prop in map) forInProps.push(prop);
    return [map, forInProps, Object.getOwnPropertyNames(map)];
}
export function objectAllPropTest2600(set){
    set.add('value');
    set.customProp = 'custom';

    const forInProps = [];
    for (const prop in set) forInProps.push(prop);
    return [set, forInProps, Object.getOwnPropertyNames(set)];
}
export function objectAllPropTest2700(error){
    error.customProp = 'custom';

    const forInProps = [];
    for (const prop in error) forInProps.push(prop);
    return [error, forInProps, Object.getOwnPropertyNames(error)];
}
export function objectAllPropTest2800(num){
    num.customProp = 'custom';

    const forInProps = [];
    for (const prop in num) forInProps.push(prop);
    return [num, forInProps, Object.getOwnPropertyNames(num)];
}
export function objectAllPropTest2900(){
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    return obj;
}
export function objectAllPropTest3000(){
    const obj = { a: 1, b: 2 };
    Object.seal(obj);
    return obj;
}
export function objectAllPropTest3600(obj){
    obj.self = obj;
}
export function objectAllPropTest3700(obj){
    for (let i = 0; i < 100; i++) {
        obj[`prop${i}`] = i;
    }
    return Object.getOwnPropertyNames(obj);
}
export function objectAllPropTest3800(obj){
    obj.b = 2;
}
export function objectAllPropTest3801(obj){
    Object.defineProperty(obj, 'c', {
        value: 3,
        enumerable: false
    });
    return Object.getOwnPropertyNames(obj);
}
export function objectAllPropTest3900(arr){
    arr[0] = 'a';
    arr[2] = 'c';

    const forInProps = [];
    for (const prop in arr) forInProps.push(prop);
    return forInProps;
}
export function objectAllPropTest4000(){
    const obj = { a: 1 };
    const proto = { b: 2 };
    Object.setPrototypeOf(obj, proto);

    const allProps = listAllProperties(obj);
    return allProps;
}
export function objectAllPropTest4200(grandparent){
    const parent = Object.create(grandparent);
    parent.p = 'parent';
    Object.defineProperty(parent, 'pNonEnum', {
        value: 'parent non-enum',
        enumerable: false
    });

    const obj = Object.create(parent);
    obj.o = 'own';
    Object.defineProperty(obj, 'oNonEnum', {
        value: 'own non-enum',
        enumerable: false
    });

    const forInProps = [];
    for (const prop in obj) forInProps.push(prop);
    return [obj, forInProps]
}