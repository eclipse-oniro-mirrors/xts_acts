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
 * 测试点1：在 for...of (values()) 迭代中调用 pop()
 */
export function testPopDuringIteration() {
    try {
        const arr = [1, 2, 3, 4, 5];
        const visited = [];
        for (const value of arr.values()) {
            visited.push(value);
            arr.pop();
        }
        return visited.length == 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点2：在 for...of (values()) 迭代中调用 push()
 */
export function testPushDuringIteration() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const value of arr.values()) {
            visited.push(value);
            if (value === 2) {
                arr.push(4);
            }
        }
        return visited.length === 4 && visited[3] === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试点3：在 for...of (values()) 迭代中调用 splice()
 */
export function testSpliceDuringIteration() {
    try {
        const arr = [1, 2, 3, 4, 5];
        const visited = [];
        for (const value of arr.values()) {
            visited.push(value);
            if (value === 2) {
                arr.splice(2, 1);
            }
        }
        return visited.length === 4 && visited[2] === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试4：在 values() 迭代中连续 push 多次
 */
export function testPushMultipleDuringIteration() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(2, 3, 4);
            }
        }
        return visited.length === 4 && visited[3] === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试5：在 values() 迭代中 pop 导致数组变空
 */
export function testPopToEmptyDuringIteration() {
    try {
        const arr = [1, 2];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.pop();
            arr.pop();
        }
        return visited.length === 1 && visited[0] === 1;
    } catch (e) {
        return false;
    }
}

/**
 * 测试6：splice 删除当前元素（通过索引模拟）
 * 注意：values() 不提供索引，但可通过外部计数模拟
 */
export function testSpliceCurrentElement() {
    try {
        const arr = [10, 20, 30];
        const visited = [];
        let index = 0;
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 20) {
                arr.splice(index, 1);
            } else {
                index++;
            }
        }
        return visited.length === 2 && visited[1] === 20;
    } catch (e) {
        return false;
    }
}

/**
 * 测试7：迭代空数组并 push
 */
export function testIterateEmptyThenPush() {
    try {
        const arr = [];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
        }
        arr.push(1);
        return visited.length === 0;
    } catch (e) {
        return false;
    }
}

/**
 * 测试8：在迭代中 push 同一个值多次，检查是否全部访问
 */
export function testPushSameValueRepeatedly() {
    try {
        const arr = [0];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (visited.length < 5) {
                arr.push(99);
            }
        }
        return visited.length === 5 && visited.every((x, i) => i === 0 ? x === 0 : x === 99);
    } catch (e) {
        return false;
    }
}

/**
 * 测试9：在迭代中 splice 插入元素（而非删除）
 */
export function testSpliceInsertDuringIteration() {
    try {
        const arr = [1, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.splice(1, 0, 2);
            }
        }
        return visited.length === 3 && visited[1] === 2 && visited[2] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试10：在迭代中交替 push 和 pop
 */
export function testPushAndPopAlternating() {
    try {
        const arr = [1, 2];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.push(v + 10);
            arr.pop();
        }
        return visited.length === 2 && visited[0] === 1 && visited[1] === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试11：在迭代中 splice 删除多个后续元素
 */
export function testSpliceRemoveMultipleAhead() {
    try {
        const arr = [1, 2, 3, 4, 5];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(2, 3);
            }
        }
        return visited.length === 2 && visited[1] === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试12：在迭代中对数组清空（arr.length = 0），但不使用 pop/splice
 * 虽然题目要求 pop/push/splice，但 length=0 会间接影响，此处仅作对比（不计入核心）
 * 改为使用 splice 清空
 */
export function testSpliceClearDuringIteration() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.splice(0);
            }
        }
        return visited.length === 1 && visited[0] === 1;
    } catch (e) {
        return false;
    }
}

/**
 * 测试13：在迭代中 push 然后立即 pop（净效果无变化）
 */
export function testPushThenPopImmediately() {
    try {
        const arr = [1, 2];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.push(999);
            arr.pop();
        }
        return visited.length === 2 && visited[1] === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试14：在迭代中 splice 替换元素（删除1个插入1个）
 */
export function testSpliceReplaceOne() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(1, 1, 20);
            }
        }
        return visited.length === 3 && visited[1] === 2 && visited[2] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试15：在迭代中多次 splice 插入，导致数组增长
 */
