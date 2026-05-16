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
export function objectExtendsTest1000(){
    const nullProtoObj = Object.create(null);
    nullProtoObj.key = 'value';

    return [nullProtoObj, Object.getPrototypeOf(nullProtoObj)]
}

export function objectExtendsTest1500(proto){
    const obj = Object.create(proto);
    obj.ownProp = 'own';
    return [obj.hasOwnProperty('ownProp'), obj.hasOwnProperty('inheritedProp'), obj.hasOwnProperty('nonExistProp')]
}

export function objectExtendsTest1600(proto){
    const obj = Object.create(proto);
    obj.own = 'ownVal';
    const nullProto = Object.create(null);
    nullProto.key = 'val';
    return [Object.hasOwn(obj, 'own'), Object.hasOwn(obj, 'inherited'), Object.hasOwn(obj, 'nonExist'), Object.hasOwn(nullProto, 'key')]
}

export function objectExtendsTest2200(proto1, proto2){
    const obj = Object.create(proto1);

    Object.setPrototypeOf(obj, proto2);
    return obj;
}

export function objectExtendsTest2600(){
}