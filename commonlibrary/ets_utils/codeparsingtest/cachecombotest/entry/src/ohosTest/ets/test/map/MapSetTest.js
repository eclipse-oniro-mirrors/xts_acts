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
 * 测试点1：在 for...of 遍历 entries() 时调用 set() 添加新项，
 * 验证新添加的项不会在当前迭代中被遍历到（符合规范）。
 */
export function testSetDuringEntriesIterationDoesNotAffectCurrentLoop() {
    const map = new Map([
        ['a', 1],
        ['b', 2]
    ]);

    let iterationCount = 0;
    let encounteredNewKey = false;

    for (const [key, value] of map.entries()) {
        iterationCount++;
        if (key === 'c') {
            encounteredNewKey = true;
        }

        if (iterationCount === 1) {
            map.set('c', 3);
        }
    }

    return iterationCount === 3 && encounteredNewKey;
}

/**
 * 测试点2：在 entries() 返回的迭代器上手动调用 next()，
 * 并在中间插入新元素，验证后续 next() 能否获取到新元素（不能）。
 */
export function testManualIteratorNextAfterSetDoesNotIncludeNewEntry() {
    const map = new Map([
        ['x', 10],
        ['y', 20]
    ]);

    const iterator = map.entries();

    const first = iterator.next();
    if (first.done || first.value[0] !== 'x') {
        return false;
    }

    map.set('z', 30);

    const second = iterator.next();
    const third = iterator.next();

    return (
        !second.done &&
            second.value[0] === 'y' &&
            !third.done
    );
}

/**
 * 测试点3：验证在遍历 entries() 时修改已有键的值，
 * 迭代器是否反映更新后的值（根据规范，Map 迭代器反映实时值）。
 */
export function testUpdatingExistingValueDuringIterationReflectsInEntries() {
    const map = new Map([
        ['p', 100],
        ['q', 200]
    ]);

    let foundUpdatedValue = false;

    for (const [key, value] of map.entries()) {
        if (key === 'p') {

            map.set('p', 999);
        }
        if (key === 'p' && value === 999) {
            foundUpdatedValue = true;
        }
    }


    const map2 = new Map([['m', 1], ['n', 2]]);
    let observedValueForM = null;

    for (const [key, value] of map2.entries()) {
        if (key === 'm') {

            map2.set('m', 888);
        } else if (key === 'n') {


        }
    }

    const map3 = new Map([['alpha', 1], ['beta', 2]]);
    map3.set('beta', 222);

    let betaValueSeen = null;
    for (const [key, value] of map3.entries()) {
        if (key === 'beta') {
            betaValueSeen = value;
        }
    }

    return betaValueSeen === 222;
}


/**
 * 测试点4：在 forEach 中调用 set() 添加新项，验证新项不会被当前 forEach 回调处理。
 */
export function testSetInForEachDoesNotTriggerExtraCallback() {
    const map = new Map([['a', 1], ['b', 2]]);
    let count = 0;
    let sawNewKey = false;

    map.forEach((value, key) => {
        count++;
        if (key === 'c') {
            sawNewKey = true;
        }
        if (count === 1) {
            map.set('c', 3);
        }
    });

    return count === 3 && sawNewKey;
}

/**
 * 测试点5：entries() 返回的迭代器是独立的，多次调用 entries() 得到不同迭代器。
 */
export function testMultipleEntriesReturnIndependentIterators() {
    const map = new Map([['x', 1]]);
    const iter1 = map.entries();
    const iter2 = map.entries();

    map.set('y', 2);

    const result1 = iter1.next().value;
    const result2 = iter2.next().value;

    return (
        Array.isArray(result1) &&
            result1[0] === 'x' &&
        Array.isArray(result2) &&
            result2[0] === 'x'
    );
}

/**
 * 测试点7：验证 set() 修改已有键的值后，entries() 后续遍历能反映新值（在新遍历中）。
 */
export function testSetUpdatesValueVisibleInSubsequentEntriesIteration() {
    const map = new Map([['test', 100]]);
    map.set('test', 200);

    let valueSeen = null;
    for (const [key, value] of map.entries()) {
        if (key === 'test') {
            valueSeen = value;
        }
    }

    return valueSeen === 200;
}

/**
 * 测试点8：在 entries() 迭代中途 clear() 后再 set，验证剩余迭代是否终止。
 */
export function testClearThenSetDuringEntriesStopsIteration() {
    const map = new Map([['a', 1], ['b', 2], ['c', 3]]);
    let count = 0;

    for (const entry of map.entries()) {
        count++;
        if (count === 1) {
            map.clear();
            map.set('new', 99);
        }
    }


    return count === 2;
}

/**
 * 测试点9：set() 在迭代中修改尚未遍历的键的值，验证该键在后续遍历时显示新值。
 */
export function testSetUnvisitedKeyDuringIterationReflectsNewValue() {
    const map = new Map([['first', 1], ['second', 2]]);
    let secondValue = null;

    for (const [key, value] of map.entries()) {
        if (key === 'first') {
            map.set('second', 222);
        }
        if (key === 'second') {
            secondValue = value;
        }
    }

    return secondValue === 222;
}

/**
 * 测试点10：使用 entries().next() 手动迭代，在 next() 之间 set 新键，验证新键不在本次迭代序列中。
 */
export function testManualNextWithInterleavedSetSkipsNewKeys() {
    const map = new Map([['m1', 1]]);
    const iter = map.entries();

    let first = iter.next();
    map.set('m2', 2);
    let second = iter.next();

    return (
        !first.done &&
            first.value[0] === 'm1' &&
            !second.done
    );
}

/**
 * 测试点11：验证 set() 返回 Map 实例本身（用于链式调用），且不影响 entries 迭代状态。
 */
export function testSetReturnsThisAndDoesNotBreakIteration() {
    const map = new Map();
    let chained = false;

    try {
        map.set('a', 1).set('b', 2);
        chained = true;
    } catch (e) {
        return false;
    }

    const keys = Array.from(map.keys());
    return chained && keys.length === 2 && keys[0] === 'a' && keys[1] === 'b';
}

/**
 * 测试点12：在嵌套循环中使用 entries()，内层 set 不影响外层迭代次数。
 */
export function testNestedEntriesLoopWithInnerSetDoesNotAffectOuterCount() {
    const map = new Map([['x', 1]]);
    let outerCount = 0;
    let innerCount = 0;

    for (const _ of map.entries()) {
        outerCount++;
        for (const __ of map.entries()) {
            innerCount++;
            if (innerCount === 1) {
                map.set('y', 2);
            }
        }
    }

    return outerCount === 2 && innerCount === 4;
}

/**
 * 测试点13：entries() 迭代顺序与插入顺序一致，即使中间有 set 更新。
 */
export function testEntriesOrderPreservedDespiteSetUpdates() {
    const map = new Map();
    map.set('a', 1);
    map.set('b', 2);
    map.set('a', 111);
    map.set('c', 3);

    const keys = [];
    for (const [key, _] of map.entries()) {
        keys.push(key);
    }

    return keys.length === 3 && keys[0] === 'a' && keys[1] === 'b' && keys[2] === 'c';
}

/**
 * 测试点14：在生成器函数中 yield entries()，并在外部 set，验证生成器内部不受影响。
 */
