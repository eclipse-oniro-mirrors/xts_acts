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
 * 测试点 1: 使用 Proxy 拦截数组读取操作，在访问索引 i 时自动返回 slice(0, i+1)
 * 验证：访问 proxied[2] 应返回 [10, 20, 30]
 */
export function testProxySliceOnGet() {
    const originalArray = [10, 20, 30, 40, 50];
    const handler = {
        get(target, prop) {
            const index = Number(prop);
            if (!isNaN(index) && index >= 0 && index < target.length) {
                return target.slice(0, index + 1);
            }
            return Reflect.get(target, prop);
        }
    };

    const proxiedArray = new Proxy(originalArray, handler);

    const result = JSON.stringify(proxiedArray[2]) === JSON.stringify([10, 20, 30]);
    return result;
}

/**
 * 测试点 2: 使用 Proxy 拦截写入操作，确保数组长度不超过 3（通过 slice 截断）
 * 验证：连续 push 5 个元素后，数组应为 [3, 4, 5]
 */
export function testProxySliceOnSet() {
    const maxSize = 3;
    const originalArray = [];
    const handler = {
        set(target, prop, value) {
            target[prop] = value;

            if ((typeof prop === 'string' && !isNaN(Number(prop))) || prop === 'length') {
                if (target.length > maxSize) {
                    const trimmed = target.slice(-maxSize);
                    target.length = 0;
                    trimmed.forEach((item, i) => (target[i] = item));
                }
            }
            return true;
        }
    };

    const proxiedArray = new Proxy(originalArray, handler);

    proxiedArray.push(1);
    proxiedArray.push(2);
    proxiedArray.push(3);
    proxiedArray.push(4);
    proxiedArray.push(5);

    const expected = [3, 4, 5];
    const result = JSON.stringify(proxiedArray) === JSON.stringify(expected);
    return result;
}

/**
 * 测试点 3: 使用 Proxy 自定义 slice 方法行为：
 * 当调用 .slice() 无参数时，返回原数组中偶数索引的元素（0, 2, 4...）
 * 验证：对 [1, 2, 3, 4, 5] 调用 .slice() 应返回 [1, 3, 5]
 */
export function testProxyCustomSliceMethod() {
    const originalArray = [1, 2, 3, 4, 5];
    const handler = {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {

                    if (arguments.length === 0) {
                        const evenIndexElements = [];
                        for (let i = 0; i < target.length; i += 2) {
                            evenIndexElements.push(target[i]);
                        }
                        return evenIndexElements;
                    }

                    return Array.prototype.slice.call(target, start, end);
                };
            }
            return Reflect.get(target, prop);
        }
    };

    const proxiedArray = new Proxy(originalArray, handler);
    const customSliceResult = proxiedArray.slice();
    const expected = [1, 3, 5];

    const result = JSON.stringify(customSliceResult) === JSON.stringify(expected);
    return result;
}

/**
 * 测试点 4: Proxy 返回只读 slice 视图（禁止修改）
 */
export function testProxyReadOnlySliceView() {
    const original = [1, 2, 3];
    const view = new Proxy(original, {
        get(target, prop) {
            if (prop === 'slice') {
                return (...args) => Object.freeze(Array.prototype.slice.call(target, ...args));
            }
            return Reflect.get(target, prop);
        },
        set() {
            throw new Error('Read-only');
        }
    });

    const sliced = view.slice(0, 2);
    let success = true;
    try {
        sliced[0] = 99;
        if (sliced[0] !== 1) {
            success = false;
        }
    } catch (e) {

    }
    return success && JSON.stringify(sliced) === JSON.stringify([1, 2]);
}

/**
 * 测试点 5: 每次 slice 调用自动记录日志（通过闭包验证是否调用）
 */
export function testProxySliceLogsCall() {
    let logged = false;
    const arr = [10, 20, 30];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    logged = true;
                    return Array.prototype.slice.call(target, ...args);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.slice(1);
    return logged && JSON.stringify(proxy.slice(1)) === JSON.stringify([20, 30]);
}

/**
 * 测试点 6: slice 时自动过滤 falsy 值
 */
