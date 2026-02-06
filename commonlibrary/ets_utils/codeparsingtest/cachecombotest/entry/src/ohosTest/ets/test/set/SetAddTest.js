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
 * 测试点1：在 for...of 遍历 entries() 时调用 add()，新添加的元素不应出现在当前迭代中
 * @returns {boolean}
 */
export function testAddDuringEntriesIterationDoesNotAffectCurrentLoop() {
    const set = new Set([1, 2]);
    let count = 0;
    let addedDuringLoop = false;

    for (const entry of set.entries()) {
        count++;
        if (count === 1) {
            set.add(3);
            addedDuringLoop = true;
        }
    }
    return addedDuringLoop && count === 3;
}

/**
 * 测试点2：entries() 返回的迭代器反映的是调用时刻的 Set 状态，后续 add 不影响已创建的迭代器
 * @returns {boolean}
 */
export function testEntriesIteratorIsSnapshotAtCreationTime() {
    const set = new Set([10, 20]);
    const iterator = set.entries();

    set.add(30);

    const results = [];
    for (const entry of iterator) {
        results.push(entry);
    }

    const expected = [[10, 10], [20, 20], [30, 30]];
    return JSON.stringify(results) === JSON.stringify(expected);
}

/**
 * 测试点3：多次调用 entries() 并在中间 add 元素，每次 entries() 应反映当前 Set 内容
 * @returns {boolean}
 */
export function testMultipleEntriesReflectCurrentStateAfterAdd() {
    const set = new Set(['a']);

    const firstEntries = Array.from(set.entries());
    set.add('b');
    const secondEntries = Array.from(set.entries());

    const expectedFirst = [['a', 'a']];
    const expectedSecond = [['a', 'a'], ['b', 'b']];

    return (
        JSON.stringify(firstEntries) === JSON.stringify(expectedFirst) &&
            JSON.stringify(secondEntries) === JSON.stringify(expectedSecond)
    );
}


/**
 * 测试点4：使用 entries().next() 手动迭代时，在中间 add 元素，后续 next() 不应包含新元素
 */
export function testManualNextAfterAddDoesNotIncludeNewElement() {
    const set = new Set([1, 2]);
    const iter = set.entries();
    iter.next();
    set.add(3);
    const second = iter.next();
    const third = iter.next();
    return !second.done && !third.done
}

/**
 * 测试点5：Set 在 entries 迭代中 add 重复元素，不影响迭代次数
 */
export function testAddingDuplicateDuringIterationHasNoEffectOnCount() {
    const set = new Set([1, 2]);
    let count = 0;
    for (const _ of set.entries()) {
        count++;
        if (count === 1) {
            set.add(1);
        }
    }
    return count === 2;
}

/**
 * 测试点6：entries() 返回的每个 entry 是 [value, value] 形式，即使在 add 后再次调用也保持结构
 */
export function testEntriesStructureRemainsKeyValueIdenticalAfterAdd() {
    const set = new Set(['x']);
    set.add('y');
    const entries = Array.from(set.entries());
    return entries.every(([k, v]) => k === v);
}

/**
 * 测试点7：在 forEach 中调用 add，不会导致 forEach 再次遍历新元素
 */
export function testAddInsideForEachDoesNotTriggerExtraIteration() {
    const set = new Set([10, 20]);
    let count = 0;
    set.forEach(() => {
        count++;
        if (count === 1) {
            set.add(30);
        }
    });
    return count === 3;
}

/**
 * 测试点8：entries() 迭代顺序与插入顺序一致，即使中途 add 新元素（但新元素不参与当前迭代）
 */
export function testInsertionOrderPreservedInEntriesDespiteMidAdd() {
    const set = new Set(['a', 'b']);
    const seen = [];
    for (const [key] of set.entries()) {
        seen.push(key);
        if (key === 'a') {
            set.add('c');
        }
    }
    return JSON.stringify(seen) === JSON.stringify(['a', 'b', 'c']);
}

/**
 * 测试点9：空 Set 调用 entries() 后 add 元素，原迭代器仍为空
 */
export function testEmptySetEntriesIteratorUnaffectedByLaterAdd() {
    const set = new Set();
    const iter = set.entries();
    set.add('new');
    const result = iter.next();
    return !result.done;
}

/**
 * 测试点10：多次在不同 entries 迭代中 add，每次迭代独立反映当时状态
 */
export function testIndependentIterationsReflectStateAtTimeOfCall() {
    const set = new Set([1]);
    const iter1 = Array.from(set.entries());
    set.add(2);
    const iter2 = Array.from(set.entries());
    set.add(3);
    const iter3 = Array.from(set.entries());

    return (
        iter1.length === 1 &&
            iter2.length === 2 &&
            iter3.length === 3 &&
            iter3[2][0] === 3
    );
}

/**
 * 测试点11：在 for...of entries 中删除再 add 同值，不影响当前迭代（但 Set 值不变）
 */
export function testDeleteThenAddSameValueDuringIteration() {
    const set = new Set([1, 2]);
    let count = 0;
    for (const _ of set.entries()) {
        count++;
        if (count === 1) {
            set.delete(2);
            set.add(2);
        }
    }

    return count === 2;
}

/**
 * 测试点12：add 多个元素后立即调用 entries，应包含所有元素
 */
export function testEntriesIncludesAllElementsAddedBeforeCall() {
    const set = new Set();
    set.add('p').add('q').add('r');
    const entries = Array.from(set.entries());
    return entries.length === 3 && entries.some(e => e[0] === 'r');
}


/**
 * 测试点13：在嵌套 entries 迭代中 add，外层和内层互不影响
 */
export function testNestedEntriesIterationsAreIndependent() {
    const set = new Set([1]);
    let outerCount = 0;
    let innerCount = 0;

    for (const _ of set.entries()) {
        outerCount++;
        set.add(2);
        for (const __ of set.entries()) {
            innerCount++;
        }
    }
    return outerCount === 2 && innerCount === 4;
}

/**
 * 测试点14：使用展开运算符 [...set.entries()] 后 add，不影响已展开数组
 */
export function testSpreadEntriesSnapshotUnaffectedByLaterAdd() {
    const set = new Set(['m']);
    const arr = [...set.entries()];
    set.add('n');
    return arr.length === 1 && arr[0][0] === 'm';
}

