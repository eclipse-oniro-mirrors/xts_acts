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

export function testIsArrayJs0007() {
    const obj = { length: 3, 0: 'a', 1: 'b', 2: 'c' };
    return Array.isArray(obj);
}

export function testIsArrayJs0032() {
    const sym = Symbol('test');
    const arr = [sym, Symbol('another')];
    return Array.isArray(arr);
}

export function testIsArrayJs0033() {
    const sym = Symbol('test');
    return Array.isArray(sym);
}

export function testIsArrayJs0039() {
    const json = JSON;
    return Array.isArray(json);
}

export function testIsArrayJs0045() {
    const arr = Object.freeze([1, 2, 3]);
    return Array.isArray(arr);
}

export function testIsArrayJs0046() {
    const arr = [1, 2, 3];
    Object.seal(arr);
    return Array.isArray(arr);
}

export function testIsArrayJs0072() {
    function* generator() {
        yield 1;
        yield 2;
    }
    const gen = generator();
    return Array.isArray(gen);
}

export function testIsArrayJs0076() {
    const mockModule = { export1: 1, export2: 'a' };
    return Array.isArray(mockModule);
}

export function testIsArrayJs0080() {
    const registry = new FinalizationRegistry(() => {});
    return Array.isArray(registry);
}

export function testIsArrayJs0082() {
    const controller = new AbortController();
    return Array.isArray(controller);
}

export function testIsArrayJs0084() {
    const controller = new AbortController();
    const signal = controller.signal;
    return Array.isArray(signal);
}

export function testIsArrayJs0088() {
    const url = new URL('https://example.com');
    return Array.isArray(url);
}

export function testIsArrayJs0090() {
    const params = new URLSearchParams('a=1&b=2');
    return Array.isArray(params);
}

export function testIsArrayJs0086() {
    const mockPerformance = { now: () => Date.now() };
    return Array.isArray(mockPerformance);
}

export function testIsArray0096() {
    const mockCrypto = {
        getRandomValues: (array) => {}
    };
    return Array.isArray(mockCrypto);
}

export function testIsArray0098() {
    const nested = {
        0: 1,
        1: { 0: 2, 1: 3, length: 2 },
        length: 2
    };
    return Array.isArray(nested);
}

export function testIsArray0100() {
    const arrayLike = {
        length: 2,
        0: 'a',
        1: 'b',
        push: function(...items) {
            const startLength = this.length;
            for (let i = 0; i < items.length; i++) {
                this[this.length++] = items[i];
            }
            return this.length - startLength;
        }
    };
    return Array.isArray(arrayLike);
}