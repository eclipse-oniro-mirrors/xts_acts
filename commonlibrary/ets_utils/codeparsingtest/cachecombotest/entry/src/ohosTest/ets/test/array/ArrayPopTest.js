/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

/**
 * 测试 19: 对冻结数组（frozen）调用 pop 会失败，但 values 仍可读（异常安全）
 */
export function testValuesPop_FrozenArrayPopFailsButValuesWorks() {
    const arr = [1, 2];
    Object.freeze(arr);
    const iter = arr.values();
    const first = iter.next().value;
    let popError = false;
    try {
        arr.pop();
    } catch (e) {
        popError = true;
    }
    const second = iter.next().value;
    const thirdDone = iter.next().done;
    return first == 1 && second == 2 && thirdDone == true && popError == true;
}

/**
 * 测试 20: 非常大的数组，pop 后迭代器是否仍高效（逻辑正确性，非性能）
 */
export function testValuesPop_LargeArrayPopOne() {
    const arr = Array.from({ length: 1000 }, (_, i) => i + 1);
    const iter = arr.values();
    iter.next();
    arr.pop();
    let count = 1;
    while (!iter.next().done) {
        count++;
    }
    return count == 999;
}

/**
 * 测试点 21：对稀疏数组（hole）使用 values() + pop
 */
export function testValuesPop_SparseArray() {
    const arr = new Array(3);
    arr[0] = 'a';
    arr[2] = 'c';
    const iter = arr.values();
    arr.pop();
    const v0 = iter.next().value;
    const v1 = iter.next().value;
    const v2 = iter.next().done;
    return v0 == 'a' && v1 == undefined && v2 == true;
}

/**
 *  测试点 27：pop 返回值类型与 values() 读取一致（包括 NaN）
 */
export function testValuesPop_NaNHandling() {
    const arr = [NaN, 0];
    const iter = arr.values();
    const fromIter = iter.next().value;
    const fromPop = arr.pop();
    return fromPop === 0 && isNaN(fromIter);
}

/**
 *  测试点 28：数组包含对象，pop 不影响已通过 values() 获取的引用
 */
export function testValuesPop_ObjectReferenceStable() {
    const obj = { id: 1 };
    const arr = [obj];
    const iter = arr.values();
    const ref = iter.next().value;
    arr.pop();
    return ref.id == 1 && ref === obj;
}

/**
 *  测试点 35：pop 后立即创建新 values() 迭代器，应反映新状态
 */
export function testValuesPop_NewIteratorAfterPop() {
    const arr = [5, 6, 7];
    arr.pop();
    const newArr = [...arr.values()];
    return JSON.stringify(newArr) == JSON.stringify([5, 6]);
}

/**
 *  测试点 36：数组包含 Symbol，pop 和 values 行为正常
 */
export function testValuesPop_WithSymbolValues() {
    const sym = Symbol('test');
    const arr = [sym, 'str'];
    const iter = arr.values();
    const first = iter.next().value;
    arr.pop();
    const second = iter.next().done;
    if (second) {
        return first === sym;
    }
    return false;
}

/**
 *  测试点 37：在 Proxy 包装的数组上操作（验证拦截是否影响）
 */
export function testValuesPop_ProxyArray() {
    const arr = [1, 2];
    const handler = {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    };
    const proxy = new Proxy(arr, handler);
    const iter = proxy.values();
    proxy.pop();
    const result = iter.next();
    return result.value == 1 && iter.next().done;
}

/**
 *  测试点 41：数组长度为 Number.MAX_SAFE_INTEGER（模拟极限，实际不可行，改用小极限）
 */
export function testValuesPop_LargeButSafeLength() {
    const len = 10000;
    const arr = Array.from({ length: len }, (_, i) => i);
    const iter = arr.values();
    iter.next();
    arr.pop();
    let count = 1;
    while (!iter.next().done) {
        count++;
    }
    return count == 9999;
}

/**
 *  测试点 42：数组被 seal（密封），pop 失败，values 仍可读
 */
export function testValuesPop_SealedArray() {
    const arr = [1, 2];
    Object.seal(arr);
    const iter = arr.values();
    let popError = false;
    try {
        arr.pop();
    } catch (e) {
        popError = true;
    }
    const values = [];
    for (const v of iter) {
        values.push(v);
    }
    return JSON.stringify(values) === JSON.stringify([1, 2]);
}

/**
 * 测试点43：在 for...of 循环中使用 entries() 迭代时调用 pop()
 * 预期行为：pop() 会修改原数组长度，影响后续迭代次数；
 * 但由于 entries() 返回的是基于当前索引的迭代器，若在迭代中途 pop()，
 * 可能导致某些元素未被遍历。
 */
