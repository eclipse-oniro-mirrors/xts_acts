/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { trustedAppService } from "@kit.DeviceSecurityKit";

// toLocaleUpperCase exception test helper functions

export function testCallWithNumber() {
  try {
    const result = String.prototype.toLocaleUpperCase.call(123);
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testCallWithObject() {
  try {
    const obj = { toString: () => "hello" };
    const result = String.prototype.toLocaleUpperCase.call(obj);
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testCallWithArray() {
  try {
    const result = String.prototype.toLocaleUpperCase.call(["hello", "world"]);
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testCallWithNull() {
  try {
    const result = String.prototype.toLocaleUpperCase.call(null);
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testCallWithUndefined() {
  try {
    const result = String.prototype.toLocaleUpperCase.call(undefined);
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testStringObject() {
  try {
    const result = new String("hello").toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testFrozenStringObject() {
  try {
    const frozenStr = Object.freeze(new String("hello"));
    const result = frozenStr.toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testSealedStringObject() {
  try {
    const sealedStr = Object.seal(new String("hello"));
    const result = sealedStr.toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testNonExtensibleStringObject() {
  try {
    const nonExtStr = Object.preventExtensions(new String("hello"));
    const result = nonExtStr.toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testProxyStringObject() {
  try {
    const strObj = new String("hello");
    const proxy = new Proxy(strObj, {});
    const result = proxy.toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testProxyWithGetTrap() {
  try {
    const target = new String("hello");
    const handler = {
      get(target, prop) {
        if (prop === "toLocaleUpperCase") {
          return target[prop].bind(target);
        }
        return target[prop];
      }
    };
    const result = new Proxy(target, handler).toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testGetObjectWithGetter() {
  try {
    const obj = {
      get toString() {
        return () => "dynamic";
      }
    };
    const result = String.prototype.toLocaleUpperCase.call(obj);
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testWeakMapString() {
  try {
    const wm = new WeakMap();
    const key = {};
    wm.set(key, "hello");
    const result = wm.get(key).toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testTemplateStringConversion() {
  try {
    const result = `Result: ${"hello".toLocaleUpperCase()}`;
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testAdditionConversion() {
  try {
    const result = "Prefix: " + "hello".toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testToBoolean() {
  try {
    const result = Boolean("hello".toLocaleUpperCase());
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testToNumber() {
  try {
    const result = Number("hello".toLocaleUpperCase());
    return { result: true, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testToStringConversion() {
  try {
    const result = String("hello".toLocaleUpperCase());
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testUseStrictMode() {
  try {
    "use strict";
    const result = "hello".toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testStrictModeCall() {
  try {
    "use strict";
    const result = String.prototype.toLocaleUpperCase.call("test");
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testFromCharCode() {
  try {
    const result = String.fromCharCode(104, 101, 108, 108, 111).toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testFromCodePoint() {
  try {
    const result = String.fromCodePoint(0x61, 0x62, 0x63).toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}

export function testTemplateLiteral() {
  try {
    const name = "world";
    const result = `hello ${name}`.toLocaleUpperCase();
    return { result: result, error: null };
  } catch (e) {
    return { result: null, error: e.message };
  }
}