export function testMultipleSpliceInserts() {
    try {
        const arr = [0];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 0) {
                arr.splice(1, 0, 1, 2);
            } else if (v === 1) {
                arr.splice(3, 0, 3);
            }
        }
        return visited.length === 4 && visited[3] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试16：在迭代中 pop 到只剩一个元素，然后 push 回来
 */
export function testPopThenPushBack() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.pop();
                arr.pop();
                arr.push(4);
            }
        }
        return visited.length === 2 && visited[1] === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试17：在迭代中对数组进行复杂 splice（先删后插）
 */
export function testComplexSpliceDuringIteration() {
    try {
        const arr = [1, 2, 3, 4];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(1, 2, 20, 30, 40);
            }
        }
        return visited.length === 5 && visited[2] === 30 && visited[4] === 4;
    } catch (e) {
        return false;
    }
}

/**
 * 测试18：在迭代中 push 一个数组（作为单个元素）
 */
export function testPushArrayElement() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push([2, 3]);
            }
        }
        return visited.length === 2 && Array.isArray(visited[1]) && visited[1][0] === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试19：在迭代中使用 splice 删除前面已访问的元素（不影响后续）
 */
export function testSpliceDeletePrevious() {
    try {
        const arr = [1, 2, 3, 4];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 3) {
                arr.splice(0, 1);
            }
        }
        return visited.length === 3 && visited[2] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试20：在迭代中同时 push 和 splice
 */
export function testPushAndSpliceTogether() {
    try {
        const arr = [1, 2];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(5);
                arr.splice(1, 0, 10);
            }
        }
        return visited.length === 4 && visited[1] === 10 && visited[3] === 5;
    } catch (e) {
        return false;
    }
}

/**
 * 测试21：在 values() 迭代中 push(undefined)
 */
export function testPushUndefinedDuringIteration() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(undefined);
            }
        }
        return visited.length === 2 && visited[1] === undefined;
    } catch (e) {
        return false;
    }
}

/**
 * 测试22：在 values() 迭代中 push(NaN)
 */
export function testPushNaNDuringIteration() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(NaN);
            }
        }
        return visited.length === 2 && Number.isNaN(visited[1]);
    } catch (e) {
        return false;
    }
}

/**
 * 测试23：在迭代中多次 pop 导致长度变为负数（实际不会，但测试边界）
 */
export function testPopBeyondZero() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.pop();
            arr.pop();
            arr.pop();
        }
        return visited.length === 1 && arr.length === 0;
    } catch (e) {
        return false;
    }
}

/**
 * 测试24：在迭代中 splice 插入大量元素（性能边界，但逻辑应正常）
 */
export function testSpliceInsertMany() {
    try {
        const arr = [0];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 0) {
                arr.splice(1, 0, ...Array(100).fill(9));
            }
        }
        return visited.length === 101 && visited[100] === 9;
    } catch (e) {
        return false;
    }
}

/**
 * 测试25：在迭代中先 push 再 splice 删除刚 push 的元素
 */
export function testPushThenSpliceNewElement() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(2);
                arr.splice(-1, 1);
            }
        }
        return visited.length === 1 && arr.length === 1;
    } catch (e) {
        return false;
    }
}

/**
 * 测试26：在迭代中对数组进行 reverse 后再 pop（虽未要求 reverse，但组合 pop）
 * 改为仅使用 pop/splice/push —— 此处用 splice 模拟局部反转效果
 * 实际改为：splice 删除中间并重新插入顺序
 */
export function testSpliceReorderDuringIteration() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(1, 2, 3, 2);
            }
        }
        return visited.length === 3 && visited[2] === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试27：在迭代中 push 一个对象，检查引用一致性
 */
export function testPushObjectDuringIteration() {
    try {
        const obj = { id: 1 };
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(obj);
            }
        }
        return visited.length === 2 && visited[1] === obj;
    } catch (e) {
        return false;
    }
}

/**
 * 测试28：在迭代中同时 pop 和 push（队列行为）
 */
export function testQueueLikeOperation() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (arr.length > 1) {
                arr.shift();
            }
        }
        const arr2 = [1, 2, 3];
        const visited2 = [];
        for (const v of arr2.values()) {
            visited2.push(v);
            if (v === 2) {
                const last = arr2.pop();
                arr2.push(last);
            }
        }
        return visited2.length === 3 && visited2[2] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试29：在迭代中 splice 删除当前及后续所有元素
 */
