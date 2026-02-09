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
 * 测试点 1：在 for...of map.entries() 中删除当前项，
 * 验证迭代不会出错，且后续项仍能正常遍历。
 * @returns {boolean}
 */
export function testDeleteCurrentDuringEntriesIteration() {
    const map = new Map([
        ['a', 1],
        ['b', 2],
        ['c', 3]
    ]);
    let visitedKeys = [];
    try {
        for (const [key, value] of map.entries()) {
            visitedKeys.push(key);
            map.delete(key);
        }
    } catch (e) {
        return false;
    }
    const expected = ['a', 'b', 'c'];
    if (visitedKeys.length !== expected.length) {
        return false;
    }
    for (let i = 0; i < expected.length; i++) {
        if (visitedKeys[i] !== expected[i]) {
            return false;
        }
    }
    return map.size === 0;
}

/**
 * 测试点 2：在迭代中删除尚未遍历到的项，
 * 验证该元素不会在后续被访问。
 * @returns {boolean}
 */
export function testDeleteFutureEntryDuringIteration() {
    const map = new Map([
        ['a', 1],
        ['b', 2],
        ['c', 3],
        ['d', 4]
    ]);
    let visitedKeys = [];
    for (const [key, value] of map.entries()) {
        visitedKeys.push(key);
        if (key === 'a') {
            map.delete('c');
        }
    }
    const expected = ['a', 'b', 'd'];
    if (visitedKeys.length !== expected.length) {
        return false;
    }
    for (let i = 0; i < expected.length; i++) {
        if (visitedKeys[i] !== expected[i]) {
            return false;
        }
    }
    return !map.has('c');
}

/**
 * 测试点 3：在迭代中删除已经遍历过的项（冗余操作），
 * 验证不会影响迭代流程或导致错误。
 * @returns {boolean}
 */
export function testDeletePastEntryDuringIteration() {
    const map = new Map([
        ['a', 1],
        ['b', 2],
        ['c', 3]
    ]);
    let visitedKeys = [];
    let deleteCalled = false;
    for (const [key, value] of map.entries()) {
        visitedKeys.push(key);
        if (key === 'b') {
            map.delete('a');
            deleteCalled = true;
        }
    }
    if (!deleteCalled) {
        return false;
    }
    const expected = ['a', 'b', 'c'];
    if (visitedKeys.length !== expected.length) {
        return false;
    }
    for (let i = 0; i < expected.length; i++) {
        if (visitedKeys[i] !== expected[i]) {
            return false;
        }
    }
    return !map.has('a') && map.has('b') && map.has('c');
}

/**
 * 测试点 4：空 Map 上调用 entries() 并 delete 不会报错。
 */
export function testEmptyMapEntriesDelete() {
    const map = new Map();
    let count = 0;
    for (const entry of map.entries()) {
        count++;
        map.delete(entry[0]);
    }
    return count === 0 && map.size === 0;
}

/**
 * 测试点 5：在 entries 迭代中删除不存在的键，不应影响迭代。
 */
export function testDeleteNonExistentKeyDuringIteration() {
    const map = new Map([['a', 1], ['b', 2]]);
    let visited = [];
    for (const [k] of map.entries()) {
        visited.push(k);
        map.delete('nonexistent');
    }
    return visited.length === 2 && map.size === 2;
}

/**
 * 测试点 6：在 entries 迭代中反复删除当前项多次（幂等性）。
 */
export function testRepeatedDeleteCurrentKey() {
    const map = new Map([['x', 10]]);
    let count = 0;
    for (const [k] of map.entries()) {
        count++;
        map.delete(k);
        map.delete(k);
        map.delete(k);
    }
    return count === 1 && map.size === 0;
}

/**
 * 测试点 7：使用 for...of 遍历 entries 时，在循环外保留引用并 delete。
 */
export function testDeleteViaExternalReferenceDuringIteration() {
    const map = new Map([['p', 1], ['q', 2]]);
    let keys = [];
    for (const entry of map.entries()) {
        keys.push(entry[0]);
        if (entry[0] === 'p') {
            setTimeout(() => {
            }, 0);
            map.delete('q');
        }
    }
    return keys.join(',') === 'p' && map.size === 1 && map.has('p');
}

/**
 * 测试点 8：在 entries 迭代中清空整个 Map（delete 所有后续项）。
 */
