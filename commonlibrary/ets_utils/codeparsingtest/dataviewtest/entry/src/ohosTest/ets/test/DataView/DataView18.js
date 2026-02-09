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

export function DataView18Test038() {
    const buffer38 = new ArrayBuffer(2);
    const dataView38 = new DataView(buffer38);
    dataView38.setInt16(0, null, true);
    return dataView38.getInt16(0, true);
}

export function DataView18Test039() {
    const buffer39 = new ArrayBuffer(2);
    const dataView39 = new DataView(buffer39);
    dataView39.setInt16(0, undefined, true);
    return dataView39.getInt16(0, true);
}

export function DataView18Test040() {
    const buffer40 = new ArrayBuffer(2);
    const dataView40 = new DataView(buffer40);
    dataView40.setInt16(0, true, true);
    return dataView40.getInt16(0, true);
}

export function DataView18Test041() {
    const buffer41 = new ArrayBuffer(2);
    const dataView41 = new DataView(buffer41);
    dataView41.setInt16(0, false, true);
    return dataView41.getInt16(0, true);
}

export function DataView18Test042() {
    const buffer42 = new ArrayBuffer(2);
    const dataView42 = new DataView(buffer42);
    dataView42.setInt16(0, "456", true);
    return dataView42.getInt16(0, true);
}

export function DataView18Test043() {
    const buffer43 = new ArrayBuffer(2);
    const dataView43 = new DataView(buffer43);
    dataView43.setInt16(0, "-456", true);
    return dataView43.getInt16(0, true);
}

export function DataView18Test044() {
    const buffer44 = new ArrayBuffer(2);
    const dataView44 = new DataView(buffer44);
    dataView44.setInt16(0, "abc", true);
    return dataView44.getInt16(0, true);
}

export function DataView18Test045() {
    const buffer45 = new ArrayBuffer(2);
    const dataView45 = new DataView(buffer45);
    dataView45.setInt16(0, "", true);
    return dataView45.getInt16(0, true);
}

export function DataView18Test047() {
    const buffer47 = new ArrayBuffer(2);
    const dataView47 = new DataView(buffer47);
    const result47 = dataView47.setInt16(0, 100, true);
    return result47 === undefined;
}

export function DataView18Test053() {
    const buffer53 = new ArrayBuffer(2);
    const dataView53 = new DataView(buffer53);
    dataView53.setInt16(0, {}, true);
    return dataView53.getInt16(0, true);
}

export function DataView18Test054() {
    const buffer54 = new ArrayBuffer(2);
    const dataView54 = new DataView(buffer54);
    dataView54.setInt16(0, [123], true);
    return dataView54.getInt16(0, true);
}

export function DataView18Test055() {
    const buffer55 = new ArrayBuffer(2);
    const dataView55 = new DataView(buffer55);
    dataView55.setInt16(0, [123, 456], true);
    return dataView55.getInt16(0, true);
}

export function DataView18Test069() {
    const buffer69 = new ArrayBuffer(2);
    const dataView69 = new DataView(buffer69);
    let error69 = null;
    try {
        dataView69.setInt16(1, 123, true);
    } catch (e) {
        error69 = e;
    }
    return error69 instanceof RangeError;
}

export function DataView18Test070() {
    const buffer70 = new ArrayBuffer(4);
    const dataView70 = new DataView(buffer70);
    let error70 = null;
    try {
        dataView70.setInt16(-1, 123, true);
    } catch (e) {
        error70 = e;
    }
    return error70 instanceof RangeError;
}

export function DataView18Test086() {
    const buffer86 = new ArrayBuffer(2);
    const dv86 = new DataView(buffer86);
    dv86.setInt16(0, 0x1234, 0);
    const uint8_86 = new Uint8Array(buffer86);
    return uint8_86[0];
}

export function DataView18Test087() {
    const buffer87 = new ArrayBuffer(2);
    const dv87 = new DataView(buffer87);
    dv87.setInt16(0, 0x1234, 1);
    const uint8_87 = new Uint8Array(buffer87);
    return uint8_87[0];
}

export function DataView18Test088() {
    const buffer88 = new ArrayBuffer(2);
    const dv88 = new DataView(buffer88);
    dv88.setInt16(0, 0x1234, "true");
    const uint8_88 = new Uint8Array(buffer88);
    return uint8_88[0];
}

export function DataView18Test089() {
    const buffer89 = new ArrayBuffer(2);
    const dv89 = new DataView(buffer89);
    dv89.setInt16(0, 0x1234, "false");
    const uint8_89 = new Uint8Array(buffer89);
    return uint8_89[0];
}

export function DataView18Test096() {
    const buffer96 = new ArrayBuffer(2);
    const dv96 = new DataView(buffer96);
    let error96 = null;
    try {
        dv96.setInt16(2, 123, true);
    } catch (e) {
        error96 = e;
    }
    return error96 instanceof RangeError;
}