export function testSpliceRemoveFromCurrentToEnd() {
    try {
        const arr = [1, 2, 3, 4];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(1);
            }
        }
        return visited.length === 2 && visited[1] === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试30：在迭代中 push 然后立即 splice 删除它
 */
export function testPushAndImmediatelySpliceOut() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(99);
                arr.splice(arr.length - 1, 1);
            }
        }
        return visited.length === 1 && arr.length === 1;
    } catch (e) {
        return false;
    }
}

/**
 * 测试31：在迭代中对空数组执行 pop（无影响）
 */
export function testPopOnEmptyDuringIteration() {
    try {
        const arr = [];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.pop();
        }
        return visited.length === 0 && arr.length === 0;
    } catch (e) {
        return false;
    }
}

/**
 * 测试32：在迭代中多次交替 push 和 pop（净增长为0）
 */
export function testAlternatingPushPopNoNetChange() {
    try {
        const arr = [1, 2];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.push(v);
            arr.pop();
        }
        return visited.length === 2 && arr.length === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试34：在迭代中 push 一个函数
 */
export function testPushFunctionDuringIteration() {
    try {
        const fn = () => 'test';
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(fn);
            }
        }
        return visited.length === 2 && visited[1] === fn;
    } catch (e) {
        return false;
    }
}

/**
 * 测试35：在迭代中 splice 删除前面元素导致当前元素“前移”，但已访问过，不影响
 */
export function testSpliceDeleteBeforeCurrent() {
    try {
        const arr = [0, 1, 2, 3];
        const visited = [];
        let index = 0;
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(0, 2);
            }
            index++;
        }
        return visited.length === 3 && visited[2] === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试36：在迭代中对数组赋值（arr[i]=x）+ splice（混合修改）
 * 虽然赋值不是 pop/push/splice，但题目聚焦这三个，所以避免赋值
 * 改为：仅用 splice 替换
 */
export function testSpliceReplaceWithDifferentType() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(1, 1, "two", null);
            }
        }
        return visited.length === 4 && visited[2] === null && visited[3] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试37：在迭代中 push 一个负数
 */
export function testPushNegativeNumber() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(-5);
            }
        }
        return visited.length === 2 && visited[1] === -5;
    } catch (e) {
        return false;
    }
}

/**
 * 测试38：在迭代中连续 splice 多次
 */
export function testMultipleSpliceCalls() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(1, 1, 20);
                arr.splice(2, 0, 30);
            }
        }
        return visited.length === 4 && visited[2] === 30 && visited[3] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试39：在迭代中 pop 后立即 push 不同值（模拟栈替换）
 */
export function testPopThenPushDifferent() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.pop();
                arr.push(99);
            }
        }
        return visited.length === 3 && visited[2] === 99;
    } catch (e) {
        return false;
    }
}

/**
 * 测试40：在迭代中使用 splice 删除自身（通过值查找索引）
 */
export function testSpliceRemoveCurrentValue() {
    try {
        const arr = [10, 20, 30];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            const idx = arr.indexOf(v);
            if (idx !== -1 && v === 20) {
                arr.splice(idx, 1);
            }
        }
        return visited.length === 2 && visited[1] === 20;
    } catch (e) {
        return false;
    }
}

/**
 * 测试41：在迭代中 push(Symbol)
 */
export function testPushSymbolDuringIteration() {
    try {
        const sym = Symbol('test');
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(sym);
            }
        }
        return visited.length === 2 && visited[1] === sym;
    } catch (e) {
        return false;
    }
}

/**
 * 测试42：在迭代中 push(BigInt)
 */
export function testPushBigIntDuringIteration() {
    try {
        const big = 123n;
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(big);
            }
        }
        return visited.length === 2 && visited[1] === big;
    } catch (e) {
        return false;
    }
}

/**
 * 测试43：单元素数组，在迭代中 pop 后 push 回相同值
 */
export function testPopAndPushSameValueInSingleElement() {
    try {
        const arr = [42];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.pop();
            arr.push(42);
        }
        return visited.length === 1 && visited[0] === 42;
    } catch (e) {
        return false;
    }
}

/**
 * 测试44：在迭代中 splice 插入自身（浅拷贝引用）
 */
