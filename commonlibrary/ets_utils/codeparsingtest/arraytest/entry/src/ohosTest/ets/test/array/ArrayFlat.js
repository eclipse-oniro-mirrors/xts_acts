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

export function testArrayFlatJs0010() {
    const arr = [1, [2, 3]];
    const result = arr.flat("1");
    return result;
}

export function testArrayFlatJs0015() {
    const target = [1, [2]];
    const proxy = new Proxy(target, {
        get: (obj, prop) => {
        if (prop === "0") return 10;
        return (obj)[prop];
    }
    });
    const result = proxy.flat();
    return result[0];
}

export function testArrayFlatJs0016() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        get: (obj, prop) => {
        if (prop === "length") return 2;
        return (obj)[prop];
    }
    });
    const result = proxy.flat();
    return result;
}

export function testArrayFlatJs0017() {
    const originalFlat = Array.prototype.flat;
    Array.prototype.flat = function () {
        return [42];
    };
    const arr = [1, 2];
    const result = arr.flat();
    Array.prototype.flat = originalFlat;
    return result;
}

export function testArrayFlatJs0031() {
    const arr = Object.freeze([1, [2, 3]]);
    const result = (arr).flat(2);
    return result;
}

export function testArrayFlatJs0033() {
      const target = [1, [2, 3]];
      const handler = {
        get: (obj, prop) => {
          if (prop === "length") return obj.length;
          return obj[prop];
        }
      };
      const proxy = new Proxy(target, handler);
      const result = proxy.flat(2);
    return result;
}

export function testArrayFlatJs0036() {
    const nested = Array.from({ length: 1000 }, (_, i) => [i]);
    const result = nested.flat();
    return result;
}

export function testArrayFlatJs0041() {
      const target = [1, [2, 3]];
      const handler = {
        get: (obj, prop) => {
          if (prop === "length") return obj.length;
          return obj[prop];
        }
      };
      const proxy = new Proxy(target, handler);
      const result = (proxy).flat(2);
      return result;
}

export function testArrayFlatJs0051() {
    const arr = Object.freeze([1, [2, 3]]);
    const result = arr.flat();
    expect(result).assertDeepEquals([1, 2, 3]);
    return result;
}

export function testArrayFlatJs0053() {
      const target = [1, [2, [3]]];
      const handler = {
        get: (obj, prop) => {
          if (prop === "length") return obj.length;
          return obj[prop];
        }
      };
      const proxy = new Proxy(target, handler);
      const result = (proxy).flat(2);
      return result;
}

export function testArrayFlatJs0054() {
    const target = [1, [2, [3]]];
    const handler = {
        get: (obj, prop) => {
            if (prop === "length") return obj.length;
            return obj[prop];
        }
    };
    const proxy = new Proxy(target, handler);
    const result = (proxy).flat(2);
    return result;
}

export function testArrayFlatJs0057() {
    const nested = Object.freeze([5, 6]);
    const arr = [1, nested];
    const result = arr.flat();
    return result;
}

export function testArrayFlatJs0060() {
    const target = [2, 3];
    const handler = {
        get: (obj, prop) => {
        if (prop === "length") return obj.length;
        return obj[Number(prop)];
    }
    };
    const proxy = new Proxy(target, handler);
    const arr = [1, proxy];
    const result = arr.flat();
    return result;
}

export function testArrayFlatJs0066() {
    const nested = [2, 3];
    const frozen = Object.freeze([4, 5]);
    const arr = [1, nested, frozen];
    const result = arr.flat();
    return result;
}

export function testArrayFlatJs0092() {
    const arr = Object.freeze([1, [2, 3]]);
    const result = arr.flat();
    return result;
}

export function testArrayFlatJs0094() {
    class NumberArray extends Array {}
    const target = new NumberArray();
    target.push(1, 2);
    const proxyArr = new Proxy(target, {
        get(obj, prop) {
        const idx = Number(prop);
        return !isNaN(idx) ? obj[idx] : obj[prop];
    },
    });
    const result = proxyArr.flat();
    return result;
}

export function testArrayFlatJs0095() {
    const arr = Array.from({ length: 10000 }, (_, i) => i < 5000 ? i : [i]);
    const result = arr.flat();
    return result.length;
}