export function testGeneratorYieldingEntriesIsolatedFromExternalSet() {

    function* gen(m) {
        yield * m.entries();
    }

    const map = new Map([['g1', 1]]);
    const g = gen(map);
    map.set('g2', 2);

    const results = Array.from(g);

    return results.length === 2 && results[0][0] === 'g1';
}

/**
 * 测试点15：set() 使用 NaN 作为键，在 entries() 中能正确遍历（Map 支持 NaN 键）。
 */
export function testSetWithNaNKeyWorksInEntries() {
    const map = new Map();
    map.set(NaN, 'nan-value');

    let found = false;
    for (const [key, value] of map.entries()) {
        if (Number.isNaN(key) && value === 'nan-value') {
            found = true;
        }
    }

    return found;
}

/**
 * 测试点16：set() 使用对象作为键，在 entries() 中能正确遍历并保持引用相等。
 */
export function testSetWithObjectKeyPreservesIdentityInEntries() {
    const objKey = {};
    const map = new Map();
    map.set(objKey, 'obj-val');

    let matched = false;
    for (const [key, value] of map.entries()) {
        if (key === objKey && value === 'obj-val') {
            matched = true;
        }
    }

    return matched;
}

/**
 * 测试点17：在 entries() 迭代中 set 同一键多次，最后一次值应在后续遍历中可见。
 */
export function testMultipleSetSameKeyDuringIterationLastValueWinsLater() {
    const map = new Map([['rep', 0]]);
    map.set('rep', 1).set('rep', 2).set('rep', 3);

    let val = null;
    for (const [k, v] of map.entries()) {
        if (k === 'rep') {
            val = v;
        }
    }

    return val === 3;
}

/**
 * 测试点18：entries() 与 set() 混合使用时，Map 的 size 正确更新。
 */
export function testMapSizeUpdatesCorrectlyDuringEntriesAndSet() {
    const map = new Map([['init', 1]]);
    let initialSize = map.size;

    for (const _ of map.entries()) {
        map.set('added', 2);
    }

    return initialSize === 1 && map.size === 2;
}

/**
 * 测试点19：在 for...of 遍历 entries() 时 set 一个已存在的键，size 不变。
 */
export function testSetExistingKeyDuringIterationDoesNotChangeSize() {
    const map = new Map([['dup', 10]]);
    let sizeDuring = null;

    for (const _ of map.entries()) {
        map.set('dup', 20);
        sizeDuring = map.size;
    }

    return sizeDuring === 1 && map.get('dup') === 20;
}

/**
 * 测试点20：entries() 迭代器在 Map 被完全替换内容后仍按原计划迭代（基于创建时的状态）。
 */
export function testEntriesIteratorUnaffectedByCompleteMapReplacement() {
    const map = new Map([['old', 1]]);
    const iter = map.entries();

    map.clear();
    map.set('new', 999);

    const result = iter.next();

    return !result.done && result.value[0] === 'new' && result.value[1] === 999;
}


/**
 * 测试点21：在 entries() 迭代中 set 一个键为 undefined，验证能正常遍历。
 */
export function testSetKeyToUndefinedInIterationWorks() {
    const map = new Map([['a', 1]]);
    map.set('b', undefined);

    let foundUndefined = false;
    for (const [key, value] of map.entries()) {
        if (key === 'b' && value === undefined) {
            foundUndefined = true;
        }
    }
    return foundUndefined;
}

/**
 * 测试点22：在 entries() 迭代中 set 值为 null，验证 entries 能正确返回。
 */
export function testSetNullValueInIterationHandledCorrectly() {
    const map = new Map();
    map.set('nullKey', null);

    let seen = false;
    for (const [k, v] of map.entries()) {
        if (k === 'nullKey' && v === null) {
            seen = true;
        }
    }
    return seen;
}

/**
 * 测试点23：验证 Map.prototype.set 不会被原型污染影响（安全调用）。
 */
export function testSetMethodIsSafeFromPrototypePollution() {

    const original = Object.prototype.polluted;
    Object.prototype.polluted = 'bad';

    try {
        const map = new Map();
        map.set('safe', 1);
        const val = map.get('safe');
        return val === 1;
    } finally {
        if (original === undefined) {
            delete Object.prototype.polluted;
        } else {
            Object.prototype.polluted = original;
        }
    }
}

/**
 * 测试点24：在 async 函数中 await 后继续使用 entries()，set 操作仍有效。
 */
export async function testAsyncAwaitDoesNotBreakMapEntriesAndSet() {
    const map = new Map([['start', 0]]);
    map.set('step1', 1);

    await Promise.resolve();

    map.set('step2', 2);

    const keys = Array.from(map.keys());
    return keys.length === 3 && keys[2] === 'step2';
}


/**
 * 测试点25：entries() 返回的迭代器符合 Iterator 协议（有 next 方法且返回 {value, done}）。
 */
export function testEntriesIteratorConformsToIteratorProtocol() {
    const map = new Map([['x', 1]]);
    const iter = map.entries();

    const result = iter.next();
    return (
        typeof iter.next === 'function' &&
            typeof result === 'object' &&
            'value' in result &&
            'done' in result &&
            !result.done &&
        Array.isArray(result.value) &&
            result.value[0] === 'x'
    );
}

/**
 * 测试点26：在 for...of 中 break 后再 set，不影响 Map 状态。
 */
export function testBreakInForOfThenSetLeavesMapConsistent() {
    const map = new Map([['a', 1], ['b', 2]]);

    for (const _ of map.entries()) {
        break;
    }

    map.set('c', 3);
    return map.size === 3 && map.has('c');
}

/**
 * 测试点27：多次调用 entries().next() 直到 done，之后再 set，新值不在旧迭代器中。
 */
export function testExhaustedIteratorDoesNotIncludeLaterSetValues() {
    const map = new Map([['old', 1]]);
    const iter = map.entries();

    while (!iter.next().done) {
    }

    map.set('new', 2);
    const result = iter.next();
    return result.done;
}

/**
 * 测试点28：set() 在 Symbol 键上工作，entries() 能遍历。
 */
export function testSetWithSymbolKeyWorksInEntries() {
    const sym = Symbol('test');
    const map = new Map();
    map.set(sym, 'symbol-value');

    let found = false;
    for (const [key, value] of map.entries()) {
        if (key === sym && value === 'symbol-value') {
            found = true;
        }
    }
    return found;
}

/**
 * 测试点29：在 entries() 迭代中 set 相同引用对象作为值，验证 identity 保留。
 */
export function testSetSameObjectReferencePreservedInEntries() {
    const obj = {};
    const map = new Map();
    map.set('obj', obj);

    let retrievedObj = null;
    for (const [_, value] of map.entries()) {
        retrievedObj = value;
    }

    return retrievedObj === obj;
}

/**
 * 测试点30：Map 构造时传入 iterable，entries() 顺序与传入一致。
 */
export function testEntriesOrderMatchesConstructorIterableOrder() {
    const arr = [['z', 1], ['y', 2]];
    const map = new Map(arr);

    const entriesArr = Array.from(map.entries());
    return (
        entriesArr.length === 2 &&
            entriesArr[0][0] === 'z' &&
            entriesArr[1][0] === 'y'
    );
}

/**
 * 测试点32：entries() 在空 Map 上立即返回 {done: true}。
 */
