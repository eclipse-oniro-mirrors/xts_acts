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

export function testArrayFindIndexJs0009() {
    const sym1 = Symbol("a");
    const sym2 = Symbol("b");
    const arr = [sym1, sym2];
    const index = arr.findIndex((x) => x === sym2);
    return index;
}

export function testArrayFindIndexJs0023() {
    const arr = Object.freeze([1,2,3]);
    const index = arr.findIndex((x) => x === 5);
    return index;
}

export function testArrayFindIndexJs0029() {
    class Item { data; constructor(v){ this.data = { value:v }; } }
    const arr = [new Item(1), new Item(5)];
    const index = arr.findIndex((x) => x.data.value === 5);
    return index;
}

export function testArrayFindIndexJs0047() {
    const arr = [1,2,3,4];
    const index = arr.findIndex((x, i, a) => {
        if (i === 0) delete a[1];
        return x === 2;
    });
    return index;
}

export function testArrayFindIndexJs0051() {
    class NonArray { a = 1; }
    const obj = new NonArray();
    let index = 1;
    try {
        index = Array.prototype.findIndex.call(obj, x => x===1);
    }
    catch(e) {
        index = -1;
    }
    return index;
}

export function testArrayFindIndexJs0054() {
    const arr = [1,2,3];
    let errorCaught = false;
    try {
        arr.findIndex(null);
    }
    catch(e){
        errorCaught = true;
    }
    return errorCaught;
}

export function testArrayFindIndexJs0062() {
    const arr = [10,20,30];
    Object.freeze(arr);
    const index = arr.findIndex(x=>x===20);
    return index;
}

export function testArrayFindIndexJs0064() {
    const arr = [1,2,3];
    delete arr[1];
    const index = arr.findIndex(x=>x===2);
    return index;
}

export function testArrayFindIndexJs0074() {
    const protoArr = [10,20];
    Array.prototype.push.call(protoArr,30);
    const index = protoArr.findIndex(x=>x===30);
    return index;
}

export function testArrayFindIndexJs0076() {
    const arr = [1,2,3,4];
    delete arr[0];
    delete arr[2];
    const index = arr.findIndex(x=>x===3);
    return index;
}

export function testArrayFindIndexJs0079() {
    class Item { data; constructor(v){this.data={value:v};} }
    const arr = [new Item(1), new Item(2)];
    const index = arr.findIndex(x=>x.data.value===2);
    return index;
}

export function testArrayFindIndexJs0092() {
    const arr = [1,2,3,4];
    const index = arr.findIndex((x,i,a)=>{ if(i===1) delete a[2]; return x===3; });
    return index;
}

export function testArrayFindIndexJs0094() {
    class Item { data; constructor(v){this.data={value:v};} }
    const arr = [new Item(1), new Item(2)];
    const index = arr.findIndex(x=>x.data.value===2);
    return index;
}

export function testArrayFindIndexJs0101() {
    const target = [1, 2, 3, 4];
    const proxy = new Proxy(target, {
        get: (obj, prop) => {
        return Number(prop) >= 0 ? obj[prop] * 2 : obj[prop];
    }
    });
    const result = proxy.findIndex((x) => x === 6);
    return result;
}

export function testArrayFindIndexJs0102() {
    const proto = [10, 20];
    const arr = [1, 2];
    Object.setPrototypeOf(arr, proto);
    const result = arr.findIndex((x) => x === 20);
    return result;
}

export function testArrayFindIndexJs0110() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        get: (obj, prop) => {
        if (prop === "3") return 4;
        return Number(prop) >= 0 ? obj[prop] : obj[prop];
    }
    });
    const result = proxy.findIndex((x) => x === 4);
    return result;
}

export function testArrayFindIndexJs0111() {
    const arr = Object.freeze([5, 10, 15]);
    const result = arr.findIndex((x) => x === 10);
    return result;
}

export function testArrayFindIndexJs0117() {
    const arr = Object.freeze([1, 2, 3]);
    let errorCaught = false;
    try {
        arr.fill(9);
    } catch {
        errorCaught = true;
    }
    return errorCaught;
}

export function testArrayFindIndexJs0116() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        set: (obj, prop, value) => {
        if (Number(prop) >= 0) obj[Number(prop)] = value * 2;
        return true;
    }
    });
    proxy.fill(5);
    return [proxy[0], proxy[1], proxy[2]];
}