export function testSpliceInsertSelfReference() {
    try {
        const arr = [1, 2];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(2, 0, arr);
            }
        }
        return visited.length === 3 && visited[2] === arr;
    } catch (e) {
        return false;
    }
}

/**
 * 测试45：在迭代中多次 push 相同对象（验证引用一致性）
 */
export function testPushSameObjectMultipleTimes() {
    try {
        const obj = { x: 1 };
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(obj, obj, obj);
            }
        }
        return (
            visited.length === 4 &&
                visited[1] === obj &&
                visited[2] === obj &&
                visited[3] === obj
        );
    } catch (e) {
        return false;
    }
}

/**
 * 测试46：在迭代中 pop 导致长度为1，然后 splice 插入到末尾
 */
export function testPopThenSpliceAtEnd() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.pop();
                arr.splice(arr.length, 0, 99);
            }
        }
        return visited.length === 3 && visited[2] === 99;
    } catch (e) {
        return false;
    }
}

/**
 * 测试47：在迭代中 push(undefined) 多次，检查是否都被访问
 */
export function testPushMultipleUndefined() {
    try {
        const arr = [0];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 0) {
                arr.push(undefined, undefined);
            }
        }
        return visited.length === 3 && visited[1] === undefined && visited[2] === undefined;
    } catch (e) {
        return false;
    }
}

/**
 * 测试48：在迭代中 splice 删除当前元素后立即 push 新元素
 */
export function testSpliceDeleteCurrentThenPush() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        let index = 0;
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(index, 1);
                arr.push(200);
            } else {
                index++;
            }
        }
        return visited.length === 3 && visited[2] === 200;
    } catch (e) {
        return false;
    }
}

/**
 * 测试50：在迭代中 push 一个包含 NaN 的数组
 */
export function testPushArrayWithNaN() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push([NaN]);
            }
        }
        return (
            visited.length === 2 &&
            Array.isArray(visited[1]) &&
            Number.isNaN(visited[1][0])
        );
    } catch (e) {
        return false;
    }
}

/**
 * 测试51：在迭代中 pop 到空，然后 push 多个，验证是否继续迭代
 */
export function testPopToEmptyThenPushMany() {
    try {
        const arr = [1, 2];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.pop();
            arr.pop();
            if (v === 1) {
                arr.push(10, 20, 30);
            }
        }
        return visited.length === 2 && visited[1] === 20;
    } catch (e) {
        return false;
    }
}

/**
 * 测试52：在迭代中 splice 替换为函数、对象、数组混合
 */
export function testSpliceMixedTypes() {
    try {
        const arr = [0];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 0) {
                arr.splice(0, 1, () => {
                }, { a: 1 }, [1, 2]);
            }
        }
        return (
            visited.length === 3 &&
                typeof visited[0] === 'number' &&
                visited[1].a === 1 &&
            Array.isArray(visited[2]) &&
                visited[2][1] === 2
        );
    } catch (e) {
        return false;
    }
}

/**
 * 测试53：在迭代中 push 正无穷和负无穷
 */
export function testPushInfinityValues() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(Infinity, -Infinity);
            }
        }
        return (
            visited.length === 3 &&
                visited[1] === Infinity &&
                visited[2] === -Infinity
        );
    } catch (e) {
        return false;
    }
}

/**
 * 测试54：在迭代中对只读属性的数组（通过 Object.freeze）调用 pop（应静默失败）
 * 注意：freeze 后 pop/splice 会失败（在严格模式抛错），但非严格模式静默
 * 为安全，我们不在 freeze 上操作，改为测试普通数组
 * 改为：测试在迭代中修改 length 属性（但题目限制方法，所以跳过）
 * 改为：测试重复值场景
 */
export function testDuplicateValuesWithSplice() {
    try {
        const arr = [5, 5, 5];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 5 && visited.length === 2) {
                arr.splice(1, 1);
            }
        }
        return visited.length === 2 && visited[1] === 5;
    } catch (e) {
        return false;
    }
}

/**
 * 测试55：在迭代中 push 一个 Proxy 对象
 */
export function testPushProxyDuringIteration() {
    try {
        const handler = { get: () => 42 };
        const proxy = new Proxy({}, handler);
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(proxy);
            }
        }
        return visited.length === 2 && visited[1] === proxy;
    } catch (e) {
        return false;
    }
}