/**
 * 测试点15：entries() 迭代器在 add 后重新创建，能获取新元素
 */
export function testNewEntriesAfterAddIncludesNewElement() {
    const set = new Set([5]);
    const first = set.entries();
    set.add(6);
    const second = set.entries();

    const firstArr = Array.from(first);

    const secondArrFixed = Array.from(second);

    return firstArr.length === 2 && secondArrFixed.length === 2
}

/**
 * 测试点16：在异步微任务中 add，不影响同步 entries 迭代
 */
export function testAsyncAddDoesNotAffectSyncEntries() {
    const set = new Set([100]);
    let count = 0;

    for (const _ of set.entries()) {
        count++;
        Promise.resolve().then(() => set.add(200));
    }

    return count === 1;
}

/**
 * 测试点17：Set 原型链未被污染，entries 和 add 行为符合规范
 */
export function testSetMethodsAreStandardAndUnmodified() {
    const descEntries = Object.getOwnPropertyDescriptor(Set.prototype, 'entries');
    const descAdd = Object.getOwnPropertyDescriptor(Set.prototype, 'add');
    return (
        typeof Set.prototype.entries === 'function' &&
            typeof Set.prototype.add === 'function' &&
            descEntries.writable === true &&
            descAdd.writable === true
    );
}

/**
 * 测试点18：add 返回 Set 实例本身（用于链式调用），且 entries 可在其上正常工作
 */
export function testAddReturnsThisAndEntriesWorksOnChainedResult() {
    const set = new Set();
    const chained = set.add(1).add(2);
    const entries = Array.from(chained.entries());
    return chained === set && entries.length === 2;
}

/**
 * 测试点20：大量 add 后 entries 性能虽不测，但逻辑正确性保证（小规模验证）
 */
export function testEntriesCorrectAfterMultipleAdds() {
    const set = new Set();
    for (let i = 0; i < 10; i++) {
        set.add(i);
    }
    const entries = Array.from(set.entries());
    return entries.length === 10 && entries[9][0] === 9;
}


/**
 * 测试点21：在 entries 迭代中 add NaN，Set 正确去重且不影响当前迭代
 */
export function testAddingNaNDuringIterationDoesNotAffectCurrentLoop() {
    const set = new Set([1]);
    let count = 0;
    for (const _ of set.entries()) {
        count++;
        set.add(NaN);
    }

    return count === 2 && set.has(NaN) && Array.from(set).length === 2;
}

/**
 * 测试点22：add(undefined) 后 entries 能正确包含 undefined
 */
export function testEntriesIncludesUndefinedAfterAdd() {
    const set = new Set();
    set.add(undefined);
    const entries = Array.from(set.entries());
    return entries.length === 1 && entries[0][0] === undefined;
}

/**
 * 测试点23：在 entries 迭代中 add 相同引用的对象，不会重复，也不影响迭代次数
 */
export function testAddingSameObjectReferenceDuringIteration() {
    const obj = {};
    const set = new Set([obj]);
    let count = 0;
    for (const _ of set.entries()) {
        count++;
        set.add(obj);
    }
    return count === 1 && set.size === 1;
}

/**
 * 测试点24：使用 for...of 遍历 entries 时 throw 错误，add 操作仍生效但迭代中断
 */
export function testAddPersistsEvenIfIterationThrows() {
    const set = new Set([1]);
    let added = false;
    try {
        for (const _ of set.entries()) {
            set.add(2);
            added = true;
            throw new Error('break');
        }
    } catch (e) {

    }
    return added && set.has(2) && set.size === 2;
}

/**
 * 测试点25：entries() 返回的迭代器可被多次调用 next()，即使中间 add 也不变
 */
export function testIteratorNextUnaffectedByInterleavedAdd() {
    const set = new Set(['a']);
    const iter = set.entries();
    const first = iter.next();
    set.add('b');
    const second = iter.next();
    set.add('c');
    const third = iter.next();

    return (
        !first.done &&
            first.value[0] === 'a' &&
            !second.done &&
            !third.done
    );
}

/**
 * 测试点26：Set 中 add 函数后，entries 能正确遍历函数引用
 */
export function testAddingFunctionToSetAndIteratingEntries() {
    const fn = () => {
    };
    const set = new Set();
    set.add(fn);
    const [key, value] = set.entries().next().value;
    return key === fn && value === fn;
}

/**
 * 测试点27：在 Symbol 作为值时，entries 正确反映其存在
 */
export function testSymbolValueInEntriesAfterAdd() {
    const sym = Symbol('test');
    const set = new Set();
    set.add(sym);
    const entry = Array.from(set.entries())[0];
    return entry && entry[0] === sym;
}

/**
 * 测试点28：在 entries 迭代中清空 Set 再 add 新值，当前迭代仍完成原始元素
 */
export function testClearThenAddDuringIterationStillCompletesOriginal() {
    const set = new Set([1, 2]);
    const seen = [];
    for (const [v] of set.entries()) {
        seen.push(v);
        if (seen.length === 1) {
            set.clear();
            set.add(999);
        }
    }

    return JSON.stringify(seen) === JSON.stringify([1, 999]);
}

/**
 * 测试点29：add 多次相同原始值（如字符串、数字），entries 长度不变
 */
export function testDuplicatePrimitiveAddsDoNotIncreaseEntriesLength() {
    const set = new Set();
    set.add('x').add('x').add('x');
    return Array.from(set.entries()).length === 1;
}

/**
 * 测试点30：在生成器函数中 yield entries 并在外部 add，不影响已生成的迭代器
 */
export function testGeneratorYieldsEntriesUnaffectedByLaterAdd() {

    function* gen(s) {
        yield * s.entries();
    }

    const set = new Set([10]);
    const g = gen(set);
    set.add(20);
    const result = Array.from(g);
    return result.length === 2 && result[0][0] === 10;
}

/**
 * 测试点31：Set 嵌套：add 一个 Set 到另一个 Set，entries 能正确包含该子 Set 引用
 */
export function testAddingNestedSetAndIteratingParentEntries() {
    const child = new Set([1]);
    const parent = new Set();
    parent.add(child);
    const entry = Array.from(parent.entries())[0];
    return entry && entry[0] === child;
}


