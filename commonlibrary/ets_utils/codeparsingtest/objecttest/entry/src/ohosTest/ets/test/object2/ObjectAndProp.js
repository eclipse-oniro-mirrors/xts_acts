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
export function createObj(){
    const proto = { };
    const obj = Object.create(proto, {
        nonConfigurable: {
            value: 'cannotDelete',
            configurable: false,
            enumerable: true
        },
        base: {
            value: 'baseVal',
            configurable: true,
            enumerable: true
        }
    });
    return obj;
}
export function deleteNonConfigurable(obj){
    try {
        let boo = delete obj.nonConfigurable;
        return boo;
    } catch (e){
        return false
    }
}
export function deleteBase(obj){
    let boo = delete obj.base;
    return boo;
}

export function symbolTest(){
    const sym1 = Symbol("key1");
    const sym2 = Symbol("key2");
    const myObj = { };
    myObj[sym1] = "sym1-val";
    myObj[sym2] = "sym2-val";
    return [sym1, sym2, myObj]
}

export function symbolTest1(){
    const sym1 = Symbol.for('key1');
    const sym2 = Symbol.for('key1');
    const myObj = {}
    myObj[sym1] = "global-val";
    return [sym1, sym2, myObj]
}

export function objectPropTest3200(){
    const obj = new Object();
    obj.prop = "value";
    return obj;
}
export function objectPropTest3200Del(obj){
    delete obj.prop;
}
export function objectPropTest3200_1(obj){
    return obj.hasOwnProperty("prop")
}
export function objectPropTest3300(){
    Object.prototype.protoProp = "proto-val";
    const obj = new Object();
    return delete obj.protoProp;
}
export function objectPropTest3300_1(){
    Object.prototype.protoProp = "proto-val";
    const obj = new Object();
    delete obj.protoProp;
    return Object.prototype.protoProp;
}
export function objectPropTest3300_2(){
    Object.prototype.protoProp = "proto-val";
    const obj = new Object();
    delete Object.prototype.protoProp;
    return Object.prototype.protoProp;
}
export function objectPropTest4600(){
    const parent = { "inherited": "val" };
    const child = Object.create(parent);
    child.own = "own-val";
    let propCount = 0;
    for (const prop in child) {
        propCount++;
    }
    return propCount;
}
export function objectPropTest4700(){
    const parent = { inherited: "val" };
    const child = Object.create(parent);
    child.own = "own-val";
    return [child.hasOwnProperty("own"), child.hasOwnProperty("inherited")];
}
export function objectPropTest5500(){
    const baseSpec = { weight: '1kg', material: 'plastic' };
    const toolProto = Object.create(baseSpec);
    toolProto.use = () => 'cut materials';

    const toolBox = {
        name: 'Hand Tool Box',
        tools: [
            Object.create(toolProto),
            Object.create(toolProto)
        ]
    };
    return toolBox;
}
export function objectPropTest6600(grandparent){
    return Object.create(grandparent);
}