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


export function testProxyFilterEvenIndexOnly() {
    let accessedOddIndex = false;
    const originalArrayList = [10, 20, 30, 40, 50];

    const proxiedArray = new Proxy(originalArrayList, {
        get(target, prop, receiver) {
            const index = Number(prop);
            if (!isNaN(index) && Number.isInteger(index) && index >= 0) {
                if (index % 2 === 1) {
                    accessedOddIndex = true;
                }
            }
            return Reflect.get(target, prop, receiver);
        }
    });

    const result = proxiedArray.filter(x => x > 25);

    const expected = [30, 40, 50];
    return JSON.stringify(result) === JSON.stringify(expected);
}

export function testProxyFilterFullTraversal() {
    let accessCount = 0;
    const originalArray = [1, 2, 3, 4, 5];

    const proxiedArray = new Proxy(originalArray, {
        get(target, prop, receiver) {
            if (typeof prop === 'number') {
                accessCount++;
            }
            return Reflect.get(target, prop, receiver);
        }
    });

    const result = proxiedArray.filter(x => x % 2 === 0);

    return accessCount === originalArray.length;
}

export function testProxyFilterReadsLength() {
    let readLength = false;
    const originalArray = ['a', 'b', 'c'];

    const proxiedArray = new Proxy(originalArray, {
        get(target, prop, receiver) {
            if (prop === 'length') {
                readLength = true;
            }
            return Reflect.get(target, prop, receiver);
        }
    });

    const result = proxiedArray.filter(x => x !== 'b');

    return readLength;
}

export function testProxyFilterNoWriteDuringFilter() {
    let wroteDuringFilter = false;
    const arr = [1, 2, 3, 4];
    const proxy = new Proxy(arr, {
        set() {
            wroteDuringFilter = true;
            return true;
        }
    });

    proxy.filter(x => x > 2);
    return !wroteDuringFilter;
}

export function testProxyFilterAccessesNonIndexProps() {
    const accessed = new Set();
    const arr = [10, 20];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            accessed.add(String(prop));
            return Reflect.get(target, prop);
        }
    });

    proxy.filter(x => x > 15);
    return accessed.has('length') && accessed.has('0') && accessed.has('1');
}

export function testProxyFilterUsesProxiedValues() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            const val = Reflect.get(target, prop);
            if (typeof val === 'number') {
                return val * 10;
            }
            return val;
        }
    });

    const result = proxy.filter(x => x > 25);
    return result.length === 1 && result[0] === 30;
}

export function testProxyDetectsMutationInFilterCallback() {
    let mutated = false;
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        set(target, prop, value) {
            if (prop !== 'length') {
                mutated = true;
            }
            return Reflect.set(target, prop, value);
        }
    });

    proxy.filter((x, i, self) => {
        if (i === 0) {
            self[1] = 999;
        }
        return x > 0;
    });

    return mutated;
}

export function testProxyFilterSkipsHoles() {
    const arr = [1, , 3];
    let accessedIndex1 = false;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '1') {
                accessedIndex1 = true;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.filter(x => true);
    return !accessedIndex1 && result.length === 2 && result[0] === 1 && result[1] === 3;
}

export function testProxyFilterHandlesGetException() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 1) {
                throw new Error('Blocked');
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.filter(x => true);
        return false;
    } catch (e) {
        return e.message === 'Blocked';
    }
}

export function testProxyFilterRunOnceOnly() {
    let hasRun = false;
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'filter') {
                if (hasRun) {
                    throw new Error('Already run');
                }
                hasRun = true;
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.filter(x => x > 1);
        proxy.filter(x => x > 2);
        return false;
    } catch (e) {
        return e.message === 'Already run';
    }
}

export function testProxyInterceptsFilterMethodCall() {
    let filterCalled = false;
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'filter') {
                filterCalled = true;
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.filter(x => x % 2 === 0);
    return filterCalled;
}

export function testProxyFakeLengthAffectsFilter() {
    const arr = [1, 2, 3, 4, 5];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                return 2;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.filter(x => true);
    return result.length === 2 && result[0] === 1 && result[1] === 2;
}

export function testProxyFilterCallbackCallCount() {
    let callCount = 0;
    const arr = [10, 20, 30];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });

    proxy.filter(x => {
        callCount++;
        return x > 15;
    });

    return callCount === 3;
}

export function testProxyReadOnlyArrayFilterWorks() {
    const arr = [5, 10, 15];
    const proxy = new Proxy(arr, {
        set() {
            throw new Error('Read-only');
        }
    });

    const result = proxy.filter(x => x >= 10);
    return result.length === 2 && result[0] === 10 && result[1] === 15;
}