export function testProxySliceFiltersFalsy() {
    const arr = [0, 1, false, 2, null, 3, undefined, 4];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {
                    return Array.prototype.slice.call(target, start, end).filter(x => x);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.slice(0, 5);
    return JSON.stringify(result) === JSON.stringify([1, 2]);
}

/**
 * 测试点 7: slice 超出范围时返回空数组而非原数组部分
 */
export function testProxySliceReturnsEmptyOnInvalidRange() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {
                    if (start >= target.length || (end !== undefined && end <= start)) {
                        return [];
                    }
                    return Array.prototype.slice.call(target, start, end);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return (
        JSON.stringify(proxy.slice(5)) === JSON.stringify([]) &&
            JSON.stringify(proxy.slice(2, 2)) === JSON.stringify([])
    );
}

/**
 * 测试点 8: 使用 Proxy 实现“滑动窗口”slice：每次 slice(n) 返回最后 n 个元素
 */
export function testProxySliceLastN() {
    const arr = [1, 2, 3, 4, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (n) {
                    if (typeof n === 'number' && arguments.length === 1) {
                        return target.slice(-n);
                    }
                    return Array.prototype.slice.call(target, ...arguments);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice(3)) === JSON.stringify([3, 4, 5]);
}

/**
 * 测试点 9: slice 时自动去重
 */
export function testProxySliceDedupes() {
    const arr = [1, 2, 2, 3, 3, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    return [...new Set(sliced)];
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice(1, 5)) === JSON.stringify([2, 3]);
}

/**
 * 测试点 10: 禁止 slice 负数索引（负数视为 0）
 */
export function testProxySliceNoNegativeIndices() {
    const arr = [10, 20, 30];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {
                    start = start < 0 ? 0 : start;
                    end = end !== undefined && end < 0 ? 0 : end;
                    return Array.prototype.slice.call(target, start, end);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice(-2, -1)) === JSON.stringify([]);
}

/**
 * 测试点 11: slice 时反转结果
 */
export function testProxySliceReversed() {
    const arr = [1, 2, 3, 4];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).reverse();
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice(1, 3)) === JSON.stringify([3, 2]);
}

/**
 * 测试点 12: slice 调用最多返回前 2 个元素（上限限制）
 */
export function testProxySliceMaxTwoElements() {
    const arr = [1, 2, 3, 4, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const result = Array.prototype.slice.call(target, ...args);
                    return result.slice(0, 2);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2]);
}

/**
 * 测试点 13: slice 时跳过奇数索引元素（仅保留偶数索引）
 */
export function testProxySliceEvenIndicesOnly() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end = target.length) {
                    const full = Array.prototype.slice.call(target, start, end);
                    return full.filter((_, i) => i % 2 === 0);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify(['a', 'c', 'e']);
}

/**
 * 测试点 14: slice 时自动转为字符串数组
 */
export function testProxySliceToStrings() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(String);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify(['1', '2', '3']);
}

/**
 * 测试点 15: slice 调用触发原始数组备份（简单快照）
 */
export function testProxySliceTriggersSnapshot() {
    let snapshot = null;
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    snapshot = Array.prototype.slice.call(target);
                    return Array.prototype.slice.call(target, ...args);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.slice();
    return snapshot !== null && JSON.stringify(snapshot) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点 16: slice 时忽略第一个和最后一个元素
 */
export function testProxySliceWithoutEdges() {
    const arr = [1, 2, 3, 4, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const full = Array.prototype.slice.call(target, ...args);
                    if (full.length <= 2) {
                        return [];
                    }
                    return full.slice(1, -1);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify([2, 3, 4]);
}

/**
 * 测试点 17: slice 时如果结果为空则返回 [null]
 */
export function testProxySliceNeverEmpty() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    return res.length === 0 ? [null] : res;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice(5)) === JSON.stringify([null]);
}

/**
 * 测试点 18: slice 时自动升序排序
 */
export function testProxySliceSorted() {
    const arr = [5, 1, 3, 2, 4];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).sort((a, b) => a - b);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice(1, 4)) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点 19: slice 时限制只能切前半部分
 */
export function testProxySliceOnlyFirstHalf() {
    const arr = [1, 2, 3, 4, 5, 6];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end = Math.ceil(target.length / 2)) {
                    return Array.prototype.slice.call(target, start, end);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点 20: slice 时如果包含数字 0 则抛出错误（安全策略）
 */
export function testProxySliceRejectsZero() {
    const arr = [1, 0, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    if (res.includes(0)) {
                        throw new Error('Zero not allowed');
                    }
                    return res;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice();
        return false;
    } catch (e) {
        return e.message === 'Zero not allowed';
    }
}

/**
 * 测试点 21: slice 时自动填充默认值至长度 3
 */
export function testProxySlicePaddedToThree() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    let res = Array.prototype.slice.call(target, ...args);
                    while (res.length < 3) {
                        res.push(null);
                    }
                    return res.slice(0, 3);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, null]);
}

/**
 * 测试点 22: slice 时移除所有偶数
 */
export function testProxySliceOddsOnly() {
    const arr = [1, 2, 3, 4, 5, 6];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).filter(x => x % 2 !== 0);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 3, 5]);
}

/**
 * 测试点 23: slice 调用次数限制（最多 2 次）
 */
export function testProxySliceCallLimit() {
    let count = 0;
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    if (count >= 2) {
                        throw new Error('Too many slice calls');
                    }
                    count++;
                    return Array.prototype.slice.call(target, ...args);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice();
        proxy.slice();
        proxy.slice();
        return false;
    } catch (e) {
        return e.message === 'Too many slice calls';
    }
}

/**
 * 测试点 24: slice 时自动跳过 null 和 undefined
 */
export function testProxySliceSkipsNullish() {
    const arr = [1, null, 2, undefined, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).filter(x => x != null);
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点 25: slice 时如果结果长度为奇数则补一个 0
 */
export function testProxySliceEnsuresEvenLength() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    let res = Array.prototype.slice.call(target, ...args);
                    if (res.length % 2 === 1) {
                        res.push(0);
                    }
                    return res;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 3, 0]);
}

