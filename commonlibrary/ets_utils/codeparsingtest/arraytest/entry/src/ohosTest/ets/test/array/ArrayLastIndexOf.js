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

export function testArrayLastIndexOfJs0033() {
    const arr = Object.freeze([1, 2, 3]);
    const result = arr.lastIndexOf(2);
    return result;
}

export function testArrayLastIndexOfJs0037() {
    const obj = { val: 10 };
    const arr = [obj, { val: 10 }];
    const result = arr.lastIndexOf(obj);
    return result;
}

export function testArrayLastIndexOfJs0038() {
    const arr = [{ val: 1 }, { val: 1 }];
    const result = arr.lastIndexOf({ val: 1 });
    return result;
}

export function testArrayLastIndexOfJs0046() {
    const arr = [5, 10, 15];
    Object.seal(arr);
    const result = arr.lastIndexOf(10);
    return result;
}

export function testArrayLastIndexOfJs0047() {
    const arr = [1, 2, 3];
    Object.setPrototypeOf(arr, Object.create(null));
    const result = Array.prototype.lastIndexOf.call(arr, 2);
    return result;
}

export function testArrayLastIndexOfJs0048() {
    const obj = { 0: "a", 1: "b", 2: "a", length: 3 };
    const result = Array.prototype.lastIndexOf.call(obj, "a");
    return result;
}

export function testArrayLastIndexOfJs0051() {
    const obj = { 0: 1, 1: 2, 2: 3, length: 2 };
    const result = Array.prototype.lastIndexOf.call(obj, 3);
    return result;
}

export function testArrayLastIndexOfJs0052() {
    const obj = { "a": 10, "0": 20, length: 1 };
    const result = Array.prototype.lastIndexOf.call(obj, 20);
    return result;
}

export function testArrayLastIndexOfJs0053() {
    const str = "hello";
    const result = Array.prototype.lastIndexOf.call(str, "l");
    return result;
}

export function testArrayLastIndexOfJs0054() {
    const arr = ["a", "b", "a"];
    const result = arr.lastIndexOf("a", "1");
    return result;
}

export function testArrayLastIndexOfJs0056() {
    const proxy = new Proxy({ 0: "a", 1: "b", length: 2 }, {});
    const result = Array.prototype.lastIndexOf.call(proxy, "b");
    return result;
}

export function testArrayLastIndexOfJs0059() {
    let res = false;
    const arr = [];
    (Array.prototype)[0] = 42;
    const result = arr.lastIndexOf(42);
    if (result == -1) res = true;
    delete (Array.prototype)[0];
    return res;
}


export function testArrayLastIndexOfJs0074() {
    const arr = Object.freeze([1, 2, 3]);
    const result = arr.lastIndexOf(2);
    return result;
}

export function testArrayLastIndexOfJs0086() {
    const arr = new Int8Array([1, 2, 3, 2]);
    const proxyArr = new Proxy(arr,
    {
        get(target, prop) {
        if (prop === "length") return 4;
        return Reflect.get(target, prop);
    }
    });
    const result = Array.prototype.lastIndexOf.call(proxyArr, 2);
    return result;
}

export function testArrayLastIndexOfJs0104() {
    const arr = Object.freeze([1, 2, 3, 2]);
    const result = arr.lastIndexOf(2);
    return result;
}