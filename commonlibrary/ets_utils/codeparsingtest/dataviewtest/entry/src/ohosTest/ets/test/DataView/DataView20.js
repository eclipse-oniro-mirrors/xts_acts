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

export function DataView20Test025() {
    let error25;
    try {
        const buffer25 = new ArrayBuffer(0);
        const dataView25 = new DataView(buffer25);
        dataView25.setUint8(0, 1);
    } catch (e) {
        error25 = e;
    }
    return error25 instanceof RangeError;
}
export function DataView20Test026() {
    let error26;
    try {
        const buffer26 = new ArrayBuffer(2);
        const dataView26 = new DataView(buffer26);
        dataView26.setUint8(2, 10);
    } catch (e) {
        error26 = e;
    }
    return error26 instanceof RangeError;
}
export function DataView20Test027() {
    let error27;
    try {
        const buffer27 = new ArrayBuffer(1);
        const dataView27 = new DataView(buffer27);
        dataView27.setUint8(-1, 5);
    } catch (e) {
        error27 = e;
    }
    return error27 instanceof RangeError;
}
export function DataView20Test030() {
    const buffer30 = new ArrayBuffer(1);
    const dataView30 = new DataView(buffer30);
    dataView30.setUint8(0, null);
    return dataView30.getUint8(0);
}
export function DataView20Test031() {
    const buffer31 = new ArrayBuffer(1);
    const dataView31 = new DataView(buffer31);
    dataView31.setUint8(0, undefined);
    return dataView31.getUint8(0);
}
export function DataView20Test033() {
    const buffer33 = new ArrayBuffer(1);
    const dataView33 = new DataView(buffer33);
    dataView33.setUint8(0, '66');
    return dataView33.getUint8(0);
}
export function DataView20Test034() {
    const buffer34 = new ArrayBuffer(1);
    const dataView34 = new DataView(buffer34);
    dataView34.setUint8(0, true);
    return dataView34.getUint8(0);
}
export function DataView20Test035() {
    const buffer35 = new ArrayBuffer(1);
    const dataView35 = new DataView(buffer35);
    dataView35.setUint8(0, false);
    return dataView35.getUint8(0);
}
export function DataView20Test039() {
    let error39;
    try {
        const buffer39 = new ArrayBuffer(1);
        const dataView39 = new DataView(buffer39);
        dataView39.setUint8(0.5, 10);
    } catch (e) {
        error39 = e;
    }
    return error39 instanceof RangeError;
}
export function DataView20Test041() {
    const buffer41 = new ArrayBuffer(1);
    const dataView41 = new DataView(buffer41);
    dataView41.setUint8(0, "255");
    return dataView41.getUint8(0);
}
export function DataView20Test042() {
    const buffer42 = new ArrayBuffer(1);
    const dataView42 = new DataView(buffer42);
    dataView42.setUint8(0, "abc");
    return dataView42.getUint8(0);
}
export function DataView20Test052() {
    const buffer52 = new ArrayBuffer(1);
    const dataView52 = new DataView(buffer52);
    dataView52.setUint8(0, { valueOf: () => 100 });
    return dataView52.getUint8(0);
}
export function DataView20Test053() {
    const buffer53 = new ArrayBuffer(1);
    const dataView53 = new DataView(buffer53);
    dataView53.setUint8(0, { toString: () => "150" });
    return dataView53.getUint8(0);
}
export function DataView20Test066() {
    let error66;
    try {
        const buffer66 = new ArrayBuffer(10);
        const dataView66 = new DataView(buffer66, 0, 3);
        dataView66.setUint8(3, 10);
    } catch (e) {
        error66 = e;
    }
    return error66 instanceof RangeError;
}
export function DataView20Test067() {
    const buffer67 = new ArrayBuffer(1);
    const dataView67 = new DataView(buffer67);
    dataView67.setUint8(0, [255]);
    return dataView67.getUint8(0);
}
export function DataView20Test068() {
    const buffer68 = new ArrayBuffer(1);
    const dataView68 = new DataView(buffer68);
    const timestamp = 1730678400000;
    dataView68.setUint8(0, new Date(timestamp));
    return dataView68.getUint8(0);
}
export function DataView20Test073() {
    const buffer73 = new ArrayBuffer(1);
    const dataView73 = new DataView(buffer73);
    dataView73.setUint8(0, "123.45");
    return dataView73.getUint8(0);
}
export function DataView20Test081() {
    const buffer81 = new ArrayBuffer(1);
    const dataView81 = new DataView(buffer81);
    dataView81.setUint8(0, new Boolean(true));
    return dataView81.getUint8(0);
}
export function DataView20Test082() {
    let error82;
    try {
        const buffer82 = new ArrayBuffer(5);
        const dataView82 = new DataView(buffer82, 3);
        dataView82.setUint8(2, 10);
    } catch (e) {
        error82 = e;
    }
    return error82 instanceof RangeError;
}
export function DataView20Test083() {
    const buffer83 = new ArrayBuffer(1);
    const dataView83 = new DataView(buffer83);
    dataView83.setUint8(0, new Boolean(false));
    return dataView83.getUint8(0);
}
export function DataView20Test085() {
    const buffer85 = new ArrayBuffer(1);
    const dataView85 = new DataView(buffer85);
    dataView85.setUint8(0, new Number(150));
    return dataView85.getUint8(0);
}
export function DataView20Test090() {
    const buffer90 = new ArrayBuffer(1);
    const dataView90 = new DataView(buffer90);
    dataView90.setUint8(0, /test/);
    return dataView90.getUint8(0);
}
export function DataView20Test093() {
    const buffer93 = new ArrayBuffer(1);
    const dataView93 = new DataView(buffer93);
    dataView93.setUint8(0, function() {});
    return dataView93.getUint8(0);
}
export function DataView20Test099() {
    const buffer99 = new ArrayBuffer(1);
    const dataView99 = new DataView(buffer99);
    dataView99.setUint8(0, "-123");
    return dataView99.getUint8(0);
}
export function DataView20Test100() {
    let error100;
    try {
        const buffer100 = new ArrayBuffer(5);
        const dataView100 = new DataView(buffer100, 1, 2);
        dataView100.setUint8(2, 10);
    } catch (e) {
        error100 = e;
    }
    return error100 instanceof RangeError;
}
export function DataView20Test101() {
    const buffer101 = new ArrayBuffer(1);
    const dataView101 = new DataView(buffer101);
    dataView101.setUint8(0, { valueOf: () => -50 });
    return dataView101.getUint8(0);
}
export function DataView20Test103() {
    const buffer103 = new ArrayBuffer(1);
    const dataView103 = new DataView(buffer103);
    dataView103.setUint8(0, new String("200"));
    return dataView103.getUint8(0);
}
export function DataView20Test109() {
    const buffer109 = new ArrayBuffer(1);
    const dataView109 = new DataView(buffer109);
    dataView109.setUint8(0, "0x7F");
    return dataView109.getUint8(0);
}
export function DataView20Test111() {
    const buffer111 = new ArrayBuffer(1);
    const dataView111 = new DataView(buffer111);
    dataView111.setUint8(0, "0XFF");
    return dataView111.getUint8(0);
}
export function DataView20Test116() {
    let error116;
    try {
        const buffer116 = new ArrayBuffer(1);
        const dataView116 = new DataView(buffer116);
        dataView116.setUint8("0", 10);
    } catch (e) {
        error116 = e;
    }
    return error116 instanceof RangeError;
}
export function DataView20Test117() {
    const buffer117 = new ArrayBuffer(1);
    const dataView117 = new DataView(buffer117);
    const obj117 = { [Symbol.toPrimitive]: () => 100 };
    dataView117.setUint8(0, obj117);
    return dataView117.getUint8(0);
}
export function DataView20Test120() {
    let error120;
    try {
        const buffer120 = new ArrayBuffer(5);
        const dataView120 = new DataView(buffer120, 6);
        dataView120.setUint8(0, 10);
    } catch (e) {
        error120 = e;
    }
    return error120 instanceof RangeError;
}
export function DataView20Test124() {
    const buffer124 = new ArrayBuffer(1);
    const dataView124 = new DataView(buffer124);
    dataView124.setUint8(0, " 67");
    return dataView124.getUint8(0);
}
export function DataView20Test125() {
    const buffer125 = new ArrayBuffer(1);
    const dataView125 = new DataView(buffer125);
    dataView125.setUint8(0, "89 ");
    return dataView125.getUint8(0);
}
export function DataView20Test126() {
    let error126;
    try {
        const buffer126 = new ArrayBuffer(5);
        const dataView126 = new DataView(buffer126, 0, 0);
        dataView126.setUint8(0, 10);
    } catch (e) {
        error126 = e;
    }
    return error126 instanceof RangeError;
}
export function DataView20Test127() {
    const buffer127 = new ArrayBuffer(1);
    const dataView127 = new DataView(buffer127);
    dataView127.setUint8(0, [123].toString());
    return dataView127.getUint8(0);
}
export function DataView20Test128() {
    const buffer128 = new ArrayBuffer(1);
    const dataView128 = new DataView(buffer128);
    dataView128.setUint8(0, "2e2");
    return dataView128.getUint8(0);
}
export function DataView20Test129() {
    const buffer129 = new ArrayBuffer(1);
    const dataView129 = new DataView(buffer129);
    dataView129.setUint8(0, "3e-1");
    return dataView129.getUint8(0);
}
export function DataView20Test130() {
    const buffer130 = new ArrayBuffer(1);
    const dataView130 = new DataView(buffer130);
    dataView130.setUint8(0, "");
    return dataView130.getUint8(0);
}
export function DataView20Test131() {
    const buffer131 = new ArrayBuffer(1);
    const dataView131 = new DataView(buffer131);
    dataView131.setUint8(0, new Map());
    return dataView131.getUint8(0);
}
export function DataView20Test132() {
    const buffer132 = new ArrayBuffer(1);
    const dataView132 = new DataView(buffer132);
    dataView132.setUint8(0, new Set());
    return dataView132.getUint8(0);
}
export function DataView20Test138() {
    const buffer138 = new ArrayBuffer(1);
    const dataView138 = new DataView(buffer138);
    dataView138.setUint8(0, "0b1111");
    return dataView138.getUint8(0);
}
export function DataView20Test139() {
    const buffer139 = new ArrayBuffer(1);
    const dataView139 = new DataView(buffer139);
    dataView139.setUint8(0, "0o377");
    return dataView139.getUint8(0);
}
export function DataView20Test140() {
    let error140;
    try {
        const unsafeOffset = Number.MAX_SAFE_INTEGER + 1;
        const buffer140 = new ArrayBuffer(unsafeOffset + 1);
        const dataView140 = new DataView(buffer140);
        dataView140.setUint8(unsafeOffset, 10);
    } catch (e) {
        error140 = e;
    }
    return error140 instanceof RangeError;
}
export function DataView20Test144() {
    const buffer144 = new ArrayBuffer(1);
    const dataView144 = new DataView(buffer144);
    dataView144.setUint8(0, new Date(0));
    return dataView144.getUint8(0);
}
export function DataView20Test145() {
    const buffer145 = new ArrayBuffer(1);
    const dataView145 = new DataView(buffer145);
    dataView145.setUint8(0, new Date(255));
    return dataView145.getUint8(0);
}
export function DataView20Test146() {
    const buffer146 = new ArrayBuffer(1);
    const dataView146 = new DataView(buffer146);
    dataView146.setUint8(0, new Date(256));
    return dataView146.getUint8(0);
}
export function DataView20Test148() {
    const buffer148 = new ArrayBuffer(1);
    const dataView148 = new DataView(buffer148);
    const obj148 = { [Symbol.toPrimitive]: () => -30 };
    dataView148.setUint8(0, obj148);
    return dataView148.getUint8(0);
}
export function DataView20Test150() {
    const buffer150 = new ArrayBuffer(1);
    const dataView150 = new DataView(buffer150);
    dataView150.setUint8(0, "NaN");
    return dataView150.getUint8(0);
}