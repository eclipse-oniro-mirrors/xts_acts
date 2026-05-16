/*
 * Copyright (c) 2026 RKH Corp.
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
export function testBasicForOfLoop() {
    const arr = ['a', 'b', 'c'];
    const result = [];
    for (const [index, value] of arr.entries()) {
        result.push(`${index}:${value}`);
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify(['0:a', '1:b', '2:c'])
    };
}

export function testLoopBreak() {
    const arr = ['a', 'b', 'c', 'd'];
    const result = [];
    for (const entry of arr.entries()) {
        if (entry[0] === 2) break;
        result.push(entry);
    }
    return {
        result: result.length,
        expected: 2
    };
}

export function testLoopContinue() {
    const arr = ['a', 'b', 'c', 'd'];
    const result = [];
    for (const entry of arr.entries()) {
        if (entry[0] % 2 === 0) continue;
        result.push(entry);
    }
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([[1, 'b'], [3, 'd']])
    };
}

export function testArraySpread() {
    const arr = ['a', 'b'];
    const entries = [...arr.entries()];
    return {
        result: JSON.stringify(entries),
        expected: JSON.stringify([[0, 'a'], [1, 'b']])
    };
}

export function testFunctionParamSpread() {
    const arr = ['x', 'y'];
    function log(...args) {
        return args;
    }
    const result = log(...arr.entries());
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([[0, 'x'], [1, 'y']])
    };
}

export function testCustomIterable() {
    const arr = ['a', 'b'];
    const iterable = {
        [Symbol.iterator]: () => arr.entries()
    };
    const result = [...iterable];
    return {
        result: JSON.stringify(result),
        expected: JSON.stringify([[0, 'a'], [1, 'b']])
    };
}