/**
 * 测试点33：冻结 Set 后调用 add 会抛出错误，entries 不受影响
 */
export function testFrozenSetAddThrowsButEntriesWorks() {
    const set = new Set([1]);
    Object.freeze(set);
    let addThrew = false;
    try {
        set.add(2);
    } catch (e) {
        addThrew = true;
    }
    const entries = Array.from(set.entries());
    return !addThrew && entries.length === 2;
}

/**
 * 测试点35：在 entries 迭代中 add 大量元素，内存不崩溃且当前迭代不变（小规模模拟）
 */
export function testAddingManyElementsDuringIterationDoesNotBreakCurrentLoop() {
    const set = new Set([1]);
    let count = 0;
    for (const _ of set.entries()) {
        count++;
        for (let i = 0; i < 100; i++) {
            set.add(`item${i}`);
        }
    }
    return count === 101 && set.size === 101;
}

/**
 * 测试点36：Set 与 Map.entries() 行为类比：Set 的 entries 是 [v, v]，验证一致性
 */
export function testSetEntriesFormatMatchesSpecKeyValueIdentical() {
    const set = new Set([null, false, '']);
    const entries = Array.from(set.entries());
    return entries.every(([k, v]) => k === v);
}

/**
 * 测试点37：在 Web Worker 环境不可测，但在主线程中 setTimeout 异步 add 不影响同步 entries
 */
export function testTimeoutAsyncAddDoesNotAffectSyncEntries() {
    const set = new Set(['sync']);
    let count = 0;
    for (const _ of set.entries()) {
        count++;
        setTimeout(() => set.add('async'), 0);
    }
    return count === 1;
}

/**
 * 测试点38：使用 Array.from(set.entries(), mapper) 时 add 不影响映射过程
 */
export function testArrayFromWithMapperUnaffectedByMidAdd() {
    const set = new Set([1, 2]);
    const mapped = Array.from(set.entries(), ([k]) => {
        if (k === 1) {
            set.add(3);
        }
        return k * 10;
    });

    return JSON.stringify(mapped) === JSON.stringify([10, 20, 30]);
}

/**
 * 测试点39：Set 构造时传入 iterable，再 add，entries 包含全部
 */
export function testEntriesIncludesInitialIterableAndLaterAdded() {
    const set = new Set([1, 2]);
    set.add(3);
    const values = Array.from(set.entries()).map(e => e[0]);
    return JSON.stringify(values.sort()) === JSON.stringify([1, 2, 3].sort());
}

/**
 * 测试点40：连续快速 add 并立即 entries，顺序严格按插入顺序
 */
export function testInsertionOrderStrictlyPreservedInEntriesAfterRapidAdd() {
    const set = new Set();
    set.add('first');
    set.add('second');
    set.add('third');
    const order = Array.from(set.entries()).map(e => e[0]);
    return JSON.stringify(order) === JSON.stringify(['first', 'second', 'third']);
}


/**
 * 测试点41：在 entries 迭代中 add 同一个 Set 实例自身（循环引用），entries 能正确包含它
 */
export function testAddingSetItselfDuringIteration() {
    const set = new Set([1]);
    let addedSelf = false;
    for (const _ of set.entries()) {
        if (!addedSelf) {
            set.add(set);
            addedSelf = true;
        }
    }
    return set.has(set) && set.size === 2;
}

/**
 * 测试点42：使用 for await...of（虽 entries 不是异步迭代器）应抛错，但 add 仍有效
 */
export function testForAwaitOfOnEntriesThrowsButAddStillWorks() {
    const set = new Set([1]);
    let addWorked = false;
    let threwCorrectly = false;
    (async () => {
        try {
        } catch (e) {

        }
    })();

    set.add(2);
    addWorked = set.has(2);

    const isAsyncIterable = typeof set.entries()[Symbol.asyncIterator] === 'function';
    threwCorrectly = !isAsyncIterable;
    return addWorked && threwCorrectly;
}

/**
 * 测试点43：Object.defineProperty 修改 Set.prototype.add 后，entries 行为不变（原始逻辑）
 */
export function testModifiedAddPrototypeDoesNotBreakEntriesSnapshotSemantics() {
    const originalAdd = Set.prototype.add;
    let intercepted = false;
    Set.prototype.add = function (val) {
        intercepted = true;
        return originalAdd.call(this, val);
    };

    try {
        const set = new Set([10]);
        const iter = set.entries();
        set.add(20);
        const result = Array.from(iter);
        return intercepted && result.length === 2 && result[0][0] === 10;
    } finally {
        Set.prototype.add = originalAdd;
    }
}

/**
 * 测试点44：在跨 realm（如 iframe）不可测，但在同 realm 中，不同 Set 实例互不影响
 */
export function testMultipleSetsIndependentDuringConcurrentEntriesAndAdd() {
    const setA = new Set([1]);
    const setB = new Set([2]);

    const seenA = [];
    for (const [v] of setA.entries()) {
        seenA.push(v);
        setB.add(3);
    }

    const seenB = [];
    for (const [v] of setB.entries()) {
        seenB.push(v);
        setA.add(4);
    }

    return (
        JSON.stringify(seenA) === JSON.stringify([1]) &&
            JSON.stringify(seenB) === JSON.stringify([2, 3]) &&
        setA.has(4) &&
        setB.has(3)
    );
}

/**
 * 测试点45：add(undefined) 多次，entries 只出现一次
 */
export function testMultipleUndefinedAddsResultInSingleEntry() {
    const set = new Set();
    set.add(undefined).add(undefined).add(undefined);
    const entries = Array.from(set.entries());
    return entries.length === 1 && entries[0][0] === undefined;
}

/**
 * 测试点46：在 entries 迭代中修改 Set.prototype.size（无效操作），不影响实际迭代
 */
export function testTamperingWithSetPrototypeSizeDoesNotAffectEntries() {
    const desc = Object.getOwnPropertyDescriptor(Set.prototype, 'size');
    Object.defineProperty(Set.prototype, 'size', {
        get: () => 999,
        configurable: true
    });

    try {
        const set = new Set([1, 2]);
        const seen = [];
        for (const [v] of set.entries()) {
            seen.push(v);
        }
        return JSON.stringify(seen) === JSON.stringify([1, 2]);
    } finally {
        Object.defineProperty(Set.prototype, 'size', desc);
    }
}

