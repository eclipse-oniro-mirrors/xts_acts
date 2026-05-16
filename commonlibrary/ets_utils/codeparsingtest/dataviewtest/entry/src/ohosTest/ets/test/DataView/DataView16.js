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

export function DataView16Test096() {
    const buffer96 = new ArrayBuffer(8);
    const view96 = new DataView(buffer96);
    const fromJson = JSON.parse('{"n": 42.42}').n;
    view96.setFloat64(0, fromJson, true);
    return view96.getFloat64(0, true) === fromJson;
}

export function DataView16Test097() {
    const buffer97 = new ArrayBuffer(8);
    const view97 = new DataView(buffer97);
    const reflectNum = Reflect.apply(Number, null, ['7.7']);
    view97.setFloat64(0, reflectNum, false);
    return view97.getFloat64(0, false) === reflectNum
}

export function DataView16Test098() {
    const buffer98 = new ArrayBuffer(8);
    const view98 = new DataView(buffer98);
    const objWithToPrim = { [Symbol.toPrimitive]: () => 99.99 };
    view98.setFloat64(0, +objWithToPrim, true);
    return view98.getFloat64(0, true);
}

export function DataView16Test0102() {
    const buffer102 = new ArrayBuffer(8);
    const view102 = new DataView(buffer102);
    const obj = {
        get val() {
            return 66.66;
        }
    };
    view102.setFloat64(0, obj.val, true);
    return view102.getFloat64(0, true);
}

export function DataView16Test104() {
    const buffer104 = new ArrayBuffer(8);
    const view104 = new DataView(buffer104);
    const matchNum = +("price: 42.42".match(/\d+\.\d+/)[0]);
    view104.setFloat64(0, matchNum, true);
    return view104.getFloat64(0, true) === matchNum;
}

export function DataView16Test121() {
    const buffer121 = new ArrayBuffer(8);
    const view121 = new DataView(buffer121);
    const objVal = Object.values({ a: 1.1 })[0];
    view121.setFloat64(0, objVal, false);
    return view121.getFloat64(0, false);
}

export function DataView16Test123() {
    const buffer123 = new ArrayBuffer(8);
    const view123 = new DataView(buffer123);
    const mapVal = new Map([['key', 7.77]]).get('key');
    view123.setFloat64(0, mapVal, false);
    return view123.getFloat64(0, false);
}

export function DataView16Test124() {
    const buffer124 = new ArrayBuffer(8);
    const view124 = new DataView(buffer124);
    const setVal = [...new Set([8.88])][0];
    view124.setFloat64(0, setVal, true);
    return view124.getFloat64(0, true);
}

export function DataView16Test126() {
    const buffer126 = new ArrayBuffer(8);
    const view126 = new DataView(buffer126);

    function* gen() {
        yield 10.10;
    }

    const genVal = gen().next().value;
    view126.setFloat64(0, genVal, true);
    return view126.getFloat64(0, true);
}

export function DataView16Test128() {
    const buffer128 = new ArrayBuffer(8);
    const view128 = new DataView(buffer128);
    const obj = {};
    Object.defineProperty(obj, 'num', { value: 12.12, writable: false });
    view128.setFloat64(0, obj.num, true);
    return view128.getFloat64(0, true);
}

export function DataView16Test129() {
    const buffer129 = new ArrayBuffer(8);
    const view129 = new DataView(buffer129);
    const proxy = new Proxy({}, { get: () => 13.13 });
    view129.setFloat64(0, proxy.anyProp, false);
    return view129.getFloat64(0, false);
}

export function DataView16Test130() {
    const buffer130 = new ArrayBuffer(8);
    const view130 = new DataView(buffer130);
    const target = { x: 14.14 };
    const reflectGetVal = Reflect.get(target, 'x');
    view130.setFloat64(0, reflectGetVal, true);
    return view130.getFloat64(0, true);
}

export function DataView16Test131() {
    const buffer131 = new ArrayBuffer(8);
    const view131 = new DataView(buffer131);
    const merged = Object.assign({}, { y: 15.15 }).y;
    view131.setFloat64(0, merged, false);
    return view131.getFloat64(0, false);
}

export function DataView16Test132() {
    const buffer132 = new ArrayBuffer(8);
    const view132 = new DataView(buffer132);
    const roundTrip = JSON.parse(JSON.stringify({ z: 16.16 })).z;
    view132.setFloat64(0, roundTrip, true);
    return view132.getFloat64(0, true);
}

export function DataView16Test133() {
    const buffer133 = new ArrayBuffer(8);
    const view133 = new DataView(buffer133);
    const fromArr = Array.from({ length: 1 }, () => 17.17)[0];
    view133.setFloat64(0, fromArr, false);
    return view133.getFloat64(0, false);
}

export function DataView16Test136() {
    const buffer136 = new ArrayBuffer(8);
    const view136 = new DataView(buffer136);
    const timeOrigin = typeof performance !== 'undefined' ? performance.timeOrigin : 1700000000000.123;
    view136.setFloat64(0, timeOrigin, true);
    return view136.getFloat64(0, true) === timeOrigin;
}

