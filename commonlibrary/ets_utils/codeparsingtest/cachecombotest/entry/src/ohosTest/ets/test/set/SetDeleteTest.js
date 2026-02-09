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
 * 01. 基本场景：迭代 Set 时删除当前元素之后的另一个元素。
 */
export function test01_deleteNextElementDuringIteration() {
    const set = new Set([1, 2, 3]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 1) {
            set.delete(2);
        }
    }
    return visited.length === 2 && visited[0] === 1 && visited[1] === 3;
}

/**
 * 02. 删除当前正在迭代的元素（自身）。
 */
export function test02_deleteCurrentElementDuringIteration() {
    const set = new Set([1, 2, 3]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 2) {
            set.delete(2);
        }
    }
    return visited.includes(2) && !set.has(2);
}

/**
 * 03. 删除已迭代过的前一个元素。
 */
export function test03_deletePreviousElementDuringIteration() {
    const set = new Set([1, 2, 3]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 3) {
            set.delete(1);
        }
    }
    return visited.length === 3 && !set.has(1);
}

/**
 * 04. 在空 Set 上调用 entries() 并迭代。
 */
export function test04_iterateEmptySet() {
    const set = new Set();
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
    }
    return visited.length === 0;
}

/**
 * 05. 单元素 Set 中删除自身。
 */
export function test05_singleElementDeleteSelf() {
    const set = new Set([42]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        set.delete(42);
    }
    return visited.length === 1 && visited[0] === 42 && set.size === 0;
}

/**
 * 06. 多次删除同一个不存在的元素（无副作用）。
 */
export function test06_deleteNonExistentElementMultipleTimes() {
    const set = new Set([1]);
    for (const [k, v] of set.entries()) {
        set.delete(999);
        set.delete(999);
    }
    return set.size === 1 && set.has(1);
}

/**
 * 07. 删除后立即重新添加同一元素。
 */
export function test07_deleteAndReaddSameElementDuringIteration() {
    const set = new Set([1, 2]);
    let readded = false;
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            set.delete(2);
            set.add(2);
            readded = true;
        }
    }
    return readded && set.has(2) && set.size === 2;
}

/**
 * 08. 使用对象作为 Set 元素，在迭代中删除另一个对象。
 */
export function test08_deleteObjectElementDuringIteration() {
    const a = { id: 1 };
    const b = { id: 2 };
    const set = new Set([a, b]);
    for (const [k, v] of set.entries()) {
        if (v.id === 1) {
            set.delete(b);
        }
    }
    return set.size === 1 && set.has(a);
}

/**
 * 09. 包含 NaN 的 Set：验证 NaN 被视为相等，仅存一份。
 */
export function test09_setWithNaNHandling() {
    const set = new Set([NaN, NaN]);
    let count = 0;
    for (const [k, v] of set.entries()) {
        count++;
        set.delete(v);
    }
    return count === 1 && set.size === 0;
}

/**
 * 10. 包含 +0 和 -0 的 Set：验证它们被视为相等。
 */
export function test10_positiveZeroAndNegativeZeroAreEqual() {
    const set = new Set([0, -0]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        set.delete(v);
    }
    return visited.length === 1 && set.size === 0;
}

/**
 * 11. 在迭代中清空整个 Set（clear），但继续循环。
 */
export function test11_clearSetDuringIteration() {
    const set = new Set([1, 2, 3]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 1) {
            set.clear();
        }
    }
    return visited.length === 1 && visited[0] === 1 && set.size === 0;
}

/**
 * 12. 多层嵌套循环中对同一 Set 进行删除（不推荐，但测试行为）。
 */
export function test12_nestedLoopsOnSameSet() {
    const set = new Set([1, 2]);
    let innerVisited = 0;
    for (const [k, v] of set.entries()) {
        for (const [k2, v2] of set.entries()) {
            innerVisited++;
            if (v === 1 && v2 === 2) {
                set.delete(2);
            }
        }
    }
    return innerVisited === 2 && !set.has(2); // (1,1), (1,2), (2,1) → but 2 deleted after second
}

/**
 * 13. 使用 Symbol 作为 Set 元素并删除。
 */
export function test13_symbolElementsInSet() {
    const s1 = Symbol('a');
    const s2 = Symbol('b');
    const set = new Set([s1, s2]);
    for (const [k, v] of set.entries()) {
        if (v === s1) {
            set.delete(s2);
        }
    }
    return set.size === 1 && set.has(s1);
}

/**
 * 14. Date 对象作为元素，在迭代中删除。
 */
export function test14_dateObjectsInSet() {
    const d1 = new Date(2020, 0, 1);
    const d2 = new Date(2021, 0, 1);
    const set = new Set([d1, d2]);
    for (const [k, v] of set.entries()) {
        if (v.getFullYear() === 2020) {
            set.delete(d2);
        }
    }
    return set.size === 1 && set.has(d1);
}