/**
 * 测试56：在迭代中连续 pop 直到只剩一个，然后 splice 插入多个
 */
export function testPopToSingleThenSpliceMany() {
    try {
        const arr = [1, 2, 3, 4];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                while (arr.length > 1) {
                    arr.pop();
                }
                arr.splice(1, 0, 10, 20, 30);
            }
        }
        return visited.length === 4 && visited[2] === 20 && visited[3] === 30;
    } catch (e) {
        return false;
    }
}

/**
 * 测试57：在迭代中 push 一个带有 toString 的对象
 */
export function testPushCustomToStringObject() {
    try {
        const obj = { toString: () => 'custom' };
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(obj);
            }
        }
        return visited.length === 2 && visited[1] === obj;
    } catch (e) {
        return false;
    }
}

/**
 * 测试58：在迭代中 splice 删除末尾多个元素
 */
export function testSpliceRemoveFromEnd() {
    try {
        const arr = [1, 2, 3, 4, 5];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 3) {
                arr.splice(-2, 2);
            }
        }
        return visited.length === 3 && visited[2] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试59：在迭代中 push 空数组
 */
export function testPushEmptyArray() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push([]);
            }
        }
        return visited.length === 2 && Array.isArray(visited[1]) && visited[1].length === 0;
    } catch (e) {
        return false;
    }
}

/**
 * 测试60：在迭代中先 splice 插入，再 pop，再 push（复杂组合）
 */
export function testComplexPushPopSpliceCombo() {
    try {
        const arr = [0];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 0) {
                arr.splice(1, 0, 1, 2);
                arr.pop();
                arr.push(3);
            }
        }
        return visited.length === 3 && visited[1] === 1 && visited[2] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试61：在迭代中 splice 插入零个元素（即仅删除）
 */
export function testSpliceInsertZeroElements() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(1, 1);
            }
        }
        return visited.length === 2 && visited[1] === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试62：在迭代中 push 后立即 break，验证是否影响原数组
 */
export function testPushThenBreak() {
    try {
        const arr = [1, 2];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(99);
                break;
            }
        }
        return visited.length === 1 && arr.length === 3 && arr[2] === 99;
    } catch (e) {
        return false;
    }
}

/**
 * 测试63：在迭代中多次 splice 到同一位置（覆盖式插入）
 */
export function testMultipleSpliceSameIndex() {
    try {
        const arr = [0];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 0) {
                arr.splice(1, 0, 'a');
                arr.splice(1, 0, 'b');
            }
        }
        return visited.length === 3 && visited[1] === 'b' && visited[2] === 'a';
    } catch (e) {
        return false;
    }
}

/**
 * 测试64：在迭代中 pop 后数组变空，再 push，但不继续访问（因 break）
 */
export function testPopToEmptyThenPushWithBreak() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.pop();
            arr.push(42);
            break;
        }
        return visited.length === 1 && arr[0] === 42;
    } catch (e) {
        return false;
    }
}

/**
 * 测试65：在迭代中 splice 使用负索引（从末尾计算）
 */
export function testSpliceWithNegativeIndex() {
    try {
        const arr = [1, 2, 3, 4];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(-1, 1, 99);
            }
        }
        return visited.length === 4 && visited[3] === 99;
    } catch (e) {
        return false;
    }
}

/**
 * 测试66：在迭代中 push 多个 null 值
 */
export function testPushMultipleNulls() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(null, null, null);
            }
        }
        return visited.length === 4 && visited[1] === null && visited[3] === null;
    } catch (e) {
        return false;
    }
}

/**
 * 测试67：在迭代中 splice 删除超出范围的元素（应静默处理）
 */
export function testSpliceOutOfRangeDeletion() {
    try {
        const arr = [1, 2];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.splice(10, 5);
            }
        }
        return visited.length === 2 && arr.length === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试68：在迭代中先 push，再 splice 删除刚 push 的部分
 */
export function testPushThenPartialSpliceRemove() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(2, 3, 4, 5);
                arr.splice(-2, 2);
            }
        }
        return visited.length === 3 && visited[2] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试69：在迭代中对单元素数组反复 pop/push（震荡）
 */
export function testOscillatingPopPushOnSingleElement() {
    try {
        const arr = [7];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.pop();
            arr.push(8);
            arr.pop();
            arr.push(9);
        }
        return visited.length === 1 && visited[0] === 7 && arr[0] === 9;
    } catch (e) {
        return false;
    }
}