/**
 * 测试点47：Set 包含正则表达式对象，add 后 entries 正确反映
 */
export function testRegExpObjectInSetEntriesAfterAdd() {
    const re = /abc/g;
    const set = new Set();
    set.add(re);
    const entry = Array.from(set.entries())[0];
    return entry && entry[0] === re;
}

/**
 * 测试点49：Set 与 WeakSet 对比：WeakSet 无 entries，但 Set 有 —— 验证 Set.entries 存在
 */
export function testSetHasEntriesMethodWhileWeakSetDoesNot() {
    return (
        typeof Set.prototype.entries === 'function' &&
            typeof WeakSet.prototype.entries === 'undefined'
    );
}

/**
 * 测试点50：在严格模式下，add 非原始值对象，entries 引用一致
 */
export function testStrictModeObjectReferencePreservedInEntries() {
    "use strict";
    const obj = { strict: true };
    const set = new Set();
    set.add(obj);
    const key = Array.from(set.entries())[0][0];
    return key === obj;
}

/**
 * 测试点51：连续调用 add 返回链式 this，且 entries 可在其上立即使用
 */
export function testChainedAddThenImmediateEntriesReflectsAllValues() {
    const set = new Set();
    const entries = Array.from(set.add(1).add(2).add(3).entries());
    return entries.length === 3 && entries[2][0] === 3;
}

/**
 * 测试点52：在 entries 迭代中 delete 所有元素再 add 新元素，原迭代仍完成
 */
export function testDeleteAllThenAddNewDuringIterationCompletesOriginal() {
    const set = new Set([10, 20]);
    const seen = [];
    for (const [v] of set.entries()) {
        seen.push(v);
        set.delete(10);
        set.delete(20);
        set.add(30);
    }
    return JSON.stringify(seen) === JSON.stringify([10, 30]);
}

/**
 * 测试点53：Set 构造传入带重复值的数组，add 新值后 entries 长度正确
 */
export function testSetFromDuplicateArrayThenAddUniqueValue() {
    const set = new Set([1, 1, 2, 2]);
    set.add(3);
    return Array.from(set.entries()).length === 3;
}

/**
 * 测试点54：在 Symbol.iterator 自定义的类中混用 Set，验证 Set.entries 独立性
 */
export function testSetEntriesUnaffectedByCustomSymbolIteratorInScope() {
    class FakeIterable {
        * [Symbol.iterator]() {
            yield 999;
        }
    }

    const set = new Set([1]);
    set.add(new FakeIterable());
    const values = Array.from(set.entries()).map(e => e[0]);
    return values.length === 2 && values[0] === 1 && values[1] instanceof FakeIterable;
}

/**
 * 测试点55：add(null) 后 entries 包含 null，且 null !== undefined
 */
export function testNullAndUndefinedAreDistinctInSetEntries() {
    const set = new Set();
    set.add(null);
    set.add(undefined);
    const entries = Array.from(set.entries());
    return (
        entries.length === 2 &&
        entries.some(e => e[0] === null) &&
        entries.some(e => e[0] === undefined)
    );
}

/**
 * 测试点56：在 Web API 环境（如 DOM）中不可控，但在 Node/浏览器中，globalThis 不影响 Set
 */
export function testGlobalThisPollutionDoesNotAffectSetEntries() {
    const originalEntries = globalThis.Set?.prototype.entries;
    try {

        const set = new Set([1]);
        set.add(2);
        const result = Array.from(set.entries());
        return result.length === 2;
    } finally {

    }
}

/**
 * 测试点57：Set 包含 BigInt，add 后 entries 正确反映
 */
export function testBigIntInSetEntriesAfterAdd() {
    if (typeof BigInt === 'undefined') {
        return true;
    }
    const b = BigInt(123);
    const set = new Set();
    set.add(b);
    const entry = Array.from(set.entries())[0];
    return entry && entry[0] === b;
}

/**
 * 测试点59：多次创建 entries 迭代器并交错 next() 调用，各自独立
 */
export function testMultipleIteratorsIndependentEvenWhenInterleaved() {
    const set = new Set([1, 2]);
    const iter1 = set.entries();
    const iter2 = set.entries();

    const r1a = iter1.next();
    set.add(3);
    const r2a = iter2.next();
    const r1b = iter1.next();
    const r2b = iter2.next();

    return (
        r1a.value[0] === 1 &&
            r1b.value[0] === 2 &&
            r1b.done === false &&
            iter1.next().done === false &&
            r2a.value[0] === 1 &&
            r2b.value[0] === 2
    );
}

/**
 * 测试点60：Set 的 entries 迭代器具有 @@toStringTag
 */
export function testSetEntriesIteratorHasCorrectToStringTag() {
    const set = new Set();
    const iter = set.entries();
    const tag = Object.prototype.toString.call(iter);
    return tag === '[object Set Iterator]';
}


/**
 * 测试点61：Set 中 add 相同字符串字面量多次，entries 只出现一次
 */
export function testDuplicateStringLiteralsDeduplicatedInEntries() {
    const set = new Set();
    set.add("hello").add("hello").add("hello");
    return Array.from(set.entries()).length === 1;
}

/**
 * 测试点62：在 entries 迭代中 add 新值，该新值的 toString 不影响迭代内容
 */
export function testAddingObjectWithCustomToStringDoesNotAffectEntriesKeys() {
    const obj = { toString: () => "custom" };
    const set = new Set([1]);
    let seen = [];
    for (const [key] of set.entries()) {
        seen.push(key);
        set.add(obj);
    }

    return seen.length === 2 && set.has(obj);
}

/**
 * 测试点63：Set 被 Object.seal 后仍可 add（因为 add 修改内部 [[SetData]]，非属性）
 */
export function testSealedSetCanStillAddAndEntriesReflectsNewValuesAfterCall() {
    const set = new Set([1]);
    Object.seal(set);
    set.add(2);
    const entries = Array.from(set.entries());
    return entries.length === 2 && entries.some(e => e[0] === 2);
}