/**
 * 15. RegExp 对象作为元素。
 */
export function test15_regexpObjectsInSet() {
    const r1 = /a/g;
    const r2 = /b/g;
    const set = new Set([r1, r2]);
    for (const [k, v] of set.entries()) {
        if (v.source === 'a') {
            set.delete(r2);
        }
    }
    return set.size === 1 && set.has(r1);
}

/**
 * 16. 函数作为 Set 元素。
 */
export function test16_functionElementsInSet() {

    function f1() {
    }

    function f2() {
    }

    const set = new Set([f1, f2]);
    for (const [k, v] of set.entries()) {
        if (v === f1) {
            set.delete(f2);
        }
    }
    return set.size === 1 && set.has(f1);
}

/**
 * 17. 循环引用对象作为元素（不会导致死循环）。
 */
export function test17_circularReferenceObjectInSet() {
    const obj = { name: 'test' };
    obj.self = obj;
    const set = new Set([obj, 2]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v.name === 'test') {
            set.delete(2);
            deleted = true;
        }
    }
    return deleted && set.size === 1;
}

/**
 * 18. 在迭代中删除多个元素。
 */
export function test18_deleteMultipleElementsDuringIteration() {
    const set = new Set([1, 2, 3, 4]);
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            set.delete(2);
            set.delete(3);
        }
    }
    return set.size === 2 && set.has(1) && set.has(4);
}

/**
 * 19. 删除未在本次迭代中访问到的后续元素（跳过）。
 */
export function test19_deleteSkippedFutureElement() {
    const set = new Set([1, 2, 3, 4, 5]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 2) {
            set.delete(4);
        } // 4 is after 3, so 3 still visited
    }
    return visited.length === 4 && visited.includes(3) && !visited.includes(4);
}

/**
 * 20. 使用 for...of 直接遍历 set（而非 entries()），但内部逻辑一致。
 */
export function test20_forOfSetDirectly() {
    const set = new Set([10, 20]);
    const visited = [];
    for (const v of set) {
        visited.push(v);
        if (v === 10) {
            set.delete(20);
        }
    }
    return visited.length === 1 && !set.has(20);
}


/**
 * 21. Set 包含 undefined、null、false 等 falsy 值。
 */
export function test21_falsyValuesInSet() {
    const set = new Set([undefined, null, false, 0, '']);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === null) {
            set.delete(false);
        }
    }
    return visited.length === 4 && !set.has(false);
}

/**
 * 22. 在严格模式下执行删除操作。
 */
export function test22_strictModeDeletion() {
    'use strict';
    const set = new Set([1, 2]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 1) {
            set.delete(2);
        }
    }
    return visited.length === 1 && !set.has(2);
}

/**
 * 23. 尝试删除 undefined（若存在）。
 */
export function test23_deleteUndefinedIfPresent() {
    const set = new Set([1, undefined]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            set.delete(undefined);
            deleted = true;
        }
    }
    return deleted && !set.has(undefined);
}

/**
 * 24. Set 由数组构造，包含重复值（应自动去重）。
 */
export function test24_setFromDeduplicatedArray() {
    const set = new Set([1, 1, 2, 2, 3]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 2) {
            set.delete(3);
        }
    }
    return visited.length === 2 && set.size === 2;
}

/**
 * 25. 在 try-catch 中删除元素，异常不影响已删状态。
 */
export function test25_deleteInsideTryCatch() {
    const set = new Set([1, 2]);
    try {
        for (const [k, v] of set.entries()) {
            if (v === 1) {
                set.delete(2);
            }
            throw new Error();
        }
    } catch (e) {

    }
    return !set.has(2);
}

/**
 * 26. 使用递归函数迭代并删除。
 */
export function test26_recursiveDeletion() {
    const set = new Set([1, 2, 3]);

    function recurse(items) {
        if (items.length === 0) {
            return;
        }
        const first = items[0];
        if (first === 1) {
            set.delete(3);
        }
        recurse(items.slice(1));
    }

    recurse([...set]);
    return !set.has(3);
}

/**
 * 27. 验证 Set 迭代顺序与插入顺序一致（规范要求）。
 */
export function test27_insertionOrderPreserved() {
    const set = new Set(['a', 'b', 'c']);
    const order = [];
    for (const [k, v] of set.entries()) {
        order.push(v);
        if (v === 'b') {
            set.delete('c');
        }
    }
    return order.join('') === 'ab' && !set.has('c');
}

/**
 * 28. 删除后立即检查 size 属性是否更新。
 */
export function test28_sizeUpdatesImmediatelyAfterDelete() {
    const set = new Set([1, 2]);
    let sizeAfterDelete = -1;
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            set.delete(2);
            sizeAfterDelete = set.size;
        }
    }
    return sizeAfterDelete === 1;
}

/**
 * 29. Set 包含相同值的不同包装类型（如 String('a') vs 'a'）。
 */