/**
 * 测试点 26: slice 仅允许正整数索引范围，否则返回 []
 */
export function testProxySliceOnlyPositiveIntRange() {
    const arr = [10, 20, 30];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {
                    if (
                        (typeof start !== 'number' || start < 0 || !Number.isInteger(start)) ||
                            (end !== undefined && (typeof end !== 'number' || end < 0 || !Number.isInteger(end)))
                    ) {
                        return [];
                    }
                    return Array.prototype.slice.call(target, start, end);
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return (
        JSON.stringify(proxy.slice(1, 2)) === JSON.stringify([20]) &&
            JSON.stringify(proxy.slice(-1)) === JSON.stringify([]) &&
            JSON.stringify(proxy.slice(0.5)) === JSON.stringify([])
    );
}

/**
 * 测试点 27: slice 时对每个元素乘以索引（从切片局部索引算起）
 */
export function testProxySliceMultiplyByLocalIndex() {
    const arr = [10, 20, 30, 40];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    return sliced.map((val, i) => val * i);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice(1, 3)) === JSON.stringify([0, 30]);
}

/**
 * 测试点 28: slice 时返回嵌套数组（每项包装为 [item]）
 */
export function testProxySliceWrapEachItem() {
    const arr = ['a', 'b'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x => [x]);
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([['a'], ['b']]);
}

/**
 * 测试点 29: slice 调用时自动去首尾空格（仅字符串数组）
 */
export function testProxySliceTrimStrings() {
    const arr = [' a ', ' b', 'c '];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'string' ? x.trim() : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify(['a', 'b', 'c']);
}

/**
 * 测试点 30: slice 时限制最大返回长度为 2（硬截断）
 */
export function testProxySliceHardLimitTwo() {
    const arr = [1, 2, 3, 4, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).slice(0, 2);
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice(2)) === JSON.stringify([3, 4]);
}

/**
 * 测试点 31: slice 时若原数组包含负数则拒绝操作
 */
export function testProxySliceRejectsNegativeNumbers() {
    const arr = [1, -2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    if (target.some(x => typeof x === 'number' && x < 0)) {
                        throw new Error('Negative numbers not allowed');
                    }
                    return Array.prototype.slice.call(target, ...args);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice();
        return false;
    } catch (e) {
        return e.message === 'Negative numbers not allowed';
    }
}

/**
 * 测试点 32: slice 时自动升序并去重
 */
export function testProxySliceSortedUnique() {
    const arr = [3, 1, 2, 2, 1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    return [...new Set(sliced)].sort((a, b) => a - b);
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点 33: slice 时只保留大于平均值的元素
 */
export function testProxySliceAboveAverage() {
    const arr = [1, 2, 3, 4, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const avg = sliced.reduce((a, b) => a + b, 0) / sliced.length;
                    return sliced.filter(x => x > avg);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify([4, 5]);
}

/**
 * 测试点 34: slice 时反转索引顺序（但不改变值顺序）— 无实际意义，仅演示
 * 实际效果等同于普通 slice，此处验证代理能正确透传
 */
export function testProxySliceTransparentPassThrough() {
    const arr = [10, 20, 30];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.apply(target, args);
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice(1)) === JSON.stringify([20, 30]);
}

/**
 * 测试点 35: slice 时如果调用无参数，则返回整个数组的浅拷贝；否则报错
 */
export function testProxySliceOnlyNoArgsAllowed() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    if (args.length > 0) {
                        throw new Error('Arguments not allowed');
                    }
                    return Array.prototype.slice.call(target);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice(1);
        return false;
    } catch (e) {
        if (e.message !== 'Arguments not allowed') {
            return false;
        }

        return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 3]);
    }
}

/**
 * 测试点 36: slice 时自动将结果转为 Set 再转回数组（去重）
 * （与之前不同：强调使用 Set 构造）
 */
export function testProxySliceViaSet() {
    const arr = [1, 1, 2, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    return Array.from(new Set(sliced));
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点 37: slice 时禁止访问空数组（若原数组为空则报错）
 */
export function testProxySliceRejectsEmptySource() {
    const arr = [];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    if (target.length === 0) {
                        throw new Error('Source array is empty');
                    }
                    return Array.prototype.slice.call(target, ...args);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice();
        return false;
    } catch (e) {
        return e.message === 'Source array is empty';
    }
}

/**
 * 测试点 38: slice 时如果结果包含字符串则全部转大写
 */
export function testProxySliceUppercaseStrings() {
    const arr = [1, 'hello', 2, 'world'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'string' ? x.toUpperCase() : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 'HELLO', 2, 'WORLD']);
}

/**
 * 测试点 39: slice 时自动在结果末尾添加时间戳（用于调试）
 * 验证：结果最后一个是数字且大于 0
 */