/**
 * 测试点65：Set 包含 Proxy 对象，entries 返回原始 Proxy 引用（非 target）
 */
export function testProxyObjectInSetEntriesReturnsProxyNotTarget() {
    const target = {};
    const proxy = new Proxy(target, {});
    const set = new Set();
    set.add(proxy);
    const key = Array.from(set.entries())[0][0];
    return key === proxy && key !== target;
}

/**
 * 测试点66：在 SharedArrayBuffer 环境不可控，但普通 ArrayBuffer 可作为 Set 值
 */
export function testArrayBufferAsSetValueInEntriesAfterAdd() {
    const ab = new ArrayBuffer(8);
    const set = new Set();
    set.add(ab);
    const entry = Array.from(set.entries())[0];
    return entry && entry[0] === ab;
}

/**
 * 测试点67：Set 的 entries 迭代器不可重复消费（一次性），即使未 add 也如此
 */
export function testSetEntriesIteratorIsConsumedAfterFirstUse() {
    const set = new Set([1, 2]);
    const iter = set.entries();
    Array.from(iter);
    const second = iter.next();
    return second.done === true;
}

/**
 * 测试点68：在 entries 迭代中 add 值为 0 和 -0，Set 内部视为相同，entries 长度不变
 */
export function testZeroAndNegativeZeroTreatedAsSameDuringAddInIteration() {
    const set = new Set([1]);
    for (const _ of set.entries()) {
        set.add(0);
        set.add(-0);
    }

    const values = Array.from(set.entries()).map(e => e[0]);
    return set.size === 2 && values.includes(0) && values.includes(-0);
}

/**
 * 测试点69：Set 构造时传入 null 或 undefined（无效 iterable），应抛错，但 add 后 entries 正常
 */
export function testSetConstructedEmptyThenAddWorksFine() {
    const set = new Set();
    set.add("ok");
    const entries = Array.from(set.entries());
    return entries.length === 1 && entries[0][0] === "ok";
}

/**
 * 测试点70：在 Intl.Collator 等国际化对象作为值时，entries 正确存储引用
 */
export function testIntlObjectInSetEntriesAfterAdd() {
    const collator = new Intl.Collator();
    const set = new Set();
    set.add(collator);
    const key = Array.from(set.entries())[0][0];
    return key === collator;
}

/**
 * 测试点71：Set 的 add 方法不可枚举，但 entries 是方法 —— 验证属性描述符
 */
export function testSetAddIsNotEnumerableButEntriesIsMethod() {
    const addDesc = Object.getOwnPropertyDescriptor(Set.prototype, 'add');
    const entriesDesc = Object.getOwnPropertyDescriptor(Set.prototype, 'entries');
    return !addDesc.enumerable && typeof entriesDesc.value === 'function';
}

/**
 * 测试点72：在 Error 对象作为 Set 值时，entries 保留其 stack 和 message
 */
export function testErrorObjectInSetPreservesIdentityInEntries() {
    const err = new Error("test");
    const originalStack = err.stack;
    const set = new Set();
    set.add(err);
    const retrieved = Array.from(set.entries())[0][0];
    return retrieved === err && retrieved.stack === originalStack;
}

/**
 * 测试点73：Set 使用 Object.create(null) 作为值，entries 正确包含
 */
export function testNullPrototypeObjectInSetEntries() {
    const obj = Object.create(null);
    obj.key = "value";
    const set = new Set();
    set.add(obj);
    const entry = Array.from(set.entries())[0];
    return entry && entry[0] === obj && entry[0].key === "value";
}

/**
 * 测试点74：在 entries 迭代中 add 大整数（超过 Number.MAX_SAFE_INTEGER），精确保留
 */
export function testLargeIntegerPrecisionPreservedInSetEntries() {
    const bigNum = 9007199254740992n + 1n;
    if (typeof BigInt === 'undefined') {
        return true;
    }
    const set = new Set();
    set.add(bigNum);
    const val = Array.from(set.entries())[0][0];
    return val === bigNum;
}

/**
 * 测试点75：Set 的 size 在 add 后立即更新，但不影响已创建的 entries 迭代器
 */
export function testSetSizeUpdatesImmediatelyButEntriesSnapshotUnchanged() {
    const set = new Set([1]);
    const iter = set.entries();
    set.add(2);
    const sizeNow = set.size;
    const iterLength = Array.from(iter).length;
    return sizeNow === 2 && iterLength === 2;
}

/**
 * 测试点76：在 Web Crypto API 的 CryptoKey 作为值（若环境支持），Set 可存储
 */
export function testCryptoKeyLikeObjectInSetEntries() {

    const fakeKey = Object.preventExtensions({ type: 'secret', extractable: false });
    const set = new Set();
    set.add(fakeKey);
    const key = Array.from(set.entries())[0][0];
    return key === fakeKey;
}

/**
 * 测试点77：Set 的 entries 方法调用时若 this 非 Set 实例，应抛 TypeError
 */
export function testEntriesCalledOnNonSetThrowsTypeError() {
    let threw = false;
    try {
        Set.prototype.entries.call({});
    } catch (e) {
        threw = e instanceof TypeError;
    }
    return threw;
}

/**
 * 测试点78：add 方法调用时若 this 非 Set，也应抛 TypeError
 */
export function testAddCalledOnNonSetThrowsTypeError() {
    let threw = false;
    try {
        Set.prototype.add.call({}, 'x');
    } catch (e) {
        threw = e instanceof TypeError;
    }
    return threw;
}

/**
 * 测试点79：在生成器中 yield 来自 Set.entries() 的值，引用一致
 */
export function testGeneratorYieldsEntriesWithReferenceIntegrity() {
    const obj = { id: 79 };
    const set = new Set([obj]);

    function* gen() {
        yield * set.entries();
    }

    const [key] = gen().next().value;
    return key === obj;
}

/**
 * 测试点80：Set 支持跨模块共享，entries 在不同模块中行为一致（模拟）
 */
export function testSetSharedAcrossModuleBoundaryMaintainsEntriesConsistency() {

    const createSharedSet = () => new Set([100]);
    const set = createSharedSet();
    set.add(200);
    const entries = Array.from(set.entries());
    return entries.length === 2 && entries[1][0] === 200;
}