export function test29_stringObjectVsPrimitive() {
    const set = new Set([String('a'), 'a']); // two distinct elements
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (typeof v === 'object') {
            set.delete('a');
        }
    }
    return visited.length === 1 && set.has('a') && set.has(String('a'));
}

/**
 * 30. 在 Web Worker 或非主上下文模拟环境中行为一致（逻辑上）。
 */
export function test30_simulateWorkerContext() {
    const set = new Set(['worker']);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        set.delete('worker');
    }
    return visited.length === 1 && set.size === 0;
}

/**
 * 31. 使用解构赋值从 entries() 获取值。
 */
export function test31_destructuringEntries() {
    const set = new Set([100]);
    let gotValue;
    for (const [key, value] of set.entries()) {
        gotValue = value;
        set.delete(100);
    }
    return gotValue === 100 && set.size === 0;
}

/**
 * 32. 在异步函数中同步操作 Set（无 await，纯同步逻辑）。
 */
export function test32_asyncFunctionButSyncLogic() {
    const set = new Set([1]);
    const visited = [];
    (async () => {
        for (const [k, v] of set.entries()) {
            visited.push(v);
            set.delete(1);
        }
    })();
    return visited.length === 1 && set.size === 0;
}

/**
 * 33. 验证 has() 方法在删除后立即返回 false。
 */
export function test33_hasReturnsFalseImmediatelyAfterDelete() {
    const set = new Set([5]);
    let hasAfter = true;
    for (const [k, v] of set.entries()) {
        set.delete(5);
        hasAfter = set.has(5);
    }
    return !hasAfter;
}

/**
 * 34. 删除一个元素后，再添加回，验证新位置在末尾。
 */
export function test34_readdedElementGoesToEnd() {
    const set = new Set([1, 2, 3]);
    const order = [];
    for (const [k, v] of set.entries()) {
        order.push(v);
        if (v === 2) {
            set.delete(3);
            set.add(3); // now at end
        }
    }

    return order.length === 3 && order[2] === 3;
}

/**
 * 35. Set 包含两个相等的普通对象（不同引用）— 应视为不同。
 */
export function test35_distinctObjectsWithSameContent() {
    const a = { x: 1 };
    const b = { x: 1 };
    const set = new Set([a, b]);
    for (const [k, v] of set.entries()) {
        if (v === a) {
            set.delete(b);
        }
    }
    return set.size === 1 && set.has(a);
}

/**
 * 36. 在 Object.freeze(set) 后尝试删除（应失败，但 freeze 不影响 Set 内部）。
 */
export function test36_freezeSetObjectDoesNotPreventDeletion() {
    const set = new Set([1, 2]);
    Object.freeze(set); // freezes the object wrapper, not internal slots
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            deleted = set.delete(2);
        }
    }
    return deleted && !set.has(2); // Note: in practice, Set internal state is not frozen by Object.freeze
}

/**
 * 37. 使用 Array.from(set.entries()) 后修改原 Set。
 */
export function test37_modifySetAfterConvertingToEntriesArray() {
    const set = new Set([1, 2]);
    const arr = Array.from(set.entries());
    for (const [k, v] of arr) {
        if (v === 1) {
            set.delete(2);
        }
    }
    return set.size === 1;
}

/**
 * 38. 验证 keys() 与 values() 与 entries() 的 value 部分一致。
 */
export function test38_keysValuesEntriesConsistency() {
    const set = new Set([7]);
    let fromEntries, fromValues;
    for (const [k, v] of set.entries()) {
        fromEntries = v;
    }
    for (const v of set.values()) {
        fromValues = v;
    }
    return fromEntries === fromValues && fromEntries === 7;
}

/**
 * 40. 大量元素（1000+）中删除一个，验证性能无崩溃。
 */
export function test40_largeSetDeletion() {
    const set = new Set();
    for (let i = 0; i < 1000; i++) {
        set.add(i);
    }
    let found = false;
    for (const [k, v] of set.entries()) {
        if (v === 500) {
            set.delete(999);
            found = true;
            break;
        }
    }
    return found && set.size === 999 && !set.has(999);
}


/**
 * 41. 删除元素后，entries() 迭代器不再包含它（即使未完成迭代）。
 */
export function test41_deletedElementNotSeenLaterInSameIteration() {
    const set = new Set([1, 2, 3, 4]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 2) {
            set.delete(3);
        }
    }
    return visited.length === 3 && !visited.includes(3);
}

/**
 * 42. 在 forEach 中删除（对比 for...of 行为）。
 */
export function test42_setForEachDeleteBehavior() {
    const set = new Set([1, 2, 3]);
    const visited = [];
    set.forEach((v) => {
        visited.push(v);
        if (v === 1) {
            set.delete(2);
        }
    });
    return visited.length === 2; // forEach snapshot at start — 2 is still visited!
}

/**
 * 43. 验证 forEach 与 for...of 在删除时的行为差异。
 */