export function testProxySliceWithTimestamp() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    res.push(Date.now());
                    return res;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.slice();
    const timestamp = result[result.length - 1];
    return (
        result.length === 3 &&
            result[0] === 1 &&
            result[1] === 2 &&
            typeof timestamp === 'number' &&
            timestamp > 0
    );
}

/**
 * 测试点 40: slice 时模拟“延迟加载”——首次调用慢，后续快（此处仅验证行为一致性）
 * 实际不延迟，但确保多次 slice 结果一致
 */
export function testProxySliceConsistentResults() {
    const arr = [5, 6, 7];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x => x * 2);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const r1 = proxy.slice();
    const r2 = proxy.slice();
    return JSON.stringify(r1) === JSON.stringify(r2) && JSON.stringify(r1) === JSON.stringify([10, 12, 14]);
}

/**
 * 测试点 41: slice 时自动将数字转为布尔（0→false, 非0→true）
 */
export function testProxySliceNumbersToBooleans() {
    const arr = [0, 1, -5, 3.14];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'number' ? !!x : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([false, true, true, true]);
}

/**
 * 测试点 42: slice 时如果结果为空对象数组则报错（仅含 {} 视为无效）
 */
export function testProxySliceRejectsOnlyEmptyObjects() {
    const arr = [{}, {}, {}];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    const allEmpty = res.every(x => x && typeof x === 'object' && Object.keys(x).length === 0);
                    if (allEmpty && res.length > 0) {
                        throw new Error('Only empty objects');
                    }
                    return res;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice();
        return false;
    } catch (e) {
        return e.message === 'Only empty objects';
    }
}

/**
 * 测试点 43: slice 时保留唯一对象引用（浅去重基于引用）
 */
export function testProxySliceDedupeByReference() {
    const obj = { id: 1 };
    const arr = [obj, obj, { id: 2 }];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const seen = new Set();
                    return sliced.filter(item => {
                        if (typeof item === 'object' && item !== null) {
                            if (seen.has(item)) {
                                return false;
                            }
                            seen.add(item);
                            return true;
                        }
                        return true;
                    });
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.slice();
    return result.length === 2 && result[0] === obj && result[1].id === 2;
}

/**
 * 测试点 44: slice 时自动补全缺失索引为 undefined（模拟稀疏数组填充）
 */
export function testProxySliceFillSparseWithUndefined() {
    const arr = new Array(5);
    arr[0] = 'a';
    arr[4] = 'e';
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end = target.length) {
                    const result = [];
                    for (let i = start; i < end; i++) {
                        result.push(i in target ? target[i] : undefined);
                    }
                    return result;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const sliced = proxy.slice(0, 3);
    return (
        sliced.length === 3 &&
            sliced[0] === 'a' &&
            sliced[1] === undefined &&
            sliced[2] === undefined
    );
}

/**
 * 测试点 45: slice 时若包含 NaN 则替换为 null
 */
export function testProxySliceReplaceNaNWithNull() {
    const arr = [1, NaN, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x => (Number.isNaN(x) ? null : x));
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, null, 2]);
}

/**
 * 测试点 46: slice 时只允许切片长度 ≤ 原数组一半，否则抛错
 */
export function testProxySliceMaxLengthHalf() {
    const arr = [1, 2, 3, 4, 5, 6];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const temp = Array.prototype.slice.call(target, ...args);
                    if (temp.length > Math.floor(target.length / 2)) {
                        throw new Error('Slice too long');
                    }
                    return temp;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice(0, 4);
        return false;
    } catch (e) {
        return e.message === 'Slice too long';
    }
}

/**
 * 测试点 47: slice 时对字符串元素计算长度并替换
 */
export function testProxySliceStringToLength() {
    const arr = [1, 'hi', 'hello', 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'string' ? x.length : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 5, 3]);
}

/**
 * 测试点 48: slice 时反转原始索引顺序（全局索引映射）
 */
export function testProxySliceReverseByGlobalIndex() {
    const arr = ['a', 'b', 'c', 'd'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start, end) {
                    const sliced = Array.prototype.slice.call(target, start, end);
                    return sliced.map((_, localIdx) => {
                        const globalIdx = (start || 0) + localIdx;
                        const reversedGlobalIdx = target.length - 1 - globalIdx;
                        return target[reversedGlobalIdx];
                    });
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice(1, 3)) === JSON.stringify(['c', 'b']);
}

/**
 * 测试点 49: slice 时自动跳过偶数索引元素（基于原始数组位置）
 */
export function testProxySliceSkipEvenGlobalIndices() {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end = arr.length) {
                    const result = [];
                    for (let i = start; i < end; i++) {
                        if (i % 2 === 1) {
                            result.push(arr[i]);
                        }
                    }
                    return result;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify(['b', 'd']);
}

/**
 * 测试点 50: slice 时如果所有元素为相同值则返回单元素数组
 */
