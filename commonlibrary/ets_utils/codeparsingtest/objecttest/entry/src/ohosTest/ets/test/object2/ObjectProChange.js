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

export function objectProChangeTest0100(){
    const obj = {
        a : 1,
        b : 2,
        c : 4
    }
    return obj;
}
export function objectProChangeTest0101(){
    const obj = {
        a : 1,
        b : 2,
        c : 4
    }
    obj.d = 8;
    return obj;
}
export function objectProChangeTest0102(){
    const obj = {
        a : 1,
        b : 4,
        c : 8
    }
    obj.d = 16;
    return obj;
}
export function objectProChangeTest0103(){
    const obj = {
        a : 1,
        b : '4',
        c : 8
    }
    obj.d = 16;
    return obj;
}
export function objectProChangeTest0201(){
    const obj = {
        a : 1,
        b : 2,
        c : 4
    }
    obj.d = 8;
    obj.e = 16;
    obj.f = 32;
    return obj;
}
export function objectProChangeTest0202(){
    const obj = {
        a : 1,
        b : 4,
        c : 8
    }
    obj.d = 16;
    obj.e = 32;
    obj.f = 64;
    return obj;
}
export function objectProChangeTest0203(){
    const obj = {
        a : 1,
        b : '4',
        c : 8
    }
    obj.d = 16;
    obj.e = '32';
    obj.f = 64;
    return obj;
}
export function objectProChangeTest0301(){
    const obj = {
        a : 1,
        b : 2,
        c : 4
    }
    delete obj.a;
    return obj;
}
export function objectProChangeTest0302(){
    const obj = {
        a : 1,
        b : 4,
        c : 8
    }
    delete obj.a;
    delete obj.b;
    return obj;
}
export function objectProChangeTest0303(){
    const obj = {
        a : 1,
        b : '4',
        c : 8
    }
    delete obj.a;
    delete obj.b;
    delete obj.c;
    return obj;
}
export function objectProChangeTest0401(){
    const obj = {
        a : 1,
        b : '4',
        c : 8
    }
    let newObj = {...obj, age: 0, gender: 'Female'}
    return newObj;
}
export function objectProChangeTest0501(){
    const obj = {
        a : 1,
        b : '4',
        c : 8
    }
    Object.defineProperty(obj, 'gender', {
        value: 'Female',
        writable: true,
        enumerable: true,
        configurable: true
    })
    Object.defineProperty(obj, 'age', {
        value: 26,
        writable: true,
        enumerable: true,
        configurable: true
    })
    return obj;
}
export function objectProChangeTest0601(){
    const obj = {
        a : 1,
        b : '4',
        c : 8
    }
    Object.defineProperties(obj, {
        gender: {
            value: 'Female',
            writable: true,
            enumerable: true,
            configurable: true
        },
        age: {
            value: 26,
            writable: true,
            enumerable: true,
            configurable: true
        }
    })
    return obj;
}