export function DataView18Test097() {
    const buffer97 = new ArrayBuffer(2);
    const dv97 = new DataView(buffer97);
    let error97 = null;
    try {
        dv97.setInt16(-Infinity, 123, true);
    } catch (e) {
        error97 = e;
    }
    return error97 instanceof RangeError;
}

export function DataView18Test099() {
    const buffer99 = new ArrayBuffer(2);
    const dv99 = new DataView(buffer99);
    const obj99 = { valueOf: () => 456 };
    dv99.setInt16(0, obj99, true);
    return dv99.getInt16(0, true);
}

export function DataView18Test100() {
    const buffer100 = new ArrayBuffer(2);
    const dv100 = new DataView(buffer100);
    const obj100 = {
        toString: () => "789",
        valueOf: undefined
    };
    dv100.setInt16(0, obj100, true);
    return dv100.getInt16(0, true);
}

export function DataView18Test101() {
    const buffer101 = new ArrayBuffer(2);
    const dv101 = new DataView(buffer101);
    const obj101 = {
        valueOf: () => 123,
        toString: () => "should not be used"
    };
    dv101.setInt16(0, obj101, true);
    return dv101.getInt16(0, true);
}

export function DataView18Test104() {
    const buffer104 = new ArrayBuffer(10);
    const dv104 = new DataView(buffer104, 2, 6);
    let error104 = null;
    try {
        dv104.setInt16(6, 123, true);
    } catch (e) {
        error104 = e;
    }
    return error104 instanceof RangeError;
}

export function DataView18Test118() {
    const buffer118 = new ArrayBuffer(0);
    const dv118 = new DataView(buffer118);
    let error118 = null;
    try {
        dv118.setInt16(0, 123, true);
    } catch (e) {
        error118 = e;
    }
    return error118 instanceof RangeError;
}

export function DataView18Test130() {
    const buffer130 = new ArrayBuffer(2);
    const dv130 = new DataView(buffer130);
    dv130.setInt16(0, null, true);
    return dv130.getInt16(0, true);
}

export function DataView18Test131() {
    const buffer131 = new ArrayBuffer(2);
    const dv131 = new DataView(buffer131);
    dv131.setInt16(0, "0", true);
    return dv131.getInt16(0, true);
}

export function DataView18Test132() {
    const buffer132 = new ArrayBuffer(2);
    const dv132 = new DataView(buffer132);
    dv132.setInt16(0, "-0", true);
    return dv132.getInt16(0, true);
}

export function DataView18Test133() {
    const buffer133 = new ArrayBuffer(2);
    const dv133 = new DataView(buffer133);
    dv133.setInt16(0, "+123", true);
    return dv133.getInt16(0, true);
}

export function DataView18Test139() {
    const buffer139 = new ArrayBuffer(2);
    const dv139 = new DataView(buffer139);
    dv139.setInt16(0, !0, true);
    return dv139.getInt16(0, true);
}

export function DataView18Test140() {
    const buffer140 = new ArrayBuffer(2);
    const dv140 = new DataView(buffer140);
    dv140.setInt16(0, !!456, true);
    return dv140.getInt16(0, true);
}

export function DataView18Test143() {
    const buffer143 = new ArrayBuffer(2);
    const dv143 = new DataView(buffer143);
    dv143.setInt16(0, 0x1234, {});
    const u8_143 = new Uint8Array(buffer143);
    return u8_143[0];
}

export function DataView18Test144() {
    const buffer144 = new ArrayBuffer(2);
    const dv144 = new DataView(buffer144);
    dv144.setInt16(0, 0x1234, []);
    const u8_144 = new Uint8Array(buffer144);
    return u8_144[0];
}

export function DataView18Test145() {
    const buffer145 = new ArrayBuffer(0);
    const dv145 = new DataView(buffer145, 0, 0);
    let error145 = null;
    try {
        dv145.setInt16(0, 123, true);
    } catch (e) {
        error145 = e;
    }
    return error145 instanceof RangeError;
}

export function DataView18Test146() {
    let error146 = null;
    try {
        const buf = new ArrayBuffer(4);
        const dv = new DataView(buf, 5);
    } catch (e) {
        error146 = e;
    }
    return error146 instanceof RangeError;
}

export function DataView18Test147() {
    let error147 = null;
    try {
        const buf = new ArrayBuffer(4);
        const dv = new DataView(buf, 0, -1);
    } catch (e) {
        error147 = e;
    }
    return error147 instanceof RangeError;
}

export function DataView18Test148() {
    let error148 = null;
    try {
        const buf = new ArrayBuffer(4);
        const dv = new DataView(buf, 2, 3);
    } catch (e) {
        error148 = e;
    }
    return error148 instanceof RangeError;
}

export function DataView18Test149() {
    const buffer149 = new ArrayBuffer(2);
    const dv149 = new DataView(buffer149);
    dv149.setInt16(0, +'456', true);
    return dv149.getInt16(0, true);
}

export function DataView18Test150() {
    const buffer150 = new ArrayBuffer(2);
    const dv150 = new DataView(buffer150);
    dv150.setInt16(0, -'456', true);
    return dv150.getInt16(0, true);
}





