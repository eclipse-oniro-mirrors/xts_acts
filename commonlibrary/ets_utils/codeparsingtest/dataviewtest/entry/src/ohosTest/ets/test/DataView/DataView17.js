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

export function DataView17Test035() {
    const buffer35 = new ArrayBuffer(1);
    const dataView35 = new DataView(buffer35);
    dataView35.setInt8(0, "42");
    return dataView35.getInt8(0);
}

export function DataView17Test036() {
    const buffer36 = new ArrayBuffer(1);
    const dataView36 = new DataView(buffer36);
    dataView36.setInt8(0, "abc");
    return dataView36.getInt8(0);
}

export function DataView17Test046() {
    const buffer46 = new ArrayBuffer(1);
    const dataView46 = new DataView(buffer46);
    dataView46.setInt8(0, true);
    return dataView46.getInt8(0);
}

export function DataView17Test047() {
    const buffer47 = new ArrayBuffer(1);
    const dataView47 = new DataView(buffer47);
    dataView47.setInt8(0, false);
    return dataView47.getInt8(0);
}

export function DataView17Test048() {
    const buffer48 = new ArrayBuffer(1);
    const dataView48 = new DataView(buffer48);
    dataView48.setInt8(0, null);
    return dataView48.getInt8(0);
}

export function DataView17Test049() {
    const buffer49 = new ArrayBuffer(1);
    const dataView49 = new DataView(buffer49);
    dataView49.setInt8(0, undefined);
    return dataView49.getInt8(0);
}

export function DataView17Test050() {
    const buffer50 = new ArrayBuffer(1);
    const dataView50 = new DataView(buffer50);
    dataView50.setInt8(0, { key: "value" });
    return dataView50.getInt8(0);
}

export function DataView17Test060() {
    const buffer60 = new ArrayBuffer(1);
    const dataView60 = new DataView(buffer60);
    dataView60.setInt8(0, "128");
    return dataView60.getInt8(0);
}

export function DataView17Test061() {
    const buffer61 = new ArrayBuffer(1);
    const dataView61 = new DataView(buffer61);
    dataView61.setInt8(0, "-129");
    return dataView61.getInt8(0);
}

export function DataView17Test065() {
    const buffer65 = new ArrayBuffer(1);
    const dataView65 = new DataView(buffer65);
    dataView65.setInt8(0, new Number(66));
    return dataView65.getInt8(0);
}

export function DataView17Test069() {
    const buffer69 = new ArrayBuffer(1);
    const dataView69 = new DataView(buffer69);
    dataView69.setInt8(0, "invalid");
    dataView69.setInt8(0, 99);
    return dataView69.getInt8(0)
}

export function DataView17Test076() {
    const buffer76 = new ArrayBuffer(1);
    const dataView76 = new DataView(buffer76);
    dataView76.setInt8(0, "-0");
    return dataView76.getInt8(0);
}

export function DataView17Test082() {
    const buffer82 = new ArrayBuffer(1);
    const dataView82 = new DataView(buffer82);
    dataView82.setInt8(0, null);
    dataView82.setInt8(0, 100);
    return dataView82.getInt8(0);
}

export function DataView17Test084() {
    const buffer84 = new ArrayBuffer(1);
    const dataView84 = new DataView(buffer84);
    dataView84.setInt8(0, true);
    dataView84.setInt8(0, false);
    return dataView84.getInt8(0);
}

export function DataView17Test087() {
    const buffer87 = new ArrayBuffer(1);
    const dataView87 = new DataView(buffer87);
    dataView87.setInt8(0, "0");
    return dataView87.getInt8(0);
}

export function DataView17Test091() {
    const buffer91 = new ArrayBuffer(1);
    const dataView91 = new DataView(buffer91);
    dataView91.setInt8(0, new Number(-45));
    return dataView91.getInt8(0);
}

export function DataView17Test093() {
    const buffer93 = new ArrayBuffer(1);
    const dataView93 = new DataView(buffer93);
    dataView93.setInt8(0, "127.5");
    return dataView93.getInt8(0);
}

export function DataView17Test096() {
    const buffer96 = new ArrayBuffer(1);
    const dataView96 = new DataView(buffer96);
    dataView96.setInt8(0, "");
    return dataView96.getInt8(0)
}

export function DataView17Test097() {
    const buffer97 = new ArrayBuffer(1);
    const dataView97 = new DataView(buffer97);
    dataView97.setInt8(0, "  89 ");
    return dataView97.getInt8(0);
}

export function DataView17Test102() {
    const buffer102 = new ArrayBuffer(1);
    const dataView102 = new DataView(buffer102);
    dataView102.setInt8(0, [42]);
    return dataView102.getInt8(0);
}

export function DataView17Test103() {
    const buffer103 = new ArrayBuffer(1);
    const dataView103 = new DataView(buffer103);
    dataView103.setInt8(0, () => {
    });
    return dataView103.getInt8(0);
}