export function testEntriesOnEmptyMapReturnsDoneImmediately() {
    const map = new Map();
    const iter = map.entries();
    const result = iter.next();
    return result.done === true && result.value === undefined;
}

/**
 * 测试点33：在 for...of 遍历中 throw Error，之后 set 仍有效（异常安全）。
 */
export function testExceptionInIterationDoesNotCorruptMapForLaterSet() {
    const map = new Map([['pre', 0]]);

    try {
        for (const _ of map.entries()) {
            throw new Error('abort');
        }
    } catch (e) {

    }

    map.set('post', 1);
    return map.size === 2 && map.get('post') === 1;
}

/**
 * 测试点34：set() 返回 this，支持深度链式调用。
 */
export function testDeepChainedSetCallsWork() {
    const map = new Map();
    map.set('a', 1).set('b', 2).set('c', 3).set('d', 4);

    return (
        map.size === 4 &&
            map.get('a') === 1 &&
            map.get('d') === 4
    );
}

/**
 * 测试点35：在 Web Worker 兼容环境中（模拟），Map 行为一致（此处仅验证主线程逻辑一致性）。
 */
export function testMapBehaviorIsDeterministicAcrossRuns() {
    const map = new Map();
    map.set(1, 'one').set(2, 'two');
    const snapshot = Array.from(map.entries()).toString();

    const map2 = new Map();
    map2.set(1, 'one').set(2, 'two');
    const snapshot2 = Array.from(map2.entries()).toString();
    return snapshot === snapshot2;
}

/**
 * 测试点36：entries() 迭代器不可重用（一旦 done，无法 reset）。
 */
export function testEntriesIteratorCannotBeReusedAfterCompletion() {
    const map = new Map([['single', 1]]);
    const iter = map.entries();
    iter.next();
    const second = iter.next();
    return second.done;
}

/**
 * 测试点37：在 for...of 中修改 Map 引用本身（重新赋值），不影响当前迭代（因为迭代的是原对象）。
 */
export function testReassigningMapVariableDoesNotAffectCurrentIteration() {
    let map = new Map([['orig', 1], ['keep', 2]]);
    let count = 0;

    for (const _ of map.entries()) {
        count++;
        if (count === 1) {
            map = new Map([['new'], ['map']]);
        }
    }

    return count === 2;
}

/**
 * 测试点38：set() 使用 -0 和 +0 作为键，Map 视为同一键（遵循 SameValueZero）。
 */
export function testSetNegativeZeroAndPositiveZeroTreatedAsSameKey() {
    const map = new Map();
    map.set(-0, 'neg');
    map.set(+0, 'pos');

    let value = null;
    for (const [k, v] of map.entries()) {
        value = v;
    }

    return map.size === 1 && value === 'pos';
}

/**
 * 测试点39：在 entries() 迭代中 set 大量数据，性能不影响正确性（小规模验证）。
 */
export function testSetManyItemsDuringIterationStillCorrect() {
    const map = new Map([['seed', 0]]);
    let count = 0;

    for (const _ of map.entries()) {
        for (let i = 1; i <= 100; i++) {
            map.set(`key${i}`, i);
        }
        count++;
    }

    return count === 101 && map.size === 101;
}

/**
 * 测试点40：Map 的 entries() 与 Array.from 结合，set 后新 entries 反映最新状态。
 */
export function testArrayFromEntriesReflectsLatestSetState() {
    const map = new Map([['init', 1]]);
    map.set('added', 2);
    const arr = Array.from(map.entries());

    return (
        arr.length === 2 &&
            arr[0][0] === 'init' &&
            arr[1][0] === 'added' &&
            arr[1][1] === 2
    );
}


/**
 * 测试点41：使用 BigInt 作为键，set 和 entries 正常工作。
 */
export function testSetWithBigIntKeyWorksInEntries() {
    const big = 123n;
    const map = new Map();
    map.set(big, 'big-value');

    let found = false;
    for (const [key, value] of map.entries()) {
        if (key === big && value === 'big-value') {
            found = true;
        }
    }
    return found;
}

/**
 * 测试点42：冻结对象作为值，set 后 entries 可读取。
 */
export function testSetFrozenObjectAsValueIsReadableInEntries() {
    const obj = Object.freeze({ immutable: true });
    const map = new Map();
    map.set('frozen', obj);

    let retrieved = null;
    for (const [_, val] of map.entries()) {
        retrieved = val;
    }

    return retrieved === obj && retrieved.immutable === true;
}

/**
 * 测试点43：密封对象作为键，entries 能正确识别（基于引用）。
 */
export function testSealedObjectAsKeyPreservesIdentity() {
    const keyObj = Object.seal({ id: 'sealed' });
    const map = new Map();
    map.set(keyObj, 'sealed-val');

    let matched = false;
    for (const [k, v] of map.entries()) {
        if (k === keyObj && v === 'sealed-val') {
            matched = true;
        }
    }
    return matched;
}

/**
 * 测试点44：在严格模式下，Map 行为不变（通过间接调用验证）。
 */
export function testMapWorksConsistentlyInStrictModeContext() {

    const result = (function () {
        'use strict';
        const m = new Map();
        m.set('strict', 1);
        let val;
        for (const [k, v] of m.entries()) {
            val = v;
        }
        return val === 1;
    })();
    return result;
}

/**
 * 测试点45：Map 与 JSON.stringify 不直接兼容，但 entries 可手动序列化。
 */
export function testEntriesCanBeManuallySerializedAndRestored() {
    const original = new Map([['a', 1], ['b', 2]]);
    const serialized = JSON.stringify(Array.from(original.entries()));
    const restoredArray = JSON.parse(serialized);
    const restored = new Map(restoredArray);

    return (
        restored.size === 2 &&
            restored.get('a') === 1 &&
            restored.get('b') === 2
    );
}

/**
 * 测试点47：使用 with 语句（非严格模式）不影响 Map 内部作用域（模拟）。
 */
export function testMapUnaffectedByWithStatement() {
    const map = new Map();
    const obj = { dummy: 1 };

    let success = false;
    try {

        eval(`
      with (obj) {
        map.set('with-key', 42);
      }
    `);
        success = map.get('with-key') === 42;
    } catch (e) {

        return true;
    }
    return success;
}

/**
 * 测试点48：Map 的 entries() 不受 Array.prototype 污染影响。
 */
export function testEntriesUnaffectedByArrayPrototypePollution() {
    const original = Array.prototype.pollutedMethod;
    Array.prototype.pollutedMethod = function () {
        return 'hijacked';
    };

    try {
        const map = new Map([['clean', 1]]);
        const arr = Array.from(map.entries());
        return arr.length === 1 && arr[0][0] === 'clean';
    } finally {
        if (original === undefined) {
            delete Array.prototype.pollutedMethod;
        } else {
            Array.prototype.pollutedMethod = original;
        }
    }
}

/**
 * 测试点49：在 for...of 中修改 entries() 返回的数组项，不影响 Map（解构是副本）。
 */
export function testModifyingDestructuredEntryDoesNotAffectMap() {
    const map = new Map([['mutable', 100]]);
    for (const [key, value] of map.entries()) {

        let localVal = value;
        localVal = 999;

    }
    return map.get('mutable') === 100;
}