/**
 * 测试70：在迭代中 splice 插入包含自身引用的数组（浅循环）
 */
export function testSpliceInsertCircularReference() {
    try {
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.splice(1, 0, [arr]);
            }
        }
        return visited.length === 2 && Array.isArray(visited[1]) && visited[1][0] === arr;
    } catch (e) {
        return false;
    }
}

/**
 * 测试71：在迭代中 push 一个正则表达式字面量
 */
export function testPushRegExpDuringIteration() {
    try {
        const re = /abc/g;
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(re);
            }
        }
        return visited.length === 2 && visited[1] === re;
    } catch (e) {
        return false;
    }
}

/**
 * 测试72：在迭代中连续 push 相同原始值（如字符串）
 */
export function testPushSameStringMultipleTimes() {
    try {
        const arr = [0];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 0) {
                arr.push('hello', 'hello', 'hello');
            }
        }
        return (
            visited.length === 4 &&
                visited[1] === 'hello' &&
                visited[2] === 'hello' &&
                visited[3] === 'hello'
        );
    } catch (e) {
        return false;
    }
}

/**
 * 测试73：在迭代中 splice 删除第一个元素（导致整体前移）
 */
export function testSpliceRemoveFirstElementDuringIteration() {
    try {
        const arr = [10, 20, 30];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 10) {
                arr.splice(0, 1);
            }
        }
        return visited.length === 2 && visited[1] === 30;
    } catch (e) {
        return false;
    }
}

/**
 * 测试74：在迭代中 push 一个 Date 对象
 */
export function testPushDateObject() {
    try {
        const now = new Date();
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(now);
            }
        }
        return visited.length === 2 && visited[1] === now;
    } catch (e) {
        return false;
    }
}

/**
 * 测试75：在迭代中 pop 后立即 splice 插入到开头
 */
export function testPopThenSpliceAtStart() {
    try {
        const arr = [1, 2, 3];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 2) {
                arr.pop();
                arr.splice(0, 0, -1);
            }
        }
        return visited.length === 3 && visited[2] === 2;
    } catch (e) {
        return false;
    }
}

/**
 * 测试76：在迭代中 push 一个 Error 对象
 */
export function testPushErrorObject() {
    try {
        const err = new Error('test');
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(err);
            }
        }
        return visited.length === 2 && visited[1] === err;
    } catch (e) {
        return false;
    }
}

/**
 * 测试77：在迭代中 splice 插入大量不同类型的值
 */
export function testSpliceInsertHeterogeneousValues() {
    try {
        const arr = [0];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 0) {
                arr.splice(1, 0, 42, 'str', true, null, undefined, Symbol('s'), 123n);
            }
        }
        return (
            visited.length === 8 &&
                visited[1] === 42 &&
                visited[2] === 'str' &&
                visited[3] === true &&
                visited[4] === null &&
                visited[5] === undefined &&
                typeof visited[6] === 'symbol' &&
                visited[7] === 123n
        );
    } catch (e) {
        return false;
    }
}

/**
 * 测试78：在迭代中对空数组 push 后立即 pop（净空）
 */
export function testPushThenPopOnOriginallyEmpty() {
    try {
        const arr = [];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            arr.push(1);
            arr.pop();
        }
        return visited.length === 0 && arr.length === 0;
    } catch (e) {
        return false;
    }
}

/**
 * 测试79：在迭代中 splice 删除当前及前一个元素（通过外部索引）
 */
export function testSpliceRemoveCurrentAndPrevious() {
    try {
        const arr = [1, 2, 3, 4];
        const visited = [];
        let index = 0;
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 3) {
                arr.splice(index - 1, 2);
            } else {
                index++;
            }
        }
        return visited.length === 3 && visited[2] === 3;
    } catch (e) {
        return false;
    }
}

/**
 * 测试80：在迭代中 push 一个 Map 对象
 */
export function testPushMapObject() {
    try {
        const map = new Map([['key', 'value']]);
        const arr = [1];
        const visited = [];
        for (const v of arr.values()) {
            visited.push(v);
            if (v === 1) {
                arr.push(map);
            }
        }
        return visited.length === 2 && visited[1] === map && visited[1].get('key') === 'value';
    } catch (e) {
        return false;
    }
}
