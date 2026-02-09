/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export function ArrayConstructor0014(){
    const arr = new Array(1, 'a', true);
    return { arr }
}

export function ArrayConstructor0019(){
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const arr = new Array(sym1, sym2);
    const arr1 = arr.length === 2;
    const arr2 = arr[0] === sym1;
    const arr3 = arr[1] === sym2;
    return { arr1,arr2,arr3 }
}

export function ArrayConstructor0029(){
    const set1 = new Set([1, 2]);
    const set2 = new Set(['a', 'b']);
    const arr = new Array(set1, set2);
    const arr1 = arr.length;
    const arr2 = arr[0].has(1);
    const arr3 = arr[1].size;
    return { arr1,arr2,arr3 }
}

export function ArrayConstructor0045(){
    const nested1 = [1, [2, 3]];
    const nested2= [[[4]]];
    const arr = new Array(nested1, nested2);
    const arr1 = arr.length;
    const arr2 = (arr[0][1])[0];
    const arr3 = arr[1][0][0][0];
    return { arr1,arr2,arr3 }
}

export function ArrayConstructor0048(){
    const arr= new Array(1, 2);
    arr.push(arr);
    const arr1 = arr.length;
    const arr2 = arr[2];
    const arr3 = arr[2][0];
    return { arr,arr1,arr2,arr3 }
}

export function ArrayConstructor0050(){
    function createArray(elements) {
        return new Array(...elements);
    }
    const arr = createArray('a', 'b', 'c');
    return { arr }
}

export function ArrayConstructor0052(){

    const obj1 = Object.freeze({ a: 1 });
    const obj2 = Object.freeze({ b: 2 });
    const arr = new Array(obj1, obj2);
    const arr1 = arr[0];
    const arr2 = arr[1];
    return { obj1,obj2,arr,arr1,arr2 };
}

export function ArrayConstructor0053(){
    const obj1 = { a: 1 };
    Object.seal(obj1);
    const obj2 = { b: 2 };
    Object.seal(obj2);
    const arr = new Array(obj1, obj2);
    const arr1 = arr.length;
    const arr2 = arr[0].a;
    return { arr,arr1,arr2 };
}



export function ArrayConstructor0072(){
    const arr = new Array(1, NaN, 3);
    const arr1 = arr.length;
    const arr2 = Object.is(arr[1], NaN)
    return { arr,arr1,arr2 };
}

export function ArrayConstructor0076(){
    function* gen1() { yield 1; yield 2; }
    function* gen2() { yield 'a'; yield 'b'; }
    const arr = new Array(gen1, gen2);
    const arr1 = arr.length;
    const g1 = arr[0]();
    const g2 = arr[1]();
    const arr2 = g1.next().value;
    const arr3 = g2.next().value;
    return { arr,arr1,arr2,arr3 };
}

export function ArrayConstructor0085(){
    const arr = new Array(1, 2, 3);
    const newArr = arr.with(1, 5);
    const arr1 = newArr[1];
    const arr2 = arr[1];
    return { arr1,arr2 };
}

export function ArrayConstructor0088(){
    const arr = new Array(3);
    arr[1] = 10;
    delete arr[1];
    const arr1 = arr.length;
    const arr2 = arr[1];
    return { arr1,arr2 };
}

export function ArrayConstructor0089(){
    const arr = new Array(1, 2, 3);
    delete arr[1];
    const arr1 = arr.length;
    const arr2 = arr[1];
    return { arr1,arr2 };
}

export function ArrayConstructor0090(){
    const target1 = { value: 10 };
    const proxy1 = new Proxy(target1, {
        get: (obj, prop) => prop === 'value' ? obj[prop] * 2 : obj[prop]
    });
    const target2 = { value: 20 };
    const proxy2 = new Proxy(target2, {
        get: (obj, prop) => prop === 'value' ? obj[prop] * 2 : obj[prop]
    });
    const arr = new Array(proxy1, proxy2);
    const arr1 = arr.length;
    const arr2 = arr[0];
    const arr3 = arr[1];
    return { arr1,arr2,arr3 };
}


export function ArrayConstructor0096(){
    const arr = new Array(3);
    const arr1 = Object.isExtensible(arr)
    arr[3] = 4;
    return { arr1,arr };
}

export function ArrayConstructor0097(){
    const arr = new Array(1, 2, 3);
    const arr1 = Object.preventExtensions(arr);
    return { arr1,arr };
}

export function ArrayConstructor0106(){
    const arr = new Array(3, 1, 4, 1, 5);
    const arr1 = Array.prototype.indexOf.call(arr, 1);
    const arr2 = Array.prototype.lastIndexOf.call(arr, 1);
    return { arr1,arr2 };
}

export function ArrayConstructor0108(){
    const arr = new Array(1, 2, 3);
    const arrayLike = { length: arr.length, 0: arr[0], 1: arr[1], 2: arr[2] };
    const newArr = new Array().slice.call(arrayLike);
    return { newArr };
}

export function ArrayConstructor0109(){
    const arr = new Array(3);
    arr[0] = 10;
    arr[2] = 30;
    const arrayLike = { length: arr.length, 0: arr[0], 1: arr[1], 2: arr[2] };
    const newArr = Array.from(arrayLike);
    return { newArr };
}

export function ArrayConstructor0110(){
      const sym = Symbol('test');
      const obj = { prop: 'value' };
      const arr = new Array(
        42,
        'string',
        true,
        obj,
        sym,
        null,
        undefined
      );
      let test = arr[4] === sym;
      return { arr,obj,test };
}