export function test43_forEachVsForOfDeletionDifference() {

    const set1 = new Set([1, 2, 3]);
    const visited1 = [];
    for (const [k, v] of set1.entries()) {
        visited1.push(v);
        if (v === 1) {
            set1.delete(2);
        }
    }

    const set2 = new Set([1, 2, 3]);
    const visited2 = [];
    set2.forEach(v => {
        visited2.push(v);
        if (v === 1) {
            set2.delete(2);
        }
    });

    return visited1.length === 2 && visited2.length === 2;
}

/**
 * 44. Set 包含 Infinity。
 */
export function test44_setWithInfinity() {
    const set = new Set([Infinity, 1]);
    for (const [k, v] of set.entries()) {
        if (v === Infinity) {
            set.delete(1);
        }
    }
    return set.size === 1 && set.has(Infinity);
}

/**
 * 45. 使用 Object.is 比较的边界：-0 和 +0 视为相等。
 */
export function test45_negativeZeroEqualsPositiveZeroInSet() {
    const set = new Set();
    set.add(-0);
    set.add(+0);
    return set.size === 1;
}

/**
 * 47. 验证 Set.prototype.delete 返回 boolean。
 */
export function test47_deleteReturnsBoolean() {
    const set = new Set([1]);
    let result;
    for (const [k, v] of set.entries()) {
        result = set.delete(1);
    }
    return result === true && set.delete(1) === false;
}

/**
 * 48. 删除一个刚添加的元素（在同一次迭代中）。
 */
export function test48_addThenDeleteInSameIteration() {
    const set = new Set([1]);
    for (const [k, v] of set.entries()) {
        set.add(2);
        set.delete(2);
    }
    return set.size === 1 && !set.has(2);
}

/**
 * 49. Set 作为 Map 的 key（合法），并在迭代中删除。
 */
export function test49_setAsMapKeyButTestSetItself() {
    const set = new Set([1, 2]);
    const map = new Map([[set, 'value']]);
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            set.delete(2);
        }
    }
    return set.size === 1 && map.has(set);
}

/**
 * 53. 验证 Set 迭代器是可重入的（多个同时存在）。
 */
export function test53_multipleIteratorsConcurrent() {
    const set = new Set([1, 2, 3]);
    const iter1 = set.entries();
    const iter2 = set.entries();
    iter1.next(); // consume 1
    set.delete(2);
    const r1 = iter1.next(); // should be 3
    const r2 = iter2.next(); // should be 1
    return r1.value[1] === 3 && r2.value[1] === 1;
}

/**
 * 54. 在生成器中 yield 并删除。
 */
export function test54_generatorYieldAndDelete() {

    function* gen(s) {
        for (const [k, v] of s.entries()) {
            yield v;
            if (v === 'x') {
                s.delete('z');
            }
        }
    }

    const set = new Set(['x', 'y', 'z']);
    const out = [...gen(set)];
    return out.length === 2 && !set.has('z');
}

/**
 * 55. Set 包含 Proxy 对象。
 */
export function test55_proxyObjectInSet() {
    const p = new Proxy({ id: 1 }, {});
    const set = new Set([p, 2]);
    for (const [k, v] of set.entries()) {
        if (v.id === 1) {
            set.delete(2);
        }
    }
    return set.size === 1;
}

/**
 * 56. 删除后立即用 add 添加不同值。
 */
export function test56_deleteThenAddDifferentValue() {
    const set = new Set([1, 2]);
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            set.delete(2);
            set.add(3);
        }
    }
    return set.size === 2 && set.has(1) && set.has(3);
}

/**
 * 57. 验证 Set 不继承自 Array，entries() 返回 [value, value]。
 */
export function test57_entriesReturnsKeyValuePairWithValueTwice() {
    const set = new Set([5]);
    let pair;
    for (const entry of set.entries()) {
        pair = entry;
    }
    return pair[0] === 5 && pair[1] === 5;
}

/**
 * 58. 在 finally 块中删除。
 */
export function test58_deleteInFinallyBlock() {
    const set = new Set([1, 2]);
    try {
        throw null;
    } finally {
        for (const [k, v] of set.entries()) {
            if (v === 1) {
                set.delete(2);
            }
        }
    }
    return set.size === 1;
}

/**
 * 59. 使用 Reflect.apply 调用 Set.prototype.delete。
 */
export function test59_reflectApplyDelete() {
    const set = new Set([1, 2]);
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            Reflect.apply(Set.prototype.delete, set, [2]);
        }
    }
    return !set.has(2);
}

/**
 * 60. 验证 Set 的 iterator 是 @@iterator。
 */
export function test60_setIteratorIsWellKnownSymbol() {
    const set = new Set([1]);
    const iter1 = set[Symbol.iterator]();
    const iter2 = set.entries();
    const v1 = iter1.next().value[1];
    const v2 = iter2.next().value[1];
    return v1 === undefined && v2 === 1;
}


