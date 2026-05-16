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
export function testAllElementsPass() {
    const arr = [2, 4, 6, 8, 10];
    const result = arr.every(x => x % 2 === 0);
    return { result, expected: true };
}

export function testSomeElementsFail() {
    const arr = [2, 4, 5, 8, 10];
    const result = arr.every(x => x % 2 === 0);
    return { result, expected: false };
}

export function testShortCircuitEvaluation() {
    let count = 0;
    const arr = [1, 2, 3, 4, 5];
    const result = arr.every(x => {
        count++;
        return x > 10;
    });
    return { result, expected: false, count, expectedCount: 1 };
}

export function testArrowFunctionCallback() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.every((element) => element > 0);
    return { result, expected: true };
}

export function testThisArg() {
    const arr = [1, 2, 3];
    const context = { min: 0, max: 10 };
    const result = arr.every(function (element) {
        return element > this.min && element < this.max;
    }, context);
    return { result, expected: true };
}

export function testReturnValueTrue() {
    const arr = [2, 4, 6, 8];
    const result = arr.every(x => x % 2 === 0);
    return { result, expected: true, type: typeof result, expectedType: 'boolean' };
}

export function testReturnValueFalse() {
    const arr = [2, 4, 5, 8];
    const result = arr.every(x => x % 2 === 0);
    return { result, expected: false, type: typeof result, expectedType: 'boolean' };
}

export function testEmptyArray() {
    const arr = [];
    const result = arr.every(x => x > 0);
    return { result, expected: true };
}

export function testSparseArray() {
    const arr = [1, , , 4];
    let count = 0;
    const result = arr.every(x => {
        count++;
        return x !== undefined;
    });
    return { result, expected: true, count, expectedCount: 2 };
}

export function testSingleElementArray() {
    const arr = [10];
    const result = arr.every(x => x > 5);
    return { result, expected: true };
}

export function testLargeArray() {
    const arr = new Array(10000).fill(1);
    const result = arr.every(x => x === 1);
    return { result, expected: true };
}

export function testElementParameter() {
    const arr = [10, 20, 30];
    const elements = [];
    arr.every(element => {
        elements.push(element);
        return true;
    });
    return { result: JSON.stringify(elements), expected: JSON.stringify([10, 20, 30]), elements, expectedElements: [10, 20, 30] };
}

export function testIndexParameter() {
    const arr = ['a', 'b', 'c'];
    const indices = [];
    arr.every((element, index) => {
        indices.push(index);
        return true;
    });
    return { result: JSON.stringify(indices), expected: JSON.stringify([0, 1, 2]), indices, expectedIndices: [0, 1, 2] };
}

export function testArrayParameter() {
    const arr = [1, 2, 3];
    let isSameArray = true;
    arr.every((element, index, array) => {
        if (array !== arr) {
            isSameArray = false;
        }
        return true;
    });
    return { result: isSameArray, expected: true, isSameArray };
}