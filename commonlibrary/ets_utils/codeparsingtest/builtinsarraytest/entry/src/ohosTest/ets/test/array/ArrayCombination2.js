/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
'use strict'

export function ArrayConstructor2Test010() {
    const arr = [];
    const suffix = [1];
    const typedArr = new Int32Array([]);
    const typedSuffix = new Int32Array([1]);
    const typedConcat = Int32Array.from([...typedArr, ...typedSuffix]);
    return [arr.concat(suffix).includes(1), typedConcat.includes(1)]
}

export function ArrayConstructor2Test030() {
    const arr = Array(100).fill(0);
    arr[99] = 42;
    const typedArr = new Int32Array(100);
    typedArr.fill(0);
    typedArr[99] = 42;
    return [arr.slice(90).indexOf(42), typedArr.slice(90).indexOf(42)]
}

export function ArrayConstructor2Test040() {
    const sym = Symbol('test');
    const arr = [1, sym];
    const suffix = [2];
    const typedArr = new Int32Array([1, 2]);
    return [arr.concat(suffix).includes(sym), typedArr.includes(1)]
}

export function ArrayConstructor2Test045() {
    const obj = { id: 1 };
    const arr = [[obj]];
    const typedArr = new Int32Array([1]);
    return [arr.flat().includes(obj), typedArr.includes(1)]
}

export function ArrayConstructor2Test047() {
    const arr = new Array(5).fill(0);
    const typedArr = new Int32Array(5);
    return [arr.slice(2, 4).includes(0), typedArr.slice(2, 4).includes(0)]
}

export function ArrayConstructor2Test048() {
    const arr = [[], [[]], []];
    const typedArr = new Int32Array([]);
    const arr2 = [[1], [], [2]];
    const typedArr2 = new Int32Array([1, 2]);
    return [arr.flat().indexOf(undefined), arr.flat().length, arr2.flat().indexOf(2), typedArr2.indexOf(2)]
}

export function ArrayConstructor2Test066() {
    const arr = [[], [], []];
    const typedArr = new Int32Array([]);
    return [arr.flat().indexOf(undefined), arr.flat().length, typedArr.length, arr.flat().length]
}

export function ArrayConstructor2Test076() {
    const arr = new Array(3);
    arr[0] = 1;
    arr[2] = 3;
    const suffix = [4];
    const typedArr = new Int32Array([1, 0, 3]);
    const typedSuffix = new Int32Array([4]);
    const typedConcat = Int32Array.from([...typedArr, ...typedSuffix]);
    return [arr.concat(suffix).includes(undefined), typedConcat.includes(0)]
}

export function ArrayConstructor2Test082() {
    const arr = [];
    const a1 = [];
    const a2 = [];
    const typedArr = new Int32Array([]);
    const t1 = new Int32Array([]);
    const t2 = new Int32Array([]);
    const typedConcat = Int32Array.from([...typedArr, ...t1, ...t2]);
    return [arr.concat(a1, a2).includes(1), typedConcat.includes(1)]
}

export function ArrayConstructor2Test108() {
    const wrapped = Object(-0);
    const arr = [[wrapped]];
    const typedArr = new Float64Array([-0]);
    return [arr.flat().indexOf(wrapped), typedArr.indexOf(-0)]
}

export function ArrayConstructor2Test116() {
    const arr = [];
    const typedArr = new Int32Array([]);
    return [arr.slice().indexOf(1), typedArr.slice().indexOf(1)]
}

export function ArrayConstructor2Test130() {
    const sym = Symbol('test');
    const arr = [sym];
    const typedArr = new Int8Array([1]);
    return [arr.includes(sym), typedArr.includes(1)]
}

export function ArrayConstructor2Test131() {
    const arr = ["5"];
    const typedArr = new Int32Array([5]);
    return [arr.indexOf(5), typedArr.indexOf(5)]
}

export function ArrayConstructor2Test134() {
    let accessed = false;
    const proxy = new Proxy([42], {
        get(target, prop) {
            if (prop === '0') {
                accessed = true;
            }
            return target[prop];
        }
    });
    const arr = [proxy];
    const typedArr = new Int32Array([42]);
    return [arr.flat().includes(42), accessed, typedArr.includes(42) ]
}

export function ArrayConstructor2Test137() {
    const arr = [[1]];
    const typedArr = new Int32Array([1]);
    return [arr.flat(-1).includes([1]), typedArr.includes(1)]
}

export function ArrayConstructor2Test140() {
    const sparse = new Array(2);
    sparse[1] = 5;
    const suffix = [6];
    const result = sparse.concat(suffix);
    const typedSparse = new Int32Array(2);
    typedSparse[1] = 5;
    const typedSuffix = new Int32Array([6]);
    const typedResult = Int32Array.from([...typedSparse, ...typedSuffix]);
    return [result[0] === undefined, result.includes(undefined), typedResult[0] === 0, typedResult.includes(0)]
}

export function ArrayConstructor2Test143() {
    const arr = [1];
    arr.includes = () => false;
    const result = [1].concat([2]);
    const typedArr = new Int32Array([1, 2]);
    return [result.includes(2), typedArr.includes(2)]
}

export function ArrayConstructor2Test151() {
    const sym1 = Symbol('id');
    const sym2 = Symbol('id');
    const arr = [sym1, sym2];
    const typedArr = new Int32Array([100, 200]);
    return [arr.concat([]).lastIndexOf(sym1), arr.concat([]).lastIndexOf(sym2), typedArr.lastIndexOf(100)]
}

export function ArrayConstructor2Test152() {
    const arr = [10, 20, 30];
    const typedArr = new Int32Array([10, 20, 30]);
    return [arr.slice("2").indexOf(30), typedArr.slice("2").indexOf(30)]
}

export function ArrayConstructor2Test153() {
    const sparseNested = [[]];
    sparseNested[0][100] = 5;
    const flatResult = sparseNested.flat();
    const typedSim = new Int32Array(101);
    typedSim[100] = 5;
    return [flatResult.includes(undefined), flatResult.includes(5), typedSim.includes(0), typedSim.includes(5)]
}