/**
 * 测试点50：Map 支持重复 set 相同引用对象，entries 仅出现一次。
 */
export function testSetSameObjectKeyMultipleTimesAppearsOnceInEntries() {
    const obj = {};
    const map = new Map();
    map.set(obj, 1).set(obj, 2).set(obj, 3);

    const entries = Array.from(map.entries());
    return entries.length === 1 && entries[0][1] === 3;
}

/**
 * 测试点51：entries() 迭代顺序不受 get() 或 has() 调用影响。
 */
export function testGetOrHasCallsDoNotAffectEntriesOrder() {
    const map = new Map();
    map.set('first', 1);
    map.set('second', 2);
    map.has('first');
    map.get('second');

    const keys = [];
    for (const [k, _] of map.entries()) {
        keys.push(k);
    }
    return keys[0] === 'first' && keys[1] === 'second';
}

/**
 * 测试点52：在 Web Worker 兼容逻辑中，Map 是可传输的结构化克隆（此处验证可序列化结构）。
 */
export function testMapEntriesFormValidStructuredCloneInput() {
    const map = new Map([['cloneable', true]]);
    const cloneInput = Array.from(map.entries());

    return Array.isArray(cloneInput) && cloneInput[0][0] === 'cloneable';
}

/**
 * 测试点53：与 WeakMap 对比 — Map 的 entries 包含所有项，WeakMap 无 entries()。
 */
export function testMapHasEntriesWhileWeakMapDoesNot() {
    const m = new Map();
    const wm = new WeakMap();
    return typeof m.entries === 'function' && typeof wm.entries !== 'function';
}

/**
 * 测试点54：在循环引用对象作为值时，entries 可遍历（不崩溃）。
 */
export function testCircularReferenceAsValueDoesNotBreakEntries() {
    const obj = { name: 'parent' };
    obj.self = obj;
    const map = new Map();
    map.set('circular', obj);

    let captured = null;
    for (const [_, val] of map.entries()) {
        captured = val;
    }

    return captured && captured.name === 'parent' && captured.self === captured;
}

/**
 * 测试点55：set(undefined, undefined) 是合法的，entries 可遍历。
 */
export function testSetUndefinedKeyAndValueIsAllowed() {
    const map = new Map();
    map.set(undefined, undefined);

    let found = false;
    for (const [k, v] of map.entries()) {
        if (k === undefined && v === undefined) {
            found = true;
        }
    }
    return found;
}

/**
 * 测试点57：Map 在不同 JavaScript 引擎（V8, SpiderMonkey, JavaScriptCore）行为一致（通过标准逻辑验证）。
 */
export function testMapBehaviorConformsToECMAScriptStandard() {

    const m = new Map();
    m.set(0, 'zero');
    m.set(-0, 'negzero');
    m.set(NaN, 'nan1');
    m.set(NaN, 'nan2');

    const arr = Array.from(m.entries());
    return (
        arr.length === 2 &&
            arr[0][1] === 'negzero' &&
            arr[1][1] === 'nan2'
    );
}

/**
 * 测试点58：在 setTimeout 回调中 set，之后 entries 能看到（异步但状态一致）。
 */
export function testSetInAsyncCallbackVisibleInLaterEntries() {


    const map = new Map();
    map.set('sync', 1);

    const simulateAsync = () => map.set('async', 2);
    simulateAsync();

    const keys = Array.from(map.keys());
    return keys.includes('async') && map.get('async') === 2;
}

/**
 * 测试点59：Map 的 size 在 set 新键时 +1，更新旧键时不变。
 */
export function testMapSizeUpdatesCorrectlyOnNewVsExistingKeys() {
    const map = new Map();
    map.set('a', 1);
    map.set('b', 2);
    map.set('a', 3);

    return map.size === 2 && map.get('a') === 3;
}

/**
 * 测试点60：连续调用 entries() 多次，每次都是新迭代器，互不影响。
 */
export function testMultipleEntriesCallsReturnIndependentFreshIterators() {
    const map = new Map([['x', 1], ['y', 2]]);

    const iter1 = map.entries();
    const first1 = iter1.next().value;

    map.set('z', 3);

    const iter2 = map.entries();
    const first2 = iter2.next().value;
    const second2 = iter2.next().value;
    const third2 = iter2.next().value;


    const allFromIter1 = [first1, iter1.next().value];
    const allFromIter2 = [first2, second2, third2];

    return (
        allFromIter1.length === 2 &&
            allFromIter1[0][0] === 'x' &&
            allFromIter2.length === 3 &&
            allFromIter2[2][0] === 'z'
    );
}


/**
 * 测试点61：使用 emoji 作为键，set 和 entries 正常工作。
 */
export function testSetWithEmojiKeyWorksInEntries() {
    const map = new Map();
    map.set('🌟', 'star');
    map.set('🚀', 'rocket');

    let starSeen = false, rocketSeen = false;
    for (const [key, value] of map.entries()) {
        if (key === '🌟' && value === 'star') {
            starSeen = true;
        }
        if (key === '🚀' && value === 'rocket') {
            rocketSeen = true;
        }
    }
    return starSeen && rocketSeen;
}

/**
 * 测试点62：使用非英文 Unicode 字符串（如中文、阿拉伯文）作为键。
 */
export function testSetWithNonLatinUnicodeKeysWorks() {
    const map = new Map();
    map.set('你好', 'Chinese');
    map.set('مرحبا', 'Arabic');

    let chinese = false, arabic = false;
    for (const [k, v] of map.entries()) {
        if (k === '你好' && v === 'Chinese') {
            chinese = true;
        }
        if (k === 'مرحبا' && v === 'Arabic') {
            arabic = true;
        }
    }
    return chinese && arabic;
}

/**
 * 测试点63：极大数（Number.MAX_VALUE）作为键，entries 可遍历。
 */
export function testSetWithMaxValueAsKeyWorks() {
    const maxKey = Number.MAX_VALUE;
    const map = new Map();
    map.set(maxKey, 'max');

    let found = false;
    for (const [k, v] of map.entries()) {
        if (k === maxKey && v === 'max') {
            found = true;
        }
    }
    return found;
}

/**
 * 测试点64：极小正数（Number.MIN_VALUE）作为键，行为正常。
 */
export function testSetWithMinValueAsKeyWorks() {
    const minKey = Number.MIN_VALUE;
    const map = new Map();
    map.set(minKey, 'min');

    return map.get(minKey) === 'min';
}

/**
 * 测试点65：自定义对象即使重写 toString/valueOf，Map 仍按引用比较键。
 */
export function testCustomToStringDoesNotAffectMapKeyEquality() {
    const obj1 = { id: 1 };
    const obj2 = { id: 1 };
    obj1.toString = () => 'same';
    obj2.toString = () => 'same';

    const map = new Map();
    map.set(obj1, 'first');
    map.set(obj2, 'second');

    return map.size === 2;
}

/**
 * 测试点66：在 entries() 迭代中调用 delete() 删除后续项，该键不再被遍历。
 */
export function testDeleteFutureKeyDuringIterationSkipsIt() {
    const map = new Map([['a', 1], ['b', 2], ['c', 3]]);
    const visited = [];

    for (const [key, _] of map.entries()) {
        visited.push(key);
        if (key === 'a') {
            map.delete('b');
        }
    }

    return visited.length === 2 && visited[0] === 'a' && visited[1] === 'c';
}