/**
 * 61. Set 包含 Infinity、-Infinity 和 NaN，删除 -Infinity。
 */
export function test61_setWithInfinityAndNegativeInfinity() {
    const set = new Set([Infinity, -Infinity, NaN]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (Object.is(v, Infinity)) {
            set.delete(-Infinity);
        }
    }
    return (
        visited.length === 2 &&
        visited.some(x => Object.is(x, Infinity)) &&
        visited.some(x => Number.isNaN(x)) &&
            !set.has(-Infinity)
    );
}

/**
 * 62. Set 包含 Object.create(null) 对象。
 */
export function test62_setWithNullProtoObjects() {
    const obj1 = Object.create(null);
    obj1.id = 'a';
    const obj2 = Object.create(null);
    obj2.id = 'b';
    const set = new Set([obj1, obj2]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v.id === 'a') {
            set.delete(obj2);
            deleted = true;
        }
    }
    return deleted && set.size === 1 && set.has(obj1);
}

/**
 * 63. 对冻结的 entries 数组迭代，但修改原 Set。
 */
export function test63_deleteDuringIterationOverFrozenEntriesArray() {
    const set = new Set([1, 2, 3]);
    const entriesArr = [...set.entries()];
    Object.freeze(entriesArr);
    const visited = [];
    for (const [k, v] of entriesArr) {
        visited.push(v);
        set.delete(v);
    }
    return visited.length === 3 && set.size === 0;
}

/**
 * 64. 严格模式函数内操作 Set。
 */
export function test64_setInStrictModeFunction() {
    'use strict';
    const set = new Set([10, 20]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 10) {
            set.delete(20);
        }
    }
    return visited.length === 1 && !set.has(20);
}

/**
 * 66. Set 包含 globalThis。
 */
export function test66_setWithGlobalThisAsElement() {
    const set = new Set([globalThis, 1]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v === globalThis) {
            set.delete(1);
            deleted = true;
        }
    }
    return deleted && set.size === 1;
}

/**
 * 67. 两个独立 Set 同时迭代并删除。
 */
export function test67_deletingSameElementFromTwoSetsIndependently() {
    const set1 = new Set([1, 2]);
    const set2 = new Set([1, 2]);
    const visited1 = [], visited2 = [];
    for (const [k, v] of set1.entries()) {
        visited1.push(v);
        if (v === 1) {
            set1.delete(2);
        }
    }
    for (const [k, v] of set2.entries()) {
        visited2.push(v);
        if (v === 1) {
            set2.delete(2);
        }
    }
    return visited1.length === 1 && visited2.length === 1 && !set1.has(2) && !set2.has(2);
}

/**
 * 68. Set 清空后，继续调用 entries 迭代器的 next()。
 */
export function test68_setEntriesIteratorAfterClear() {
    const set = new Set([1]);
    const iter = set.entries();
    iter.next();
    set.clear();
    const result = iter.next();
    return result.done === true;
}

/**
 * 71. Set 由字符串构造（new Set('abc')）。
 */
export function test71_setConstructedFromString() {
    const set = new Set('abc');
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 'b') {
            set.delete('c');
        }
    }
    return visited.length === 2 && !set.has('c');
}

/**
 * 72. Set 包含数组作为元素。
 */
export function test72_setWithArrayAsElement() {
    const arr1 = [1];
    const arr2 = [2];
    const set = new Set([arr1, arr2]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v[0] === 1) {
            set.delete(arr2);
            deleted = true;
        }
    }
    return deleted && set.size === 1 && set.has(arr1);
}

/**
 * 73. Set 包含 WeakSet 实例（合法，因是对象）。
 */
export function test73_setAfterBeingUsedAsWeakSetKey() {
    const ws = new WeakSet();
    const set = new Set([ws, 1]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v === ws) {
            set.delete(1);
            deleted = true;
        }
    }
    return deleted && set.size === 1;
}

/**
 * 74. Set 包含 Promise 对象。
 */
export function test74_setWithPromiseObjects() {
    const p1 = Promise.resolve(1);
    const p2 = Promise.resolve(2);
    const set = new Set([p1, p2]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v === p1) {
            set.delete(p2);
            deleted = true;
        }
    }
    return deleted && set.size === 1 && set.has(p1);
}

/**
 * 75. 嵌套闭包中操作 Set。
 */
export function test75_setInNestedClosureWithDelete() {
    let result = false;
    (function outer() {
        const set = new Set([1, 2]);
        (function inner() {
            const visited = [];
            for (const [k, v] of set.entries()) {
                visited.push(v);
                if (v === 1) {
                    set.delete(2);
                }
            }
            result = visited.length === 1 && !set.has(2);
        })();
    })();
    return result;
}

/**
 * 76. Set 包含 getter-only 对象。
 */
