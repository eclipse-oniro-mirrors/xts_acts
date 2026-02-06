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

export function DataView21Test039() {
    const buffer39 = new ArrayBuffer(2);
    const dv39 = new DataView(buffer39);
    dv39.setUint16(0, 0x33CC, 0);
    const result39 = dv39.getUint16(0);
    return result39;

}

export function DataView21Test040() {
    const buffer40 = new ArrayBuffer(2);
    const dv40 = new DataView(buffer40);
    dv40.setUint16(0, 0x44BB, 1);
    const result40 = dv40.getUint16(0, true);
    return result40;
}

export function DataView21Test052() {
    const buffer52 = new ArrayBuffer(2);
    const dv52 = new DataView(buffer52);
    dv52.setUint16(0, 0x4444, null);
    const result52 = dv52.getUint16(0);
    return result52;
}

export function DataView21Test053() {
    const buffer53 = new ArrayBuffer(2);
    const dv53 = new DataView(buffer53);
    dv53.setUint16(0, 0x5555, "true");
    const result53 = dv53.getUint16(0, true);
    return result53;
}

export function DataView21Test071() {
    const buffer71 = new ArrayBuffer(2);
    const dv71 = new DataView(buffer71);
    dv71.setUint16(0, true);
    const result71 = dv71.getUint16(0);
    return result71;
}

export function DataView21Test072() {
    const buffer72 = new ArrayBuffer(2);
    const dv72 = new DataView(buffer72);
    dv72.setUint16(0, false, true);
    const result72 = dv72.getUint16(0, true);
    return result72;
}

export function DataView21Test073() {
    const buffer73 = new ArrayBuffer(2);
    const dv73 = new DataView(buffer73);
    dv73.setUint16(0, "456");
    const result73 = dv73.getUint16(0);
    return result73;
}

export function DataView21Test074() {
    const buffer74 = new ArrayBuffer(2);
    const dv74 = new DataView(buffer74);
    dv74.setUint16(0, "0xABCD", true);
    const result74 = dv74.getUint16(0, true);
    return result74;
}

export function DataView21Test075() {
    const buffer75 = new ArrayBuffer(2);
    const dv75 = new DataView(buffer75);
    dv75.setUint16(0, 0x1122, {});
    const result75 = dv75.getUint16(0, true);
    return result75;
}

export function DataView21Test076() {
    const buffer76 = new ArrayBuffer(2);
    const dv76 = new DataView(buffer76);
    dv76.setUint16(0, 0x3344, "");
    const result76 = dv76.getUint16(0);
    return result76;
}

export function DataView21Test097() {
    const buffer97 = new ArrayBuffer(2);
    const dv97 = new DataView(buffer97);
    dv97.setUint16(0, "65535");
    const result97 = dv97.getUint16(0);
    return result97;
}

export function DataView21Test103() {
    const buffer103 = new ArrayBuffer(4);
    const dv103 = new DataView(buffer103);
    dv103.setUint16(0, 0x1122, null);
    dv103.setUint16(2, 0x1122, undefined);
    const r5 = dv103.getUint16(0);
    const r6 = dv103.getUint16(2);
    return r5 === r6;
}

export function DataView21Test109() {
    const buffer109 = new ArrayBuffer(2);
    const dv109 = new DataView(buffer109);
    let error109;
    try {
        dv109.setUint16(1, 0x1234);
    } catch (e) {
        error109 = e;
    }
    return error109 instanceof RangeError;
}

export function DataView21Test110() {
    const buffer110 = new ArrayBuffer(2);
    const dv110 = new DataView(buffer110);
    dv110.setUint16(0, "0b10101010", true);
    const result110 = dv110.getUint16(0, true);
    return result110;
}

export function DataView21Test116() {
    const buffer116 = new ArrayBuffer(2);
    const dv116 = new DataView(buffer116);
    dv116.setUint16(0, [1, 2, 3]);
    const result116 = dv116.getUint16(0);
    return result116;
}

export function DataView21Test117() {
    const buffer117 = new ArrayBuffer(2);
    const dv117 = new DataView(buffer117);
    const func = () => {
    };
    dv117.setUint16(0, 0x4567, func);
    const result117 = dv117.getUint16(0, true);
    return result117;
}

export function DataView21Test124() {
    const buffer124 = new ArrayBuffer(2);
    const dv124 = new DataView(buffer124);
    dv124.setUint16(0, null, true);
    const result124 = dv124.getUint16(0, true);
    return result124;
}

export function DataView21Test125() {
    const buffer125 = new ArrayBuffer(2);
    const dv125 = new DataView(buffer125);
    dv125.setUint16(0, undefined);
    const result125 = dv125.getUint16(0);
    return result125;
}

export function DataView21Test128() {
    const buffer128 = new ArrayBuffer(2);
    const dv128 = new DataView(buffer128);
    dv128.setUint16(0, "0");
    const result128 = dv128.getUint16(0);
    return result128;
}

export function DataView21Test129() {
    const buffer129 = new ArrayBuffer(2);
    const dv129 = new DataView(buffer129);
    dv129.setUint16(0, "0b1111111111111111", true);
    const result129 = dv129.getUint16(0, true);
    return result129;
}

export function DataView21Test136() {
    const buffer136 = new ArrayBuffer(2);
    const dv136 = new DataView(buffer136);
    const obj = { valueOf: () => 123 };
    dv136.setUint16(0, obj);
    const result136 = dv136.getUint16(0);
    return result136;
}

export function DataView21Test141() {
    const buffer141 = new ArrayBuffer(2);
    const dv141 = new DataView(buffer141);
    dv141.setUint16(0, "abc", true);
    const result141 = dv141.getUint16(0, true);
    return result141;
}