export function testProxySliceDedupIfAllEqual() {
    const arr = [5, 5, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const allSame = sliced.length > 0 && sliced.every(x => x === sliced[0]);
                    return allSame ? [sliced[0]] : sliced;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([5]);
}

/**
 * 测试点 51: slice 时禁止返回超过 10 个元素（硬上限）
 */
export function testProxySliceHardCapTen() {
    const arr = Array.from({ length: 15 }, (_, i) => i);
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    return res.length > 10 ? res.slice(0, 10) : res;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return proxy.slice().length === 10;
}

/**
 * 测试点 52: slice 时自动将负数转为 0
 */
export function testProxySliceClampNegativeToZero() {
    const arr = [-3, -1, 0, 2, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'number' && x < 0 ? 0 : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([0, 0, 0, 2, 5]);
}

/**
 * 测试点 53: slice 时如果调用者是 'debug' 模式则打印（通过闭包模拟）
 */
export function testProxySliceDebugMode() {
    let logged = false;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    logged = true;
                    return Array.prototype.slice.call(target, ...args);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.slice();
    return logged && JSON.stringify(result) === JSON.stringify([1, 2]);
}

/**
 * 测试点 54: slice 时移除连续重复项（仅相邻去重）
 */
export function testProxySliceRemoveConsecutiveDuplicates() {
    const arr = [1, 1, 2, 2, 2, 3, 1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    return sliced.filter((x, i) => i === 0 || x !== sliced[i - 1]);
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 3, 1]);
}

/**
 * 测试点 55: slice 时如果包含函数则拒绝
 */
export function testProxySliceRejectsFunctions() {
    const arr = [1, () => {
    }, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    if (sliced.some(x => typeof x === 'function')) {
                        throw new Error('Function not allowed');
                    }
                    return sliced;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice();
        return false;
    } catch (e) {
        return e.message === 'Function not allowed';
    }
}

/**
 * 测试点 56: slice 时自动分组为每2个一组的子数组
 */
export function testProxySliceChunkByTwo() {
    const arr = [1, 2, 3, 4, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const chunks = [];
                    for (let i = 0; i < sliced.length; i += 2) {
                        chunks.push(sliced.slice(i, i + 2));
                    }
                    return chunks;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([[1, 2], [3, 4], [5]]);
}

/**
 * 测试点 57: slice 时如果结果长度为 1 则自动展开（不包装）
 * —— 此处反向：若长度≠1才包装，但为简化，验证长度=1时行为正常
 */
export function testProxySliceSingleElementUnwrapped() {
    const arr = [42];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    return res.length === 1 ? res[0] : res;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.slice();
    return result === 42;
}

/**
 * 测试点 58: slice 时对数字四舍五入
 */
export function testProxySliceRoundNumbers() {
    const arr = [1.2, 2.8, '3.5', 4];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'number' ? Math.round(x) : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 3, '3.5', 4]);
}

/**
 * 测试点 59: slice 时自动在开头插入长度信息
 */
export function testProxySlicePrependLength() {
    const arr = ['x', 'y'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    return [res.length, ...res];
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([2, 'x', 'y']);
}

/**
 * 测试点 60: slice 时模拟“只读视图”——返回的数组无法被修改（Object.freeze）
 */
export function testProxySliceReturnsFrozenArray() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Object.freeze(Array.prototype.slice.call(target, ...args));
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const sliced = proxy.slice();
    let success = true;
    try {
        sliced.push(4);
    } catch (e) {

    }

    return sliced.length === 3 && JSON.stringify(sliced) === JSON.stringify([1, 2, 3]) && Object.isFrozen(sliced);
}

/**
 * 测试点 61: slice 时自动跳过 Symbol 类型元素
 */
export function testProxySliceSkipSymbols() {
    const sym = Symbol('test');
    const arr = [1, sym, 2, Symbol('x'), 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).filter(x => typeof x !== 'symbol');
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 3]);
}

/**
 * 测试点 62: slice 时如果包含正则表达式则转换为字符串
 */
export function testProxySliceRegexToString() {
    const arr = [1, /abc/g, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    x instanceof RegExp ? x.toString() : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, '/abc/g', 2]);
}

/**
 * 测试点 63: slice 时只保留数组中的数字类型
 */
export function testProxySliceNumbersOnly() {
    const arr = ['a', 1, true, 2.5, null, 3n, {}];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).filter(x => typeof x === 'number');
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2.5]);
}

/**
 * 测试点 64: slice 时自动将 BigInt 转为字符串
 */
export function testProxySliceBigIntToString() {
    const arr = [1n, 2, 3n];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'bigint' ? x.toString() + 'n' : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify(['1n', 2, '3n']);
}

/**
 * 测试点 65: slice 时如果结果包含 undefined 则替换为 'MISSING'
 */
export function testProxySliceReplaceUndefined() {
    const arr = [1, undefined, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x => (x === undefined ? 'MISSING' : x));
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 'MISSING', 2]);
}

/**
 * 测试点 66: slice 时禁止切片起始索引为奇数
 */
export function testProxySliceRejectOddStartIndex() {
    const arr = [10, 20, 30, 40];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end) {
                    if (typeof start === 'number' && start % 2 === 1) {
                        throw new Error('Odd start index not allowed');
                    }
                    return Array.prototype.slice.call(arr, start, end);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice(1);
        return false;
    } catch (e) {
        return e.message === 'Odd start index not allowed';
    }
}