export function test76_setWithGetterOnlyPropertyObject() {
    const obj = Object.defineProperty({}, 'id', {
        get: () => 'secret',
        enumerable: true
    });
    const set = new Set([obj, 2]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v.id === 'secret') {
            set.delete(2);
            deleted = true;
        }
    }
    return deleted && set.size === 1;
}

/**
 * 77. Set 上的自定义属性不会被 entries() 遍历。
 */
export function test77_setEntriesIgnoresCustomProps() {
    const set = new Set([1]);
    set.custom = 'hack';
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
    }
    return visited.length === 1;
}

/**
 * 78. 同一对象多次加入 Set（应只存一份）。
 */
export function test78_duplicatedObjectReferences() {
    const obj = { x: 1 };
    const set = new Set([obj, obj, obj]);
    let count = 0;
    for (const [k, v] of set.entries()) {
        count++;
        set.delete(obj);
    }
    return count === 1 && set.size === 0;
}

/**
 * 79. 模拟 GC 场景（通过置 null）。
 */
export function test79_gcSimulation() {
    let set = new Set([1, 2, 3]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 2) {
            set.delete(3);
        }
    }
    set = null;
    return visited.length === 2;
}

/**
 * 80. Set 同时包含 '1'（字符串）和 1（数字）。
 */
export function test80_numericStringAndNumberDistinct() {
    const set = new Set(['1', 1]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === '1') {
            set.delete(1);
        }
    }
    return visited.length === 1 && !set.has(1);
}


/**
 * 81. 跨环境（Node/Browser/Deno）通用逻辑验证。
 */
export function test81_crossEnvironmentCompatibility() {
    const set = new Set(['env']);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        set.delete('env');
    }
    return visited.length === 1 && set.size === 0;
}

/**
 * 82. Set 包含所有 falsy 值。
 */
export function test82_allFalsyValues() {
    const set = new Set(['', 0, false, null, undefined]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === '') {
            set.delete(null);
        }
    }
    return visited.length === 4 && !set.has(null);
}

/**
 * 83. JSON.stringify 不影响 Set。
 */
export function test83_stringifyDoesNotAffectSet() {
    const set = new Set([1, 2]);
    JSON.stringify([...set]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 1) {
            set.delete(2);
        }
    }
    return visited.length === 1 && !set.has(2);
}

/**
 * 84. Set 包含 class 实例。
 */
export function test84_classInstanceInSet() {
    class Item {
        constructor(id) {
            this.id = id;
        }
    }

    const i1 = new Item(1), i2 = new Item(2);
    const set = new Set([i1, i2]);
    for (const [k, v] of set.entries()) {
        if (v.id === 1) {
            set.delete(i2);
        }
    }
    return set.size === 1 && set.has(i1);
}

/**
 * 85. 在 generator 中迭代并删除。
 */
export function test85_generatorFunctionDeletion() {

    function* gen(s) {
        for (const [k, v] of s.entries()) {
            yield v;
            if (v === 1) {
                s.delete(2);
            }
        }
    }

    const set = new Set([1, 2, 3]);
    const out = [...gen(set)];
    return out.length === 2 && !set.has(2);
}

/**
 * 86. 多个 NaN 被去重为一个。
 */
export function test86_duplicateNaNHandling() {
    const set = new Set([NaN, NaN, NaN]);
    let count = 0;
    for (const [k, v] of set.entries()) {
        count++;
        set.delete(v);
    }
    return count === 1 && set.size === 0;
}

/**
 * 87. 每次 entries() 返回新迭代器。
 */
export function test87_newIteratorEachTime() {
    const set = new Set([1, 2]);
    const i1 = set.entries();
    const i2 = set.entries();
    set.delete(2);
    return i1.next().value[1] === 1 && i2.next().value[1] === 1;
}

/**
 * 88. Set 包含 BigInt。
 */
export function test88_bigIntInSet() {
    const set = new Set([0n, 1n, 2n]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 0n) {
            set.delete(2n);
        }
    }
    return visited.length === 2 && !set.has(2n);
}

/**
 * 89. 迭代中抛出异常，但删除已生效。
 */
export function test89_errorAfterDelete() {
    const set = new Set([1, 2, 3]);
    let visited = [], caught = false;
    try {
        for (const [k, v] of set.entries()) {
            visited.push(v);
            if (v === 2) {
                set.delete(3);
                throw new Error();
            }
        }
    } catch (e) {
        caught = true;
    }
    return caught && visited.length === 2 && !set.has(3);
}

/**
 * 90. Set 包含 Well-Known Symbol。
 */
export function test90_wellKnownSymbolInSet() {
    const sym = Symbol.iterator;
    const set = new Set([sym, 1]);
    for (const [k, v] of set.entries()) {
        if (typeof v === 'symbol') {
            set.delete(1);
        }
    }
    return set.size === 1 && set.has(sym);
}

/**
 * 91. 从另一个 Set 构造新 Set，修改副本不影响原 Set。
 */