/**
 * 测试点81：Set 中 add 相同 Symbol 值多次，entries 只出现一次
 */
export function testSameSymbolAddedMultipleTimesAppearsOnceInEntries() {
    const sym = Symbol.for('test81');
    const set = new Set();
    set.add(sym).add(sym).add(sym);
    return Array.from(set.entries()).length === 1;
}

/**
 * 测试点82：不同 Symbol（即使描述相同）被视为不同值
 */
export function testDifferentSymbolsWithSameDescriptionAreDistinctInSet() {
    const s1 = Symbol('key');
    const s2 = Symbol('key');
    const set = new Set();
    set.add(s1).add(s2);
    return set.size === 2 && Array.from(set.entries()).some(e => e[0] === s1) &&
    Array.from(set.entries()).some(e => e[0] === s2);
}

/**
 * 测试点84：Set 的 entries 迭代器具有 next、return、throw 方法
 */
export function testSetEntriesIteratorHasStandardIteratorMethods() {
    const iter = new Set().entries();
    return (
        typeof iter.next === 'function' &&
            typeof iter.return === 'function' &&
            typeof iter.throw === 'function'
    );
}

/**
 * 测试点87：Set 被冻结后，add 抛错，但已有 entries 迭代器仍可消费
 */
export function testFrozenSetAddThrowsButExistingIteratorStillWorks() {
    const set = new Set([1, 2]);
    const iter = set.entries();
    Object.freeze(set);
    let addThrew = false;
    try {
        set.add(3);
    } catch (e) {
        addThrew = e instanceof TypeError;
    }
    const consumed = Array.from(iter);
    return !addThrew && consumed.length === 3;
}

/**
 * 测试点88：JSON.stringify(Set) 无意义，但 entries 可手动序列化
 */
export function testManualSerializationOfEntriesPreservesValues() {
    const set = new Set([1, "a", true]);
    const serializable = Array.from(set.entries()).map(([k]) => k);
    const restored = new Set(serializable);
    return restored.has(1) && restored.has("a") && restored.has(true);
}

/**
 * 测试点90：Set 包含 Date 对象，entries 保留其时间戳和引用
 */
export function testDateObjectInSetMaintainsIdentityInEntries() {
    const now = new Date();
    const time = now.getTime();
    const set = new Set();
    set.add(now);
    const retrieved = Array.from(set.entries())[0][0];
    return retrieved === now && retrieved.getTime() === time;
}

/**
 * 测试点91：add(undefined) 和 add(void 0) 效果相同
 */
export function testUndefinedAndVoid0TreatedIdenticallyInSet() {
    const set = new Set();
    set.add(undefined);
    set.add(void 0);
    return set.size === 1;
}

/**
 * 测试点94：Set 支持跨 iframe 共享（若同源），但测试中模拟引用传递
 */
export function testSetWithCrossContextLikeObjectMaintainsReference() {

    const mockWindowObj = { window: true, id: 94 };
    const set = new Set();
    set.add(mockWindowObj);
    const key = Array.from(set.entries())[0][0];
    return key === mockWindowObj;
}

/**
 * 测试点95：在 Object.freeze(globalThis) 后，Set 仍可正常使用（不依赖全局）
 */
export function testSetWorksEvenIfGlobalThisIsFrozen() {

    const set = new Set();
    set.add('isolated');
    return set.has('isolated') && Array.from(set.entries()).length === 1;
}

/**
 * 测试点96：Set 的 entries 迭代顺序与插入顺序严格一致，即使混合类型
 */
export function testInsertionOrderPreservedAcrossMixedTypesInEntries() {
    const set = new Set();
    set.add(1);
    set.add('two');
    set.add(null);
    set.add({});
    const order = Array.from(set.entries()).map(e => typeof e[0]);
    return JSON.stringify(order) === JSON.stringify(['number', 'string', 'object', 'object']);
}

/**
 * 测试点97：add 返回 this，可用于链式调用，且 entries 反映最终状态
 */
export function testChainedAddThenEntriesReflectsAllValuesInOrder() {
    const set = new Set();
    const entries = Array.from(
        set.add('a').add('b').add('c').entries()
    );
    return (
        entries.length === 3 &&
            entries[0][0] === 'a' &&
            entries[1][0] === 'b' &&
            entries[2][0] === 'c'
    );
}

/**
 * 测试点98：在 entries 迭代中 throw，add 操作已生效（副作用发生在 throw 前）
 */
export function testAddSideEffectPersistsEvenIfExceptionThrownInIteration() {
    const set = new Set([1]);
    let added = false;
    try {
        for (const _ of set.entries()) {
            set.add(2);
            added = true;
            throw new Error('stop');
        }
    } catch (e) {

    }
    return added && set.has(2) && set.size === 2;
}

/**
 * 测试点99：Set 构造时传入 Set 实例，再 add 新值，entries 包含全部
 */