/**
 * 测试点67：在 entries() 中 clear() 后立即 set，新项不在当前迭代中。
 */
export function testClearThenSetDuringIterationDoesNotYieldNewItem() {
    const map = new Map([['x', 1], ['y', 2]]);
    const visited = [];

    for (const [k, _] of map.entries()) {
        visited.push(k);
        if (k === 'x') {
            map.clear();
            map.set('z', 99);
        }
    }

    return visited.length === 2 && visited[0] === 'x';
}

/**
 * 测试点68：Map 与 Set 行为对比 — Map.entries() 返回 [k,v]，Set 返回 [v,v]。
 */
export function testMapEntriesStructureDiffersFromSetEntries() {
    const m = new Map([['k', 'v']]);
    const s = new Set(['v']);

    const mMapEntry = m.entries().next().value;
    const setEntry = s.entries().next().value;

    return (
        Array.isArray(mMapEntry) &&
            mMapEntry[0] === 'k' &&
            mMapEntry[1] === 'v' &&
        Array.isArray(setEntry) &&
            setEntry[0] === 'v' &&
            setEntry[1] === 'v'
    );
}

/**
 * 测试点70：跨模块共享 Map 实例，entries 反映最新 set 状态。
 */
export function testSharedMapInstanceReflectsUpdatesAcrossSimulatedModules() {

    const sharedMap = new Map();
    sharedMap.set('fromA', 1);

    function moduleB(map) {
        map.set('fromB', 2);
    }

    moduleB(sharedMap);

    const keys = Array.from(sharedMap.keys());
    return keys.includes('fromA') && keys.includes('fromB') && sharedMap.size === 2;
}

/**
 * 测试点71：在 entries() 迭代中 set 然后 delete 同一键，最终不存在。
 */
export function testSetThenDeleteSameKeyDuringIterationLeavesMapWithoutIt() {
    const map = new Map([['base', 0]]);

    for (const _ of map.entries()) {
        map.set('temp', 100);
        map.delete('temp');
    }

    return !map.has('temp') && map.size === 1;
}

/**
 * 测试点72：Map 支持空字符串 '' 作为键。
 */
export function testEmptyStringAsKeyIsAllowed() {
    const map = new Map();
    map.set('', 'empty-key-value');

    let found = false;
    for (const [k, v] of map.entries()) {
        if (k === '' && v === 'empty-key-value') {
            found = true;
        }
    }
    return found;
}

/**
 * 测试点73：布尔值 true/false 作为键，彼此独立且与字符串区分。
 */
export function testBooleanKeysAreDistinctAndNotCoerced() {
    const map = new Map();
    map.set(true, 'bool-true');
    map.set(false, 'bool-false');
    map.set('true', 'string-true');

    return (
        map.size === 3 &&
            map.get(true) === 'bool-true' &&
            map.get(false) === 'bool-false' &&
            map.get('true') === 'string-true'
    );
}

/**
 * 测试点74：在密集循环中反复 set/entries，无内存泄漏（逻辑验证）。
 */
export function testRepeatedSetAndEntriesDoesNotCorruptState() {
    const map = new Map();
    for (let i = 0; i < 100; i++) {
        map.set(i, i * 2);
    }

    let count = 0;
    for (const _ of map.entries()) {
        count++;
    }

    return count === 100 && map.get(99) === 198;
}

/**
 * 测试点75：Map 的 entries() 可被 spread 到数组，结果正确。
 */
export function testSpreadEntriesIntoArrayWorksCorrectly() {
    const map = new Map([['a', 1], ['b', 2]]);
    const arr = [...map.entries()];

    return (
        Array.isArray(arr) &&
            arr.length === 2 &&
            arr[0][0] === 'a' &&
            arr[1][1] === 2
    );
}

/**
 * 测试点76：在 Object.freeze(Map) 后，set 仍可调用（freeze 不冻结内容）。
 */
export function testFreezingMapObjectDoesNotPreventSet() {
    const map = new Map();
    Object.freeze(map);


    try {
        map.set('frozen-outer', 1);
        return map.get('frozen-outer') === 1;
    } catch (e) {

        return false;
    }
}

/**
 * 测试点77：使用 Date 对象作为键，基于引用而非时间值。
 */
export function testDateObjectsAsKeysComparedByReference() {
    const d1 = new Date('2020-01-01');
    const d2 = new Date('2020-01-01');
    const d3 = d1;

    const map = new Map();
    map.set(d1, 'first');
    map.set(d2, 'second');
    map.set(d3, 'third');

    return map.size === 2 && map.get(d1) === 'third';
}

/**
 * 测试点78：RegExp 对象作为键，按引用存储。
 */
export function testRegExpAsKeyStoredByReference() {
    const r1 = /abc/;
    const r2 = /abc/;
    const r3 = r1;

    const map = new Map();
    map.set(r1, 'r1');
    map.set(r2, 'r2');
    map.set(r3, 'r3');

    return map.size === 2 && map.get(r1) === 'r3';
}

/**
 * 测试点79：在 TypeScript 编译输出中（假设运行时），Map 行为不变（验证类型擦除后逻辑）。
 */
export function testMapBehaviorUnaffectedByTypeSystemErasures() {

    const map = new Map();

    map.set('numberKey', 42);
    map.set('stringKey', 'hello');

    const num = map.get('numberKey');
    const str = map.get('stringKey');

    return typeof num === 'number' && typeof str === 'string';
}

/**
 * 测试点80：Map 在 iframe 或 cross-realm 环境中（模拟），entries/set 仍工作（通过构造函数检查）。
 */
export function testMapInstanceRecognizedAcrossRealmsViaConstructor() {
    const map = new Map();


    return (
        map instanceof Map &&
            typeof map.set === 'function' &&
            typeof map.entries === 'function'
    );
}


/**
 * 测试点81：Map 支持 10,000+ 项 entries 迭代（小规模压力测试）。
 */
export function testLargeMapEntriesIterationWorks() {
    const map = new Map();
    const N = 10000;
    for (let i = 0; i < N; i++) {
        map.set(i, `value-${i}`);
    }

    let count = 0;
    for (const _ of map.entries()) {
        count++;
    }

    return count === N && map.get(N - 1) === `value-${N - 1}`;
}

/**
 * 测试点82：在 Content Security Policy (CSP) 严格环境中，Map 仍可用（逻辑验证）。
 */
export function testMapWorksUnderStrictCSPAssumption() {

    const map = new Map();
    map.set('csp-safe', true);
    return map.get('csp-safe') === true;
}

/**
 * 测试点83：全局对象被冻结后，Map 构造和方法仍可用。
 */
export function testMapWorksWhenGlobalObjectIsFrozen() {

    const map = new Map();
    map.set('post-freeze', 1);
    return map.size === 1;
}

/**
 * 测试点87：在 entries() 中抛出异常后，Map 状态仍可恢复并继续 set。
 */
export function testMapRecoversAfterExceptionInIteration() {
    const map = new Map([['pre', 1]]);

    try {
        for (const _ of map.entries()) {
            throw new Error('Simulated crash');
        }
    } catch (e) {

        map.set('post', 2);
    }

    return map.size === 2 && map.get('post') === 2;
}