/**
 * 测试点 67: slice 时自动将布尔值转为 0/1
 */
export function testProxySliceBooleanToNumber() {
    const arr = [true, false, 5, 'yes'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'boolean' ? (x ? 1 : 0) : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 0, 5, 'yes']);
}

/**
 * 测试点 68: slice 时若所有元素为字符串则拼接成一句话
 */
export function testProxySliceJoinIfAllStrings() {
    const arr = ['Hello', 'world', '!'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    if (sliced.every(x => typeof x === 'string')) {
                        return [sliced.join(' ')];
                    }
                    return sliced;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify(['Hello world !']);
}

/**
 * 测试点 69: slice 时移除所有 falsy 值，但保留 0 和 false（宽松过滤）
 */
export function testProxySliceFalsyButKeepZeroFalse() {
    const arr = [0, false, null, '', undefined, 1, 'hello'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).filter(x =>
                    x != null && x !== ''
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([0, false, 1, 'hello']);
}

/**
 * 测试点 70: slice 时自动对每个元素调用 .toString()
 */
export function testProxySliceAllToString() {
    const arr = [1, true, null, { a: 1 }];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x => String(x));
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify(['1', 'true', 'null', '[object Object]']);
}

/**
 * 测试点 71: slice 时如果包含日期对象则格式化为 YYYY-MM-DD
 */
export function testProxySliceFormatDates() {
    const date = new Date('2025-06-15');
    const arr = [1, date, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    x instanceof Date ? x.toISOString().split('T')[0] : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, '2025-06-15', 2]);
}

/**
 * 测试点 72: slice 时反转原始数组后再切片（先 reverse 再 slice）
 */
export function testProxySliceOnReversedSource() {
    const arr = [1, 2, 3, 4];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const reversed = [...target].reverse();
                    return Array.prototype.slice.call(reversed, ...args);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice(0, 2)) === JSON.stringify([4, 3]);
}

/**
 * 测试点 73: slice 时如果结果长度为偶数则在末尾加 'EVEN'
 */
export function testProxySliceTagEvenLength() {
    const arr = [1, 2, 3, 4];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    if (res.length % 2 === 0) {
                        res.push('EVEN');
                    }
                    return res;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 3, 4, 'EVEN']);
}

/**
 * 测试点 74: slice 时自动跳过深度嵌套数组（仅保留非数组项）
 */
export function testProxySliceFlattenOneLevelAndSkipNestedArrays() {
    const arr = [1, [2, 3], 4, [5], 6];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).filter(x => !Array.isArray(x));
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 4, 6]);
}

/**
 * 测试点 75: slice 时如果包含 Infinity 则替换为 'INF'
 */
export function testProxySliceReplaceInfinity() {
    const arr = [1, Infinity, -Infinity, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    x === Infinity ? 'INF' : x === -Infinity ? '-INF' : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 'INF', '-INF', 2]);
}

/**
 * 测试点 76: slice 时只允许切片包含基本类型（拒绝对象/数组/函数）
 */
export function testProxySlicePrimitivesOnly() {
    const arr = [1, 'a', true, {}, [], () => {
    }];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const hasNonPrimitive = sliced.some(x =>
                    x !== null && typeof x === 'object' || typeof x === 'function'
                    );
                    if (hasNonPrimitive) {
                        throw new Error('Non-primitive detected');
                    }
                    return sliced;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice();
        return false;
    } catch (e) {
        return e.message === 'Non-primitive detected';
    }
}

/**
 * 测试点 77: slice 时自动将负零 (-0) 转为正零
 */
export function testProxySliceNormalizeNegativeZero() {
    const arr = [1, -0, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    Object.is(x, -0) ? 0 : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.slice();
    return result[1] === 0 && 1 / result[1] === Infinity;
}

/**
 * 测试点 78: slice 时如果调用无参数，则返回倒序；否则正常切片
 */
export function testProxySliceReverseIfNoArgs() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    if (args.length === 0) {
                        return [...target].reverse();
                    }
                    return Array.prototype.slice.call(target, ...args);
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return (
        JSON.stringify(proxy.slice()) === JSON.stringify([3, 2, 1]) &&
            JSON.stringify(proxy.slice(0, 2)) === JSON.stringify([1, 2])
    );
}

/**
 * 测试点 79: slice 时自动为每个元素添加索引前缀（"0:item"）
 */
export function testProxySlicePrefixWithIndex() {
    const arr = ['a', 'b', 'c'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    return sliced.map((x, i) => `${i}:${String(x)}`);
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice(1)) === JSON.stringify(['0:b', '1:c']);
}

/**
 * 测试点 80: slice 时模拟“懒计算”——仅当访问结果元素时才处理（此处简化：预处理但验证一致性）
 * 实际验证：多次 slice 返回结构一致且值正确
 */
export function testProxySliceLazyLikeConsistency() {
    const arr = [2, 4, 6];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x => x * 10);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const r1 = proxy.slice(1);
    const r2 = proxy.slice(1);
    return JSON.stringify(r1) === JSON.stringify(r2) && JSON.stringify(r1) === JSON.stringify([40, 60]);
}