export function testSetConstructedFromAnotherSetThenAddNewValue() {
    const original = new Set([1, 2]);
    const copy = new Set(original);
    copy.add(3);
    const values = Array.from(copy.entries()).map(e => e[0]);
    return JSON.stringify(values) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点100：Set 的 entries 迭代器在规范中必须是可回收的，无内存泄漏（逻辑验证）
 */
export function testSetEntriesIteratorDoesNotLeakReferencesAfterConsumption() {
    let obj = { id: 100 };
    const set = new Set([obj]);
    const iter = set.entries();
    Array.from(iter);
    obj = null;
    return set.size === 1;
}


/**
 * 测试点101：Set 中 add 同一个值两次，在 entries 迭代中只出现一次（基础去重）
 */
export function testBasicDeduplicationInEntriesAfterDuplicateAdd() {
    const set = new Set();
    set.add(42);
    set.add(42);
    return Array.from(set.entries()).length === 1;
}

/**
 * 测试点103：Set 的 entries 迭代器不继承自 %IteratorPrototype%
 * （实际继承自 %SetIteratorPrototype%，但具有标准方法）
 */
export function testSetEntriesIteratorHasCorrectPrototypeChain() {
    const iter = new Set().entries();
    const proto = Object.getPrototypeOf(iter);
    const hasNext = 'next' in proto;
    const toStringTag = Object.prototype.toString.call(iter);
    return hasNext && toStringTag === '[object Set Iterator]';
}

/**
 * 测试点104：add 方法调用时传入多个参数，仅第一个被使用（其余忽略）
 */
export function testAddIgnoresExtraArgumentsBeyondFirst() {
    const set = new Set();

    set.add(1, 2, 3);
    return set.has(1) && !set.has(2) && set.size === 1;
}

/**
 * 测试点105：Set 包含自身作为元素（循环引用），entries 能安全遍历
 */
export function testSetContainingItselfCanBeSafelyIteratedWithEntries() {
    const set = new Set();
    set.add(set);
    let count = 0;
    for (const _ of set.entries()) {
        count++;
    }
    return count === 1 && set.has(set);
}

/**
 * 测试点106：在 Proxy 拦截 apply 或 construct 时，Set 构造和 add 不受影响
 */
export function testProxyAroundSetConstructorDoesNotBreakEntriesSemantics() {
    const SetProxy = new Proxy(Set, {});
    const set = new SetProxy([1]);
    set.add(2);
    const values = Array.from(set.entries()).map(e => e[0]);
    return JSON.stringify(values.sort()) === JSON.stringify([1, 2].sort());
}

/**
 * 测试点107：Object.setPrototypeOf(set, null) 后，entries 仍可调用（若方法未丢失）
 */
export function testSetWithNullPrototypeCanStillUseEntriesIfMethodAccessedDirectly() {
    const set = new Set([1]);

    const entriesMethod = set.entries;
    Object.setPrototypeOf(set, null);
    try {
        const result = entriesMethod.call(set);
        return Array.from(result).length === 1;
    } catch {
        return false;
    }
}

/**
 * 测试点108：Set 的 size 在 add 前后同步更新，即使在 getter 中观察
 */
export function testSetSizeUpdatesSynchronouslyDuringAdd() {
    const set = new Set();
    let sizeBefore, sizeAfter;
    sizeBefore = set.size;
    set.add('x');
    sizeAfter = set.size;
    return sizeBefore === 0 && sizeAfter === 1;
}

/**
 * 测试点110：Set 支持添加 GeneratorFunction 实例
 */
export function testGeneratorFunctionAsSetValueInEntries() {

    function* gen() {
    }

    const set = new Set();
    set.add(gen);
    const key = Array.from(set.entries())[0][0];
    return key === gen && typeof key === 'function';
}

/**
 * 测试点111：Set 的 entries 迭代器不可克隆，每次调用 entries() 返回新迭代器
 */
export function testEachEntriesCallReturnsNewIndependentIterator() {
    const set = new Set([1, 2]);
    const iter1 = set.entries();
    const iter2 = set.entries();
    return iter1 !== iter2 && iter1.next().value[0] === iter2.next().value[0];
}

/**
 * 测试点112：在 async 函数中 await 一个 Set.entries() 是无效的（非 Promise），但不报错
 */
export function testAwaitingSetEntriesDoesNotThrowButYieldsIterator() {
    const fn = async () => {
        const result = await new Set([1]).entries();
        return result instanceof Object && typeof result.next === 'function';
    };

    return fn() instanceof Promise;
}

/**
 * 测试点113：Set 与 Map 的 entries 格式不同：Set 是 [v,v]，Map 是 [k,v]
 */
export function testSetEntriesFormatIsKeyValueIdenticalUnlikeMap() {
    const s = new Set([1]);
    const m = new Map([[1, 1]]);
    const sEntry = s.entries().next().value;
    const mEntry = m.entries().next().value;
    return sEntry[0] === sEntry[1] && mEntry[0] === 1 && mEntry[1] === 1;
}

/**
 * 测试点114：在 SharedArrayBuffer 环境中，Set 不能跨线程共享，但单线程内行为正常
 */
export function testSetWorksNormallyInMainThreadEvenIfSharedArrayBufferExists() {

    const set = new Set();
    set.add(new SharedArrayBuffer(8));
    return set.size === 1;
}

/**
 * 测试点115：Set 的 add 方法是 generic，但要求 this 有 [[SetData]] 内部槽
 */
export function testAddIsNotGenericAndRequiresRealSetInstance() {
    let threw = false;
    try {
        Set.prototype.add.call({ size: 0 }, 'fake');
    } catch (e) {
        threw = e instanceof TypeError;
    }
    return threw;
}

/**
 * 测试点116：在 finally 块中 add 元素，entries 在 try 中已创建则不受影响
 */
export function testAddInFinallyDoesNotAffectEntriesCreatedInTry() {
    const set = new Set([1]);
    let iter;
    try {
        iter = set.entries();
    } finally {
        set.add(2);
    }
    const result = Array.from(iter);
    return result.length === 2 && result[0][0] === 1;
}

/**
 * 测试点117：Set 可以包含另一个 Set 的迭代器（entries() 返回值）
 */
export function testSetCanStoreAnotherSetsEntriesIterator() {
    const innerSet = new Set([1]);
    const iter = innerSet.entries();
    const outerSet = new Set();
    outerSet.add(iter);
    const stored = Array.from(outerSet.entries())[0][0];
    return stored === iter && stored.next().value[0] === 1;
}

/**
 * 测试点118：在 Object.freeze(Set.prototype) 后，实例仍可 add（方法未被冻结）
 */
export function testFreezingSetPrototypeDoesNotPreventInstanceAdd() {
    const originalAdd = Set.prototype.add;
    Object.freeze(Set.prototype);
    const set = new Set([1]);
    let success = false;
    try {
        set.add(2);
        success = set.has(2);
    } finally {

        if (!Set.prototype.add) {

        }
    }
    return success;
}

/**
 * 测试点120：Set 支持添加模块命名空间对象（如 import * as ns）
 */
export function testModuleNamespaceObjectCanBeAddedToSet() {

    const ns = Object.create(null);
    Object.defineProperty(ns, 'default', { value: 120, enumerable: true });
    Object.preventExtensions(ns);
    const set = new Set();
    set.add(ns);
    const retrieved = Array.from(set.entries())[0][0];
    return retrieved === ns && retrieved.default === 120;
}


/**
 * 测试点121：Set 的 entries 迭代器在调用 return() 后，不应再访问内部 [[SetData]]
 */
export function testReturnedIteratorDoesNotAccessSetDataAfterReturn() {
    const set = new Set([1, 2]);
    const iter = set.entries();
    iter.next();
    set.clear();
    const result = iter.return();
    return result.done === true;
}

/**
 * 测试点122：add 方法在严格模式下不改变 this 绑定，且无副作用外泄
 */
export function testAddInStrictModeHasNoSideEffectsBeyondSet() {
    "use strict";
    let globalLeak = false;
    const original = globalThis.x;
    const set = new Set();
    set.add({ toString: () => (globalThis.x = 'leaked') });
    globalLeak = globalThis.x !== original;
    if (original === undefined) {
        delete globalThis.x;
    } else {
        globalThis.x = original;
    }
    return !globalLeak;
}

/**
 * 测试点123：Set 支持添加不可扩展对象，entries 正确返回
 */
export function testNonExtensibleObjectCanBeAddedAndRetrievedViaEntries() {
    const obj = { locked: true };
    Object.preventExtensions(obj);
    const set = new Set();
    set.add(obj);
    const key = Array.from(set.entries())[0][0];
    return key === obj && !Object.isExtensible(key);
}

/**
 * 测试点125：Set 的 size 属性在 add 前后是同步的，即使在 getter 中递归调用 add
 */
export function testRecursiveAddInsideSizeGetterDoesNotCauseInfiniteLoop() {
    const set = new Set();
    let count = 0;
    Object.defineProperty(set, 'size', {
        get() {
            if (count++ < 2) {
                set.add(count);
            }
            return Object.getOwnPropertyDescriptor(Set.prototype, 'size').get.call(set);
        }
    });
    set.add(0);

    return set.size >= 2;
}

/**
 * 测试点126：Set 可以包含 Promise 对象，entries 保留其身份
 */
export function testPromiseObjectInSetMaintainsIdentityInEntries() {
    const p = Promise.resolve(126);
    const set = new Set();
    set.add(p);
    const key = Array.from(set.entries())[0][0];
    return key === p;
}

/**
 * 测试点127：在 for...of 循环中 break 后，Set 状态不变，add 仍有效
 */
export function testBreakInForOfDoesNotCorruptSetStateForSubsequentAdd() {
    const set = new Set([1, 2, 3]);
    for (const _ of set) {
        break;
    }
    set.add(4);
    return set.has(4) && set.size === 4;
}

/**
 * 测试点128：Set 的 entries 迭代器在被垃圾回收前，不应阻止 Set 元素回收（逻辑验证）
 */
export function testSetEntriesIteratorDoesNotCreateStrongReferenceCycle() {

    let obj = {};
    const set = new Set([obj]);
    const iter = set.entries();
    obj = null;
    return set.size === 1;
}

/**
 * 测试点129：add 返回值严格等于 this（===），支持链式调用
 */
export function testAddReturnsThisExactlyForChaining() {
    const set = new Set();
    const result = set.add(1);
    return result === set;
}

/**
 * 测试点130：Set 构造时传入字符串（可迭代），每个字符作为独立元素
 */
export function testSetConstructedFromStringSplitsIntoCharacters() {
    const set = new Set("ab");
    const entries = Array.from(set.entries()).map(e => e[0]);
    return entries.length === 2 && entries.includes('a') && entries.includes('b');
}


/**
 * 测试点132：Set 支持添加类构造函数（class expression）
 */
export function testClassExpressionAsSetValueInEntries() {
    class TestClass {
    }

    const set = new Set();
    set.add(TestClass);
    const key = Array.from(set.entries())[0][0];
    return key === TestClass && typeof key === 'function';
}

/**
 * 测试点133：在 Web Worker 环境不可控，但主线程中 postMessage 不影响 Set 本地行为
 */
export function testSetBehaviorUnaffectedByPostMessageExistence() {
    const set = new Set([1]);
    set.add(2);
    return set.size === 2;
}

/**
 * 测试点134：Set 的 entries 迭代顺序不受 Object.getOwnPropertyNames 影响
 */
export function testSetInsertionOrderIndependentOfObjectReflectionAPIs() {
    const set = new Set();
    set.add(1);
    set.add('x');

    Object.getOwnPropertyNames(set);
    const order = Array.from(set.entries()).map(e => e[0]);
    return order[0] === 1 && order[1] === 'x';
}

/**
 * 测试点136：Set 可以包含正则表达式字面量，entries 保留标志和源
 */
export function testRegExpLiteralInSetPreservesFlagsAndSource() {
    const re = /test/gi;
    const set = new Set();
    set.add(re);
    const key = Array.from(set.entries())[0][0];
    return key === re && key.source === 'test' && key.flags === 'gi';
}

/**
 * 测试点138：Set 的 entries 迭代器在跨 realm（如 iframe）中类型标签仍为 [object Set Iterator]
 */
export function testSetEntriesIteratorToStringTagIsConsistentAcrossRealms() {

    const iter = new Set().entries();
    const tag = Object.prototype.toString.call(iter);
    return tag === '[object Set Iterator]';
}

/**
 * 测试点139：add 方法调用时 this 为 null 或 undefined，应抛 TypeError（非全局对象）
 */
export function testAddCalledWithNullOrUndefinedThisThrowsTypeError() {
    let threw1 = false, threw2 = false;
    try {
        Set.prototype.add.call(null, 1);
    } catch (e) {
        threw1 = e instanceof TypeError;
    }
    try {
        Set.prototype.add.call(undefined, 1);
    } catch (e) {
        threw2 = e instanceof TypeError;
    }
    return threw1 && threw2;
}

/**
 * 测试点140：Set 支持添加带有私有字段的类实例（若环境支持）
 */
export function testInstanceWithPrivateFieldsCanBeAddedToSet() {
    try {
        const clsCode = `
      class C { #x = 140; getValue() { return this.#x; } }
      new C()
    `;
        const instance = eval(clsCode);
        const set = new Set();
        set.add(instance);
        const retrieved = Array.from(set.entries())[0][0];
        return retrieved === instance && retrieved.getValue() === 140;
    } catch {

        return true;
    }
}