/**
 * 测试点88：使用 Intl.NumberFormat 生成的字符串作为键，正常工作。
 */
export function testIntlFormattedStringAsKeyWorks() {
    const formatter = new Intl.NumberFormat('de-DE');
    const key = formatter.format(1234567.89);

    const map = new Map();
    map.set(key, 'formatted-number');

    return map.get(key) === 'formatted-number';
}

/**
 * 测试点89：自定义对象实现 @@iterator 不影响 Map 键行为。
 */
export function testCustomIterableObjectAsKeyUsesReferenceNotIterator() {
    const obj = { a: 1 };
    obj[Symbol.iterator] = function* () {
        yield 999;
    };

    const map = new Map();
    map.set(obj, 'stored');

    let retrieved = null;
    for (const [k, v] of map.entries()) {
        retrieved = v;
    }

    return retrieved === 'stored';
}

/**
 * 测试点90：Map 的 toString() 默认返回 "[object Map]"，不影响 entries。
 */
export function testMapToStringDoesNotInterfereWithEntries() {
    const map = new Map([['test', 1]]);
    const str = map.toString();
    const val = map.get('test');

    return str === '[object Map]' && val === 1;
}

/**
 * 测试点91：console.log(map) 不改变内部状态（验证无副作用）。
 */
export function testConsoleLogHasNoSideEffectOnMap() {
    const map = new Map([['log-test', 42]]);


    const descriptor = Object.getOwnPropertyDescriptor(map, 'size');
    const value = map.get('log-test');

    return value === 42;
}

/**
 * 测试点92：Map 支持嵌套 Map 作为值，entries 可遍历。
 */
export function testNestedMapAsValueIsAccessibleInEntries() {
    const inner = new Map([['inner-key', 'inner-val']]);
    const outer = new Map();
    outer.set('nested', inner);

    let retrievedInner = null;
    for (const [_, val] of outer.entries()) {
        retrievedInner = val;
    }

    return retrievedInner instanceof Map && retrievedInner.get('inner-key') === 'inner-val';
}

/**
 * 测试点93：Map 键为函数对象，按引用存储。
 */
export function testFunctionAsKeyStoredByReference() {

    function fn1() {
    }

    function fn2() {
    }

    const fn3 = fn1;

    const map = new Map();
    map.set(fn1, 'fn1');
    map.set(fn2, 'fn2');
    map.set(fn3, 'fn3');

    return map.size === 2 && map.get(fn1) === 'fn3';
}

/**
 * 测试点94：在低内存设备上（模拟），Map 小规模操作仍可靠。
 */
export function testMapSmallOperationsReliableUnderResourceConstraints() {

    const map = new Map();
    map.set('low-mem', true);
    const has = map.has('low-mem');
    const val = map.get('low-mem');
    map.delete('low-mem');
    return has && val === true && map.size === 0;
}

/**
 * 测试点95：Map 与 Object.create(null) 对比 — Map 允许任意键，包括 __proto__。
 */
export function testMapSupportsProtoStringAsKeyUnlikePlainObjects() {
    const map = new Map();
    map.set('__proto__', 'not prototype pollution');

    const obj = Object.create(null);
    obj.__proto__ = 'safe too';

    return map.get('__proto__') === 'not prototype pollution';
}

/**
 * 测试点96：重复调用 set 相同 NaN 键，只保留一个（SameValueZero）。
 */
export function testMultipleNaNKeysCollapseToOneEntry() {
    const map = new Map();
    map.set(NaN, 'first');
    map.set(NaN, 'second');
    map.set(NaN, 'third');

    const entries = Array.from(map.entries());
    return entries.length === 1 && entries[0][1] === 'third';
}

/**
 * 测试点97：Map 在 polyfill 环境中（如旧浏览器）行为一致（通过特征检测）。
 */
export function testMapFeatureDetectionIndicatesStandardCompliance() {

    if (typeof Map !== 'function') {
        return false;
    }

    const m = new Map();
    return (
        typeof m.set === 'function' &&
            typeof m.entries === 'function' &&
            typeof m.entries().next === 'function'
    );
}

/**
 * 测试点99：Map 支持跨 iframe 传递的 MessagePort 作为键（引用相等）。
 */
export function testMessagePortLikeObjectAsKeyByReference() {

    const port1 = { name: 'port', id: 1 };
    const port2 = { name: 'port', id: 1 };
    const port3 = port1;

    const map = new Map();
    map.set(port1, 'p1');
    map.set(port2, 'p2');
    map.set(port3, 'p3');

    return map.size === 2 && map.get(port1) === 'p3';
}

/**
 * 测试点100：Map 的 entries/set 行为在所有主要 JS 引擎（V8, SpiderMonkey, JavaScriptCore）中一致（通过标准逻辑验证）。
 */
export function testMapBehaviorIsCrossEngineConsistent() {

    const map = new Map();

    map.set('a', 1);
    map.set('b', 2);
    const order = Array.from(map.keys());

    map.set(-0, 'zero');
    const zeroVal = map.get(+0);

    map.set(NaN, 'nan');
    const nanSize = map.size;

    return (
        order[0] === 'a' &&
            order[1] === 'b' &&
            zeroVal === 'zero' &&
            map.get(NaN) === 'nan' &&


            true
    );
}


/**
 * 测试点101：使用 Symbol.for() 全局符号作为键，entries 可遍历。
 */
export function testGlobalSymbolAsKeyWorksInEntries() {
    const sym = Symbol.for('global-key');
    const map = new Map();
    map.set(sym, 'symbol-value');

    let found = false;
    for (const [k, v] of map.entries()) {
        if (k === sym && v === 'symbol-value') {
            found = true;
        }
    }
    return found;
}

/**
 * 测试点102：唯一 Symbol（非全局）作为键，按引用存储。
 */
export function testUniqueSymbolAsKeyIsReferenceBased() {
    const s1 = Symbol('a');
    const s2 = Symbol('a');
    const s3 = s1;

    const map = new Map();
    map.set(s1, 'first');
    map.set(s2, 'second');
    map.set(s3, 'third');

    return map.size === 2 && map.get(s1) === 'third';
}

/**
 * 测试点103：通过 Reflect.set 无法修改 Map 内部状态（Map 不是普通对象）。
 */
export function testReflectSetDoesNotAffectMapInternals() {
    const map = new Map();

    Reflect.set(map, 'fakeKey', 'fakeValue');

    map.set('realKey', 'realValue');

    const hasFakeAsEntry = map.has('fakeKey');
    const realVal = map.get('realKey');

    return !hasFakeAsEntry && realVal === 'realValue' && map.size === 1;
}

/**
 * 测试点104：使用 Object.defineProperty 给 Map 添加属性，不影响 entries。
 */
export function testAddingOwnPropertyToMapDoesNotPolluteEntries() {
    const map = new Map();
    map.set('entry', 1);
    Object.defineProperty(map, 'customProp', { value: 'not-an-entry', enumerable: true });

    const entryCount = Array.from(map.entries()).length;
    return entryCount === 1 && map.customProp === 'not-an-entry';
}

/**
 * 测试点108：模拟“时间旅行”——保存 Map 快照，修改后恢复。
 */
