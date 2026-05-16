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

function deepClone(obj) {
    if (obj === null || typeof obj !== 'object') {
        return obj;
    }

    if (Array.isArray(obj)) {
        return obj.map(item => deepClone(item));
    }

    if (obj instanceof Date) {
        return new Date(obj);
    }

    if (obj instanceof RegExp) {
        return new RegExp(obj.source, obj.flags);
    }

    const cloned = {};
    Object.keys(obj).forEach(key => {
        cloned[key] = deepClone(obj[key]);
    });
    return cloned;
}

export function objectCompareTest0800(){
    const obj = { value: 10 };
    const num = 10;
    const str = "10";
    const objStr = new String("10");
    return [obj == num, num == str, num === str, num == objStr, objStr === str]
}
export function objectCompareTest0900(){
    const proto1 = { x: 10 };
    const proto2 = { x: 20 };

    const obj1 = Object.create(proto1);
    const obj2 = Object.create(proto2);
    return [obj1, obj2]
}
export function objectCompareTest1300(){
    function Foo() { this.value = 1; }
    function Bar() { this.value = 1; }

    const obj1 = new Foo();
    const obj2 = new Bar();
    return [obj1, obj2];
}
export function objectCompareTest1400(){
    function Foo() { this.value = 1; }

    const obj1 = new Foo();
    const obj2 = new Foo();
    return [obj1, obj2];
}
export function objectCompareTest1500(){
    const obj1 = { a: 1, b: "test" };
    const jsonStr = JSON.stringify(obj1);
    const obj2 = JSON.parse(jsonStr);
    return [obj1, obj2];
}
export function objectCompareTest1600(){
    const numPrimitive = 100;
    const numObject = new Number(100);

    return [numPrimitive, numObject];
}
export function objectCompareTest1700(){
    const strPrimitive = "hello";
    const strObject = new String("hello");

    return [strPrimitive, strObject];
}
export function objectCompareTest1800(){
    const boolPrimitive = true;
    const boolObject = new Boolean(true);

    return [boolPrimitive, boolObject];
}
export function objectCompareTest1900(){
    const numPrimitive = 100;
    const numObject = new Number(200);

    return [numPrimitive, numObject];
}
export function objectCompareTest2000(){
    const obj = { a: 1 };
    const a = null;

    return [obj, a];
}
export function objectCompareTest2100(){
    const obj = { a: 1 };
    const a = undefined;

    return [obj, a];
}
export function objectCompareTest2200(){
    const num = 123;
    const obj = new Number(123);

    return [num, obj.toString()];
}
export function objectCompareTest2300(){
    const date1 = new Date(2023, 0, 1);
    const date2 = new Date(2023, 0, 1);
    const date3 = date1;

    return [date1, date2, date3];
}
export function objectCompareTest2400(){
    const regex1 = /test/;
    const regex2 = /test/;
    const regex3 = regex1;
    return [regex1, regex2, regex3];
}
export function objectCompareTest2500(){
    const map1 = new Map();
    map1.set('a', 1);

    const map2 = new Map();
    map2.set('a', 1);

    const map3 = map1;
    return [map1, map2, map3];
}
export function objectCompareTest2600(){
    const set1 = new Set([1, 2, 3]);
    const set2 = new Set([1, 2, 3]);
    const set3 = set1;
    return [set1, set2, set3];
}
export function objectCompareTest2700(){
    const obj = { a: 1 };
    const arr = [1, 2, 3];
    const func = () => {};
    const date = new Date();

    return [obj, arr, func, date];
}
export function objectCompareTest2800(){
    class MyClass {
        constructor(value) {
            this.value = value;
        }
    }

    const instance1 = new MyClass(10);
    const instance2 = new MyClass(10);
    const instance3 = instance1;
    return [instance1, instance2, instance3];
}
export function objectCompareTest2900(){
    const arr = [];
    const obj = {};

    return [arr, obj];
}
export function objectCompareTest3000(){
    const strObj = new String("test");
    const arr = ["t", "e", "s", "t"];

    return [strObj, arr];
}
export function objectCompareTest3100(){
    const obj1 = { a: { b: 1 } };
    const obj2 = { a: { b: 1 } };

    return [obj1, obj2];
}
export function objectCompareTest3200(){
    const obj1 = { a: { b: { c: { d: 1 } } } };
    const obj2 = { a: { b: { c: { d: 1 } } } };
    return [obj1, obj2];
}
export function objectCompareTest3300(){
    const shared = { c: 3 };
    const obj1 = { a: 1, b: shared };
    const obj2 = { a: 1, b: shared };

    return [obj1, obj2];
}
export function objectCompareTest3400(){
    const obj1 = { a: [1, 2, 3] };
    const obj2 = { a: [1, 2, 3] };

    return [obj1, obj2];
}
export function objectCompareTest3500(){
    const obj1 = { a: () => {} };
    const obj2 = { a: () => {} };

    return [obj1, obj2];
}
export function objectCompareTest3600(){
    const obj1 = { a: { b: 1 } };
    const obj2 = obj1;

    return [obj1, obj2];
}
export function objectCompareTest3700(obj1){
    obj1.a = { b: 2 };
}
export function objectCompareTest3800(){
    const obj1 = {
        a: 1,
        b: "test",
        c: { d: 2 },
        e: [3, 4],
        f: () => 5
    };

    const obj2 = {
        a: 1,
        b: "test",
        c: { d: 2 },
        e: [3, 4],
        f: () => 5
    };

    return [obj1, obj2];
}
export function objectCompareTest3900(){
    const obj1 = { a: 1 };
    obj1.self = obj1;

    const obj2 = { a: 1 };
    obj2.self = obj2;

    const obj3 = obj1;

    return [obj1, obj2, obj3];
}
export function objectCompareTest4000(){
    const original = { a: 1, b: { c: 2 } };
    const shallowCopy = { ...original };

    return [original, shallowCopy];
}
export function objectCompareTest4100(){
    const original = { a: 1, b: { c: 2 } };
    const copy = Object.assign({}, original);

    return [original, copy];
}
export function objectCompareTest4200(){
    const original = { a: 1, b: { c: 2 }, d: [3, 4] };
    const deepCopy = deepClone(original);

    return [original, deepCopy];
}
export function objectCompareTest4300(){
    const original = { a: 1, b: { c: 2 } };
    const shallowCopy = { ...original };

    original.b.c = 3;

    return [original, shallowCopy];
}
export function objectCompareTest4400(){
    const original = { a: 1, b: { c: 2 } };
    const deepCopy = deepClone(original);

    original.b.c = 3;

    return [original, deepCopy];
}
export function objectCompareTest4500(){
    const obj1 = { a: 1 };
    const obj2 = obj1;

    return [obj1, obj2];
}
export function objectCompareTest4501(obj1){
    obj1.a = 2;
}
export function objectCompareTest4600(){
    const obj1 = { a: { b: 1 } };
    const obj2 = obj1;

    return [obj1, obj2];
}
export function objectCompareTest4601(obj1){
    obj1.a = { b: 2 };
}
export function objectCompareTest4700(){
    const obj1 = { a: 1 };
    const obj2 = obj1;

    return [obj1, obj2];
}
export function objectCompareTest4701(obj1){
    obj1.b = 2;
}
export function objectCompareTest4800(){
    const obj1 = { a: 1, b: 2 };
    const obj2 = obj1;

    return [obj1, obj2];
}
export function objectCompareTest4801(obj1){
    delete obj1.b;
}
export function objectCompareTest4900(){
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    Object.freeze(obj1);
    Object.freeze(obj2);
    const obj3 = obj1;

    return [obj1, obj2, obj3];
}