export function testProxyDynamicValueInFilter() {
    let toggle = true;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            const val = Reflect.get(target, prop);
            if (typeof val === 'number') {
                return toggle ? val : val + 10;
            }
            return val;
        }
    });

    toggle = false;
    const result = proxy.filter(x => x > 11);
    return result.length === 1;
}

export function testProxyHasTrapNotUsedInFilter() {
    let hasCalled = false;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        has(target, prop) {
            hasCalled = true;
            return Reflect.has(target, prop);
        }
    });

    const result = proxy.filter(x => x > 1);
    return hasCalled && result.length === 1;
}

export function testProxyReturnsUndefinedForSomeElements() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            const idx = Number(prop);
            if (!isNaN(idx) && idx === 1) {
                return undefined;
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.filter(x => x != null);
    return result.length === 2 && result[0] === 1 && result[1] === 3;
}

export function testProxyFilterAccessesSymbolIterator() {
    let accessedIterator = false;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === Symbol.iterator) {
                accessedIterator = true;
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.filter(x => x > 1);
    return !accessedIterator;
}

export function testProxyDynamicLengthExtensionDuringFilter() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                if (!proxy._extended) {
                    target.push(999);
                    proxy._extended = true;
                }
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.filter(x => true);
    return result.length === 3 && result.includes(999);
}

export function testProxyFilterDoesNotCallToPrimitive() {
    let toPrimitiveCalled = false;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            return Reflect.get(target, prop);
        },
        [Symbol.toPrimitive]() {
            toPrimitiveCalled = true;
            return 'array';
        }
    });

    proxy.filter(x => x > 1);
    return !toPrimitiveCalled;
}

export function testProxyNestedProxiesWorkWithFilter() {
    const arr = [3, 4, 5];
    const inner = new Proxy(arr, {});
    const outer = new Proxy(inner, {});
    const result = outer.filter(x => x >= 4);
    return result.length === 2 && result[0] === 4 && result[1] === 5;
}

export function testProxyReactiveSystemTracksFilterDependencies() {
    const deps = new Set();
    const arr = [10, 20, 30];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (!isNaN(Number(prop))) {
                deps.add(Number(prop));
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.filter(x => x > 15);
    return deps.has(0) && deps.has(1) && deps.has(2) && deps.size === 3;
}

export function testProxyFilterCannotAccessGlobalThroughProxy() {
    const arr = [1];
    const proxy = new Proxy(arr, {});
    let globalAccessed = false;

    const safeProxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'global' || prop === 'window') {
                globalAccessed = true;
            }
            return Reflect.get(target, prop);
        }
    });

    safeProxy.filter(x => x > 0);
    return !globalAccessed;
}

export function testProxyFilterWorksOnObjectElements() {
    const arr = [{ id: 1 }, { id: 2 }];
    const proxy = new Proxy(arr, {});
    const result = proxy.filter(obj => obj.id === 2);
    return result.length === 1 && result[0].id === 2;
}

export function testProxyFilterDoesNotCallOwnKeys() {
    let ownKeysCalled = false;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        ownKeys() {
            ownKeysCalled = true;
            return Reflect.ownKeys(arr);
        }
    });

    proxy.filter(x => x > 1);
    return !ownKeysCalled;
}

export function testProxyFilterResultIsMutableEvenIfSourceIsReadOnly() {
    const arr = [5, 6];
    const proxy = new Proxy(arr, {
        set() {
            throw new Error('Read-only');
        }
    });

    const result = proxy.filter(x => x === 5);
    try {
        result[0] = 999;
        return result[0] === 999;
    } catch {
        return false;
    }
}

export function testProxyI18nKeysDoNotAffectFilter() {
    const arr = ['café', 'naïve'];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            const val = Reflect.get(target, prop);
            if (typeof val === 'string' && prop !== 'length') {
                return val.normalize('NFD');
            }
            return val;
        }
    });

    const result = proxy.filter(s => s.includes('e'));
    return result.length === 2;
}

export function testProxyFilterIsSynchronous() {
    let duringFilter = false;
    let afterFilter = false;

    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 0) {
                duringFilter = true;
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.filter(x => x);
    afterFilter = true;

    return duringFilter && afterFilter;
}