export function DataView17Test107() {
    const buffer107 = new ArrayBuffer(1);
    const dataView107 = new DataView(buffer107);
    dataView107.setInt8(0, "0012");
    return dataView107.getInt8(0);
}

export function DataView17Test108() {
    const buffer108 = new ArrayBuffer(1);
    const dataView108 = new DataView(buffer108);
    dataView108.setInt8(0, "-0013");
    return dataView108.getInt8(0);
}

export function DataView17Test113() {
    const buffer113 = new ArrayBuffer(1);
    const dataView113 = new DataView(buffer113);
    dataView113.setInt8(0, "127.0");
    return dataView113.getInt8(0);
}

export function DataView17Test114() {
    const buffer114 = new ArrayBuffer(1);
    const dataView114 = new DataView(buffer114);
    dataView114.setInt8(0, "-128.0");
    return dataView114.getInt8(0);
}

export function DataView17Test121() {
    const buffer121 = new ArrayBuffer(1);
    const dataView121 = new DataView(buffer121);
    dataView121.setInt8(0, "invalid123");
    return dataView121.getInt8(0);
}

export function DataView17Test126() {
    const buffer126 = new ArrayBuffer(1);
    const dataView126 = new DataView(buffer126);
    const date = new Date(0);
    dataView126.setInt8(0, date);
    return dataView126.getInt8(0);
}

export function DataView17Test127() {
    const buffer127 = new ArrayBuffer(1);
    const dataView127 = new DataView(buffer127);
    dataView127.setInt8(0, /test/);
    return dataView127.getInt8(0);
}

export function DataView17Test128() {
    const buffer128 = new ArrayBuffer(1);
    const dataView128 = new DataView(buffer128);
    dataView128.setInt8(0, "0x7F");
    return dataView128.getInt8(0);
}

export function DataView17Test129() {
    const buffer129 = new ArrayBuffer(1);
    const dataView129 = new DataView(buffer129);
    dataView129.setInt8(0, "0o177");
    return dataView129.getInt8(0);
}

export function DataView17Test130() {
    const buffer130 = new ArrayBuffer(1);
    const dataView130 = new DataView(buffer130);
    dataView130.setInt8(0, "0b1111111");
    return dataView130.getInt8(0);
}

export function DataView17Test133() {
    const buffer133 = new ArrayBuffer(1);
    const dataView133 = new DataView(buffer133);
    dataView133.setInt8(0, "42.999");
    return dataView133.getInt8(0);
}

export function DataView17Test134() {
    const buffer134 = new ArrayBuffer(1);
    const dataView134 = new DataView(buffer134);
    dataView134.setInt8(0, "+67");
    return dataView134.getInt8(0);
}

export function DataView17Test135() {
    const buffer135 = new ArrayBuffer(1);
    const dataView135 = new DataView(buffer135);
    dataView135.setInt8(0, "30");
    dataView135.setInt8(0, true);
    dataView135.setInt8(0, -40);
    return dataView135.getInt8(0);
}

export function DataView17Test138() {
    const buffer138 = new ArrayBuffer(1);
    const dataView138 = new DataView(buffer138);
    dataView138.setInt8(0, {});
    return dataView138.getInt8(0);
}

export function DataView17Test139() {
    const buffer139 = new ArrayBuffer(1);
    const dataView139 = new DataView(buffer139);
    dataView139.setInt8(0, [1, 2, 3]);
    return dataView139.getInt8(0);
}

export function DataView17Test142() {
    const buffer142 = new ArrayBuffer(1);
    const dataView142 = new DataView(buffer142);
    dataView142.setInt8(0, "123456");
    return dataView142.getInt8(0);
}

export function DataView17Test143() {
    const buffer143 = new ArrayBuffer(1);
    const dataView143 = new DataView(buffer143);
    dataView143.setInt8(0, "-0x80");
    return dataView143.getInt8(0);
}

export function DataView17Test144() {
    const buffer144 = new ArrayBuffer(1);
    const dataView144 = new DataView(buffer144);
    dataView144.setInt8(0, "0o377");
    return dataView144.getInt8(0);
}

export function DataView17Test145() {
    const buffer145 = new ArrayBuffer(1);
    const dataView145 = new DataView(buffer145);
    dataView145.setInt8(0, "0b10000000");
    return dataView145.getInt8(0);
}

export function DataView17Test146() {
    const buffer146 = new ArrayBuffer(1);
    const dataView146 = new DataView(buffer146);
    dataView146.setInt8(0, "  -99  ");
    return dataView146.getInt8(0);
}

export function DataView17Test147() {
    const buffer147 = new ArrayBuffer(1);
    const dataView147 = new DataView(buffer147);
    dataView147.setInt8(0, 50);
    dataView147.setInt8(0, "-50");
    return dataView147.getInt8(0);
}





