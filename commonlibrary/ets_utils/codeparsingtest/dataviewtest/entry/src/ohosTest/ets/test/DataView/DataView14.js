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

export function DataView14Test107() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x1234567890ABCDEFn;
    view.setBigUint64(0, value, true);
    const obj = { dataView: view, buffer: buffer };
    const jsonString = JSON.stringify(obj);
    return jsonString.includes("ArrayBuffer")
}

export function DataView14Test109() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0xF0F0F0F0F0F0F0F0n;
    view.setBigUint64(0, value, true);
    return Object.getPrototypeOf(view) === DataView.prototype
}

export function DataView14Test113() {

    function writeValue(dv, val, offset, littleEndian) {
        dv.setBigUint64(offset, val, littleEndian);
    }

    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0xCAFEBABECAFEBABEn;
    writeValue(view, value, 0, true);
    return view.getBigUint64(0, true);
}

export function DataView14Test115() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0xAABBCCDDEEFF0011n;
    DataView.prototype.setBigUint64.call(view, 0, value, true);
    return view.getBigUint64(0, true);
}

export function DataView14Test116() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x123456789ABCDEF0n;
    view.setBigUint64(0, value, true);
    return DataView.prototype.getBigUint64.apply(view, [0, true]) === 0x123456789ABCDEF0n;
}

export function DataView14Test117() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0xDEADBEEFCAFEBABEn;
    const boundSet = view.setBigUint64.bind(view, 0, value, true);
    boundSet();
    return view.getBigUint64(0, true);
}

export function DataView14Test122() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x23456789ABCDEF12n;
    view.setBigUint64(0, value, true);
    const values = Object.values(view);
    return values.length;
}

export function DataView14Test123() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x3456789ABCDEF123n;
    view.setBigUint64(0, value, true);
    const entries = Object.entries(view);
    return entries.length;
}

export function DataView14Test126() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x6789ABCDEF123456n;
    view.setBigUint64(0, value, true);
    Object.freeze(view);
    return view.getBigUint64(0, true);
}

export function DataView14Test127() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x789ABCDEF1234567n;
    view.setBigUint64(0, value, true);
    Object.seal(view);
    return view.getBigUint64(0, true);
}

export function DataView14Test128() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x89ABCDEF12345678n;
    view.setBigUint64(0, value, true);
    Object.preventExtensions(view);
    const result = view.getBigUint64(0, true);
    return result;
}

export function DataView14Test132() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0xCDEF123456789ABCn;
    view.setBigUint64(0, value, true);
    return view.byteLength;
}

export function DataView14Test133() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0xDEF123456789ABCDn;
    view.setBigUint64(0, value, true);
    Object.defineProperty(view, "customProp", { value: "test", enumerable: true });
    return view.customProp === "test";
}

export function DataView14Test147() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x6789A456789ABCDEn;
    view.setBigUint64(0, value, true);

    const obj = { dv: view, val: value };

    const jsonString = JSON.stringify(obj, (key, val) => {
        if (val instanceof DataView) {
            return "DataViewInstance";
        }
        if (typeof val === 'bigint') {
            return val.toString();
        }
        return val;
    });
    return jsonString.includes("DataViewInstance")
}

export function DataView14Test148() {
    const value = 0x789A456789ABCDEFn;
    const jsonString = JSON.stringify({ val: value.toString() }); // BigInt 需特殊处理
    const obj = JSON.parse(jsonString, (key, val) => {
        if (key === "val" && typeof val === "string") {
            return BigInt(val);
        }
        return val;
    });
    return obj.val === 8690334741958479343n;
}

export function DataView14Test112() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x1000000000000001n;
    view.setBigUint64(0, value, true);
    return [("byteLength" in view) === true, ("getBigUint64" in view) === true]
}

export function DataView14Test097() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const wm = new WeakMap();

    const metadata = {
        type: 'float64',
        source: 'sensor-A',
        timestamp: Date.now(),
        rawValue: Math.PI
    };

    view.setFloat64(0, metadata.rawValue, true);
    wm.set(buffer, metadata);

    return [view.getFloat64(0, true) === metadata.rawValue, wm.get(buffer) === metadata]
}

export function DataView14Test120() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x1122334455667788n;
    view.setBigUint64(0, value, true);
    return [view.hasOwnProperty("byteLength") === true, view.hasOwnProperty("byteOffset") === true,
        view.hasOwnProperty("buffer") === true, view.hasOwnProperty("setBigUint64") === true]
}

export function DataView14Test124() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x456789ABCDEF1234n;
    view.setBigUint64(0, value, true);
    const properties = [];
    for (const prop in view) {
        properties.push(prop);
    }
    return [properties.includes("getBigUint64") === true, properties.includes("setBigUint64") === true,
        properties.includes("buffer") === false]
}

export function DataView14Test125() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x56789ABCDEF12345n;
    view.setBigUint64(0, value, true);
    return [Object.isFrozen(view) === false, Object.isSealed(view) === false, Object.isExtensible(view) === true]
}

export function DataView14Test138() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x456789A456789A45n;
    view.setBigUint64(0, value, true);
    return [DataView.prototype.getBigUint64.length === 2, DataView.prototype.setBigUint64.length === 3]
}

export function DataView14Test139() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x56789A456789A456n;
    view.setBigUint64(0, value, true);
    return [DataView.prototype.getBigUint64.name === "getBigUint64",
        DataView.prototype.setBigUint64.name === "setBigUint64"]
}

export function DataView14Test140() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x6789A456789A4567n;
    view.setBigUint64(0, value, true);
    const map = new Map();
    const metadata = { description: "test data view" };
    map.set(view, metadata);
    return map.get(view) === metadata
}

export function DataView14Test141() {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    const value = 0x789A456789A45678n;
    view.setBigUint64(0, value, true);
    const set = new Set();
    set.add(view);
    return set.has(view)
}