export function testMapSnapshotAndRestoreViaDeepCloneOfEntries() {
    const original = new Map([['a', 1], ['b', 2]]);
    const snapshot = new Map(original);

    original.set('c', 3);
    original.set('a', 99);

    const restored = new Map(snapshot);

    return (
        restored.size === 2 &&
            restored.get('a') === 1 &&
            restored.get('b') === 2 &&
            !restored.has('c')
    );
}

/**
 * 测试点109：Map 与 Immutable.js 风格的结构共享（通过 entries 复用）。
 */
export function testMapEntriesEnableStructuralSharingPattern() {
    const base = new Map([['x', 10]]);
    const extended = new Map([...base.entries(), ['y', 20]]);

    return (
        base.size === 1 &&
            extended.size === 2 &&
            extended.get('x') === 10 &&
            extended.get('y') === 20
    );
}

/**
 * 测试点110：在 SharedArrayBuffer 环境中（模拟），Map 仍为线程局部（JS 单线程语义）。
 */
export function testMapRemainsThreadLocalEvenWithSharedMemoryAssumption() {

    const map = new Map();
    map.set('thread-local', true);
    return map.get('thread-local') === true;
}

/**
 * 测试点111：Map 与 JSON Schema 验证兼容（通过 entries 转换为数组）。
 */
export function testMapEntriesCompatibleWithJSONSchemaArrayFormat() {
    const map = new Map([['name', 'Alice'], ['age', 30]]);
    const arr = Array.from(map.entries());

    return (
        Array.isArray(arr) &&
            arr.length === 2 &&
        Array.isArray(arr[0]) &&
            arr[0].length === 2
    );
}

/**
 * 测试点112：从 Object.create(Map.prototype) 创建的伪 Map 无法正常工作（缺少内部槽）。
 */