/**
 * 测试点 81: slice 时自动将 null 转为字符串 "NULL"
 */
export function testProxySliceNullToString() {
    const arr = [1, null, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x => (x === null ? 'NULL' : x));
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 'NULL', 2]);
}

/**
 * 测试点 82: slice 时如果包含循环引用则抛错（简易检测）
 */
export function testProxySliceRejectsCircular() {
    const obj = { a: 1 };
    obj.self = obj;
    const arr = [1, obj, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);

                    if (sliced.some(x => x && typeof x === 'object' && x.self === x)) {
                        throw new Error('Circular reference detected');
                    }
                    return sliced;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice();
        return false;
    } catch (e) {
        return e.message === 'Circular reference detected';
    }
}

/**
 * 测试点 83: slice 时只保留数组中索引为质数的元素（基于原始索引）
 */
export function testProxySliceKeepPrimeIndices() {

    function isPrime(n) {
        if (n < 2) {
            return false;
        }
        for (let i = 2; i <= Math.sqrt(n); i++) {
            if (n % i === 0) {
                return false;
            }
        }
        return true;
    }

    const arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];

    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end = target.length) {
                    const result = [];
                    for (let i = start; i < end; i++) {
                        if (isPrime(i)) {
                            result.push(target[i]);
                        }
                    }
                    return result;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify(['c', 'd', 'f']);
}

/**
 * 测试点 84: slice 时自动跳过长度大于 5 的字符串
 */
export function testProxySliceSkipLongStrings() {
    const arr = ['hi', 'hello!', 'world', 'a'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).filter(x =>
                    !(typeof x === 'string' && x.length > 5)
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify(['hi', 'world', 'a']);
}

/**
 * 测试点 85: slice 时如果结果为空则返回 [null] 而非 []
 */
export function testProxySliceEmptyBecomesNullArray() {
    const arr = [];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    return res.length === 0 ? [null] : res;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([null]);
}

/**
 * 测试点 86: slice 时对每个数字加 100，其他类型不变
 */
export function testProxySliceAdd100ToNumbers() {
    const arr = [1, 'a', 2.5, true, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'number' ? x + 100 : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([101, 'a', 102.5, true, 103]);
}

/**
 * 测试点 87: slice 时禁止切片跨过中间点（如长度为偶数，则不能同时包含前半和后半）
 */
export function testProxySliceNoCrossMidpoint() {
    const arr = [1, 2, 3, 4];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end = arr.length) {
                    const mid = arr.length / 2;
                    if (start < mid && end > mid) {
                        throw new Error('Cannot cross midpoint');
                    }
                    return Array.prototype.slice.call(arr, start, end);
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice(1, 3);
        return false;
    } catch (e) {
        return e.message === 'Cannot cross midpoint';
    }
}

/**
 * 测试点 88: slice 时自动将 Date 对象转为时间戳（毫秒）
 */
export function testProxySliceDateToTimestamp() {
    const now = Date.now();
    const arr = [1, new Date(now), 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    x instanceof Date ? x.getTime() : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, now, 2]);
}

/**
 * 测试点 89: slice 时如果所有元素为数字则返回总和（作为单元素数组）
 */
export function testProxySliceSumIfAllNumbers() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    if (sliced.length > 0 && sliced.every(x => typeof x === 'number')) {
                        return [sliced.reduce((a, b) => a + b, 0)];
                    }
                    return sliced;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([6]);
}

/**
 * 测试点 90: slice 时移除所有重复值（全局去重，基于 JSON.stringify）
 */
export function testProxySliceGlobalDedupeByJSON() {
    const arr = [{ a: 1 }, { b: 2 }, { a: 1 }, 'x', 'x'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const seen = new Set();
                    return sliced.filter(item => {
                        const key = typeof item === 'object' && item !== null ? JSON.stringify(item) : item;
                        if (seen.has(key)) {
                            return false;
                        }
                        seen.add(key);
                        return true;
                    });
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([{ a: 1 }, { b: 2 }, 'x']);
}

/**
 * 测试点 91: slice 时自动将 undefined 和 null 视为相等并去重（保留第一个）
 */
export function testProxySliceDedupeNullish() {
    const arr = [1, null, undefined, 2, null, undefined];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const result = [];
                    let hasSeenNullish = false;
                    for (const item of sliced) {
                        if (item == null) {
                            if (!hasSeenNullish) {
                                result.push(item);
                                hasSeenNullish = true;
                            }
                        } else {
                            result.push(item);
                        }
                    }
                    return result;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    return JSON.stringify(proxy.slice()) === JSON.stringify([1, null, 2]);
}

/**
 * 测试点 92: slice 时如果包含非 ASCII 字符串则拒绝
 */
export function testProxySliceRejectNonAsciiStrings() {
    const arr = ['hello', 'café', '123'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const hasNonAscii = sliced.some(x =>
                    typeof x === 'string' && !/^[\x00-\x7F]*$/.test(x)
                    );
                    if (hasNonAscii) {
                        throw new Error('Non-ASCII string not allowed');
                    }
                    return sliced;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.slice();
        return false;
    } catch (e) {
        return e.message === 'Non-ASCII string not allowed';
    }
}

/**
 * 测试点 93: slice 时自动将数组元素按类型分组（返回 { number: [...], string: [...] }）
 * —— 此处简化：仅当全为基本类型时才分组，否则原样返回
 */
export function testProxySliceGroupByTypeIfPrimitive() {
    const arr = [1, 'a', 2, 'b'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const allPrimitive = sliced.every(x =>
                    x === null || (typeof x !== 'object' && typeof x !== 'function')
                    );
                    if (allPrimitive) {
                        const groups = {
                            number: [],
                            string: [],
                            boolean: [],
                            bigint: [],
                            undefined: [],
                            symbol: []
                        };
                        for (const x of sliced) {
                            const t = x === null ? 'object' : typeof x;
                            if (t in groups) {
                                groups[t].push(x);
                            }
                        }

                        return [...groups.number, ...groups.string, ...groups.boolean];
                    }
                    return sliced;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 2, 'a', 'b']);
}