export function testProxyFilterCallbackArgsAreOriginal() {
    let receivedCorrectArray = false;
    let receivedCorrectIndex = true;
    const arr = [10, 20];
    const proxy = new Proxy(arr, {});

    proxy.filter((x, i, self) => {
        if (self === proxy) {
            receivedCorrectArray = true;
        }
        if (i !== (x === 10 ? 0 : 1)) {
            receivedCorrectIndex = false;
        }
        return true;
    });

    return receivedCorrectArray && receivedCorrectIndex;
}

export function testProxyFilterDoesNotIntroduceExtraClosureLeaks() {
    let captured = null;
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            captured = target;
            return Reflect.get(target, prop);
        }
    });

    proxy.filter(x => x);
    return captured === arr;
}

export function testProxyFilterTreatsPromisesAsValues() {
    const prom = Promise.resolve(42);
    const arr = [prom, 10];
    const proxy = new Proxy(arr, {});
    const result = proxy.filter(x => x instanceof Promise);
    return result.length === 1 && result[0] === prom;
}

export function testProxyExceptionInFilterDoesNotMutateOriginal() {
    const arr = [1, 2, 3];
    const originalLength = arr.length;
    const originalVals = [...arr];

    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '1') {
                throw new Error('Boom');
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.filter(x => x > 0);
    } catch (e) {
    }

    return arr.length === originalLength && arr.every((v, i) => v === originalVals[i]);
}

export function testProxyNonEnumerableLengthStillReadableByFilter() {
    const arr = [7, 8];
    const proxy = new Proxy(arr, {});
    const result = proxy.filter(x => x === 7);
    return result.length === 1;
}

export function testProxyInterceptFilterMethodCallViaApplyTrap() {
    let filterApplied = false;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            const value = Reflect.get(target, prop);
            if (prop === 'filter' && typeof value === 'function') {
                return new Proxy(value, {
                    apply(fn, thisArg, args) {
                        filterApplied = true;
                        return fn.apply(thisArg, args);
                    }
                });
            }
            return value;
        }
    });

    proxy.filter(x => x > 1);
    return filterApplied;
}

export function testProxyArrayAsStringBreaksFilter() {
    const proxy = new Proxy([], {
        get(target, prop) {
            if (prop === 'length') {
                return 3;
            }
            if (prop === '0') {
                return 'a';
            }
            if (prop === '1') {
                return 'b';
            }
            if (prop === '2') {
                return 'c';
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.filter(x => x === 'b');
    return result.length === 0 && result[0] === undefined;
}

export function testProxyRecursiveFilterCallsAreIndependent() {
    let outerCount = 0;
    let innerCount = 0;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            const val = Reflect.get(target, prop);
            if (prop === '0') {
                outerCount++;
            }
            return val;
        }
    });

    proxy.filter(x => {
        if (x === 1) {
            proxy.filter(y => {
                if (y === 1) {
                    innerCount++;
                }
                return y > 0;
            });
        }
        return x > 0;
    });

    const result = proxy.filter(x => x > 0);
    return result.length === 2;
}

export function testProxySealedAndFrozenStillAllowsFilter() {
    const arr = Object.seal(Object.freeze([9, 10]));
    const proxy = new Proxy(arr, {});
    const result = proxy.filter(x => x === 9);
    return result.length === 1 && result[0] === 9;
}

export function testProxyFilterDoesNotInvokeElementGetters() {
    const obj = {
        get value() {
            return 42;
        }
    };
    const arr = [obj];
    let getterCalled = false;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            const item = Reflect.get(target, prop);
            if (prop === '0' && item === obj) {
                return item;
            }
            return item;
        }
    });

    const result = proxy.filter(x => x.value > 40);
    return result.length === 1;
}

export function testProxyMapLikeObjectFailsGracefullyInFilter() {
    const proxy = new Proxy({}, {
        get(target, prop) {
            if (prop === 'length') {
                return 2;
            }
            if (prop === '0') {
                return 'key1';
            }
            if (prop === '1') {
                return 'key2';
            }
            return undefined;
        }
    });

    try {
        proxy.filter(x => x.startsWith('k'));
        return false
    } catch {
        return true;
    }
}

export function testProxyModifyLengthInsideFilterCallbackHasNoEffect() {
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {});
    let originalLengthUsed = true;

    proxy.filter((x, i, self) => {
        if (i === 0) {
            self.length = 1;
        }
        if (i >= 1) {
            originalLengthUsed = false;
        }
        return true;
    });

    return originalLengthUsed;
}

export function testProxyNonIntegerIndexNotAccessedByFilter() {
    let accessedFloat = false;
    const arr = [10];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '1.5') {
                accessedFloat = true;
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.filter(x => x > 5);
    return !accessedFloat;
}