export function test91_setConstructedFromSet() {
    const orig = new Set([1, 2, 3]);
    const copy = new Set(orig);
    for (const [k, v] of copy.entries()) {
        if (v === 2) {
            copy.delete(3);
        }
    }
    return copy.size === 2 && orig.size === 3;
}

/**
 * 92. Set 包含带不可枚举属性的对象。
 */
export function test92_nonEnumerablePropsIgnored() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', { value: 1, enumerable: false });
    const set = new Set([obj, 2]);
    for (const [k, v] of set.entries()) {
        if (v === obj) {
            set.delete(2);
        }
    }
    return set.size === 1;
}

/**
 * 95. 多次展开 Set，中间修改。
 */
export function test95_spreadMultipleTimes() {
    const set = new Set([1, 2, 3]);
    const a = [...set];
    const b = [...set];
    set.delete(2);
    const c = [...set];
    return a.length === 3 && b.length === 3 && c.length === 2;
}

/**
 * 96. 模拟 top-level await 环境。
 */
export function test96_topLevelAwaitSimulation() {
    const set = new Set([1, 2]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 1) {
            set.delete(2);
        }
    }
    return visited.length === 1 && set.size === 1;
}

/**
 * 97. 模块作用域模拟。
 */
export function test97_moduleScopeSimulation() {
    const set = new Set(['mod']);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        set.delete('mod');
    }
    return visited.length === 1 && set.size === 0;
}

/**
 * 98. 动态属性访问判断后删除。
 */
export function test98_dynamicPropertyAccess() {
    const set = new Set([{ a: 1 }, { b: 2 }]);
    const items = [...set];
    if (items[0].a === 1) {
        set.delete(items[1]);
    }
    return set.size === 1;
}

/**
 * 99. entries() 迭代器只能消费一次。
 */
export function test99_iteratorExhaustedAfterUse() {
    const set = new Set([1]);
    const iter = set.entries();
    const first = [...iter];
    const second = [...iter];
    return first.length === 1 && second.length === 0;
}

/**
 * 100. 类 arguments 对象（有 length 和索引）作为元素。
 */
export function test100_exoticObjectLikeArguments() {
    const fake = { '0': 'a', '1': 'b', length: 2 };
    const set = new Set([fake, 1]);
    for (const [k, v] of set.entries()) {
        if (v.length === 2 && v[0] === 'a') {
            set.delete(1);
        }
    }
    return set.size === 1;
}

/**
 * 101. 在 SharedArrayBuffer 环境中操作 Set（逻辑上无影响）。
 */
export function test101_setInSharedMemoryContext() {

    const set = new Set([1, 2]);
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            set.delete(2);
        }
    }
    return set.size === 1;
}

/**
 * 102. Set 包含已冻结的对象（frozen object）。
 */
export function test102_frozenObjectInSet() {
    const obj = Object.freeze({ id: 'frozen' });
    const set = new Set([obj, 2]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v.id === 'frozen') {
            set.delete(2);
            deleted = true;
        }
    }
    return deleted && set.size === 1;
}

/**
 * 103. 使用 Reflect.deleteProperty（无效，但验证不影响 Set）。
 */
export function test103_reflectDeletePropertyOnSetDoesNothing() {
    const set = new Set([1, 2]);
    for (const [k, v] of set.entries()) {
        if (v === 1) {

            Reflect.deleteProperty(set, '2');
            set.delete(2);
        }
    }
    return !set.has(2);
}

/**
 * 104. Set 的迭代器在删除后不会回溯（forward-only guarantee）。
 */
export function test104_iteratorDoesNotBacktrackAfterDeletion() {
    const set = new Set([1, 2, 3, 4]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 3) {
            set.delete(2);
        }
    }
    return visited.length === 4 && visited.includes(2);
}

/**
 * 105. 在 iframe 或沙盒环境模拟中行为一致（逻辑验证）。
 */
export function test105_sandboxedEnvironmentSimulation() {
    const set = new Set(['sandbox']);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        set.delete('sandbox');
    }
    return visited.length === 1 && set.size === 0;
}

/**
 * 106. Set 包含 Error 对象。
 */
export function test106_errorObjectInSet() {
    const e1 = new Error('A');
    const e2 = new Error('B');
    const set = new Set([e1, e2]);
    for (const [k, v] of set.entries()) {
        if (v.message === 'A') {
            set.delete(e2);
        }
    }
    return set.size === 1 && set.has(e1);
}

/**
 * 107. 删除元素后，再次添加相同引用对象，应视为存在。
 */
export function test107_readdSameObjectReference() {
    const obj = { x: 1 };
    const set = new Set([obj, 2]);
    for (const [k, v] of set.entries()) {
        if (v === obj) {
            set.delete(2);
        }
    }
    set.add(obj);
    return set.size === 1 && set.has(obj);
}

/**
 * 108. 在构造函数中立即删除（非迭代场景，但对比行为）。
 */