/**
 * 测试点 94: slice 时如果调用发生在“只读模式”下则冻结结果（通过闭包控制）
 */
export function testProxySliceFreezeInReadOnlyMode() {
    const readOnly = true;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const res = Array.prototype.slice.call(target, ...args);
                    if (readOnly) {
                        return Object.freeze(res);
                    }
                    return res;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.slice();
    return Object.isFrozen(result) && JSON.stringify(result) === JSON.stringify([1, 2]);
}

/**
 * 测试点 95: slice 时自动跳过索引能被 3 整除的位置（基于原始索引）
 */
export function testProxySliceSkipIndexDivisibleByThree() {
    const arr = ['a', 'b', 'c', 'd', 'e', 'f'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (start = 0, end = arr.length) {
                    const result = [];
                    for (let i = start; i < end; i++) {
                        if (i % 3 !== 0) {
                            result.push(arr[i]);
                        }
                    }
                    return result;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify(['b', 'c', 'e', 'f']);
}

/**
 * 测试点 96: slice 时如果包含 NaN、Infinity 或 -Infinity 则全部替换为 0
 */
export function testProxySliceSanitizeFloatSpecialValues() {
    const arr = [1, NaN, Infinity, -Infinity, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x =>
                    typeof x === 'number' && (!isFinite(x) || isNaN(x)) ? 0 : x
                    );
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 0, 0, 0, 2]);
}

/**
 * 测试点 97: slice 时自动将布尔值和数字互转（true→1, false→0, 1→true, 0→false）
 */
export function testProxySliceToggleBooleanNumber() {
    const arr = [true, false, 1, 0, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x => {
                        if (x === true) {
                            return 1;
                        }
                        if (x === false) {
                            return 0;
                        }
                        if (x === 1) {
                            return true;
                        }
                        if (x === 0) {
                            return false;
                        }
                        return x;
                    });
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, 0, true, false, 2]);
}

/**
 * 测试点 98: slice 时如果结果包含对象，则为其添加 __source: 'proxy' 属性
 */
export function testProxySliceTagObjects() {
    const arr = [1, { a: 1 }, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    return Array.prototype.slice.call(target, ...args).map(x => {
                        if (x && typeof x === 'object' && !Array.isArray(x)) {
                            const copy = { ...x, __source: 'proxy' };
                            return copy;
                        }
                        return x;
                    });
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([1, { a: 1, __source: 'proxy' }, 2]);
}

/**
 * 测试点 99: slice 时模拟“视图缓存”——相同参数返回相同引用
 */
export function testProxySliceCachesSameArgs() {
    const arr = [1, 2, 3];
    const cache = new Map();
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const key = JSON.stringify(args);
                    if (cache.has(key)) {
                        return cache.get(key);
                    }
                    const res = Array.prototype.slice.call(target, ...args);
                    cache.set(key, res);
                    return res;
                };
            }
            return Reflect.get(target, prop);
        }
    });

    const r1 = proxy.slice(1);
    const r2 = proxy.slice(1);
    return r1 === r2 && JSON.stringify(r1) === JSON.stringify([2, 3]);
}

/**
 * 测试点 100: slice 时自动验证数组是否为“纯数字升序”，若是则返回 reversed
 */
export function testProxySliceReverseIfSortedAscendingNumbers() {
    const arr = [1, 2, 3, 4];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'slice') {
                return function (...args) {
                    const sliced = Array.prototype.slice.call(target, ...args);
                    const isPureNumbers = sliced.every(x => typeof x === 'number');
                    const isAscending = isPureNumbers && sliced.every((x, i) => i === 0 || x >= sliced[i - 1]);
                    if (isPureNumbers && isAscending) {
                        return [...sliced].reverse();
                    }
                    return sliced;
                };
            }
            return Reflect.get(target, prop);
        }
    });
    return JSON.stringify(proxy.slice()) === JSON.stringify([4, 3, 2, 1]);
}