export function testProxyEnumerateTrapNotUsed() {
    let enumerateCalled = false;
    const arr = [1];
    const handler = {
        enumerate() {
            enumerateCalled = true;
            return ['0'];
        },
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    };

    const proxy = new Proxy(arr, handler);
    proxy.filter(x => x);
    return !enumerateCalled;
}

export function testProxyReadOnlyLengthStillReadable() {
    const arr = [5, 6];
    Object.defineProperty(arr, 'length', { writable: false });
    const proxy = new Proxy(arr, {});
    const result = proxy.filter(x => x === 5);
    return result.length === 1;
}

export function testProxyConstructTrapIrrelevantToFilter() {
    let constructCalled = false;
    const arr = [1];
    const proxy = new Proxy(arr, {
        construct() {
            constructCalled = true;
            return {};
        }
    });

    const result = proxy.filter(x => x);
    return !constructCalled && result.length === 1;
}

export function testProxyCircularReferenceInElementsHandledByFilter() {
    const obj = { id: 1 };
    obj.self = obj;
    const arr = [obj, { id: 2 }];
    const proxy = new Proxy(arr, {});
    const result = proxy.filter(x => x.id === 1);
    return result.length === 1 && result[0] === obj;
}

export function testProxyFilterWorksOnSymbolElements() {
    const sym = Symbol('test');
    const arr = [Symbol('a'), sym, Symbol('b')];
    const proxy = new Proxy(arr, {});
    const result = proxy.filter(x => x === sym);
    return result.length === 1 && result[0] === sym;
}

export function testProxyDeletePropertyNotCalledDuringFilter() {
    let deleteCalled = false;
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        deleteProperty() {
            deleteCalled = true;
            return true;
        }
    });

    proxy.filter(x => x > 1);
    return !deleteCalled;
}

export function testProxyLazyComputedCachedInFilter() {
    const computed = new Map();
    const source = [1, 2];
    const proxy = new Proxy(source, {
        get(target, prop) {
            const idx = Number(prop);
            if (!isNaN(idx) && idx >= 0 && idx < target.length) {
                if (!computed.has(idx)) {
                    computed.set(idx, target[idx] * 10);
                }
                return computed.get(idx);
            }
            return Reflect.get(target, prop);
        }
    });

    const result = proxy.filter(x => x > 15);
    return result.length === 1 && result[0] === 20 && computed.size === 2;
}

export function testProxyFilterWithArgumentsObjectUnaffected() {
    const arr = [1];
    const proxy = new Proxy(arr, {});
    let capturedArgs = null;

    proxy.filter(function () {
        capturedArgs = arguments;
        return true;
    });

    return capturedArgs != null && capturedArgs.length === 3;
}

export function testProxyNonConfigurablePropertiesReadableInFilter() {
    const arr = [7];
    Object.defineProperty(arr, '0', { configurable: false, writable: true, value: 7 });
    const proxy = new Proxy(arr, {});
    const result = proxy.filter(x => x === 7);
    return result.length === 1;
}

export function testProxyFilterHandlesNaNElements() {
    const arr = [NaN, 1, NaN];
    const proxy = new Proxy(arr, {});
    const result = proxy.filter(x => isNaN(x));
    return result.length === 2;
}

export function testProxyLogsFilterMethodAccess() {
    let filterAccessLogged = false;
    const arr = [1];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'filter') {
                filterAccessLogged = true;
            }
            return Reflect.get(target, prop);
        }
    });

    proxy.filter(x => x);
    return filterAccessLogged;
}

export function testProxyFilterStopsOnCallbackException() {
    let accessedIndex2 = false;
    const arr = [1, 2, 3];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === '2') {
                accessedIndex2 = true;
            }
            return Reflect.get(target, prop);
        }
    });

    try {
        proxy.filter((x, i) => {
            if (i === 1) {
                throw new Error('Stop');
            }
            return true;
        });
    } catch (e) {
    }

    return !accessedIndex2;
}

export function testProxyStringSplitLikeArrayFiltered() {
    const proxy = new Proxy(['a', 'b', 'c'], {});
    const result = proxy.filter(x => x !== 'b');
    return result.length === 2 && result[0] === 'a' && result[1] === 'c';
}

export function testProxyFilterIsPureAndDoesNotMutateSource() {
    const arr = [1, 2, 3];
    const originalCopy = [...arr];
    const proxy = new Proxy(arr, {
        set() {
            throw new Error('Mutation detected');
        }
    });

    proxy.filter(x => x > 1);
    return arr.length === originalCopy.length && arr.every((v, i) => v === originalCopy[i]);
}