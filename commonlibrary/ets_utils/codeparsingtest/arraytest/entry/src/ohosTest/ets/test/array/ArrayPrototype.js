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

export function Prototype0006(){
    const obj1 = { id: 1 };
    const obj2 = { id: 2 };
    const arr = new Array(obj1, obj2);
    return { arr,obj1,obj2 };
}

export function Prototype0020(){
    const func1 = () => 1;
    const func2 = (a,b)=> a + b;
    const arr = new Array(func1, func2);
    return { arr,func1,func2 };
}

export function Prototype0024(){
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const arr = new Array(sym1, sym2);
    const arr1 = arr.length;
    const arr2 = arr[0] === sym1;
    const arr3 = arr[1] === sym2;
    const arr4 = typeof arr[0] === 'symbol';
    const arr5 = Symbol.keyFor(arr[0]);
    return { arr,arr1,arr2, arr3,arr4,arr5};
}

export function Prototype0025(){
    const sym1 = Symbol.for('test1');
    const sym2 = Symbol.for('test2');
    const arr = new Array(sym1, sym2);
    const arr1 = arr.length;
    const arr2 = arr[0] === sym1;
    const arr3 = arr[1] === sym2;
    const arr4 = typeof arr[0] === 'symbol';
    const arr5 = Symbol.keyFor(arr[0]);
    return { arr,arr1,arr2, arr3,arr4,arr5};
}

export function Prototype0029(){
    const map1 = new Map([['a', 1]]);
    const map2 = new Map([[2, 'b']]);
    const arr = new Array(map1, map2);
    const arr1 = arr.length;
    const arr2 = arr[0].get('a');
    const arr3 = arr[1].get(2);
    return { arr1,arr2, arr3};
}

export function Prototype0030(){
    const set1 = new Set([1, 2, 3]);
    const set2 = new Set(['x', 'y']);
    const arr = new Array(set1, set2);
    const arr1 = arr.length;
    const arr2 = arr[0].has(2);
    const arr3 = arr[1].has('z');
    return { arr1,arr2, arr3};
}

export function Prototype0041(){
    const arr = new Array('0');
    const arr1 = arr.length;
    const arr2 = arr[0];
    return { arr1,arr2, arr};
}

export function Prototype0045(){
    const obj = {
        [Symbol.toPrimitive](hint) {
            return hint === 'number' ? 3 : null;
        }
    };
    const arr = new Array(obj);
    const arr1 = arr.length;
    const arr2 = arr[2] === undefined
    return { arr1,arr2, arr};
}

export function Prototype0046(){
    const arrayLike = { length: 3, 0: 'a', 1: 'b', 2: 'c' };
    const arr = new Array(arrayLike);
    const arr1 = arr.length;
    const arr2 = arr[0][1];
    return { arr1, arr,arrayLike,arr2};
}

export function Prototype0058(){
    const nestedObj = { a: { b: { c: 1 } } };
    const arr = new Array(nestedObj);
    const arr1 = arr.length;
    const arr2 = arr[0].a.b.c;
    return { arr1, arr,arr2};
}

export function Prototype0059(){
    const obj = { name: 'circular' };
    obj.self = obj; // 创建循环引用
    const arr = new Array(obj);
    const arr1 = arr.length;
    const arr2 = arr[0];
    const arr3 = arr[0].self;
    const arr4 = arr[0].self.self.name;
    return { arr1, obj,arr2,arr3,arr4};
}

export function Prototype0060(){
    const frozenObj = Object.freeze({ prop: 'frozen' });
    const arr = new Array(frozenObj);
    const arr3 = arr.length;
    const arr1 = arr[0];
    const arr2 = arr[0].prop;
    return { arr1, frozenObj,arr2,arr3};
}

export function Prototype0061(){
    const sealedObj = { prop: 'sealed' };
    Object.seal(sealedObj);
    const arr = new Array(sealedObj);
    const arr3 = arr.length;
    const arr1 = arr[0];
    const arr2 = arr[0].prop;
    return { arr1, sealedObj,arr2,arr3};
}

export function Prototype0065(){
    const func1 = (x) => x * 2;
    const func2 = (s) => s.toUpperCase();
    const arr = new Array(func1, func2);
    const arr3 = arr.length;
    const arr1 = arr[0][5];
    const arr2 = arr[1]('test');
    return { arr1,arr2,arr3};
}

export function Prototype0066(){
    function* gen1() {
        yield 1;
        yield 2;
    }
    function* gen2() {
        yield 'a';
        yield 'b';
    }
    const arr = new Array(gen1, gen2);
    const arr3 = arr.length;
    const arr1 = Array.from(arr[0]());
    const arr2 = Array.from(arr[1]());
    return { arr1,arr2,arr3};
}

export function Prototype0067(){
    const asyncFunc1 = async () => 42;
    const asyncFunc2 = async (s)=> s;
    const arr = new Array(asyncFunc1, asyncFunc2);
    const arr3 = arr.length;
    return { arr3};
}

export function Prototype0069(){
    class ClassA {}
    class ClassB {}
    const arr = new Array(ClassA, ClassB);
    const arr3 = arr.length;
    const arr1= new arr[0]() === ClassA;
    const arr2 = new arr[1]() === ClassB;
    return {arr1,arr2, arr3,};
}

export function Prototype0070(){
    const module1 = { exports: { foo: 'bar' } };
    const module2 = { exports: () => 'test' };
    const arr = new Array(module1, module2);
    const arr3 = arr.length;
    const arr1= arr[0].exports.foo;
    const arr2 = arr[1].exports();
    return {arr1,arr2, arr3};
}

export function Prototype0079(){
    let args1, args2;
    (function() { args1 = arguments; })(1, 2, 3);
    (function() { args2 = arguments; })('a', 'b');
    const arr = new Array(args1, args2);
    const arr3 = arr.length;
    const arr1= arr[0].length;
    const arr2 = arr[1][0];
    return {arr1,arr2, arr3};
}

export function Prototype0080(){
    const map = new Map([['key', 'value']]);
    const set = new Set([1, 2, 3]);
    const arr = new Array(map, set);
    const arr3 = arr.length;
    const arr1= arr[0].get('key');
    const arr2 = arr[1].has(2);
    return {arr1,arr2, arr3};
}

export function Prototype0094(){
    const sym = Symbol('unique');
    const arr = new Array(sym);
    const arr3 = arr.length;
    const arr1= arr[0] === sym;
    const arr2 = Symbol.keyFor(arr[0]);
    return {arr1,arr2, arr3};
}

export function Prototype0100(){
    const obj = { id: 1 };
    const sym = Symbol('mixed');
    const arr = new Array(42, 'hello', true, obj, sym);
    const arr1 = arr.length;
    const arr2= arr[4] === sym;
    return {arr1,arr2, arr,obj};
}

export function Prototype0102(){
    const args = Array.from({ length: 1000 }, (_, i) => i);
    const arr = new Array(...args);
    const arr1 = arr.length;
    return {arr1, arr};
}