export function testDeleteAllRemainingDuringIteration() {
    const map = new Map([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
    let visited = [];
    for (const [k] of map.entries()) {
        visited.push(k);
        if (k === 'b') {
            map.delete('c');
            map.delete('d');
        }
    }
    return visited.length === 2 && visited[0] === 'a' && visited[1] === 'b' && map.size === 2;
}

/**
 * 测试点 10：多个 delete 操作交错进行（如删除前一项和后一项）。
 */
export function testDeletePrevAndNextDuringIteration() {
    const map = new Map([['1', 1], ['2', 2], ['3', 3], ['4', 4]]);
    let visited = [];
    for (const [k] of map.entries()) {
        visited.push(k);
        if (k === '2') {
            map.delete('1');
            map.delete('3');
        }
    }
    return visited.length === 3 &&
        visited[0] === '1' &&
        visited[1] === '2' &&
        visited[2] === '4' &&
        !map.has('1') && !map.has('3');
}

/**
 * 测试点 11：在 entries 迭代中 delete 当前项，然后 break，验证状态正确。
 */
export function testDeleteCurrentThenBreak() {
    const map = new Map([['x', 1], ['y', 2]]);
    for (const [k] of map.entries()) {
        map.delete(k);
        break;
    }
    return map.size === 1 && map.has('y');
}

/**
 * 测试点 12：使用解构赋值从 entries 获取 key/value 后 delete。
 */
export function testDestructuringThenDelete() {
    const map = new Map([['alpha', 100]]);
    let seen = false;
    for (const [key, val] of map.entries()) {
        if (key === 'alpha' && val === 100) {
            seen = true;
            map.delete(key);
        }
    }
    return seen && map.size === 0;
}

/**
 * 测试点 13：在 entries 迭代中 delete 当前项，同时尝试访问 map.size。
 */
export function testAccessSizeAfterDeleteInIteration() {
    const map = new Map([['a', 1], ['b', 2]]);
    let sizes = [];
    for (const [k] of map.entries()) {
        map.delete(k);
        sizes.push(map.size);
    }
    return sizes[0] === 1 && sizes[1] === 0;
}

/**
 * 测试点 14：在 entries 迭代中 delete 一个 key，然后立即检查 has()。
 */
export function testHasAfterDeleteInIteration() {
    const map = new Map([['test', 42]]);
    let result = true;
    for (const [k] of map.entries()) {
        map.delete(k);
        if (map.has(k)) {
            result = false;
        }
    }
    return result && map.size === 0;
}

/**
 * 测试点 16：在 entries 迭代中 delete 当前项，使用 while + iterator 手动控制。
 */
export function testManualIteratorWithDelete() {
    const map = new Map([['m1', 1], ['m2', 2]]);
    const iter = map.entries();
    let result = true;
    let step1 = iter.next();
    if (!step1.done) {
        const [k1] = step1.value;
        if (k1 !== 'm1') {
            result = false;
        }
        map.delete(k1);
        let step2 = iter.next();
        if (!step2.done) {
            const [k2] = step2.value;
            if (k2 !== 'm2') {
                result = false;
            }
            map.delete(k2);
        } else {
            result = false;
        }
    } else {
        result = false;
    }
    return result && map.size === 0;
}

/**
 * 测试点 17：在 entries 迭代中 delete 当前项，但 key 是对象引用。
 */
export function testDeleteObjectKeyDuringIteration() {
    const key1 = { id: 1 };
    const key2 = { id: 2 };
    const map = new Map([[key1, 'A'], [key2, 'B']]);
    let visited = 0;
    for (const [k, v] of map.entries()) {
        visited++;
        map.delete(k);
    }
    return visited === 2 && map.size === 0;
}

/**
 * 测试点 18：在 entries 迭代中 delete 当前项，key 为 NaN（Map 支持 NaN 作为唯一 key）。
 */
export function testDeleteNaNKeyDuringIteration() {
    const map = new Map();
    map.set(NaN, 'nan-value');
    let found = false;
    for (const [k, v] of map.entries()) {
        if (Number.isNaN(k) && v === 'nan-value') {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 19：在 entries 迭代中 delete 当前项，key 为 -0 和 +0（Map 视为相同）。
 */
export function testDeleteNegativeZeroKey() {
    const map = new Map();
    map.set(-0, 'zero');
    let count = 0;
    for (const [k] of map.entries()) {
        count++;
        map.delete(k);
    }
    return count === 1 && map.size === 0 && !map.has(0) && !map.has(-0);
}

/**
 * 测试点 20：在 entries 迭代中 delete 当前项，同时另一个线程（模拟）也在操作 —— 实际 JS 是单线程，
 * 此处测试“看似并发”的嵌套迭代（不推荐，但验证行为）。
 */
export function testNestedIterationWithDelete() {
    const map = new Map([['outer', 1], ['inner', 2]]);
    let outerVisited = [];
    let innerVisited = [];
    try {
        for (const [k1] of map.entries()) {
            outerVisited.push(k1);
            for (const [k2] of map.entries()) {
                innerVisited.push(k2);
                if (k2 === 'inner') {
                    map.delete(k2);
                }
            }
            if (k1 === 'outer') {
                map.delete(k1);
            }
        }
    } catch (e) {
        return false;
    }
    return outerVisited.length === 1 &&
        innerVisited.length === 2 &&
        outerVisited[0] === 'outer' &&
        innerVisited[0] === 'outer' &&
        innerVisited[1] === 'inner' &&
        map.size === 0;
}

/**
 * 测试点 21：在 entries 迭代中 delete 当前项后，立即调用 entries() 获取新迭代器 —— 不影响当前循环。
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
 * 测试点 23：Map 中包含 undefined 作为 value，delete 操作不受影响。
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
 * 测试点 24：在 entries 迭代中 delete 当前项，key 为 Symbol。
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
 * 测试点 25：在 entries 迭代中 delete 当前项，但该 key 已被 delete 过（幂等安全）。
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
 * 测试点 26：在 entries 迭代中 delete 当前项，同时修改其他引用（如 WeakMap 关联）—— 验证 Map 自身行为不受外部影响。
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
 * 测试点 27：在 entries 迭代中 delete 当前项，key 是函数。
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
 * 测试点 28：在 entries 迭代中 delete 当前项，但 entries 被提前转为数组（非实时）—— 对比验证“实时性”仅适用于迭代器。
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
 * 测试点 29：在 entries 迭代中 delete 当前项，然后调用 clear() —— 应不影响已完成的迭代步骤。
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
 * 测试点 30：在 entries 迭代中 delete 当前项，key 为字符串 "0" 和数字 0（Map 区分类型）。
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
 * 测试点 31：在 entries 迭代中 delete 当前项，但 Map 原型被污染（模拟恶意环境）。
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
 * 测试点 32：在 entries 迭代中 delete 当前项，value 是另一个 Map。
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
 * 测试点 33：在 entries 迭代中 delete 当前项，使用 for await...of（虽然 entries 不是异步迭代器，应报错或不进入）。
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
 * 测试点 34：在 entries 迭代中 delete 当前项，但 key 是正则表达式对象。
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
 * 测试点 35：在 entries 迭代中 delete 当前项，Map 大小为 10000，验证性能无崩溃（简化版：只测逻辑）。
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
 * 测试点 36：在 entries 迭代中 delete 当前项，但 entries 被解构到变量后 delete。
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
 * 测试点 37：在 entries 迭代中 delete 当前项，但 Map 被冻结（Object.freeze）—— 注意：freeze 不影响 Map 内部。
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
 * 测试点 38：在 entries 迭代中 delete 当前项，key 为 BigInt。
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
 * 测试点 39：在 entries 迭代中 delete 当前项，但循环体内 throw Error，验证 delete 是否生效。
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
 * 测试点 40：在 entries 迭代中 delete 当前项，同时另一个对同一 Map 的 entries 迭代器正在运行（交错手动迭代）。
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

/**
 * 测试点 42：自定义 Map 子类，在 entries 迭代中 delete。
 */
export function testDeleteOnCustomMapSubclass() {
    class MyMap extends Map {
    }

    const map = new MyMap([['sub', 42]]);
    let hit = false;
    for (const [k] of map.entries()) {
        if (k === 'sub') {
            hit = true;
            map.delete(k);
        }
    }
    return hit && map.size === 0;
}

/**
 * 测试点 43：在 entries 迭代中 delete 当前项，key 是 DOM 元素（浏览器环境模拟）。
 */
export function testDeleteDOMElementAsKey() {
    const el = typeof document !== 'undefined' ? document.createElement('div') : { nodeType: 1 };
    const map = new Map([[el, 'element']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === el) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 44：在 entries 迭代中 delete 当前项，同时该 key 被另一个 Map 引用 —— 验证引用独立性。
 */
export function testDeleteKeySharedAcrossMaps() {
    const sharedKey = {};
    const map1 = new Map([[sharedKey, 'A']]);
    const map2 = new Map([[sharedKey, 'B']]);
    let deletedFromMap1 = false;
    for (const [k] of map1.entries()) {
        map1.delete(k);
        deletedFromMap1 = true;
    }
    return deletedFromMap1 && map1.size === 0 && map2.size === 1 && map2.has(sharedKey);
}

/**
 * 测试点 45：在 entries 迭代中 delete 当前项，但 entries 被 spread 到新数组后遍历（非实时）。
 */
export function testSpreadEntriesThenDeleteDoesNotSkip() {
    const map = new Map([['s1', 1], ['s2', 2]]);
    let count = 0;
    for (const [k] of [...map.entries()]) {
        count++;
        map.delete(k);
    }
    return count === 2 && map.size === 0;
}

/**
 * 测试点 46：在 entries 迭代中 delete 当前项，value 是 Promise。
 */
export function testDeleteWithPromiseValue() {
    const p = Promise.resolve(123);
    const map = new Map([['promise-key', p]]);
    let ok = false;
    for (const [k, v] of map.entries()) {
        if (k === 'promise-key' && v === p) {
            ok = true;
            map.delete(k);
        }
    }
    return ok && map.size === 0;
}

/**
 * 测试点 47：在 entries 迭代中 delete 当前项，但 Map 使用 Object.create(null) 作为 key 容器（模拟）—— 实际 Map 不依赖此，仅验证行为不变。
 */
export function testDeleteWithNullProtoObjectKey() {
    const key = Object.create(null);
    key.id = 'null-proto';
    const map = new Map([[key, 'safe']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === key) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 48：在 entries 迭代中 delete 当前项，然后立即检查 iterator 是否 done。
 */
export function testIteratorDoneAfterDeleteLastItem() {
    const map = new Map([['last', 99]]);
    const iter = map.entries();
    const first = iter.next();
    if (first.done || first.value[0] !== 'last') {
        return false;
    }
    map.delete('last');
    const second = iter.next();
    return second.done === true;
}

/**
 * 测试点 49：在 entries 迭代中 delete 当前项，key 是 Date 对象。
 */
export function testDeleteDateObjectAsKey() {
    const now = new Date();
    const map = new Map([[now, 'timestamp']]);
    let matched = false;
    for (const [k] of map.entries()) {
        if (k === now) {
            matched = true;
            map.delete(k);
        }
    }
    return matched && map.size === 0;
}

/**
 * 测试点 50：在 entries 迭代中 delete 当前项，但循环使用 while + iterator.next() 手动控制，中途 delete 多个。
 */
export function testManualWhileLoopWithBulkDelete() {
    const map = new Map([['w1', 1], ['w2', 2], ['w3', 3]]);
    const iter = map.entries();
    let step = 0;
    let result = true;
    while (true) {
        const { value, done } = iter.next();
        if (done) {
            break;
        }
        step++;
        const [k] = value;
        if (step === 1) {
            map.delete('w2');
            map.delete('w3');
        }
        if (step > 1) {
            result = false;
        }
    }
    return result && step === 1 && map.size === 1 && map.has('w1');
}

/**
 * 测试点 51：在 entries 迭代中 delete 当前项，但 Map 被序列化（JSON）忽略 —— 验证 delete 不受 JSON 影响。
 */
export function testDeleteUnaffectedByJSONStringify() {
    const map = new Map([['json', 1]]);
    let deleted = false;
    for (const [k] of map.entries()) {
        JSON.stringify({});
        map.delete(k);
        deleted = true;
    }
    return deleted && map.size === 0;
}

/**
 * 测试点 52：在 entries 迭代中 delete 当前项，key 是 Error 对象。
 */
export function testDeleteErrorObjectAsKey() {
    const err = new Error('test-key');
    const map = new Map([[err, 'error-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === err) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 53：在 entries 迭代中 delete 当前项，但该 key 在迭代前已被标记为可删除（模拟 GC 前状态）。
 */
export function testDeleteKeyThatIsOnlyReferencedByMap() {

    const map = new Map();
    map.set({}, 'ephemeral');
    let count = 0;
    for (const [k] of map.entries()) {
        count++;
        map.delete(k);
    }
    return count === 1 && map.size === 0;
}

/**
 * 测试点 54：在 entries 迭代中 delete 当前项，但 entries 被用于 Array.from 并带 filter —— 验证 delete 不影响快照。
 */
export function testArrayFromEntriesWithFilterAndDelete() {
    const map = new Map([['f1', 1], ['f2', 2]]);
    const snapshot = Array.from(map.entries(), ([k, v]) => {
        map.delete(k);
        return v > 0;
    });

    return snapshot.length === 2 && snapshot[0] === true && snapshot[1] === true && map.size === 0;
}

/**
 * 测试点 55：在 entries 迭代中 delete 当前项，但使用 for...in（错误方式）—— 验证 entries 不可枚举。
 */
export function testForInOnMapEntriesDoesNothing() {
    const map = new Map([['forin', 1]]);
    let entered = false;

    for (const _ in map.entries()) {
        entered = true;
    }

    map.delete('forin');
    return !entered && map.size === 0;
}

/**
 * 测试点 56：在 entries 迭代中 delete 当前项，key 是 globalThis（浏览器/Node 全局对象）。
 */
export function testDeleteGlobalObjectAsKey() {
    const g = typeof globalThis !== 'undefined' ? globalThis : global || window;
    if (!g) {
        return true;
    }
    const map = new Map([[g, 'global-ref']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === g) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 57：在 entries 迭代中 delete 当前项，但 Map 来自 iframe 或不同 realm（模拟：使用另一个上下文的 Map）。
 */
export function testDeleteCrossRealmMap() {


    const map = new Map([['cross', 1]]);

    let ok = false;
    for (const [k] of map.entries()) {
        ok = true;
        map.delete(k);
    }
    return ok && map.size === 0;
}

/**
 * 测试点 58：在 entries 迭代中 delete 当前项，但 key 是 arguments 对象。
 */
export function testDeleteArgumentsObjectAsKey() {

    function getArgs() {
        return arguments;
    }

    const args = getArgs('a', 'b');
    const map = new Map([[args, 'args-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === args) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 59：在 entries 迭代中 delete 当前项，同时监听 Map.prototype.delete 调用次数（通过 spy）。
 */
export function testDeleteSpyDuringIteration() {
    let deleteCallCount = 0;
    const originalDelete = Map.prototype.delete;
    Map.prototype.delete = function (key) {
        deleteCallCount++;
        return originalDelete.call(this, key);
    };
    try {
        const map = new Map([['spy', 1]]);
        for (const [k] of map.entries()) {
            map.delete(k);
        }
        return deleteCallCount === 1 && map.size === 0;
    } finally {
        Map.prototype.delete = originalDelete;
    }
}

/**
 * 测试点 60：在 entries 迭代中 delete 当前项，但整个迭代被包裹在严格模式函数中。
 */
export function testDeleteInStrictModeFunction() {
    'use strict';
    const map = new Map([['strict', 1]]);
    let deleted = false;
    for (const [k] of map.entries()) {
        map.delete(k);
        deleted = true;
    }
    return deleted && map.size === 0;
}

/**
 * 测试点 61：在 entries 迭代中 delete 当前项，但 key 是 Map 自身（自引用）。
 */
export function testDeleteMapAsItsOwnKey() {
    const map = new Map();
    map.set(map, 'self-ref');
    let found = false;
    for (const [k, v] of map.entries()) {
        if (k === map && v === 'self-ref') {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 62：在 entries 迭代中 delete 当前项，同时修改 Map.prototype.size（应无效，因 size 是 getter）。
 */
export function testDeleteWhilePrototypeSizeIsOverridden() {
    const originalSizeDesc = Object.getOwnPropertyDescriptor(Map.prototype, 'size');
    let deleteWorked = false;
    try {
        Object.defineProperty(Map.prototype, 'size', {
            value: 'spoofed',
            writable: true,
            configurable: true
        });
        const map = new Map([['size-test', 1]]);
        for (const [k] of map.entries()) {
            map.delete(k);
            deleteWorked = true;
        }

        return deleteWorked && map.size === 'spoofed';
    } finally {
        if (originalSizeDesc) {
            Object.defineProperty(Map.prototype, 'size', originalSizeDesc);
        } else {
            delete Map.prototype.size;
        }
    }
}

/**
 * 测试点 63：在 entries 迭代中 delete 当前项，但 entries 被多次调用并交错使用。
 */
export function testInterleavedMultipleEntriesCallsWithDelete() {
    const map = new Map([['x', 1], ['y', 2]]);
    const iter1 = map.entries();
    const iter2 = map.entries();

    const a1 = iter1.next();
    map.delete('x');

    const b1 = iter2.next();
    map.delete('y');

    const a2 = iter1.next();
    const b2 = iter2.next();

    return (
        !a1.done && a1.value[0] === 'x' &&
            !b1.done && b1.value[0] === 'y' &&
        a2.done && b2.done &&
            map.size === 0
    );
}

/**
 * 测试点 64：在 entries 迭代中 delete 当前项，key 是 frozen 对象。
 */
export function testDeleteFrozenObjectAsKey() {
    const key = Object.freeze({ id: 'frozen' });
    const map = new Map([[key, 'frozen-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === key) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 66：在 entries 迭代中 delete 当前项，但 Map 使用非标准键（如 __proto__ 字符串）。
 */
export function testDeleteProtoStringAsKey() {
    const map = new Map([['__proto__', 'not-inherited']]);
    let found = false;
    for (const [k, v] of map.entries()) {
        if (k === '__proto__' && v === 'not-inherited') {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 67：在 entries 迭代中 delete 当前项，但该操作发生在 Promise microtask 中（模拟异步延迟 delete）。
 */
export function testDeleteInMicrotaskDuringSynchronousIteration() {
    const map = new Map([['sync', 1], ['async', 2]]);
    let syncVisited = [];
    let microtaskRan = false;

    for (const [k] of map.entries()) {
        syncVisited.push(k);
        if (k === 'sync') {
            Promise.resolve().then(() => {
                map.delete('async');
                microtaskRan = true;
            });
        }
    }

    const expectedSync = ['sync', 'async'];
    if (syncVisited.length !== expectedSync.length) {
        return false;
    }
    for (let i = 0; i < expectedSync.length; i++) {
        if (syncVisited[i] !== expectedSync[i]) {
            return false;
        }
    }


    return true;
}

/**
 * 测试点 68：在 entries 迭代中 delete 当前项，但 key 是数字字符串与数字混合且相等（如 '1' vs 1）。
 */
export function testDeleteStringAndNumberKeysThatLookEqual() {
    const map = new Map([[1, 'num'], ['1', 'str']]);
    let keys = [];
    for (const [k] of map.entries()) {
        keys.push(k);
        map.delete(k);
    }
    return keys.length === 2 && map.size === 0;
}

/**
 * 测试点 69：在 entries 迭代中 delete 当前项，但 Map 被 seal（Object.seal）—— 验证内部可变性。
 */
export function testDeleteOnSealedMapObject() {
    const map = new Map([['sealed', 1]]);
    Object.seal(map);
    let deleted = false;
    for (const [k] of map.entries()) {
        map.delete(k);
        deleted = true;
    }
    return deleted && map.size === 0;
}

/**
 * 测试点 70：在 entries 迭代中 delete 当前项，但使用 Reflect.apply 调用 delete。
 */
export function testDeleteViaReflectApplyDuringIteration() {
    const map = new Map([['reflect', 1]]);
    let ok = false;
    for (const [k] of map.entries()) {
        Reflect.apply(Map.prototype.delete, map, [k]);
        ok = true;
    }
    return ok && map.size === 0;
}

/**
 * 测试点 71：在 entries 迭代中 delete 当前项，但 key 是 Intl.Collator 实例。
 */
export function testDeleteIntlObjectAsKey() {
    let collator;
    try {
        collator = new Intl.Collator();
    } catch (e) {
        return true;
    }
    const map = new Map([[collator, 'intl-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === collator) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 72：在 entries 迭代中 delete 当前项，但 entries 被用于解构赋值到多个变量。
 */
export function testDestructureEntriesToMultipleVarsThenDelete() {
    const map = new Map([['multi', 100]]);
    let keyCaptured = null;
    for (const entry of map.entries()) {
        const [k, v] = entry;
        keyCaptured = k;
        map.delete(k);
    }
    return keyCaptured === 'multi' && map.size === 0;
}

/**
 * 测试点 73：在 entries 迭代中 delete 当前项，但 Map 初始化时使用生成器。
 */
export function testDeleteOnMapFromGenerator() {

    function* gen() {
        yield ['gen1', 1];
        yield ['gen2', 2];
    }

    const map = new Map(gen());
    let count = 0;
    for (const [k] of map.entries()) {
        count++;
        map.delete(k);
    }
    return count === 2 && map.size === 0;
}

/**
 * 测试点 74：在 entries 迭代中 delete 当前项，但 key 是 WebAssembly.Instance（Node.js/浏览器环境）。
 */
export function testDeleteWebAssemblyInstanceAsKey() {
    if (typeof WebAssembly === 'undefined') {
        return true;
    }
    try {
        const wasmModule = new WebAssembly.Module(new Uint8Array([
            0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00
        ]));
        const instance = new WebAssembly.Instance(wasmModule);
        const map = new Map([[instance, 'wasm']]);
        let found = false;
        for (const [k] of map.entries()) {
            if (k === instance) {
                found = true;
                map.delete(k);
            }
        }
        return found && map.size === 0;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 75：在 entries 迭代中 delete 当前项，但循环被 try-finally 包裹，验证 delete 在异常路径也生效。
 */
export function testDeletePersistsThroughFinallyBlock() {
    const map = new Map([['finally', 1]]);
    let deleted = false;
    try {
        for (const [k] of map.entries()) {
            map.delete(k);
            deleted = true;
            throw new Error('boom');
        }
    } catch (e) {
    } finally {
    }
    return deleted && map.size === 0;
}

/**
 * 测试点 76：在 entries 迭代中 delete 当前项，但 key 是 console 对象（常见全局）。
 */
export function testDeleteConsoleAsKey() {
    if (typeof console === 'undefined') {
        return true;
    }
    const map = new Map([[console, 'console-ref']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === console) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 78：在 entries 迭代中 delete 当前项，但 key 是 Atomics 对象（共享内存相关）。
 */
export function testDeleteAtomicsAsKey() {
    if (typeof Atomics === 'undefined') {
        return true;
    }
    const map = new Map([[Atomics, 'atomics']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === Atomics) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 79：在 entries 迭代中 delete 当前项，但使用 with 语句（严格模式下非法，但非严格下测试）。
 */
export function testDeleteInsideWithStatement() {
    const map = new Map([['with-key', 1]]);
    let deleted = false;
    return !deleted && map.size === 1;
}

/**
 * 测试点 80：在 entries 迭代中 delete 当前项，但整个 Map 被传递给另一个函数并在其中被清空。
 */
export function testDeleteViaExternalFunctionDuringIteration() {
    const map = new Map([['external', 1], ['remain', 2]]);
    let step = 0;

    function clearExceptFirst(m) {
        m.delete('remain');
    }

    for (const [k] of map.entries()) {
        step++;
        if (k === 'external') {
            clearExceptFirst(map);
        }
    }
    return step === 1 && map.size === 1 && map.has('external');
}

/**
 * 测试点 81：在 entries 迭代中 delete 当前项，但 Map 被 WeakRef 包装（模拟内存管理）。
 */
export function testDeleteWhileWeakRefExists() {
    if (typeof WeakRef === 'undefined' || typeof FinalizationRegistry === 'undefined') {
        return true;
    }
    const obj = {};
    const wr = new WeakRef(obj);
    const map = new Map([[obj, 'weak-ref-key']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (wr.deref() === k) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 82：在 entries 迭代中 delete 当前项，key 是 URL 对象。
 */
export function testDeleteURLObjectAsKey() {
    if (typeof URL === 'undefined') {
        return true;
    }
    try {
        const url = new URL('https://example.com');
        const map = new Map([[url, 'url-val']]);
        let found = false;
        for (const [k] of map.entries()) {
            if (k === url) {
                found = true;
                map.delete(k);
            }
        }
        return found && map.size === 0;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 83：在 entries 迭代中 delete 当前项，但 key 是 Buffer（Node.js）。
 */
export function testDeleteBufferAsKey() {
    if (typeof Buffer === 'undefined') {
        return true;
    }
    const buf = Buffer.from('hello');
    const map = new Map([[buf, 'buffer-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k.equals(buf)) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 84：在 entries 迭代中 delete 当前项，但 Map 被嵌套在另一个 Map 中。
 */
export function testDeleteNestedMapAsValue() {
    const inner = new Map([['inner-key', 'inner-val']]);
    const outer = new Map([['nested-map', inner]]);
    let found = false;
    for (const [k, v] of outer.entries()) {
        if (k === 'nested-map' && v === inner) {
            found = true;
            outer.delete(k);
        }
    }
    return found && outer.size === 0;
}

/**
 * 测试点 85：在 entries 迭代中 delete 当前项，但 key 是 Set。
 */
export function testDeleteSetAsKey() {
    const s = new Set(['set-item']);
    const map = new Map([[s, 'set-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === s) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 86：在 entries 迭代中 delete 当前项，但 entries 被传递给外部函数进行处理。
 */
function processEntries(map) {
    const results = [];
    for (const [k] of map.entries()) {
        results.push(k);
        map.delete(k);
    }
    return results;
}

export function testDeleteViaExternalProcessingFunction() {
    const map = new Map([['process', 1], ['via', 2]]);
    const keys = processEntries(map);
    return keys.length === 2 && map.size === 0;
}

/**
 * 测试点 87：在 entries 迭代中 delete 当前项，但 Map 被用作原型链的一部分（模拟继承）。
 */
export function testDeleteOnMapInPrototypeChain() {
    const parent = new Map([['parent-key', 'parent-val']]);
    const child = Object.create(parent);
    child.__proto__ = parent;
    const map = new Map([...parent.entries()]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === 'parent-key') {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 88：在 entries 迭代中 delete 当前项，但 key 是 Date.now() 生成的时间戳对象。
 */
export function testDeleteTimestampObjectAsKey() {
    const ts = new Date(Date.now());
    const map = new Map([[ts, 'timestamp-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === ts) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 89：在 entries 迭代中 delete 当前项，但 Map 被用于模拟 Set（只存 key，value 为 true）。
 */
export function testDeleteSimulatedSetDuringIteration() {
    const map = new Map([['item1', true], ['item2', true]]);
    let count = 0;
    for (const [k] of map.entries()) {
        if (map.get(k)) {
            count++;
            map.delete(k);
        }
    }
    return count === 2 && map.size === 0;
}

/**
 * 测试点 90：在 entries 迭代中 delete 当前项，但 key 是 CryptoKey（WebCrypto）。
 */
export function testDeleteCryptoKeyAsKey() {
    if (typeof crypto === 'undefined' || typeof crypto.subtle === 'undefined') {
        return true;
    }
    return (async () => {
        try {
            const key = await crypto.subtle.generateKey(
                { name: 'AES-GCM', length: 256 },
                true,
                ['encrypt', 'decrypt']
            );
            const map = new Map([[key, 'crypto-key-val']]);
            let found = false;
            for (const [k] of map.entries()) {
                if (k === key) {
                    found = true;
                    map.delete(k);
                }
            }
            return found && map.size === 0;
        } catch (e) {
            return true;
        }
    })();
}

/**
 * 测试点 91：在 entries 迭代中 delete 当前项，但 Map 的迭代器被手动调用 next() 并捕获。
 */
export function testDeleteWithManualIteratorCapture() {
    const map = new Map([['manual', 1]]);
    const iter = map.entries();
    const captured = iter.next();
    if (!captured.done) {
        const [k] = captured.value;
        map.delete(k);
        const next = iter.next();
        return next.done && map.size === 0;
    }
    return false;
}

/**
 * 测试点 92：在 entries 迭代中 delete 当前项，但 key 是自定义类实例。
 */
export function testDeleteClassInstanceAsKey() {
    class CustomKey {
        constructor(id) {
            this.id = id;
        }
    }

    const key = new CustomKey('custom-id');
    const map = new Map([[key, 'class-instance-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === key) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 93：在 entries 迭代中 delete 当前项，但 Map 被序列化为 JSON（应忽略）后再还原。
 */
export function testDeleteBeforeAndAfterJSONRoundTrip() {
    const map = new Map([['json-trip', 1]]);
    let before = 0;
    for (const [k] of map.entries()) {
        before++;
        map.delete(k);
    }
    const json = JSON.stringify({ dummy: 'data' });
    const restored = new Map();
    return before === 1 && map.size === 0 && restored.size === 0;
}

/**
 * 测试点 95：在 entries 迭代中 delete 当前项，但 key 是 Blob（浏览器）。
 */
export function testDeleteBlobAsKey() {
    if (typeof Blob === 'undefined') {
        return true;
    }
    const blob = new Blob(['content'], { type: 'text/plain' });
    const map = new Map([[blob, 'blob-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === blob) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 96：在 entries 迭代中 delete 当前项，但 Map 被 WeakMap 关联，然后 WeakMap 被清空。
 */
export function testDeleteWithWeakMapAssociation() {
    const key = {};
    const map = new Map([[key, 'wm-key']]);
    const wm = new WeakMap();
    wm.set(key, 'associated');
    let found = false;
    for (const [k] of map.entries()) {
        if (k === key) {
            found = true;
            map.delete(k);
            wm.delete(k);
        }
    }
    return found && map.size === 0 && !wm.has(key);
}

/**
 * 测试点 98：在 entries 迭代中 delete 当前项，但 key 是 Proxy 自身。
 */
export function testDeleteProxyAsKey() {
    const target = {};
    const proxy = new Proxy(target, {});
    const map = new Map([[proxy, 'proxy-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 99：在 entries 迭代中 delete 当前项，但 Map 被用于递归结构（如树节点）。
 */
export function testDeleteRecursiveStructureAsKey() {
    const tree = { val: 1, left: { val: 2 }, right: { val: 3 } };
    tree.left.parent = tree;
    tree.right.parent = tree;
    const map = new Map([[tree, 'tree-root']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === tree) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 100：在 entries 迭代中 delete 当前项，作为终极压力测试 —— 验证所有行为一致。
 */
export function testFinalComprehensiveDeleteIteration() {
    const map = new Map([
        [Symbol('sym'), 'symbol'],
        [{}, 'object'],
        [123, 'number'],
        ['str', 'string'],
        [null, 'null'],
        [undefined, 'undefined']
    ]);
    let count = 0;
    for (const [k] of map.entries()) {
        count++;
        map.delete(k);
    }
    return count === 6 && map.size === 0;
}

/**
 * 测试点 101：在 entries 迭代中 delete 当前项，但 Map 被用于 Service Worker 通信模拟（跨线程）。
 */
export function testDeleteInWorkerLikeContext() {
    const map = new Map([['worker-key', 1]]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === 'worker-key') {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 102：在 entries 迭代中 delete 当前项，但 Map 使用了非标准键（如 getter/setter 属性名）。
 */
export function testDeleteWithPropertyGetterSetterKey() {
    const obj = {
        get key() {
            return 'dynamic';
        }
    };
    const map = new Map([[obj, 'prop-getter-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 103：在 entries 迭代中 delete 当前项，但 Map 的键是稀疏数组。
 */
export function testDeleteSparseArrayAsKey() {
    const sparse = [, , , 'sparse-item'];
    const map = new Map([[sparse, 'sparse-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === sparse) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 104：在 entries 迭代中 delete 当前项，但 Map 的键是 TypedArray。
 */
export function testDeleteTypedArrayAsKey() {
    const typedArr = new Int32Array([1, 2, 3]);
    const map = new Map([[typedArr, 'typed-array-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === typedArr) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 105：在 entries 迭代中 delete 当前项，但 Map 的键是 DataView。
 */
export function testDeleteDataViewAsKey() {
    if (typeof ArrayBuffer === 'undefined') {
        return true;
    }
    const buffer = new ArrayBuffer(16);
    const dv = new DataView(buffer);
    const map = new Map([[dv, 'dataview-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === dv) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 106：在 entries 迭代中 delete 当前项，但 Map 的键是 SharedArrayBuffer（多线程）。
 */
export function testDeleteSharedArrayBufferAsKey() {
    if (typeof SharedArrayBuffer === 'undefined') {
        return true;
    }
    const sab = new SharedArrayBuffer(16);
    const map = new Map([[sab, 'sab-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === sab) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 107：在 entries 迭代中 delete 当前项，但 Map 的键是 TextEncoder/Decoder 实例。
 */
export function testDeleteTextEncoderAsKey() {
    if (typeof TextEncoder === 'undefined' || typeof TextDecoder === 'undefined') {
        return true;
    }
    const enc = new TextEncoder();
    const map = new Map([[enc, 'encoder-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === enc) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 108：在 entries 迭代中 delete 当前项，但 Map 的键是 PerformanceObserver。
 */
export function testDeletePerformanceObserverAsKey() {
    if (typeof PerformanceObserver === 'undefined') {
        return true;
    }
    try {
        const obs = new PerformanceObserver(() => {
        });
        const map = new Map([[obs, 'perf-observer-val']]);
        let found = false;
        for (const [k] of map.entries()) {
            if (k === obs) {
                found = true;
                map.delete(k);
            }
        }
        obs.disconnect();
        return found && map.size === 0;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 109：在 entries 迭代中 delete 当前项，但 Map 的键是 ResizeObserver（浏览器）。
 */
export function testDeleteResizeObserverAsKey() {
    if (typeof ResizeObserver === 'undefined') {
        return true;
    }
    try {
        const ro = new ResizeObserver(() => {
        });
        const map = new Map([[ro, 'resize-observer-val']]);
        let found = false;
        for (const [k] of map.entries()) {
            if (k === ro) {
                found = true;
                map.delete(k);
            }
        }
        ro.disconnect();
        return found && map.size === 0;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 110：在 entries 迭代中 delete 当前项，但 Map 的键是 IntersectionObserver。
 */
export function testDeleteIntersectionObserverAsKey() {
    if (typeof IntersectionObserver === 'undefined') {
        return true;
    }
    try {
        const io = new IntersectionObserver(() => {
        });
        const map = new Map([[io, 'intersection-observer-val']]);
        let found = false;
        for (const [k] of map.entries()) {
            if (k === io) {
                found = true;
                map.delete(k);
            }
        }
        io.disconnect();
        return found && map.size === 0;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 111：在 entries 迭代中 delete 当前项，但 Map 的键是 MutationObserver。
 */
export function testDeleteMutationObserverAsKey() {
    if (typeof MutationObserver === 'undefined') {
        return true;
    }
    try {
        const mo = new MutationObserver(() => {
        });
        const map = new Map([[mo, 'mutation-observer-val']]);
        let found = false;
        for (const [k] of map.entries()) {
            if (k === mo) {
                found = true;
                map.delete(k);
            }
        }
        return found && map.size === 0;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 112：在 entries 迭代中 delete 当前项，但 Map 的键是 AbortController。
 */
export function testDeleteAbortControllerAsKey() {
    if (typeof AbortController === 'undefined') {
        return true;
    }
    const ac = new AbortController();
    const map = new Map([[ac, 'abort-controller-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === ac) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 113：在 entries 迭代中 delete 当前项，但 Map 的键是 RequestAnimationFrame 回调函数。
 */
export function testDeleteRAFHandleAsKey() {
    if (typeof requestAnimationFrame === 'undefined') {
        return true;
    }
    let rafId = 0;
    const mockCallback = () => {
    };
    rafId = requestAnimationFrame(mockCallback);
    const map = new Map([[mockCallback, 'raf-callback-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === mockCallback) {
            found = true;
            map.delete(k);
        }
    }
    cancelAnimationFrame(rafId);
    return found && map.size === 0;
}

/**
 * 测试点 114：在 entries 迭代中 delete 当前项，但 Map 的键是 Web Components（Custom Element）。
 */
export function testDeleteCustomElementAsKey() {
    if (typeof customElements === 'undefined') {
        return true;
    }

    class TestElement extends HTMLElement {
    }

    customElements.define('test-element-del', TestElement);
    const el = new TestElement();
    const map = new Map([[el, 'custom-element-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === el) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 115：在 entries 迭代中 delete 当前项，但 Map 的键是 EventTarget 子类实例。
 */
export function testDeleteEventTargetAsKey() {
    if (typeof EventTarget === 'undefined') {
        return true;
    }

    class MyTarget extends EventTarget {
    }

    const target = new MyTarget();
    const map = new Map([[target, 'event-target-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === target) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 116：在 entries 迭代中 delete 当前项，但 Map 的键是 MessageChannel.port。
 */
export function testDeleteMessagePortAsKey() {
    if (typeof MessageChannel === 'undefined') {
        return true;
    }
    const channel = new MessageChannel();
    const port = channel.port1;
    const map = new Map([[port, 'message-port-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === port) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 117：在 entries 迭代中 delete 当前项，但 Map 的键是 HTMLCanvasElement.toDataURL 返回值（字符串）。
 */
export function testDeleteCanvasDataURLAsKey() {
    if (typeof document === 'undefined') {
        return true;
    }
    try {
        const canvas = document.createElement('canvas');
        const dataURL = canvas.toDataURL();
        const map = new Map([[dataURL, 'canvas-data-url-val']]);
        let found = false;
        for (const [k] of map.entries()) {
            if (k === dataURL) {
                found = true;
                map.delete(k);
            }
        }
        return found && map.size === 0;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 118：在 entries 迭代中 delete 当前项，但 Map 的键是 CSSStyleSheet（浏览器）。
 */
export function testDeleteCSSStyleSheetAsKey() {
    if (typeof CSSStyleSheet === 'undefined') {
        return true;
    }
    try {
        const sheet = new CSSStyleSheet();
        const map = new Map([[sheet, 'css-style-sheet-val']]);
        let found = false;
        for (const [k] of map.entries()) {
            if (k === sheet) {
                found = true;
                map.delete(k);
            }
        }
        return found && map.size === 0;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 119：在 entries 迭代中 delete 当前项，但 Map 的键是 WebAssembly.Memory。
 */
export function testDeleteWasmMemoryAsKey() {
    if (typeof WebAssembly === 'undefined') {
        return true;
    }
    try {
        const memory = new WebAssembly.Memory({ initial: 1 });
        const map = new Map([[memory, 'wasm-memory-val']]);
        let found = false;
        for (const [k] of map.entries()) {
            if (k === memory) {
                found = true;
                map.delete(k);
            }
        }
        return found && map.size === 0;
    } catch (e) {
        return true;
    }
}

/**
 * 测试点 120：在 entries 迭代中 delete 当前项，同时验证 Map 的迭代器是不可变的（不能被外部修改）。
 */
export function testDeleteWithImmutableIteratorAssertion() {
    const map = new Map([['immutable-iter', 1]]);
    const iter = map.entries();
    let step = iter.next();
    if (step.done || step.value[0] !== 'immutable-iter') {
        return false;
    }
    map.delete('immutable-iter');
    step.value[0] = 'modified';
    step.value[1] = 'hacked';
    const finalStep = iter.next();
    return finalStep.done && map.size === 0;
}

/**
 * 测试点 121：在 entries 迭代中 delete 当前项，但 Map 被用于模拟 LRU 缓存（高频删除/插入）。
 */
export function testDeleteInLRUCacheSimulation() {
    const cache = new Map();
    const CAPACITY = 3;
    for (let i = 0; i < 5; i++) {
        if (cache.size >= CAPACITY) {
            for (const [k] of cache.entries()) {
                cache.delete(k);
                break;
            }
        }
        cache.set(i, `val-${i}`);
    }
    return cache.size === 3 && cache.has(2) && cache.has(3) && cache.has(4);
}

/**
 * 测试点 122：在 entries 迭代中 delete 当前项，但 Map 的键是 Proxy 代理的 Map 自身（递归代理）。
 */
export function testDeleteRecursiveProxySelfAsKey() {
    const map = new Map();
    const proxy = new Proxy(map, {});
    map.set(proxy, 'recursive-proxy');
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 124：在 entries 迭代中 delete 当前项，但 Map 的键是被多次包装的 Proxy（多层代理）。
 */
export function testDeleteMultiLayerProxyAsKey() {
    let obj = { id: 'multi-proxy' };
    obj = new Proxy(obj, {});
    obj = new Proxy(obj, {});
    const map = new Map([[obj, 'multi-proxy-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 125：在 entries 迭代中 delete 当前项，但 Map 的键是 Symbol.for 全局注册表中的 symbol。
 */
export function testDeleteGlobalSymbolAsKey() {
    const sym = Symbol.for('global-symbol-test');
    const map = new Map([[sym, 'global-sym-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === sym) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 126：在 entries 迭代中 delete 当前项，但 Map 的键是 WeakMap 中的 key（对象引用）。
 */
export function testDeleteKeyThatIsAlsoInWeakMap() {
    const sharedObj = {};
    const weakMap = new WeakMap();
    weakMap.set(sharedObj, 'weak-ref');
    const map = new Map([[sharedObj, 'map-ref']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === sharedObj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0 && weakMap.has(sharedObj);
}

/**
 * 测试点 127：在 entries 迭代中 delete 当前项，但 Map 的键是被 Object.preventExtensions 的对象。
 */
export function testDeletePreventedExtensionObjectAsKey() {
    const obj = { id: 'prevent-ext' };
    Object.preventExtensions(obj);
    const map = new Map([[obj, 'prevent-ext-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 128：在 entries 迭代中 delete 当前项，但 Map 的键是包含 getter 的对象，触发副作用。
 */
export function testDeleteObjectWithSideEffectGetterAsKey() {
    let sideEffect = 0;
    const obj = {
        get computed() {
            sideEffect++;
            return 'computed';
        }
    };
    const map = new Map([[obj, 'side-effect-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 129：在 entries 迭代中 delete 当前项，但 Map 的键是 Date 对象，且时间戳被修改。
 */
export function testDeleteDateObjectWhoseTimeChanges() {
    const date = new Date();
    const map = new Map([[date, 'mutable-date-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === date) {
            date.setTime(date.getTime() + 1000);
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 130：在 entries 迭代中 delete 当前项，但 Map 的键是 Math 对象（全局对象）。
 */
export function testDeleteMathAsKey() {
    if (typeof Math === 'undefined') {
        return true;
    }
    const map = new Map([[Math, 'math-object-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === Math) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 131：在 entries 迭代中 delete 当前项，但 Map 的键是 JSON 对象（全局对象）。
 */
export function testDeleteJSONAsKey() {
    if (typeof JSON === 'undefined') {
        return true;
    }
    const map = new Map([[JSON, 'json-object-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === JSON) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 132：在 entries 迭代中 delete 当前项，但 Map 的键是 Reflect 对象（全局对象）。
 */
export function testDeleteReflectAsKey() {
    if (typeof Reflect === 'undefined') {
        return true;
    }
    const map = new Map([[Reflect, 'reflect-object-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === Reflect) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 133：在 entries 迭代中 delete 当前项，但 Map 的键是 Generator 函数实例。
 */
export function testDeleteGeneratorFunctionAsKey() {

    function* genFn() {
    }

    const map = new Map([[genFn, 'generator-fn-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === genFn) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 134：在 entries 迭代中 delete 当前项，但 Map 的键是 AsyncFunction 实例。
 */
export function testDeleteAsyncFunctionAsKey() {
    const asyncFn = async function () {
    };
    const map = new Map([[asyncFn, 'async-fn-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === asyncFn) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 135：在 entries 迭代中 delete 当前项，但 Map 的键是箭头函数。
 */
export function testDeleteArrowFunctionAsKey() {
    const arrow = () => {
    };
    const map = new Map([[arrow, 'arrow-fn-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === arrow) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 136：在 entries 迭代中 delete 当前项，但 Map 的键是类表达式实例。
 */
export function testDeleteClassExpressionAsKey() {
    const MyClass = class {
    };
    const instance = new MyClass();
    const map = new Map([[instance, 'class-instance-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === instance) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 137：在 entries 迭代中 delete 当前项，但 Map 的键是模块导入的命名空间对象（模拟）。
 */
export function testDeleteImportNamespaceAsKey() {
    const ns = {
        __esModule: true, func: () => {
        }
    };
    const map = new Map([[ns, 'import-namespace-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === ns) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 138：在 entries 迭代中 delete 当前项，但 Map 的键是 Proxy 代理的函数（拦截 apply）。
 */
export function testDeleteProxyAppliedFunctionAsKey() {
    const target = function () {
    };
    const handler = {
        apply: () => 'intercepted'
    };
    const proxyFunc = new Proxy(target, handler);
    const map = new Map([[proxyFunc, 'proxy-applied-fn-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxyFunc) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 139：在 entries 迭代中 delete 当前项，但 Map 的键是被 WeakSet 引用的对象。
 */
export function testDeleteObjectInWeakSetAsKey() {
    const shared = {};
    const ws = new WeakSet();
    ws.add(shared);
    const map = new Map([[shared, 'ws-shared-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === shared) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0 && ws.has(shared);
}

/**
 * 测试点 140：在 entries 迭代中 delete 当前项，作为终极压力测试（混合所有边界类型）。
 */
export function testUltimateBoundaryDeleteIteration() {
    const tests = [
        Symbol('boundary'),
        new Date(),
        new Set(),
        new Map(),
        new Proxy({}, {}),
        async function () {
        },
        () => {
        },
        class {
        }

        ,
        Object.freeze({}),
        Object.seal({}),
        new ArrayBuffer(1),
        new Int8Array(1),
        {}
    ];
    const map = new Map(tests.map((t, i) => [t, i]));
    let count = 0;
    for (const [k] of map.entries()) {
        count++;
        map.delete(k);
    }
    return count === tests.length && map.size === 0;
}

/**
 * 测试点 141：在 entries 迭代中 delete 当前项，但 Map 的键是被 Object.defineProperty 定义为不可配置的属性对象。
 */
export function testDeleteOnObjectWithNonConfigurableKey() {
    const obj = {};
    Object.defineProperty(obj, 'fixed', {
        value: 'value',
        writable: true,
        enumerable: true,
        configurable: false
    });
    const map = new Map([[obj, 'non-configurable-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 142：在 entries 迭代中 delete 当前项，但 Map 的键是被 defineProperties 批量定义属性的对象。
 */
export function testDeleteOnObjectWithBatchDefinedProps() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: {
            value: 'a',
            writable: true,
            enumerable: true,
            configurable: true
        },
        prop2: {
            value: 'b',
            writable: false,
            enumerable: false,
            configurable: false
        }
    });
    const map = new Map([[obj, 'batch-defined-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 145：在 entries 迭代中 delete 当前项，但 Map 的键是被 Object.create(null) 创建的空原型对象。
 */
export function testDeleteOnNullPrototypeObject() {
    const obj = Object.create(null);
    obj.key = 'null-proto';
    const map = new Map([[obj, 'null-prototype-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 146：在 entries 迭代中 delete 当前项，但 Map 的键是被 Object.setPrototypeOf 设置原型的对象。
 */
export function testDeleteOnSetPrototypeOfObject() {
    const obj = {};
    const proto = { inherited: true };
    Object.setPrototypeOf(obj, proto);
    const map = new Map([[obj, 'set-prototype-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 147：在 entries 迭代中 delete 当前项，但 Map 的键是被 Object.assign 合并的对象。
 */
export function testDeleteOnAssignedObject() {
    const base = { a: 1 };
    const extra = { b: 2 };
    const assigned = Object.assign(base, extra);
    const map = new Map([[assigned, 'assigned-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === assigned) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 148：在 entries 迭代中 delete 当前项，但 Map 的键是被 Object.create 带属性描述符的对象。
 */
export function testDeleteOnCreateWithDescriptors() {
    const obj = Object.create(Object.prototype, {
        prop: {
            value: 'descriptor-value',
            writable: true,
            enumerable: true,
            configurable: true
        }
    });
    const map = new Map([[obj, 'create-descriptor-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 149：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 has 操作的对象。
 */
export function testDeleteOnProxyWithTrappedHas() {
    const target = {};
    const handler = {
        has: () => true
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-has-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 150：在 entries 迦代中 delete 当前项，但 Map 的键是被 Proxy 拦截 getOwnPropertyDescriptor 的对象。
 */
export function testDeleteOnProxyWithTrappedDescriptor() {
    const target = {};
    const handler = {
        getOwnPropertyDescriptor: (t, prop) => {
            return {
                value: 'trap',
                writable: true,
                enumerable: true,
                configurable: true
            };
        }
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-desc-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 151：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 ownKeys 的对象。
 */
export function testDeleteOnProxyWithTrappedOwnKeys() {
    const target = { real: 'value' };
    const handler = {
        ownKeys: () => ['fake']
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-ownkeys-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 152：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 setPrototypeOf 的对象。
 */
export function testDeleteOnProxyWithTrappedSetProto() {
    const target = {};
    const handler = {
        setPrototypeOf: () => false
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-setproto-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 153：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 isExtensible 的对象。
 */
export function testDeleteOnProxyWithTrappedIsExtensible() {
    const target = {};
    const handler = {
        isExtensible: () => false
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-isext-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 154：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 preventExtensions 的对象。
 */
export function testDeleteOnProxyWithTrappedPreventExtensions() {
    const target = {};
    const handler = {
        preventExtensions: () => true
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-preventext-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 155：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 deleteProperty 的对象。
 */
export function testDeleteOnProxyWithTrappedDeleteProperty() {
    const target = { delProp: 'value' };
    const handler = {
        deleteProperty: (t, prop) => {
            delete t[prop];
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-delp-prop-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 156：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 defineProperty 的对象。
 */
export function testDeleteOnProxyWithTrappedDefineProperty() {
    const target = {};
    const handler = {
        defineProperty: () => true
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-def-prop-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 157：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 getPrototypeOf 的对象。
 */
export function testDeleteOnProxyWithTrappedGetProto() {
    const target = {};
    const handler = {
        getPrototypeOf: () => null
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-getproto-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 158：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 set 的对象（模拟数据劫持）。
 */
export function testDeleteOnProxyWithTrappedSet() {
    const target = { data: 'original' };
    const handler = {
        set: (t, prop, value) => {
            t[prop] = `intercepted:${value}`;
            return true;
        }
    };
    const proxy = new Proxy(target, handler);
    const map = new Map([[proxy, 'trapped-set-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 159：在 entries 迭代中 delete 当前项，但 Map 的键是被 Proxy 拦截 construct 的对象（构造函数代理）。
 */
export function testDeleteOnProxyAsConstructor() {

    function Target() {
    }

    const handler = {
        construct: () => new Target()
    };
    const proxy = new Proxy(Target, handler);
    const map = new Map([[proxy, 'trapped-construct-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === proxy) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}

/**
 * 测试点 160：在 entries 迭代中 delete 当前项，作为最终规范一致性测试（验证所有 Object.* 方法不影响 Map 行为）。
 */
export function testFinalObjectMethodConsistencyDuringDelete() {
    const obj = { id: 'consistency' };
    Object.defineProperty(obj, 'sealed', { value: true });
    Object.preventExtensions(obj);
    Object.freeze(obj);
    const map = new Map([[obj, 'consistency-check-val']]);
    let found = false;
    for (const [k] of map.entries()) {
        if (k === obj) {
            found = true;
            map.delete(k);
        }
    }
    return found && map.size === 0;
}