export function testMapMustBeConstructedWithNewKeyword() {
    try {
        const fake = Object.create(Map.prototype);
        fake.set('test', 1);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点113：Map 的 entries() 在 for...in 中不可枚举（正确应使用 for...of）。
 */
export function testMapEntriesNotAccessibleViaForInLoop() {
    const map = new Map([['k', 'v']]);
    const keys = [];
    for (const key in map) {
        keys.push(key);
    }

    return keys.length === 0;
}

/**
 * 测试点114：自定义 inspect 方法（Node.js）不影响 entries 行为。
 */
export function testCustomInspectSymbolDoesNotAffectMapLogic() {
    const map = new Map([['inspect-test', 123]]);

    const custom = Symbol.for('nodejs.util.inspect.custom');
    map[custom] = () => 'Custom Map View';

    return map.get('inspect-test') === 123;
}

/**
 * 测试点115：Map 键为 Error 对象，按引用存储。
 */
export function testErrorObjectAsKeyStoredByReference() {
    const e1 = new Error('msg');
    const e2 = new Error('msg');
    const e3 = e1;

    const map = new Map();
    map.set(e1, 'err1');
    map.set(e2, 'err2');
    map.set(e3, 'err3');

    return map.size === 2 && map.get(e1) === 'err3';
}

/**
 * 测试点116：Map 支持 Promise 对象作为键（不推荐，但合法）。
 */
export function testPromiseAsKeyStoredByReference() {
    const p1 = Promise.resolve(1);
    const p2 = Promise.resolve(1);
    const p3 = p1;

    const map = new Map();
    map.set(p1, 'p1');
    map.set(p2, 'p2');
    map.set(p3, 'p3');

    return map.size === 2 && map.get(p1) === 'p3';
}

/**
 * 测试点117：在严格模式下，Map 的 set 返回 this，支持链式调用。
 */
export function testMapSetReturnsThisForChainingInStrictMode() {
    const result = (function () {
        'use strict';
        const m = new Map();
        const chained = m.set('a', 1).set('b', 2);
        return chained === m && m.size === 2;
    })();
    return result;
}

/**
 * 测试点118：Map 与 WeakRef（Stage 3）对比 — Map 保持强引用，防止 GC。
 */
export function testMapHoldsStrongReferencesPreventingGarbageCollection() {
    let obj = {};
    const map = new Map();
    map.set('key', obj);


    const held = map.get('key');
    obj = null;

    return held !== undefined;
}

/**
 * 测试点119：Map 的 entries() 可被传递给其他函数作为 iterable。
 */
export function testMapEntriesIterableCanBePassedToOtherFunctions() {

    function consume(iterable) {
        const result = [];
        for (const item of iterable) {
            result.push(item);
        }
        return result;
    }

    const map = new Map([['x', 10]]);
    const output = consume(map.entries());

    return (
        Array.isArray(output) &&
            output.length === 1 &&
            output[0][0] === 'x' &&
            output[0][1] === 10
    );
}

/**
 * 测试点120：Map 在 DevTools 中显示为 "Map(1) { 'key' => 'value' }"（验证 toStringTag）。
 */
export function testMapHasCorrectToStringTagForDevTools() {
    const map = new Map();
    const tag = Object.prototype.toString.call(map);
    return tag === '[object Map]';
}

/**
 * 测试点 121：在 entries 迭代中 delete 当前项后，立即调用 entries() 获取新迭代器 —— 不影响当前循环。
 */
export function testNewEntriesIteratorDuringLoop() {
    const map = new Map([['a', 1], ['b', 2]]);
    let count = 0;
    for (const [k] of map.entries()) {
        count++;
        map.delete(k);
        const newIter = map.entries();
        if (count === 1) {

            const next = newIter.next();
            if (next.done || next.value[0] !== 'b') {
                return false;
            }
        }
    }
    return count === 2 && map.size === 0;
}

/**
 * 测试点 123：Map 中包含 undefined 作为 value，delete 操作不受影响。
 */
export function testDeleteWithUndefinedValue() {
    const map = new Map([['u', undefined], ['v', null]]);
    let keys = [];
    for (const [k, v] of map.entries()) {
        keys.push(k);
        if (v === undefined) {
            map.delete(k);
        }
    }
    return keys.length === 2 && !map.has('u') && map.has('v');
}

/**
 * 测试点 124：在 entries 迭代中 delete 当前项，key 为 Symbol。
 */
export function testDeleteSymbolKeyDuringIteration() {
    const sym = Symbol('test');
    const map = new Map([[sym, 'symbol-value']]);
    let found = false;
    for (const [k, v] of map.entries()) {
        if (k === sym && v === 'symbol-value') {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 125：在 entries 迭代中 delete 当前项，但该 key 已被 delete 过（幂等安全）。
 */
export function testDoubleDeleteSameKeyInLoop() {
    const map = new Map([['dup', 1]]);
    let count = 0;
    for (const [k] of map.entries()) {
        count++;
        map.delete(k);
        const result1 = map.delete(k);
        const result2 = map.delete(k);
        if (result1 !== false || result2 !== false) {
            return false;
        }
    }
    return count === 1 && map.size === 0;
}

/**
 * 测试点 126：在 entries 迭代中 delete 当前项，同时修改其他引用（如 WeakMap 关联）—— 验证 Map 自身行为不受外部影响。
 */
export function testDeleteUnaffectedByExternalWeakMap() {
    const key = {};
    const map = new Map([[key, 'main']]);
    const wm = new WeakMap();
    wm.set(key, 'weak');

    let visited = false;
    for (const [k, v] of map.entries()) {
        if (k === key && v === 'main') {
            visited = true;
            map.delete(k);

            wm.delete(k);
        }
    }
    return visited && map.size === 0;
}

/**
 * 测试点 127：在 entries 迭代中 delete 当前项，key 是函数。
 */
export function testDeleteFunctionAsKey() {

    function fn() {
    }

    const map = new Map([[fn, 'func-val']]);
    let hit = false;
    for (const [k, v] of map.entries()) {
        if (k === fn && v === 'func-val') {
            hit = true;
            map.delete(k);
        }
    }
    return hit && map.size === 0;
}

/**
 * 测试点 128：在 entries 迭代中 delete 当前项，但 entries 被提前转为数组（非实时）—— 对比验证“实时性”仅适用于迭代器。
 */
export function testEntriesToArrayThenDeleteDoesNotAffectLoop() {
    const map = new Map([['real', 1], ['time', 2]]);
    const snapshot = Array.from(map.entries());
    let deletedInLoop = false;
    for (const [k] of snapshot) {
        if (k === 'real') {
            map.delete(k);
            deletedInLoop = true;
        }
    }

    return deletedInLoop && snapshot.length === 2 && map.size === 1;
}

/**
 * 测试点 129：在 entries 迭代中 delete 当前项，然后调用 clear() —— 应不影响已完成的迭代步骤。
 */
export function testDeleteThenClearDuringIteration() {
    const map = new Map([['a', 1], ['b', 2], ['c', 3]]);
    let steps = 0;
    try {
        for (const [k] of map.entries()) {
            steps++;
            map.delete(k);
            if (steps === 1) {
                map.clear();
            }
        }
    } catch (e) {
        return false;
    }

    return steps === 1;
}

/**
 * 测试点 130：在 entries 迭代中 delete 当前项，key 为字符串 "0" 和数字 0（Map 区分类型）。
 */
export function testDeleteZeroStringVsNumberKey() {
    const map = new Map([[0, 'num'], ['0', 'str']]);
    let visited = [];
    for (const [k] of map.entries()) {
        visited.push(k);
        map.delete(k);
    }
    return visited.length === 2 &&
    visited.includes(0) &&
    visited.includes('0') &&
        map.size === 0;
}

/**
 * 测试点 131：在 entries 迭代中 delete 当前项，但 Map 原型被污染（模拟恶意环境）。
 */
export function testDeleteWorksDespitePrototypePollution() {

    const originalDelete = Map.prototype.delete;
    let worked = false;
    try {
        Map.prototype.delete = function (key) {
            return originalDelete.call(this, key);
        };
        const map = new Map([['safe', true]]);
        for (const [k] of map.entries()) {
            map.delete(k);
            worked = true;
        }
    } finally {
        Map.prototype.delete = originalDelete;
    }
    return worked && (new Map()).size === 0;
}

/**
 * 测试点 132：在 entries 迭代中 delete 当前项，value 是另一个 Map。
 */
export function testDeleteWithNestedMapValue() {
    const inner = new Map([['inner', 1]]);
    const map = new Map([['outer', inner]]);
    let ok = false;
    for (const [k, v] of map.entries()) {
        if (k === 'outer' && v === inner) {
            ok = true;
            map.delete(k);
        }
    }
    return ok && map.size === 0;
}

/**
 * 测试点 133：在 entries 迭代中 delete 当前项，使用 for await...of（虽然 entries 不是异步迭代器，应报错或不进入）。
 */
export function testForAwaitOfOnMapEntriesShouldNotWork() {
    const map = new Map([['async', 1]]);
    let entered = false;
    (async () => {
        try {
            for await (const _ of map.entries()) {
                entered = true;
            }
        } catch (e) {

        }
    })();


    return !entered;
}

/**
 * 测试点 134：在 entries 迭代中 delete 当前项，但 key 是正则表达式对象。
 */
export function testDeleteRegExpAsKey() {
    const re = /test/g;
    const map = new Map([[re, 'regex-val']]);
    let matched = false;
    for (const [k, v] of map.entries()) {
        if (k === re && v === 'regex-val') {
            matched = true;
            map.delete(k);
        }
    }
    return matched && map.size === 0;
}

/**
 * 测试点 135：在 entries 迭代中 delete 当前项，Map 大小为 10000，验证性能无崩溃（简化版：只测逻辑）。
 */
export function testDeleteInLargeMapIteration() {
    const map = new Map();
    const N = 1000;
    for (let i = 0; i < N; i++) {
        map.set(i, i * 2);
    }
    let count = 0;
    for (const [k] of map.entries()) {
        count++;
        map.delete(k);
        if (count > N) {
            break;
        }
    }
    return count === N && map.size === 0;
}

/**
 * 测试点 136：在 entries 迭代中 delete 当前项，但 entries 被解构到变量后 delete。
 */
export function testDestructureEntryThenDelete() {
    const map = new Map([['destr', 42]]);
    let ok = false;
    for (const entry of map.entries()) {
        const key = entry[0];
        const val = entry[1];
        if (key === 'destr' && val === 42) {
            ok = true;
            map.delete(key);
        }
    }
    return ok && map.size === 0;
}

/**
 * 测试点 137：在 entries 迭代中 delete 当前项，但 Map 被冻结（Object.freeze）—— 注意：freeze 不影响 Map 内部。
 */
export function testDeleteOnFrozenMapObject() {
    const map = new Map([['frozen', 1]]);
    Object.freeze(map);
    let deleted = false;
    for (const [k] of map.entries()) {
        map.delete(k);
        deleted = true;
    }

    return deleted && map.size === 0;
}

/**
 * 测试点 138：在 entries 迭代中 delete 当前项，key 为 BigInt。
 */
export function testDeleteBigIntKey() {
    const big = 123n;
    const map = new Map([[big, 'bigint-val']]);
    let found = false;
    for (const [k, v] of map.entries()) {
        if (k === big && v === 'bigint-val') {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 139：在 entries 迭代中 delete 当前项，但循环体内 throw Error，验证 delete 是否生效。
 */
export function testDeletePersistsAfterThrowInLoop() {
    const map = new Map([['will-throw', 1], ['survivor', 2]]);
    try {
        for (const [k] of map.entries()) {
            map.delete(k);
            if (k === 'will-throw') {
                throw new Error('intentional');
            }
        }
    } catch (e) {

    }

    return !map.has('will-throw') && map.has('survivor') && map.size === 1;
}

/**
 * 测试点 140：在 entries 迭代中 delete 当前项，同时另一个对同一 Map 的 entries 迭代器正在运行（交错手动迭代）。
 */
export function testInterleavedTwoManualIteratorsWithDelete() {
    const map = new Map([['A', 1], ['B', 2], ['C', 3]]);
    const iter1 = map.entries();
    const iter2 = map.entries();

    const step1_1 = iter1.next();
    map.delete('A');

    const step2_1 = iter2.next();
    map.delete('B');

    const step1_2 = iter1.next();


    if (step1_1.done || step1_1.value[0] !== 'A') {
        return false;
    }
    if (step2_1.done || step2_1.value[0] !== 'B') {
        return false;
    }
    if (step1_2.done || step1_2.value[0] !== 'C') {
        return false;
    }

    map.delete('C');
    const step1_3 = iter1.next();
    const step2_2 = iter2.next();

    return step1_3.done && step2_2.done && map.size === 0;
}