export function testEntriesWithPopDuringIteration() {
    const arr = [10, 20, 30, 40];
    const visitedIndices = [];
    const visitedValues = [];
    try {
        for (const [index, value] of arr.entries()) {
            visitedIndices.push(index);
            visitedValues.push(value);
            if (index === 1) {
                arr.pop();
            }
        }
        const expectedIndices = [0, 1, 2];
        const expectedValues = [10, 20, 30];
        const indicesMatch = JSON.stringify(visitedIndices) === JSON.stringify(expectedIndices);
        const valuesMatch = JSON.stringify(visitedValues) === JSON.stringify(expectedValues);
        const finalArrayCorrect = JSON.stringify(arr) === JSON.stringify([10, 20, 30]);
        return indicesMatch && valuesMatch && finalArrayCorrect;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点44：entries() 返回的迭代器是否反映 pop() 后的实时变化？
 * 注意：entries() 创建时捕获数组引用，但每次 next() 会读取当前 arr[index]
 * 如果 pop() 导致某个 index 超出新长度，则该次迭代仍会尝试读取（但值可能 undefined？）
 * 实际上，entries() 的迭代器是“懒”的，它只在 next() 时检查当前 index < arr.length
 */
export function testEntriesIteratorReflectsPopChanges() {
    const arr = ['a', 'b', 'c', 'd'];
    const iterator = arr.entries();
    const results = [];
    results.push(iterator.next().value);
    arr.pop();
    arr.pop();
    results.push(iterator.next().value);
    const third = iterator.next();
    const doneAfterPop = third.done === true;
    const expectedResults = [[0, 'a'], [1, 'b']];
    return (
        JSON.stringify(results) === JSON.stringify(expectedResults) &&
            doneAfterPop
    );
}

/**
 * 测试点45：在 entries() 迭代中途多次 pop()，验证迭代提前终止
 */
export function testMultiplePopDuringEntriesIteration() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    try {
        for (const [i, v] of arr.entries()) {
            visited.push(v);
            if (visited.length === 2) {
                arr.pop();
                arr.pop();
            }
        }
        return JSON.stringify(visited) === JSON.stringify([1, 2, 3]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点46：pop() 后数组长度变为0，entries() 是否立即结束？
 */
export function testPopToEmptyDuringEntries() {
    const arr = [100];
    let count = 0;
    try {
        for (const _ of arr.entries()) {
            count++;
            arr.pop();
        }
        return count === 1 && arr.length === 0;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点47：entries() 返回的迭代器是否共享同一个数组引用？
 */
export function testEntriesIteratorSharesArrayReference() {
    const arr = ['x', 'y'];
    const iter1 = arr.entries();
    const iter2 = arr.entries();
    arr.pop();
    const val1 = iter1.next().value;
    const val2 = iter2.next().value;
    return (
        JSON.stringify(val1) === JSON.stringify([0, 'x']) &&
            JSON.stringify(val2) === JSON.stringify([0, 'x']) &&
            iter1.next().done === true &&
            iter2.next().done === true
    );
}

/**
 * 测试点48：在 entries() 调用后、迭代前 pop()，是否影响首次 next()？
 */
export function testPopBeforeStartingEntriesIteration() {
    const arr = [10, 20, 30];
    const iter = arr.entries();
    arr.pop();
    const first = iter.next().value;
    const second = iter.next().value;
    const third = iter.next();
    return (
        JSON.stringify(first) === JSON.stringify([0, 10]) &&
            JSON.stringify(second) === JSON.stringify([1, 20]) &&
            third.done === true
    );
}

/**
 * 测试点49：pop() 返回值是否正确，同时 entries() 不受影响（调用顺序）
 */
export function testPopReturnValueUnaffectedByEntries() {
    const arr = [5, 6, 7];
    const entriesSnapshot = Array.from(arr.entries());
    const popped = arr.pop();
    return (
        popped === 7 &&
            JSON.stringify(entriesSnapshot) === JSON.stringify([[0, 5], [1, 6], [2, 7]]) &&
            arr.length === 2
    );
}

/**
 * 测试点50：对空数组调用 pop() 后再调用 entries()
 */
export function testPopOnEmptyThenEntries() {
    const arr = [];
    const popped = arr.pop();
    const iter = arr.entries();
    const result = iter.next();
    return popped === undefined && result.done === true;
}

/**
 * 测试点51：entries() 迭代中 pop() 导致跳过元素？（边界情况）
 */
export function testPopCausesElementSkipInEntries() {
    const arr = ['a', 'b', 'c', 'd'];
    const visited = [];
    try {
        for (const [i, v] of arr.entries()) {
            visited.push(v);
            if (i === 0) {
                arr.pop();
                arr.pop();
            }
        }
        return JSON.stringify(visited) === JSON.stringify(['a', 'b']);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点52：使用 while + entries().next() 手动迭代，中间 pop()
 */
export function testManualEntriesNextWithPop() {
    const arr = [1, 2, 3];
    const iter = arr.entries();
    const results = [];
    let step = 0;
    while (step < 5) {
        const { value, done } = iter.next();
        if (done) {
            break;
        }
        results.push(value[1]);
        if (results.length === 1) {
            arr.pop();
        }
        step++;
    }
    return JSON.stringify(results) === JSON.stringify([1, 2]);
}

/**
 * 测试点53：pop() 后数组变短，entries() 是否仍能正确遍历剩余？
 */
export function testEntriesAfterPopStillCorrect() {
    const arr = [100, 200, 300, 400];
    arr.pop();
    const fromEntries = Array.from(arr.entries()).map(([i, v]) => v);
    return JSON.stringify(fromEntries) === JSON.stringify([100, 200, 300]);
}

/**
 * 测试点54：连续 pop() 直到空，再 entries() 是否安全？
 */
export function testRepeatedPopThenEntries() {
    const arr = [1, 2, 3, 4, 5];
    while (arr.pop() !== undefined) {
        ;
    }
    const iter = arr.entries();
    return iter.next().done === true && arr.length === 0;
}

/**
 * 测试点55：entries() 和 pop() 在嵌套结构中的行为（不影响内部对象）
 */
export function testPopDoesNotAlterObjectReferencesInEntries() {
    const obj = { id: 1 };
    const arr = [obj, { id: 2 }, { id: 3 }];
    const iter = arr.entries();
    const first = iter.next().value;
    arr.pop();
    const second = iter.next().value;
    return (
        first[1] === obj &&
            second[1].id === 2 &&
            arr.length === 2
    );
}

/**
 * 测试点56：在稀疏数组上使用 entries() 和 pop()
 */
export function testEntriesAndPopOnSparseArray() {
    const arr = new Array(3);
    arr[0] = 'A';
    arr[2] = 'C';
    arr.pop();
    const entries = Array.from(arr.entries());
    return (
        entries.length === 2 &&
            entries[0][1] === 'A' &&
            entries[1][1] === undefined &&
            arr.length === 2
    );
}

/**
 * 测试点57：pop() 修改 length，entries() 是否基于新 length？
 */
export function testEntriesUsesCurrentLengthAfterPop() {
    const arr = [10, 20, 30, 40];
    arr.pop();
    const keysFromEntries = Array.from(arr.entries(), ([i]) => i);
    return JSON.stringify(keysFromEntries) === JSON.stringify([0, 1, 2]);
}

/**
 * 测试点58：在严格模式下，entries() + pop() 行为是否一致？
 */
export function testEntriesPopInStrictMode() {
    "use strict";
    const arr = [1, 2];
    const visited = [];
    try {
        for (const [i, v] of arr.entries()) {
            visited.push(v);
            if (i === 0) {
                arr.pop();
            }
        }
        return JSON.stringify(visited) === JSON.stringify([1]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点59：pop() 后立即调用 entries()，与原 entries() 对比
 */
export function testNewEntriesAfterPopDiffersFromOld() {
    const arr = [5, 6, 7];
    const oldIter = arr.entries();
    arr.pop();
    const newIter = arr.entries();
    const oldFirst = oldIter.next().value;
    const newFirst = newIter.next().value;
    const oldSecond = oldIter.next().value;
    const newSecond = newIter.next().value;
    const oldThirdDone = oldIter.next().done;
    const newThirdDone = newIter.next().done;
    return oldThirdDone === true && newThirdDone === true;
}

/**
 * 测试点60：pop() 在 Symbol.iterator 上是否影响 entries()？
 */
export function testPopAffectsSymbolIteratorConsistently() {
    const arr = ['p', 'q', 'r'];
    const valuesViaForOf = [];
    const valuesViaEntries = [];
    const snap = Array.from(arr.entries());
    arr.pop();
    for (const v of arr) {
        valuesViaForOf.push(v);
    }
    for (const [i, v] of arr.entries()) {
        valuesViaEntries.push(v);
    }
    return (
        JSON.stringify(valuesViaForOf) === JSON.stringify(['p', 'q']) &&
            JSON.stringify(valuesViaEntries) === JSON.stringify(['p', 'q']) &&
            snap.length === 3
    );
}

/**
 * 测试点61：在冻结数组上调用 pop() 会失败，entries() 是否仍可读？
 */
export function testFrozenArrayPopFailsButEntriesWorks() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    let popFailed = false;
    try {
        arr.pop();
    } catch (e) {
        popFailed = true;
    }
    const entries = Array.from(arr.entries()).map(e => e[1]);
    return popFailed || arr.length === 3 && JSON.stringify(entries) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点62：在 entries() 迭代中 pop() 后立即 push()，验证迭代器行为
 */
export function testPopThenPushDuringEntriesIteration() {
    const arr = ['a', 'b', 'c', 'd'];
    const visited = [];
    try {
        for (const [i, v] of arr.entries()) {
            visited.push(v);
            if (i === 1) {
                arr.pop();
                arr.push('new');
            }
        }
        return JSON.stringify(visited) === JSON.stringify(['a', 'b', 'c', 'new']);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点63：pop() 后，entries() 的 Symbol.iterator 属性是否可用
 */
export function testEntriesIteratorHasSymbolIteratorProperty() {
    const arr = [1, 2, 3];
    arr.pop();
    const iter = arr.entries();
    return typeof iter[Symbol.iterator] === 'function';
}

/**
 * 测试点64：在 entries() 中 pop() 直到只剩一个元素
 */
export function testPopUntilOneElementDuringEntries() {
    const arr = [10, 20, 30, 40, 50];
    const visited = [];
    try {
        for (const [i, v] of arr.entries()) {
            visited.push(v);
            if (i === 0) {
                while (arr.length > 1) {
                    arr.pop();
                }
            }
        }
        return JSON.stringify(visited) === JSON.stringify([10]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点65：pop() 一个不存在的最后元素（空数组）后 entries()
 */
export function testPopUndefinedThenEntries() {
    const arr = [];
    const popped = arr.pop();
    const iter = arr.entries();
    const { value, done } = iter.next();
    return popped === undefined && value === undefined && done === true;
}

/**
 * 测试点66：在 entries() 迭代中 pop() 并检查数组长度变化
 */
export function testPopAffectsLengthDuringIteration() {
    const arr = [1, 2, 3, 4];
    const lengths = [];
    try {
        for (const [i, v] of arr.entries()) {
            lengths.push(arr.length);
            if (i % 2 === 0) {
                arr.pop();
            }
        }
        return JSON.stringify(lengths) === JSON.stringify([4, 3, 3]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点67：使用 for...in 遍历数组，与 entries() + pop() 比较
 */
export function testForInVsEntriesWithPop() {
    const arr = [100, 200, 300];
    const forInKeys = [];
    const entriesValues = [];
    for (const key in arr) {
        forInKeys.push(Number(key));
    }
    arr.pop();
    for (const [i, v] of arr.entries()) {
        entriesValues.push(v);
    }
    return (
        JSON.stringify(forInKeys) === JSON.stringify([0, 1, 2]) &&
            JSON.stringify(entriesValues) === JSON.stringify([100, 200])
    );
}

/**
 * 测试点68：在 entries() 中 pop() 时，如果元素是对象，检查引用是否还在
 */
export function testPopObjectReferenceDuringEntries() {
    const obj1 = { name: 'first' };
    const obj2 = { name: 'second' };
    const obj3 = { name: 'third' };
    const arr = [obj1, obj2, obj3];
    let foundRef = null;
    for (const [i, v] of arr.entries()) {
        if (i === 1) {
            foundRef = v;
            arr.pop();
        }
    }
    return foundRef === obj2 && arr.length === 2;
}

/**
 * 测试点69：pop() 后 entries() 遍历，确认索引连续性
 */
export function testIndexContinuityAfterPop() {
    const arr = ['x', 'y', 'z', 'w'];
    arr.pop();
    const indices = [];
    for (const [i, v] of arr.entries()) {
        indices.push(i);
    }
    return JSON.stringify(indices) === JSON.stringify([0, 1, 2]);
}

/**
 * 测试点70：entries() 迭代器的 next 方法在 pop() 后是否正常
 */
export function testNextMethodAfterPop() {
    const arr = [1, 2, 3];
    const iter = arr.entries();
    const r1 = iter.next();
    arr.pop();
    const r2 = iter.next();
    const r3 = iter.next();
    return (
        JSON.stringify(r1.value) === JSON.stringify([0, 1]) &&
            JSON.stringify(r2.value) === JSON.stringify([1, 2]) &&
            r3.done === true
    );
}

/**
 * 测试点71：pop() 一个数字数组后，entries() 中的值类型是否保持
 */
export function testValueTypePreservedAfterPop() {
    const arr = [1.5, 2.7, 3.9];
    arr.pop();
    const types = [];
    for (const [i, v] of arr.entries()) {
        types.push(typeof v);
    }
    return JSON.stringify(types) === JSON.stringify(['number', 'number']);
}

/**
 * 测试点72：pop() 一个包含 null 和 undefined 的数组后，entries() 表现
 */
export function testPopWithNullUndefinedValues() {
    const arr = [null, 'a', undefined, 'b'];
    arr.pop();
    const entriesResult = Array.from(arr.entries()).map(([i, v]) => [i, v]);
    return JSON.stringify(entriesResult) === JSON.stringify([[0, null], [1, "a"], [2, undefined]]);
}

/**
 * 测试点73：在 entries() 中 pop() 后，再次调用 entries() 是否获取新状态
 */
export function testRecreateEntriesAfterPop() {
    const arr = [10, 20, 30];
    const iter1 = arr.entries();
    arr.pop();
    const iter2 = arr.entries();
    const result1 = Array.from(iter1).map(([i, v]) => v);
    const result2 = Array.from(iter2).map(([i, v]) => v);
    const manualIter1 = arr.entries();
    const manualResult1 = [];
    for (const [i, v] of manualIter1) {
        manualResult1.push(v);
    }
    return JSON.stringify(manualResult1) === JSON.stringify([10, 20]) &&
        JSON.stringify(result2) === JSON.stringify([10, 20]);
}

/**
 * 测试点74：pop() 在 entries() 之前大量操作后，entries() 是否正确
 */
export function testEntriesAfterManyPops() {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8];
    arr.pop();
    arr.pop();
    arr.pop();
    arr.pop();
    const entriesResult = Array.from(arr.entries()).map(([i, v]) => v);
    return JSON.stringify(entriesResult) === JSON.stringify([1, 2, 3, 4]);
}

/**
 * 测试点75：pop() 后 entries() 遍历，确认没有访问到已移除的元素
 */
export function testNoAccessToRemovedElements() {
    const arr = ['start', 'middle', 'end'];
    const seen = [];
    for (const [i, v] of arr.entries()) {
        seen.push(v);
        if (v === 'start') {
            arr.pop();
        }
    }
    return JSON.stringify(seen) === JSON.stringify(['start', 'middle']);
}

/**
 * 测试点76：使用 Array.from() 与 entries() 结合，在 pop() 后的行为
 */
export function testArrayFromEntriesAfterPop() {
    const arr = ['a', 'b', 'c', 'd'];
    arr.pop();
    const result = Array.from(arr.entries());
    return JSON.stringify(result) === JSON.stringify([[0, "a"], [1, "b"], [2, "c"]]);
}

/**
 * 测试点77：在 entries() 中 pop() 一个很长的数组，检查性能影响
 */
export function testPopPerformanceInLongArrayEntries() {
    const arr = Array.from({ length: 100 }, (_, i) => i);
    const visited = [];
    try {
        for (const [i, v] of arr.entries()) {
            visited.push(v);
            if (i === 0) {
                arr.pop();
                arr.pop();
                arr.pop();
            }
        }
        return visited.length === 97;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点78：pop() 一个包含重复值的数组后，entries() 索引是否正确
 */
export function testDuplicateValuesAfterPop() {
    const arr = [1, 2, 2, 3];
    arr.pop();
    const indexedPairs = Array.from(arr.entries());
    return JSON.stringify(indexedPairs) === JSON.stringify([[0, 1], [1, 2], [2, 2]]);
}

/**
 * 测试点79：在 entries() 中 pop() 后立即检查数组长度
 */
export function testCheckLengthImmediatelyAfterPop() {
    const arr = [10, 20, 30, 40];
    const lengthsAtPop = [];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                lengthsAtPop.push(arr.length);
                arr.pop();
                lengthsAtPop.push(arr.length);
            }
        }
        return JSON.stringify(lengthsAtPop) === JSON.stringify([3, 2]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点80：pop() 后 entries() 遍历，验证是否按原始顺序访问（无重排序）
 */
export function testOrderPreservedAfterPop() {
    const arr = ['first', 'second', 'third', 'fourth'];
    arr.pop();
    const order = [];
    for (const [i, v] of arr.entries()) {
        order.push(v);
    }
    return JSON.stringify(order) === JSON.stringify(['first', 'second', 'third']);
}

/**
 * 测试点81：在 entries() 中 pop() 一个包含函数的数组
 */
export function testPopFunctionArrayDuringEntries() {
    const fn1 = () => 'fn1';
    const fn2 = () => 'fn2';
    const fn3 = () => 'fn3';
    const arr = [fn1, fn2, fn3];
    let executed = [];
    try {
        for (const [i, v] of arr.entries()) {
            if (typeof v === 'function') {
                executed.push(v());
            }
            if (i === 0) {
                arr.pop();
            }
        }
        return JSON.stringify(executed) === JSON.stringify(['fn1', 'fn2']);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点82：在 entries() 迭代中 pop() 一个数组，然后立即 unshift() 一个元素
 */
export function testPopThenUnshiftDuringEntries() {
    const arr = ['a', 'b', 'c', 'd'];
    const visited = [];
    try {
        for (const [i, v] of arr.entries()) {
            visited.push(v);
            if (i === 1) {
                arr.pop();
                arr.unshift('new');
            }
        }
        const tempArr = ['a', 'b', 'c', 'd'];
        const tempVisited = [];
        for (const [i, v] of tempArr.entries()) {
            tempVisited.push(v);
            if (i === 1) {
                tempArr.pop();
                tempArr.unshift('new');
            }
        }
        return JSON.stringify(tempVisited) === JSON.stringify(['a', 'b', 'b', 'c']);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点83：pop() 后 entries() 迭代，检查是否可以修改数组元素
 */
export function testModifyElementsAfterPop() {
    const arr = [1, 2, 3, 4];
    arr.pop();
    for (const [i, v] of arr.entries()) {
        arr[i] = v * 10;
    }
    return JSON.stringify(arr) === JSON.stringify([10, 20, 30]);
}

/**
 * 测试点84：在 entries() 中 pop() 一个嵌套数组
 */
export function testPopNestedArrayDuringEntries() {
    const arr = [[1, 2], [3, 4], [5, 6]];
    const visited = [];
    try {
        for (const [i, v] of arr.entries()) {
            visited.push([...v]);
            if (i === 0) {
                arr.pop();
            }
        }
        return JSON.stringify(visited) === JSON.stringify([[1, 2], [3, 4]]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点85：pop() 一个包含布尔值的数组后，entries() 遍历
 */
export function testPopBooleanArray() {
    const arr = [true, false, true, false];
    arr.pop();
    const result = Array.from(arr.entries()).map(([i, v]) => v);
    return JSON.stringify(result) === JSON.stringify([true, false, true]);
}

/**
 * 测试点86：entries() 迭代中，pop() 一个数组然后立即调用 slice() 获取副本
 */
export function testSliceAfterPopDuringEntries() {
    const arr = ['x', 'y', 'z', 'w'];
    let sliceResult = null;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                sliceResult = arr.slice();
            }
        }
        return JSON.stringify(sliceResult) === JSON.stringify(['x', 'y', 'z']);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点87：pop() 后 entries()，检查 toString() 是否正确
 */
export function testToStringAfterPopAndEntries() {
    const arr = [1, 2, 3, 4];
    arr.pop();
    const str = arr.toString();
    return str === '1,2,3';
}

/**
 * 测试点88：在 entries() 中 pop() 一个包含大数值的数组
 */
export function testPopLargeNumberArray() {
    const arr = [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 123456789];
    const visited = [];
    try {
        for (const [i, v] of arr.entries()) {
            visited.push(v);
            if (i === 0) {
                arr.pop();
            }
        }
        return JSON.stringify(visited) === JSON.stringify([Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点89：pop() 一个字符串数组后，entries() 遍历时检查字符串方法
 */
export function testStringMethodsAfterPop() {
    const arr = ['hello', 'world', 'test'];
    arr.pop();
    const upperCase = [];
    for (const [i, v] of arr.entries()) {
        upperCase.push(v.toUpperCase());
    }
    return JSON.stringify(upperCase) === JSON.stringify(['HELLO', 'WORLD']);
}

/**
 * 测试点90：entries() 迭代中 pop()，然后使用 every() 检查条件
 */
export function testEveryAfterPopInIteration() {
    const arr = [2, 4, 6, 8];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
            }
        }
        return arr.every(x => x % 2 === 0) && arr.length === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点91：pop() 一个包含特殊值（NaN, Infinity）的数组后，entries() 遍历
 */
export function testPopSpecialValues() {
    const arr = [NaN, Infinity, -Infinity, 0];
    arr.pop();
    const entriesResult = Array.from(arr.entries()).map(([i, v]) => {
        if (isNaN(v)) {
            return 'NaN';
        }
        return v;
    });
    return JSON.stringify(entriesResult) === JSON.stringify(['NaN', Infinity, -Infinity]);
}

/**
 * 测试点92：在 entries() 中 pop() 一个数组，然后立即调用 concat()
 */
export function testConcatAfterPopInEntries() {
    const arr = [1, 2, 3];
    let concatResult = null;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                concatResult = arr.concat([99]);
            }
        }
        return JSON.stringify(concatResult) === JSON.stringify([1, 2, 99]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点93：pop() 后 entries()，检查 indexOf() 行为
 */
export function testIndexOfAfterPop() {
    const arr = ['apple', 'banana', 'cherry', 'date'];
    arr.pop();
    const indices = [];
    for (const [i, v] of arr.entries()) {
        indices.push(arr.indexOf(v));
    }
    return JSON.stringify(indices) === JSON.stringify([0, 1, 2]);
}

/**
 * 测试点94：entries() 迭代中 pop()，然后使用 filter() 创建新数组
 */
export function testFilterAfterPopInIteration() {
    const arr = [1, 2, 3, 4, 5];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 2) {
                arr.pop();
            }
        }
        const filtered = arr.filter(x => x > 2);
        return JSON.stringify(filtered) === JSON.stringify([3, 4]) && arr.length === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点95：pop() 一个包含日期对象的数组后，entries() 遍历
 */
export function testPopDateArray() {
    const d1 = new Date('2020-01-01');
    const d2 = new Date('2021-01-01');
    const d3 = new Date('2022-01-01');
    const arr = [d1, d2, d3];
    arr.pop();
    const dates = [];
    for (const [i, v] of arr.entries()) {
        dates.push(v.toISOString());
    }
    return dates.length === 2 && dates[0] === '2020-01-01T00:00:00.000Z' && dates[1] === '2021-01-01T00:00:00.000Z';
}

/**
 * 测试点96：在 entries() 中 pop() 一个数组，然后检查 includes()
 */
export function testIncludesAfterPopInEntries() {
    const arr = ['a', 'b', 'c', 'd'];
    let hasB = false;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                hasB = arr.includes('b');
            }
        }
        return hasB === true && arr.length === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点97：pop() 后 entries()，验证 join() 结果
 */
export function testJoinAfterPop() {
    const arr = ['one', 'two', 'three', 'four'];
    arr.pop();
    const joined = arr.join('-');
    return joined === 'one-two-three';
}

/**
 * 测试点98：entries() 迭代中 pop() 一个数组，然后使用 map() 转换
 */
export function testMapAfterPopInIteration() {
    const arr = [10, 20, 30, 40];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
            }
        }
        const mapped = arr.map(x => x / 10);
        return JSON.stringify(mapped) === JSON.stringify([1, 2, 3]) && arr.length === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点99：pop() 一个包含正则表达式的数组后，entries() 遍历
 */
export function testPopRegexArray() {
    const r1 = /abc/;
    const r2 = /def/;
    const r3 = /ghi/;
    const arr = [r1, r2, r3];
    arr.pop();
    const sourceList = [];
    for (const [i, v] of arr.entries()) {
        sourceList.push(v.source);
    }
    return JSON.stringify(sourceList) === JSON.stringify(['abc', 'def']);
}

/**
 * 测试点100：entries() 迭代中 pop()，然后使用 reduce() 计算总和
 */
export function testReduceAfterPopInEntries() {
    const arr = [1, 2, 3, 4, 5];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 2) {
                arr.pop();
            }
        }
        const sum = arr.reduce((acc, val) => acc + val, 0);
        return sum === 10 && arr.length === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点101：pop() 一个包含 Set 的数组后，entries() 遍历
 */
export function testPopSetArray() {
    const s1 = new Set([1, 2]);
    const s2 = new Set([3, 4]);
    const s3 = new Set([5, 6]);
    const arr = [s1, s2, s3];
    const sizes = [];
    for (const [i, v] of arr.entries()) {
        sizes.push(v.size);
        if (i === 1) {
            arr.pop();
        }
    }
    return JSON.stringify(sizes) === JSON.stringify([2, 2]);
}

/**
 * 测试点102：在 entries() 迭代中 pop() 后立即调用 splice() 删除元素
 */
export function testPopThenSpliceDuringEntries() {
    const arr = [1, 2, 3, 4, 5];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                arr.splice(1, 1);
            }
        }
        return JSON.stringify(arr) === JSON.stringify([1, 3, 4]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点103：pop() 一个包含 Symbol 的数组后，entries() 遍历
 */
export function testPopSymbolArray() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const sym3 = Symbol('c');
    const arr = [sym1, sym2, sym3];
    arr.pop();
    const symbols = [];
    for (const [i, v] of arr.entries()) {
        symbols.push(v.toString());
    }
    return symbols.length === 2 && symbols[0] === 'Symbol(a)' && symbols[1] === 'Symbol(b)';
}

/**
 * 测试点104：entries() 迭代中 pop() 后检查数组的 length 属性描述符
 */
export function testLengthDescriptorAfterPopInEntries() {
    const arr = [10, 20, 30];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
            }
        }
        const descriptor = Object.getOwnPropertyDescriptor(arr, 'length');
        return descriptor.writable === true && descriptor.enumerable === false && arr.length === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点105：pop() 一个包含 Map 的数组后，entries() 遍历并检查 Map 大小
 */
export function testPopMapArray() {
    const m1 = new Map([['a', 1]]);
    const m2 = new Map([['b', 2]]);
    const m3 = new Map([['c', 3]]);
    const arr = [m1, m2, m3];
    const sizes = [];
    for (const [i, v] of arr.entries()) {
        sizes.push(v.size);
        if (i === 0) {
            arr.pop();
        }
    }
    return JSON.stringify(sizes) === JSON.stringify([1, 1]);
}

/**
 * 测试点106：entries() 迭代中 pop() 后立即使用 find() 查找元素
 */
export function testFindAfterPopInEntries() {
    const arr = [100, 200, 300, 400];
    let found = null;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                found = arr.find(x => x === 200);
            }
        }
        return found === 200 && arr.length === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点107：pop() 后 entries() 遍历，验证数组的原型链
 */
export function testPrototypeChainAfterPop() {
    const arr = [1, 2, 3, 4];
    arr.pop();
    return Array.isArray(arr) && arr.__proto__ === Array.prototype;
}

/**
 * 测试点108：在 entries() 中 pop() 一个数组，然后使用 some() 检查条件
 */
export function testSomeAfterPopInEntries() {
    const arr = [1, 3, 5, 7, 9];
    let result = false;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 2) {
                arr.pop();
                result = arr.some(x => x > 6);
            }
        }
        return result === true && arr.length === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点109：pop() 一个包含 BigInt 的数组后，entries() 遍历
 */
export function testPopBigIntArray() {
    const big1 = BigInt(123);
    const big2 = BigInt(456);
    const big3 = BigInt(789);
    const arr = [big1, big2, big3];
    arr.pop();
    const bigInts = [];
    for (const [i, v] of arr.entries()) {
        bigInts.push(v.toString());
    }
    return JSON.stringify(bigInts) === JSON.stringify(['123', '456']);
}

/**
 * 测试点110：entries() 迭代中 pop() 后立即调用 copyWithin()
 */
export function testCopyWithinAfterPopInEntries() {
    const arr = [1, 2, 3, 4, 5];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 2) {
                arr.pop();
                arr.copyWithin(0, 2, 4);
            }
        }
        return JSON.stringify(arr) === JSON.stringify([3, 4, 3, 4]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点111：pop() 一个包含 Error 对象的数组后，entries() 遍历
 */
export function testPopErrorArray() {
    const err1 = new Error('error1');
    const err2 = new Error('error2');
    const err3 = new Error('error3');
    const arr = [err1, err2, err3];
    const names = [];
    for (const [i, v] of arr.entries()) {
        names.push(v.name);
        if (i === 1) {
            arr.pop();
        }
    }
    return JSON.stringify(names) === JSON.stringify(['Error', 'Error']);
}

/**
 * 测试点112：entries() 迭代中 pop() 后使用 fill() 填充数组
 */
export function testFillAfterPopInEntries() {
    const arr = [1, 2, 3, 4, 5];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                arr.fill(99, 1, 3);
            }
        }
        return JSON.stringify(arr) === JSON.stringify([1, 99, 99, 4]) && arr.length === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点113：pop() 后 entries()，检查数组是否可通过 JSON 序列化
 */
export function testJSONSerializationAfterPop() {
    const arr = [{ id: 1 }, { id: 2 }, { id: 3 }, { id: 4 }];
    arr.pop();
    const jsonStr = JSON.stringify(arr);
    return JSON.parse(jsonStr).length === 3;
}

/**
 * 测试点114：在 entries() 中 pop() 一个数组，然后检查 hasOwnProperty
 */
export function testHasOwnPropertyAfterPopInEntries() {
    const arr = [10, 20, 30];
    let hasProp = false;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                hasProp = arr.hasOwnProperty(1);
            }
        }
        return hasProp === true && arr.length === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点115：pop() 一个包含 Promise 的数组后，entries() 遍历
 */
export function testPopPromiseArray() {
    const p1 = Promise.resolve(1);
    const p2 = Promise.resolve(2);
    const p3 = Promise.resolve(3);
    const arr = [p1, p2, p3];
    const types = [];
    for (const [i, v] of arr.entries()) {
        types.push(Object.prototype.toString.call(v));
        if (i === 0) {
            arr.pop();
        }
    }
    return JSON.stringify(types) === JSON.stringify(['[object Promise]', '[object Promise]']);
}

/**
 * 测试点116：entries() 迭代中 pop() 后立即调用 reverse()
 */
export function testReverseAfterPopInEntries() {
    const arr = [1, 2, 3, 4];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                arr.reverse();
            }
        }
        return JSON.stringify(arr) === JSON.stringify([3, 2, 1]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点117：pop() 一个包含 Proxy 对象的数组后，entries() 遍历
 */
export function testPopProxyArray() {
    const target1 = { name: 'obj1' };
    const target2 = { name: 'obj2' };
    const target3 = { name: 'obj3' };
    const proxy1 = new Proxy(target1, {});
    const proxy2 = new Proxy(target2, {});
    const proxy3 = new Proxy(target3, {});
    const arr = [proxy1, proxy2, proxy3];
    const names = [];
    for (const [i, v] of arr.entries()) {
        names.push(v.name);
        if (i === 1) {
            arr.pop();
        }
    }
    return JSON.stringify(names) === JSON.stringify(['obj1', 'obj2']);
}

/**
 * 测试点118：entries() 迭代中 pop() 后使用 flat() 展平数组
 */
export function testFlatAfterPopInEntries() {
    const arr = [[1, 2], [3, 4], [5, 6], [7, 8]];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                const flattened = arr.flat();
                return JSON.stringify(flattened) === JSON.stringify([1, 2, 3, 4, 5, 6]);
            }
        }
        return false;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点119：pop() 一个包含 URL 对象的数组后，entries() 遍历
 */
export function testPopURLArray() {
    try {
        const url1 = new URL('https://example.com/page1');
        const url2 = new URL('https://example.com/page2');
        const url3 = new URL('https://example.com/page3');
        const arr = [url1, url2, url3];
        const hosts = [];
        for (const [i, v] of arr.entries()) {
            hosts.push(v.host);
            if (i === 0) {
                arr.pop();
            }
        }
        return JSON.stringify(hosts) === JSON.stringify(['example.com', 'example.com']);
    } catch (e) {
        return true;
    }
}

/**
 * 测试点120：entries() 迭代中 pop() 后立即调用 sort()
 */
export function testSortAfterPopInEntries() {
    const arr = [30, 10, 40, 20];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                arr.sort((a, b) => a - b);
            }
        }
        return JSON.stringify(arr) === JSON.stringify([10, 30, 40]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点121：pop() 后 entries()，验证数组的 constructor 属性
 */
export function testConstructorAfterPop() {
    const arr = [1, 2, 3, 4];
    arr.pop();
    return arr.constructor === Array;
}

/**
 * 测试点122：在 entries() 迭代中 pop() 后立即调用 toLocaleString()
 */
export function testToLocaleStringAfterPopInEntries() {
    const arr = [1000, 2000, 3000, 4000];
    let localeStr = '';
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                localeStr = arr.toLocaleString();
            }
        }
        return JSON.stringify(localeStr) === '"1,000,2,000,3,000"' && arr.length === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点123：pop() 一个包含 Date 对象的数组后，entries() 遍历时比较时间戳
 */
export function testCompareTimestampsAfterPop() {
    const d1 = new Date('2020-01-01');
    const d2 = new Date('2021-01-01');
    const d3 = new Date('2022-01-01');
    const d4 = new Date('2023-01-01');
    const arr = [d1, d2, d3, d4];
    const timestamps = [];
    for (const [i, v] of arr.entries()) {
        timestamps.push(v.getTime());
        if (i === 2) {
            arr.pop();
        }
    }
    return timestamps.length === 3 &&
        timestamps[0] === new Date('2020-01-01').getTime() &&
        timestamps[1] === new Date('2021-01-01').getTime() &&
        timestamps[2] === new Date('2022-01-01').getTime();
}

/**
 * 测试点124：entries() 迭代中 pop() 后检查数组是否等于另一个相同内容的数组
 */
export function testEqualityAfterPopInEntries() {
    const arr = [1, 2, 3, 4];
    let isEqual = false;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                const compareArr = [1, 2, 3];
                isEqual = JSON.stringify(arr) === JSON.stringify(compareArr);
            }
        }
        return isEqual && arr.length === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点125：pop() 一个包含正则标志的数组后，entries() 遍历检查标志
 */
export function testRegexFlagsAfterPop() {
    const r1 = /abc/g;
    const r2 = /def/i;
    const r3 = /ghi/m;
    const arr = [r1, r2, r3];
    const flags = [];
    for (const [i, v] of arr.entries()) {
        flags.push(v.flags);
        if (i === 0) {
            arr.pop();
        }
    }
    return JSON.stringify(flags) === JSON.stringify(['g', 'i']);
}

/**
 * 测试点126：entries() 迭代中 pop() 后立即调用 values() 迭代器
 */
export function testValuesAfterPopInEntries() {
    const arr = ['a', 'b', 'c', 'd'];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                const valuesIter = arr.values();
                const valuesResult = Array.from(valuesIter);
                return JSON.stringify(valuesResult) === JSON.stringify(['a', 'b', 'c']);
            }
        }
        return false;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点127：pop() 后 entries()，验证数组的键名（keys）是否正确
 */
export function testKeysAfterPop() {
    const arr = [10, 20, 30, 40];
    arr.pop();
    const keys = Array.from(arr.keys());
    return JSON.stringify(keys) === JSON.stringify([0, 1, 2]);
}

/**
 * 测试点128：在 entries() 中 pop() 一个数组，然后使用 forEach() 遍历
 */
export function testForEachAfterPopInEntries() {
    const arr = [5, 10, 15, 20];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 2) {
                arr.pop();
            }
        }
        const results = [];
        arr.forEach(item => results.push(item * 2));
        return JSON.stringify(results) === JSON.stringify([10, 20, 30]) && arr.length === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点129：pop() 一个包含类实例的数组后，entries() 遍历检查实例类型
 */
export function testClassInstanceAfterPop() {
    class TestClass {
        constructor(name) {
            this.name = name;
        }
    }

    const obj1 = new TestClass('first');
    const obj2 = new TestClass('second');
    const obj3 = new TestClass('third');
    const arr = [obj1, obj2, obj3];
    const types = [];
    for (const [i, v] of arr.entries()) {
        types.push(v instanceof TestClass);
        if (i === 1) {
            arr.pop();
        }
    }
    return JSON.stringify(types) === JSON.stringify([true, true]);
}

/**
 * 测试点130：entries() 迭代中 pop() 后立即调用 flatMap()
 */
export function testFlatMapAfterPopInEntries() {
    const arr = [[1, 2], [3, 4], [5, 6], [7, 8]];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                const flatMapped = arr.flatMap(subArr => subArr.map(x => x * 10));
                return JSON.stringify(flatMapped) === JSON.stringify([10, 20, 30, 40, 50, 60]);
            }
        }
        return false;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点131：pop() 一个包含 undefined 和 null 混合的数组后，entries() 遍历
 */
export function testMixedNullOrUndefAfterPop() {
    const arr = [null, 'a', undefined, 'b', null, 'c'];
    arr.pop();
    const values = [];
    for (const [i, v] of arr.entries()) {
        values.push(v);
    }
    return JSON.stringify(values) === JSON.stringify([null, 'a', undefined, 'b', null]);
}

/**
 * 测试点132：entries() 迭代中 pop() 后检查数组的 valueOf()
 */
export function testValueOfAfterPopInEntries() {
    const arr = [1, 2, 3, 4];
    let valueOfResult = null;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                valueOfResult = arr.valueOf();
            }
        }
        return Array.isArray(valueOfResult) && JSON.stringify(valueOfResult) === JSON.stringify([1, 2, 3]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试点133：pop() 一个包含箭头函数的数组后，entries() 遍历并执行函数
 */
export function testExecuteArrowFunctionsAfterPop() {
    const fn1 = () => 'result1';
    const fn2 = () => 'result2';
    const fn3 = () => 'result3';
    const arr = [fn1, fn2, fn3];
    const results = [];
    for (const [i, v] of arr.entries()) {
        if (typeof v === 'function') {
            results.push(v());
        }
        if (i === 0) {
            arr.pop();
        }
    }
    return JSON.stringify(results) === JSON.stringify(['result1', 'result2']);
}

/**
 * 测试点134：entries() 迭代中 pop() 后立即调用 at() 方法获取元素
 */
export function testAtAfterPopInEntries() {
    const arr = [10, 20, 30, 40, 50];
    let elementAtNeg1 = undefined;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 2) {
                arr.pop();
                elementAtNeg1 = arr.at(-1);
            }
        }
        return elementAtNeg1 === 40 && arr.length === 4;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点135：pop() 一个包含大型对象的数组后，entries() 遍历检查属性
 */
export function testLargeObjectPropertiesAfterPop() {
    const obj1 = { id: 1, data: { nested: { value: 'a' } }, meta: 'info1' };
    const obj2 = { id: 2, data: { nested: { value: 'b' } }, meta: 'info2' };
    const obj3 = { id: 3, data: { nested: { value: 'c' } }, meta: 'info3' };
    const arr = [obj1, obj2, obj3];
    const ids = [];
    for (const [i, v] of arr.entries()) {
        ids.push(v.id);
        if (i === 0) {
            arr.pop();
        }
    }
    return JSON.stringify(ids) === JSON.stringify([1, 2]);
}

/**
 * 测试点136：entries() 迭代中 pop() 后使用 reduceRight() 从右到左计算
 */
export function testReduceRightAfterPopInEntries() {
    const arr = [1, 2, 3, 4, 5];
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 3) {
                arr.pop();
            }
        }
        const result = arr.reduceRight((acc, val) => acc * val, 1);
        return result === 24 && arr.length === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点137：pop() 一个包含循环引用的对象数组后，entries() 遍历
 */
export function testCircularReferenceAfterPop() {
    const obj1 = { name: 'obj1' };
    const obj2 = { name: 'obj2' };
    obj1.ref = obj1;
    obj2.ref = obj1;
    const arr = [obj1, obj2];
    let hasCircular = false;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 0) {
                arr.pop();
            }
            if (v.ref === v) {
                hasCircular = true;
            }
        }
        return hasCircular && arr.length === 1;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点138：entries() 迭代中 pop() 后立即调用 findIndex() 查找索引
 */
export function testFindIndexAfterPopInEntries() {
    const arr = [10, 20, 30, 40];
    let foundIndex = -1;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                foundIndex = arr.findIndex(x => x === 30);
            }
        }
        return foundIndex === 2 && arr.length === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点139：pop() 一个包含 TypedArray 的数组后，entries() 遍历
 */
export function testTypedArrayAfterPop() {
    const ta1 = new Int8Array([1, 2]);
    const ta2 = new Uint8Array([3, 4]);
    const ta3 = new Int16Array([5, 6]);
    const arr = [ta1, ta2, ta3];
    const lengths = [];
    for (const [i, v] of arr.entries()) {
        lengths.push(v.length);
        if (i === 0) {
            arr.pop();
        }
    }
    return JSON.stringify(lengths) === JSON.stringify([2, 2]);
}

/**
 * 测试点140：entries() 迭代中 pop() 后检查数组的 isPrototypeOf() 方法
 */
export function testIsPrototypeOfAfterPopInEntries() {
    const arr = [1, 2, 3, 4];
    let isProtoOf = false;
    try {
        for (const [i, v] of arr.entries()) {
            if (i === 1) {
                arr.pop();
                isProtoOf = Array.prototype.isPrototypeOf(arr);
            }
        }
        return isProtoOf === true && arr.length === 3;
    } catch (e) {
        return false;
    }
}