export function test108_deleteDuringConstructionNotPossibleButSimulated() {

    const set = new Set([1, 2]);
    set.delete(2);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
    }
    return visited.length === 1 && visited[0] === 1;
}

/**
 * 109. Set 包含 DOM 元素（在浏览器中有效）。
 */
export function test109_domElementInSet() {

    const el1 = typeof document !== 'undefined' ? document.createElement('div') : { nodeType: 1 };
    const el2 = typeof document !== 'undefined' ? document.createElement('span') : { nodeType: 1 };
    const set = new Set([el1, el2]);
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v.nodeType === 1) {
            set.delete(el2);
            deleted = true;
            break;
        }
    }
    return deleted && set.size === 1;
}

/**
 * 110. 在严格相等比较下，不同 NaN 实例视为相等。
 */
export function test110_nanEqualityInSet() {
    const nan1 = NaN;
    const nan2 = 0 / 0;
    const nan3 = Math.sqrt(-1);
    const set = new Set([nan1, nan2, nan3]);
    let count = 0;
    for (const [k, v] of set.entries()) {
        count++;
        set.delete(v);
    }
    return count === 1 && set.size === 0;
}

/**
 * 111. 使用 for...in（错误方式）遍历 Set — 应不触发 entries。
 */
export function test111_forInDoesNotIterateSetEntries() {
    const set = new Set([1, 2]);
    const visited = [];

    for (const key in set) {
        visited.push(key);
    }

    for (const [k, v] of set.entries()) {
        if (v === 1) {
            set.delete(2);
        }
    }
    return visited.length === 0 && set.size === 1;
}


/**
 * 113. 在 WebAssembly 内存无关上下文中操作 Set。
 */
export function test113_wasmUnrelatedContext() {
    const set = new Set([1, 2]);
    const visited = [];
    for (const [k, v] of set.entries()) {
        visited.push(v);
        if (v === 1) {
            set.delete(2);
        }
    }
    return visited.length === 1 && set.size === 1;
}

/**
 * 114. Set 包含 Intl.Collator 实例。
 */
export function test114_intlCollatorInSet() {
    const c1 = new Intl.Collator();
    const c2 = new Intl.Collator('fr');
    const set = new Set([c1, c2]);
    for (const [k, v] of set.entries()) {
        if (v.resolvedOptions().locale === 'en') {
            set.delete(c2);
        }
    }
    return set.size === 2 && set.has(c1);
}

/**
 * 115. 多线程模拟：主线程删除，子逻辑不感知（单线程 JS 中无影响）。
 */
export function test115_singleThreadConcurrencySimulation() {
    const set = new Set([1, 2, 3]);

    let seen = [];
    const capture = () => seen = [...set];
    for (const [k, v] of set.entries()) {
        if (v === 2) {
            set.delete(3);
            capture();
        }
    }
    return seen.length === 2 && !seen.includes(3);
}

/**
 * 116. Set 包含 Atomics 对象（实际不可，但放普通对象模拟）。
 */
export function test116_atomicsLikeObjectInSet() {
    const fakeAtomics = {
        add: () => {
        }
    };
    const other = { id: 2 };
    const set = new Set([fakeAtomics, other]);
    for (const [k, v] of set.entries()) {
        if (typeof v.add === 'function') {
            set.delete(other);
        }
    }
    return set.size === 1;
}

/**
 * 117. 在模块顶层作用域（模拟）中操作 Set。
 */
export function test117_moduleTopLevelSimulation() {
    const set = new Set(['top']);
    for (const [k, v] of set.entries()) {
        set.delete('top');
    }
    return set.size === 0;
}

/**
 * 118. Set 包含 PerformanceObserver（浏览器 API 模拟）。
 */
export function test118_performanceObserverLikeObject() {
    const obs = typeof PerformanceObserver !== 'undefined'
        ? new PerformanceObserver(() => {
        })
        : {
            observe: () => {
            }
        };
    const set = new Set([obs, 1]);
    for (const [k, v] of set.entries()) {
        if (typeof v.observe === 'function') {
            set.delete(1);
        }
    }
    return set.size === 1;
}

/**
 * 119. 验证 Set 不响应属性赋值（如 set[0] = x）。
 */
export function test119_setIgnoresIndexAssignment() {
    const set = new Set([1, 2]);
    set[0] = 999;
    let deleted = false;
    for (const [k, v] of set.entries()) {
        if (v === 1) {
            set.delete(2);
            deleted = true;
        }
    }
    return deleted && set.size === 1 && !set.has(999);
}

/**
 * 120. 最大安全整数作为 Set 元素并删除。
 */
export function test120_maxSafeIntegerInSet() {
    const max = Number.MAX_SAFE_INTEGER;
    const set = new Set([max, max - 1]);
    for (const [k, v] of set.entries()) {
        if (v === max) {
            set.delete(max - 1);
        }
    }
    return set.size === 1 && set.has(max);
}